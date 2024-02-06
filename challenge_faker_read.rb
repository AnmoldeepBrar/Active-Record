require_relative 'ar'

# Find all categories in the database
categories = Category.all

# Display category names and their associated products (name and price)
categories.each do |category|
  puts "Category: #{category.name}"
  puts "  Products:"
  
  # Display associated products (name and price)
  category.products.each do |product|
    puts "    - #{product.name}, Price: $#{'%.2f' % product.price}"
  end

  puts "\n" # Add a newline for better formatting
end
