require 'pg'
require 'active_record'
require 'pry'

Dir["../models/*.rb"].each do |file|
  require_relative file
end

ActiveRecord::Base.establish_connection(
  adapter: "postgresql",
  database: "restaurant_db",
  host: "localhost" 
)

# Food.destroy_all
# Party.destroy_all
# Order.destroy_all

# CREATE EMPLOYEES
[
  {
    name: "Nancy"
  },
  {
    name: "Paul"
  }  
].each do |employee|
  Employee.create( employee )
end


# CREATE FOODS
[
  {
    name: "Burrata",
    description: "Burrata with vine tomatoes and balsamic reduction",
    course_type: "Appetizer",
    price: 14
  },
  {
    name: "Wedge salad",
    description: "Wedge salad with tamari glazed pork belly, blue cheese, and pickled carrots and daikon radish",
    course_type: "Appetizer",
    price: 15
  },
  {
    name: "Ribeye",
    description: "Ribeye with carmalized sweet onions served with black garlic spinach and Hasselback sweet potato with a brown butter sabayon",
    course_type: "Entree",
    price: 39
  },
  {
    name: "Lamb",
    description: "Roasted rack of lamb served with truffled Israeli couscous with wild mushrooms, Meyer lemon, and basil",
    course_type: "Entree",
    price: 44
  },
  {
    name: "Candied grapefruit",
    description: "Candied grapefruit with hazelnut sorbet",
    course_type: "Dessert",
    price: 11
  },
  {
    name: "Creme brulee",
    description: "Espresso creme brulee with fresh berries",
    course_type: "Dessert",
    price: 13
  }        
].each do |food|
  Food.create( food )
end

#CREATE PARTIES
[
  {
    table_number: 11,
    people: 2,
    employee_id: 1
  },
  {
    table_number: 12,
    people: 4,
    employee_id: 2
  } 
].each do |party|
  Party.create( party )
end

#CREATE ORDERS
[
  {
    party_id: 1,
    food_id: 1
  },
  {
    party_id: 1,
    food_id: 2
  },  
  {
    party_id: 1,
    food_id: 3
  },
  {
    party_id: 1,
    food_id: 6
  },
  {
    party_id: 2,
    food_id: 1
  },
  {
    party_id: 2,
    food_id: 1
  },
  {
    party_id: 2,
    food_id: 3
  },
  {
    party_id: 2,
    food_id: 4
  },
  {
    party_id: 2,
    food_id: 4
  },            
  {
    party_id: 2,
    food_id: 5
  },
  {
    party_id: 2,
    food_id: 5
  }
].each do |order|
  Order.create( order )
end

#CREATE allergens

[
  {
    name: "dairy"
  },
  {
    name: "soy"
  },
  {
    name: "gluten"
  },
  {
    name: "nuts"
  },
  {
    name: "sesame"
  },
  {
    name: "shellfish"
  }
  ].each do |allergen|
    Allergen.create( allergen )
  end

#CREATE food_allergens
[
  {
    food_id: 1,
    allergen_id: 1
  },
  {
    food_id: 2,
    allergen_id: 1
  },
  {
    food_id: 2,
    allergen_id: 2
  },
  {
    food_id: 2,
    allergen_id: 3
  },
  {
    food_id: 3,
    allergen_id: 1
  },
  {
    food_id: 4,
    allergen_id: 1
  },
  {
    food_id: 4,
    allergen_id: 3
  },
  {
    food_id: 5,
    allergen_id: 1
  },
  {
    food_id: 5,
    allergen_id: 4
  },
  {
    food_id: 6,
    allergen_id: 1
  },
  {
    food_id: 6,
    allergen_id: 4
  }
  ].each do |food_allergen|
    FoodAllergen.create( food_allergen )
  end













