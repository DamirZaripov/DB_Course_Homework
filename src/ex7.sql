--1 запрос
SELECT * FROM producers WHERE producers.best_movie_id <> 0 AND producers.best_movie_id = movies.id AND movies.creation_date = CURRENT_DATE - 17;

--2 запрос 
SELECT * FROM producers WHERE producers.movie_count > 5;

--3 запрос
SELECT id FROM movies DISTINCT ON (title) WHERE COUNT(DISTINCT actor_surname) > 10;

--4 запрос
ALTER TABLE movies ADD COLUMN rating INTEGER;
SELECT * FROM movies WHERE rating > 50 AND country = 'UK' LIMIT 10;

--5 запрос
SELECT * FROM genres, movies, actors WHERE genres.type = 'Scare Film' AND movies.genre_id = genres.id AND actors.motherland = 'UK';