module DashboardHelper

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
end
