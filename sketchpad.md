THINGS TO DO:

fix the employees show tips feature
   <% @parties.each do |party| %>
      <% tips_total = 0 %>
      <% tips_total += party.tip %>
      <% end %>
    <p>Tips so far:<%= currency(tips_total) %></p>

set up employee new
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
(id SERIAL PRIMARY KEY, table_number INT, people INT, paid BOOLEAN, tip FLOAT DEFAULT 0.00, total FLOAT, employee_id INTEGER, created_at TIMESTAMP, updated_at TIMESTAMP);

CREATE TABLE orders
(id SERIAL PRIMARY KEY, party_id INT, food_id INT, comped BOOLEAN DEFAULT 'f', created_at TIMESTAMP, updated_at TIMESTAMP);

CREATE TABLE allergens
(id SERIAL PRIMARY KEY, name TEXT, created_at TIMESTAMP, updated_at TIMESTAMP);

CREATE TABLE food_allergens
(id SERIAL PRIMARY KEY, food_id INTEGER, allergen_id INTEGER, created_at TIMESTAMP, updated_at TIMESTAMP);

CREATE TABLE employees
(id SERIAL PRIMARY KEY, name TEXT, created_at TIMESTAMP, updated_at TIMESTAMP);

sass -w style.scss:style.css

<input type="hidden" name="party[paid]" value="true">

<form action="/parties/<%= party.id %>/closeout" method="post">
<label for="tip">Tip: </label>
<input id="tip" type="integer" name='party[tip]'><br>
<label for="total">Total: </label>
<input id="total" type="integer" name='party[total]'><br>

<input type="hidden" name="party[paid]" value="true">
<input type="submit">
<input type="hidden" name="_method" value="PATCH">
</form>
<br> 

<h3>Suggested gratuity:</h3>
<p>15%: <%= currency(bill * 0.15) %> </p>
<p>20%: <%= currency(bill * 0.20) %> </p>
<p>25%: <%= currency(bill * 0.25) %> </p>
<p>Thank you, please visit us again!</p>

