require_relative 'ar' 
class Product < ActiveRecord::Base
  # This AR object is linked with the products table.
  
  # A product has a many to one relationship with a category.
  # The products table has a category_id foreign key.
  # In other words, a product belongs to a category.
  belongs_to :category

    # Validation to ensure all non-foreign key, id, or datetime columns are filled out
    validates :name, :description, :price, :stock_quantity, presence: true

    # Validation to ensure all product names are unique and longer than 3 characters
    validates :name, uniqueness: true, length: { minimum: 4 }
  
    # Validation to ensure that price is a positive number
    validates :price, numericality: { greater_than: 0 }
    
end