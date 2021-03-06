class DashboardController < ApplicationController
  include DashboardHelper  
  respond_to :json, except: [:index]  
  def index
    @title = 'Dashboard'
    @tab = :dashboard
    @date = Time.now
  end

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

  def by_type_monthly

    month = Time.now.month
    year = Time.now.year
    days = Time.days_in_month(month, year)

    datasets = []
    types = TransactionType.all
    types.each_with_index do |type, index|
      values = []
      days.times do  |i|
        values.push(type.expenses.with_month(month).with_year(year).with_day(i+1).sum(&:amount))
      end
      datasets.push({
        label: type.name,
        backgroundColor: colors[index],
        data: values
      })
    end
    @data = {
      labels: days_in_a_month(days),
      datasets: datasets
    }
  end

  def accumulated_monthly
    numbers = 
    [
      0, # current_month
      -1 # last_month
    ]
    datasets = []
    max = 0
    numbers.each_with_index do |n, index|
      date = Time.now + (n.month)
      days = Time.days_in_month(date.month, date.year)
      max = days > max ? days : max
      datasets.push(
        {
          backgroundColor: colors[index],
          data: days_expenses(days, date.month, date.year),
          label: I18n.l(date, format: '%B  %Y'),
          fill: 'start'
        }
      )
    end

    @data = {
      labels: days_in_a_month(max),
      datasets: datasets
    }
  end

  private

  def days_in_a_month(days)
    arr =[]
    days.times do |i|
      arr.push(i+1)
    end
    arr
  end

  def days_expenses(days, month, year)
    values = []
    accumulated = 0    
    days.times do |i|
      accumulated += Expense.with_month(month).with_year(year).with_day(i+1).sum(&:amount)
      values.push(accumulated)
    end
    values
  end

  def colors
    ["#3F51B5", "#673AB7", "#2196F3", "#8BC34A", "#4CAF50", "#CDDC39", "#FF9800"]    
  end  
end
