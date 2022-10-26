DROP DATABASE IF EXISTS investigacion;
CREATE DATABASE investigacion;

USE investigacion;

DROP TABLE IF EXISTS facultad;

CREATE TABLE facultad (
  codigo int NOT NULL AUTO_INCREMENT,
  nombre varchar(100) DEFAULT NULL,
  PRIMARY KEY (codigo)
);

DROP TABLE IF EXISTS investigadores;

CREATE TABLE investigadores (
  DNI varchar(8) NOT NULL,
  nomApels varchar(255) DEFAULT NULL,
  facultad int DEFAULT NULL,
  PRIMARY KEY (DNI),
  FOREIGN KEY (facultad) REFERENCES facultad(codigo) 
  ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS equipos;

CREATE TABLE equipos (
  numSerie char(4) NOT NULL,
  nombre varchar(100) DEFAULT NULL,
  facultad int DEFAULT NULL,
  PRIMARY KEY (numSerie),
  FOREIGN KEY (facultad) REFERENCES facultad(codigo) 
  ON DELETE CASCADE ON UPDATE CASCADE
);


DROP TABLE IF EXISTS reserva;

CREATE TABLE reserva (
  DNI varchar(8) NOT NULL,
  numSerie char(4) NOT NULL,
  comienzo datetime DEFAULT NULL,
  fin datetime DEFAULT NULL,
  PRIMARY KEY (DNI,numSerie),
  FOREIGN KEY (DNI) REFERENCES investigadores(DNI) 
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (numSerie) REFERENCES equipos(numSerie) 
  ON DELETE CASCADE ON UPDATE CASCADE
);

-- INSERTS --

insert into facultad (nombre) values
	("Facultad1"),
    ("Facultad2"),
    ("Facultad3"),
    ("Facultad4"),
    ("Facultad5"),
    ("Facultad6"),
    ("Facultad7"),
    ("Facultad8"),
    ("Facultad9"),
    ("Facultad10");
    
insert into equipos (numSerie, nombre, facultad) values
	("11", "Equipo1", 1),
    ("22", "Equipo2", 2),
    ("33", "Equipo3", 3),
    ("44", "Equipo4", 4),
    ("55", "Equipo5", 5),
    ("66", "Equipo6", 6),
    ("77", "Equipo7", 7),
    ("88", "Equipo8", 8),
    ("99", "Equipo9", 9),
    ("10", "Equipo10", 10);
    
insert into investigadores (DNI, nomApels, facultad) values
	("11111111", "Nombre1", 1),
    ("22222222", "Nombre2", 2),
    ("33333333", "Nombre3", 3),
    ("44444444", "Nombre4", 4),
    ("55555555", "Nombre5", 5),
    ("66666666", "Nombre6", 6),
    ("77777777", "Nombre7", 7),
    ("88888888", "Nombre8", 8),
    ("99999999", "Nombre9", 9),
    ("12345678", "Nombre10", 10);
    
insert into reserva (DNI, numSerie, comienzo, fin) values
	("11111111", "11", "2022-01-01 10:20:00", "2020-10-10 10:30:00"),
    ("22222222", "22", "2022-01-01 10:20:00", "2020-10-10 10:30:00"),
    ("33333333", "33", "2022-01-01 10:20:00", "2020-10-10 10:30:00"),
    ("44444444", "44", "2022-01-01 10:20:00", "2020-10-10 10:30:00"),
    ("55555555", "55", "2022-01-01 10:20:00", "2020-10-10 10:30:00"),
    ("66666666", "66", "2022-01-01 10:20:00", "2020-10-10 10:30:00"),
    ("77777777", "77", "2022-01-01 10:20:00", "2020-10-10 10:30:00"),
    ("88888888", "88", "2022-01-01 10:20:00", "2020-10-10 10:30:00"),
    ("99999999", "99", "2022-01-01 10:20:00", "2020-10-10 10:30:00"),
    ("12345678", "10", "2022-01-01 10:20:00", "2020-10-10 10:30:00");