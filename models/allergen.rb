class Allergen < ActiveRecord::Base
 has_many :food_allergens
 has_many :foods, through: :food_allergens
end