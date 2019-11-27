# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts("deleting stores")


# Review.destroy_all
Store.destroy_all
# Order.destroy_all
User.destroy_all

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

  ids = []
  User.all.each { |user| ids << user.id  }
  pictures = ["1.jpg","2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg", "7.jpg", "8.jpg", "9.jpg", "10.jpg", "11.jpg", "12.jpg", "13.jpg", "14.jpg", "15.jpg", "16.jpg", "17.jpg", "18.jpg", "19.jpg","20.jpg", "21.jpg", "22.jpg", "23.jpg", "24.jpg", "25.jpg" ]

  20.times do
    Store.create!(name: Faker::Company.name,
      address: Faker::Address.full_address,
      description: Faker::Restaurant.description,
      website: Faker::Internet.url,
      phone: Faker::PhoneNumber.phone_number_with_country_code,
      picture: pictures.sample,
      longitude: Faker::Address.longitude,
      latitude: Faker::Address.latitude,
      user_id: ids.sample
      )
  end

puts("create categories")

Category.create(name: "Vegetables")
Category.create(name: "Fruits")
Category.create(name: "Meat")
Category.create(name: "Fish")
Category.create(name: "Other")


puts("seed finished")

