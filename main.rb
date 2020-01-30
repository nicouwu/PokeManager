require 'sinatra'
require_relative 'poke_json'
require_relative 'db/shared'
require_relative 'models/pokemon'   
require_relative 'models/user'

if development?
  require 'sinatra/reloader'
  require 'pry'
  also_reload 'db/shared'
  also_reload 'models/pokemon'
end

enable :sessions

get '/' do
  @pokedex = get_data()
  # binding.pry
  erb :index
end

require_relative 'controllers/pokemon_controller.rb'

# create user's personal page first then add login function later


# creating new account
get '/user/new' do
  erb :"userpage/new_account"
end

post '/user/new' do
  create_user(params[:username], params[:email], params[:password])
  redirect '/user/box'
end

# login
post '/' do
  sql = "select * from users where email = '#{ params[:email]}';"
  results = run_sql(sql)
  
  if results.count == 1 && BCrypt::Password.new(results[0]['password_digest']) == params[:password]
    session[:user_id] = results[0]['id']
    redirect 'user/box' 
  else
    redirect '/'
  end
end

# logout
delete '/session' do
  session[:user_id] = nil
  redirect '/'
end
