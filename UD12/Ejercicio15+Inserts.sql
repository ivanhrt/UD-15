DROP DATABASE IF EXISTS menu_diario;
CREATE DATABASE menu_diario;
USE menu_diario;

DROP TABLE IF EXISTS menu;
CREATE TABLE menu (
id_menu INT AUTO_INCREMENT NOT NULL,
fecha DATE,
num_personas INT,
PRIMARY KEY (id_menu)
);

DROP TABLE IF EXISTS dia_semana;
CREATE TABLE dia_semana (
id_dia INT AUTO_INCREMENT NOT NULL,
nombre_dia VARCHAR(10) NOT NULL,
temperatura DOUBLE,
PRIMARY KEY (id_dia)
);

DROP TABLE IF EXISTS plato;
CREATE TABLE plato (
id_plato INT AUTO_INCREMENT NOT NULL,
nombre VARCHAR(20),
descripción VARCHAR(50),
tipo VARCHAR(20),
cantidad INT,
PRIMARY KEY (id_plato)
);

DROP TABLE IF EXISTS servir;
CREATE TABLE servir (
id_plato INT NOT NULL,
id_dia INT NOT NULL,
PRIMARY KEY (id_plato, id_dia),
FOREIGN KEY (id_plato)
REFERENCES plato(id_plato)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (id_dia)
REFERENCES dia_semana(id_dia)
ON DELETE CASCADE
ON UPDATE CASCADE
);

DROP TABLE IF EXISTS contener;
CREATE TABLE contener (
id_plato INT NOT NULL,
id_menu INT NOT NULL,
PRIMARY KEY (id_plato, id_menu),
FOREIGN KEY (id_plato)
REFERENCES plato(id_plato)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (id_menu)
REFERENCES menu(id_menu)
ON DELETE CASCADE
ON UPDATE CASCADE
);

INSERT INTO menu (fecha, num_personas) VALUES
('2022-11-01',12),
('2022-11-02',2),
('2022-11-03',22),
('2022-11-04',29),
('2022-11-05',11),
('2022-11-06',18),
('2022-11-07',122),
('2022-11-08',1),
('2022-11-09',32),
('2022-11-10',52);

INSERT INTO dia_semana (nombre_dia, temperatura) VALUES
("Lunes", 18),
("Martes", 19),
("Miercoles", 18),
("Jueves", 20),
("Viernes", 23),
("Sabado", 22),
("Domingo", 25);

INSERT INTO plato (nombre, descripción, tipo, cantidad) VALUES
("Macarrones boloñesa", "Macarrones con tomate", "Primer plato", 12),
("Patatas bravas", "Patatas fritas con salsa brava", "Entrante", 10),
("Bistec al roquefort", "Bistec de carne con salsa roquefort", "Segundo plato", 11),
("Macarrones pesto", "Macarrones con pesto", "Primer plato", 12),
("Patatas a lo pobre", "Patatas fritas con salsa picante", "Entrante", 10),
("Bistec a la pimienta", "Bistec de carne con salsa de pimienta", "Segundo plato", 11),
("Macarrones carbonara", "Macarrones con nata y huevo", "Primer plato", 12),
("Patatas a las salsas", "Patatas fritas con diferentes salsas", "Entrante", 10),
("Bistec a la mostaza", "Bistec de carne con salsa mostaza", "Segundo plato", 11),
("Coulant chocolate", "Pastel de chocolate", "Postre", 14);

INSERT INTO servir (id_plato, id_dia) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 3),
(5, 4),
(1, 4),
(2, 5),
(7, 1),
(8, 6),
(9, 5);

INSERT INTO contener (id_plato, id_menu) VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 1),
(4, 2),
(4, 3),
(5, 4),
(6, 1),
(7, 2),
(8, 3);