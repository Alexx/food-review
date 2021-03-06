# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.destroy_all

200.times do |index|
  product = Product.create!(name: Faker::Food.dish,
                            country_of_origin: Faker::Address.country,
                            cost: Faker::Number.between(from: 6, to: 30))
    if product.persisted?
      rand(1..25).times do
        product.reviews.create(
          author: Faker::Name.name,
          content_body: Faker::Lorem.paragraph_by_chars(number: rand(50..250), supplemental: false),
          rating: rand(1..5)
        )
      end
    end
  end
  p "Created #{Product.count} products."
