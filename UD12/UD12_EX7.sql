drop database if exists organigrama;
create database organigrama;
use organigrama;

drop table if exists trabajador;
create table trabajador(
	DNI varchar(8) not null,
    nSS int,
    codigo_trabajador int,
    nombre varchar(20),
    apellidos varchar(50),
    direccion varchar(50),
    telefono int,
    dni_responsable varchar(8),
    key(dni_responsable),
    primary key (DNI)
);

drop table if exists departamento;
create table departamento(
    codigo_departamento int not null auto_increment,
    nombre varchar(20),
    coordinador varchar(8),
    primary key (codigo_departamento)
);

drop table if exists contrato;
create table contrato(
	id_contrato int not null auto_increment,
    fecha_inicio date,
    fecha_final date,
    categoria varchar(100),
    DNI varchar(8) not null,
    primary key (id_contrato)
);

drop table if exists nomina;
create table nomina(
	id_nomina int not null auto_increment,
    DNI varchar(8) not null,
    id_contrato int not null,
    fecha date,
    salario double,
    primary key (id_nomina, DNI, id_contrato)
);

alter table trabajador
add constraint FK_DNIResponsable
foreign key (dni_responsable) references trabajador(DNI)
on delete cascade on update cascade;

alter table contrato
add constraint FK_EmpleadoContrato
foreign key (dni) references trabajador(dni)
on delete cascade on update cascade;

alter table nomina
add constraint FK_EmpleadoNomina
foreign key (dni) references trabajador(dni)
on delete cascade on update cascade,
add constraint FK_ContratoNomina
foreign key (id_contrato) references contrato(id_contrato)
on delete cascade on update cascade;

alter table departamento
add constraint FK_EmpleadoDepartamento
foreign key (coordinador) references trabajador(dni)
on delete cascade on update cascade;


-- INSERTS --


insert into trabajador (dni, nSS, codigo_trabajador, nombre, apellidos, direccion, telefono, dni_responsable) values
	("11111111", 1000, 1, "Nombre1", "Apellido1", "Direccion1", 789456123, null),
    ("22222222", 2000, 2, "Nombre2", "Apellido2", "Direccion2", 321654987, "11111111"),
    ("33333333", 3000, 3, "Nombre3", "Apellido3", "Direccion3", 744855966, "11111111"),
    ("44444444", 4000, 4, "Nombre4", "Apellido4", "Direccion4", 741852963, "11111111"),
    ("55555555", 5000, 5, "Nombre5", "Apellido5", "Direccion5", 639528417, "11111111"),
    ("66666666", 6000, 6, "Nombre6", "Apellido6", "Direccion6", 666666666, null),
    ("77777777", 7000, 7, "Nombre7", "Apellido7", "Direccion7", 634593588, "66666666"),
    ("88888888", 8000, 8, "Nombre8", "Apellido8", "Direccion8", 45678912, "66666666"),
    ("99999999", 9000, 9, "Nombre9", "Apellido9", "Direccion9", 120120120, "66666666"),
    ("12345678", 1000, 10, "Nombre10", "Apellido10", "Direccion10", 654321000, "66666666");

insert into departamento (nombre, coordinador) values
	("Departamento1", "11111111"),
    ("Departamento2", "22222222"),
    ("Departamento3", "33333333"),
    ("Departamento4", "44444444"),
    ("Departamento5", "55555555"),
    ("Departamento6", "66666666"),
    ("Departamento7", "77777777"),
    ("Departamento8", "88888888"),
    ("Departamento9", "99999999"),
    ("Departamento10", "12345678");

insert into contrato (fecha_inicio, fecha_final, categoria, dni) values
	("2001-01-01", "2011-01-01", "Categoria1", "11111111"),
    ("2002-02-02", "2012-01-01", "Categoria2", "22222222"),
    ("2003-03-03", "2013-01-01", "Categoria3", "33333333"),
    ("2004-04-04", "2014-01-01", "Categoria4", "44444444"),
    ("2005-05-05", "2015-01-01", "Categoria5", "55555555"),
    ("2006-06-06", "2016-01-01", "Categoria6", "66666666"),
    ("2007-07-07", "2017-01-01", "Categoria7", "77777777"),
    ("2008-08-08", "2018-01-01", "Categoria8", "88888888"),
    ("2009-09-09", "2019-01-01", "Categoria9", "99999999"),
    ("2010-10-10", "2020-01-01", "Categoria10", "12345678");
    
insert into nomina (dni, id_contrato, fecha, salario) values
	("11111111", 1, "2001-01-01", 2000),
    ("22222222", 2, "2002-02-02", 2000),
    ("33333333", 3, "2003-03-03", 2000),
    ("44444444", 4, "2004-04-04", 2000),
    ("55555555", 5, "2005-05-05", 2000),
    ("66666666", 6, "2006-06-06", 2000),
    ("77777777", 7, "2007-07-07", 2000),
    ("88888888", 8, "2008-08-08", 2000),
    ("99999999", 9, "2009-09-09", 2000),
    ("12345678", 10, "2010-10-10", 2000);
