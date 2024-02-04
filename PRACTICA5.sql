DROP DATABASE IF EXISTS practica5;
CREATE DATABASE practica5;
USE practica5;

SET FOREIGN_KEY_CHECKS=0;

CREATE TABLE alumno(
  expediente varchar(10),
  nombre varchar (10),
  apellidoS varchar(20),
  fecha_nac date,
PRIMARY KEY(expediente),
  
);


CREATE TABLE esdelegado(
  nombreD varchar  (100),
  numeroD int,
  numDeEmpleados int,
  nssEmpleadoDirige varchar(10),
  fechaInicioJefe date,

PRIMARY KEY(nombreD,numeroD),

CONSTRAINT uk1 UNIQUE KEY (nssEmpleadoDirige),

CONSTRAINT fkDepartamentoEmpleado
  FOREIGN KEY (nssEmpleadoDirige) REFERENCES empleado(nssEmpleado)
  ON DELETE RESTRICT ON UPDATE RESTRICT

);

CREATE TABLE cursa(
  nssEmpleado varchar(10),
  nssSupervisor varchar(10),

  # clave principal
  PRIMARY KEY(nssEmpleado,nssSupervisor),
  
  CONSTRAINT uk1 UNIQUE KEY(nssEmpleado),
  # claves ajenas
  CONSTRAINT fkSupervisaEmpleado 
    FOREIGN KEY (nssEmpleado) REFERENCES empleado (nssEmpleado)
    ON DELETE RESTRICT ON UPDATE RESTRICT,

  CONSTRAINT fkSupervisaEmpleadoSupervisa 
    FOREIGN KEY (nssSupervisor) REFERENCES empleado (nssEmpleado)
    ON DELETE RESTRICT ON UPDATE RESTRICT

);

CREATE TABLE modulo(
  nssEmpleado varchar(10),
  nssSupervisor varchar(10),

  # clave principal
  PRIMARY KEY(nssEmpleado,nssSupervisor),
  
  CONSTRAINT uk1 UNIQUE KEY(nssEmpleado),
  # claves ajenas
  CONSTRAINT fkSupervisaEmpleado 
    FOREIGN KEY (nssEmpleado) REFERENCES empleado (nssEmpleado)
    ON DELETE RESTRICT ON UPDATE RESTRICT,

  CONSTRAINT fkSupervisaEmpleadoSupervisa 
    FOREIGN KEY (nssSupervisor) REFERENCES empleado (nssEmpleado)
    ON DELETE RESTRICT ON UPDATE RESTRICT

);

CREATE TABLE imparte(
  nssEmpleado varchar(10),
  nssSupervisor varchar(10),

  # clave principal
  PRIMARY KEY(nssEmpleado,nssSupervisor),
  
  CONSTRAINT uk1 UNIQUE KEY(nssEmpleado),
  # claves ajenas
  CONSTRAINT fkSupervisaEmpleado 
    FOREIGN KEY (nssEmpleado) REFERENCES empleado (nssEmpleado)
    ON DELETE RESTRICT ON UPDATE RESTRICT,

  CONSTRAINT fkSupervisaEmpleadoSupervisa 
    FOREIGN KEY (nssSupervisor) REFERENCES empleado (nssEmpleado)
    ON DELETE RESTRICT ON UPDATE RESTRICT

);

CREATE TABLE profesor(
  nssEmpleado varchar(10),
  nssSupervisor varchar(10),

  # clave principal
  PRIMARY KEY(nssEmpleado,nssSupervisor),
  
  CONSTRAINT uk1 UNIQUE KEY(nssEmpleado),
  # claves ajenas
  CONSTRAINT fkSupervisaEmpleado 
    FOREIGN KEY (nssEmpleado) REFERENCES empleado (nssEmpleado)
    ON DELETE RESTRICT ON UPDATE RESTRICT,

  CONSTRAINT fkSupervisaEmpleadoSupervisa 
    FOREIGN KEY (nssSupervisor) REFERENCES empleado (nssEmpleado)
    ON DELETE RESTRICT ON UPDATE RESTRICT

);


