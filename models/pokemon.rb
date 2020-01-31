# read
def users_box_pokemon(user_id)
    sql = "select * from pokebox where user_id = $1;"
    # select  * from pokebox join all_pokemon on (pokebox.pokemon_id = all_pokemon.id) where user_id = 1;
    # implicit return
    run_sql(sql, [user_id])
end
  
def get_pokemon_by_id(id)
    sql = "SELECT * FROM pokebox WHERE id = $1;"
    run_sql(sql, [id])[0]
end
  
# # optional
# def find_one_pokemon(column, value)
#     sql = "SELECT * FROM pokebox WHERE #{column} = $1;"
#     run_sql(sql, [value])[0]
# end

# add pokemon to pokebox table
def add_pokemon(pokemon_id, user_id, name, img_url)
    sql = <<~SQL
      INSERT INTO pokebox
      (pokemon_id, user_id, name, img_url)
      VALUES
      ($1, $2, $3, $4);
    SQL
    run_sql(sql, [pokemon_id, user_id, name, img_url])
  end

    #function to create table of 151 pokemon   
  def create_pokemon(name, img_url)
    sql = <<~SQL
      INSERT INTO all_pokemon
      (name, img_url)
      VALUES
      ($1, $2);
    SQL
    run_sql(sql, [name, img_url])
  end
  
  # delete a pokemon from pokebox table with id(NOT pokemon_id)
  def delete_pokemon(id)
    sql = "delete from pokebox where id = $1;"
    run_sql(sql, [id])
  end
  
  # update
  def update_stats(hp, attack, defence, special, speed)
    sql = <<~SQL
      update pokebox
      set 
      hp = $1,  
      attack = $2;
      defence = $3;
      special = $4;
      speed = $5;
    SQL
    run_sql(sql, [hp, attack, defence, special, speed])
  end