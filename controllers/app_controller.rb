class ApplicationController < Sinatra::Base
  set :method_override, true

  set :default_currency_unit, '&#163;'
  set :default_currency_precision, 2
  set :default_currency_separator, ' '
  enable :sessions


  set :root, Proc.new { File.expand_path('../..', __FILE__) }
  set :views, Proc.new { File.join(root, 'views') }
  set :public_folder, Proc.new { File.join(root, 'public') }
end
