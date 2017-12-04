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
    colors = ["#3F51B5", "#673AB7", "#2196F3", "#8BC34A", "#4CAF50", "#CDDC39", "#FF9800"]
    labels = []
    data = []
    bg = []
    categories.each_with_index do |category, index|
      labels.push(category.name)
      data.push(category.expenses.from_this_month.sum(:amount))
      bg.push(colors[index])
    end
    @categories = ({
      values: data,
      backgroundColors: bg,
      labels: labels
    })

  end
end
