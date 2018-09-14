# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.destroy_all
Review.destroy_all

30.times do |index|
  Product.create!(name: Faker::Food.fruits,
    cost: Faker::Number.non_zero_digit,
    origin: "USA")
end

30.times do |index|
  Product.create!(name: Faker::Food.fruits,
    cost: Faker::Number.non_zero_digit,
    origin: "Mexico")
end

Product.all.each do |product|
    60.times do |index|
      product.reviews.create!(author: Faker::Name.name, content: Faker::Lorem.sentence(20),
      rating: Faker::Number.between(1, 5),
      product_id: Product.all.shuffle[0].id)
  end
end

p "Created #{Product.count} products"
