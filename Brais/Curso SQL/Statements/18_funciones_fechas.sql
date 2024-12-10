SELECT NOW (); -- Devuelve la fecha y hora actual
SELECT CURDATE (); -- Devuelve la fecha actual
SELECT CURTIME (); -- Devuelve la hora actual
SELECT YEAR (NOW ()); -- Devuelve el año de la fecha actual
SELECT YEAR ('2020-01-01'); -- Devuelve el año de la fecha
SELECT MONTH (NOW ()); -- Devuelve el mes de la fecha actual
SELECT MONTH ('2020-01-01'); -- Devuelve el mes de la fecha
SELECT DAY (NOW ()); -- Devuelve el día de la fecha actual
SELECT DAY ('2020-01-01'); -- Devuelve el día de la fecha
SELECT HOUR (NOW ()); -- Devuelve la hora de la fecha actual
SELECT HOUR ('2020-01-01 12:00:00'); -- Devuelve la hora de la fecha
SELECT MINUTE (NOW ()); -- Devuelve los minutos de la fecha actual
SELECT MINUTE ('2020-01-01 12:00:00'); -- Devuelve los minutos de la fecha
SELECT SECOND (NOW ()); -- Devuelve los segundos de la fecha actual
SELECT SECOND ('2020-01-01 12:00:00'); -- Devuelve los segundos de la fecha
SELECT DAYNAME (NOW ()); -- Devuelve el nombre del día de la fecha actual
SELECT DAYNAME ('2020-01-01'); -- Devuelve el nombre del día de la fecha
SELECT MONTHNAME (NOW ()); -- Devuelve el nombre del mes de la fecha actual
SELECT MONTHNAME ('2020-01-01'); -- Devuelve el nombre del mes de la fecha
SELECT EXTRACT (YEAR FROM NOW ()); -- Devuelve el año de la fecha actual
SELECT EXTRACT (YEAR FROM '2020-01-01'); -- Devuelve el año de la fecha
-- EXTRACT FUNCIONA TAMBIEN PARA  AÑO,MES, DIA, HORA, MINUTO, SEGUNDO

