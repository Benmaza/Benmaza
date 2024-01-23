SELECT UPPER('hola mundo'); -- Convierte a mayúsculas
SELECT LOWER('HOLA MUNDO'); -- Convierte a minúsculas
SELECT LTRIM('   Hola mundo'); -- Elimina espacios a la izquierda
SELECT RTRIM('Hola mundo   '); -- Elimina espacios a la derecha
SELECT LEFT('Hola mundo', 4); -- Devuelve los primeros 4 caracteres
SELECT RIGHT('Hola mundo', 4); -- Devuelve los últimos 4 caracteres
SELECT LENGTH('Hola mundo'); -- Devuelve la longitud de la cadena
SELECT SUBSTRING('Hola mundo', 6, 5); -- Devuelve una subcadena
SELECT POSITION('mundo' IN 'Hola mundo'); -- Devuelve la posición de la subcadena
SELECT LOCATE('mundo', 'Hola mundo'); -- Devuelve la posición de la subcadena
SELECT CONCAT('Hola', ' ', 'mundo'); -- Concatena cadenas
SELECT REPLACE('Hola mundo', 'mundo', 'amigos'); -- Reemplaza una subcadena