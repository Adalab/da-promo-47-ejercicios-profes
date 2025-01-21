-- Caracteres que normalmente están reservados para las sentencias SQL. 
-- En tales casos, es necesario utilizar la cláusula de escape representada por \


-- % representa cualquier caracter(incluyendo ninguno) 
-- "navid%" buscamos algo que empiece por navid, pero me da igual de qué venga después
-- _ caracter que representa solo 1 caracter

-- Buscar productos que están oferta 

select *
from productos
where descripcion LIKE  '%\%%'; 

-- BUSCAR USUARIOS CON _ 
select *
from usuarios 
where nombre_usuario like '%\_%'; 

-- buscar comentarios que tengas comilas
select *
from comentarios
where texto LIKE '%"%'; 

-- buscar rutas con \
select * from rutas
where directorio LIKE '%\\\%'; 

-- \n buscar mensajes con un salto de linea
select *
from mensajes 
where contenido like '%\n%'







