class ExpensesController < ApplicationController
  respond_to :json, except: [:index]
  
  def index
    @title = "Mis Gastos"
    @tab = :expenses
    @expenses = Expense.all
    @categories= Category.all
    @types = TransactionType.all
  end
  def show
    @expense = Expense.find(params[:id])    
  end
end
