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

--- en un tabla de ventas, entregar bono
SELECT *,
	CASE
		WHEN venta > 1300 THEN "Bono Max"
        WHEN venta > 1000 THEN "Bono Reg"
        WHEN venta > 500 THEN "Bono Min"
        ELSE "Mejorar"
	END AS Bono
FROM ventas;