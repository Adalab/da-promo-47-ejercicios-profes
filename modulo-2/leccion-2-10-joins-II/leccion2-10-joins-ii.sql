/* 
Hoy veremos:

-- LEFT JOIN
-- RIGHT JOIN
-- FULL JOIN
-- SELF JOIN
-- Las mas comunes son INNER JOIN y LEFT JOIN
*/ 

-- Representación de la tabla empleados:
-- | id_empleado | nombre  | id_jefe |
-- |-------------|---------|---------|
-- | 1           | Juan    | 3       |
-- | 2           | María   | NULL    |
-- | 3           | Carlos  | NULL    |
-- | 4           | Ana     | 3       |

-- Representación de la tabla proyectos:
-- | id_proyecto | nombre_proyecto | id_empleado |
-- |-------------|-----------------|-------------|
-- | 1           | Proyecto A      | 1           |
-- | 2           | Proyecto B      | 3           |
-- | 3           | Proyecto C      | NULL        |

-- Left Join: Pido los resultados que tengan en común (como el INNER JOIN), pero también las columnas
-- de la tabla de la izquierda, aunque no tengan correspondencia con las de la derecha. 

-- | empleado | proyecto     |
-- |----------|--------------|
-- | Juan     | Proyecto A   |
-- | María    | NULL         | <-- No tiene proyecto asignado.
-- | Carlos   | Proyecto B   |
-- | Ana      | NULL         | <-- No tiene proyecto asignado.
-- Resultado esperado:
-- Este tipo de JOIN incluye todos los registros de la tabla "empleados" (izquierda),
-- aunque no tengan coincidencia en la tabla "proyectos".
-- Si no hay coincidencia, el campo "proyecto" será NULL.
select empleado.nombre, proyectos.nombre_proyecto as proyecto
from empleado
left join proyectos on empleado.id_empleado = proyectos.id_empleado; 



-- Right Join: Igual, pero la tabla "principal" es la segunda, o la de la "derecha"
-- Si hay registros que están en la segunda, pero no en la primera, aparecen igualmente los de la "segunda" o "derecha"
-- Muestra todos los proyectos, incluso si no tienen empleados asignados.
select empleado.nombre, proyectos.nombre_proyecto as proyecto
from empleado
right join proyectos on empleado.id_empleado = proyectos.id_empleado; 
-- | empleado | proyecto     |
-- |----------|--------------|
-- | Juan     | Proyecto A   |
-- | Carlos   | Proyecto B   |
-- | NULL     | Proyecto C   | <-- Proyecto sin empleado asignado.
-- Resultado esperado:
-- Este tipo de JOIN incluye todos los registros de la tabla "proyectos" (derecha),
-- aunque no tengan coincidencia en la tabla "empleados".
-- Si no hay coincidencia, el campo "empleado" será NULL.





-- Full JOIN 
-- Combina todos los empleados y proyectos, mostrando coincidencias y no coincidencias.
-- | empleado | proyecto     |
-- |----------|--------------|
-- | Juan     | Proyecto A   |
-- | María    | NULL         | <-- Empleado sin proyecto.
-- | Carlos   | Proyecto B   |
-- | Ana      | NULL         | <-- Empleado sin proyecto.
-- | NULL     | Proyecto C   | <-- Proyecto sin empleado.
/*select empleado.nombre, proyectos.nombre_proyecto as proyecto
from empleado
FULL OUTER JOIN proyectos on empleado.id_empleado = proyectos.id_empleado;*/

-- Nota: Algunos motores SQL (como MySQL) no soportan FULL OUTER JOIN directamente.
-- Si este es el caso, puedes usar una combinación de LEFT JOIN y RIGHT JOIN con UNION.

-- Resultado esperado:
-- Este tipo de JOIN incluye todos los registros de ambas tablas:
-- 1. Coincidencias entre empleados y proyectos.
-- 2. Empleados sin proyecto y proyectos sin empleado.

select empleado.nombre, proyectos.nombre_proyecto as proyecto
from empleado
left join proyectos on empleado.id_empleado = proyectos.id_empleado
UNION 
select empleado.nombre, proyectos.nombre_proyecto as proyecto
from empleado
right join proyectos on empleado.id_empleado = proyectos.id_empleado; 

-- SELF JOIN
-- Muestra empleados y sus jefes. 
-- La tabla "empleados" se une consigo misma.
SELECT e1.nombre AS empleado, e2.nombre AS jefe
FROM empleados e1
LEFT JOIN empleados e2 ON e1.id_jefe = e2.id_empleado;

-- Resultado esperado:
-- En este caso, la tabla se usa dos veces:
-- 1. "e1" representa a los empleados.
-- 2. "e2" representa a los jefes (también empleados).
-- Si un empleado no tiene jefe, el campo "jefe" será NULL.

-- | empleado | jefe         |
-- |----------|--------------|
-- | Juan     | Carlos       | <-- Juan tiene a Carlos como jefe.
-- | María    | NULL         | <-- María no tiene jefe.
-- | Carlos   | NULL         | <-- Carlos no tiene jefe.
-- | Ana      | Carlos       | <-- Ana tiene a Carlos como jefe.



-- EJERCICIOS
-- Mostrar el total de ventas por categoría de producto, incluyendo categorías sin ventas.

-- 1. identificar las tablas que estám involucradas: ventas, productos, categorias
select *  from ventas;
select * from productos;
select * from categorias; 

-- 2. calcular las ventas
select SUM(precio_unitario*cantidad) as total_ventas, sum(cantidad) as cant_vendidos, id_producto
from ventas
group by id_producto;

-- Mostrar el total de ventas por categoría de producto, incluyendo categorías sin ventas.
-- 3. ir a la tabla de productos
select SUM(precio_unitario*cantidad) as total_ventas, 
		sum(cantidad) as cant_vendidos, 
        v.id_producto, 
        p.nombre_producto,
        c.nombre_categoria
from ventas v
left join productos p  on v.id_producto = p.id_producto
left join categorias c on p.id_categoria = c.id_categoria
group by c.id_producto;

-- Ahora si agrupando por categoria
select 
        c.nombre_categoria, 
        sum(cantidad) as cant_vendidos,
        SUM(precio_unitario*cantidad) as total_ventas
from categorias c
left join productos p on c.id_categoria = p.id_categoria
left join ventas v on p.id_producto = v.id_producto
group by c.nombre_categoria
order by total_ventas desc;
-- El primer LEFT JOIN conecta categorias con productos, asegurando que las categorías sin productos aparezcan.
-- El segundo LEFT JOIN conecta productos con ventas, asegurando que los productos sin ventas no se excluyan.
-- Se calcula el total de ventas con SUM(cantidad * precio_unitario) y se agrupa por categoría.

-- Obtener una lista de usuarios con sus pedidos más recientes, incluyendo aquellos que nunca han realizado un pedido.
select * from pedidos;
select * from usuarios; 

select u.nombre as nombre_usuario, 	
	MAX(p.fecha_pedido) as ultima_fecha_pedido, 
    COUNT(p.id_pedido) as cant_pedidoss
from usuarios u
left join pedidos p on p.id_usuario = u.id_usuario
group by nombre_usuario
order by ultima_fecha_pedido desc;

-- El LEFT JOIN asegura que todos los usuarios aparezcan, incluso si no tienen pedidos.
-- MAX(pedidos.fecha_pedido) muestra la última fecha del pedido, y COUNT(pedidos.id_pedido) cuenta el total de pedidos por usuario.
-- Se ordena por fecha de pedido más reciente, colocando los usuarios sin pedidos (NULL) al final.

select MAX(p.fecha_pedido) as ultima_fecha_pedido
from pedidos p

























