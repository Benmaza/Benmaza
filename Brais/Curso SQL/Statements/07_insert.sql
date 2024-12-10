-- copia todos los datos de la tabla ventas a la tabla archivo_ventas

INSERT INTO archivo_ventas
SELECT *
FROM ventas v
WHERE venta > 1000;
```