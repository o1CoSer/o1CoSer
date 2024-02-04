DROP DATABASE IF EXISTS practica4;
CREATE DATABASE practica4;
USE practica4;



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

PRIMARY KEY(nssEmpleado)


);

CREATE TABLE departamento(
  nombreD varchar  (100),
  numeroD int,
  numDeEmpleados int,
  nssEmpleadoDirige varchar(10),
  fechaInicioJefe date,

PRIMARY KEY(nombreD,numeroD)
);


CREATE TABLE supervisa(
 nssEmpleado varchar(10),
 nssSupervisor varchar(10),

PRIMARY KEY(nssEmpleado,nssSupervisor),
CONSTRAINT uk1 UNIQUE KEY(nssEmpleado)


);

CREATE TABLE dependiente(
  nombreDependiente varchar(100),
  nssEmpleado varchar(10),
  sexo varchar(20),
  fechaNcto date,
  parentesco varchar(100),

PRIMARY KEY(nombreDependiente,nssEmpleado)

);

CREATE TABLE localizaciones(
nombreD varchar(100),
numeroD int,
localizacionDept varchar(100),

PRIMARY KEY(nombreD,numeroD,localizacionDept)

);
CREATE TABLE proyecto(
numeroP int,
nombreP varchar(100),
localizacion varchar(200),
nombreDControla varchar(100),
numeroDControla int,

PRIMARY KEY(numeroP,nombreP)
);

CREATE TABLE trabajaEn(
nssEmpleado varchar(10),
nombreP varchar(100),
numeroP int,
horas int,

PRIMARY KEY(nssEmpleado,nombreP,numeroP)

);

ALTER TABLE empleado 
  ADD CONSTRAINT fkEmpleadoDepartamento FOREIGN KEY (nombreDPertenece, numeroDPertenece) 
    REFERENCES departamento (nombreD, numeroD)
    ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE departamento
  ADD CONSTRAINT fkDepartamentoEmpleado
   FOREIGN KEY (nssEmpleadoDirige) REFERENCES empleado(nssEmpleado)
   ON DELETE RESTRICT ON UPDATE RESTRICT;



ALTER TABLE supervisa  
  ADD CONSTRAINT fkSupervisaEmpleado 
    FOREIGN KEY (nssEmpleado) REFERENCES empleado (nssEmpleado)
    ON DELETE RESTRICT ON UPDATE RESTRICT,

  ADD CONSTRAINT fkSupervisaEmpleadoSupervisa 
    FOREIGN KEY (nssSupervisor) REFERENCES empleado (nssEmpleado)
    ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE dependiente
  ADD CONSTRAINT fkDependienteEmpleado FOREIGN KEY(nssEmpleado) REFERENCES empleado(nssEmpleado)
  ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE localizaciones
  ADD CONSTRAINT fkLocalizacionesDepartamnto FOREIGN KEY(nombreD,numeroD) REFERENCES departamento(nombreD,numeroD)
  ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE proyecto
  ADD CONSTRAINT fkProyectoDepartamento FOREIGN KEY (nombreDControla,numeroDControla) 
  REFERENCES departamento(nombreD,numeroD) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE trabajaEn
ADD CONSTRAINT fkTrabajaEnEmpleado FOREIGN KEY(nssEmpleado) REFERENCES empleado(nssEmpleado)
  ON DELETE RESTRICT ON UPDATE RESTRICT,

ADD CONSTRAINT fkTrabajaEmpleado FOREIGN KEY(numeroP,nombreP) REFERENCES proyecto(numeroP,nombreP)
  ON DELETE RESTRICT ON UPDATE RESTRICT;


