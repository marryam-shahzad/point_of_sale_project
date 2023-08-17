# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# db/seeds.rb

# Clear existing data


# # Generate 10 fake products
# 10.times do
#   Product.create(
#     name: Faker::Commerce.product_name,
#     description: Faker::Lorem.sentence,
#     price: Faker::Commerce.price,
#     quantity: Faker::Number.between(from: 1, to: 100)
#   )
# end


require 'faker'




# Create stores
10.times do
  Store.create(
    name: Faker::Company.name,
    location: Faker::Address.city
  )
end

# Create products associated with stores
Store.all.each do |store|
  30.times do
    product = store.products.create(
      name: Faker::Commerce.product_name,
      description: Faker::Lorem.sentence,
      price: Faker::Commerce.price,
      quantity: Faker::Number.between(from: 1, to: 100)
    )
    product.image.attach(io: URI.open(Faker::Avatar.image), filename: "#{Faker::Lorem.word}.png")
    # Generate a placeholder image URL
    # image_url = Faker::LoremPixel.image(size: "300x300")

    # # Create an ActiveStorage blob for the image
    # product.product_image.attach(io: URI.open(image_url), filename: 'product_image.png')

    # product.save
  end
end




