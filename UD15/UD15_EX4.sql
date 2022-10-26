drop database if existS UD15_EX4;
create database UD15_EX4;
use UD15_EX4;

create table maquinasRegistradoras(
id int auto_increment primary key,
piso int not null
);

insert into maquinasRegistradoras(piso) values (1),(2),(3),(4),(5),(6),(7),(8),(9),(10);

create table cajeros(
id int auto_increment primary key,
NombreApellidos nvarchar(255)
);

insert into cajeros(NombreApellidos) values ("Carmen devon"),("shiori pan"),("Bryan cavill"),("Jamal ham"),("Damian salazar"),("Carlos blanco"),("Carol puig"),("Barbara denis"),("Josep artigues"),("Uriel lopez");

create table productos(
id int auto_increment primary key,
nombre nvarchar(100),
precio int
);

insert into productos(nombre) values ("cereales"),("refrescos"),("naranjas"),("arroz"),("patatas"),("chocolate"),("cerveza"),("pan integral"),("leche"),("cocos");


create table venta(
idMaquina int,
idCajero int,
idProducto int,
primary key (idMaquina,idCajero,idProducto),
key(idMaquina),
FOREIGN KEY (idMaquina) REFERENCES maquinasRegistradoras (id) 
ON DELETE CASCADE ON UPDATE CASCADE,
key(idCajero),
FOREIGN KEY (idCajero) REFERENCES cajeros (id)
ON DELETE CASCADE ON UPDATE CASCADE,
key(idProducto),
FOREIGN KEY (idProducto) REFERENCES productos (id)
ON DELETE CASCADE ON UPDATE CASCADE
);


insert into venta values (2,5,1),(9,10,1),(3,7,9),(8,6,1),(10,2,2),(4,1,1),(5,6,3),(5,9,2),(2,3,1),(1,8,5);
