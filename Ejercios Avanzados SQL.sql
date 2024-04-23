create database ecommers;
use ecommers;

CREATE TABLE usuarios(
id INT AUTO_INCREMENT,
   	nombre VARCHAR(45),
   	apellidos VARCHAR(45),
   	dni VARCHAR(45),
   	fecha_nacimiento date,
    genero varchar(45),
   PRIMARY KEY(id)
);

CREATE TABLE pedidos(
id INT AUTO_INCREMENT,
   	usuario_id int,
    fecha_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
   PRIMARY KEY(id),
   FOREIGN KEY(usuario_id) REFERENCES usuarios(id)
);

CREATE TABLE productos(
id INT AUTO_INCREMENT,
   	nombre varchar(45),
    precio float,
   PRIMARY KEY(id)
);

CREATE TABLE categorias(
id INT AUTO_INCREMENT,
   	nombre varchar(45),
   PRIMARY KEY(id)
);

CREATE TABLE categorias_productos(
id INT AUTO_INCREMENT,
   	categoria_id int,
    producto_id int,
   PRIMARY KEY(id),
   FOREIGN KEY(categoria_id) REFERENCES categorias(id),
   FOREIGN KEY(producto_id) REFERENCES productos(id)
);

CREATE TABLE productos_pedidos(
id INT AUTO_INCREMENT,
	producto_id int,
   	pedido_id int,
   PRIMARY KEY(id),
   FOREIGN KEY(producto_id) REFERENCES productos(id),
   FOREIGN KEY(pedido_id) REFERENCES pedidos(id)
);

INSERT INTO categorias(nombre) VALUES 
('tecnologia'),
('hogar');

INSERT INTO productos(nombre, precio) VALUES 
('aspiradora', 100),
('mesa', 60.5),
('lampara', 15),
('televisor', 150.7),
('playstation 5', 450);

INSERT INTO categorias_productos(categoria_id, producto_id) VALUES 
(1,1),
(2,1),
(2,2),
(1,3),
(2,3),
(1,4),
(2,4),
(1,5);

INSERT INTO usuarios (nombre, apellidos, dni, fecha_nacimiento, genero) 
VALUES 
('Juan', 'Gómez Pérez', '12345678A', '1990-05-15', 'M'),
('María', 'Martínez López', '87654321B', '1985-08-20', 'F'),
('Pedro', 'Sánchez Rodríguez', '98765432C', '1995-03-10', 'M'),
('Ana', 'García Fernández', '54321678D', '1988-12-25', 'F'),
('David', 'González Pérez', '23456789E', '1992-06-30', 'M');

INSERT INTO pedidos (usuario_id) 
VALUES 
(1),
(2),
(3),
(4),
(5);

select * from categorias_productos;

update productos set nombre = 'mesa comedor' where id = 2;

update productos set precio = 50 where id = 2;

select * from productos where precio > 20;

select * from productos order by precio desc;

SELECT
productos.nombre,
productos.precio,
categorias.nombre
FROM categorias_productos
INNER JOIN productos
ON productos.id = categorias_productos.producto_id
INNER JOIN categorias
ON categorias.id = categorias_productos.categoria_id;

SELECT
productos.nombre,
productos.precio,
categorias.nombre
FROM categorias_productos
INNER JOIN productos
ON productos.id = categorias_productos.producto_id
INNER JOIN categorias
ON categorias.id = categorias_productos.categoria_id
where productos.id = 3;

delete from categorias_productos where producto_id = 1;
delete from productos where id = 1;

CREATE TABLE criticas(
id INT AUTO_INCREMENT,
   	texto VARCHAR(255),
    usuario_id int,
    producto_id int,
    fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
   PRIMARY KEY(id),
   FOREIGN KEY(usuario_id) REFERENCES usuarios(id),
   FOREIGN KEY(producto_id) REFERENCES productos(id)
);


insert into criticas (texto, usuario_id, producto_id)
values
	('Apesta', 1,2),
    ('Apesta', 2,2),
    ('Apesta', 3,2),
    ('Apesta', 4,2),
    ('LA OSTIA', 5,4);

update criticas set texto = 'redencion' where id = 1;

SELECT
usuarios.nombre,
pedidos.id as "id del Pedido",
pedidos.fecha_pedido
FROM usuarios
INNER JOIN pedidos
ON usuarios.id = pedidos.usuario_id;

SELECT
usuarios.nombre,
pedidos.id as "id del Pedido",
pedidos.fecha_pedido
FROM usuarios
INNER JOIN pedidos
ON usuarios.id = pedidos.usuario_id
where usuarios.id = 2;

select * from criticas;

SELECT
productos.nombre,
criticas.texto
FROM criticas
INNER JOIN productos
ON productos.id = criticas.producto_id;

SELECT
productos.nombre,
criticas.texto
FROM criticas
INNER JOIN productos
ON productos.id = criticas.producto_id
where productos.id = 2;

SELECT
productos.nombre as "producto",
criticas.texto as "critica",
categorias.nombre as "categoria"
FROM productos
INNER JOIN criticas
ON productos.id = criticas.producto_id
INNER JOIN categorias_productos
INNER JOIN categorias
ON categorias.id = categorias_productos.categoria_id;

INSERT INTO productos_pedidos(producto_id, pedido_id) VALUES 
(4,1),
(2,1),
(2,2),
(5,3);


SELECT
usuarios.nombre as "usuario",
pedidos.fecha_pedido as "pedido",
pedidos.id as "ID Pedido",
productos.nombre as "producto"
FROM usuarios
INNER JOIN pedidos
ON usuarios.id = pedidos.usuario_id
INNER JOIN productos_pedidos
INNER JOIN productos
ON productos.id = productos_pedidos.producto_id;

delete from criticas where id = 1





