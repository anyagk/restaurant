# encoding: utf-8

Dir["models/*.rb"].each do |file|
  require_relative file
end

class Restaurant < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  set :default_currency_unit, '&#163;'
  set :default_currency_precision, 2
  set :default_currency_separator, ' '
  enable :sessions

  get '/foods' do 
    @foods = Food.all

    erb :'foods/index'
  end

  get '/foods/new' do 
    @allergens = Allergen.all

    erb :'foods/new'
  end

  get '/foods/:id' do 
    food_id = params[:id]
    @food = Food.find(food_id)
    @allergens = Allergen.all

    erb :'foods/show'
  end

  post '/foods' do
     food = Food.create(params[:food])
     @allergens = Allergen.all
     if food.valid?
     redirect to "/foods/#{food.id}"
     else 
       @food = food
       @error_messages = food.errors.messages
       erb :'foods/new'
     end
  end

  get '/foods/:id/edit' do
    @food = Food.find(params[:id]) 
    @allergens = Allergen.all
    
    erb :'foods/edit'
  end


  patch '/foods/:id' do
    food = Food.find(params[:id])
    food.update(params[:food])
    redirect to "/foods/#{food.id}"
  end

  delete '/foods/:id' do
    food = Food.find(params[:id])
    food.destroy 
    
    redirect to '/foods'
  end  
########################################
  get '/parties' do 
    @parties = Party.all

    erb :'parties/index'
  end

  get '/parties/new' do
    @available = Party.free_table 
    
    erb :'parties/new'
  end

  post '/parties' do 
    party = Party.create(params[:party])
    party.update(employee_id: session[:id])

    redirect to "/parties/#{party.id}"
  end

  get '/parties/:id' do 
    party_id = params[:id]
    @party = Party.find(party_id)
    @foods = Food.all
    @orders = @party.orders

    erb :'parties/show'
  end

  post '/orders' do 
    order = Order.create(params[:order])

    redirect to "/parties/#{order.party_id}"
  end

  patch '/orders/:id' do
    order = Order.find(params[:id])
    order.update(params[:order])
    redirect to "/parties/#{order.party_id}"
  end
  

  patch '/parties/:id' do
    party = Party.find(params[:id])
    party.update(people: params[:party][:people])
    Order.create(party_id: params[:id], food_id: params[:party][:orders][:food_id])
    Order.update
    
    redirect to "/parties/#{party.id}"
  end

  delete '/orders/:id' do
    order = Order.find(params[:id])
    order.destroy

    redirect to "/parties/#{order.party_id}"
  end

  delete '/orders/:id/' do
    params[:order][:party_id] = params[:id]
    order = Order.find(params[:id])
    order.destroy

    redirect to "/parties/#{party.id}"
  end

  delete '/parties/:id' do
    party = Party.find(params[:id])
    party.destroy 
    
    redirect to '/parties'
  end

  get '/parties/:id/receipt'  do
    @party = Party.find(params[:id])
    erb :'parties/receipt'
  end

  patch '/parties/:id/closeout' do 
    @party = Party.find(params[:id])
    @party.update(params[:party])
    @party.update(paid: true)

    redirect to '/parties'  
  end

  get '/employees' do
    @employees = Employee.all

    erb :'employees/index'
  end

  get '/employees/new' do 
    @employee = Employee.new

    erb :'employees/new'
  end

  get '/employees/:id' do
    @employee = Employee.find(params[:id])
    session[:id] = @employee.id
    @parties = @employee.parties

    erb :'employees/show'
  end

  post '/employees' do 
    employee = Employee.create(params[:employee])

    redirect to "/employees/#{employee.id}"
  end


  get "/console" do
    Pry.start(binding)  
  end

  get "/*" do
    redirect to("/foods")
  end

end  
