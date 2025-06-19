--1. Vamos a seleccionar el nombre y apellido de los actores

SELECT
	first_name,
	last_name	
FROM actor;

--2. Vamos a seleccionar el nombre completo del actor en una sola columna

SELECT 
    CONCAT(first_name, ' ', last_name) AS nombre_completo
FROM 
    public.actor;

--3. Selecciona los actores que su nombre empieza con "D"

SELECT
	first_name,
	last_name	
FROM actor
WHERE first_name like 'D%';

--4. ¿Tenemos algún actor con el mismo nombre?

SELECT 
    first_name, 
    COUNT(*) AS cantidad
FROM 
    public.actor
GROUP BY 
    first_name
HAVING 
    COUNT(*) > 1;
	
--5. ¿Cuál es el costo máximo de renta de una película?

SELECT 
 MAX (amount)
FROM payment;

--6. ¿Cuáles son las peliculas que fueron rentadas con ese costo?	

SELECT 
    f.title AS pelicula, 
    p.amount AS costo, 
    r.rental_date AS fecha_renta
FROM 
    public.payment p
JOIN 
    public.rental r ON p.rental_id = r.rental_id
JOIN 
    public.inventory i ON r.inventory_id = i.inventory_id
JOIN 
    public.film f ON i.film_id = f.film_id
WHERE 
    p.amount = 11.99;

--7. ¿Cuantás películas hay por el tipo de audencia (rating)?

SELECT 
    rating, 
    COUNT(*) AS cantidad_peliculas
FROM 
    film
GROUP BY 
    rating
ORDER BY 
    cantidad_peliculas DESC;
	
--8. Selecciona las películas que no tienen un rating R o NC-17

SELECT 
   title,
   rating
FROM 
    film
WHERE
	rating NOT IN ('R', 'NC-17');
		
--9. ¿Cuantos clientes hay en cada tienda?

SELECT 
    store_id, 
    COUNT(*) AS cantidad_clientes_activos
FROM 
    public.customer
WHERE
 	active = 1
GROUP BY 
    store_id;

--10. ¿Cuál es la pelicula que mas veces se rento?

SELECT 
    f.title AS pelicula, 
    COUNT(r.rental_id) AS veces_rentada
FROM 
    public.rental r
JOIN 
    public.inventory i ON r.inventory_id = i.inventory_id
JOIN 
    public.film f ON i.film_id = f.film_id
GROUP BY 
    f.title
ORDER BY 
    veces_rentada DESC
LIMIT 1;
	
--11. ¿Qué peliculas no se han rentado?

SELECT 
    f.title AS pelicula
FROM 
    public.film f
LEFT JOIN 
    public.inventory i ON f.film_id = i.film_id
LEFT JOIN 
    public.rental r ON i.inventory_id = r.inventory_id
WHERE 
    r.rental_id IS NULL;	
	
--12. ¿Qué clientes no han rentado ninguna película?

SELECT 
    c.customer_id, 
    c.first_name, 
    c.last_name
FROM 
    public.customer c
WHERE 
    c.customer_id NOT IN (
        SELECT r.customer_id 
        FROM public.rental r
    );
	
--13. ¿Qué actores han actuado en más de 30 películas?

SELECT 
    a.actor_id, 
    a.first_name, 
    a.last_name, 
    COUNT(fa.film_id) AS cantidad_peliculas
FROM 
    public.actor a
JOIN 
    public.film_actor fa ON a.actor_id = fa.actor_id
GROUP BY 
    a.actor_id, 
    a.first_name, 
    a.last_name
HAVING 
    COUNT(fa.film_id) > 30
ORDER BY 
    cantidad_peliculas DESC;

--14. Muestra las ventas totales por tienda

SELECT 
    c.store_id, 
    SUM(p.amount) AS ventas_totales
FROM 
    public.payment p
JOIN 
    public.customer c ON p.customer_id = c.customer_id
GROUP BY 
    c.store_id
ORDER BY 
    ventas_totales DESC;
	

--15. Muestra los clientes que rentaron una pelicula más de una vez with a as 

WITH RentasPorCliente AS (
    SELECT 
        r.customer_id, 
        i.film_id, 
        COUNT(*) AS veces_rentada
    FROM 
        public.rental r
    JOIN 
        public.inventory i ON r.inventory_id = i.inventory_id
    GROUP BY 
        r.customer_id, i.film_id
    HAVING 
        COUNT(*) > 1
)
SELECT 
    c.customer_id, 
    c.first_name, 
    c.last_name, 
    f.title AS pelicula, 
    r.veces_rentada
FROM 
    RentasPorCliente r
JOIN 
    public.customer c ON r.customer_id = c.customer_id
JOIN 
    public.film f ON r.film_id = f.film_id
ORDER BY 
    r.veces_rentada DESC;

-------------------------
SELECT *
FROM actor;

SELECT *
FROM payment;

SELECT *
FROM film;

SELECT *
FROM store;

SELECT *
FROM customer;

SELECT *
FROM rental;