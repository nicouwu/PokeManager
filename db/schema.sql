CREATE DATABASE pokedex;

CREATE TABLE pokebox (
  id SERIAL PRIMARY KEY,
  name VARCHAR(200),
  img_url VARCHAR(500),
  user_id INTEGER NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

INSERT INTO pokebox (name, img_url) VALUES ('cake', 'https://external-preview.redd.it/c_vzWtLiA68nNfS1p8Q3AD_396nL39uDIwoj9DDjnC8.jpg?auto=webp&s=a2ef37b6acbe9d2fc0bc8ca737040558f4f6e6a2');

INSERT INTO pokebox (name, img_url) VALUES ('ribs', 'https://img.buzzfeed.com/video-api-prod/assets/81733b053eaf4e6c851a676b20798932/BFV6085_Slow-Cooker-Ribs_Thumb.jpg');

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username VARCHAR(200),
  email VARCHAR(300),
  password_digest VARCHAR(400)
);




ALTER TABLE pokebox ADD COLUMN user_id INTEGER;

ALTER TABLE users ADD CONSTRAINT unique_email UNIQUE (email);

ALTER TABLE pokebox ADD CONSTRAINT user_id_fk FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE;