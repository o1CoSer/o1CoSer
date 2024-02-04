DROP DATABASE IF EXISTS practica4;
CREATE DATABASE practica4;
USE practica4;

SET FOREIGN_KEY_CHECKS=0;

CREATE TABLE empleado(
  nssEmpleado varchar(10),
  nombre varchar (100),
  apellido varchar(200),
  iniciales varchar(4),
  fechaNcto date,
  sexo varchar(20),
  direccion varchar(400),
  salario float,
  nombreDPertenece varchar(100),
  numeroDPertenece int,

PRIMARY KEY(nssEmpleado),
CONSTRAINT fkEmpleadoDepartamento FOREIGN KEY (nombreDPertenece, numeroDPertenece) 
  REFERENCES departamento (nombreD, numeroD)
  ON DELETE RESTRICT ON UPDATE RESTRICT
  
);

SET FOREIGN_KEY_CHECKS=1;


CREATE TABLE departamento(
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

CREATE TABLE supervisa(
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


CREATE TABLE dependiente(
  nombreDependiente varchar(100),
  nssEmpleado varchar(10),
  sexo varchar(20),
  fechaNcto date,
  parentesco varchar(100),

PRIMARY KEY(nombreDependiente,nssEmpleado),

CONSTRAINT fkDependienteEmpleado FOREIGN KEY(nssEmpleado) REFERENCES empleado(nssEmpleado)
  ON DELETE RESTRICT ON UPDATE RESTRICT

);

CREATE TABLE localizaciones(
nombreD varchar(100),
numeroD int,
localizacionDept varchar(100),

PRIMARY KEY(nombreD,numeroD,localizacionDept),

CONSTRAINT fkLocalizacionesDepartamnto FOREIGN KEY(nombreD,numeroD) REFERENCES departamento(nombreD,numeroD)
ON DELETE RESTRICT ON UPDATE RESTRICT

);

CREATE TABLE proyecto(
numeroP int,
nombreP varchar(100),
localizacion varchar(200),
nombreDControla varchar(100),
numeroDControla int,

PRIMARY KEY(numeroP,nombreP),
CONSTRAINT fkProyectoDepartamento FOREIGN KEY (nombreDControla,numeroDControla) 
REFERENCES departamento(nombreD,numeroD) ON DELETE RESTRICT ON UPDATE RESTRICT

);

CREATE TABLE trabajaEn(
nssEmpleado varchar(10),
nombreP varchar(100),
numeroP int,
horas int,

PRIMARY KEY(nssEmpleado,nombreP,numeroP),

CONSTRAINT fkTrabajaEnEmpleado FOREIGN KEY(nssEmpleado) REFERENCES empleado(nssEmpleado)
  ON DELETE RESTRICT ON UPDATE RESTRICT,

CONSTRAINT fkTrabajaEmpleado FOREIGN KEY(numeroP,nombreP) REFERENCES proyecto(numeroP,nombreP)
  ON DELETE RESTRICT ON UPDATE RESTRICT

);

 


   