json.expenses @expenses do |expense|
  json.(expense, :id, :concept, :amount)
  json.date expense.date.to_formatted_s(:short)
  json.transaction_type expense.transaction_type, :id, :name
  json.category expense.category, :id, :name
end
json.current_page @current_page.to_i
json.last_page @expenses.total_pages
json.next_page_url next_page(@current_page, @expenses.total_pages)
json.prev_page_url prev_page(@current_page)