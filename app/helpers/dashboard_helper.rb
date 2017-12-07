module DashboardHelper

  def expense_today
    getExpense(@date.day, @date.month, @date.year)
  end
  def expense_yesterday
    getExpense(@date.yesterday.day, @date.month, @date.year)
  end
  def expense_current_month
    getExpense(nil, @date.month, @date.year)
    
  end
  def expense_last_month
    @date = @date - 1.month
    getExpense(nil, @date.month, @date.year)
  end

  def last_months
    months = []    
    (0..5).each do |i|      
      time = Time.now - i.month
      months.push(I18n.l(time, format: '%B').to_s.capitalize! )
    end
    months
  end
  def last_months_values
    months = []    
    (0..5).each do |i|      
      time = Time.now - i.month
      months.push((time.month).to_i )
    end
    months
  end
  private
  def getExpense(day, month, year)
    Expense.with_month(month).with_year(year).with_day(day).sum(&:amount)
  end
end
