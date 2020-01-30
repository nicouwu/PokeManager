CREATE DATABASE pokedex;

-- users pokemon box
CREATE TABLE pokebox (
  id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL,
  pokemon_id INTEGER NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
  FOREIGN KEY (pokemon_id) REFERENCES all_pokemon (id) ON DELETE CASCADE
);

-- users info
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username VARCHAR(200),
  email VARCHAR(300),
  password_digest VARCHAR(400)
);
-- 151 pokemon(no changes necessary)
CREATE TABLE all_pokemon (
  id SERIAL PRIMARY KEY,
  name VARCHAR(200),
  img_url VARCHAR(500)
);

CREATE TABLE pokebox (
  id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL,
  pokemon_id INTEGER NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
  FOREIGN KEY (pokemon_id) REFERENCES all_pokemon (id) ON DELETE CASCADE
);

ALTER TABLE pokebox ADD COLUMN user_id INTEGER;

ALTER TABLE users ADD CONSTRAINT unique_email UNIQUE (email);

ALTER TABLE pokebox ADD CONSTRAINT user_id_fk FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE;

select pokebox.id as tid, * from pokebox join all_pokemon on (pokebox.pokemon_id = all_pokemon.id) where user_id = $1;