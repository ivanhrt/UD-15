drop database if exists restaurante;
create database restaurante;
use restaurante;

create table Empleado(
	id_empleado int not null auto_increment,
	nombre varchar(20),
	apellidos varchar(50),
	dni varchar(9) not null,
	nss int,
	tel_fijo int,
	movil int,
	key (id_empleado)
);

create table Cocinero(
	id_empleado int not null,
	fecha_inicial date,
	foreign key (id_empleado) references Empleado(id_empleado)
);

create table Pinche(
	id_empleado int not null,
    id_supervisor int not null,
	fecha_nacimiento date,
	foreign key (id_empleado) references Empleado(id_empleado),
    foreign key (id_supervisor) references Cocinero(id_empleado)
);

create table Plato(
	id_plato int not null auto_increment,
    nombre varchar(20),
    precio double,
    tipo varchar(20),
    key (id_plato)
);

create table CocineroPlato(
id_cocinero int not null,
id_plato int not null,
foreign key (id_cocinero) references Cocinero (id_empleado),
foreign key (id_plato) references Plato (id_plato)
);

create table Ingrediente(
	id_ingrediente int not null auto_increment,
	nombre varchar(20),
    precio double,
	key (id_ingrediente)
);

create table PlatoIngrediente(
	id_ingrediente int not null,
	id_plato int not null,
	foreign key (id_ingrediente) references Ingrediente (id_ingrediente),
	foreign key (id_plato) references Plato (id_plato)
);

create table Almacen(
	id_almacen int not null auto_increment,
	descripcion varchar(200),
	nombre varchar(20),
	key (id_almacen)
);

create table Estante(
	id_estante int not null auto_increment,
    medida double,
    id_almacen int not null,
    foreign key (id_almacen) references Almacen (id_almacen),
    key (id_estante)
);

create table IngredienteEstante(
	id_ingrediente int not null,
    id_estante int not null,
    foreign key (id_ingrediente) references Ingrediente (id_ingrediente),
    foreign key (id_estante) references Estante (id_estante)
);

INSERT INTO Empleado(nombre, apellidos, dni, nss,tel_fijo,movil) VALUES("Empleado1","Apellido1",41046881,100000,602509473,453654453);
INSERT INTO Empleado(nombre, apellidos, dni, nss,tel_fijo,movil) VALUES("Empleado2","Apellido2",41046882,200000,456456456,786987687);
INSERT INTO Empleado(nombre, apellidos, dni, nss,tel_fijo,movil) VALUES("Empleado3","Apellido3",41046883,300000,654654654,963858685);
INSERT INTO Empleado(nombre, apellidos, dni, nss,tel_fijo,movil) VALUES("Empleado4","Apellido4",41046884,400000,789789789,857457845);
INSERT INTO Empleado(nombre, apellidos, dni, nss,tel_fijo,movil) VALUES("Empleado5","Apellido5",41046885,500000,987987987,421501251);
INSERT INTO Empleado(nombre, apellidos, dni, nss,tel_fijo,movil) VALUES("Empleado6","Apellido6",41046886,600000,123123123,635024152);
INSERT INTO Empleado(nombre, apellidos, dni, nss,tel_fijo,movil) VALUES("Empleado7","Apellido7",41046887,700000,321321321,524859865);
INSERT INTO Empleado(nombre, apellidos, dni, nss,tel_fijo,movil) VALUES("Empleado8","Apellido8",41046888,800000,741741741,320320320);
INSERT INTO Empleado(nombre, apellidos, dni, nss,tel_fijo,movil) VALUES("Empleado9","Apellido9",41046889,900000,147147147,321654745);
INSERT INTO Empleado(nombre, apellidos, dni, nss,tel_fijo,movil) VALUES("Empleado10","Apellido10",41046810,100001,855555555,456564565);

INSERT INTO Cocinero(id_empleado,fecha_inicial) VALUES(1,"2020-01-10");
INSERT INTO Cocinero(id_empleado,fecha_inicial) VALUES(2,"2021-02-9");
INSERT INTO Cocinero(id_empleado,fecha_inicial) VALUES(3,"2022-03-10");

INSERT INTO Pinche(id_empleado,id_supervisor,fecha_nacimiento) VALUES(4,1,"2000-03-12");
INSERT INTO Pinche(id_empleado,id_supervisor,fecha_nacimiento) VALUES(5,2,"2002-05-10");
INSERT INTO Pinche(id_empleado,id_supervisor,fecha_nacimiento) VALUES(6,3,"2003-09-10");
INSERT INTO Pinche(id_empleado,id_supervisor,fecha_nacimiento) VALUES(7,1,"1995-12-12");
INSERT INTO Pinche(id_empleado,id_supervisor,fecha_nacimiento) VALUES(8,2,"1985-11-10");
INSERT INTO Pinche(id_empleado,id_supervisor,fecha_nacimiento) VALUES(9,2,"1999-03-10");
INSERT INTO Pinche(id_empleado,id_supervisor,fecha_nacimiento) VALUES(10,3,"2000-10-01");

INSERT INTO Plato(nombre, precio, tipo) VALUES("Ensalada", 8, "primer plato");
INSERT INTO Plato(nombre, precio, tipo) VALUES("Entrecot", 14, "segundo plato");
INSERT INTO Plato(nombre, precio, tipo) VALUES("Coulant de chocolate", 5, "Postre");

INSERT INTO CocineroPlato(id_cocinero,id_plato) VALUES(1,1);
INSERT INTO CocineroPlato(id_cocinero,id_plato) VALUES(1,2);
INSERT INTO CocineroPlato(id_cocinero,id_plato) VALUES(1,3);
INSERT INTO CocineroPlato(id_cocinero,id_plato) VALUES(2,2);
INSERT INTO CocineroPlato(id_cocinero,id_plato) VALUES(3,3);

INSERT INTO Ingrediente(nombre) VALUES("Lechuga");
INSERT INTO Ingrediente(nombre) VALUES("Cebolla");
INSERT INTO Ingrediente(nombre) VALUES("Tomate");
INSERT INTO Ingrediente(nombre) VALUES("Aceite");
INSERT INTO Ingrediente(nombre) VALUES("Salsa roquefort");
INSERT INTO Ingrediente(nombre) VALUES("Entrecot crudo");
INSERT INTO Ingrediente(nombre) VALUES("Chocolate");
INSERT INTO Ingrediente(nombre) VALUES("Azucar");
INSERT INTO Ingrediente(nombre) VALUES("Huevos");
INSERT INTO Ingrediente(nombre) VALUES("Harina");

INSERT INTO PlatoIngrediente(id_plato,id_ingrediente) VALUES(1,1);
INSERT INTO PlatoIngrediente(id_plato,id_ingrediente) VALUES(1,2);
INSERT INTO PlatoIngrediente(id_plato,id_ingrediente) VALUES(1,3);
INSERT INTO PlatoIngrediente(id_plato,id_ingrediente) VALUES(1,4);
INSERT INTO PlatoIngrediente(id_plato,id_ingrediente) VALUES(2,5);
INSERT INTO PlatoIngrediente(id_plato,id_ingrediente) VALUES(2,6);
INSERT INTO PlatoIngrediente(id_plato,id_ingrediente) VALUES(3,7);
INSERT INTO PlatoIngrediente(id_plato,id_ingrediente) VALUES(3,8);
INSERT INTO PlatoIngrediente(id_plato,id_ingrediente) VALUES(3,9);
INSERT INTO PlatoIngrediente(id_plato,id_ingrediente) VALUES(3,10);

INSERT INTO  Almacen(descripcion,nombre) VALUES("Almacen unico del que dispone el restaurante","Almacen1");

INSERT INTO Estante(medida, id_almacen)  VALUES(1,1);
INSERT INTO Estante(medida, id_almacen)  VALUES(2,1);
INSERT INTO Estante(medida, id_almacen)  VALUES(2,1);
INSERT INTO Estante(medida, id_almacen)  VALUES(5,1);
INSERT INTO Estante(medida, id_almacen)  VALUES(4,1);
INSERT INTO Estante(medida, id_almacen)  VALUES(4,1);
INSERT INTO Estante(medida, id_almacen)  VALUES(1,1);
INSERT INTO Estante(medida, id_almacen)  VALUES(6,1);
INSERT INTO Estante(medida, id_almacen)  VALUES(10,1);
INSERT INTO Estante(medida, id_almacen)  VALUES(2,1);

INSERT INTO IngredienteEstante(id_ingrediente,id_estante) values(1,1);
INSERT INTO IngredienteEstante(id_ingrediente,id_estante) values(2,1);
INSERT INTO IngredienteEstante(id_ingrediente,id_estante) values(3,2);
INSERT INTO IngredienteEstante(id_ingrediente,id_estante) values(4,2);
INSERT INTO IngredienteEstante(id_ingrediente,id_estante) values(5,1);
INSERT INTO IngredienteEstante(id_ingrediente,id_estante) values(6,5);
INSERT INTO IngredienteEstante(id_ingrediente,id_estante) values(7,4);
INSERT INTO IngredienteEstante(id_ingrediente,id_estante) values(8,4);
