/*

1️. Obtener el id, título y año de estreno de todas las películas.

2. Obtener todo el contenido de la tabla "countries".

3. Obtener el nombre y fecha de nacimiento todas las personas almacenada en la tabla "people".

4. Obtener todos los géneros de películas disponibles en la tabla "genres".

5. ️Obtener el nombre, cantidad de espectadores y recaudación de todas las películas.

6. Obtener el nombre de los estudios cinematográficos almacenados en la tabla "studios".

*/ 

-- Soluciones

-- 1. 
SELECT movie_id, title, release_year FROM movies;

-- 2. 
SELECT * FROM countries;

-- 3. 
SELECT name, birth_date FROM people;

-- 4. 
SELECT genre_name FROM genres;

-- 5. 
SELECT title, total_viewers, total_revenue FROM movies;

-- 6. 
SELECT studio_name FROM studios;