drop database if exists futbol;
create database futbol;
use futbol;

drop table if exists equipo;
create table equipo(
	id_equipo int not null auto_increment,
    nombre varchar(20),
    año_creacion int,
    primary key (id_equipo)
);

drop table if exists entrenador;
create table entrenador(
	id_entrenador int not null auto_increment,
    dni varchar(9) not null,
    nombre varchar(20),
    apellidos varchar(50),
    id_equipo int,
    foreign key (id_equipo) references equipo(id_equipo),
    primary key(id_entrenador)
);

drop table if exists jugador;
create table jugador(
    id_jugador int not null auto_increment,
    nombre varchar(20),
    apellidos varchar(50),
    dni varchar(9) not null,
    n_licencia int,
    id_equipo int,
    foreign key (id_equipo) references equipo(id_equipo),
    primary key (id_jugador)
);

drop table if exists arbitro;
create table arbitro(
	id_arbitro int not null auto_increment,
    dni varchar(9) not null,
    nombre varchar(20),
    apellidos varchar(50),
    primary key(id_arbitro)
);

drop table if exists estadio;
create table estadio(
	id_estadio int not null auto_increment,
    nombre varchar(30),
    localizacion varchar(50),
    año_creacion int,
    primary key(id_estadio)
);

drop table if exists partido;
create table partido(
	id_partido int not null auto_increment,
    jornada int,
    liga varchar(30),
    fecha date,
    id_arbitro int,
    foreign key (id_arbitro) references arbitro(id_arbitro),
	id_estadio int,
    foreign key (id_estadio) references estadio(id_estadio),
    primary key(id_partido)
);

drop table if exists partido_equipo;
create table partido_equipo(
	id_partido_equipo int not null auto_increment,
    id_equipo int,
    foreign key (id_equipo) references equipo(id_equipo),
    id_partido int,
    foreign key (id_partido) references partido(id_partido),
    primary key(id_partido_equipo)
);


-- INSERTS --

insert into equipo (nombre, año_creacion) values
	("Equipo1",1950),
    ("Equipo2",1955),
	("Equipo3",1960),
    ("Equipo4",1970),
    ("Equipo5",1980),
    ("Equipo6",1990),
    ("Equipo7",1990),
    ("Equipo8",2000),
    ("Equipo9",2010),
    ("Equipo10",2022);
    
    
insert into entrenador (dni, nombre, apellidos, id_equipo) values
	(111111111, "Entrenador1", "apellido1", 1),
    (222222222, "Entrenador2", "apellido2", 2),
    (333333333, "Entrenador3", "apellido3", 3),
    (444444444, "Entrenador4", "apellido4", 4),
    (555555555, "Entrenador5", "apellido5", 5),
    (666666666, "Entrenador6", "apellido6", 6),
    (777777777, "Entrenador7", "apellido7", 7),
    (888888888, "Entrenador8", "apellido8", 8),
    (999999999, "Entrenador9", "apellido9", 9),
    (123456789, "Entrenador10", "apellido10", 10);
    
insert into jugador (nombre, apellidos, dni, n_licencia, id_equipo) values
	("Jugador1", "Apellido1", 123456788, 100, 1),
    ("Jugador2", "Apellido2", 123456787, 200, 2),
    ("Jugador3", "Apellido3", 123456786, 300, 3),
    ("Jugador4", "Apellido4", 123456785, 400, 4),
    ("Jugador5", "Apellido5", 123456784, 500, 5),
    ("Jugador6", "Apellido6", 123456783, 600, 6),
    ("Jugador7", "Apellido7", 123456782, 700, 7),
    ("Jugador8", "Apellido8", 123456781, 800, 8),
    ("Jugador9", "Apellido9", 123456780, 900, 9),
    ("Jugador10", "Apellido10", 123456799, 1000, 10);
    
insert into arbitro (dni, nombre, apellidos) values
	(123123123,"Arbitro1", "Apellido11"),
    (123156788,"Arbitro2", "Apellido12");

insert into estadio (nombre, localizacion, año_creacion) values
	("Estadio1", "Localizacion1", 1990),
    ("Estadio2", "Localizacion2", 1980);
    
insert into partido (jornada, liga, fecha, id_arbitro, id_estadio) values
	(1, "Liga1", "2022-10-26",1,1),
	(2, "Liga2", "2022-10-25",2,2);

insert into partido_equipo (id_equipo, id_partido) values
	(2,1),
    (1,2);



