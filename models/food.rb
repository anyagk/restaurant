class Food < ActiveRecord::Base
 has_many :orders, dependent: :destroy
 has_many :parties, through: :orders
 has_many :food_allergens
 has_many :allergens, through: :food_allergens

 validates :name, uniqueness: {message: "There is already a menu item with that name, please crete something new"
end