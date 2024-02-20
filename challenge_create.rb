# challenge_create.rb
require_relative 'ar'

# Create three new products using three different ways to create new AR objects

# Method 1: Using new and save
product1 = Product.new(name: 'Green Tea', description: 'Good for Health.', price: 5, stock_quantity: 10)
product1.save!

# Method 2: Using create
product2 = Product.create(name: 'Carrot Muffins', description: 'It is too tasty.', price: 6, stock_quantity: 10)

# Method 3: Using create with a block
product3 = Product.create do |p|
  p.name = 'Mcrispy'
  p.description = 'Finally back after 10 years at Mcd.'
  p.price = 10
  p.stock_quantity = 20
end

# Ensure that all three new products are persisted to the database without validation errors

# Validate method 1
puts "Green Tea is stored: #{product1.persisted?}"  # Should be true

# Validate method 2
puts "Carrot Muffins is stored: #{product2.persisted?}"  # Should be true

# Validate method 3
puts "Mcrispy is stored: #{product3.persisted?}"  # Should be true

# Create a Product object that is missing some required columns
invalid_product = Product.new(name: 'Invalid Product')

# Attempt to save this product and print all the AR errors which are generated
if invalid_product.save
  puts 'Invalid product saved successfully (unexpected behavior).'
else
  puts 'Invalid product did not save.'
  puts invalid_product.errors.full_messages
end
