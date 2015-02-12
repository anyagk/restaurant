#\ -p 3000



# Make sure we load all the gems
require 'bundler'
Bundler.require :default

# Then connect to the database
if ENV['APP_ENV'] == 'production'
  set :database, {
    adapter: "postgresql", database: "restaurant_db"
  }
else
  set :database, {
    adapter: "postgresql", database: "restaurant_db",
    host: "localhost"
  }
end

['models', 'helpers', 'controllers'].each do |component|
  Dir["#{component}/*.rb"].sort.each do |file|
    require File.expand_path(file)
  end
end


use Rack::MethodOverride

require_relative 'app'

map('/foods') { run FoodsController }
map('/parties') { run PartiesController }
map('/employees') { run EmployeesController }
map('/orders') { run OrdersController }


# run Sinatra::Application
run Restaurant

