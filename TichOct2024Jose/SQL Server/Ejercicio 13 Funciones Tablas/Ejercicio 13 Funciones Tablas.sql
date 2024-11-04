--Hacer una función valuada en tabla que obtenga la tabla de amortización de los 
--Reembolsos quincenales que un participante tiene que realizar en 6 meses
--create or alter function Amortizacon
(
	@MontoPagar decimal(9,2)
)
returns @Amortizacion TABLE
(
	quincena SMALLINT identity,
	saldoAnterior decimal(19,2),
	pago decimal(19,2),
	SaldoNuevo decimal(19,2)
)
as
begin
               
						 DECLARE @SaldoAnterior DECIMAL(19, 2) = @MontoPagar
						 declare @quincena int =1
			             while(@quincena<=12)
					     begin
					 	 DECLARE @Pago DECIMAL(19, 2) = @MontoPagar/12;
						 
						 DECLARE @SaldoNuevo DECIMAL(19, 2) = @SaldoAnterior - @Pago;
				
					   INSERT INTO @Amortizacion (saldoAnterior, pago, saldoNuevo)
					   VALUES (@SaldoAnterior, @Pago, @SaldoNuevo);
					  set @quincena=@quincena+1
					  set @SaldoAnterior = @SaldoNuevo
				  	 end
	
return
end
go
SELECT * FROM Amortizacon(55000)

/**
Hacer una función valuada en tabla que obtenga la tabla de amortización de los 
préstamos posibles que se le pueden hacer a un instructor.  
La función recibirá como parámetro el id del instructor  
El importe del préstamo será 200 veces la cuota por hora 
El porcentaje de interés será el 24% anual cuando la cuota por hora sea superior a 
200 
Para el resto será de 18% 
El pago mensual será el equivalente a 25 horas **/


CREATE OR ALTER FUNCTION AmortizacionInstructor
(
    @idInstructor INT
)
RETURNS @TablaDeudaProfe TABLE 
(
    mes TINYINT IDENTITY,
    saldoAnterior DECIMAL(9,2),
    interes DECIMAL(9,2),
    pago DECIMAL(9,2),
    saldoNuevo DECIMAL(9,2)
)
AS
BEGIN
    DECLARE @SaldoTotal DECIMAL(9,2)
    DECLARE @Interes DECIMAL(9,2)
    DECLARE @Pago DECIMAL(9,2)
    DECLARE @SaldoAnterior DECIMAL(9,2)
    DECLARE @SaldoNuevo DECIMAL(9,2)
    DECLARE @mes TINYINT = 1
    DECLARE @CuotaHora DECIMAL(9,2)

   
    SELECT 
        @SaldoTotal = Instructores.cuotaHora * 200,
        @CuotaHora = Instructores.cuotaHora
    FROM Instructores
    WHERE Instructores.id = @idInstructor

 
    SET @SaldoAnterior = @SaldoTotal

    WHILE (@mes <= 9)
    BEGIN
      
        SET @Interes = (@SaldoAnterior * 0.18) / 12
        SET @Pago = @CuotaHora * 25

        
        SET @SaldoNuevo = (@SaldoAnterior + @Interes) - @Pago

		 IF @SaldoNuevo < 0
            SET @SaldoNuevo = 0


      
        INSERT INTO @TablaDeudaProfe (saldoAnterior, interes, pago, saldoNuevo)
        VALUES (@SaldoAnterior, @Interes, @Pago, @SaldoNuevo)

        SET @SaldoAnterior = @SaldoNuevo

       
        SET @mes = @mes + 1
    END

    RETURN 
END
GO

select*from AmortizacionInstructor(2)