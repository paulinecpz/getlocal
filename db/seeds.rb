# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts("deleting stores")
ProductOrder.destroy_all
Order.destroy_all
User.destroy_all
Store.destroy_all
Product.destroy_all
Category.destroy_all
p "DB clean"
# Review.destroy_all

# Order.destroy_all
User.destroy_all
Picture.destroy_all
Category.destroy_all



# users= [user1, user2, user3, user4]
puts("creating stores and users")

1.times do
    User.create!(
      email: "admin@lewagon.com",
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      password: "password",
      photo: Faker::Avatar.image(slug: "my-own-slug", bgset: "bg1")
      )
  end


  pictures_array = []
  pictures_array << "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028163/ruiwryayaxzmkd9fndc0.jpg"
  pictures_array << "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028698/op7lrznw0sdtdmwaqkdz.jpg"
  pictures_array << "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028687/yuamzsw02c6umn3fujii.jpg"
  pictures_array << "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028650/tidoe3jbjzdcolvir7du.jpg"
  pictures_array << "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028644/yrkmcewm9wot4czkcz5c.jpg"
  pictures_array << "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028163/ruiwryayaxzmkd9fndc0.jpg"
  pictures_array << "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028638/tj7yoprkuabwo4n1zox1.jpg"
  pictures_array << "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028634/x5mcffwqpduiglfs8s6a.jpg"
  pictures_array << "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028585/gjfm2sxwxailqklqrdbl.jpg"
  pictures_array << "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028535/cjtc7wghezmbvxfumhnt.jpg"
  pictures_array << "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028530/imy4dsb3sqdfjxlr0ea5.jpg"
  pictures_array << "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028525/dwt2wedhzz8247exgdxy.jpg"
  pictures_array << "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028520/ptexbfup5ntptalrkpho.jpg"
  pictures_array << "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028510/cnni67g1gpwujxjva0dt.jpg"
  pictures_array << "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028504/m6rbso7pmeqh0wjoebza.jpg"
  pictures_array << "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028491/y4pl5qdidsvb2kno8k6n.jpg"
  pictures_array << "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028481/qkdik4vpfm9td8bgdly3.jpg"
  pictures_array << "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028476/plloxt6ryeimtibkz89q.jpg"
  pictures_array << "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028469/db1v1hswheo26nnyclg6.jpg"
  pictures_array << "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028462/q6qcenkly9c9bvitzgam.jpg"
  pictures_array << "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028343/prxo1fh61fu7dxslsj7q.jpg"
  pictures_array << "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028338/w5wcteurtmxfc6u00tmt.jpg"
  pictures_array << "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028327/fzjl0igfmqtaybitdsjl.jpg"
  pictures_array << "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028163/ruiwryayaxzmkd9fndc0.jpg"
  pictures_array << "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028698/op7lrznw0sdtdmwaqkdz.jpg"
  pictures_array << "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028687/yuamzsw02c6umn3fujii.jpg"
  pictures_array << "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028650/tidoe3jbjzdcolvir7du.jpg"
  pictures_array << "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028644/yrkmcewm9wot4czkcz5c.jpg"
  pictures_array << "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028163/ruiwryayaxzmkd9fndc0.jpg"
  pictures_array << "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028638/tj7yoprkuabwo4n1zox1.jpg"
  pictures_array << "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028634/x5mcffwqpduiglfs8s6a.jpg"
  pictures_array << "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028585/gjfm2sxwxailqklqrdbl.jpg"
  pictures_array << "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028535/cjtc7wghezmbvxfumhnt.jpg"
  pictures_array << "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028530/imy4dsb3sqdfjxlr0ea5.jpg"
  pictures_array << "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028525/dwt2wedhzz8247exgdxy.jpg"
  pictures_array << "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028520/ptexbfup5ntptalrkpho.jpg"
  pictures_array << "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028510/cnni67g1gpwujxjva0dt.jpg"
  pictures_array << "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028504/m6rbso7pmeqh0wjoebza.jpg"
  pictures_array << "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028491/y4pl5qdidsvb2kno8k6n.jpg"
  pictures_array << "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028481/qkdik4vpfm9td8bgdly3.jpg"
  pictures_array << "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028476/plloxt6ryeimtibkz89q.jpg"
  pictures_array << "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028469/db1v1hswheo26nnyclg6.jpg"
  pictures_array << "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028462/q6qcenkly9c9bvitzgam.jpg"
  pictures_array << "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028343/prxo1fh61fu7dxslsj7q.jpg"
  pictures_array << "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028338/w5wcteurtmxfc6u00tmt.jpg"
  pictures_array << "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028327/fzjl0igfmqtaybitdsjl.jpg"




  # pictures_array.each do | picture |
  #   store = Store.create!(name: Faker::Company.name,
  #     address: Faker::Address.full_address,
  #     description: Faker::Restaurant.description,
  #     website: Faker::Internet.url,
  #     phone: Faker::PhoneNumber.phone_number_with_country_code,
  #     # picture: pictures.sample,
  #     longitude: Faker::Address.longitude,
  #     latitude: Faker::Address.latitude,
  #     user: User.all.sample
  #     )
  #   Picture.create(remote_photo_url: picture, store: store)

  # end


 # London

store =Store.create(name: "Finer Foods", address:"Lambeth, London SE1 7PB", description:"We only sell fresh products with great quality, at affordable prices. All our products come from the local producers in the region", website:"www.Finer-Foods.com", phone:"+44 18 7153 1234", user:User.all.sample)
# rand(1..5).times do 
  Picture.create(remote_photo_url: pictures_array.sample, store: store)
# end
store =Store.create(name: "Goodness Grocery", address: "51 Shaftesbury Ave, Soho, London W1D 6BA", description:Faker::Restaurant.description, website:"www.Goodness-Grocery.com", phone:"+44 20 4123 7392", user:User.all.sample)
# rand(1..5).times do 
  Picture.create(remote_photo_url: pictures_array.sample, store: store)
# end
store =Store.create(name: "Fast And Fresh", address: "Belvedere Rd, Lambeth, London SE1 8XX", description:Faker::Restaurant.description, website: "www.fastNfresh.com", phone:"+44 22 0284 1473", user:User.all.sample)
# rand(1..5).times do 
  Picture.create(remote_photo_url: pictures_array.sample, store: store)
# end
store =Store.create(name: "Family’S Own Grocery", address: "32 London Bridge St, London SE1 9SG", description:Faker::Restaurant.description, website: "www.OwnGrocery.com", phone:"+44 84 3658 0922", user:User.all.sample)
# rand(1..5).times do 
  Picture.create(remote_photo_url: pictures_array.sample, store: store)
# end
store =Store.create(name: "Proud Produce",address: "150 London Wall, Barbican, London EC2Y 5HN", description:Faker::Restaurant.description, website:"www.ProudProduce.com", phone:"+44 29 4453 9726",user:User.all.sample)
# rand(1..5).times do 
  Picture.create(remote_photo_url: pictures_array.sample, store: store)
# end

 # Paris

store =Store.create(name: "Nos producteurs", address:"97 Place de la Madeleine, 75008 Paris", description:Faker::Restaurant.description, website:"www.nos-producteurs.com", phone:"+33 34 45 53 12 34", user:User.all.sample)
# rand(1..5).times do 
  Picture.create(remote_photo_url: pictures_array.sample, store: store)
# end
store =Store.create(name: "Marché aux Fruits", address: "90 rue La Boétie, 75008 Paris", description:Faker::Restaurant.description, website:"www.Marché-aux-Fruits.com", phone:"01 20 41 23 73 92", user:User.all.sample)
# rand(1..5).times do 
  Picture.create(remote_photo_url: pictures_array.sample, store: store)
# end
store =Store.create(name: "C'est Bio", address: "129 Rue de Grenelle, 75007 Paris", description:Faker::Restaurant.description, website: "www.cestbio.com", phone:"01 22 02 84 14 73", user:User.all.sample)
# rand(1..5).times do 
  Picture.create(remote_photo_url: pictures_array.sample, store: store)
# end
store =Store.create(name: "Epicerie Fine", address: "176 Rue Montmartre, 75002 Paris", description:Faker::Restaurant.description, website: "www.Epicerie-Fine.com", phone:"+33 84 36 58 09 22", user:User.all.sample)
# rand(1..5).times do 
  Picture.create(remote_photo_url: pictures_array.sample, store: store)
# end
store =Store.create(name: "Mes beaux légumes",address: "Place Georges-Pompidou, 75004 Paris", description:Faker::Restaurant.description, website:"www.mes-beaux-legumes.com", phone:"01 29 44 53 97 26", user:User.all.sample)
# rand(1..5).times do 
  Picture.create(remote_photo_url: pictures_array.sample, store: store)
# end

 # Lyon

store =Store.create(name: "La Main Verte", address:"221 Rue Garibaldi, 69003 Lyon", description:Faker::Restaurant.description, website:"www.nos-producteurs.fr", phone:"03 64 75 53 02 34", user:User.all.sample)
# rand(1..5).times do 
  Picture.create(remote_photo_url: pictures_array.sample, store: store)
# end
store =Store.create(name: "Le Coin Oragnic", address: "23 Rue Molière, 69006 Lyon", description:Faker::Restaurant.description, website:"www.Marché-aux-Fruits.fr", phone:"+33 60 41 53 74 02", user:User.all.sample)
# rand(1..5).times do 
  Picture.create(remote_photo_url: pictures_array.sample, store: store)
# end
store =Store.create(name: "Produits Frais", address: "107 Rue Boileau, 69006 Lyon", description:Faker::Restaurant.description, website: "www.cestbio.fr", phone:"03 22 02 84 14 73", user:User.all.sample)
# rand(1..5).times do 
  Picture.create(remote_photo_url: pictures_array.sample, store: store)
# end
store =Store.create(name: "Bouchon Lyonnais", address: "5 Place d'Arsonval, 69003 Lyon", description:Faker::Restaurant.description, website: "www.Epicerie-Fine.fr", phone:"+33 94 36 38 09 22", user:User.all.sample)
# rand(1..5).times do 
  Picture.create(remote_photo_url: pictures_array.sample, store: store)
# end
store =Store.create(name: "Le Marché Local", address: "5 Rue Bonnefoi, 69003 Lyon", description:Faker::Restaurant.description, website:"www.mes-beaux-legumes.fr", phone:"03 29 24 53 92 36", user:User.all.sample)
# rand(1..5).times do 
  Picture.create(remote_photo_url: pictures_array.sample, store: store)
# end

 # Barcelona

store = Store.create(name: "Supermercado Fino", address:"Gran Via de les Corts Catalanes, 749, Barcelona", description:Faker::Restaurant.description, website:"www.SupermercadoFino.es", phone:"+34 54 75 43 02 88", user:User.all.sample)
# rand(1..5).times do 
  Picture.create(remote_photo_url: pictures_array.sample, store: store)
# end
store =Store.create(name: "El comida Stores", address: "Passeig de Sant Joan, 108, Barcelona", description:Faker::Restaurant.description, website:"www.comida-stores.es", phone:"+34 88 41 53 35 02", user:User.all.sample)
# rand(1..5).times do 
  Picture.create(remote_photo_url: pictures_array.sample, store: store)
# end
store =Store.create(name: "Food Plaza", address: "Carrer de Mallorca, 401, Barcelona", description:Faker::Restaurant.description, website: "www.FoodPlaza.es", phone:"+34 57 63 84 75 04", user:User.all.sample)
# rand(1..5).times do 
  Picture.create(remote_photo_url: pictures_array.sample, store: store)
# end
store =Store.create(name: "Mis verduras", address: "Carrer Nou de la Rambla, 3-5, Barcelona", description:Faker::Restaurant.description, website: "www.mis-verduras.es", phone:"+34 94 96 38 09 13", user:User.all.sample)
# rand(1..5).times do 
  Picture.create(remote_photo_url: pictures_array.sample, store: store)
# end
store =Store.create(name: "El Mercado",address: "Plaça d'Espanya, Barcelona", description:Faker::Restaurant.description, website:"www.el-mercado.es", phone:"+34 29 00 53 53 22", user:User.all.sample)
# rand(1..5).times do 
  Picture.create(remote_photo_url: pictures_array.sample, store: store)
# end





Store.create(name: "Canela e Maça", address: "191 R. de Santo Ildefonso, Porto", description:Faker::Restaurant.description, website: "www.canela&maça.pt", phone:"+351 221 245 149", longitude: 41.146525, latitude: -8.603935, user:User.all.sample, remote_photo_url: pictures_array.sample)
Store.create(name: "Portus Sabor", address: "Av. dos Aliados 166, Porto", description:Faker::Restaurant.description, website: "www.portusabor.pt", phone:"+351 221 478 198", longitude: 41.148435, latitude: -8.610531, user:User.all.sample, remote_photo_url: pictures_array.sample)
Store.create(name: "Frutaria do Bairro", address: "R. Formosa 300, Porto", description:Faker::Restaurant.description, website: "www.frutariadobairro.pt", phone:"+351 221 235 872", longitude: 41.148507, latitude: -8.606743, user:User.all.sample, remote_photo_url: pictures_array.sample)
Store.create(name: "Mercado da Ribeira", address: "R. de Cima do Muro 42, Porto", description:Faker::Restaurant.description, website: "www.mercadoribeiro.pt", phone:"+351 221 456 343", longitude: 41.140650, latitude: -8.611787, user:User.all.sample, remote_photo_url: pictures_array.sample)
Store.create(name: "Mercearia do Amial", address: "R. do Amial 926, Porto", description:Faker::Restaurant.description, website: "www.frutadoamial.pt", phone:"+351 221 785 772", longitude: 41.181012, latitude: -8.613582, user:User.all.sample, remote_photo_url: pictures_array.sample)


stores_names = ["Fresh Mart", "Natural Foods" ,"Meat & More","El Comida Stores","Elgin’s Pantry","The Perfect Pantry","George’s Convenience","Quick Corner Mart","Bill’s Bakery & Grocery","The Food Plaza","Fred’s Family Mart","The Grocery Gals","Au Natural Foods","Vinny’s Value Foods","Epic Groceries","The Grocery Green","The Potato Patch","Organic Aisles","All Organic","Awesome Organics","Fresh Mart","Food Selectors","The Jolly Belly","Ocean Market","The Fresh Apron","Nana’s Provisions","Rise & Shine","Earth’s Favour","Flavours of the World","Ethnic Kitchen","The Banana Box","Lucky Grocers","Green Eaters","Gil’s Grocerama","The Potato Bin","Nice Neighbors","Friendly Fare","Brass Tack Foods","Extra Victuals"]
# 40.times do
#     Picture.create!(
#       photo: pictures.sample,
#       store_id: store_ids.sample
#       )
#   end



puts("create categories")

Category.create(name: "Vegetables",url: 'https://images.unsplash.com/photo-1566385101042-1a0aa0c1268c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1789&q=80')
Category.create(name: "Fruits",url: 'https://images.unsplash.com/photo-1546209705-a7eba4e8da21?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1655&q=80')
Category.create(name: "Meat",url: 'https://images.unsplash.com/photo-1542901031-ec5eeb518e83?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80')
Category.create(name: "Fish",url: 'https://images.unsplash.com/photo-1534948216015-843149f72be3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80')
Category.create(name: "Other",url: 'https://images.unsplash.com/photo-1493925410384-84f842e616fb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=802&q=80')

puts("create products")


60.times do
  product_fruits = Product.create!(name: Faker::Food.fruits,
    price: rand(0..1),
    stock: rand(20..100),
    discount: rand(),
    store: Store.all.sample,
    category: Category.find_by_name("Fruits")
    )

  #   order = Order.create(state: "pending", amount: 2, user:User.all.sample)
  # ProductOrder.create(quantity: 2, user:User.all.sample, product: product_fruits.sample )
end

 
# Store.create(name: "Paulo Store", address:"Rua do Paulo", picture:"https://res.cloudinary.com/mathieufontaine/image/upload/v1575028327/fzjl0igfmqtaybitdsjl.jpg", state: "default", user_id: user.id)

60.times do
  product_veggie = Product.create!(name: Faker::Food.vegetables,
    price: rand(0..1),
    stock: rand(20..100),
    discount: rand(),
    store: Store.all.sample,
    category: Category.find_by_name("Vegetables")
    )

  #  order = Order.create(state: "pending", amount: 2, user:User.all.sample)
  # ProductOrder.create(quantity: 2, user:User.all.sample, product: product_veggie.sample )

end

40.times do
   product_fish = Product.create!(name: Faker::Food.sushi,
    price: rand(0..1),
    stock: rand(20..100),
    discount: rand(),
    store: Store.all.sample,
    category: Category.find_by_name("Fish")
    )

  #  order = Order.create(state: "pending", amount: 2, user:User.all.sample)
  # ProductOrder.create(quantity: 2, user:User.all.sample, product: product_fish.sample )
end

40.times do
   product_meat = Product.create!(name: Faker::Creature::Animal.name,
    price: rand(0..1),
    stock: rand(20..100),
    discount: rand(),
    store: Store.all.sample,
    category: Category.find_by_name("Meat")
    )

  #  order = Order.create(state: "pending", amount: 2, user:User.all.sample)
  # ProductOrder.create(quantity: 2, user:User.all.sample, product: product_meat.sample )
end

40.times do
   product_other = Product.create!(name: Faker::Food.spice,
    price: rand(0.5..2),
    stock: rand(20..100),
    discount: rand(),
    store: Store.all.sample,
    category: Category.find_by_name("Other")
    )

  #  order = Order.create(state: "pending", amount: 2, user:User.all.sample)
  # ProductOrder.create(quantity: 2, user:User.all.sample, product: product_other.sample )
end



User.create(first_name: "Paulo", last_name: "Lewagon", email:"paulo@paulo.com", password:"password", role: "admin")
User.create(first_name: "Pauline", last_name: "Lewagon", email:"pauline@pauline.com", password:"password", role: "admin")
User.create(first_name: "Mathieu", last_name: "Lewagon", email:"mathieu@mathieu.com", password:"password", role: "admin")
User.create(first_name: "Eduardo", last_name: "Lewagon", email:"edu@edu.com", password:"password", role: "admin")


puts("seed finished")

