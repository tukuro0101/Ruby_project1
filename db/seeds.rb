# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#1.7  Data Sources
#Faker gem for random data to CoffeeShops, Customers, and Reviews.

require 'faker'

# Clear existing data
Review.destroy_all
Customer.destroy_all
CoffeeShop.destroy_all

# Create coffee shops
20.times do
  CoffeeShop.create!(
    name: Faker::Coffee.unique.blend_name,
    location: "#{Faker::Address.city}, #{Faker::Address.state}",
    rating: rand(1.0..5.0).round(1),
    description: Faker::Lorem.sentence
  )
end

# Create customers
50.times do
  Customer.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.unique.email,
    favorite_coffee_shop: CoffeeShop.order('RANDOM()').first
  )
end

# Create reviews
200.times do
  Review.create!(
    customer: Customer.order('RANDOM()').first,
    coffee_shop: CoffeeShop.order('RANDOM()').first,
    rating: rand(1..5),
    comment: Faker::Lorem.sentence
  )
end
