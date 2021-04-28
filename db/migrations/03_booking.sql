CREATE TABLE booking (id SERIAL PRIMARY KEY, date VARCHAR(60) availabilty BOOLEAN);
ALTER TABLE booking ADD COLUMN user_id INT;
ALTER TABLE booking ADD COLUMN space_id INT;
ALTER TABLE booking ADD CONSTRAINT user_id FOREIGN KEY (user_id )REFERENCES users (id);
ALTER TABLE booking ADD CONSTRAINT space_id FOREIGN KEY (space_id )REFERENCES listing (id);
