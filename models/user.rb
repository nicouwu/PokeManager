require 'bcrypt'

def logged_in?
    if session[:user_id]
      return true
    else
      return false
    end
end
  
def current_user
    run_sql("select * from users where id = #{session[:user_id]};")[0]
    
end

def create_user(username, email, password)
  password_digest = BCrypt::Password.create(password)

  sql = <<~SQL
    INSERT INTO users 
    (username, email, password_digest)
    VALUES
    ($1, $2, $3);
  SQL
  run_sql(sql, [username, email, password_digest])
end