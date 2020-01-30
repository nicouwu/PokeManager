# get user pokemon box on user page

get '/user/box' do
    @pokebox = users_box_pokemon(current_user['id'])
    # @pokedex = get_data()
    # binding.pry
    erb :"userpage/pokemon_box"
end

post '/user/box' do 
    add_pokemon(
      params[:pokemon_id],  
      current_user['id']
    )
    redirect "/"
    erb :"userpage/pokemon_box"
end

get '/pokemon/new' do
    erb :"/pokemon/new"
end
  
get '/pokemon/:num' do
    @pokenum = params[:num].to_i
    @pokedex = get_data()
    erb :"/pokedex/show"
end

# get '/pokemon/0' do
    
#     @pokedex = get_data()
#     erb :"/pokedex/show"
# end