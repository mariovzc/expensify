json.array! @expenses do |expense|
  json.(expense, :id, :concept, :amount)
  json.date expense.date.to_formatted_s(:short)
  json.transaction_type expense.transaction_type, :id, :name
  json.category expense.category, :id, :name

end