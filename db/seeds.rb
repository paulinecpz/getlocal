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


User.create(first_name: "Paulo", last_name: "Lewagon", email:"paulo@paulo.com", password:"password", role: "admin")
User.create(first_name: "Pauline", last_name: "Lewagon", email:"pauline@pauline.com", password:"password", role: "admin")
User.create(first_name: "Mathieu", last_name: "Lewagon", email:"mathieu@mathieu.com", password:"password", role: "admin")
User.create(first_name: "Eduardo", last_name: "Lewagon", email:"edu@edu.com", password:"password", role: "admin")


# users= [user1, user2, user3, user4]
puts("creating stores and users")

15.times do
    User.create!(
      email: Faker::Internet.email,
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      password: "password",
      photo: Faker::Avatar.image(slug: "my-own-slug", bgset: "bg1")
      )
  end



  pictures = ["1.jpg","2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg", "7.jpg", "8.jpg", "9.jpg", "10.jpg", "11.jpg", "12.jpg", "13.jpg", "14.jpg", "15.jpg", "16.jpg", "17.jpg", "18.jpg", "19.jpg","20.jpg", "21.jpg", "22.jpg", "23.jpg", "24.jpg", "25.jpg" ]


  20.times do
    Store.create!(name: Faker::Company.name,
      address: Faker::Address.full_address,
      description: Faker::Restaurant.description,
      website: Faker::Internet.url,
      phone: Faker::PhoneNumber.phone_number_with_country_code,
      # picture: pictures.sample,
      longitude: Faker::Address.longitude,
      latitude: Faker::Address.latitude,
      user: User.all.sample
      )
  end
  store_ids =[]
  Store.all.each { |store| store_ids << store.id  }


# 40.times do
#     Picture.create!(
#       photo: pictures.sample,
#       store_id: store_ids.sample
#       )
#   end
Picture.create(remote_photo_url: "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028163/ruiwryayaxzmkd9fndc0.jpg", store: Store.all.sample)
Picture.create(remote_photo_url: "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028698/op7lrznw0sdtdmwaqkdz.jpg", store: Store.all.sample)
Picture.create(remote_photo_url: "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028687/yuamzsw02c6umn3fujii.jpg", store: Store.all.sample)
Picture.create(remote_photo_url: "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028650/tidoe3jbjzdcolvir7du.jpg", store: Store.all.sample)
Picture.create(remote_photo_url: "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028644/yrkmcewm9wot4czkcz5c.jpg", store: Store.all.sample)
Picture.create(remote_photo_url: "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028163/ruiwryayaxzmkd9fndc0.jpg", store: Store.all.sample)
Picture.create(remote_photo_url: "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028638/tj7yoprkuabwo4n1zox1.jpg", store: Store.all.sample)
Picture.create(remote_photo_url: "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028634/x5mcffwqpduiglfs8s6a.jpg", store: Store.all.sample)
Picture.create(remote_photo_url: "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028585/gjfm2sxwxailqklqrdbl.jpg", store: Store.all.sample)
Picture.create(remote_photo_url: "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028535/cjtc7wghezmbvxfumhnt.jpg", store: Store.all.sample)
Picture.create(remote_photo_url: "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028530/imy4dsb3sqdfjxlr0ea5.jpg", store: Store.all.sample)
Picture.create(remote_photo_url: "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028525/dwt2wedhzz8247exgdxy.jpg", store: Store.all.sample)
Picture.create(remote_photo_url: "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028520/ptexbfup5ntptalrkpho.jpg", store: Store.all.sample)
Picture.create(remote_photo_url: "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028510/cnni67g1gpwujxjva0dt.jpg", store: Store.all.sample)
Picture.create(remote_photo_url: "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028504/m6rbso7pmeqh0wjoebza.jpg", store: Store.all.sample)
Picture.create(remote_photo_url: "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028491/y4pl5qdidsvb2kno8k6n.jpg", store: Store.all.sample)
Picture.create(remote_photo_url: "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028481/qkdik4vpfm9td8bgdly3.jpg", store: Store.all.sample)
Picture.create(remote_photo_url: "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028476/plloxt6ryeimtibkz89q.jpg", store: Store.all.sample)
Picture.create(remote_photo_url: "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028469/db1v1hswheo26nnyclg6.jpg", store: Store.all.sample)
Picture.create(remote_photo_url: "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028462/q6qcenkly9c9bvitzgam.jpg", store: Store.all.sample)
Picture.create(remote_photo_url: "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028343/prxo1fh61fu7dxslsj7q.jpg", store: Store.all.sample)
Picture.create(remote_photo_url: "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028338/w5wcteurtmxfc6u00tmt.jpg", store: Store.all.sample)
Picture.create(remote_photo_url: "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028327/fzjl0igfmqtaybitdsjl.jpg", store: Store.all.sample)
Picture.create(remote_photo_url: "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028163/ruiwryayaxzmkd9fndc0.jpg", store: Store.all.sample)
Picture.create(remote_photo_url: "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028698/op7lrznw0sdtdmwaqkdz.jpg", store: Store.all.sample)
Picture.create(remote_photo_url: "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028687/yuamzsw02c6umn3fujii.jpg", store: Store.all.sample)
Picture.create(remote_photo_url: "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028650/tidoe3jbjzdcolvir7du.jpg", store: Store.all.sample)
Picture.create(remote_photo_url: "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028644/yrkmcewm9wot4czkcz5c.jpg", store: Store.all.sample)
Picture.create(remote_photo_url: "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028163/ruiwryayaxzmkd9fndc0.jpg", store: Store.all.sample)
Picture.create(remote_photo_url: "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028638/tj7yoprkuabwo4n1zox1.jpg", store: Store.all.sample)
Picture.create(remote_photo_url: "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028634/x5mcffwqpduiglfs8s6a.jpg", store: Store.all.sample)
Picture.create(remote_photo_url: "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028585/gjfm2sxwxailqklqrdbl.jpg", store: Store.all.sample)
Picture.create(remote_photo_url: "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028535/cjtc7wghezmbvxfumhnt.jpg", store: Store.all.sample)
Picture.create(remote_photo_url: "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028530/imy4dsb3sqdfjxlr0ea5.jpg", store: Store.all.sample)
Picture.create(remote_photo_url: "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028525/dwt2wedhzz8247exgdxy.jpg", store: Store.all.sample)
Picture.create(remote_photo_url: "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028520/ptexbfup5ntptalrkpho.jpg", store: Store.all.sample)
Picture.create(remote_photo_url: "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028510/cnni67g1gpwujxjva0dt.jpg", store: Store.all.sample)
Picture.create(remote_photo_url: "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028504/m6rbso7pmeqh0wjoebza.jpg", store: Store.all.sample)
Picture.create(remote_photo_url: "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028491/y4pl5qdidsvb2kno8k6n.jpg", store: Store.all.sample)
Picture.create(remote_photo_url: "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028481/qkdik4vpfm9td8bgdly3.jpg", store: Store.all.sample)
Picture.create(remote_photo_url: "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028476/plloxt6ryeimtibkz89q.jpg", store: Store.all.sample)
Picture.create(remote_photo_url: "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028469/db1v1hswheo26nnyclg6.jpg", store: Store.all.sample)
Picture.create(remote_photo_url: "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028462/q6qcenkly9c9bvitzgam.jpg", store: Store.all.sample)
Picture.create(remote_photo_url: "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028343/prxo1fh61fu7dxslsj7q.jpg", store: Store.all.sample)
Picture.create(remote_photo_url: "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028338/w5wcteurtmxfc6u00tmt.jpg", store: Store.all.sample)
Picture.create(remote_photo_url: "https://res.cloudinary.com/mathieufontaine/image/upload/v1575028327/fzjl0igfmqtaybitdsjl.jpg", store: Store.all.sample)


puts("create categories")

Category.create(name: "Vegetables")
Category.create(name: "Fruits")
Category.create(name: "Meat")
Category.create(name: "Fish")
Category.create(name: "Other")

category_ids =[]
Category.all.each { |category| category_ids << category.id  }
puts("create products")


50.times do
  Product.create!(name: Faker::Food.fruits,
    price: rand(10),
    stock: rand(100..500),
    discount: rand(),
    store_id: store_ids.sample,
    category_id: category_ids.sample
    )
end

50.times do
  Product.create!(name: Faker::Food.vegetables,
    price: rand(10),
    stock: rand(100..500),
    discount: rand(),
    store_id: store_ids.sample,
    category_id: category_ids.sample
    )
end

puts("seed finished")

