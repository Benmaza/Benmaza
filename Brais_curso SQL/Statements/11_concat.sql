-- unir dos columnas en una sola y nombrarla
SELECT CONCAT(name,' ',surname) AS Nombre_completo
FROM users;

-- unir dos columnas en una sola y nombrarla con un texto adicional
SELECT CONCAT('Nombre :',name,' ' ,'Apellido: ',surname) AS Nombre_completo
FROM users;

