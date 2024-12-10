-- ordenar por edad y que la edad sea mayor que 19
SELECT * 
FROM users	HAVING age >19;

-- ordenar usarndo la funcion count 
SELECT COUNT(age)
FROM users	HAVING COUNT(age) >2;