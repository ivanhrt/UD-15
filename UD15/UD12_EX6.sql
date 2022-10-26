drop database if exists ejercicio6_ER;

CREATE DATABASE ejercicio6_ER;
use ejercicio6_ER;


create table socio(
codigoSocio int(8) auto_increment primary key,
nombre nvarchar(24),
apellido nvarchar(24),
dni int(8),
direccion nvarchar(100),
telefono int(9)
);


insert into socio(nombre,apellido,dni,direccion,telefono) values 
("luis","hernandez",12983123,"calle trece",122313041),
("uriel","arevalo",86522091,"calle obrador",129806435),
("sandra","saga",66656612,"avenida mariano",812472911),
("alex","ruiz",19930121,"plaza de la reina",009123411),
("joan","lopez",03900931,"calle morte",976546278),
("maria","castaño",65472212,"avenida vicent van gogh",123891124),
("carlos","agudo",41422214,"calle obrador",090990909),
("flor","fuentes",99099299,"calle red",873190221),
("alfredo","gomez",22023312,"plaza de la fuente",419407665),
("mireia","flores",12314881,"calle miguel angel",983306112);



create table autor(
idAutor int(8) auto_increment primary key,
nombre nvarchar(24),
pais nvarchar(24)
);

insert into autor(nombre,pais) values
("carson","USA"),
("Le sans","francia"),
("gongora","españa"),
("marquez","colombia"),
("zhan li","tailandia"),
("Frederich","nueva zelanda"),
("mufasa","uganda"),
("utui","nigeria"),
("fargri","italia"),
("uriel","mexico");

create table articulo(
codigoArticulo int(8) auto_increment primary key,
nombre nvarchar(24),
resumen nvarchar(100) default null,
estado boolean,
idAutor int(8) ,
KEY(idAutor),
FOREIGN KEY (idAutor) REFERENCES autor (idAutor) 
ON DELETE CASCADE ON UPDATE CASCADE
);

insert into articulo(nombre,resumen,estado,idAutor) values 
("1984","que pasaria si gana el facismo", true,1),
("Wonderwall",null, true,2),
("dj uriel session 3","musica tecno", false,10),
("1985","secuela de 1984", true,1),
("kill bill",null, true,2),
("dj uriel session 9",null, true,10),
("wild life","documental de animales", true,7),
("cronicas de narnia","libro de fantasia", true,8),
("hotel california",null, true,2),
("Reservoir dogs","primer exito del director", true,5);


create table libro (
codigoArticulo int(8) primary key,
key(codigoArticulo),
FOREIGN KEY (codigoArticulo) REFERENCES articulo (codigoArticulo),
numeroPaginas int(4)
);

insert into libro(codigoArticulo,numeroPaginas) values
(1,300),
(4,500),
(8,1023);

create table cd (
codigoArticulo int(8) primary key,
key(codigoArticulo),
FOREIGN KEY (codigoArticulo) REFERENCES articulo (codigoArticulo),
numeroCanciones int(2)
);

insert into cd(codigoArticulo,numeroCanciones) values
(2,12),
(3,15),
(6,9),
(9,10);

create table pelicula (
codigoArticulo int(8) auto_increment primary key,
key(codigoArticulo),
FOREIGN KEY (codigoArticulo) REFERENCES articulo (codigoArticulo),
duracion int(3)
);

insert into pelicula(codigoArticulo,duracion) values
(5,90),
(7,150),
(10,140);

create table prestamo (
idPrestamo int(8) auto_increment primary key,
fechaPrestamo date,
fechaDevolucion date,
fechaLimite date,
codigoSocio int(8),
KEY(codigoSocio),
FOREIGN KEY (codigoSocio) REFERENCES socio (codigoSocio) 
ON DELETE CASCADE ON UPDATE CASCADE,
codigoArticulo int(8),
KEY(codigoArticulo),
FOREIGN KEY (codigoArticulo) REFERENCES articulo (codigoArticulo) 
ON DELETE CASCADE ON UPDATE CASCADE
);

insert into prestamo (fechaPrestamo,fechaDevolucion,fechaLimite,codigoSocio,codigoArticulo) values 
(current_date(),current_date(),current_date(),1,3),
(current_date(),current_date(),current_date(),5,1),
(current_date(),current_date(),current_date(),4,4),
(current_date(),current_date(),current_date(),4,2),
(current_date(),current_date(),current_date(),2,10),
(current_date(),current_date(),current_date(),5,7),
(current_date(),current_date(),current_date(),4,8),
(current_date(),current_date(),current_date(),7,6),
(current_date(),current_date(),current_date(),8,9),
(current_date(),current_date(),current_date(),10,5);
