require_relative 'ar'
require 'faker'

# Generate 10 new categories
10.times do
  category_name = Faker::Commerce.department
  category_description = Faker::Lorem.sentence
  new_category = Category.create(name: category_name, description: category_description)
  puts "New Category created: #{new_category.inspect}"

  # Generate 10 new products for each category
  10.times do
    product_name = Faker::Commerce.product_name
    product_description = Faker::Lorem.sentence
    product_price = Faker::Commerce.price(range: 10.0..100.0)
    product_quantity = Faker::Number.between(from: 1, to: 50)
    
    new_product = new_category.products.create(
      name: product_name,
      description: product_description,
      price: product_price,
      stock_quantity: product_quantity
    )

    puts "  New Product created: #{new_product.inspect}"
  end
end
