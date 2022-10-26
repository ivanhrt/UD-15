drop database if exists geografia;
create database geografia;

use geografia;

drop table if exists localidad;
create table localidad(
	id_localidad int not null auto_increment,
    nombre varchar(100),
    poblacion int,
    id_provincia int,
    primary key (id_localidad)
);

drop table if exists provincia;
create table provincia(
	id_provincia int not null auto_increment,
    nombre varchar(100),
    poblacion int,
    superficie double,
    id_capital int,
    id_comunidad int,
    primary key (id_provincia)
);

drop table if exists comunidad;
create table comunidad(
	id_comunidad int not null auto_increment,
    nombre varchar(100),
    poblacion int,
    superficie double,
    id_capital int,
    primary key (id_comunidad)
);

alter table localidad
add constraint FK_ProvinciaLocalidad
foreign key (id_provincia) references provincia(id_provincia)
on delete cascade on update cascade;

alter table provincia
add constraint FK_LocalidadProvincia
foreign key (id_capital) references localidad(id_localidad)
on delete cascade on update cascade,
add constraint FK_ComunidadProvincia
foreign key (id_comunidad) references  comunidad(id_comunidad)
on delete cascade on update cascade;

alter table comunidad
add constraint FK_LocalidadComunidad
foreign key (id_capital) references localidad(id_localidad)
on delete cascade on update cascade;

-- INSERTS --

insert into localidad (nombre, poblacion) values
	("Localidad1", 1000),
    ("Localidad2", 2000),
    ("Localidad3", 3000),
    ("Localidad4", 4000),
    ("Localidad5", 5000),
    ("Localidad6", 6000),
    ("Localidad7", 7000),
    ("Localidad8", 8000),
    ("Localidad9", 9000),
    ("Localidad10", 10000);
    
insert into provincia (nombre, poblacion, superficie) values
	("Provincia1", 1000, 100.0),
    ("Provincia2", 2000, 200.0),
    ("Provincia3", 3000, 300.0),
    ("Provincia4", 4000, 400.0),
    ("Provincia5", 5000, 500.0),
    ("Provincia6", 6000, 600.0),
    ("Provincia7", 7000, 700.0),
    ("Provincia8", 8000, 800.0),
    ("Provincia9", 9000, 900.0),
    ("Provincia10", 10000, 1000.0);

insert into comunidad (nombre, poblacion, superficie) values
	("Comunidad1", 100000, 1000.0),
    ("Comunidad2", 200000, 2000.0),
    ("Comunidad3", 300000, 3000.0),
    ("Comunidad4", 400000, 4000.0),
    ("Comunidad5", 500000, 5000.0),
    ("Comunidad6", 600000, 6000.0),
    ("Comunidad7", 700000, 7000.0),
    ("Comunidad8", 800000, 8000.0),
    ("Comunidad9", 900000, 9000.0),
    ("Comunidad10", 1000000, 10000.0);