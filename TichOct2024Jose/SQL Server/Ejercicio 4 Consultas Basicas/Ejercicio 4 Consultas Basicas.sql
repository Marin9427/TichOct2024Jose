--1.-Realizar la siguiente consulta de Alumnos
select  primerApellido as [Apellido Paterno], segundoApellido as [Apellido Materno],nombre as nombre , telefono as telefono, correo as correo
from Alumnos
--2.-Realizar la siguiente consulta de Instructores

select [nombre],[primerApellido] as [Apellido Paterno],[segundoApellido] as [Apellido Materno],[rfc],[cuotaHora]
from Instructores

--3.-Realizar la siguiente consulta de CatCusos
select [clave],[nombre],[descripcion],[horas]
from CatCursos
--4.-Realizar la consulta de 5 Alumnos mas jovenes
select top(5) *
from Alumnos
order by fechaNacimiento DESC

--5.-Crear la Base de datos Ejercicios
Create database Ejercicios

--6.-Copiar las tablas de Alumnos e instructores desde la Base de Daros Instituto Tich a la de Ejercicios

SELECT * INTO Ejercicios.dbo.Alumnos
from Alumnos
go
SELECT * INTO Ejercicios.dbo.Instructores
from Instructores