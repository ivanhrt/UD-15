drop database if exists red_social;
create database red_social;
use red_social;

create table usuario(
	id_usuario int primary key auto_increment,
    contraseña varchar(20),
    nombre varchar(20),
    direccion varchar(50),
    telefono int,
    email varchar(40),
    escelebridad boolean
);

create table contacto(
	id_contacto int primary key auto_increment,
    comentario varchar(50),
    id_usuario int,
    foreign key (id_usuario) references usuario (id_usuario)
);

create table bloqueado(
	id_bloqueado int primary key auto_increment,
    comentario varchar(50),
    id_usuario int,
    foreign key (id_usuario) references usuario (id_usuario)
);

create table grupo(
	id_grupo int primary key auto_increment,
    nombre varchar(30),
    organizador int,
    foreign key (organizador) references usuario (id_usuario)
);

create table comentario(
	id_comentario int primary key auto_increment,
    nombre varchar(30),
    id_usuario int,
    foreign key (id_usuario) references usuario (id_usuario)
);

insert into usuario (contraseña, nombre, direccion, telefono, email, escelebridad) values ("contraseña1", "nombre1", "direccion1", 123123123, "email1", false);
insert into usuario (contraseña, nombre, direccion, telefono, email, escelebridad) values ("contraseña2", "nombre2", "direccion2", 123456789, "email2", true);
insert into usuario (contraseña, nombre, direccion, telefono, email, escelebridad) values ("contraseña3", "nombre3", "direccion3", 456789123, "email3", false);
insert into usuario (contraseña, nombre, direccion, telefono, email, escelebridad) values ("contraseña4", "nombre4", "direccion4", 654987321, "email4", true);
insert into usuario (contraseña, nombre, direccion, telefono, email, escelebridad) values ("contraseña5", "nombre5", "direccion5", 654654654, "email5", true);
insert into usuario (contraseña, nombre, direccion, telefono, email, escelebridad) values ("contraseña6", "nombre6", "direccion6", 123123123, "email6", false);
insert into usuario (contraseña, nombre, direccion, telefono, email, escelebridad) values ("contraseña7", "nombre7", "direccion7", 987785452, "email7", false);
insert into usuario (contraseña, nombre, direccion, telefono, email, escelebridad) values ("contraseña8", "nombre8", "direccion8", 633511525, "email8", true);
insert into usuario (contraseña, nombre, direccion, telefono, email, escelebridad) values ("contraseña9", "nombre9", "direccion9", 645978978, "email9", false);
insert into usuario (contraseña, nombre, direccion, telefono, email, escelebridad) values ("contraseña10", "nombre10", "direccion10", 312321321, "email10", false);

insert into contacto (comentario, id_usuario) values ("amigo", 1);
insert into contacto (comentario, id_usuario) values ("amigo", 2);
insert into contacto (comentario, id_usuario) values ("colegio", 3);
insert into contacto (comentario, id_usuario) values ("trabajo", 5);
insert into contacto (comentario, id_usuario) values ("conocido", 7);
insert into contacto (comentario, id_usuario) values ("familiar", 8);
insert into contacto (comentario, id_usuario) values ("amigo", 10);

insert into bloqueado (comentario, id_usuario) values ("me ha insultado", 4);
insert into bloqueado (comentario, id_usuario) values ("es un bot", 6);
insert into bloqueado (comentario, id_usuario) values ("por hacer spam", 9);

insert into grupo (nombre, organizador) values ("Los avengers", 1);
insert into grupo (nombre, organizador) values ("Los masca chicles", 1);
insert into grupo (nombre, organizador) values ("Los panas", 1);
insert into grupo (nombre, organizador) values ("We are bilingües", 1);

insert into comentario (nombre, id_usuario) values ("Comentario1", 1);
insert into comentario (nombre, id_usuario) values ("Comentario2", 5);
insert into comentario (nombre, id_usuario) values ("Comentario3", 4);
insert into comentario (nombre, id_usuario) values ("Comentario4", 1);
insert into comentario (nombre, id_usuario) values ("Comentario5", 8);