class Operation
  include ActiveModel::Model

  attr_accessor(:operand_one, :operand_two, :operation, :result)

  validates :operand_one, presence: true
  validates :operand_two, presence: true
  validates :operation, presence: true
  validates :operation, inclusion: {
    in: %w(+ - *),
    message: "%{value} is not a valid operation"
  }


  def self.build(*args)
    first, op, second = args.flatten.map(&:chomp).reject(&:blank?).take(3)
    new(operand_one: first&.to_i, operand_two: second&.to_i, operation: op)
  end

=begin
  def self.build(args)
    operand_one = ""
    operation = ""
    operand_two = ""
  
    args.each_with_index do |arg, index|
      if arg.match?(/\d/) && operation.empty?
        operand_one << arg
      elsif arg.match?(/[\+\-\*\/]/) && operand_one.empty?
        operand_one = arg
      elsif arg.match?(/[\+\-\*\/]/) && !operand_one.empty?
        operation = arg
      elsif arg == "="
        operand_two = args[(index + 1)..-1].join
      end
    end
    new(operand_one: operand_one.to_i, operand_two: operand_two.to_i, operation: operation)
  end
=end

  def calculate!
    __send__(operation.to_s)
  end

  def message
    @operand_one ? "#{@operand_one} #{@operation} #{@operand_two}" : ""
  end

  private

    def +
      @result = operand_one + operand_two
      reset
    end

    def -
      @result = operand_one - operand_two
      reset
    end

    def *
      @result = operand_one * operand_two
      reset
    end

    def reset
      @operand_one = nil
      @operand_two = nil
      @operation = nil
    end
end