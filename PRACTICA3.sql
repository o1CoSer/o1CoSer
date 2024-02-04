DROP DATABASE IF EXISTS practica3;

CREATE DATABASE IF NOT EXISTS practica3;

USE practica3;

CREATE TABLE IF NOT EXISTS poblacion (
  codPob int NOT NULL AUTO_INCREMENT,
  nombre varchar(50) DEFAULT NULL,
  PRIMARY KEY (codPob)
) COMMENT 'poblacion que pueden ser clientes de coches';

CREATE TABLE IF NOT EXISTS coches (
  matricula varchar(10) NOT NULL,
  PRIMARY KEY(matricula),
  UNIQUE KEY(matricula)
) COMMENT 'coches matriculados';

CREATE TABLE IF NOT EXISTS clientes (
  codClientes int NOT NULL AUTO_INCREMENT,
  nombre varchar(10) DEFAULT NULL,
  PRIMARY KEY(codClientes)
) COMMENT 'coches de la empresa';


CREATE TABLE IF NOT EXISTS comprados(
matricula varchar(10),
codPob int,
codClientes int,
PRIMARY KEY(matricula codClientes),
CONSTRAINT fkCompradosCoches
  FOREIGN KEY(matricula) REFERENCES coches(matricula)
  ON DELETE RESTRICT ON UPDATE RESTRICT,
CONSTRAINT fkCompradosPoblacion
  FOREIGN KEY(codPob) REFERENCES poblacion(codPob)
  ON DELETE RESTRICT ON UPDATE RESTRICT,
CONSTRAINT fkCompradosClientes
  FOREIGN KEY(codClientes)
  REFERENCES clientes(codClientes)
  ON DELETE RESTRICT ON UPDATE RESTRICT
) COMMENT 'coches comprados por los clientes';

INSERT INTO clientes (nombre)
  VALUES ('Ana'),('Jose');

INSERT INTO coches (matricula) 
  VALUES ('DDD1111'),('fgd1234');

INSERT INTO poblacion (codPob,nombre)
  VALUES (1,'Santander'), (2,'laredo');
  

INSERT INTO comprados (codClientes, codPob, matricula)
  VALUES(1,1,'fgd1234'),(1,2, 'DDD1111');



