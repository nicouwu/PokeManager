# get user pokemon box on user page

get '/user/box' do
    redirect "/" unless logged_in?
    @pokebox = users_box_pokemon(current_user['id'])
    @pokedex = get_data()
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

# get '/pokemon/new' do
#     erb :"/pokemon/new"
# end
  
get '/pokemon/:name' do
    @pokedex = get_data()
    # the json array
    @pokenum = @pokedex.index {|h| h["name"] == params[:name]}
    # getting the index number from the json array using the child key 'name'
    erb :"/pokedex/show"
end

delete '/user/box/:tid' do
    delete_pokemon(params[:tid])
    redirect "/user/box"
    # erb :"userpage/pokemon_box"
end


