drop database if exists ejercicio5_ER;

CREATE DATABASE ejercicio5_ER;
use ejercicio5_ER;


create table almacen(
numeroAlmacen int(4)  auto_increment primary key,
nombre nvarchar(24),
descripcion nvarchar(100) default  null,
direccion nvarchar(100)
);

insert into almacen(nombre,descripcion,direccion) values 
("Inmueble carmen",null,"parque industrial jardin"),
("almacen usua","los mejores almacenes","parque industrial vilaverda"),
("almacen central","almacen solo de piezas pequeñas","parque industrial tundra"),
("almacen norteño",null,"parque industrial del muelle"),
("almacen tele",null,"parque industrial vilaverda"),
("almacen roger","las mejores piezas metalicas","parque industrial tech"),
("almacen bromer","comestibles","parque industrial tech"),
("Inmueble maho",null,"parque industrial corda"),
("Inmueble ahre","los mejores precios","parque industrial aserradero"),
("almacen o.a.s","solo madera","parque industrial savanna");


create table piezas (
id int(8) auto_increment primary key,
modelo nvarchar(24),
descripcion nvarchar(100) default null,
precio int(3)
);

insert into piezas(modelo,descripcion,precio) values
("cable","32 pulgadas",12),
("Puerta","32 pulgadas",12),
("ventana","32 pulgadas",12),
("teclado","32 pulgadas",12),
("ladron","32 pulgadas",12),
("tornillo","32 pulgadas",12),
("visagra","32 pulgadas",12),
("cristal","32 pulgadas",12),
("madera","32 pulgadas",12),
("plancha metalica","32 pulgadas",12);


create table guarda (
numeroAlmacen int(8) NOT NULL , 
id int(4) NOT NULL ,
primary KEY(id, numeroAlmacen),
KEY(numeroAlmacen),
KEY(id),
FOREIGN KEY (numeroAlmacen) REFERENCES almacen (numeroAlmacen) 
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id) REFERENCES piezas (id) 
ON DELETE CASCADE ON UPDATE CASCADE,
cantidad int(3),
estanteria char(1)
);

insert into guarda(numeroAlmacen,id,cantidad,estanteria) values
(5,5,100,'g'),
(2,7,33,'s'),
(1,8,9,'j'),
(7,10,2,'k'),
(8,2,499,'a'),
(9,3,754,'c'),
(3,1,233,'v'),
(10,9,90,'r'),
(4,6,7,'p'),
(6,4,2,'l');


create table compuesta (
id1 int(8) NOT NULL , 
id2 int(8) NOT NULL ,
primary KEY(id1, id2),
KEY(id1),
KEY(id2),
FOREIGN KEY (id1) REFERENCES piezas (id) 
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id2) REFERENCES piezas (id) 
ON DELETE CASCADE ON UPDATE CASCADE
);

insert into compuesta(id1,id2) values 
(1,3),
(5,1),
(7,9),
(9,3),
(2,4);
