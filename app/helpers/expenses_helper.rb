module ExpensesHelper
  def last_12_months
    months = []
    
    (0..11).each do |i|      
      time = Time.now - i.month
      months.push({ name: time.strftime("%B %Y"), value: time })
    end
    months
  end
end
