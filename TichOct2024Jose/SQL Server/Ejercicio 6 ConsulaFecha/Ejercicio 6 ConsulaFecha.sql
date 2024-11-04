
--Realizar la siguiente consulta de Alumnos, con edad actual y edad en 5 Meses
select  [id] ,[nombre] ,[primerApellido],[segundoApellido],[fechaNacimiento], GETDATE() as Hoy, DATEDIFF(YEAR,fechaNacimiento, GETDATE()) as Edad, 
   DATEDIFF(YEAR,fechaNacimiento,  DATEADD(month, 5, GETDATE())) AS Edad5Meses
from Alumnos
