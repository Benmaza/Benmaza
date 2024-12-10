-- como no existe un full joint se debe hacer con un union all
-- union all une las dos tablas y muestra todos los datos
-- union solo muestra los datos que no se repiten


SELECT users.user_id AS u_users_id, dni.user_id AS d_users_id
FROM users
LEFT JOIN dni
ON users.user_id = dni.user_id
UNION ALL
SELECT users.user_id AS u_users_id, dni.user_id AS d_users_id 
FROM users
RIGHT JOIN dni
ON users.user_id = dni.user_id
WHERE users.user_id is NULL;