class DashboardController < ApplicationController
  include DashboardHelper  
  respond_to :json, except: [:index]  
  def index
    @title = 'Dashboard'
    @tab = :dashboard
  end

  # Por categoría, el mes actual
  def by_category
    categories = Category.all
    @categories = []
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
  def last_6_months
    types = TransactionType.all
    datasets = []
    types.each_with_index do |type, index|
      data = []
      last_months_values.each do |value|
        data.push(type.expenses.with_month(value).sum(:amount))
      end
      datasets.push({
        label: type.name,
        backgroundColor: colors[index],
        data: data
      })
    end
    @data = {
      labels: last_months,
      datasets: datasets
    }
  end

  def colors
    ["#3F51B5", "#673AB7", "#2196F3", "#8BC34A", "#4CAF50", "#CDDC39", "#FF9800"]    
  end
  
end
