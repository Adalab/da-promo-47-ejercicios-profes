/* Hoy vamos a ver cómo UNIR TABLAS

Para unir tablas utilizamos la palabra clave JOIN
y hoy veremos tres tipos de JOIN

-- CROSS JOIN: Combina cada fila de una tabla con todas las filas de la otra

Ej:
Tengo una tabla llamada amigas con las columnas

nombre  apellido
Ana     Martín
Juana   Cuevas
Lucía	Sánchez

Tengo otra tabla llamada hobbies con las columnas

hobbie              lugar
juegos de mesa      Sevilla
escape rooms        Madrid
ir al cine          Galicia
*/ 
Si hago un CROSS JOIN lo que hago es que veo todas las posibilidades de unir la primera tabla con la segunda,


nombe   apellido   hobbie           lugar
Ana      Martín     juegos de mesa   Sevilla
Ana      Martín     escape rooms     Madrid
Ana      Martín     ir al cine       Galicia
Juana   Cuevas      juegos de mesa   Sevilla
Juana   Cuevas      escape rooms     Madrid
Juana   Cuevas      ir al cine       Galicia
Lucía   Sánchez     juegos de mesa   Sevilla
Lucía  Sánchez     escape rooms      Madrid
Lucía   Sánchez     ir al cine       Galicia

-- CROSS JOIN
Imaginaos que lo que quiero es que de cada color (son jerseis) haya de todas las tallas

*/

Tabla color
|colores   |
|----------|
|rojo      |
|azul      |
|amarillo  |

Tabla talla
|tallas    |
|----------|
|S         |
|M         |
|L         |

|colores   |tallas   |
|----------|---------|
|rojo      | S       |
|azul      | S       |
|amarillo  | S       |
|rojo      | M       |
|azul      | M       |
|amarillo  | M       |
|rojo      | L       |
|azul      | L       |
|amarillo  | L       |

-- Y en código, ¿cómo sería esto?
-- Selecciono las columnas de cada tabla que quiero combinar
-- En el FROM nombro la primera tabla
-- y en el CROSS, la segunda.


SELECT
	tabla1.columna1, -- Las columnas a unir: como hacemos referencias a columnas de dos tablas hay que poner nombre_tabla.nombre_columna
    tabla1.columna2,
    tabla2.columna1,
    tabla2.columna2
FROM tabla1          -- Primera tabla
CROSS JOIN tabla2;  -- Segunda tabla

use sakila; 

select * from actor;

select * from film;

select first_name as nombre, last_name as apellidos, title  as nombre_peli
from actor
cross join film; 

-- EXPLICACIÓN:
-- actor contiene información de actores y film de películas
-- CROSS JOIN combina todas las filas de la tabla actor con todas las filas de la tabla film, aunque no tengan nada en común
-- Seleccionamos las columnas que queremos combinar
-- El resultado: la tabla actor tiene 200 filas  y la de film 1000, pues el resultado son 200 000 (200 x 1000)
-- Cada fila es el resultado de emparejar el actor con una película



/* Para selecionar las columnas que queremos mostrar, nombro la tabla.nombre_columna
Otros ejemplos seria: Una tabla de productos y quiero unirla a todas las promociones.

SELECT
productos.product_id,
productos.nombre,
promociones.promocion_id
FROM productos
CROSS JOIN promociones;

A veces el resultado va a ser demasiado largo y tendremos que utilizar filtros, por ejemplo con WHERE

/**natural join
Unimos dos tablas y busca automáticamente una columna con el mismo nombre en ambas tablas
para combinar los datos */

/**
Tabla clientes
|id_cliente|nombre   |
|----------|---------|
|1    	   | Carol   |
|2         | Sonia   |
|3         | Laura   |

Tabla pedidos
|id_pedido |id_cliente| producto |nombre
|----------|----------|----------|
|2233      | 1        | Movil    |Pedido 1
|2234      | 3        | Portatil |Pedido 2 
|2235      | 2        | Cascos   |Pedido 3
*/

SELECT c.id_cliente, c.nombre as nombre_cliente, p.nombre as nombre_pedido
FROM clientes c
NATURAL JOIN pedidos p;
/* ¿Qué columna tienen en común?: id_cliente, así que las puedo unir por esa, para obtener el nombre
Se unen las tablas a través de la columna en común


/* 

Es decir, la estructura es

SELECT
tabla1.columna1,
tabla1.columna2,
tabla2.columna1,
tabla2.columna2
FROM tabla1,
NATURAL JOIN tabla2;


El Natural Join tenemos que hacerlo entre tablas que tengan una columna que se llama igual
y tiene el mismo tipo de dato

- Combina las filas de dos tablas basándose automáticamente en las columnas con el mismo nombre
- NO REQUIERE que especifiquemos explícitamente las columnas de unión
- Si las tablas no tienen columnas con nombres comunes, el resultado será un producto cartesiano */

-- El NATURAL JOIN: combina dos tablas basándose automáticamente en las columnas comunes que tienen el mismo nombre y tipo de dato
-- Es una forma más sencilla de hacer un INNER JOIN cuando las columnas en común se llaman iguales

use promo_47; 

SELECT *
from employees
natural join departments; 

SELECT e.employeeName, d.departmentName
from employees e
natural join departments d; 


/*inner join*/
-- Igual que NATURAL JOIN pero aquí la columna en común no se llama igual, así que tengo que especificarla en la cláusula ON
/*
Tabla usuarios
|id        |nombre    | edad     |
|----------|----------|----------|
|1234      | Rosa     | 53       |
|1235      | Carmen   | 36       |
|1236      | Marta    | 30       |

Tabla pedidos
|id_pedido |id_cliente | producto |
|----------|-----------|----------|
|2233      | 1234      | Movil    |
|2234      | 1235      | Portatil |
|2235      | 1236      | Cascos   |
|2236      | 1235      | Teclado  |

/* id y id_cliente son lo mismo, pero se llaman diferente. Podemos unir las tablas por esa columna.
No importa el orden de las tablas porque vamos a obtener los datos en común */

SELECT
usuarios.nombre
pedidos.*
FROM pedidos
INNER JOIN usuarios
ON pedidos.id_cliente = usuarios.id;
/*
Resultado:
|id_pedido |id_cliente | producto | nombre  |
|----------|-----------|----------|---------|
|2233      | 1234      | Movil    | Rosa    |
|2234      | 1235      | Portatil | Carmen  |
|2235      | 1236      | Cascos   | Marta   |
|2236      | 1235      | Teclado  | Carmen  |
/* Con esta tabla ya podemos ver por ejemplo qué ha comprado cada cliente
IMPORTANTE: Solo nos va a mostrar la información que aparezca en las dos tablas.
Si un id, aparece en una pero en otra no, no nos la muestra.

*/

-- Inner join en tienda
-- INNER JOIN: combinación de tablas que devuelve solo las filas que tienen coincidencias en ambas tablas
-- Si una fila de una tabla no encuentra coincidencia en la otra tabla, no aparecerá en el resultado
USE tienda;

SELECT * 
FROM employees;

SELECT *
FROM customers;

SELECT *
FROM employees e
inner join customers c
on e.employee_number = c.sales_rep_employee_number; 

SELECT e.employee_number as trabajador, e.first_name, c.customer_name
FROM employees e
inner join customers c
on e.employee_number = c.sales_rep_employee_number; 


SELECT *
from employees e
natural join offices o; 



/*EJERCICIO 5
Selecciona el ID, nombre, apellidos de las empleadas, para aquellas con más de 8 clientes, usando INNER JOIN.*/

-- 1. Identificar las tablas que necesto, Ver la informacion y ver como las puedo unir
select * from employees;

select * from customers;

-- 2 union de esas tablas : join y seleccionar solo que me interesa
select e.employee_number, e.first_name, e.last_name, c.customer_name
from employees e
inner join customers c
on e.employee_number = c.sales_rep_employee_number; 

-- 3. Analizo como obtener la cantidad clientes : group by
select e.employee_number, e.first_name, e.last_name, COUNT(c.customer_number) as cant_clientes
from employees e
inner join customers c
on e.employee_number = c.sales_rep_employee_number
group by e.employee_number; 

-- 4 quedarme con mas 8 clientes
select e.employee_number, e.first_name, e.last_name, COUNT(c.customer_number) as cant_clientes
from employees e
inner join customers c
on e.employee_number = c.sales_rep_employee_number
group by e.employee_number
having cant_clientes > 8; 


-- inner join con ussing 
SELECT *
from employees e
inner join offices o
using (office_code); 

-- INNER JOIN: COMBINACION DE TABLAS
SELECT * 
FROM employees e, customers c
WHERE e.employee_number = c.sales_rep_employee_number; 



















































