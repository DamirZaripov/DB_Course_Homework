--Действия пользователя film_user

CREATE SEQUENCE movie_id_seq INCREMENT 1;

ALTER TABLE movies ADD COLUMN id INTEGER DEFAULT nextval('movie_id_seq');

ALTER TABLE movies DROP CONSTRAINT movie_pk;

ALTER TABLE movies ADD CONSTRAINT movie_pk PRIMARY KEY(id, title, year);

ALTER TABLE movies ALTER country SET DEFAULT 'UK';

ALTER TABLE actors DROP CONSTRAINT actors_number_of_movies_check;

ALTER TABLE movies ADD CONSTRAINT minimum_budget CHECK(budget > 1000);

ALTER TABLE movies DROP COLUMN genres;

CREATE TABLE genres(
	id SERIAL PRIMARY KEY,
	type VARCHAR(20)
);

ALTER TABLE movies ADD genre_id INTEGER REFERENCES genres(id);

CREATE TYPE BIRTH_COUNTRY AS ENUM('USA', 'UK', 'Russia', 'France', 'Germany');

ALTER TABLE actors DROP motherland;
ALTER TABLE producers DROP motherland;

ALTER TABLE actors ADD motherland BIRTH_COUNTRY;
ALTER TABLE producers ADD motherland BIRTH_COUNTRY;

ALTER TABLE actors ADD CONSTRAINT check_date CHECK (birthday <= CURRENT_DATE);
ALTER TABLE producers ADD CONSTRAINT check_date CHECK (birthday <= CURRENT_DATE);

CREATE INDEX ON actors(name, surname);

UPDATE movies SET title = concat(title, '(', year, ')');