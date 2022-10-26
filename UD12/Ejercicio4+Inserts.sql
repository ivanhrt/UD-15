DROP DATABASE IF EXISTS guerras;
CREATE DATABASE guerras;
USE guerras;

DROP TABLE IF EXISTS pais;
CREATE TABLE pais (
nombre VARCHAR(20) NOT NULL,
pais_actualmente BOOLEAN,
PRIMARY KEY (nombre)
);

DROP TABLE IF EXISTS periodo_independencia;
CREATE TABLE periodo_independencia (
id_periodo INT AUTO_INCREMENT NOT NULL,
fecha_inicio DATE,
fecha_fin DATE,
nombre_pais VARCHAR(20),
PRIMARY KEY (id_periodo),
FOREIGN KEY (nombre_pais)
REFERENCES pais(nombre)
ON DELETE CASCADE
ON UPDATE CASCADE
);

DROP TABLE IF EXISTS bando;
CREATE TABLE bando (
nombre VARCHAR(20) NOT NULL,
ganador BOOLEAN,
PRIMARY KEY (nombre)
);

DROP TABLE IF EXISTS guerra;
CREATE TABLE guerra (
nombre VARCHAR(20) NOT NULL,
año_inicio INT,
año_fin INT,
PRIMARY KEY (nombre)
);

DROP TABLE IF EXISTS pertenece;
CREATE TABLE pertenece(
nombre_pais VARCHAR(20) NOT NULL,
nombre_bando VARCHAR(20) NOT NULL,
fecha_union DATE,
fecha_abandono DATE,
PRIMARY KEY (nombre_pais, nombre_bando),
FOREIGN KEY (nombre_pais)
REFERENCES pais(nombre)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (nombre_bando)
REFERENCES bando(nombre)
ON DELETE CASCADE
ON UPDATE CASCADE
);

DROP TABLE IF EXISTS participa;
CREATE TABLE participa(
nombre_guerra VARCHAR(20) NOT NULL,
nombre_bando VARCHAR(20) NOT NULL,
ganar BOOLEAN,
PRIMARY KEY (nombre_guerra, nombre_bando),
FOREIGN KEY (nombre_guerra)
REFERENCES guerra(nombre)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (nombre_bando)
REFERENCES bando(nombre)
ON DELETE CASCADE
ON UPDATE CASCADE
);


INSERT INTO pais (nombre, pais_actualmente) VALUES
("Laos",true),
("Trinidad y Tobago",true),
("Sri Lanka",true),
("Taiwan",true),
("Prusia",false),
("Kirguistan",true),
("Yugoslavia",false),
("India",true),
("Kuwait",true),
("Macedonia",false);

INSERT INTO periodo_independencia (fecha_inicio, fecha_fin, nombre_pais) VALUES
('1951-01-10', null, "Laos"),
('1951-01-10', null, "Sri Lanka"),
('1951-01-10', null, "Taiwan"),
('1701-01-10', '1881-01-10', "Prusia"),
('1951-01-10', '2022-01-10', "Prusia"),
('1951-01-10', null, "Laos"),
('1951-01-10', null, "Kuwait"),
('1951-01-10', null, "India"),
('1951-01-10', '2022-01-10', "Yugoslavia"),
('1951-01-10', '2022-01-10', "Macedonia");

INSERT INTO bando (nombre, ganador) VALUES
("La alianza",true),
("El eje",false),
("Corona catalana",true),
("URSS",true),
("Balticos",false),
("Americanos",true),
("Orientales",false),
("Otomanos",true),
("Balcanicos",true),
("Camaradas",false);

INSERT INTO guerra (nombre, año_inicio, año_fin) VALUES
("La gran guerra", 1999, 2021),
("La guerra del cafe", 1702, 1709),
("La 1a guerra mundia", 1918, 1926),
("La 2a guerra mundial", 1936, 1939),
("La guerra de Vietnam", 1989, 1992),
("La guerra mundial", 1502, 1505),
("La guerra de secesio", 1604, 1609),
("La guerra de sucesio", 1759, 1762),
("La guerra carlina", 1699, 1700),
("La guerra púnica", 300, 303);

INSERT INTO pertenece (nombre_pais, nombre_bando, fecha_union, fecha_abandono) VALUES
("Taiwan", "La alianza", '1999-01-10', '1999-10-10'),
("Taiwan", "El eje", '1999-01-10', '1999-010-10'),
("India", "Camaradas", '1999-01-10', null),
("Yugoslavia", "Balcanicos", '1999-01-10', '2022-10-10'),
("Kirguistan", "La alianza", '1999-01-10', '1999-10-10'),
("Trinidad y Tobago", "La alianza", '1999-01-10', '1999-10-10'),
("Sri Lanka", "Corona catalana", '1999-01-10', '1999-01-10'),
("Macedonia", "Balcanicos", '1999-01-10', '1999-01-10'),
("Prusia", "La alianza", '1999-01-10', '1999-10-10'),
("Taiwan", "Orientales", '1999-01-10', null);

INSERT INTO participa (nombre_bando, nombre_guerra, ganar) VALUES
("Americanos", "La gran guerra", true);
INSERT INTO participa (nombre_bando, nombre_guerra, ganar) VALUES
("Camaradas", "La guerra púnica", true);
INSERT INTO participa (nombre_bando, nombre_guerra, ganar) VALUES
("Corona catalana", "La guerra púnica", true);
INSERT INTO participa (nombre_bando, nombre_guerra, ganar) VALUES
("La alianza", "La guerra púnica", true);
INSERT INTO participa (nombre_bando, nombre_guerra, ganar) VALUES
("Otomanos", "La gran guerra", true);
INSERT INTO participa (nombre_bando, nombre_guerra, ganar) VALUES
("Balcanicos", "La guerra púnica", true);
INSERT INTO participa (nombre_bando, nombre_guerra, ganar) VALUES
("El eje", "La 2a guerra mundial", false);
