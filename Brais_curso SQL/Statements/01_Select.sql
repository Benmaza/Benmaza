-- Seleccionar todos los datos de la tabla users
SELECT *
FROM users;

-- seleciona todos los datos de la tabla productos 
SELECT *
FROM productos p
CROSS JOIN ingredientes i;

-- Usando JOIN unir tres bases de datos diferentes para conseguir la información que busco
Se usa v , l, e para definir nombres de las bases de datos y ahorrar código 

SELECT 
	v.ventas_id, v.Fecha, l.Direccion, v.clave_producto, e.Nombre, e.Apellido
FROM ventas v
JOIN local l 
	ON v.ID_local = l.ID_Local
JOIN empleados e
	ON v.venta_empleado = e.ID_empleado;

#subconsulta para seleccionar los datos de la tabla empleados que sean mayores 
#que la media de edad de los empleados
SELECT *
FROM empleados
WHERE edad >
	(SELECT
		AVG(edad)
	FROM empleados);

-- contar el número de empleados que hay en la tabla empleados
SELECT COUNT(DISTINCT ID_empleado) AS empleados_diferentes
FROM empleados;

-- lista de empleados que han realizado alguna venta
SELECT *
FROM empleados
WHERE ID_empleado IN(
	SELECT DISTINCT venta_empleado
    FROM ventas);