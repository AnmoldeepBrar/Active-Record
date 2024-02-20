require_relative 'ar'

# Use the Product class to find any product from the database
product = Product.first

# Inspect the Product object you have retrieved
puts "Product details:"
puts product.inspect

# Total number of products
number_of_products = Product.count
puts "Total number of products: #{number_of_products}"

# Names of all products above $10 with names that begin with the letter C
products_above_10 = Product.where("price > 10 AND name LIKE 'C%'")
puts "Products above $10 with names starting with 'C': #{products_above_10.pluck(:name)}"

# Total number of products with low stock quantity (less than 5)
low_stock_products = Product.where("stock_quantity < 5")
puts "Total number of products with low stock quantity: #{low_stock_products.count}"

# Find the name of the category associated with one of the products
category_name = product.category.name
puts "Category associated with the product: #{category_name}"

# Find a specific category and use it to build and persist a new product associated with this category
category = Category.find_by(name: 'Produce')
new_product = category.products.create(name: 'Wheat and Rice', description: 'Mostly grown in India', price: 799.99, stock_quantity: 10)
puts "New product created: #{new_product.inspect}"

# Find a specific category and then use it to locate all the associated products over a certain price
category_to_find = Category.find_by(name: 'Beverages')
products_in_category_above_price = category_to_find.products.where("price > 50")
puts "Products in the 'Clothing' category above $50: #{products_in_category_above_price.pluck(:name)}"
