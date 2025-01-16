CREATE SCHEMA adalaber;
USE adalaber;

/*Repasamos algunos comandos
- Para crear una tabla:
CREATE TABLE nombre_esquema.nombre_tabla;
*/

CREATE TABLE adalabers(
	id_adalaber INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL,
    apellido VARCHAR(60) NOT NULL,
    ciudad VARCHAR(30) DEFAULT 'Sin datos',
    direccion VARCHAR(100),
    correo VARCHAR(30) UNIQUE,
    telefono INT NOT NULL,
    curso VARCHAR(30) NOT NULL,
    conocimientos_previos ENUM('Sin', 'Poco', 'Mucho'),
    permiso_redes_sociales BOOL DEFAULT FALSE,
    fecha_registro DATE NOT NULL
    );

-- Hoy vamos a ver las operaciones CRUD
-- Create --> INSERT INTO
-- Read --> SELECT
-- Update --> UPDATE
-- Delete --> DELETE
-- Además de las acciones ALTER TABLE y DROP TABLE*/


/* Creamos esta tabla pero está vacía... ¿Cómo insertamos los datos? Usaremos un nuevo comando...

ALTER TABLE para...
- Añadir columnas
- Eliminar columnas
- Cambiar tipo de datos de una columna
- Renombrar una columna
*/

-- Añadir columna a una tabla existente:

ALTER TABLE adalabers
ADD COLUMN nickname VARCHAR(20);

-- Eliminar una columna de una tabla existente:

ALTER TABLE adalabers
DROP COLUMN direccion;

-- Para cambiar el tipo de dato o restricciones de una columna existente en una tabla existente
ALTER TABLE adalabers
MODIFY COLUMN nombre VARCHAR(15);

-- Permite cambiar tanto el nombre como el tipo de dato de la columna: le paso primero el nombre actual y después el nombre nuevo
ALTER TABLE adalabers
CHANGE COLUMN NOMBRE nombre VARCHAR(100);

ALTER TABLE
RENAME TABLE  TO

-- ¡IMPORTANTE! Esto solo sirve para hacerlo columna por columna, no podemos pasarle varios nombres de columnas
-- Tendremos que usar un comando por columna
-- Ejemplo:
ALTER TABLE empleadas
MODIFY COLUMN salario FLOAT NOT NULL,
MODIFY COLUMN fecha_contratacion DATE NOT NULL;

/*Para eliminar tablas tenemos
- Para borrar una tabla:
DROP TABLE nombre_esquema.nombre_tabla;
*/
DROP TABLE nombre_tabla;
DROP TABLE IF EXISTS nombre_tabla;
DROP TABLE IF EXISTS nombre_tabla CASCADE; -- Para borrar los datos de esta tabla que estén en otras


/* INSERTAR DATOS DE MANERA MANUAL
No es lo más frecuente, pero vamos a aprenderlo.*/

USE nombre_esquema;
INSERT INTO nombre_tabla (nombre_columna1, nombre_columna2, nombre_columna3)
VALUES (valor1, valor2, valor3),
(valor1, valor, valor3),

-- IMPORTANTE:
-- Tener en cuenta el tipo de dato
-- Si una columna es AUTO_INCREMENT, no tenemos que introducir ese valor
-- Los números decimales van con .

INSERT INTO adalaber (nombre, apellido, ciudad, direccion, correo, telefono, curso, conocimientos_previos, permiso_redes_sociales, fecha_registro)
VALUES ('Laura', 'Martínez', 'Madrid', 'Calle Mayor, 5', 'laura.martinez@gmail.com', 612345678, 'Frontend', 'Poco', TRUE, '2025-01-01'),
('Sofía', 'Gómez', 'Barcelona', 'Avenida Diagonal, 123', 'sofia.gomez@hotmail.com', 645123789, 'Backend', 'Mucho', FALSE, '2025-01-02'),
('Ana', 'Pérez', 'Valencia', NULL, 'ana.perez@yahoo.com', 689456123, 'Fullstack', 'Sin', TRUE, '2025-01-03'),
('María', 'López', 'Sevilla', 'Calle Feria, 45', 'maria.lopez@gmail.com', 698123456, 'Frontend', 'Poco', FALSE, '2025-01-04'),
('Lucía', 'Hernández', 'Zaragoza', 'Paseo Independencia, 87', 'lucia.hernandez@gmail.com', 677543210, 'Data Science', 'Mucho', TRUE, '2025-01-05'),
('Carmen', 'Rodríguez', 'Bilbao', NULL, 'carmen.rodriguez@hotmail.com', 634987654, 'DevOps', 'Sin', FALSE, '2025-01-06'),
('Elena', 'García', 'Granada', 'Calle Recogidas, 10', 'elena.garcia@gmail.com', 611223344, 'Backend', 'Poco', TRUE, '2025-01-07'),
('Isabel', 'Sánchez', 'Alicante', NULL, 'isabel.sanchez@gmail.com', 688999777, 'Frontend', 'Mucho', FALSE, '2025-01-08'),
('Clara', 'Jiménez', 'Santander', 'Avenida del Generalísimo, 25', 'clara.jimenez@yahoo.com', 645888333, 'Data Science', 'Sin', TRUE, '2025-01-09'),
('Paula', 'Ruiz', 'La Coruña', NULL, 'paula.ruiz@gmail.com', 699222111, 'Fullstack', 'Poco', FALSE, '2025-01-10');

-- VALUES solo se pone la primera vez, después solamente los paréntesis con los datos dividido por comas,*/

-- Vamos a consultar que estén los datos subidos

SELECT *
FROM adalaber;

SELECT correo
FROM adalaber;

SELECT nombre, apellido
FROM adalaber
LIMIT 2;

-- La estructura es
SELECT nombre_columna1, nombre_columna2
FROM nombre_de_tabla;

-- * es cuando queremos ver todas las columnas

-- También podemos filtrar los datos

SELECT *
FROM adalaber
WHERE ciudad = 'Sevilla';

SELECT *
FROM adalaber
WHERE curso = 'frontend';

SELECT *
FROM adalaber
WHERE id_adalaber = 4;


SELECT
columnas
FROM tabla
WHERE condición;

SELECT
nombre, 
email
FROM empresa_db.clientes
WHERE cliente_id = 3;


SELECT nombre, telefono
FROM adalaber
WHERE id_adalaber> 5;

SELECT *
FROM adalaber
WHERE conocimientos_previos != 'Poco' AND curso = 'Frontend';

SELECT *
FROM adalaber
WHERE conocimientos_previos = 'Mucho' AND permiso_redes_sociales = True;


SELECT *
FROM adalaber
WHERE ciudad IS NOT NULL;

/* En resumen...
- Usamos SELECT columna FROM esquema.tabla para consultar
- Asterisco para seleccionar todas las columnas
- WHERE seguido de condición al final
- Podemos usar =, >=, <, <=, != . Para diferente tenemos != o <>
- Podemos usar más de una condición o una de las dos con AND y OR
- IS NOT NULL o IS NULL puede ser una condición


Ahora vamos a actualizar datos */ 

UPDATE nombre_tabla
SET columna= nuevo_valor1
WHERE condicion


UPDATE adalaber
SET telefono = 66688778
WHERE nombre = 'María' AND apellido = 'Martín';

/*Condición: si un dato está entre varios
WHERE condicion IN ()*/

UPDATE adalaber
SET permiso_redes_sociales = FALSE
WHERE id_adalaber IN (1,2);

SELECT *
FROM adalaber
WHERE ciudad IN ('Madrid', 'Sevilla', 'Murcia');

UPDATE adalaber
SET ciudad = 'Barcelona'
WHERE id_adalaber = 1;

UPDATE adalaber
SET correo = 'nuevo.correo@example.com'
WHERE nombre = 'Laura' AND apellido = 'Martínez';

UPDATE adalaber
SET telefono = 699999999, permiso_redes_sociales = TRUE
WHERE curso = 'Frontend' AND ciudad = 'Barcelona';

UPDATE adalaber
SET direccion = 'Calle Desconocida'
WHERE direccion IS NULL;

-- Y por último, vemos cómo eliminar registros

DELETE FROM nombre_tabla
WHERE condicion;

DELETE FROM adalaber
WHERE id_adalaber = 1;

DELETE FROM adalaber
WHERE ciudad = 'Sin datos';

DELETE FROM adalaber
WHERE ciudad = 'Madrid' AND permiso_redes_sociales = FALSE;


