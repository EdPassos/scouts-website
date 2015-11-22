# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ShopOrderStatus.delete_all
ShopOrderStatus.create! id: 1, name:"Espera Pagamento", description: "Espera de envio de comprovativo de pagamento"
ShopOrderStatus.create! id: 2, name:"Espera Verificação", description: "Comprovativo será verificado"
ShopOrderStatus.create! id: 3, name:"Pagamento Efectuado", description: "Pagamento foi verificado. A encomenda está a ser preparada"
ShopOrderStatus.create! id: 4, name:"Espera Levantamento", description: "A Encomenda encontra-se na secretaria do agrupamento à espera de ser levantada"
ShopOrderStatus.create! id: 5, name:"Concluida", description: "Compra concluida e entregue"
