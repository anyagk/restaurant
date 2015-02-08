class Food < ActiveRecord::Base
  has_many :orders
  has_many :parties, through: :orders
  has_many :food_allergens
  has_many :allergens, through: :food_allergens

  validates :name, uniqueness: {message: "Please make a new food, that one exists."}  
  validates :price, numericality: {message: "Your price is bad and you should feel bad."}  
  validates :description, presence: {message: "Add a description, please."}


end