Dir["models/*.rb"].each do |file|
  require_relative file
end



class Restaurant < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  get '/welcome' do 
    "Welcome"
    # erb :'static/welcome'
  end  

  get '/foods' do 
    @foods = Food.all

    erb :'foods/index'
  end

  get '/foods/new' do 

    erb :'foods/new'
  end

  get '/foods/:id' do 
    food_id = params[:id]
    @food = Food.find(food_id)

    erb :'foods/show'
  end

  post '/foods' do
      food = Food.create(name: params[:food][:name], price: params[:food][:price], course_type: params[:food][:course_type], description: params[:food][:description])
      food_allergens = (params[:food][:food_allergen])
      food_allergens.each do |food_allergen| 
        allergen_id = Allergen.find_by(name: food_allergen).id
        FoodAllergen.create(allergen_id: allergen_id, food_id: food.id)
      end
      
      redirect to "/foods/#{food.id}"
  end

  get '/foods/:id/edit' do
    @food = Food.find(params[:id]) 
    
    erb :'foods/edit'
  end

  patch '/foods/:id' do
    food = Food.find(params[:id])
    food.food_allergens.destroy_all
    food.update(name: params[:food][:name], price: params[:food][:price])
    food_allergens = (params[:food][:food_allergen])
    
    food_allergens.each do |food_allergen| 
      allergen_id = Allergen.find_by(name: food_allergen).id
      FoodAllergen.create(allergen_id: allergen_id, food_id: params[:id])

    end

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

  get '/parties/:id' do 
    party_id = params[:id]
    @party = Party.find(party_id)
    @foods = @party.foods

    erb :'parties/show'
  end

  post '/parties' do 
    party = Party.create(params[:party])
    redirect to "/parties/#{party.id}"
  end

  get '/parties/:id/edit' do 
    @party = Party.find(params[:id]) 
    @foods = Food.all 
    erb :'parties/edit'
  end

  post '/parties/:id/orders' do 
    params[:oder][:party_id] = params[:id]
    order = Order.create(params[:order])

    redirect to "/parties/#{party.id}"
  end

  get '/parties/:id/checkout' do 
    @party = Party.find(params[:id])
    erb :'parties/checkout'
  end    

  patch '/parties/:id' do
    party = Party.find(params[:id])
    party.update(people: params[:party][:people])
    Order.create(party_id: params[:id], food_id: params[:party][:orders][:food_id])
    
    redirect to "/parties/#{party.id}"
  end

  delete '/parties/:id/orders' do
    params[:oder][:party_id] = params[:id]
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

  get "/console" do
    Pry.start(binding)  
  end

  get "/*" do
    redirect to("/welcome")
  end

end  