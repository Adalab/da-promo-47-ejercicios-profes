/* LECCIÓN SUBCONSULTAS

-Subconsulta: consulta dentro de otra consulta
-Se usan cuando necesitamos datos adicionales de otra tabla
-Normalmente, la subconsultas simples da como resultado una única columna

-- =/IN/NOT IN: para seleccionar entre varios valores que devuelve la subconsulta
-- ANY/ALL (comparación): Para comparar, normalmente datos numéricos
-- EXISTS (existencia): Para verificar si algo existe en el resultado de una subconsulta
*/


select * from employees; 

select * from offices; 

-- cual son los empleados que trabajan en boston 

select * from offices where city = "Boston"; 

select * from employees where office_code = 2; 

select * 
from employees 
where office_code = (select office_code 
					from offices 
                    where city = "Boston"); 


-- cual son los empleados que trabajan en USA

select office_code from offices where country = "USA"; 

select * 
from employees 
where office_code IN (select office_code 
					from offices 
                    where country = "USA"); 
                    
-- COMPARACION ANY/ALL 
-- El operador ANY se utiliza cuando deseas verificar si una condición es verdadera 
-- para al menos uno de los valores devueltos por la subquery. 
-- Es equivalente a usar "alguno" o "cualquiera" en lenguaje natural.
-- Se utiliza con =, >, <, >=, <=, !=
-- Se suele utilizar para comparar valores numéricos, por ejemplo, "muestrame los valores que sean mayor a cualquiera de las duraciones de las películas de 2020" >ANY(SELECT)

use sakila; 

-- seleciona las peliculas que duran más que las peliculas de categoria "PG"
select length
from film
where rating = "PG"; 

select title, length
from film
where length > ANY (select length
				from film
				where rating = "PG"); 



-- EXIST
-- El operador EXISTS en SQL se utiliza para verificar si una subquery devuelve 
-- al menos una fila. Es útil cuando no necesitas obtener datos específicos de la subquery, 
-- sino simplemente comprobar si el conjunto de resultados existe o no. 
-- Si la subquery devuelve al menos una fila, EXISTS evalúa como TRUE. Si no devuelve filas, se evalúa como FALSE.

-- encuentra las categorias que tienen al menos una pelicula asociada

select * from film_category; 

select * from category; 

select name
from category
where EXISTS (select * 
			 from film_category
             where film_category.category_id = category.category_id); 
             
             
-- consulta relacionada  
--  Encuentra Clientes con Pedidos en 2024 pero no en 2023

select c.nombre as cliente
from usuarios c 
where EXISTS ( select * 
				from pedidos 
                where c.id_usuario = p.id_usuario and YEAR(p.fecha_pedido) = 2024) 
AND NOT exists (select * 
				from pedidos 
                where c.id_usuario = p.id_usuario and YEAR(p.fecha_pedido) = 2023); 

SELECT DISTINCT c.nombre AS cliente
FROM usuarios c
LEFT JOIN pedidos p_2024 ON c.id_usuario = p_2024.id_usuario AND YEAR(p_2024.fecha_pedido) = 2024
LEFT JOIN pedidos p_2023 ON c.id_usuario = p_2023.id_usuario AND YEAR(p_2023.fecha_pedido) = 2023
WHERE p_2024.id_pedido IS NOT NULL AND p_2023.id_pedido IS NULL;


-- Calcula el numero de clientes por cada ciudad.
use tienda; 
SELECT city, COUNT(customer_number) AS num_clientes
	FROM customers
	GROUP BY city;

-- Usando la consulta anterior como subconsulta, selecciona la ciudad con el mayor numero de clientes.
SELECT city, COUNT(customer_number) AS num_clientes
	FROM customers
	GROUP BY city
    HAVING num_clientes >= ALL(SELECT COUNT(customer_number) AS num_clientes
								FROM customers
								GROUP BY city);




                    





