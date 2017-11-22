class ExpensesController < ApplicationController
  respond_to :json, except: [:index]
  
  def index
    @title = "Mis Gastos"
    @tab = :expenses
    @expenses = Expense.all
  end
  def show
  end
  def create
    @expense = Expense.new(expenses_params)
    if @expense.save
      render json: @expense, status: :created
    else
      render json: @expense.errors, status: :unprocessable_entity      
    end
  end

  def update
  end

  def destroy
  end

  private
  def set_expense
    @expense = Expense.find(params[:id])
  end
  def expenses_params
    params.require(:expense).permit(:concept, :date, :amount, :category_id, :transaction_type_id)
  end
end
