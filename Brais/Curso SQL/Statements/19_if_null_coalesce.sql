-- IFNULL checa si el valor es nulo y si lo es, le asigna un valor por defecto
SELECT 
    nombre,
    IFNULL (apellidos, 'No tiene apellidos') AS apellidos,
FROM 
    persona;


-- COALESCE checa el primer valor y si es nulo, pasa al siguiente valor 
SELECT
    nombre,
   COALESCE (ID_generente, Nombre 'Gerente') AS gerente_nuevo
FROM
    empleados;

-- busca si las ventas fueron mayor a 1300 para dar un bono
SELECT
    venta,
    venta_empleado,
if(venta>1300,"Bono","-") AS bono
FROM ventas;