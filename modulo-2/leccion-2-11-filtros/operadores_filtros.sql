-- Hoy vamos a ver operadores especiales de filtro: para ayudarnos a buscar y fistrar datos
-- de manera más eficiente. Veremos:


-- UNION / UNION ALL
-- IN/ NOT IN
-- LIKE/NOT LIKE
-- REGEX

-- UNION /UNION ALL 

-- UNION: sirve para unir el resultado de una o mas consultas en una tabla
	-- Elimina los duplicados
    -- Debemos el misma cantidad de columnas
    -- las columnas deben ser del mismo tipo

-- Tenemos dos tablas:

-- Tabla ventas_2023
/*id_venta  fecha        cantidad
1         2023-01-15    2000
2         2023-05-15    5000
3         2024-09-30    4000

-- Tabla ventas_2024
id_venta   fecha       cantidad
11          2024-01-15  1000
12          2024-05-15  8000
13          2024-10-01  5000

-- Resultado
id_venta  fecha        cantidad
1         2023-01-15    2000
2         2023-05-15    5000
3         2024-09-30    4000
11         2024-01-15    1000
12         2024-05-15    8000
13         2024-10-01    5000*/


use sakila; 

select first_name as nombre, last_name as apellidos
from customer
UNION ALL
select first_name, last_name
from actor
order by apellidos;

-- IN / NOT IN 
-- SE USA en el WHERE, me permite una condición de "si está en el listado"
select first_name as nombre, last_name as apellidos
from customer
WHERE first_name IN ('Mary', 'Linda', 'Rafael'); -- no es case sentitive

select first_name as nombre, last_name as apellidos, customer_id as idcliente
from customer
WHERE customer_id IN (23, 45, 68); -- **Hay que usar el nombre de la columna

select first_name as nombre, last_name as apellidos, customer_id as idcliente
from customer
WHERE customer_id NOT IN (23, 45, 68); -- **Hay que usar el nombre de la columna

-- LIKE, NOT LIKE
-- buscar patrones dentro de las columnas de las tblas
-- COMODINES
-- % --> cero o más caracteres. Patron: navid%: buscamos algoq ue empiece por navid, pero me da igaul lo que venga detras
		-- A%: comience en una A
        -- %A: termine en una A
        -- %A%: que contenga una A
-- _: solo un caracter, no es case sensitive 
		-- C_: empiece por C y solo tenga un caracter
        -- C__: empiece por C y solo tenga dos caracter
        -- C_%: dos caracteres y luego los que sean
        -- _C_ : que contenga la C 
        -- _C: contenga un caracter y luego la C  
        
-- Quiero los resultados de los nombres que empiecen por J
select first_name as nombre, last_name as apellidos, customer_id as idcliente
from customer
WHERE first_name LIKE 'J%';

SELECT 
    film_id, 
    title
FROM film
WHERE title LIKE 'D___%';

SELECT 
    address_id, 
    address
FROM address
WHERE address NOT LIKE '%123%';


select first_name, last_name
from actor
where last_name LIKE 'GUI%'
	OR last_name LIKE '%S'; 
 
 
 -- regex
 --  nos permite buscar ptarones más complejos, se utilizan las reglas de regex y no es case sensitive
 
 -- Operadores especiales
 
 -- ^: indica que el patrón está al inicio de la cadena
 -- $: indica que el patrón está al final de la cadena
 -- []: indica un rango de caracteres, [a-z], [0-9]
 -- .: indica que puede ser cualquier caracter
 -- |: indica un patrón u otro
 -- *: cero o mas caracteres
 -- +: uno o mas caracteres
 -- (): grupo de caracteres
 -- {}: rango de caracteres


-- PELICULAS QUE CONTENGAN en su titulo una de las siguienets palabras: STAR, SUN, MOON
SELECT 
    film_id, 
    title
FROM film
WHERE title REGEXP 'Star|Sun|Moon'; 

SELECT 
    film_id, 
    title
FROM film
WHERE title = "Star" or title = "Sun" or "Moon"; 

 


SELECT 
    film_id, 
    title
FROM film
WHERE title REGEXP '^[Z|H]';


SELECT 
    actor_id, 
    first_name, 
    last_name
FROM actor
WHERE last_name REGEXP 'son$';


SELECT 
    film_id, 
    title
FROM film
WHERE title REGEXP '^.{10}$'; -- exactamente 

 
SELECT 
    actor_id, 
    first_name, 
    last_name
FROM actor
WHERE last_name REGEXP '^[a-z]';

 -- ^: indica que el patrón está al inicio de la cadena
 -- $: indica que el patrón está al final de la cadena
 -- []: indica un rango de caracteres, [a-z], [0-9]
 -- .: indica que puede ser cualquier caracter
 -- |: indica un patrón u otro
 -- *: cero o mas caracteres
 -- +: uno o mas caracteres
 -- (): grupo de caracteres
 -- {}: rango de caracteres, cantidad
 
 
 SELECT *
FROM empleadas
WHERE email REGEXP '@gmail\\.com'; -- @gmail1com, @gmailZcom; 

SELECT email
FROM customer
where email REGEXP '@sakilacustomer\\.org';






 
 
 








































