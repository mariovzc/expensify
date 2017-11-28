class ExpensesController < ApplicationController
  respond_to :json, except: [:index]
  
  def index
    @title = "Mis Gastos"
    @tab = :expenses
    @expenses = Expense.with_transaction_type_id(params[:transaction_type_id]).with_category_id(params[:category_id])
    @categories= Category.all
    @types = TransactionType.all
  end
  def show
    @expense = Expense.find(params[:id])    
  end
end
