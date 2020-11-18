# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Restaurant.destroy_all
Review.destroy_all

10.times do
  attributes = {
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    category: Restaurant::CATEGORIES.sample
  }
  restaurant = Restaurant.create!(attributes)

  review_attributes = {
    content: Faker::Movie.quote,
    rating: rand(0..5),
    restaurant: restaurant
  }
  review = Review.create!(review_attributes)

  puts "created #{restaurant.name} with review #{review}"
end
