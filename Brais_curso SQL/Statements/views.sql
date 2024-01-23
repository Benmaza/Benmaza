--- Vistas
-- Una vista es una tabla virtual que se crea a partir de una consulta SQL.

CREATE VIEW ventas_empleados AS
SELECT
	l.letra_zona,
    l.telefono,
    v.venta,
    v.venta_empleado,
    e.nombre
FROM local l
LEFT JOIN ventas v
	ON l.ID_Local = v.ID_local
LEFT JOIN empleados e
	ON v.venta_empleado = e.ID_empleado;

--- esta tabla no existe en la base de datos, es una tabla virtual