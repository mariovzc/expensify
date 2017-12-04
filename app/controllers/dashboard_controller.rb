class DashboardController < ApplicationController
  respond_to :json, except: [:index]  
  def index
    @title = 'Dashboard'
    @tab = :dashboard
  end

  # Por categoría, el mes actual
  def by_category
    categories = Category.all
    @categories = []
    colors = ["#3F51B5", "#673AB7", "#2196F3", "8BC34A", "4CAF50", "CDDC39", "FF9800"]
    categories.each_with_index do |category, index|
      @categories.push({
        label: category.name,
        value: category.expenses.from_this_month.count,
        color: colors[index]
      })
    end
  end
end
