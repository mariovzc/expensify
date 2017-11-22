class Api::V1::ExpensesController < ApplicationController
  before_action :set_expense, only: [ :update, :destroy]
  
  def index
    @expenses = Expense.all    
  end
  def create
    @expense = Expense.new(expenses_params)
    if @expense.save
      render json: @expense, status: 201
    else
      render json: @expense.errors, status: 422      
    end
  end
  def update
    if @expense.update(expenses_params)
      render json: @expense, status: 200      
    else
      render json: @expense.errors, status: 422      
    end
  end
  def destroy
    @expense.destroy
    head :no_content, status: 204
  end
  private
  def set_expense
    @expense = Expense.find(params[:id])
  end
  def expenses_params
    params.permit(:concept, :date, :amount, :category_id, :transaction_type_id)
  end

end  