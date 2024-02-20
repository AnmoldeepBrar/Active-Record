require_relative 'ar'

# Find all products with a stock quantity greater than 40
products_greater_than_40 = Product.where("stock_quantity > 40")

# Display the products before the update
puts "All the products before update:"
puts products_greater_than_40.pluck(:name, :stock_quantity)

# Add one to the stock quantity of each of these products
products_greater_than_40.each do |product|
  product.stock_quantity += 1
end

# Save the changes to the database
products_greater_than_40.each(&:save)

# Display the products after the update
puts "All products after update:"
puts Product.where("stock_quantity > 40").pluck(:name, :stock_quantity)
