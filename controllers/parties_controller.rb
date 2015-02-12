class PartiesController < ApplicationController

  get '' do 
    @parties = Party.all

    erb :'parties/index'
  end

  get '/new' do
    @available = Party.free_table 
    
    erb :'parties/new'
  end

  post '' do 
    party = Party.create(params[:party])
    party.update(employee_id: session[:id])

    redirect to "/#{party.id}"
  end

  get '/:id' do 
    party_id = params[:id]
    @party = Party.find(party_id)
    @foods = Food.all
    @orders = @party.orders

    erb :'parties/show'
  end

  patch '/:id' do
    party = Party.find(params[:id])
    party.update(people: params[:party][:people])
    Order.create(party_id: params[:id], food_id: params[:party][:orders][:food_id])
    Order.update
    
    redirect to "/#{party.id}"
  end

  delete '/:id' do
    party = Party.find(params[:id])
    party.destroy 
    
    redirect to ''
  end

  get '/:id/receipt'  do
    @party = Party.find(params[:id])
    erb :'parties/receipt'
  end

  patch '/:id/closeout' do 
    @party = Party.find(params[:id])
    @party.update(params[:party])
    @party.update(paid: true)

    redirect to ''  
  end


end