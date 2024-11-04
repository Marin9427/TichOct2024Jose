	--1.-Obtenber el nombre del alumno cuya longitud es la mas grande
	select Alumnos.nombre ,len(nombre) as numeroLetras
	from Alumnos
	WHERE  len(nombre) = (select max(len(nombre)) from alumnos)

	--2.-Mostrar el o los alumnos menos jovenes
	select nombre , DATEDIFF(YEAR,fechaNacimiento,GETDATE()) as [edad actual]  
	from Alumnos
 	where   DATEDIFF(YEAR,fechaNacimiento,GETDATE()) = (SELECT MAX(DATEDIFF(YEAR,fechaNacimiento,GETDATE())) FROM ALUMNOS)

	--3.-Obtener una lista de los alumnos que tuvieron la maxima calificacion
	select Alumnos.nombre , Alumnos.primerApellido , Alumnos.segundoApellido , CatCursos.nombre , Cursos.fechaInicio , Cursos.fechatermino , CursosAlumnos.calificacion
	from Alumnos
	INNER JOIN CursosAlumnos on Alumnos.id=CursosAlumnos.idAlumno 
	INNER JOIN Cursos on CursosAlumnos.idCurso=Cursos.id
	INNER JOIN CatCursos on Cursos.id_CatCurso=CatCursos.id
	where CursosAlumnos.calificacion = ALL (select  max(calificacion) from CursosAlumnos )

	--4.-Obtener la siguiente consulta con los datos de cada uno de los cursos

	select  CatCursos.nombre  , Cursos.fechaInicio , Cursos.fechatermino , count(CursosAlumnos.idAlumno) as Total , MAX(calificacion) as CalMax, min(calificacion) as CalMin, AVG(calificacion) as CalProm
	from Alumnos
	INNER JOIN CursosAlumnos on Alumnos.id=CursosAlumnos.idAlumno 
	INNER JOIN Cursos on CursosAlumnos.idCurso=Cursos.id
	INNER JOIN CatCursos on Cursos.id_CatCurso=CatCursos.id
	GROUP BY CatCursos.nombre  , Cursos.fechaInicio , Cursos.fechatermino

	--5.-Obtener una consulta de los alumnpos que tienen una calificacion igual o menor que la promedio de calificaciones
		select * 
		from Alumnos
		INNER JOIN CursosAlumnos on Alumnos.id=CursosAlumnos.idAlumno
		where CursosAlumnos.calificacion <= (select AVG(CursosAlumnos.calificacion)
												from CursosAlumnos)

