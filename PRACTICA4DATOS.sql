USE practica4;

set FOREIGN_KEY_CHECKS=0;
INSERT INTO empleado (nssEmpleado, nombre, nombreDPertenece, numeroDPertenece) VALUES 
(1, 'Rosa', 'comercial', 1),
(2, 'Eva', 'comercial', 2), 
(3, 'Jose', 'tecnico', 1), 
(4, 'Luis', 'tecmico', 1),
(5, 'Cesar', 'tecnico', 1),
(6, 'Cesar', 'tecnico', 1),
(7, 'Eva', 'tecnico', 1),
(8, 'Susana', 'tecnico', 1);


INSERT INTO departamento (nombreD,numeroD,nssEmpleadoDirige) VALUES
('programacion', 1, 1),
('programacion', 2, 2),
('tecnico', 1, 3),
('tecnico', 2, 8),
('tecnico', 3, 4),
('comercial', 1, 5),
('comercial', 2, 6);

INSERT INTO supervisa (nssEmpleado, nssSupervisor) VALUES
(1,2),
(3,2),
(2,4);

INSERT INTO dependiente (nombreDependiente, nssEmpleado, parentesco) VALUES
('jorge',1,'hijo'),
('loreto',2,'hija');
INSERT INTO localizaciones (nombreD, numeroD, localizacionDept) VALUES
('programacion', 1, 'santander'),
('programacion', 2, 'santander'),
('tecnico', 1,'laredo'),
('tecnico', 2,'laredo'),
('tecnico', 3,'torrelavega'),
('comercial', 1,'santander'),
('comercial', 2,'loredo');

INSERT INTO proyecto (numeroP, nombreP, localizacion, nombreDControla, numeroDControla) VALUES
(1, 'proyecto', 'santander', 'programacion', 1),
(2, 'proyecto2', 'isla', 'programacion', 1),
(3, 'proyecto3', 'noja', 'tecnico', 1);

INSERT INTO trabajaen (nssEmpleado, nombreP, numeroP, horas) VALUES
(1, 'proyecto', 1, 3),
(2, 'proyecto2', 2, 4),
(2, 'proyecto3', 3, 5);
