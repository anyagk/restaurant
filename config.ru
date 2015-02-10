#\ -p 3000

# Make sure we load all the gems
require 'bundler'
Bundler.require :default

# Then connect to the database
#set :database, {
#  adapter: "postgresql", database: "restaurant_db",
#  host: "localhost"
#}


ActiveRecord::Base.establish_connection("postgresql://" + ENV["DB_INFO"] + "@127.0.0.1/restaurant_db")

use Rack::MethodOverride

require './app'
run Restaurant