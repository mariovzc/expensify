module ExpensesHelper

  def next_page(current_page, total_pages, params)
    str = "?"
    params.each_with_index do |(key, value), index|
      key == 'page' ? str+= "#{key}=#{(value.to_i + 1)}&" : str+= "#{key}=#{value}&"            
      str = str.gsub( /.{1}$/, '' )  
    end
    if !params[:page]
      str += "&page=#{current_page + 1}"
    end
    current_page.to_i == total_pages ? nil : url_for(only_path: false) +  str
  end
  
  def prev_page(current_page, params)
    str = "?"
    params.each_with_index do |(key, value), index|
      key == 'page' ? str+= "#{key}=#{(value.to_i - 1)}&" : str += "#{key}=#{value}&"            
      str = str.gsub( /.{1}$/, '' )  
    end

    if !params[:page]
      str += "&page=#{current_page - 1}"
    end
    
    current_page.to_i == 1 ? nil : url_for(only_path: false) + str
  end

  def expenses_total
    @total.sum(&:amount)
  end
  def expenses_average
    @total.count > 0 ? expenses_total / @expenses.count : 0
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
