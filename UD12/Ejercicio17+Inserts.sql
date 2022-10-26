DROP DATABASE IF EXISTS horario_escolar;
CREATE DATABASE horario_escolar;
USE horario_escolar;

DROP TABLE IF EXISTS ciclo;
CREATE TABLE ciclo (
id_ciclo INT AUTO_INCREMENT NOT NULL,
nombre VARCHAR(20),
tipo VARCHAR(20),
PRIMARY KEY (id_ciclo)
);

DROP TABLE IF EXISTS asignatura;
CREATE TABLE asignatura (
codigo_europeo INT AUTO_INCREMENT NOT NULL,
codigo_interno INT NOT NULL,
nombre VARCHAR(20),
PRIMARY KEY (codigo_europeo)
);

DROP TABLE IF EXISTS contiene;
CREATE TABLE contiene (
codigo_europeo INT  NOT NULL,
id_ciclo INT NOT NULL,
curso INT,
PRIMARY KEY (codigo_europeo, id_ciclo),
FOREIGN KEY (codigo_europeo)
REFERENCES asignatura(codigo_europeo)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (id_ciclo)
REFERENCES ciclo(id_ciclo)
ON DELETE CASCADE
ON UPDATE CASCADE
);

DROP TABLE IF EXISTS horario;
CREATE TABLE horario (
id_horario INT AUTO_INCREMENT NOT NULL,
dia DATE,
hora INT,
PRIMARY KEY (id_horario)
);

DROP TABLE IF EXISTS aula;
CREATE TABLE aula (
codigo_aula INT AUTO_INCREMENT NOT NULL,
nombre VARCHAR(20),
numero INT,
medida INT,
PRIMARY KEY (codigo_aula)
);

DROP TABLE IF EXISTS hacer_clase;
CREATE TABLE hacer_clase (
codigo_europeo INT  NOT NULL,
id_horario INT NOT NULL,
codigo_aula INT NOT NULL,
PRIMARY KEY (codigo_europeo, id_horario, codigo_aula),
FOREIGN KEY (codigo_europeo)
REFERENCES asignatura(codigo_europeo)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (id_horario)
REFERENCES horario(id_horario)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (codigo_aula)
REFERENCES aula(codigo_aula)
ON DELETE CASCADE
ON UPDATE CASCADE
);

DROP TABLE IF EXISTS profesor;
CREATE TABLE profesor (
dni VARCHAR(10) NOT NULL,
nombre VARCHAR(20),
apellido VARCHAR(20),
telefono VARCHAR(20),
direccion VARCHAR(20),
email VARCHAR(20),
nss VARCHAR(20),
codigo_interno INT,
años_antiguedad INT,
PRIMARY KEY (dni)
);

DROP TABLE IF EXISTS imparte;
CREATE TABLE imparte (
codigo_europeo INT NOT NULL,
dni VARCHAR(10) NOT NULL,
fecha_inicio DATE,
fecha_fin DATE,
PRIMARY KEY (codigo_europeo, dni),
FOREIGN KEY (codigo_europeo)
REFERENCES asignatura(codigo_europeo)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (dni)
REFERENCES profesor(dni)
ON DELETE CASCADE
ON UPDATE CASCADE
);

INSERT INTO ciclo (nombre, tipo) VALUES
("CAFE", "Ciclo superior"),
("CAE", "Ciclo superior"),
("CEF", "Ciclo superior"),
("CAFA", "Ciclo superior"),
("CAPE", "Ciclo superior"),
("CAP", "Ciclo superior"),
("CAPA", "Ciclo superior"),
("CAFP", "Ciclo superior"),
("CA", "Ciclo superior"),
("CAPEF", "Ciclo superior");

INSERT INTO asignatura (nombre, codigo_interno) VALUES
("Matematicas", 1),
("Tutoria", 2),
("Fisica", 3),
("Educacion Fisica", 4),
("Quimica", 5),
("Sociales", 6),
("Lengua", 7),
("Lengia extranjera", 8),
("Biologia", 9),
("Valores", 10);

INSERT INTO contiene (id_ciclo, codigo_europeo, curso) VALUES
(1, 1, 1),
(1, 2, 1),
(1, 3, 1),
(1, 4, 1),
(2, 5, 2),
(2, 1, 2),
(2, 3, 2),
(1, 7, 3),
(3, 8, 3),
(4, 9, 3);

INSERT INTO horario (dia, hora) VALUES
('2022-11-01',12),
('2022-11-02',11),
('2022-11-03',13),
('2022-11-04',9),
('2022-11-05',10),
('2022-11-06',15),
('2022-11-07',11),
('2022-11-08',12),
('2022-11-09',14),
('2022-11-10',10);

INSERT INTO aula (nombre, numero, medida) VALUES
("Aula A", 1, 20),
("Aula B", 2, 20),
("Aula C", 3, 20),
("Aula D", 4, 20),
("Aula E", 5, 20),
("Aula F", 6, 20),
("Aula G", 7, 20),
("Aula H", 8, 20),
("Aula I", 9, 20),
("Aula J", 10, 20);

INSERT INTO hacer_clase (codigo_aula, codigo_europeo, id_horario) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 1, 3),
(4, 4, 3),
(5, 5, 4),
(1, 9, 1),
(3, 4, 4),
(7, 3, 5),
(9, 10, 6),
(8, 2, 7);

INSERT INTO profesor (dni, nombre, apellido, direccion, telefono, email, nss, codigo_interno, años_antiguedad) VALUES
("11111111A", "Roberto", "Lopez", "Calle Madrid", "+34977778899", "profesor@correo.com", "29219129219A", 1, 3),
("11111111B", "Luis", "Jaquez", "Calle Madrid", "+34977778899", "profesor@correo.com", "29219129219A", 2, 2),
("11111111C", "Andres", "Malagon", "Calle Madrid", "+34977778899", "profesor@correo.com", "29219129219A", 3, 3),
("11111111D", "Roberto", "Heras", "Calle Madrid", "+34977778899", "profesor@correo.com", "29219129219A", 4, 5),
("11111111E", "Francisco", "Andrades", "Calle Madrid", "+34977778899", "profesor@correo.com", "29219129219A", 5, 1),
("11111111F", "Jose", "Victorino", "Calle Madrid", "+34977778899", "profesor@correo.com", "29219129219A", 6, 4),
("11111111G", "Ana", "Mena", "Calle Madrid", "+34977778899", "profesor@correo.com", "29219129219A", 7, 11),
("11111111H", "Maria", "Becerra", "Calle Madrid", "+34977778899", "profesor@correo.com", "29219129219A", 8, 2),
("11111111I", "Rigoberta", "Bandini", "Calle Madrid", "+34977778899", "profesor@correo.com", "29219129219A", 9, 1),
("11111111AJ", "Sara", "Abad", "Calle Madrid", "+34977778899", "profesor@correo.com", "29219129219A", 10, 3);

INSERT INTO imparte (codigo_europeo, dni, fecha_inicio, fecha_fin) VALUES
(1, "11111111A", '2022-10-01', '2022-12-01'),
(2, "11111111B", '2022-11-02', '2022-12-01'),
(2, "11111111C", '2022-12-03', '2022-12-01'),
(1, "11111111B", '2022-10-04', '2022-11-01'),
(3, "11111111D", '2022-10-05', '2022-11-01'),
(3, "11111111E", '2022-10-06', '2022-11-01'),
(5, "11111111E", '2022-10-01', '2022-11-01'),
(7, "11111111F", '2022-10-01', '2022-11-01'),
(9, "11111111G", '2022-10-01', '2022-11-01'),
(10, "11111111A", '2022-10-01', '2022-11-01');