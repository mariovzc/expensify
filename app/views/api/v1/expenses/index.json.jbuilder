json.array! @expenses do |expense|
  json.(expense, :id, :concept, :date, :amount)
  json.transaction_type expense.transaction_type, :id, :name
  json.category expense.category, :id, :name

end