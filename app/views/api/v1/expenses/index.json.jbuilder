current_page = params[:page].present? ? params[:page] : 1

json.expenses @expenses do |expense|
  json.(expense, :id, :concept, :amount)
  json.date expense.date.to_formatted_s(:short)
  json.transaction_type expense.transaction_type, :id, :name
  json.category expense.category, :id, :name
end
json.current_page current_page.to_i
json.last_page @expenses.total_pages
json.next_page_url current_page.to_i == @expenses.total_pages ? nil : url_for(only_path: false) + "?page=#{current_page.to_i + 1}"
json.prev_page_url current_page.to_i == 1 ? nil : url_for(only_path: false) + "?page=#{current_page.to_i - 1}"