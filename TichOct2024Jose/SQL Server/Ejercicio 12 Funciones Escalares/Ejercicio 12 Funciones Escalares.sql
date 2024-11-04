--1.-Crear una función Suma que reciba dos números enteros y regrese la suma de ambos números 
Create  FUNCTION Suma
(
@Num1 int,
@Num2 int
)
RETURNS int
AS
BEGIN
 RETURN @num1+@num2
END
Print dbo.Suma(5,5)

--2Crear la función GetGenero la cual reciba como parámetros el curp y regrese el género al que pertenece 
Alter FUNCTION GetGenero
(
    @curp CHAR(18)
	
)
RETURNS CHAR(20)
AS
BEGIN
   
	 RETURN	iif(SUBSTRING(@curp,11,1) = 'H' , 'HOMBRE', iif(SUBSTRING(@curp,11,1)= 'M' , 'MUJER' , 'ERROR'))
END

print dbo.GetGenero('MADA971212MVZRMN04')
select * from Alumnos
--3 Crear la función GetFechaNacimiento la cual reciba como parámetros el curp y  regrese la fecha de nacimiento. La fecha de nacimiento deberá completarse a 4 
--dígitos, debiéndose determinar si es año dos mil o año mil novecientos 
GO
ALTER function GetFechaNacimiento
(
	@curp varchar(20)
)
returns date
as
 begin 
 DECLARE @CurpNac varchar(6)
 	 SET @CurpNac  = (SUBSTRING(@curp,5,6))
	 --  DECLARE @CurpNac varchar(6) = (SUBSTRING(@curp,5,6)) OTRA OPCION
	 return  CONVERT(DATE,@CurpNac)
end
print dbo.GetFechaNacimiento('MARA940927HGRRYM04')

Print dbo.GetGenero('MADA971212HVZRMN04')
--4.-Crear la función GetidEstado la cual reciba como parámetros el curp y regrese el Id Estado con base en la siguiente tabla 
alter function GetidEstado(
	@curp varchar(18)
)

returns int
as
begin 

   DECLARE @prefijo char(2);
	SET @prefijo= SUBSTRING(@curp,12,2)
	DECLARE @prefijo2 int
	SET @prefijo2= 

	case @prefijo
	when 'AS' then 1
	when 'BC' then 2
	when 'BS' then 3
	when 'CC' then 4
	when 'CH' then 5
	when 'CS' then 6
	when 'CL' then 7
	when 'CM' then 8
	when 'DG' then 9
	when 'GT' then 10
	when 'GR' then 11
	when 'HG' then 12
	when 'JC' then 13
	when 'MC' then 14
	when 'MN' then 15
	when 'NT' then 16
	when 'NL' then 17
	when 'OC' then 18
	when 'AS' then 19
	when 'PL' then 20
	when 'QT' then 21
	when 'QR' then 22
	when 'SP' then 23
	when 'SL' then 24
	when 'SR' then 25
	when 'TC' then 26
	ELSE NULL
	END

	return @prefijo2

end

print dbo.GetidEstado('MADA971212HTCRMN04')

/*5.-Realizar una función llamada Calculadora que reciba como parámetros dos 
enteros y un operador (+,-,*,/,%) regresando el resultado de la operación se 
deberá cuidar de no hacer división entre cero*/ 
ALTER FUNCTION Calculadora
(
    @A INT,
	@B INT ,
	@caracter char(1)
	
)
RETURNS int
AS
BEGIN
   DECLARE @Resultado INT;
	SET @Resultado= 
    CASE @caracter
	WHEN '*' THEN   @A * @B  
    WHEN '+' THEN   @A + @B  
	WHEN '/' THEN  CASE WHEN @B = 0 THEN NULL ELSE @A / @B  END 
    WHEN '-' THEN   @A - @B  

	ELSE NULL
		END 
	     RETURN @Resultado
 			END 

Print dbo.Calculadora(5,0,'/')

--6.-Realizar una función llamada GetHonorarios que calcule el importe a pagar a un determinado instructor y curso, por lo que la función recibirá como parámetro el id 
--del instructor y el id del curso. 

CREATE FUNCTION GerHonorarios
(	
	@idInstuctor int,
	@idCurso int
)
returns decimal(9,2)
as
begin  		
		DECLARE @CuotaHora decimal(9,2)=cast((Select intstruc.cuotaHora from Instructores intstruc where intstruc.id=@idInstuctor)as decimal(19,2))
		DECLARE @HorasTotales decimal(9,2)=(Select catCur.horas from CatCursos catCur where catCur.id=@idCurso) 
        return @CuotaHora*@HorasTotales
end
Print dbo.GerHonorarios(1,1)


--7.-Crear la función GetEdad la cual reciba como parámetros la fecha de nacimiento y la fecha a la que se requiere realizar el cálculo de la edad. Los años deberán ser 
--cumplidos, considerando mes y día
create function GetEdad
(
	@FechaNacimiento date,
	@FechaEstablecida date
)
returns int
as
begin
     return DATEDIFF(YEAR,@FechaNacimiento,@FechaEstablecida ) 
end
print dbo.GetEdad('1994-09-27','2024-09-21') --MESES CORREGIR

--8.-Crear la función Factorial la cual reciba como parámetros un número entero y  regrese como resultado el factorial. 
alter function factorial
(
		@Numero int
)
returns int
as
begin
		DECLARE @Auxiliar int = @Numero
		DECLARE @Contador int= @Numero
		while @Contador > 1
				begin
						set @Auxiliar = @Auxiliar *(@Contador-1)
						set @Contador=@Contador-1
				 end
return @Auxiliar
end
print dbo.factorial(4)

/*9. Crear la función ReembolsoQuincenal la cual reciba como parámetros un 
SueldoMensual y regrese como resultado el Importe de Reembolso quincenal, 
considerando que el importe total a reembolsar es igual a dos meses y medio de 
sueldo, y el periodo de reembolso es de 6 meses */

ALTER function ReembolsoQuincenal
(
	@SueldoMensual decimal(9,2)
)
returns  decimal
as
begin
			declare @total decimal(9,2) = (@SueldoMensual / 6) /2

return @total
end

print dbo.ReembolsoQuincenal(30000.00)
--10

ALTER FUNCTION CalculaImpuestos
(	
	@idInstuctor int,
	@idCurso int
)
returns decimal(9,2)
as
begin  		
		DECLARE @CuotaHora decimal(9,2)=cast((Select intstruc.cuotaHora from Instructores intstruc where intstruc.id=@idInstuctor)as decimal(19,2))
		DECLARE @HorasTotales decimal(9,2)=(Select catCur.horas from CatCursos catCur where catCur.id=@idCurso) 
        DECLARE @TotaPagar decimal(9,2)= @CuotaHora*@HorasTotales
		DECLARE @CurpProfe varchar(20) = (Select intstruc.curp from Instructores intstruc WHERE intstruc.id=@idInstuctor)
		DECLARE @EstadoOrigen varchar(10)=SUBSTRING(@CurpProfe,12,2)
		

	
		return 
		case @EstadoOrigen
		when 'CS' then   @TotaPagar*.05
		when 'SR' then  @TotaPagar*.10
		when 'VZ' then @TotaPagar*.07
		ELSE @TotaPagar*.08
		END
		
end
Print dbo.CalculaImpuestos(1,3)

SELECT *
FROM Instructores
INNER JOIN CursosInstructores ON Instructores.id=CursosInstructores.idInstructor
INNER JOIN Cursos ON CursosInstructores.idCurso=Cursos.id
INNER JOIN CatCursos ON Cursos.id_CatCurso=CatCursos.id
where Instructores.id=1 and Cursos.id=3


--11.- Haciendo uso de la función GetEdad, obtener una relación de alumnos con la edad a la fecha de inscripción, y la edad actual. De aquellos alumnos que actualmente 
--tengan más de 25 años. 

print dbo.GetEdad('1997-12-12','2024-10-24')

select Alumnos.nombre, dbo.GetEdad(Alumnos.fechaNacimiento ,CursosAlumnos.fechaInscripcion )as [Fecha mayor 25]
from Alumnos
INNER JOIN CursosAlumnos on Alumnos.id=CursosAlumnos.idAlumno
where dbo.GetEdad(Alumnos.fechaNacimiento ,CursosAlumnos.fechaInscripcion) > 25

--12Realizar una función que determine el porcentaje a descontar en los reembolsos,  con base a la cantidad de meses en que se realizará el reembolso y 
--el sueldo  mensual logrado, de acuerdo al siguiente procedimiento.


create function Porcentaje
(
	
)

--13Hacer una función que convierta a mayúsculas la primera letra de cada palabra de  una cadena de caracteres recibida. 

alter function Convertir
(
	@CadenaNoOrdenada varchar(40)
)
returns varchar(40)
as
Begin
		declare @axu char(10),
		 @CadnaVacia varchar(40) = '',
		 @PosicionCadena tinyint =1,
		 @TamañoCadena tinyint = (len(@CadenaNoOrdenada)),
         @cadenaSemiOrdenada varchar(40) set @cadenaSemiOrdenada = STUFF(LOWER(@CadenaNoOrdenada),1,1,UPPER(LEFT(@CadenaNoOrdenada,1)))

		  
		         while  (@PosicionCadena <= @TamañoCadena )

				     begin 
					 
						     if (SUBSTRING(@cadenaSemiOrdenada,@PosicionCadena,1) != ' ' )
						          begin
								    
								  	set @CadnaVacia = @CadnaVacia + SUBSTRING(@cadenaSemiOrdenada,@PosicionCadena,1)
									 set  @PosicionCadena= @PosicionCadena+1

							      end

							 else
							      begin
								        set @CadnaVacia = @CadnaVacia + SUBSTRING(@cadenaSemiOrdenada,@PosicionCadena,1)
										set @PosicionCadena= @PosicionCadena+1
										set @CadnaVacia =  @CadnaVacia +upper(SUBSTRING(@cadenaSemiOrdenada,@PosicionCadena,1))
										set @PosicionCadena= @PosicionCadena+1
								  end

				        end

		
return  @CadnaVacia
end

print dbo.Convertir('d como estas')