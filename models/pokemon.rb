# read
def all_pokemon
    sql = "SELECT * FROM pokebox;"
    # implicit return
    run_sql(sql)
  end
  
  def find_one_pokemon_by_id(id)
    sql = "SELECT * FROM pokebox WHERE id = $1;"
    run_sql(sql, [id])[0]
  end
  
  # optional
  def find_one_pokemon(column, value)
    sql = "SELECT * FROM pokebox WHERE #{column} = $1;"
    run_sql(sql, [value])[0]
  end
  
  # add pokemon to box
  def add_pokemon(name, img_url, user_id)
    sql = <<~SQL
      INSERT INTO pokebox
      (name, img_url, user_id)
      VALUES
      ($1, $2, $3);
    SQL
    run_sql(sql, [name, img_url, user_id])
  end
  
  # destroy
  def delete_pokemon(id)
    sql = "delete from pokebox where id = $1;"
    run_sql(sql, [id])
  end
  
  # update
  def update_team(name, img_url, user_id)
    sql = <<~SQL
      update poketeam 
      set 
      name = $1, 
      img_url = $2, 
      user_id = $3;
    SQL
    run_sql(sql, [name, img_url, user_id])
  end