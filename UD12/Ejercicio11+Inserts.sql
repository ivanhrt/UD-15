DROP DATABASE IF EXISTS accidentes_geograficos;
CREATE DATABASE accidentes_geograficos;
USE accidentes_geograficos;

DROP TABLE IF EXISTS pais;
CREATE TABLE pais (
nombre VARCHAR(30) NOT NULL,
poblacion INT,
extension INT,
PRIMARY KEY (nombre)
);

DROP TABLE IF EXISTS accidente_geografico;
CREATE TABLE accidente_geografico (
id_accidente INT AUTO_INCREMENT NOT NULL,
nombre VARCHAR(30) not null,
posicion_horizontal int,
posicion_vertical int,
pais VARCHAR(30),
PRIMARY KEY (id_accidente),
FOREIGN KEY (pais)
REFERENCES pais(nombre)
ON DELETE CASCADE
ON UPDATE CASCADE
);

DROP TABLE IF EXISTS localidad;
CREATE TABLE localidad (
id_localidad INT AUTO_INCREMENT NOT NULL,
nombre VARCHAR(30) not null,
pais VARCHAR(30),
PRIMARY KEY (id_localidad),
FOREIGN KEY (pais)
REFERENCES pais(nombre)
ON DELETE CASCADE
ON UPDATE CASCADE
);

DROP TABLE IF EXISTS rio;
CREATE TABLE rio (
id_accidente INT NOT NULL,
longitud INT,
id_localidad INT NOT NULL,
PRIMARY KEY (id_accidente),
FOREIGN KEY (id_localidad)
REFERENCES localidad(id_localidad)
ON DELETE CASCADE
ON UPDATE CASCADE
);
DROP TABLE IF EXISTS montaña;
CREATE TABLE montaña (
id_accidente INT  NOT NULL,
altura INT,
PRIMARY KEY (id_accidente)
);

DROP TABLE IF EXISTS lago;
CREATE TABLE lago (
id_accidente INT NOT NULL,
extension INT,
PRIMARY KEY (id_accidente)
);

INSERT INTO pais (nombre, poblacion, extension) VALUES
("Alemania", 20000000,180000),
("Rusia", 30000000,280000),
("Estados Unidos", 60000000,250000),
("China", 90000000,380000),
("Japon", 10000000,80000),
("España", 15000000,100000),
("Francia", 19000000,120000),
("Canada", 12000000,110000),
("Mexico", 11000000,90000),
("Italia", 10000000,85000);

INSERT INTO accidente_geografico (nombre, posicion_horizontal, posicion_vertical, pais) VALUES
("Montaña 1", 154,130, "Alemania"),
("Rio 1", 124,130, "España"),
("Lago 1", 156,130, "Estados Unidos"),
("Montaña 2", 114,130, "Francia"),
("Rio 2", 54,130, "Italia"),
("Lago 2", 1664,130, "Canada"),
("Montaña 3", 254,130, "Mexico"),
("Rio 3", 153,130, "China"),
("Lago 3", 514,130, "Rusia"),
("Montaña 4", 4,130, "Alemania");

INSERT INTO localidad (nombre, pais) VALUES
("Badajoz", "España"),
("Tarragona", "España"),
("Madrid", "España"),
("Paris", "Francia"),
("Berlin", "Alemania"),
("Montreal", "Canada"),
("Chicago", "Estados Unidos"),
("Monterrey", "Mexico"),
("Moscu", "Rusia"),
("Pekin", "China");

INSERT INTO rio (longitud, id_localidad, id_accidente) VALUES
(2500, 2, 2),
(1500, 3, 3),
(3500, 4, 1),
(2000, 6, 4),
(2900, 1, 6),
(1100, 1, 5),
(1200, 5, 9),
(4500, 8, 10),
(11200, 9, 7),
(25000, 7, 8);

INSERT INTO montaña (altura, id_accidente) VALUES
(2500, 1),
(1500, 2),
(3500, 3),
(2000, 4),
(2900, 5),
(1100, 6),
(1200, 7),
(4500, 8),
(11200, 9),
(25000, 10);

INSERT INTO lago (extension, id_accidente) VALUES
(2500, 1),
(1500, 2),
(3500, 3),
(2000, 4),
(2900, 5),
(1100, 6),
(1200, 7),
(4500, 8),
(11200, 9),
(25000, 10);