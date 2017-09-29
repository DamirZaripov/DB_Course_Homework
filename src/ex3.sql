--Действия пользователя postgres
CREATE USER film_user WITH CREATEDB LOGIN PASSWORD 'film_pass';
CREATE DATABASE film_history;

ALTER DATABASE film_history OWNER TO film_user;
GRANT ALL PRIVILEGES ON DATABASE film_history TO film_user;

--Действия пользователя film_user
CREATE TABLE movies(
	title VARCHAR(30) NOT NULL, 
	description TEXT NOT NULL, 
	year SMALLINT NOT NULL CHECK(year > 1900 AND year < 2027), 
	genres TEXT NOT NULL, 
	country VARCHAR(100) NOT NULL, 
	budget INTEGER NOT NULL CHECK(budget > 10000), 
	CONSTRAINT movie_pk PRIMARY KEY (title, year)
);

CREATE SEQUENCE actor_id_seq INCREMENT 1;

CREATE TABLE actors(
	id INTEGER DEFAULT nextval('actor_id_seq'), 
	surname VARCHAR(150) UNIQUE NOT NULL, 
	name VARCHAR(150) UNIQUE NOT NULL, 
	birthday DATE UNIQUE NOT NULL, 
	motherland VARCHAR(150) NOT NULL, 
	number_of_movies SMALLINT NOT NULL CHECK(number_of_movies > 5) 
);

CREATE SEQUENCE producer_id_seq INCREMENT 1;

CREATE TABLE producers(
	id INTEGER DEFAULT nextval('producer_id_seq'), 
	surname VARCHAR(150) NOT NULL,
	name VARCHAR(150) NOT NULL,
	birthday DATE NOT NULL,
	motherland VARCHAR(100) NOT NULL DEFAULT 'USA'
);