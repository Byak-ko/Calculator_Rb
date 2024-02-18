class Operation
    include ActiveModel::Model
  
    attr_accessor :expression, :result
  
    validate :valid_expression?
  
    def message
      @expression.present? ? @expression : ""
    end
  
  
 #   def valid_expression?
 #     return if expression.blank?
 # 
 #     unless /\A\d+(\s*[\+\-\*]\s*\d+)*\z/.match?(expression)
 #       errors.add(:expression, "is not a valid expression")
 #     end
 #   end
 #   
 #   def calculate!
 #       operands, operators = parse_expression
 #       self.result = operands.first.to_i
 #   
 #       operators.each_with_index do |operator, index|
 #         operand = operands[index + 1].to_i
 #         case operator
 #         when "+"
 #           self.result += operand
 #         when "-"
 #         end
 #       end
 #     end
#
 #   def parse_expression
 #     operands = expression.scan(/\d+/)
 #     operators = expression.scan(/[\+\-\*]/)
 #     [operands, operators]
 #   end

  

  end
  