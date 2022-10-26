drop database if existS UD15_EX2;
create database UD15_EX2;
use UD15_EX2;


create table provedores(
id int auto_increment primary key,
nombre nvarchar(100)
);

insert into provedores(nombre) values('Apple'),('microsoft'),('xbox'),('msi'),('hp'),('lenovo'),('logitech'),('razer'),('oppo'),('xiaomi');

create table piezas(
codigo int auto_increment primary key,
nombre nvarchar(100)
);

insert into piezas(nombre) values('mmonitor'),('teclado'),('cascos'),('auriculares'),('ratones'),('movil'),('pantalla'),('cable hdmi'),('microfono'),('cable dsplay');

create table suministra(
codigoPieza int,
idProveedor int,
primary key (codigoPieza,idProveedor),
precio int,
key(codigoPieza),
FOREIGN KEY (codigoPieza) REFERENCES piezas (codigo) 
ON DELETE CASCADE ON UPDATE CASCADE,
key(idProveedor),
FOREIGN KEY (idProveedor) REFERENCES provedores (id)
ON DELETE CASCADE ON UPDATE CASCADE
);

insert into suministra values (4,1,44),(2,5,56),(9,1,5),(9,6,120),(8,8,150),(7,9,900),(2,10,1),(10,6,300),(10,4,240),(9,9,600);

