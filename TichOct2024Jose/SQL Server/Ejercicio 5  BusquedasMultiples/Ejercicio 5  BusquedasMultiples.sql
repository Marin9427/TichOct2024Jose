-----------------------------------------------CONSULTAS MULTIPLES TABLAS--------------------------------------------------------------------------
--1.-Realiza la suiente consulta de Instructores
select [nombre],[primerApellido] as [Apellido Paterno],[segundoApellido] as [Apellido Materno],[rfc],[cuotaHora], IIF(activo=1, 'Activo','Inactivo') AS Estatus
from [dbo].[Instructores] 
--2.- Realizar la siguiente consulta de Cursos

--3.-Realiza la siguiente consulta de alumnos
Select	Alumnos.nombre,Alumnos.primerApellido as [Primer Apellido] , Alumnos.segundoApellido as [Segundo Apellido] ,Alumnos.curp, Estados.nombre as Estado , EstatusAlumnos.Nombre as Estatus
From Alumnos
INNER JOIN Estados on Alumnos.idEstadoOrigen = Estados.id
INNER JOIN EstatusAlumnos on Alumnos.idEstatus = EstatusAlumnos.id

--4.-Realizar la siguiente consulta de Instructores, en que cursos ha participado
select CONCAT(Instructores.nombre , ' ' , Instructores.primerApellido,+ ' ' + Instructores.segundoApellido) as Instructor , Instructores.cuotaHora, CatCursos.nombre , Cursos.fechaInicio , Cursos.fechatermino
from CatCursos
INNER JOIN Cursos ON CatCursos.id = Cursos.id_CatCurso
INNER JOIN CursosInstructores ON Cursos.id = CursosInstructores.idCurso
INNER JOIN Instructores ON CursosInstructores.idInstructor = Instructores.id
ORDER BY Instructor

--5.-Realizar la siguiente consulta de Alumnos , mostrando los cursos ha tomado
SELECT Alumnos.nombre , Alumnos.primerApellido , Alumnos.segundoApellido , Estados.nombre as Estado, CatCursos.nombre as Curso , CursosAlumnos.fechaInscripcion,  Cursos.fechaInicio , Cursos.fechatermino , CursosAlumnos.calificacion 
from CatCursos
INNER JOIN Cursos ON CatCursos.id = Cursos.id_CatCurso
INNER JOIN CursosAlumnos ON Cursos.id = CursosAlumnos.idCurso
INNER JOIN Alumnos on CursosAlumnos.idAlumno = Alumnos.id
INNER JOIN Estados on Alumnos.idEstadoOrigen = Estados.id
INNER JOIN EstatusAlumnos on Alumnos.idEstatus = EstatusAlumnos.id
--6.-Consulta de alumnos: Nombre y apoellidos , curso , fecha inicial , fecha final , calificacion. Ordenado de la calificacion mas alta a la mas baja

SELECT Alumnos.nombre , CONCAT( Alumnos.primerApellido , ' ' , Alumnos.segundoApellido ) as Apellidos , CatCursos.nombre as Curso ,  Cursos.fechaInicio , Cursos.fechatermino , CursosAlumnos.calificacion
from CatCursos
INNER JOIN Cursos ON CatCursos.id = Cursos.id_CatCurso
INNER JOIN CursosAlumnos ON Cursos.id = CursosAlumnos.idCurso
INNER JOIN Alumnos on CursosAlumnos.idAlumno = Alumnos.id
INNER JOIN Estados on Alumnos.idEstadoOrigen = Estados.id
INNER JOIN EstatusAlumnos on Alumnos.idEstatus = EstatusAlumnos.id
order by CursosAlumnos.calificacion DESC
--7.-Realizar la siguiente consulta de los Cursos con su correspondiente curso de prerrequisito

 SELECT catB.clave as  Clave , catB.nombre as  curso , catB.horas as  Horas , IIF(catA.nombre is NULL, 'SIN PREREGISTRO' , catA.nombre )  AS PreRequisito
from CatCursos catA
RIGHT JOIN CatCursos catB on catA.id = catB.idPreRequisito

--8.-Realizar una consulta con los datos del alumno y cursos , dentro de ellos las calificacion, obteniendo el nivel alcanzado de acuedo con la siguiente
--10-90 Excelente, 89-70 Bien, 69-60 Suficiente  <6 N/A
SELECT Alumnos.nombre , Alumnos.primerApellido , Alumnos.segundoApellido ,  CatCursos.nombre as Nombre , Cursos.fechaInicio , Cursos.fechatermino , CursosAlumnos.calificacion ,
CASE
	WHEN calificacion BETWEEN 90 AND 1000 THEN 'Excelente'
	WHEN calificacion BETWEEN 70 AND 89 THEN 'Bien'
	WHEN calificacion BETWEEN 60 AND 69 THEN  'Suficiente'
	ELSE 'N/A'
	END AS Nivel
from CatCursos
INNER JOIN Cursos ON CatCursos.id = Cursos.id_CatCurso
INNER JOIN CursosAlumnos ON Cursos.id = CursosAlumnos.idCurso
INNER JOIN Alumnos on CursosAlumnos.idAlumno = Alumnos.id
INNER JOIN Estados on Alumnos.idEstadoOrigen = Estados.id
INNER JOIN EstatusAlumnos on Alumnos.idEstatus = EstatusAlumnos.id






