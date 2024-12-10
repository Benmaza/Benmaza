-- usar el Union interna para unir dos tablas
SELECT *
FROM users
INNER JOIN dni;

-- uniendo dos tablas con el mismo nombre de columna
-- se puede usar el alias para diferenciarlas u y d
SELECT *
FROM users u
JOIN dni d
ON u.user_id = d.user_id;