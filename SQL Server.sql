DROP DATABASE IF EXISTS universidad;
CREATE DATABASE universidad;
USE universidad;
/*create table sexo(
    id int primary key,
    sexo varchar(1)
);
insert into sexo values(1,'H');
insert into sexo values(2,'M');

create table asignatura_tipo(
    id int primary key,
    tipo varchar(20)
);
insert into sexo values(1,'b�sica');
insert into sexo values(2,'obligatoria');
insert into sexo values(3,'optativa');
*/
CREATE TABLE departamento (
    id int primary key IDENTITY(1,1),
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE alumno (
    id INT PRIMARY KEY IDENTITY(1,1),
    nif VARCHAR(9) UNIQUE,
    nombre VARCHAR(25) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50),
    ciudad VARCHAR(25) NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    telefono VARCHAR(9),
    fecha_nacimiento DATE NOT NULL,
    sexo varchar(1) not null,
    id_sexo int,
    FOREIGN KEY (id_sexo) REFERENCES sexo(id)
);
 
CREATE TABLE profesor (
    id INT  PRIMARY KEY IDENTITY(1,1),
    nif VARCHAR(9) UNIQUE,
    nombre VARCHAR(25) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50),
    ciudad VARCHAR(25) NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    telefono VARCHAR(9),
    fecha_nacimiento DATE NOT NULL,
    sexo VARCHAR(1) NOT NULL,
    id_departamento INT  NOT NULL,
    FOREIGN KEY (id_departamento) REFERENCES departamento(id)
);
 
 CREATE TABLE grado (
    id INT  PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(100) NOT NULL
);
 
CREATE TABLE asignatura (
    id INT  PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(100) NOT NULL,
    creditos FLOAT  NOT NULL,
    tipo varchar(20) not null,
    curso TINYINT  NOT NULL,
    cuatrimestre TINYINT  NOT NULL,
    id_profesor INT ,
    id_grado INT  NOT NULL,
    FOREIGN KEY(id_profesor) REFERENCES profesor(id),
    FOREIGN KEY(id_grado) REFERENCES grado(id)
);
 
CREATE TABLE curso_escolar (
    id INT  PRIMARY KEY IDENTITY(1,1),
    anyo_inicio INT NOT NULL,
    anyo_fin INT NOT NULL
);

CREATE TABLE alumno_se_matricula_asignatura (
    id_alumno INT  NOT NULL,
    id_asignatura INT  NOT NULL,
    id_curso_escolar INT  NOT NULL,
    PRIMARY KEY (id_alumno, id_asignatura, id_curso_escolar),
    FOREIGN KEY (id_alumno) REFERENCES alumno(id),
    FOREIGN KEY (id_asignatura) REFERENCES asignatura(id),
    FOREIGN KEY (id_curso_escolar) REFERENCES curso_escolar(id)
);
 
 /* Departamento */
INSERT INTO departamento VALUES ('Inform�tica');
INSERT INTO departamento VALUES ('Matem�ticas');
INSERT INTO departamento VALUES ('Econom�a y Empresa');
INSERT INTO departamento VALUES ('Educaci�n');
INSERT INTO departamento VALUES ('Agronom�a');
INSERT INTO departamento VALUES ('Qu�mica y F�sica');
INSERT INTO departamento VALUES ('Filolog�a');
INSERT INTO departamento VALUES ('Derecho');
INSERT INTO departamento VALUES ('Biolog�a y Geolog�a');
 
 /* Persona */
INSERT INTO alumno VALUES ('89542419S', 'Juan', 'Saez', 'Vega', 'Almer�a', 'C/ Mercurio', '618253876', '1992/08/08', 'H');
INSERT INTO alumno VALUES ('26902806M', 'Salvador', 'S�nchez', 'P�rez', 'Almer�a', 'C/ Real del barrio alto', '950254837', '1991/03/28', 'H');
INSERT INTO alumno VALUES ('17105885A', 'Pedro', 'Heller', 'Pagac', 'Almer�a', 'C/ Estrella fugaz', NULL, '2000/10/05', 'H');
INSERT INTO alumno VALUES ('04233869Y', 'Jos�', 'Koss', 'Bayer', 'Almer�a', 'C/ J�piter', '628349590', '1998/01/28', 'H');
INSERT INTO alumno VALUES ('97258166K', 'Ismael', 'Strosin', 'Turcotte', 'Almer�a', 'C/ Neptuno', NULL, '1999/05/24', 'H');
INSERT INTO alumno VALUES ('82842571K', 'Ram�n', 'Herzog', 'Tremblay', 'Almer�a', 'C/ Urano', '626351429', '1996/11/21', 'H');
INSERT INTO alumno VALUES ('46900725E', 'Daniel', 'Herman', 'Pacocha', 'Almer�a', 'C/ Andarax', '679837625', '1997/04/26', 'H');
INSERT INTO alumno VALUES ('11578526G', 'Inma', 'Lakin', 'Yundt', 'Almer�a', 'C/ Picos de Europa', '678652431', '1998/09/01', 'M');
INSERT INTO alumno VALUES ('79089577Y', 'Juan', 'Guti�rrez', 'L�pez', 'Almer�a', 'C/ Los pinos', '678652431', '1998/01/01', 'H');
INSERT INTO alumno VALUES ('41491230N', 'Antonio', 'Dom�nguez', 'Guerrero', 'Almer�a', 'C/ Cabo de Gata', '626652498', '1999/02/11', 'H');
INSERT INTO alumno VALUES ('64753215G', 'Irene', 'Hern�ndez', 'Mart�nez', 'Almer�a', 'C/ Zapillo', '628452384', '1996/03/12', 'M');
INSERT INTO alumno VALUES ('85135690V', 'Sonia', 'Gea', 'Ruiz', 'Almer�a', 'C/ Mercurio', '678812017', '1995/04/13', 'M');

/* Profesor */
INSERT INTO profesor VALUES ('11105554G', 'Zoe', 'Ramirez', 'Gea', 'Almer�a', 'C/ Marte', '618223876', '1979/08/19', 'M', 1);
INSERT INTO profesor VALUES ('38223286T', 'David', 'Schmidt', 'Fisher', 'Almer�a', 'C/ Venus', '678516294', '1978/01/19', 'H', 2);
INSERT INTO profesor VALUES ('79503962T', 'Cristina', 'Lemke', 'Rutherford', 'Almer�a', 'C/ Saturno', '669162534', '1977/08/21', 'M', 3);
INSERT INTO profesor VALUES ('61142000L', 'Esther', 'Spencer', 'Lakin', 'Almer�a', 'C/ Plut�n', NULL, '1977/05/19', 'M', 4);
INSERT INTO profesor VALUES ('85366986W', 'Carmen', 'Streich', 'Hirthe', 'Almer�a', 'C/ Almanzora', NULL, '1971-04-29', 'M', 4);
INSERT INTO profesor VALUES ('73571384L', 'Alfredo', 'Stiedemann', 'Morissette', 'Almer�a', 'C/ Guadalquivir', '950896725', '1980/02/01', 'H', 6);
INSERT INTO profesor VALUES ('82937751G', 'Manolo', 'Hamill', 'Kozey', 'Almer�a', 'C/ Duero', '950263514', '1977/01/02', 'H', 1);
INSERT INTO profesor VALUES ('80502866Z', 'Alejandro', 'Kohler', 'Schoen', 'Almer�a', 'C/ Tajo', '668726354', '1980/03/14', 'H', 2);
INSERT INTO profesor VALUES ('10485008K', 'Antonio', 'Fahey', 'Considine', 'Almer�a', 'C/ Sierra de los Filabres', NULL, '1982/03/18', 'H', 3);
INSERT INTO profesor VALUES ('85869555K', 'Guillermo', 'Ruecker', 'Upton', 'Almer�a', 'C/ Sierra de G�dor', NULL, '1973/05/05', 'H', 4);
INSERT INTO profesor VALUES ('04326833G', 'Micaela', 'Monahan', 'Murray', 'Almer�a', 'C/ Veleta', '662765413', '1976/02/25', 'H', 5);
INSERT INTO profesor VALUES ('79221403L', 'Francesca', 'Schowalter', 'Muller', 'Almer�a', 'C/ Quinto pino', NULL, '1980/10/31', 'H', 6);
INSERT INTO profesor VALUES ('13175769N', 'Pepe', 'S�nchez', 'Ruiz', 'Almer�a', 'C/ Quinto pino', NULL, '1980/10/16', 'H', 1);
INSERT INTO profesor VALUES ('98816696W', 'Juan', 'Guerrero', 'Mart�nez', 'Almer�a', 'C/ Quinto pino', NULL, '1980/11/21', 'H', 1);
INSERT INTO profesor VALUES ('77194445M', 'Mar�a', 'Dom�nguez', 'Hern�ndez', 'Almer�a', 'C/ Quinto pino', NULL, '1980/12/13', 'M', 2);

/* Grado */
INSERT INTO grado VALUES ('Grado en Ingenier�a Agr�cola (Plan 2015)');
INSERT INTO grado VALUES ('Grado en Ingenier�a El�ctrica (Plan 2014)');
INSERT INTO grado VALUES ('Grado en Ingenier�a Electr�nica Industrial (Plan 2010)');
INSERT INTO grado VALUES ('Grado en Ingenier�a Inform�tica (Plan 2015)');
INSERT INTO grado VALUES ('Grado en Ingenier�a Mec�nica (Plan 2010)');
INSERT INTO grado VALUES ('Grado en Ingenier�a Qu�mica Industrial (Plan 2010)');
INSERT INTO grado VALUES ('Grado en Biotecnolog�a (Plan 2015)');
INSERT INTO grado VALUES ('Grado en Ciencias Ambientales (Plan 2009)');
INSERT INTO grado VALUES ('Grado en Matem�ticas (Plan 2010)');
INSERT INTO grado VALUES ('Grado en Qu�mica (Plan 2009)');
 /* Asignatura */
INSERT INTO asignatura VALUES ('�lgegra lineal y matem�tica discreta', 6, 'b�sica', 1, 1, NULL, 4);
INSERT INTO asignatura VALUES ('C�lculo', 6, 'b�sica', 1, 1, NULL, 4);
INSERT INTO asignatura VALUES ('F�sica para inform�tica', 6, 'b�sica', 1, 1, NULL, 4);
INSERT INTO asignatura VALUES ('Introducci�n a la programaci�n', 6, 'b�sica', 1, 1, NULL, 4);
INSERT INTO asignatura VALUES ('Organizaci�n y gesti�n de empresas', 6, 'b�sica', 1, 1, NULL, 4);
INSERT INTO asignatura VALUES ('Estad�stica', 6, 'b�sica', 1, 2, NULL, 4);
INSERT INTO asignatura VALUES ('Estructura y tecnolog�a de computadores', 6, 'b�sica', 1, 2, NULL, 4);
INSERT INTO asignatura VALUES ('Fundamentos de electr�nica', 6, 'b�sica', 1, 2, NULL, 4);
INSERT INTO asignatura VALUES ('L�gica y algor�tmica', 6, 'b�sica', 1, 2, NULL, 4);
INSERT INTO asignatura VALUES ('Metodolog�a de la programaci�n', 6, 'b�sica', 1, 2, NULL, 4);
INSERT INTO asignatura VALUES ('Arquitectura de Computadores', 6, 'b�sica', 2, 1, 3, 4);
INSERT INTO asignatura VALUES ('Estructura de Datos y Algoritmos I', 6, 'obligatoria', 2, 1, 3, 4);
INSERT INTO asignatura VALUES ('Ingenier�a del Software', 6, 'obligatoria', 2, 1, 14, 4);
INSERT INTO asignatura VALUES ('Sistemas Inteligentes', 6, 'obligatoria', 2, 1, 3, 4);
INSERT INTO asignatura VALUES ('Sistemas Operativos', 6, 'obligatoria', 2, 1, 14, 4);
INSERT INTO asignatura VALUES ('Bases de Datos', 6, 'b�sica', 2, 2, 14, 4);
INSERT INTO asignatura VALUES ('Estructura de Datos y Algoritmos II', 6, 'obligatoria', 2, 2, 14, 4);
INSERT INTO asignatura VALUES ('Fundamentos de Redes de Computadores', 6 ,'obligatoria', 2, 2, 3, 4);
INSERT INTO asignatura VALUES ('Planificaci�n y Gesti�n de Proyectos Inform�ticos', 6, 'obligatoria', 2, 2, 3, 4);
INSERT INTO asignatura VALUES ('Programaci�n de Servicios Software', 6, 'obligatoria', 2, 2, 14, 4);
INSERT INTO asignatura VALUES ('Desarrollo de interfaces de usuario', 6, 'obligatoria', 3, 1, 14, 4);
INSERT INTO asignatura VALUES ('Ingenier�a de Requisitos', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO asignatura VALUES ('Integraci�n de las Tecnolog�as de la Informaci�n en las Organizaciones', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO asignatura VALUES ('Modelado y Dise�o del Software 1', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO asignatura VALUES ('Multiprocesadores', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO asignatura VALUES ('Seguridad y cumplimiento normativo', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO asignatura VALUES ('Sistema de Informaci�n para las Organizaciones', 6, 'optativa', 3, 1, NULL, 4); 
INSERT INTO asignatura VALUES ('Tecnolog�as web', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO asignatura VALUES ('Teor�a de c�digos y criptograf�a', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO asignatura VALUES ('Administraci�n de bases de datos', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES ('Herramientas y M�todos de Ingenier�a del Software', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES ('Inform�tica industrial y rob�tica', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES ('Ingenier�a de Sistemas de Informaci�n', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES ('Modelado y Dise�o del Software 2', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES ('Negocio Electr�nico', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES ('Perif�ricos e interfaces', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES ('Sistemas de tiempo real', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES ('Tecnolog�as de acceso a red', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES ('Tratamiento digital de im�genes', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES ('Administraci�n de redes y sistemas operativos', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO asignatura VALUES ('Almacenes de Datos', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO asignatura VALUES ('Fiabilidad y Gesti�n de Riesgos', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO asignatura VALUES ('L�neas de Productos Software', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO asignatura VALUES ('Procesos de Ingenier�a del Software 1', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO asignatura VALUES ('Tecnolog�as multimedia', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO asignatura VALUES ('An�lisis y planificaci�n de las TI', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO asignatura VALUES ('Desarrollo R�pido de Aplicaciones', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO asignatura VALUES ('Gesti�n de la Calidad y de la Innovaci�n Tecnol�gica', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO asignatura VALUES ('Inteligencia del Negocio', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO asignatura VALUES ('Procesos de Ingenier�a del Software 2', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO asignatura VALUES ('Seguridad Inform�tica', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO asignatura VALUES ('Biologia celular', 6, 'b�sica', 1, 1, NULL, 7);
INSERT INTO asignatura VALUES ('F�sica', 6, 'b�sica', 1, 1, NULL, 7);
INSERT INTO asignatura VALUES ('Matem�ticas I', 6, 'b�sica', 1, 1, NULL, 7);
INSERT INTO asignatura VALUES ('Qu�mica general', 6, 'b�sica', 1, 1, NULL, 7);
INSERT INTO asignatura VALUES ('Qu�mica org�nica', 6, 'b�sica', 1, 1, NULL, 7);
INSERT INTO asignatura VALUES ('Biolog�a vegetal y animal', 6, 'b�sica', 1, 2, NULL, 7);
INSERT INTO asignatura VALUES ('Bioqu�mica', 6, 'b�sica', 1, 2, NULL, 7);
INSERT INTO asignatura VALUES ('Gen�tica', 6, 'b�sica', 1, 2, NULL, 7);
INSERT INTO asignatura VALUES ('Matem�ticas II', 6, 'b�sica', 1, 2, NULL, 7);
INSERT INTO asignatura VALUES ('Microbiolog�a', 6, 'b�sica', 1, 2, NULL, 7);
INSERT INTO asignatura VALUES ('Bot�nica agr�cola', 6, 'obligatoria', 2, 1, NULL, 7);
INSERT INTO asignatura VALUES ('Fisiolog�a vegetal', 6, 'obligatoria', 2, 1, NULL, 7);
INSERT INTO asignatura VALUES ('Gen�tica molecular', 6, 'obligatoria', 2, 1, NULL, 7);
INSERT INTO asignatura VALUES ('Ingenier�a bioqu�mica', 6, 'obligatoria', 2, 1, NULL, 7);
INSERT INTO asignatura VALUES ('Termodin�mica y cin�tica qu�mica aplicada', 6, 'obligatoria', 2, 1, NULL, 7);
INSERT INTO asignatura VALUES ('Biorreactores', 6, 'obligatoria', 2, 2, NULL, 7);
INSERT INTO asignatura VALUES ('Biotecnolog�a microbiana', 6, 'obligatoria', 2, 2, NULL, 7);
INSERT INTO asignatura VALUES ('Ingenier�a gen�tica', 6, 'obligatoria', 2, 2, NULL, 7);
INSERT INTO asignatura VALUES ('Inmunolog�a', 6, 'obligatoria', 2, 2, NULL, 7);
INSERT INTO asignatura VALUES ('Virolog�a', 6, 'obligatoria', 2, 2, NULL, 7);
INSERT INTO asignatura VALUES ('Bases moleculares del desarrollo vegetal', 4.5, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO asignatura VALUES ('Fisiolog�a animal', 4.5, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO asignatura VALUES ('Metabolismo y bios�ntesis de biomol�culas', 6, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO asignatura VALUES ('Operaciones de separaci�n', 6, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO asignatura VALUES ('Patolog�a molecular de plantas', 4.5, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO asignatura VALUES ('T�cnicas instrumentales b�sicas', 4.5, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO asignatura VALUES ('Bioinform�tica', 4.5, 'obligatoria', 3, 2, NULL, 7);
INSERT INTO asignatura VALUES ('Biotecnolog�a de los productos hortofrut�culas', 4.5, 'obligatoria', 3, 2, NULL, 7);
INSERT INTO asignatura VALUES ('Biotecnolog�a vegetal', 6, 'obligatoria', 3, 2, NULL, 7);
INSERT INTO asignatura VALUES ('Gen�mica y prote�mica', 4.5, 'obligatoria', 3, 2, NULL, 7);
INSERT INTO asignatura VALUES ('Procesos biotecnol�gicos', 6, 'obligatoria', 3, 2, NULL, 7);
INSERT INTO asignatura VALUES ('T�cnicas instrumentales avanzadas', 4.5, 'obligatoria', 3, 2, NULL, 7);

/* Curso escolar */
INSERT INTO curso_escolar VALUES (2014, 2015);
INSERT INTO curso_escolar VALUES (2015, 2016);
INSERT INTO curso_escolar VALUES (2016, 2017);
INSERT INTO curso_escolar VALUES (2017, 2018);

/* Alumno se matricula en asignatura */
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 1, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 2, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 3, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 4, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 5, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 6, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 7, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 8, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 9, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 10, 1);

INSERT INTO alumno_se_matricula_asignatura VALUES (1, 1, 2);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 2, 2);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 3, 2);

INSERT INTO alumno_se_matricula_asignatura VALUES (1, 1, 3);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 2, 3);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 3, 3);

INSERT INTO alumno_se_matricula_asignatura VALUES (1, 1, 4);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 2, 4);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 3, 4);

INSERT INTO alumno_se_matricula_asignatura VALUES (2, 2, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (2, 3, 1);

INSERT INTO alumno_se_matricula_asignatura VALUES (4, 1, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 2, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 3, 1);

INSERT INTO alumno_se_matricula_asignatura VALUES (4, 1, 2);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 2, 2);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 3, 2);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 4, 2);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 5, 2);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 6, 2);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 7, 2);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 8, 2);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 9, 2);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 10, 2);

/* Consultas */
--1
SELECT apellido1 AS 'Primer Apellido',apellido2 AS 'Segundo Apellido',nombre FROM alumno
ORDER BY apellido1 ASC;
--2
SELECT apellido1 AS 'Primer Apellido',apellido2 AS 'Segundo Apellido',nombre FROM alumno
WHERE telefono IS NULL;
--3 
SELECT * FROM profesor WHERE telefono IS NULL AND nif like '%K';
--4
SELECT * FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;
--5 
SELECT a.* FROM alumno a
INNER JOIN alumno_se_matricula_asignatura asma on a.id = asma.id_alumno 
INNER JOIN asignatura asi on asi.id = asma.id_asignatura
INNER JOIN grado g on asi.id_grado = g.id
WHERE a.sexo = 'M' AND g.id = 4 ;
--6
select * from asignatura a
INNER JOIN grado g on a.id_grado = g.id
WHERE g.id = 4;
--7
SELECT p.apellido1 AS 'Primer Apellido',p.apellido2 AS 'Segundo Apellido',p.nombre,d.nombre AS 'Departamento' FROM profesor p 
INNER JOIN departamento d on p.id_departamento = d.id
ORDER BY apellido1 asc;
--8
SELECT asi.nombre,c.anyo_inicio,c.anyo_fin FROM alumno a 
INNER JOIN alumno_se_matricula_asignatura asma on a.id = asma.id_alumno
INNER JOIN asignatura asi on asi.id = asma.id_asignatura
INNER JOIN curso_escolar c on c.id = asma.id_curso_escolar
WHERE a.nif = '26902806M';
--9
SELECT  d.nombre FROM departamento d
INNER JOIN profesor p ON d.id = p.id_departamento
INNER JOIN asignatura a ON p.id = a.id_profesor
INNER JOIN grado g ON a.id_grado = g.id
WHERE g.id = 4;
--10
SELECT a.* FROM alumno a 
INNER JOIN alumno_se_matricula_asignatura asma ON a.id = asma.id_alumno
INNER JOIN curso_escolar c ON c.id = asma.id_curso_escolar
WHERE c.anyo_inicio = 2018;