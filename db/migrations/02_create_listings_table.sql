-- CREATE TABLE listing (id SERIAL PRIMARY KEY, name  VARCHAR(60), price NUMERIC, description VARCHAR(200));
-- ALTER TABLE listing ADD COLUMN user_id INT;
-- ALTER TABLE listing ADD CONSTRAINT user_id FOREIGN KEY (user_id )REFERENCES users (id);

CREATE TABLE listing (listing_id SERIAL PRIMARY KEY, name VARCHAR(30), description VARCHAR(250), price DECIMAL(5,2), user_id INTEGER, FOREIGN KEY(user_id) REFERENCES users (user_id) ON DELETE CASCADE);