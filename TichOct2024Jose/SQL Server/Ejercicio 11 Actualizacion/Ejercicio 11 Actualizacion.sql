--1 Actulizar el estatus del Alumnos de los que estan en propedeutico a CAPACITACION
update Alumnos
set idEstatus=3
where idEstatus=2

--2 Actulizar el segundo apellido del Alumno a Mayúsculas

UPDATE Alumnos 
set  Alumnos.segundoApellido=UPPER(segundoApellido)
SELECT * FROM Alumnos




--3 Actualizar el segundo Apeliido para que la primera letra sea mayusculas y el resto minusculas

UPDATE Alumnos
SET segundoApellido=STUFF(LOWER(segundoApellido), 1,1 , UPPER(LEFT(segundoApellido,1)))

--4 Actualizar el numero telefonico de los instructorés para que los dos primeros digitos sean 55, en caso de que
--de acuerdo al curp sean del DF
update Instructores
set telefono= STUFF(telefono,1,2,'55')
where SUBSTRING(curp,12,2)='DF'

select * from Instructores

--5 Subirles  10 puntos en la calificacion a los alumnos de hidalgo y oaxaca y del Curso impartido en junio de 2021.
	
	update CursosAlumnos 
	set calificacion=calificacion+10
	from Estados
	INNER JOIN Alumnos ON  Estados.id=Alumnos.idEstadoOrigen
	INNER JOIN CursosAlumnos ON Alumnos.id=CursosAlumnos.idAlumno
	INNER JOIN Cursos on CursosAlumnos.idCurso=Cursos.id
	where (Estados.nombre='Veracruz' or Estados.nombre='Zacatecas') AND (Cursos.fechaInicio like '2000-03%' and CursosAlumnos.calificacion<=90)

	

	/*select  Alumnos.nombre , Alumnos.primerApellido, Alumnos.segundoApellido, Estados.nombre,  Cursos.fechaInicio , CursosAlumnos.calificacion
	from Estados
	INNER JOIN Alumnos ON  Estados.id=Alumnos.idEstadoOrigen
	INNER JOIN CursosAlumnos ON Alumnos.id=CursosAlumnos.idAlumno
	INNER JOIN Cursos on CursosAlumnos.idCurso=Cursos.id*/

--6 Subirle el 10% de la cuota por hora a los profesores que han impartido el curso de desarrollador.net
	
	update Instructores
	set cuotaHora=(cuotaHora*.10)+cuotaHora
	--select *
	from Instructores
	INNER JOIN CursosInstructores on Instructores.id=CursosInstructores.idInstructor
	where CursosInstructores.idCurso=2

	 select * from  Instructores
--7 En la Base de Datos Ejercicios realice los siguiente:
--a)Copiar la Tabla de Alumnos de la Base de Datos InstitutoTich a la Tabla AlumnosTodos
--b)Copiar a los alumnos de Hidalgo de la Tabla de Alumnos de la Base de datos InstitutoTich a la tabla AlumnosHgo
--c)Actualizar el telefono de la tabla AlumnosTodos obtenidos desde la tabla AlumnosHgo

SELECT * INTO Ejercicios.dbo.AlumnosTodos 
from Alumnos 
select * from AlumnosTodos
-----------------------------
select * into  Ejercicios.dbo.AlumnosJalisco
from Alumnos
where idEstadoOrigen=13
select * from AlumnosJalisco
------------------------------
update AlumnosJalisco
set telefono= STUFF(telefono,1,2,'77')
-----------------------------
update alu
set alu.telefono = STUFF(alu.telefono,1,2,'83')
FROM AlumnosTodos alu
INNER JOIN AlumnosJalisco on alu.id=AlumnosJalisco.id
where alu.idEstadoOrigen=13

select * from AlumnosTodos




