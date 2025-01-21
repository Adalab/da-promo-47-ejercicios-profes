-- Crear la base de datos
CREATE DATABASE EjemploCaracteresEspeciales;

-- Usar la base de datos
USE EjemploCaracteresEspeciales;

-- Crear la tabla de productos
CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion VARCHAR(255)
);

-- Crear la tabla de usuarios
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_usuario VARCHAR(50)
);

-- Crear la tabla de comentarios
CREATE TABLE comentarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    texto VARCHAR(255)
);

-- Crear la tabla de rutas
CREATE TABLE rutas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    directorio VARCHAR(255)
);

-- Crear la tabla de mensajes
CREATE TABLE mensajes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    contenido TEXT
);

-- Insertar datos en la tabla productos
INSERT INTO productos (nombre, descripcion) VALUES
('Laptop', 'Laptop 15% de descuento'),
('Teléfono', 'Pantalla de 6 pulgadas y batería al 80%'),
('Tablet', 'Capacidad de almacenamiento 128GB'),
('Cámara', 'Resolución 12MP y precio 25% descuento');

-- Insertar datos en la tabla usuarios
INSERT INTO usuarios (nombre_usuario) VALUES
('juan_perez'),
('maria_123'),
('ana_gomez'),
('pedro.lopez');

-- Insertar datos en la tabla comentarios
INSERT INTO comentarios (texto) VALUES
('It''s a great product!'),
('She''s an excellent seller.'),
('I can''t wait to buy another one.');

-- Insertar datos en la tabla rutas
INSERT INTO rutas (directorio) VALUES
('C:\\users\\juan\\documents'),
('C:\\program files\\app'),
('D:\\backup\\2023'),
('E:\\media\\movies');

-- Insertar datos en la tabla mensajes
INSERT INTO mensajes (contenido) VALUES
('Hola,\n¿Cómo estás?'),
('Este es un mensaje\nde varias líneas.'),
('Primera línea.\nSegunda línea.\nTercera línea.');
