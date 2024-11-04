--1.-Crear un store procedureCodigoAscii que imprima los caracteres con su respectivo 
--código ascii en decimal. Solo para los caracteres cuyo código sea mayor a 32
create or alter procedure CodigoAscii
as
begin 
	declare @control int =32 

	while( @control <=255 )
	begin

   PRINT Char(@control) + ' ASCII ' + CAST(@control AS NVARCHAR(3));

    set @control = @control +1
	end
end
EXEC CodigoAscii

--2.-2. Crear el store procedure Factorial que reciba como parámetro un número entero y 
--que devuelve el factorial calculado en un parámetro de salida  

create procedure Facto
(
	@Numero int  out
)
as
begin
	DECLARE @Auxiliar int = 1
		DECLARE @Contador int= @Numero
		while @Contador > 1
				begin
						set @Auxiliar = @Auxiliar *(@Contador)
						set @Contador=@Contador-1
				 end
 SET @Numero = @Auxiliar;
end

DECLARE @Resultado INT;
SET @Resultado = 5;
EXEC Facto @Numero = @Resultado OUTPUT;
PRINT @Resultado;  

--3.-Crear las siguientes Tablas 

CREATE TABLE Saldos (
    id INT IDENTITY,
    Nombre VARCHAR(18),
    saldo DECIMAL(19, 2),
    PRIMARY KEY (id)
);
GO

go
CREATE TABLE Transacciones (
    id INT IDENTITY,
    idOrigen INT,
    idDestino INT,
    monto DECIMAL(19, 2),
    PRIMARY KEY (id),
    FOREIGN KEY (idOrigen) REFERENCES Saldos(id),
    FOREIGN KEY (idDestino) REFERENCES Saldos(id)
);
GO


 //*
 Crear un store procedure “Transacciones” que recibirá como parámetros el id de la 
cuenta de origen, el id de la cuenta destino y el monto de la transacción. Se 
deberá crear dentro de una transacción a fin de que los saldos de las cuentas 
involucradas y la tabla de transacciones quede perfectamente consistente *//

 create or alter procedure  Transacciones
 (
	@cuentaOri int out ,
	@cuentaDes int  out,
	@MontoTransferir decimal(9,2)
 )
 as
 begin			select * from Saldos

			    declare @SaldoTotalCuentaUno decimal (9,2)   ,  @SaldoTotalCuentaDos decimal (9,2) , @UsuarioOrigen int ,  @UsuarioFinal int
				select  @UsuarioOrigen=Saldos.saldo  ,  @UsuarioFinal=Transacciones.idDestino ,      @SaldoTotalCuentaUno = Saldos.id  /*revisar*/  , @SaldoTotalCuentaDos = Saldos.id /*revisar*/
				from Transacciones
				inner join Saldos on Transacciones.id=Saldos.id
				
				 set @SaldoTotalCuentaUno=(select Saldos.saldo from Saldos where id=@cuentaOri)
				if( @MontoTransferir < @SaldoTotalCuentaDos) 
					begin
							 set @SaldoTotalCuentaUno= @SaldoTotalCuentaUno- @TotalaTransferir
					end
					else
					    begin
							return null			
				     	end



 end