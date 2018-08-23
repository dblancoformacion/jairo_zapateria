/* creacion de la base de datos */
DROP DATABASE IF EXISTS jairo_zapato;
CREATE DATABASE jairo_zapato;
USE jairo_zapato;

CREATE TABLE articulos (
  id_articulo int AUTO_INCREMENT,
  modelo varchar (255) NOT NULL,
  mat_interior varchar (255) NOT NULL,
  mat_exterior varchar (255) NOT NULL,
  precio float NOT NULL,
  talla int NOT NULL,
  cantidad int NOT NULL,
  PRIMARY KEY (id_articulo)
);

CREATE TABLE zapatos (
  id_zapato int AUTO_INCREMENT,
  horma varchar (255),
  tacon int NOT NULL,
  cordon bool NOT NULL,
  PRIMARY KEY(id_zapato),
  UNIQUE(tacon),
  UNIQUE (cordon),
  UNIQUE (horma)
  );

CREATE TABLE colores(
  id_color int AUTO_INCREMENT,
  color varchar (255) NOT NULL,
  PRIMARY KEY (id_color)
  );

CREATE TABLE contienen(
  id_articulo int,
  id_contienen int,
  PRIMARY KEY(id_articulo,id_contienen),
  FOREIGN KEY (id_articulo) REFERENCES articulos(id_articulo),
  FOREIGN KEY (id_contienen) REFERENCES colores (id_color)
  );
  
CREATE TABLE tacon(
  id_tacon int AUTO_INCREMENT,
  tacon int NOT NULL,
  PRIMARY KEY (id_tacon),
  UNIQUE (tacon)
  );

CREATE TABLE pisan(
  id_pisan int,
  id_zapato int,
  PRIMARY KEY (id_pisan,id_zapato),
  FOREIGN KEY (id_zapato) REFERENCES zapatos(id_zapato),
  FOREIGN KEY (id_pisan) REFERENCES tacon (id_tacon)
  );
 
CREATE TABLE especializa(
  id_articulo int,
  id_especializa int,
  PRIMARY KEY(id_articulo, id_especializa),
  FOREIGN KEY (id_articulo) REFERENCES articulos (id_articulo),
  FOREIGN KEY (id_especializa) REFERENCES zapatos(id_zapato)
  );

CREATE TABLE seccion(
  id_seccion int AUTO_INCREMENT,
  seccion varchar (255),
  PRIMARY KEY (id_seccion),
  UNIQUE (seccion)
  );

CREATE TABLE dividen(
  id_seccion int,
  id_articulo int,
  PRIMARY KEY (id_seccion,id_articulo),
  FOREIGN KEY (id_seccion) REFERENCES seccion (id_seccion),
  FOREIGN KEY (id_articulo) REFERENCES articulos(id_articulo)
  );

CREATE TABLE fabricantes(
  id_fabricante int AUTO_INCREMENT,
  fabricante varchar (255) NOT NULL,
  PRIMARY KEY (id_fabricante),
  UNIQUE (fabricante)
  );

CREATE TABLE fabrican(
  id_fabricante int,
  id_articulo int,
  PRIMARY KEY (id_fabricante, id_articulo),
  FOREIGN KEY (id_fabricante) REFERENCES fabricantes(id_fabricante),
  FOREIGN KEY (id_articulo) REFERENCES articulos (id_articulo)
  );

CREATE TABLE categoria(
  id_categoria int AUTO_INCREMENT,
  categoria varchar (255) NOT NULL,
  PRIMARY KEY (id_categoria),
  UNIQUE(categoria)
  );

CREATE TABLE tipifican(
  id_tipifican int,
  id_articulo int,
  PRIMARY KEY (id_tipifican,id_articulo),
  FOREIGN KEY (id_tipifican) REFERENCES categoria (id_categoria),
  FOREIGN KEY (id_articulo) REFERENCES articulos (id_articulo)
  );
 
CREATE TABLE temporadas(
  id_temporada int AUTO_INCREMENT,
  temporada varchar(255) NOT NULL,
  PRIMARY KEY (id_temporada),
  UNIQUE (temporada)
  );

CREATE TABLE marcan(
  id_marcan int,
  id_articulo int,
  PRIMARY KEY (id_marcan,id_articulo),
  FOREIGN KEY (id_marcan) REFERENCES temporadaS (id_temporada),
  FOREIGN KEY (id_articulo) REFERENCES articulos (id_articulo)
  );

CREATE TABLE tiendas(
  id_tienda int AUTO_INCREMENT,
  tienda varchar(255) NOT NULL,
  PRIMARY KEY (id_tienda)
  );

CREATE TABLE almacenan(
  id_almacenan int,
  id_articulo int,
  cantidad int NOT NULL,
  venta bool,
  instante float,
  PRIMARY KEY (id_almacenan,id_articulo),
  FOREIGN KEY (id_almacenan) REFERENCES tiendas (id_tienda),
  FOREIGN KEY (id_articulo) REFERENCES articulos (id_articulo)
  );


/*datos tiendas*/

INSERT tiendas(tienda)
  VALUES('Gaspar'),('Sparta'),('Walk'),('Zap-In OutLet'),('Zap-In SanJose'),('Zap-In ValleReal'),
  ('Zap-In Castro'),('Zap-In Max Center'),('Zap-In R.Arias'),('Zap-In Berceo'),('Zap-In Kids'),('Zap-in Online');

INSERT temporadas (temporada)
  VALUES ('2006V'),('2006I'),('2007V'),('2007I'),('2008V'),('2008I'),('2009V'),('2009I'),('2010V'),('2010I'),
  ('2011V'),('2011I'),('2012V'),('2012I'),('2013V'),('2013I'),('2014V'),('2014I'),('2015V'),('2015I'),('2016V'),
  ('2016I'),('2017V'),('2017I'),('2018V'),('2018I'),('2019V'),('2019I'),('2020V'),('2020I');

INSERT seccion (seccion)
  VALUES ('Señora'),('Caballero'),('Niño');

INSERT categoria(categoria)
  VALUES('Bota'),('Sandalia'),('Mocasin'),('Deportivos y playeras'),('Botin'),('Zapato'),('Alpargatas');
INSERT fabricantes(fabricante)
  VALUES ('Traveris'),('Paula Urban'),('Funny Lola'),('Converse'),('Nike'),('Kissia'),('Tambi'),('Walk & Fly'),('Colour Feet'),
  ('Wonders'),('Panama Jack'),('Vidorreta'),('Tiziana'),('Stephen Allen'),('Riva di Mare'),('Riposella'),('Porronet'),('Imac'),('Pikolinos'),('Gioseppo'),
  ('Pons Quintana'),('Alpe'),('Kennebec'),('Victoria'),('Trivict'),('Hobbs'),('Hit d Trend'),('Pablosky'),('Camper'),('Giorda'),('Vaporetto'),('New Balance');

INSERT colores (color)
  VALUES ('Amarillo'),('Azul'),('Beige'),('Blanco'),('Bronce'),('Burdeos'),('Cuero'),('Fucsia'),('Gris'),('Hielo'),('Kaki'),('Marrón'),('Morado'),('Multicolor'),
  ('Negro'),('Oro'),('Plata'),('Plomo'),('Rojo'),('Rosa'),('Topo'),('Verde');

INSERT tacon(tacon)
  VALUES ('0'),('1'),('2'),('3'),('4'),('5'),('6'),('7'),('8'),('9');

INSERT articulos (modelo, mat_interior, mat_exterior, precio ,talla, cantidad)
  VALUES 
  ('bolso 3536','Tela','Cuero','80','Unica','8'),

  ('AllStar','Tela','Tela','40','36','4'),  
  ('AllStar','Tela','Tela','40','37','4'),
  ('AllStar','Tela','Tela','40','38','9'),
  ('AllStar','Tela','Tela','40','39','2'),
  ('AllStar','Tela','Tela','40','40','4'),
  ('AllStar','Tela','Tela','40','41','1'),
  ('U520GG','Nobuk','Tela','99','40','1'),
  ('U520GG','Nobuk','Tela','99','41','4'),
  ('U520GG','Nobuk','Tela','99','42','5'),
  ('U520GG','Nobuk','Tela','99','43','4'),
  ('U520GG','Nobuk','Tela','99','44','2'),
  ('U520GG','Nobuk','Tela','99','45','8'),
  ('K100280-003','Cuero','Tela','110','40','2'),
  ('K100280-003','Cuero','Tela','110','41','8'),
  ('K100280-003','Cuero','Tela','110','42','7'),
  ('K100280-003','Cuero','Tela','110','43','8'),
  ('K100280-003','Cuero','Tela','110','44','7'),
  ('K100280-003','Cuero','Tela','110','45','4'),
  ('K200577-002','Multi','Tela','125','36','1'),
  ('K200577-002','Multi','Tela','125','37','2'),
  ('K200577-002','Multi','Tela','125','38','4'),
  ('K200577-002','Multi','Tela','125','39','7'),
  ('K200577-002','Multi','Tela','125','40','5'),
  ('K200577-002','Multi','Tela','125','41','2'),
  ('MAUI','Yute','Cuerdas','49','36','1'),
  ('MAUI','Yute','Cuerdas','49','37','2'),
  ('MAUI','Yute','Cuerdas','49','38','3'),
  ('MAUI','Yute','Cuerdas','49','39','4'),
  ('MAUI','Yute','Cuerdas','49','40','5'),
  ('MAUI','Yute','Cuerdas','49','41','1'),
  ('584726','Ante','Tela','25','27','2'),
  ('584726','Ante','Tela','25','28','3'),
  ('584726','Ante','Tela','25','29','4'),
  ('584726','Ante','Tela','25','30','5'),
  ('584726','Ante','Tela','25','31','5'),
  ('584726','Ante','Tela','25','32','2'),
  ('584726','Ante','Tela','25','33','1'),
  ('VC-27254W','Tela','Tela','30','36','2'),
  ('VC-27254W','Tela','Tela','30','37','3'),
  ('VC-27254W','Tela','Tela','30','38','4'),
  ('VC-27254W','Tela','Tela','30','39','3'),
  ('VC-27254W','Tela','Tela','30','40','2'),
  ('VC-27254W','Tela','Tela','30','41','1'),
  ('VC-27254W-1','Tela','Tela','30','36','1'),
  ('VC-27254W-1','Tela','Tela','30','37','2'),
  ('VC-27254W-1','Tela','Tela','30','38','3'),
  ('VC-27254W-1','Tela','Tela','30','39','3'),
  ('VC-27254W-1','Tela','Tela','30','40','2'),
  ('VC-27254W-1','Tela','Tela','30','41','1'),
  ('103840','Fantasia','Tela','50','36','1'),
  ('103840','Fantasia','Tela','50','37','2'),
  ('103840','Fantasia','Tela','50','38','3'),
  ('103840','Fantasia','Tela','50','39','3'),
  ('103840','Fantasia','Tela','50','40','2'),
  ('103840','Fantasia','Tela','50','41','1'),
  ('108601','Fantasia','Tela','55','36','1'),
  ('108601','Fantasia','Tela','55','37','2'),
  ('108601','Fantasia','Tela','55','38','3'),
  ('108601','Fantasia','Tela','55','39','2'),
  ('108601','Fantasia','Tela','55','40','2'),
  ('108601','Fantasia','Tela','55','41','1'),
  ('108980','Pedreria','Tela','55','36','1'),
  ('108980','Pedreria','Tela','55','37','2'),
  ('108980','Pedreria','Tela','55','38','3'),
  ('108980','Pedreria','Tela','55','39','3'),
  ('108980','Pedreria','Tela','55','40','2'),
  ('108980','Pedreria','Tela','55','41','1'),
  ('Ripo-6297','Cuero','Tela','60','36','1'),
  ('Ripo-6297','Cuero','Tela','60','37','2'),
  ('Ripo-6297','Cuero','Tela','60','38','3'),
  ('Ripo-6297','Cuero','Tela','60','39','3'),
  ('Ripo-6297','Cuero','Tela','60','40','2'),
  ('Ripo-6297','Cuero','Tela','60','41','1'),
  ('Ripo-6352','Cuero','Tela','60','36','1'),
  ('Ripo-6352','Cuero','Tela','60','37','2'),
  ('Ripo-6352','Cuero','Tela','60','38','3'),
  ('Ripo-6352','Cuero','Tela','60','39','3'),
  ('Ripo-6352','Cuero','Tela','60','40','2'),
  ('Ripo-6352','Cuero','Tela','60','41','1'),
  ('MA3001113','Cuero','Tela','89','39','1'),
  ('MA3001113','Cuero','Tela','89','40','2'),
  ('MA3001113','Cuero','Tela','89','41','3'),
  ('MA3001113','Cuero','Tela','89','42','4'),
  ('MA3001113','Cuero','Tela','89','43','4'),
  ('MA3001113','Cuero','Tela','89','44','3'),
  ('MA3001113','Cuero','Tela','89','45','2'),
  ('Tdn-91401','Pedreria','Tela','49','36','1'),
  ('Tdn-91401','Pedreria','Tela','49','37','2'),
  ('Tdn-91401','Pedreria','Tela','49','38','3'),
  ('Tdn-91401','Pedreria','Tela','49','39','4'),
  ('Tdn-91401','Pedreria','Tela','49','40','3'),
  ('Tdn-91401','Pedreria','Tela','49','41','2'),
  ('G154-S15064','Cuero','Tela','45','40','1'),
  ('G154-S15064','Cuero','Tela','45','41','2'),
  ('G154-S15064','Cuero','Tela','45','42','3'),
  ('G154-S15064','Cuero','Tela','45','43','4'),
  ('G154-S15064','Cuero','Tela','45','44','2'),
  ('G154-S15064','Cuero','Tela','45','45','1'),
  ('KG-4440','Pedrería','Piel','39','36','1'),
  ('KG-4440','Pedrería','Piel','39','37','2'),
  ('KG-4440','Pedrería','Piel','39','38','3'),
  ('KG-4440','Pedrería','Piel','39','39','3'),
  ('KG-4440','Pedrería','Piel','39','40','2'),
  ('KG-4440','Pedrería','Piel','39','41','1'),
  ('KG-4440-1','Pedrería','Piel','39','36','1'),
  ('KG-4440-1','Pedrería','Piel','39','37','2'),
  ('KG-4440-1','Pedrería','Piel','39','38','3'),
  ('KG-4440-1','Pedrería','Piel','39','39','2'),
  ('KG-4440-1','Pedrería','Piel','39','40','1'),
  ('KG-4440-1','Pedrería','Piel','39','41','5'),
  ('V102101','Lona','Tela','49','36','1'),
  ('V102101','Lona','Tela','49','37','2'),
  ('V102101','Lona','Tela','49','38','3'),
  ('V102101','Lona','Tela','49','39','3'),
  ('V102101','Lona','Tela','49','40','2'),
  ('V102101','Lona','Tela','49','41','1'),
  ('V260110','Pedreria','Tela','45','36','1'),
  ('V260110','Pedreria','Tela','45','37','2'),
  ('V260110','Pedreria','Tela','45','38','3'),
  ('V260110','Pedreria','Tela','45','39','2'),
  ('V260110','Pedreria','Tela','45','40','2'),
  ('V260110','Pedreria','Tela','45','41','1')
  ;
SELECT * FROM articulos;