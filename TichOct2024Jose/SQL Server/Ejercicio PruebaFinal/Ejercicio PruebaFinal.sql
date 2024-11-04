--------------------------------------------------------------------------------------------------------------------------------------------------
--1Realizar una vista vAlumnos que obtenga el siguiente resultado
create VIEW vAlumnos
AS
	select Alumnos.nombre , Alumnos.primerApellido ,  Alumnos.segundoApellido , Alumnos.correo  , Alumnos.telefono , Alumnos.curp ,
		   Estados.nombre as Estado , EstatusAlumnos.Nombre as Estatus
	from Estados
	inner join Alumnos on Estados.id=Alumnos.idEstadoOrigen 
	inner join EstatusAlumnos on Alumnos.idEstatus=EstatusAlumnos.id
GO
select * from vAlumnos
--------------------------------------------------------------------------------------------------------------------------------------------------
--2Realizar el procedimiento almacenado consultarEstados el cual obtendrá la  siguiente consulta, recibiendo como parámetro el id del registro 
--que se  requiere consultar de la tabla Estados. En caso de que el valor sea -1 (menos uno) deberá regresar todos los registros de dicha tabla.

create procedure consultarEstados
(
	@IdRegistro int 
)
as
begin
		if(@IdRegistro=-1)
			begin
					select * from Estados
			end
		else
			begin
					select Estados.nombre from Estados where id=@IdRegistro
			end
end	
go
Exec consultarEstados -1
----------------------------------------------------------------------------------------------------------------------------------------------------
--3.-Realizar el procedimiento almacenado consultarEstatusAlumnos el cual  obtendrá la siguiente consulta, recibiendo como parámetro 
--el id del registro que se requiere consultar de la tabla estatusAlumnos. En caso de que el valor  sea -1 (menos uno) deberá regresar
--todos los registros de dicha tabla.
create procedure consultarEstatusAlumnos
(
	@idRegistro int
)
as
begin
		if(@idRegistro>0)
			begin
				select EstatusAlumnos.Nombre  from EstatusAlumnos where id=@idRegistro
			end
		else
			begin
				select EstatusAlumnos.Nombre from EstatusAlumnos
			end
end
Execute consultarEstatusAlumnos -1

go
----------------------------------------------------------------------------------------------------------------------------------------------------
--4.-Realizar el procedimiento almacenado consultarAlumnos el cual obtendrá la siguiente consulta, recibiendo como parámetro el id del 
--registro que se requiere consultar de la tabla Alumnos. En caso de que el valor sea -1 (menos uno) deberá regresar todos los registros 
--de dicha tabla. 
create procedure consultarAlumnos
(
	@idRegistro int
)
as
begin
			if(@idRegistro>0)
				begin
					select Alumnos.nombre , Alumnos.primerApellido , Alumnos.segundoApellido , Alumnos.fechaNacimiento , Alumnos.telefono , Alumnos.curp , Estados.nombre , EstatusAlumnos.Nombre
					from Estados inner join Alumnos on Estados.id=Alumnos.idEstadoOrigen inner join EstatusAlumnos on Alumnos.idEstatus=EstatusAlumnos.id
					where Alumnos.id=@idRegistro
				end
			else
				begin
				select Alumnos.nombre , Alumnos.primerApellido , Alumnos.segundoApellido , Alumnos.fechaNacimiento , Alumnos.telefono , Alumnos.curp , Estados.nombre , EstatusAlumnos.Nombre
				from Estados inner join Alumnos on Estados.id=Alumnos.idEstadoOrigen inner join EstatusAlumnos on Alumnos.idEstatus=EstatusAlumnos.id		
			    end
end
execute consultarAlumnos -1
select* from Alumnos
go
----------------------------------------------------------------------------------------------------------------------------------------------------
--5.-Realizar el procedimiento almacenado consultarEAlumnos el cual obtendrá la siguiente consulta, recibiendo como parámetro el id 
--del registro que se requiere consultar de la tabla Alumnos. En caso de que el valor sea -1 (menos  uno) deberá regresar todos los 
--registros de dicha tabla.  
alter procedure consultarEAlumnos
(
	@idRegistro int
)
as
begin
			if(@idRegistro>0)
				begin
					select Alumnos.nombre , Alumnos.primerApellido , Alumnos.segundoApellido ,  Alumnos.fechaNacimiento ,Alumnos.correo, Alumnos.telefono , Alumnos.curp, Estados.id , EstatusAlumnos.id
					from Estados inner join Alumnos on Estados.id=Alumnos.idEstadoOrigen inner join EstatusAlumnos on Alumnos.idEstatus=EstatusAlumnos.id
					where Alumnos.id=@idRegistro
				end
			else
				begin
				select Alumnos.nombre , Alumnos.primerApellido , Alumnos.segundoApellido ,  Alumnos.fechaNacimiento ,Alumnos.correo, Alumnos.telefono , Alumnos.curp, Estados.id , EstatusAlumnos.id
				from Estados inner join Alumnos on Estados.id=Alumnos.idEstadoOrigen inner join EstatusAlumnos on Alumnos.idEstatus=EstatusAlumnos.id
				end	
end
execute consultarEAlumnos 3
go
--6.-Realizar el procedimiento almacenado actualizarEstatusAlumnos el cual  recibirá como parámetros el id del Alumno al cual se le 
--requiere cambiar el estatus y el valor del nuevo estatus. 
ALTER procedure actualizarEstatusAlumnos
(
	
	@idEstatus int,
	@Estatus int,
	@idAlum int
)
as
begin
		select * from Alumnos
		update Alumnos set idEstadoOrigen=@idEstatus ,  idEstatus=@Estatus where id=@idAlum		
end
execute actualizarEstatusAlumnos 3,3,3
go
--7.-Realizar el procedimiento almacenado agregarAlumnos el cual recibirá como  parámetros los valores de cada una de las columnas de la 
--tabla de Alumnos con los cuales se insertará el registro a la tabla Alumnos. El procedimiento deberá regresar el id con el que se 
--creo el registro en formato de entero.       arreglar
alter procedure AgregarAlumnos
(
	
	@nombre varchar(18),
	@Apellido varchar(18),
	@SegApellido varchar(18),
	@correo nchar(10),
	@telefono varchar(18),
	@fechaNaci date,
	@curp varchar(18),
	@idEstado int,
	@Estatus int,
	@sueldoMensual decimal(19,2)
)
as
begin
		insert into Alumnos (nombre,primerApellido,segundoApellido,correo,telefono,fechaNacimiento,curp,idEstadoOrigen,idEstatus,sueldoMensual)
		values (@nombre,@Apellido,@SegApellido,@correo,@telefono,@fechaNaci,@curp,@idEstado,@Estatus,@sueldoMensual) 

		select * from Alumnos where curp=@curp
	
end
execute AgregarAlumnos 'pruebaN' ,'apellidoPruebaN','SegundoApellidoPruebaN' , 'CorreoPruebaN' , 'telrueba' , '1994-12-12' ,'oatata' , 2 ,2 , 9999 
go
--8Realizar el procedimiento almacenado actualizarAlumnos el cual recibirá  como parámetros los valores de cada una de las columnas de
--la tabla de  Alumnos con los cuales se actualizarán los valores que existen en la tabla  Alumnos del registro que corresponda
--al id enviado como parámetro. El procedimiento deberá regresar la cantidad de registros actualizados.       arrelar
alter procedure actualizarAlumnos
(
	@idAlumno int,
	@nombre varchar(18),
	@Apellido varchar(18),
	@SegApellido varchar(18),
	@correo nchar(10),
	@telefono varchar(18),
	@fechaNaci date,
	@curp varchar(18),
	@idEstado int,
	@Estatus int,
	@sueldoMensual decimal(19,2)

)
as
begin
		update Alumnos 
		set nombre=@nombre,primerApellido=@Apellido,segundoApellido=@SegApellido,correo=@correo,telefono=@telefono,fechaNacimiento=@fechaNaci,curp=@curp,idEstadoOrigen=@idEstado,idEstatus=@Estatus,sueldoMensual=@sueldoMensual
		where id=@idAlumno 
		 
		SELECT COUNT(Alumnos.id)AS[ALUMNOS EN TOTAL]  FROM Alumnos 
		select top 5 sueldoMensual from Alumnos
		set rowcount 5 select sueldoMensual from Alumnos
		select * from Alumnos
		
end
execute actualizarAlumnos 3, 'prueba4' ,'apellidoPrueba4','SegundoApellidoPrueba4' , 'CorreoPrueba4' , 'telepba4' , '1994-12-12' ,'curpPrueba4' , 4 ,4 , 9999 
go
--9. -Realizar el procedimiento almacenado eliminarAlumnos el cual recibirá como  parámetros el valor del id del registro del alumno del
--que se requiere eliminar.....
alter procedure eliminarAlumnos
(
	@IdEliminar int
)
as
  begin
       begin try	
	        begin transaction;
				DELETE FROM CursosAlumnos where idAlumno=@IdEliminar
				DELETE FROM Alumnos where id=@IdEliminar
				print 'Registro eliminao correctamente'
			commit transaction
		end try
		begin catch
			rollback transaction
			print 'Error en la eliminacion' + ERROR_MESSAGE()

		end catch
	end

exec eliminarAlumnos 1
go
--10. Crear el trigger Trigger_EliminarAlumnos el cual se debe ejecutar cuando se  elimina un registro de la tabla de Alumnos. 
--Este trigger deberá insertar un  registro en la Tabla AlumnosBaja del alumno eliminado. 

create trigger TriggerEliminacion
on Alumnos
after DELETE
as
	begin
		declare @IdAfectado int , @NombreAfectado varchar(20) , @PrimerApellido varchar(20), @SegundoApellido varchar(20) , @FechaBaja date
		select @IdAfectado = d.id , @NombreAfectado = d.nombre ,@PrimerApellido =d.primerApellido , @SegundoApellido =d.segundoApellido , @FechaBaja = GETDATE()
		from deleted d
	insert into AlumnosBaja(id,nombre,primerApellido ,segundoApellido ,fechaBaja)
	values (@IdAfectado , @NombreAfectado ,@PrimerApellido , @SegundoApellido ,@FechaBaja)
	end

	select * from Alumnos
	DELETE FROM alumnos WHERE id =1004;
	select * from AlumnosBaja
	
	go

--11. Obtener un respaldo de su base de datos InstitutoTich 
use InstitutoTich
go
BACKUP DATABASE InstitutoTich 
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\PruebaBackUp'
WITH FORMAT, 
MEDIANAME = 'SQLServerBackups', 
NAME = 'Respaldo completo de InstitutoTich';
go

--12.- Crear una base de datos PruebasTich con el respaldo de la base de datos  InstitutoTich. 
create database PruebasTich