class OrdersController < ApplicationController

  post '' do 
    order = Order.create(params[:order])

    redirect to "/#{order.party_id}"
  end

  patch '/:id' do
    order = Order.find(params[:id])
    order.update(params[:order])
    redirect to "/#{order.party_id}"
  end
  
  delete '/:id' do
    order = Order.find(params[:id])
    order.destroy

    redirect to "/#{order.party_id}"
  end

  # delete '/:id/' do
  #   params[:order][:party_id] = params[:id]
  #   order = Order.find(params[:id])
  #   order.destroy

  #   redirect to "/parties/#{party.id}"
  # end

end
