DROP DATABASE IF EXISTS biblioteca;
CREATE DATABASE biblioteca;
USE biblioteca;

DROP TABLE IF EXISTS autor;
CREATE TABLE autor (
id_autor INT AUTO_INCREMENT NOT NULL,
nombre VARCHAR(50),
PRIMARY KEY (id_autor)
);

DROP TABLE IF EXISTS libro;
CREATE TABLE libro (
isbn VARCHAR(20) NOT NULL,
editorial VARCHAR(20),
titulo VARCHAR(30),
año_escritura INT,
PRIMARY KEY (isbn)
);

DROP TABLE IF EXISTS escribe;
CREATE TABLE escribe (
id_autor INT NOT NULL,
isbn VARCHAR(20) NOT NULL,
PRIMARY KEY (id_autor, isbn),
FOREIGN KEY (id_autor)
REFERENCES autor(id_autor)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (isbn)
REFERENCES libro(isbn)
ON DELETE CASCADE
ON UPDATE CASCADE
);

DROP TABLE IF EXISTS volumen;
CREATE TABLE volumen (
id_volumen INT AUTO_INCREMENT NOT NULL,
deteriorado BOOLEAN,
isbn VARCHAR(20) NOT NULL,
PRIMARY KEY (id_volumen),
FOREIGN KEY (isbn)
REFERENCES libro(isbn)
ON DELETE CASCADE
ON UPDATE CASCADE
);

DROP TABLE IF EXISTS persona;
CREATE TABLE persona (
dni VARCHAR(10) NOT NULL,
codigo_socio INT NOT NULL,
nombre VARCHAR(15) NOT NULL,
apellidos VARCHAR(20),
direccion VARCHAR(30),
telefono VARCHAR(30),
PRIMARY KEY (dni, codigo_socio)
);

DROP TABLE IF EXISTS prestamo;
CREATE TABLE prestamo (
id_prestamo INT AUTO_INCREMENT NOT NULL,
fecha_prestamo DATE,
fecha_devolucion DATE,
fecha_devolucion_real DATE,
dni VARCHAR(10) NOT NULL,
PRIMARY KEY (id_prestamo),
FOREIGN KEY (dni)
REFERENCES persona(dni)
ON DELETE CASCADE
ON UPDATE CASCADE
);


INSERT INTO autor (nombre) VALUES
("Lorenzo Brown"),
("Alberto Díaz"),
("Juancho Hernangómez"),
("Willy Hernangómez"),
("Jaime Fernández"),
("Rudy Fernández"),
("Joel Parra"),
("Usman Garuba"),
("Xavi López"),
("Darío Brizuela");

INSERT INTO libro (isbn, editorial, titulo, año_escritura) VALUES
("123-456-189-0", "Barcanova", "El sueño de Morfeo", 1998),
("153-456-789-5", "El barquet", "Lo que el viento se llevó", 2001),
("973-156-719-9", "Santillana", "Seamos arte", 1999),
("127-456-789-5", "Grupo Planeta", "El alquimista", 1900),
("123-426-789-7", "Trillo", "Hero", 2000),
("125-456-181-5", "Josean", "Bienvenido Mr. Marshall", 2021),
("423-456-789-5", "Barcanova", "Unidos", 2005),
("123-416-189-4", "El barquet", "Jesucristo Superstar", 2010),
("123-956-779-3", "Santillana", "Rambo", 1998),
("123-456-781-2", "Barcanova", "Django", 2020);

INSERT INTO escribe(id_autor, isbn) VALUES
(1, "123-456-189-0"),
(1, "153-456-789-5"),
(2, "127-456-789-5"),
(2, "123-426-789-7"),
(3, "125-456-181-5"),
(4, "423-456-789-5"),
(5, "123-416-189-4"),
(5, "123-956-779-3"),
(6, "123-456-781-2"),
(7, "973-156-719-9");

INSERT INTO volumen(deteriorado, isbn) VALUES
(true, "123-456-189-0"),
(false, "153-456-789-5"),
(false, "127-456-789-5"),
(false, "123-426-789-7"),
(false, "125-456-181-5"),
(true, "423-456-789-5"),
(true, "123-416-189-4"),
(false, "123-956-779-3"),
(true, "123-456-781-2"),
(true, "973-156-719-9");

INSERT INTO persona (dni, codigo_socio, nombre, apellidos, direccion, telefono) VALUES
("11111111A",1,"LeBron", "James", "Los Angeles Street", "+29 001982761"),
("11111111B",2,"Dwayne", "Wade", "Miami Street", "+29 001982761"),
("11111111C",3,"Chris", "Bosh", "Toronto Street", "+29 001982761"),
("11111111D",4,"Carlos", "Boozer", "Utah Street", "+29 001982761"),
("11111111E",5,"Carmelo", "Anthony", "Denver Street", "+29 001982761"),
("11111111F",6,"Kobe", "Bryant", "Los Angeles Street", "+29 001982761"),
("11111111G",7,"Dwight", "Howard", "Los Angeles Street", "+29 001982761"),
("11111111H",8,"Jason", "Kidd", "Dallas Street", "+29 001982761"),
("11111111I",9,"Tim", "Duncan", "San Antonio Street", "+29 001982761"),
("11111111J",10,"Michael", "Redd", "Chicago Street", "+29 001982761");

INSERT INTO prestamo (fecha_prestamo, fecha_devolucion, fecha_devolucion_real, dni) VALUES
('2022-01-10', '2022-11-11', '2022-10-11', "11111111A"),
('2022-05-11', '2022-12-12', '2022-10-10', "11111111B"),
('2022-03-12', '2022-11-12', '2022-10-10', "11111111B"),
('2022-01-13', '2022-10-13', '2022-10-10', "11111111C"),
('2022-02-14', '2022-10-14', '2022-10-13', "11111111D"),
('2022-06-15', '2022-10-10', '2022-10-10', "11111111E"),
('2022-07-15', '2022-10-17', '2022-10-10', "11111111F"),
('2022-03-16', '2022-10-19', '2022-10-10', "11111111G"),
('2022-02-17', '2022-10-11', '2022-10-10', "11111111H"),
('2022-02-18', '2022-10-15', '2022-10-12', "11111111J");
