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