-- Creación y uso de la base de datos
CREATE DATABASE laboratorio;
USE laboratorio;

-- Creación de las tablas y sus relaciones
CREATE TABLE direccion (
    idDireccion INT PRIMARY KEY,
    Direccion VARCHAR(45),
    Ciudad VARCHAR(45),
    Pais VARCHAR(45)
);

CREATE TABLE cliente (
    idCliente INT PRIMARY KEY,
    Nombre VARCHAR(45),
    Apellido VARCHAR(45),
    Edad INT,
    Direccion_idDireccion INT,
    FOREIGN KEY (Direccion_idDireccion) REFERENCES direccion(idDireccion)
);

CREATE TABLE categoria (
    idCategoria INT PRIMARY KEY,
    Nombre VARCHAR(45)
);

CREATE TABLE peliculas (
    idPeliculas INT PRIMARY KEY,
    Nombre VARCHAR(45),
    Duracion VARCHAR(45),
    Descripcion VARCHAR(255),
    Año VARCHAR(4),
    Categoria_idCategoria INT,
    FOREIGN KEY (Categoria_idCategoria) REFERENCES categoria(idCategoria)
);

CREATE TABLE inventario (
    idCopiasPeliculas INT PRIMARY KEY,
    Peliculas_idPeliculas INT,
    Disponible INT,
    FOREIGN KEY (Peliculas_idPeliculas) REFERENCES peliculas(idPeliculas)
);

CREATE TABLE renta (
    idRenta INT PRIMARY KEY,
    Fecha_Renta DATE,
    Fecha_Entrega DATE,
    Inventario_idCopiasPeliculas INT,
    Cliente_idCliente INT,
    FOREIGN KEY (Inventario_idCopiasPeliculas) REFERENCES inventario(idCopiasPeliculas),
    FOREIGN KEY (Cliente_idCliente) REFERENCES cliente(idCliente)
);

-- Insertar datos en cada una de las tablas
INSERT INTO direccion (idDireccion, Direccion, Ciudad, Pais) VALUES
(1, 'Av. Central 123', 'Ciudad Fijo', 'Guatemala'),
(2, 'Calle Luna 456', 'Ciudad Sol', 'México'),
(3, 'Paseo del Río 789', 'Buenos Aires', 'Argentina'),
(4, 'Calle Estrella 321', 'Madrid', 'España'),
(5, 'Av. Libertad 654', 'Lima', 'Perú');

INSERT INTO cliente (idCliente, Nombre, Apellido, Edad, Direccion_idDireccion) VALUES
(1, 'Juliana', 'Gómez', 25, 1),
(2, 'Carlos', 'Pérez', 30, 2),
(3, 'Ana', 'López', 22, 3),
(4, 'Juliana', 'Martínez', 28, 4),
(5, 'Luis', 'Sánchez', 35, 5);

INSERT INTO categoria (idCategoria, Nombre) VALUES
(1, 'Acción'),
(2, 'Drama'),
(3, 'Comedia'),
(4, 'Animación'),
(5, 'Documental');

INSERT INTO peliculas (idPeliculas, Nombre, Duracion, Descripcion, Año, Categoria_idCategoria) VALUES
(1, 'POKEMON1', '90', 'Aventura animada.', '2000', 4),
(2, 'Avengers', '143', 'Superhéroes luchando.', '2012', 1),
(3, 'Titanic', '195', 'Historia de amor en barco.', '1997', 2),
(4, 'The Hangover', '100', 'Comedia de una boda fallida.', '2009', 3),
(5, 'Planet Earth', '60', 'Documental de la naturaleza.', '2018', 5);

INSERT INTO inventario (idCopiasPeliculas, Peliculas_idPeliculas, Disponible) VALUES
(1, 1, 5),
(2, 2, 3),
(3, 3, 4),
(4, 4, 2),
(5, 5, 6);

INSERT INTO renta (idRenta, Fecha_Renta, Fecha_Entrega, Inventario_idCopiasPeliculas, Cliente_idCliente) VALUES
(1, '2025-04-01', '2025-04-03', 1, 1),
(2, '2025-04-05', '2025-04-07', 2, 2),
(3, '2025-04-10', '2025-04-12', 3, 3),
(4, '2025-04-15', '2025-04-17', 4, 4),
(5, '2025-04-20', '2025-04-22', 5, 5);

-- Consulta con el nombre de Juliana
SELECT * FROM cliente WHERE Nombre = 'Juliana';

-- Eliminar las preliculas con nombre de POKEMON1
SET SQL_SAFE_UPDATES = 0;
SET FOREIGN_KEY_CHECKS = 0;
DELETE FROM peliculas WHERE Nombre = 'POKEMON1';
DELETE FROM inventario WHERE Peliculas_idPeliculas = 1;
SET SQL_SAFE_UPDATES = 1;
SET FOREIGN_KEY_CHECKS = 1;
SELECT * FROM peliculas;
SELECT * FROM inventario;

-- Ordenar tabla categoria ascendentemente
SELECT * FROM categoria ORDER BY Nombre ASC;

-- Ordenar tabla peliculas descendentemente
SELECT * FROM peliculas ORDER BY Año DESC;

-- Join con las dos tablas pelicula y categoria
SELECT peliculas.Nombre AS Pelicula, peliculas.Año, categoria.Nombre AS Categoria
FROM peliculas
INNER JOIN categoria ON peliculas.Categoria_idCategoria = categoria.idCategoria;