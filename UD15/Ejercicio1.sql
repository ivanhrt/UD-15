CREATE DATABASE directores;
USE directores;

DROP TABLE IF EXISTS despacho;
CREATE TABLE despacho (
numero INT NOT NULL,
capacidad INT,
PRIMARY KEY (numero)
);

DROP TABLE IF EXISTS director;
CREATE TABLE director (
dni VARCHAR(10) NOT NULL,
nombre_completo VARCHAR(255),
dni_jefe VARCHAR(10),
despacho INT,
PRIMARY KEY (dni),
FOREIGN KEY (dni_jefe)
REFERENCES director(dni)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (despacho)
REFERENCES despacho(numero)
ON DELETE CASCADE
ON UPDATE CASCADE
);

INSERT INTO despacho (numero, capacidad) VALUES
(1, 12),
(2, 25),
(3, 10),
(4, 8),
(5, 5),
(6, 10),
(7, 3),
(8, 2),
(9, 11),
(10, 5);

INSERT INTO director (dni, nombre_completo, despacho) VALUES
("1111111A","Marc Andre Ter Stegen",1),
("1111111B","Gerard Pique",2),
("1111111C","Sergi Roberto",3),
("1111111D","Alejandro Balde",5),
("1111111E","Gavi",2),
("1111111F","Pedri",5),
("1111111G","Sergio Busquets",4),
("1111111H","Ansu Fati",6),
("1111111I","Ferran Torres",8),
("1111111J","Ousmane Dembele",9);
