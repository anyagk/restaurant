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

use Rack::MethodOverride

require './app'
run Restaurant
