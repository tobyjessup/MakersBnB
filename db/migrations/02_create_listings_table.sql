CREATE TABLE listing (id SERIAL PRIMARY KEY, name  VARCHAR(60), price NUMERIC, description VARCHAR(200));
ALTER TABLE listing ADD COLUMN user_id INT;
ALTER TABLE listing ADD CONSTRAINT user_id FOREIGN KEY (user_id )REFERENCES users (id);