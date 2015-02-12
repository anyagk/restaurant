


class Restaurant < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  set :default_currency_unit, '&#163;'
  set :default_currency_precision, 2
  set :default_currency_separator, ' '
  
  enable :method_override
  enable :sessions

  get "/console" do
    Pry.start(binding)  
  end

  get "/*" do
    redirect to("/foods")
  end

end  
