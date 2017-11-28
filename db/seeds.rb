def create_list(arr, model)
  arr.each do |name|
    model.create(name: name)
  end
end
c = ['Restaurantes',
'Tiendas', 
'Vehiculo', 
'Hogar', 
'Servicios', 
'Educación', 
'Diversión'
]
p 'Iniciando Seed'

p 'Categorias'
create_list(c, Category)
p ' Fin Categorias'

t = ['Compras',
'Pagos',
'Transferencias',
'Retiros']

p 'Transacciones'
create_list(t, TransactionType)
p ' Fin Transacciones'


p 'Iniciando Gastos'
600.times do |expense|
  Expense.create(
    concept: Faker::Lorem.sentence(3, true, 4),
    date: Faker::Date.between(6.months.ago, Date.today.end_of_month),
    amount: Faker::Commerce.price * 1000,
    transaction_type_id: Faker::Number.between(1,4),
    category_id: Faker::Number.between(1,7)
  )
end

p ' Fin de gastos'