class FoodAllergen < ActiveRecord::Base
 belongs_to :food
 belongs_to :allergen
end