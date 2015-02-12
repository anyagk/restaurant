class FoodsController < ApplicationController

  get '' do 
    @foods = Food.all

    erb :'foods/index'
  end

  get '/new' do 
    @allergens = Allergen.all

    erb :'foods/new'
  end

  get '/:id' do 
    food_id = params[:id]
    @food = Food.find(food_id)
    @allergens = Allergen.all

    erb :'foods/show'
  end

  post '' do
     food = Food.create(params[:food])
     @allergens = Allergen.all
     if food.valid?
     redirect to "/#{food.id}"
     else 
       @food = food
       @error_messages = food.errors.messages
       erb :'foods/new'
     end
  end

  get '/:id/edit' do
    @food = Food.find(params[:id]) 
    @allergens = Allergen.all
    
    erb :'foods/edit'
  end

  patch '/:id' do
    food = Food.find(params[:id])
    food.update(params[:food])
    redirect to "/#{food.id}"
  end

  delete '/:id' do
    food = Food.find(params[:id])
    food.destroy 
    
    redirect to ''
  end
    
end