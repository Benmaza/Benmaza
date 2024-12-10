-- lista de empleados que no han realizado ninguna venta
SELECT *
FROM empleados e
LEFT JOIN ventas v
	ON v.venta_empleado = e.ID_empleado
WHERE v.ventas_id IS NULL;

