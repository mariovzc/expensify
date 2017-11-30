class ExpensesController < ApplicationController
  include ExpensesHelper
  respond_to :json, except: [:index]
  
  def index
    @title = "Mis Gastos"
    @tab = :expenses
    @expenses = Expense.with_transaction_type_id(params[:transaction_type_id]).with_category_id(params[:category_id]).with_month(params[:month]).with_year(params[:year]).paginate(:page => params[:page], :per_page => 10)
    @categories= Category.all
    @types = TransactionType.all
    @months = last_12_months
  end
  def show
    @expense = Expense.find(params[:id])    
  end
end
