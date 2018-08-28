/* creacion de la base de datos */
DROP DATABASE IF EXISTS jairo_zapato;
CREATE DATABASE jairo_zapato;
USE jairo_zapato;


CREATE TABLE secciones(
  id_seccion int AUTO_INCREMENT,
  seccion varchar (255),
  PRIMARY KEY (id_seccion),
  UNIQUE (seccion)
  );


CREATE TABLE fabricantes(
  id_fabricante int AUTO_INCREMENT,
  fabricante varchar (255) NOT NULL,
  PRIMARY KEY (id_fabricante),
  UNIQUE (fabricante)
  );

CREATE TABLE categoria(
  id_categoria int AUTO_INCREMENT,
  categoria varchar (255) NOT NULL,
  PRIMARY KEY (id_categoria),
  UNIQUE(categoria)
  );

 
CREATE TABLE temporadas(
  id_temporada int AUTO_INCREMENT,
  temporada varchar(255) NOT NULL,
  PRIMARY KEY (id_temporada),
  UNIQUE (temporada)
  );

CREATE TABLE articulos (
  id_articulo int AUTO_INCREMENT,
  modelo varchar (255) NOT NULL,
  precio float NOT NULL,
  id_temporada int,
  id_categoria int,
  id_fabricante int,
  id_seccion int,
  PRIMARY KEY (id_articulo),
  FOREIGN KEY(id_temporada) REFERENCES temporadas(id_temporada),
  FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria),
  FOREIGN KEY (id_fabricante) REFERENCES fabricantes (id_fabricante),
  FOREIGN KEY (id_seccion) REFERENCES secciones (id_seccion)
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

CREATE TABLE tacones(
  id_tacon int AUTO_INCREMENT,
  tacon int NOT NULL,
  PRIMARY KEY (id_tacon),
  UNIQUE (tacon)
  );

CREATE TABLE zapatos (
  id_zapato int AUTO_INCREMENT,
  horma varchar (255),
  cordon bool NOT NULL,
  id_tacon int,
  PRIMARY KEY(id_zapato),
  FOREIGN KEY (id_tacon) REFERENCES tacones (id_tacon),
  UNIQUE (cordon),
  UNIQUE (horma)
  );



CREATE TABLE especializa(
  id_articulo int,
  id_especializa int,
  PRIMARY KEY(id_articulo, id_especializa),
  FOREIGN KEY (id_articulo) REFERENCES articulos (id_articulo),
  FOREIGN KEY (id_especializa) REFERENCES zapatos(id_zapato)
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
  talla int NOT NULL,
  PRIMARY KEY (id_almacenan,id_articulo),
  FOREIGN KEY (id_almacenan) REFERENCES tiendas (id_tienda),
  FOREIGN KEY (id_articulo) REFERENCES articulos (id_articulo)
  );

CREATE TABLE materiales(
  id_material int AUTO_INCREMENT,
  material varchar (255),
  PRIMARY KEY (id_material)
  ); 

CREATE TABLE forman(
  id_forman int,
  id_articulos int,
  interior bool,
  PRIMARY KEY(id_forman,id_articulos),
  FOREIGN KEY (id_forman) REFERENCES materiales (id_material),
  FOREIGN KEY (id_articulos) REFERENCES articulos (id_articulo)
  );
/*datos tiendas*/

INSERT tiendas(tienda)
  VALUES('Gaspar'),('Sparta'),('Walk'),('Zap-In OutLet'),('Zap-In SanJose'),('Zap-In ValleReal'),
  ('Zap-In Castro'),('Zap-In Max Center'),('Zap-In R.Arias'),('Zap-In Berceo'),('Zap-In Kids'),('Zap-in Online');

INSERT temporadas (temporada)
  VALUES ('2004V'),('2006V'),('2006I'),('2007V'),('2007I'),('2008V'),('2008I'),('2009V'),('2009I'),('2010V'),('2010I'),
  ('2011V'),('2011I'),('2012V'),('2012I'),('2013V'),('2013I'),('2014V'),('2014I'),('2015V'),('2015I'),('2016V'),
  ('2016I'),('2017V'),('2017I'),('2018V'),('2018I'),('2019V'),('2019I'),('2020V'),('2020I');

INSERT secciones (seccion)
  VALUES ('Señora'),('Caballero'),('Niño');

INSERT categoria(categoria)
  VALUES('Bota'),('Sandalia'),('Mocasin'),('Deportivos y playeras'),('Botin'),('Zapato'),('Alpargatas'),('bolso');
INSERT fabricantes(fabricante)
  VALUES ('Traveris'),('Paula Urban'),('Funny Lola'),('Converse'),('Nike'),('Kissia'),('Tambi'),('Walk & Fly'),('Colour Feet'),
  ('Wonders'),('Panama Jack'),('Vidorreta'),('Tiziana'),('Stephen Allen'),('Riva di Mare'),('Riposella'),('Porronet'),('Imac'),('Pikolinos'),('Gioseppo'),
  ('Pons Quintana'),('Alpe'),('Kennebec'),('Victoria'),('Trivict'),('Hobbs'),('Hit d Trend'),('Pablosky'),('Camper'),('Giorda'),('Vaporetto'),('New Balance');

INSERT colores (color)
  VALUES ('Amarillo'),('Azul'),('Beige'),('Blanco'),('Bronce'),('Burdeos'),('Cuero'),('Fucsia'),('Gris'),('Hielo'),('Kaki'),('Marrón'),('Morado'),('Multicolor'),
  ('Negro'),('Oro'),('Plata'),('Plomo'),('Rojo'),('Rosa'),('Topo'),('Verde');

INSERT tacones (tacon)
  VALUES ('0'),('1'),('2'),('3'),('4'),('5'),('6'),('7'),('8'),('9');

/*INSERT articulos (modelo, precio, id_temporada, id_categoria, id_fabricante, id_seccion)
  VALUES 
  ('bolso 3536','80',1),
  ('AllStar','40'),  
  ('U520GG','99'),
 
  ('K100280-003','110'),
  
  ('K200577-002','125'),
 
  ('MAUI','49'),
  
  ('584726','25'),
 
  ('VC-27254W','30'),
  
  ('VC-27254W-1','30'),
  
  ('103840','50'),
  
  ('108601','55'),
 
  ('108980','55'),

  ('Ripo-6297','60'),
  
  ('Ripo-6352','60'),
 
  ('MA3001113','89'),
 
  ('Tdn-91401','49'),

  ('G154-S15064','45'),

  ('KG-4440','39'),
  
  ('KG-4440-1','39'),
 
  ('V102101','49'),
  
  ('V260110','45'),

  ('1065129','30'),

  ('KEN-5304','79'),
   
  ('KEN-5304-1','79'),
 
  ('CC-143','87'),

  ('Cal-3861-35580','49'),

  ('Cal-7325-16170','49'),

  ('Cal-7325-16170-1','49'),

  ('Gi-42598','75'),
 
  ('Gi-53677','69'),

  ('KRM-225','65'),

  ('KRM-215','67')
  ;*/
SELECT * FROM articulos;
SELECT * FROM fabricantes;