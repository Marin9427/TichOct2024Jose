	--Obtener una consulta que contenga el Nombre y apellidos, mes y d�a de nacimiento de 
	--todos los alumnos y profesores, ordenado por tipo, mes y d�a de nacimiento
	
	SELECT 'Alumno' AS TipoPersona, 
       nombre, 
       primerApellido, 
       segundoApellido, 
       MONTH(fechaNacimiento) AS MesNacimiento, 
       DAY(fechaNacimiento) AS DiaNacimiento
FROM Alumnos

UNION ALL

SELECT 'Profesor' AS TipoPersona, 
       nombre, 
       primerApellido, 
       segundoApellido, 
       MONTH(fechaNacimiento) AS MesNacimiento, 
       DAY(fechaNacimiento) AS DiaNacimiento
FROM Instructores

ORDER BY TipoPersona, MesNacimiento, DiaNacimiento;