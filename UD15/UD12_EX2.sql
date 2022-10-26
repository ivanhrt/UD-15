drop database if exists ejercicio2_ER;

CREATE DATABASE ejercicio2_ER;
use ejercicio2_ER;


create table profesores(
dniProfesor nvarchar(8) not null primary key ,
nombre nvarchar(24),
apellidos nvarchar(24),
direccion nvarchar(100),
telefonos int(9)
);

create table empresa(
cif int(8) auto_increment primary key,
nombre nvarchar(16),
telefono int(9),
direccion nvarchar(100));

create table alumnos(
dni int(8) not null primary key,
nombre nvarchar(16),
apellidos nvarchar(16),
direccion nvarchar(100),
telefono int(9),
cifEmpresa int(8),
key (cifEmpresa),
FOREIGN KEY (cifEmpresa) REFERENCES empresa (cif) 
ON DELETE CASCADE ON UPDATE CASCADE
);

create table curso(
codigoCurso int(4) auto_increment primary key ,
programa nvarchar(100),
duracion int(5),
titulo nvarchar(100),
fechaInicio date,
fechaFinal date,
añoCurso int(1),
dniProfesor nvarchar (8),
key(dniProfesor),
FOREIGN KEY (dniProfesor) REFERENCES profesores (dniProfesor) 
ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE table cursa (
dniAlumno int(8) NOT NULL , 
codigoCurso int(4) NOT NULL ,
primary KEY(dniAlumno, codigoCurso),
KEY(dniAlumno),
KEY(codigoCurso),
FOREIGN KEY (dniAlumno) REFERENCES alumnos (dni) 
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (codigoCurso) REFERENCES curso (codigoCurso) 
ON DELETE CASCADE ON UPDATE CASCADE,
nota int(2)
); 


insert into profesores(dniProfesor,nombre,apellidos,direccion,telefonos) values 
(12983123,"luis","hernandez","calle trece",122313041),
(86522091,"uriel","arevalo","calle obrador",129806435),
(66656612,"sandra","saga","avenida mariano",812472911),
(19930121,"alex","ruiz","plaza de la reina",009123411),
(03900931,"joan","lopez","calle morte",976546278),
(65472212,"maria","castaño","avenida vicent van gogh",123891124),
(41422214,"carlos","agudo","calle obrador",090990909),
(99099299,"flor","fuentes","calle red",873190221),
(22023312,"alfredo","gomez","plaza de la fuente",419407665),
(12314881,"mireia","flores","calle miguel angel",983306112);



insert into empresa(nombre,telefono,direccion) values
("Karmine corp",311390902,"parque real"),
("grupo cero",13451234,"calle de la rosa"),
("ardel s.l",908276412,"plaza de la reina"),
("Grupo sistema",009243414,"plaza del rey"),
("isa tech",515151511,"avenida de los reyes"),
("maho s.a",982305841,"plaza de la reina"),
("koi",515290876,"calle blanca"),
(" dr simulation",556732321,"avenida bromer"),
("ruiz develop",090912567,"plaza de las cartas"),
("b.l.m",671349876,"calle de los reyes");




insert into alumnos(dni,nombre,apellidos,direccion,telefono,cifEmpresa) values 
(22144123,"raquel","diaz","calle ases",122313041,1),
(86012151,"sael","saga","calle de la espada",129806435,5),
(76656612,"benito","lopez","avenida corta",812472911,6),
(09930121,"alexandra","ruiz","plaza de la reina",009123411,7),
(03900931,"camila","mirtra","calle morte",976546278,6),
(69188251,"xenia","orozco","avenida marmol",123891124,2),
(15654214,"carles","agudelo","calle azuk",090990909,8),
(88088088,"samuel","fuentes","calle red",873190221,1),
(21209812,"lucia","gomez","plaza real",419407665,9),
(09100181,"luz","edima","calle verde",983306112,4);


insert into curso(programa,duracion,titulo,fechaInicio,fechaFinal,añoCurso,dniProfesor) values
("sql java angular",300,"basico web",current_date(),current_date(),1,12983123),
("sql java angular",300,"basico web",current_date(),current_date(),2,12983123),
("unreal unity blender",1440,"videojuegos",current_date(),current_date(),1,66656612),
("sql java angular",600,"videojuegos",current_date(),current_date(),2,66656612),
("sql java angular",3440,"videojuegos",current_date(),current_date(),3,66656612),
("c++",150,"introduccion programacion",current_date(),current_date(),1,12314881),
("photoshop ilustrator acrobat",300,"adobe pack",current_date(),current_date(),1,22023312),
("photoshop ilustrator acrobat",300,"adobe pack",current_date(),current_date(),2,22023312),
("blender zbrush painter marmoset",300,"3D modeling",current_date(),current_date(),1,03900931),
("blender zbrush painter marmoset",300,"3D modeling",current_date(),current_date(),2,03900931);


insert into cursa(dniAlumno,codigoCurso) values
(86012151,1),
(09930121,1),
(69188251,3),
(15654214,4),
(88088088,5),
(22144123,7),
(15654214,7),
(03900931,9),
(76656612,10),
(22144123,2);

select * from curso;

