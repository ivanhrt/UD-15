DROP DATABASE IF EXISTS vuelos;
CREATE DATABASE vuelos;
USE vuelos;

DROP TABLE IF EXISTS aeropuerto;
CREATE TABLE aeropuerto (
nombre VARCHAR(30) NOT NULL,
localidad VARCHAR(20),
pais VARCHAR(20),
PRIMARY KEY (nombre)
);

DROP TABLE IF EXISTS avion;
CREATE TABLE avion (
id_avion INT AUTO_INCREMENT NOT NULL,
numero_plazas INT,
PRIMARY KEY (id_avion)
);

DROP TABLE IF EXISTS vuelo;
CREATE TABLE vuelo (
id_vuelo INT AUTO_INCREMENT NOT NULL,
fecha DATE,
hora_salida DATETIME,
hora_llegada DATETIME,
aeropuerto_salida VARCHAR(30),
aeropuerto_llegada VARCHAR(30),
avion INT NOT NULL,
PRIMARY KEY (id_vuelo),
FOREIGN KEY (aeropuerto_salida)
REFERENCES aeropuerto(nombre)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (aeropuerto_llegada)
REFERENCES aeropuerto(nombre)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (avion)
REFERENCES avion(id_avion)
ON DELETE CASCADE
ON UPDATE CASCADE
);

DROP TABLE IF EXISTS asiento;
CREATE TABLE asiento (
fila INT NOT NULL,
columna CHAR NOT NULL,
planta INT,
avion INT NOT NULL, 
PRIMARY KEY (fila,columna),
FOREIGN KEY (avion)
REFERENCES avion(id_avion)
ON DELETE CASCADE
ON UPDATE CASCADE
);

DROP TABLE IF EXISTS cliente;
CREATE TABLE cliente (
id_cliente INT AUTO_INCREMENT NOT NULL,
nombre VARCHAR(20) NOT NULL,
apellidos VARCHAR(20),
direccion VARCHAR(20),
telefono VARCHAR(20),
cuenta_bancaria varchar(20),
PRIMARY KEY (id_cliente)
);

DROP TABLE IF EXISTS reserva;
CREATE TABLE reserva (
id_reserva INT AUTO_INCREMENT NOT NULL,
num_plazas INT NOT NULL,
fecha DATE,
id_cliente INT NOT NULL,
PRIMARY KEY (id_reserva),
FOREIGN KEY (id_cliente)
REFERENCES cliente(id_cliente)
ON DELETE CASCADE
ON UPDATE CASCADE
);

DROP TABLE IF EXISTS tarjeta_embarque;
CREATE TABLE tarjeta_embarque (
id_embarque INT AUTO_INCREMENT NOT NULL,
id_reserva INT NOT NULL,
id_cliente INT NOT NULL,
PRIMARY KEY (id_embarque),
FOREIGN KEY (id_cliente)
REFERENCES cliente(id_cliente),
FOREIGN KEY (id_reserva)
REFERENCES reserva(id_reserva)
);


INSERT INTO aeropuerto (nombre, localidad, pais) VALUES
("El prat", "Barcelona", "España"),
("Barajas", "Madrid", "España"),
("Reus", "Reus", "España"),
("Castello", "Castellon", "España"),
("Tarradellas", "Girona", "España"),
("Lleida", "Lleida", "España"),
("Versalles", "Paris", "Francia"),
("Stansted", "Londres", "Inglaterra"),
("Martin Luther King", "Chicago", "EEUU"),
("Jose Fonte", "Oporto", "Portugal");

INSERT INTO avion (numero_plazas) VALUES
(100),
(110),
(101),
(200),
(120),
(102),
(300),
(130),
(103),
(400);

INSERT INTO vuelo (fecha, avion) VALUES
('1999-01-10', 1),
('2020-01-12', 2),
('2021-02-10', 2),
('2022-03-24', 3),
('2022-06-12', 4),
('2000-11-11', 5),
('2011-02-20', 6),
('2010-01-10', 6),
('2020-11-18', 1),
('2022-08-11', 7);

INSERT INTO asiento (fila, columna, planta, avion) VALUES
(2,'A', 1, 1),
(3,'B', 1, 2),
(4,'E', 1, 3),
(15,'F', 1, 2),
(21,'A', 2, 3),
(27,'D', 1, 4),
(30,'B', 1, 4),
(31,'F', 2, 2),
(1,'C', 1, 1),
(12,'E', 1, 5);

INSERT INTO cliente (nombre, apellidos, direccion, telefono, cuenta_bancaria) VALUES
("Tomas", "Satoransky", "Barça street", "+34-977123456","ES21444444444444"),
("Sergi", "Llull", "Madrid street", "+34-978123456","ES22444444444444"),
("Sasha", "Vezenkov", "Olympliakos street", "+28-977123456","GR23444444444444"),
("Markus", "Howard", "Baskonia street", "+34-927123456","ES25444444444444"),
("Chris", "Jones", "Valencia street", "+34-987123456","ES31444444444444"),
("Victor", "Wembanyama", "Metropolitans street", "+24-977123456","FR61444444444444"),
("Nick", "Calathes", "Fenerbahce street", "+14-977123456","TU21444444444444"),
("Thomas", "Heurtel", "Zenit street", "+54-977123456","RU21444444444444"),
("Nando", "de Colo", "Asvel street", "+24-977123456","FR31444444444444"),
("Chris", "Koumadje", "Berlin street", "+28-977123456","GE21444444444444");

INSERT INTO reserva (num_plazas, fecha, id_cliente) VALUES
(2, '2022-01-11', 1),
(3, '2022-02-01', 2),
(1, '2022-08-11', 2),
(5, '2022-05-12', 1),
(2, '2022-08-18', 3),
(10, '2022-08-21', 5),
(1, '2022-08-31', 6),
(3, '2022-07-15', 4),
(6, '2022-11-21', 5),
(8, '2022-01-17', 8);

INSERT INTO tarjeta_embarque (id_embarque, id_reserva, id_cliente) VALUES
(1, 1, 1),
(2, 1, 1),
(3, 2, 3),
(4, 2, 1),
(5, 3, 3),
(6, 3, 1),
(7, 1, 1),
(8, 2, 2),
(9, 2, 1),
(10, 3, 4);