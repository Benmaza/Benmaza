-- agregar un nuevo usuario
INSERT INTO users (user_id, name , surname) 
VALUES (07, 'Ely', 'Mendez');

-- actualizar la edad y el email del usuario con id 07
UPDATE users
SET age = '21', email = 'elymendez@gmail.com'
WHERE user_id = 07;