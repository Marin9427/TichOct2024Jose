--1.-Realizar la siguiente Consulta con el nombre y apellidos en Mayúsculas
select  [id] , UPPER([nombre]) as nombre , UPPER([primerApellido]) as [primer Apellido], UPPER([segundoApellido]) as [segundo Apellido],[fechaNacimiento], GETDATE() as Hoy, DATEDIFF(YEAR,fechaNacimiento, GETDATE()) as Edad, 
DATEDIFF(YEAR,fechaNacimiento,  DATEADD(month, 5, GETDATE())) AS Edad5Meses
from Alumnos

--2.-Realizar la consulta Anterior agregando columa con la fecha de nacimiento extrada del CURP
select  [id] , UPPER([nombre]) as nombre , UPPER([primerApellido]) as [primer Apellido], UPPER([segundoApellido]) as [segundo Apellido],[fechaNacimiento], [curp] , CONVERT(DATE,SUBSTRING(curp,5,6)) as FechaCurp
from Alumnos

--3.-Realizar una consulta con los datos del alumno y una columna adicional indicando el genero con la palabra 'Hombre'
-- o 'Mujer' segun corresponda de acuedo con lo indicado en la columna 11 del Curp
select  [id] , UPPER([nombre]) as nombre , UPPER([primerApellido]) as [primer Apellido], UPPER([segundoApellido]) as [segundo Apellido],[fechaNacimiento], [curp] , IIF(SUBSTRING(curp,11,1)='H' , 'HOMBRE', 'MUJER') as Genero
from Alumnos

--4.-Realizar la siguiente consulta de Alumnos, cambiando el correo de Gmail por hotmail
select  [id] , UPPER([nombre]) as nombre , UPPER([primerApellido]) as [primer Apellido], UPPER([segundoApellido]) as [segundo Apellido],[fechaNacimiento], [curp] , REPLACE(correo,'@gmail.com' , '@hotmail.com') as correo
from Alumnos



