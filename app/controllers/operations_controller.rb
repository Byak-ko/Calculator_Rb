class OperationsController < ApplicationController
  def new
    @operation = Operation.new
  end
#  def create
#    @operation = Operation.new(operation_params)
#
#    if @operation.valid?
#      @operation.calculate!
#      render :new, status: :ok
#    else
#      render :new, status: :unprocessable_entity
#    end
#  end
#
#  private
#
#  def operation_params
#    params.require(:operation).permit(:expression)
#  end
end
