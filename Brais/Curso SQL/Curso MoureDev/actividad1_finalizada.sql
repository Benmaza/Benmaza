/*

1️. Obtener el id, título y año de estreno de todas las películas.

2. Obtener todo el contenido de la tabla "countries".

3. Obtener el nombre y fecha de nacimiento todas las personas almacenada en la tabla "people".

4. Obtener todos los géneros de películas disponibles en la tabla "genres".

5. ️Obtener el nombre, cantidad de espectadores y recaudación de todas las películas.

6. Obtener el nombre de los estudios cinematográficos almacenados en la tabla "studios".

*/ 

SELECT * FROM movies;
SELECT movie_id, title, release_year FROM movies;

SELECT * FROM countries;

SELECT * FROM people;
SELECT name, birth_date FROM people;

SELECT genres FROM genres;

SELECT title, total_viewers, total_revenue FROM movies;

SELECT studio_name FROM studios;



