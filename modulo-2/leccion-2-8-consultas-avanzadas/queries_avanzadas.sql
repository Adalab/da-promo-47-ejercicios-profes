/* Hasta ahora hemos...

-Creado tablas
-Insertado datos
-Actualizado
-Eliminado
-Seleccionado
-Filtros con WHERE


Ahora veremos:
-Funciones agregadas (funciones que nos permiten hacer cálculos en nuestros datos): SUM, AVG, COUNT, MAX, MIN
-Funciones para organizar y filtrar nuestros datos: GROUP BY, HAVING, CASE
--MIN/MAX: Para sacar el valor mínimo o máximo de una columna

SELECT MIN(columna)
FROM tabla;

SELECT MAX(columna)
FROM tabla;

--SUM: Para sacar la suma de todos los valores de una categoría

SELECT SUM(columna)
FROM tabla;

--AVG: Para obtener la media de todos los valores de una categoría

SELECT AVG(columna)
FROM tabla;

--COUNT: Para contar los registros de esa columna

SELECT COUNT(columna)
FROM tabla;
*/

USE tienda;

SELECT *
FROM tienda.payments; 

SELECT MIN(amount) as factura_minima
FROM payments; 

SELECT MAX(amount) as factura_maxima
FROM payments; 

SELECT  MIN(amount) as factura_minima,  
MAX(amount) as factura_maxima, 
AVG(amount) as factura_pormedio,
COUNT(amount) as cantidad_de_facturas,
SUM(amount) as total_facturas
FROM payments; 

SELECT COUNT(customer_number) as cant_clientes
FROM customers; 

SELECT COUNT( DISTINCT customer_number) as cant_clientes
FROM customers; 

SELECT COUNT(DISTINCT amount) as cantidad_de_facturas
FROM payments; 



-- GROUP BY 
-- ¿Quiero saber cuantas personas hay por puesto de trabajo?

SELECT  job_title as puesto_trabajo, COUNT(employee_number) as numero_empleados
FROM employees
GROUP BY job_title;

use tienda;
select * FROM customers;

-- obtener el numero de clientes que hay por representante de ventas
SELECT sales_rep_employee_number, COUNT(DISTINCT customer_number) as cantidad_clientes
FROM customers
WHERE sales_rep_employee_number IS NOT NULL
GROUP BY sales_rep_employee_number
order by cantidad_clientes ASC; 


-- HAVING: FILTRA DESPUES DE AGRUPAR
-- obtener el numero de clientes que hay por representante de ventas pero que solo tengan mas de 6 clientes
SELECT sales_rep_employee_number, COUNT(DISTINCT customer_number) as cantidad_clientes
FROM customers
WHERE sales_rep_employee_number IS NOT NULL
GROUP BY sales_rep_employee_number
HAVING cantidad_clientes > 6
order by cantidad_clientes ASC; 

-- ORDEN DE LAS CONSULTAS
/*
SELECT
FROM 
WHERE
GROUP BY
HAVING 
ORDER BY
LIMIT
*/

-- vamos a ver otro ejemplo de having 
select city , state, count(distinct customer_number) as cant_clientes
from customers
where state IS NOT NULL 
group by city, state
having cant_clientes > 1 
order by cant_clientes desc
limit 3; 

-- CASE: usar condicional(if then) dentro SQL
select * FROM payments;

SELECT customer_number, amount,
CASE
	WHEN amount > 30000 THEN "Factura alta"
    WHEN amount <10000 THEN "Factura baja"
    ELSE "Factura media"
    END AS TipoFactura
FROM payments
ORDER BY amount; 

 



















 











