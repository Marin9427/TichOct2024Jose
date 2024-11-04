--1.-Realizar las siguiente consulta Alumnos por Estado
select Estados.nombre, count( Alumnos.idEstadoOrigen) as [total Alumnos]
from Estados
INNER JOIN Alumnos on Estados.id=Alumnos.idEstadoOrigen
group by Estados.nombre

--2.-Realizar la siguiente consulta Alumnos por Estatus

select EstatusAlumnos.Nombre, COUNT(Alumnos.idEstatus) as Estatus
from EstatusAlumnos
INNER JOIN Alumnos on EstatusAlumnos.id=Alumnos.idEstatus
group by EstatusAlumnos.Nombre

--3.-Realiza la siguiente consula Resumen de Calificaciones
select 'Calificaciones Alumnos' as [Resumen Calificaciones], count (calificacion) as Tot, MAX(calificacion) as Maxima ,min(calificacion) as Minima , avg(CursosAlumnos.calificacion) as promedio
from CursosAlumnos

--4.-Realizar la siguiente consulta Resumen de calificaciones por curso
select CatCursos.nombre , Cursos.fechaInicio, Cursos.fechatermino , count(CursosAlumnos.idAlumno) as total, MAX(CursosAlumnos.calificacion) as Maxima, min(CursosAlumnos.calificacion) as Min , AVG(CursosAlumnos.calificacion) as Promedio
from CatCursos
INNER JOIN Cursos on CatCursos.id=Cursos.id_CatCurso
INNER JOIN CursosAlumnos on Cursos.id=CursosAlumnos.idCurso
group by Cursos.fechaInicio , CatCursos.nombre, Cursos.fechatermino 
order by CatCursos.nombre

--5.-Realizar la siguiente consulta Resumen de Calificaciones por estado, considerando unicamente a los estados que 
--promedio mayor a 6
select Estados.nombre , count(CursosAlumnos.idAlumno) as Total, MAX(CursosAlumnos.calificacion) as Maxima, min(CursosAlumnos.calificacion) as Min , AVG(CursosAlumnos.calificacion) as Promedio
from Estados
INNER JOIN Alumnos on Estados.id=Alumnos.idEstadoOrigen
INNER JOIN CursosAlumnos on Alumnos.id=CursosAlumnos.idAlumno
group by Estados.nombre
having AVG(CursosAlumnos.calificacion)>60




