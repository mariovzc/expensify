module ExpensesHelper

  def expenses_total
    count = 0
    @expenses.each do |ex|
      count += ex.amount
    end
    count
  end
  def expenses_average
    @expenses.count > 0 ? expenses_total / @expenses.count : 0
  end

  def last_12_months
    months = []    
    (0..11).each do |i|      
      time = Time.now - i.month
      months.push({ name: I18n.l(time, format: '%B  %Y') , value: time.strftime('%F')})
    end
    months
  end
end
