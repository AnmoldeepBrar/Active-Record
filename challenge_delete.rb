require_relative 'ar'

# Find one of the products created in challenge_create.rb
product_to_delete = Product.find_by(name: 'Black Coffe')

# Display the product information before deletion
puts "Product Details before deletion:"
puts product_to_delete.attributes

# Delete the product from the database
product_to_delete.destroy

# Display a message indicating that the product has been deleted
puts "Product has been successfully deleted."

# Attempt to find the deleted product
deleted_product = Product.find_by(name: 'Black Coffe')

# Display a message indicating whether the product was found or not
if deleted_product.nil?
  puts "\nProduct is not found. So deletion is successful."
else
  puts "\nProduct still exists in the data. So deletion failed."
end
