THINGS TO DO:
create login and password feature
STYLING






In the Party class:  

  def new_party
    assign the party a table (pull from tables the max table number and add one to that)
    create orders for each food item for this party with number_ordered set to zero
    self.id
    self.table_number
  end


In parties/new.erb

potential solution:
we need to make the table number auto populate by looking at parties and adding one to the last id in the table

  # bad
  if some_condition
    do_something
  end

  # good
  do_something if some_condition


When we make a new party all we do is set id and number of people.  our new party method adds the table numbers and the empty orders


CREATE TABLE foods 
(id SERIAL PRIMARY KEY, name TEXT, description TEXT, course_type TEXT, price INT, created_at TIMESTAMP, updated_at TIMESTAMP);

CREATE TABLE parties
(id SERIAL PRIMARY KEY, table_number INT, people INT, paid BOOLEAN DEFAULT 'false', tip FLOAT DEFAULT 0.00, total FLOAT, employee_id INTEGER, created_at TIMESTAMP, updated_at TIMESTAMP);

CREATE TABLE orders
(id SERIAL PRIMARY KEY, party_id INT, food_id INT, comped BOOLEAN DEFAULT 'f', created_at TIMESTAMP, updated_at TIMESTAMP);

CREATE TABLE allergens
(id SERIAL PRIMARY KEY, name TEXT, created_at TIMESTAMP, updated_at TIMESTAMP);

CREATE TABLE food_allergens
(id SERIAL PRIMARY KEY, food_id INTEGER, allergen_id INTEGER, created_at TIMESTAMP, updated_at TIMESTAMP);

CREATE TABLE employees
(id SERIAL PRIMARY KEY, name TEXT, created_at TIMESTAMP, updated_at TIMESTAMP);

sass -w style.scss:style.css

