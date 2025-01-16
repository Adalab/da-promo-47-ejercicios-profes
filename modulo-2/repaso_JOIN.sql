# Repaso JOIN

# INNER JOIN
/* Unimos dos tablas que tienen una columna en común (aunque no se llame igual)
Solo nos muestra los registros en común
FROM tabla INNER JOIN tabla 2 ON tabla1.columna1 = tabla2.columna2

Tenemos las tablas film, film category y category en sakila
Quiero una tabla que me diga el id de la película, su titulo y el nombre de su categoría, solo de los resultados en común */
USE sakila;

SELECT
* FROM film;

SELECT *
FROM film_category;

SELECT *
FROM category;

SELECT f.film_id, f.title, c.name
FROM film f
INNER JOIN film_category fc
ON f.film_id = fc.film_id
INNER JOIN category c
ON fc.category_id = c.category_id
WHERE c.name NOT IN ('Action', 'Children');




/* Con Northwind, quiero una tabla donde tenga el nombre de los clientes y el número total de pedidos realizados,
pero solo quiero ver los que han hecho más de 10 pedidos y solo los clientes que hayan hecho pedidos*/

USE Northwind;

SELECT *
FROM customers;

SELECT *
FROM orders;

SELECT c.companyname, COUNT(DISTINCT o.orderid) AS pedidos_totales, c.city
FROM customers c
INNER JOIN orders o
ON c.customerid = o.customerid
WHERE c.city NOT IN ('Madrid', 'London')
GROUP BY c.companyname
HAVING pedidos_totales > 10
ORDER BY pedidos_totales ASC;