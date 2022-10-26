CREATE DATABASE cientificos;
USE cientificos;

DROP TABLE IF EXISTS proyecto;
CREATE TABLE proyecto (
id CHAR(4) NOT NULL,
nombre VARCHAR(255),
horas INT,
PRIMARY KEY (id)
);

DROP TABLE IF EXISTS cientifico;
CREATE TABLE cientifico (
dni VARCHAR(8) NOT NULL,
nombre_completo VARCHAR(255),
PRIMARY KEY (dni)
);

CREATE TABLE asignado_a(
cientifico varchar(8),
proyecto char(4),
PRIMARY KEY (cientifico, proyecto),
FOREIGN KEY (proyecto)
REFERENCES proyecto(id)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (cientifico)
REFERENCES cientifico(dni)
ON DELETE CASCADE
ON UPDATE CASCADE
);

INSERT INTO proyecto (id, nombre, horas) VALUES
('111A',"ProyectoA",109),
('222B',"ProyectoB",256),
('333C',"ProyectoC",337),
('444D',"ProyectoD",444),
('555E',"ProyectoE",225),
('666F',"ProyectoF",312),
('777G',"ProyectoG",306),
('888H',"ProyectoH",200),
('999I',"ProyectoI",103),
('000J',"ProyectoJ",1050);

INSERT INTO cientifico (dni, nombre_completo) VALUES
("1111111A","Roger Federer"),
("2222222B","Carlos Alcaraz"),
("3333333C","Rafael Nadal"),
("4444444D","Novak Djokovic"),
("5555555E","Mateo Berretini"),
("6666666F","Daniil Medvedev"),
("7777777G","Chris Ruud"),
("8888888H","Felix Auger-Aliassime"),
("9999999I","Nick Kyrgios"),
("0000000J","Andy Murray");

INSERT INTO asignado_a (cientifico, proyecto) VALUES
("1111111A",'222B'),
("2222222B",'333C'),
("3333333C",'777G'),
("4444444D",'111A'),
("5555555E",'333C'),
("6666666F",'111A'),
("7777777G",'555E'),
("8888888H",'666F'),
("9999999I",'999I'),
("0000000J",'666F');