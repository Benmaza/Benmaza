-- Crear Base de Datos
CREATE DATABASE cineDB;
USE cineDB;

-- Crear tabla de estudios cinematográficos
CREATE TABLE studios (
    studio_id INT PRIMARY KEY AUTO_INCREMENT,
    studio_name VARCHAR(100) NOT NULL,
    UNIQUE KEY studio_name (studio_name)
);

-- Crear tabla de géneros
CREATE TABLE genres (
    genre_id INT PRIMARY KEY AUTO_INCREMENT,
    genre_name VARCHAR(50) NOT NULL,
    UNIQUE KEY genre_name (genre_name)
);

-- Crear tabla de países
CREATE TABLE countries (
    country_id INT PRIMARY KEY AUTO_INCREMENT,
    country_name VARCHAR(50) NOT NULL
);

-- Crear tabla de personas
CREATE TABLE people (
    people_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    birth_date DATE,
    country_of_birth_id INT,
    category VARCHAR(50) NOT NULL,
    UNIQUE KEY people_name (name),
    FOREIGN KEY (country_of_birth_id) REFERENCES Countries(country_id)
);

-- Crear tabla de películas
CREATE TABLE movies (
    movie_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    release_year INT,
    director_id INT,
    studio_id INT,
    total_viewers BIGINT,
    total_revenue DECIMAL(15,2),
    UNIQUE KEY movie_title (title),
    FOREIGN KEY (director_id) REFERENCES people(people_id)
);

-- Crear tabla relación entre las películas y los actores
CREATE TABLE movie_actor (
    movie_id INT,
    actor_id INT,
    PRIMARY KEY (movie_id, actor_id),
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
    FOREIGN KEY (actor_id) REFERENCES people(people_id)
);

-- Crear tabla relación entre las películas y los géneros
CREATE TABLE movie_genre (
    movie_id INT,
    genre_id INT,
    PRIMARY KEY (movie_id, genre_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (genre_id) REFERENCES Genres(genre_id)
);

-- Insertar países
INSERT INTO countries (country_name) VALUES 
('Alemania'),
('Australia'),
('Austria'),
('Canadá'),
('Cuba'),
('Dinamarca'),
('Estados Unidos'),
('Irlanda'),
('Líbano'),
('México'),
('Nigeria'),
('Nueva Zelanda'),
('Puerto Rico'),
('Reino Unido');

-- Insertar géneros
INSERT INTO genres (genre_name) VALUES 
('Ciencia Ficción'),
('Acción'),
('Drama'),
('Aventura'),
('Romance'),
('Terror'),
('Fantasía'),
('Comedia'),
('Suspenso'),
('Animación');

--  Insertar estudios
INSERT INTO studios (studio_name) VALUES 
('Warner Bros'),
('Columbia Pictures'),
('Netflix Originals'),
('Universal Studios'),
('Paramount Pictures'),
('20th Century Fox'),
('Fox Searchlight'),
('Marvel Studios'),
('DreamWorks Pictures'),
('Miramax Films');

-- Insertar actores y directores
INSERT INTO people (name, birth_date, country_of_birth_id, category) VALUES 
('Aaron Eckhart', '1968-03-12', 7, 'Actor'),
('Al Pacino', '1940-04-25', 7, 'Actor'),
('Alan Arkin', '1934-03-26', 7, 'Actor'),
('America Ferrera', '1984-04-18', 7, 'Actor'),
('Ana de Armas', null, null, 'Actor'),  
('Anne Hathaway', '1982-11-12', 7, 'Actor'),
('Ben Kingsley', '1943-12-31', 14, 'Actor'),
('Billy Zane', '1966-02-24', 7, 'Actor'),
('Brad Pitt', '1963-12-18', 7, 'Actor'),
('Bruce Willis', '1955-03-19', 1, 'Actor'),
('Carrie-Anne Moss', '1967-08-21', 4, 'Actor'),
('Christian Bale', '1974-01-30', 14, 'Actor'),
('Christoph Waltz', '1956-10-04', 3, 'Actor'),
('Connie Nielsen', '1965-07-03', 6, 'Actor'),
('Dianne Wiest', '1948-03-28', null, 'Actor'),
('Edward Norton', '1969-08-18', null, 'Actor'),
('Embeth Davidtz', '1965-08-11', 7, 'Actor'),
('Harrison Ford', '1942-07-13', 7, 'Actor'),
('Heath Ledger', '1979-04-04', 2, 'Actor'),
('Helena Bonham Carter', '1966-05-26', 14, 'Actor'),
('Hugo Weaving', '1960-04-04', 11, 'Actor'),
('Ian Holm', '1931-09-12', 14, 'Actor'),
('James Caan', '1940-03-26', 7, 'Actor'),
('Jamie Foxx', '1967-12-13', 7, 'Actor'),
('Jared Leto', '1971-12-26', 7, 'Actor'),
('Jeff Goldblum', '1952-10-22', 7, 'Actor'),
('Joaquin Phoenix', '1974-10-28', 13, 'Actor'),
('Joe Pesci', '1943-02-09', 7, 'Actor'),
('John Travolta', null, 7, 'Actor'),  
('Johnny Depp', '1963-06-09', 7, 'Actor'),
('Joseph Gordon-Levitt', '1981-02-17', 7, 'Actor'),
('Kate Winslet', '1975-10-05', 14, 'Actor'),
('Kathy Bates', '1948-06-28', 7, 'Actor'),
('Keanu Reeves', '1964-09-02', 9, 'Actor'),
('Laura Dern', '1967-02-10', 7, 'Actor'),
('Laurence Fishburne', '1961-07-30', 7, 'Actor'),
('Leonardo DiCaprio', '1974-11-11', 7, 'Actor'),
('Liam Neeson', '1952-06-07', 8, 'Actor'),
('Margot Robbie', '1990-07-02', 2, 'Actor'),
('Marlon Brando', '1924-04-03', 7, 'Actor'),
('Matthew McConaughey', '1969-11-04', 7, 'Actor'),
('Meat Loaf', '1947-09-27', 7, 'Actor'),
('Michael Caine', '1933-03-14', 14, 'Actor'),
('Michael Shannon', '1974-08-07', 7, 'Actor'),
('Octavia Spencer', '1972-05-25', 7, 'Actor'),
('Oliver Reed', '1938-02-13', 14, 'Actor'),
('Ralph Fiennes', '1962-12-22', 14, 'Actor'),
('Robert De Niro', '1943-08-17', 7, 'Actor'),
('Russell Crowe', '1964-04-07', 12, 'Actor'),
('Ryan Gosling', '1980-11-12', 4, 'Actor'),
('Sally Hawkins', '1976-04-27', 14, 'Actor'),
('Sam Neill', '1947-09-14', 12, 'Actor'),
('Samuel L. Jackson', '1948-12-21', 7, 'Actor'),
('Sigourney Weaver', '1949-10-08', 7, 'Actor'),
('Simu Liu', null, null, 'Actor'),  
('Tom Hardy', '1977-09-15', 14, 'Actor'),
('Uma Thurman', '1970-04-29', 7, 'Actor'),
('Winona Ryder', '1971-10-29', 7, 'Actor'),
('Christopher Nolan', '1970-07-30', 14, 'Director'),
('Quentin Tarantino', '1963-03-27', 7, 'Director'),
('Martin Scorsese', '1942-11-17', 7, 'Director'),
('Denis Villeneuve', '1967-10-03', 4, 'Director'),
('Steven Spielberg', '1946-12-18', null, 'Director'),
('James Cameron', '1954-08-16', 4, 'Director'),
('Ridley Scott', '1937-11-30', 14, 'Director'),
('Tim Burton', '1958-08-25', 7, 'Director'),
('Guillermo del Toro', '1964-10-09', 10, 'Director'),
('Greta Gerwig', '1983-08-04', 7, 'Director'),
('David Fincher', '1962-08-28', null, 'Director'),
('Francis Ford Coppola', '1939-04-07', 7, 'Director'),
('Lana Wachowski', '1965-06-21', 7, 'Director'),
('Anthony Russo', '1970-02-03', 7, 'Director'),
('Joe Russo', '1971-07-18', null, 'Director');

-- Insertar películas
INSERT INTO movies (title, release_year, director_id, studio_id, total_viewers, total_revenue) VALUES 
('Inception', 2010, 59, 1, 70000000, 829895144),
('Django Unchained', 2012, 60, 2, null, null), 
('The Irishman', 2019, 61, null, 10000000, 85000000), 
('Blade Runner 2049', 2017, 62, 1, 35000000, 260500000), 
('Jurassic Park', 1993, 63, 4, 85000000, 1035000000),
('Titanic', 1997, 64, 5, 125000000, 2200000000),
('Alien', 1979, null, 6, 20000000, 104931801), 
('Edward Scissorhands', 1990, 66, 6, 25000000, 86000000),
('The Shape of Water', 2017, 67, null, 18000000, 195243062),  
('Barbie', 2023, 68, 1, 145000000, 1449000000),
('The Dark Knight', 2008, 59, null, 85000000, 1004558444), 
('Pulp Fiction', 1994, 60, null, 22000000, 213928762), 
('The Godfather', 1972, 70, null, null, 250000000), 
('Interstellar', 2014, 59, null, 45000000, null), 
('Fight Club', 1999, 69, 6, null, 101209000), 
('Gladiator', 2000, 65, 4, 65000000, 503000000),
('Schindler’s List', null, null, null, 21000000, 322000000), 
('The Matrix', 1999, 71, 1, 60000000, 466621824);

-- Insertar Relación Películas-Actores
INSERT INTO movie_actor (movie_id, actor_id) VALUES 
(1, 37), (1, 56), (1, 31),  
(2, 24), (2, 13), (2, 53), (2, 37),  
(3, 48), (3, 2), (3, 28),  
(4, 50), (4, 18), (4, 5), (4, 25),  
(5, 52), (5, 35), (5, 26),  
(6, 37), (6, 32), (6, 8), (6, 33),  
(7, 54), (7, 22),  
(8, 30), (8, 58), (8, 15), (8, 3),  
(10, 39), (10, 50), (10, 55), (10, 4),  
(12, 29), (12, 57), (12, 53), (12, 10),  
(13, 40), (13, 2), (13, 23),  
(15, 9), (15, 16), (15, 20), (15, 42),  
(16, 49), (16, 27), (16, 14), (16, 46),  
(17, 38), (17, 7), (17, 47), (17, 17),  
(18, 34), (18, 36), (18, 11), (18, 21);  

-- Insertar relación películas-géneros
INSERT INTO movie_genre (movie_id, genre_id) VALUES 
(1, 1), (1, 2), (1, 9),  
(2, 2), (2, 3), 
(3, 3), 
(4, 1), (4, 9), 
(5, 4), (5, 3), 
(6, 5), (6, 3), 
(7, 6), (7, 9), 
(10, 8), (10, 5), (10, 10), 
(11, 2), (11, 9), 
(12, 2), (12, 3), (12, 8), 
(13, 3), (13, 8), 
(15, 3), (15, 9), 
(16, 2), (16, 4), 
(17, 3), (17, 9), 
(18, 1), (18, 2);
