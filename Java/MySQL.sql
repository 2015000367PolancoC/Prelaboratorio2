create database prelab2;
use prelab2;

create table alumno(
	Idalumno int primary key auto_increment,
    Nombres varchar(40),
    Apellidos varchar(40),
    Fechanacimiento date,
    Grado varchar(10),
    Seccion varchar(1),
    Direccion varchar(40),
    Telefono numeric,
    Email varchar(40),
    Contraseña varchar(40)
);

create table notas(
	Idnota int primary key auto_increment,
    Idalumno int,
    Idcurso int,
	Unidad int,
    Promedio double
);