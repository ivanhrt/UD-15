drop database if exists ejercicio6_ER;

CREATE DATABASE ejercicio9_ER;
use ejercicio9_ER;




create table ingredientes(
idIngredientes int(4) auto_increment primary key,
nombre nvarchar(24),
fechaCaducidad date
);

insert into ingredientes(nombre,fechaCaducidad) values
("tomate",current_date()),
("cebolla",current_date()),
("ternera",current_date()),
("cerdo",current_date()),
("pollo",current_date()),
("arroz",current_date()),
("pasta",current_date()),
("pan",current_date()),
("pavo",current_date()),
("costilla",current_date());

create table receta(
idReceta int(4) auto_increment primary key,
nombre text default null,
dificultad char(1)
);

insert into recet(descripcion, dificultad) values 
("carne con cebolla",'B'),
("paella",'S'),
("tres carnes",'F'),
("costillas bbk",'A'),
("pan indio",'C'),
("pollo al curry",'B'),
("arroz paisa",'F'),
("pavo picante",'S'),
("macarrones con verdura",'C'),
("wok de cerdo",'A');

create table utencilios(
idUtencilios int(4) auto_increment primary key,
nombre nvarchar(24),
descripcion text(255) default null,
cantidad int(3)
);

insert into utencilios(nombre,descripcion,cantidad) values
("olla","para hervir las verdiras",3),
("sarten","Para freir",3),
("cuchara",null,3),
("cuchillo","para cortar la carne",3),
("agitador",null,3),
("bartidora","para montar la salsa",3),
("cafetera",null,3),
("vasos",null,3),
("tortadora","Tostadora de pan",3),
("vaporera","vaporera asiatica para entrantes",3);

create table platos (
idPlato int(4) auto_increment primary key,
nombre nvarchar(24),
tiempo int,
idUtencilios int(4),
idReceta int(4),
idIngredientes int(4),
KEY (idUtencilios),
FOREIGN KEY (idUtencilios) REFERENCES utencilios (idUtencilios) 
ON DELETE cascade on update cascade,
KEY (idReceta),
FOREIGN KEY (idReceta) REFERENCES receta (idReceta) 
ON DELETE cascade on update cascade,
KEY (idIngredientes),
FOREIGN KEY (idIngredientes) REFERENCES ingredientes (idIngredientes) 
ON DELETE cascade on update cascade
);

insert into platos(nombre,tiempo,idUtencilios,idReceta,idIngredientes) values
("carne con cebolla",60,1,5,3),
("paella",45,10,9,3),
("tres carnes",90,5,5,8),
("costillas bbk",15,9,6,10),
("pan indio",140,6,10,4),
("pollo al curry",60,8,10,2),
("arroz paisa",45,9,2,1),
("pavo picante",20,4,2,8),
("macarrones con verdura",75,6,7,1),
("wok de cerdo",120,8,2,9);
