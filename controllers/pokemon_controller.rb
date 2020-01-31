# get user pokemon stats (only accessible to users)

# get user pokemon box on user page
get '/user/box' do
    redirect "/" unless logged_in?
    @pokebox = users_box_pokemon(current_user['id'])
    erb :"userpage/pokemon_box"
end

get '/user/pokemon/:id' do
    @pokemon = get_pokemon_by_id(params[:id])
    erb :"userpage/stats"
end

post '/user/box' do 
    add_pokemon(
      params[:pokemon_id],  
      current_user['id'],
      params[:name],
      params[:img_url]
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

delete '/user/box/:id' do
    delete_pokemon(params[:id])
    redirect "/user/box"
    # erb :"userpage/pokemon_box"
end

get 'user/box/edit' do
    @pokemon = get_pokemon_by_id(params[:id])
    erb :"userpage/edit_stats"
end

patch '' do
    
end