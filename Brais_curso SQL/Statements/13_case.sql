-- encontrar el nombre de los usuarios que tienen mas de 17 años
-- si se cumple la condicion se muestra el texto 'Es mayor de edad'
-- si no se cumple la condicion se muestra el texto 'Es menor de edad'
SELECT *,
CASE 
	WHEN age > 17 THEN 'Es mayor de edad'
    ELSE 'Es menor de edad'
    END AS agetext
FROM users
ORDER BY age ASC;

-- encontrar el nombre de los usuarios que tienen mas de 17 años
-- si se cumple la condicion se muestra el texto 'TRUE'
-- si no se cumple la condicion se muestra el texto 'FALSE'
SELECT *,
CASE 
	WHEN age > 17 THEN 'TRUE'
    ELSE 'FALSE'
    END AS '¿Es mayor de edad?'
FROM users
ORDER BY age ASC;