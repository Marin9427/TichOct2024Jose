--Insertar datos en la tabla Instructor , tabla isr, estados , alumnos , EstatusAumno
USE [InstitutoTich]
GO
SET IDENTITY_INSERT [dbo].[Instructores] ON 

INSERT [dbo].[Instructores] ([id], [nombre], [primerApellido], [segundoApellido], [correo], [telefono], [fechaNacimiento], [rfc], [curp], [cuotaHora], [activo]) VALUES (1, N'Oscar', N'López', N'Osorio', N'olopez@ti-capitalhumano.com', N'7226181450', CAST(N'1984-08-03' AS Date), N'LOOO840803S08', N'LOOO840803HMCPSS08', CAST(110.00 AS Decimal(9, 2)), 1)
INSERT [dbo].[Instructores] ([id], [nombre], [primerApellido], [segundoApellido], [correo], [telefono], [fechaNacimiento], [rfc], [curp], [cuotaHora], [activo]) VALUES (2, N'Jorge', N'Valdivia', N'Rosas', N'jvaldivia@ti-capitalhumano.com', N'5561040510', CAST(N'1964-01-26' AS Date), N'VARJ640126R00', N'VARJ640126HDFLSR00', CAST(100.00 AS Decimal(9, 2)), 1)
INSERT [dbo].[Instructores] ([id], [nombre], [primerApellido], [segundoApellido], [correo], [telefono], [fechaNacimiento], [rfc], [curp], [cuotaHora], [activo]) VALUES (3, N'Luis', N'Vázquez', N'Cuj', N'luisvazquez@ti-capitalhumano.com', N'5540612941', CAST(N'1974-10-11' AS Date), N'VACL741011JS5', N'VACL741011HTCZJS05', CAST(80.00 AS Decimal(9, 2)), 1)
INSERT [dbo].[Instructores] ([id], [nombre], [primerApellido], [segundoApellido], [correo], [telefono], [fechaNacimiento], [rfc], [curp], [cuotaHora], [activo]) VALUES (4, N'José', N'Morales', N'Narváez', N'jose.morales@ti-capitalhumano.com', N'5511506288', CAST(N'1984-12-31' AS Date), N'MONM941231N07', N'MONM941231HCCRRN07', CAST(70.00 AS Decimal(9, 2)), 1)
SET IDENTITY_INSERT [dbo].[Instructores] OFF
GO
SET IDENTITY_INSERT [dbo].[TablaISR] ON 

INSERT [dbo].[TablaISR] ([id], [LimInf], [LimSup], [CuotaFija], [ExedLimInf], [Subsidio]) VALUES (1, CAST(0.01 AS Decimal(19, 2)), CAST(285.45 AS Decimal(19, 2)), CAST(0.00 AS Decimal(19, 2)), CAST(1.92 AS Decimal(19, 2)), CAST(200.85 AS Decimal(19, 2)))
INSERT [dbo].[TablaISR] ([id], [LimInf], [LimSup], [CuotaFija], [ExedLimInf], [Subsidio]) VALUES (2, CAST(285.46 AS Decimal(19, 2)), CAST(872.85 AS Decimal(19, 2)), CAST(5.55 AS Decimal(19, 2)), CAST(6.40 AS Decimal(19, 2)), CAST(200.85 AS Decimal(19, 2)))
INSERT [dbo].[TablaISR] ([id], [LimInf], [LimSup], [CuotaFija], [ExedLimInf], [Subsidio]) VALUES (3, CAST(872.86 AS Decimal(19, 2)), CAST(1309.20 AS Decimal(19, 2)), CAST(5.55 AS Decimal(19, 2)), CAST(6.40 AS Decimal(19, 2)), CAST(200.70 AS Decimal(19, 2)))
INSERT [dbo].[TablaISR] ([id], [LimInf], [LimSup], [CuotaFija], [ExedLimInf], [Subsidio]) VALUES (4, CAST(1309.21 AS Decimal(19, 2)), CAST(1713.60 AS Decimal(19, 2)), CAST(5.55 AS Decimal(19, 2)), CAST(6.40 AS Decimal(19, 2)), CAST(200.70 AS Decimal(19, 2)))
INSERT [dbo].[TablaISR] ([id], [LimInf], [LimSup], [CuotaFija], [ExedLimInf], [Subsidio]) VALUES (5, CAST(1713.61 AS Decimal(19, 2)), CAST(1745.70 AS Decimal(19, 2)), CAST(5.55 AS Decimal(19, 2)), CAST(6.40 AS Decimal(19, 2)), CAST(193.80 AS Decimal(19, 2)))
INSERT [dbo].[TablaISR] ([id], [LimInf], [LimSup], [CuotaFija], [ExedLimInf], [Subsidio]) VALUES (6, CAST(1745.71 AS Decimal(19, 2)), CAST(2193.75 AS Decimal(19, 2)), CAST(5.55 AS Decimal(19, 2)), CAST(6.40 AS Decimal(19, 2)), CAST(188.70 AS Decimal(19, 2)))
INSERT [dbo].[TablaISR] ([id], [LimInf], [LimSup], [CuotaFija], [ExedLimInf], [Subsidio]) VALUES (7, CAST(2193.76 AS Decimal(19, 2)), CAST(2327.55 AS Decimal(19, 2)), CAST(5.55 AS Decimal(19, 2)), CAST(6.40 AS Decimal(19, 2)), CAST(174.75 AS Decimal(19, 2)))
INSERT [dbo].[TablaISR] ([id], [LimInf], [LimSup], [CuotaFija], [ExedLimInf], [Subsidio]) VALUES (8, CAST(2327.56 AS Decimal(19, 2)), CAST(2422.80 AS Decimal(19, 2)), CAST(5.55 AS Decimal(19, 2)), CAST(6.40 AS Decimal(19, 2)), CAST(160.35 AS Decimal(19, 2)))
INSERT [dbo].[TablaISR] ([id], [LimInf], [LimSup], [CuotaFija], [ExedLimInf], [Subsidio]) VALUES (9, CAST(2422.81 AS Decimal(19, 2)), CAST(2632.65 AS Decimal(19, 2)), CAST(142.20 AS Decimal(19, 2)), CAST(10.88 AS Decimal(19, 2)), CAST(160.35 AS Decimal(19, 2)))
INSERT [dbo].[TablaISR] ([id], [LimInf], [LimSup], [CuotaFija], [ExedLimInf], [Subsidio]) VALUES (10, CAST(2632.66 AS Decimal(19, 2)), CAST(3071.40 AS Decimal(19, 2)), CAST(142.20 AS Decimal(19, 2)), CAST(10.88 AS Decimal(19, 2)), CAST(145.35 AS Decimal(19, 2)))
INSERT [dbo].[TablaISR] ([id], [LimInf], [LimSup], [CuotaFija], [ExedLimInf], [Subsidio]) VALUES (11, CAST(3071.41 AS Decimal(19, 2)), CAST(3510.15 AS Decimal(19, 2)), CAST(142.20 AS Decimal(19, 2)), CAST(10.88 AS Decimal(19, 2)), CAST(125.10 AS Decimal(19, 2)))
INSERT [dbo].[TablaISR] ([id], [LimInf], [LimSup], [CuotaFija], [ExedLimInf], [Subsidio]) VALUES (12, CAST(3510.16 AS Decimal(19, 2)), CAST(3642.60 AS Decimal(19, 2)), CAST(142.20 AS Decimal(19, 2)), CAST(10.88 AS Decimal(19, 2)), CAST(107.40 AS Decimal(19, 2)))
INSERT [dbo].[TablaISR] ([id], [LimInf], [LimSup], [CuotaFija], [ExedLimInf], [Subsidio]) VALUES (13, CAST(3642.61 AS Decimal(19, 2)), CAST(4257.90 AS Decimal(19, 2)), CAST(142.20 AS Decimal(19, 2)), CAST(10.88 AS Decimal(19, 2)), CAST(0.00 AS Decimal(19, 2)))
INSERT [dbo].[TablaISR] ([id], [LimInf], [LimSup], [CuotaFija], [ExedLimInf], [Subsidio]) VALUES (14, CAST(4257.91 AS Decimal(19, 2)), CAST(4949.55 AS Decimal(19, 2)), CAST(341.85 AS Decimal(19, 2)), CAST(16.00 AS Decimal(19, 2)), CAST(0.00 AS Decimal(19, 2)))
INSERT [dbo].[TablaISR] ([id], [LimInf], [LimSup], [CuotaFija], [ExedLimInf], [Subsidio]) VALUES (15, CAST(4949.56 AS Decimal(19, 2)), CAST(5925.90 AS Decimal(19, 2)), CAST(452.55 AS Decimal(19, 2)), CAST(17.92 AS Decimal(19, 2)), CAST(0.00 AS Decimal(19, 2)))
INSERT [dbo].[TablaISR] ([id], [LimInf], [LimSup], [CuotaFija], [ExedLimInf], [Subsidio]) VALUES (16, CAST(5925.91 AS Decimal(19, 2)), CAST(11951.85 AS Decimal(19, 2)), CAST(627.60 AS Decimal(19, 2)), CAST(21.36 AS Decimal(19, 2)), CAST(0.00 AS Decimal(19, 2)))
INSERT [dbo].[TablaISR] ([id], [LimInf], [LimSup], [CuotaFija], [ExedLimInf], [Subsidio]) VALUES (17, CAST(11951.86 AS Decimal(19, 2)), CAST(18837.75 AS Decimal(19, 2)), CAST(1914.75 AS Decimal(19, 2)), CAST(23.52 AS Decimal(19, 2)), CAST(0.00 AS Decimal(19, 2)))
INSERT [dbo].[TablaISR] ([id], [LimInf], [LimSup], [CuotaFija], [ExedLimInf], [Subsidio]) VALUES (18, CAST(18837.76 AS Decimal(19, 2)), CAST(35964.30 AS Decimal(19, 2)), CAST(3534.30 AS Decimal(19, 2)), CAST(30.00 AS Decimal(19, 2)), CAST(0.00 AS Decimal(19, 2)))
INSERT [dbo].[TablaISR] ([id], [LimInf], [LimSup], [CuotaFija], [ExedLimInf], [Subsidio]) VALUES (19, CAST(35964.31 AS Decimal(19, 2)), CAST(47952.30 AS Decimal(19, 2)), CAST(8672.25 AS Decimal(19, 2)), CAST(32.00 AS Decimal(19, 2)), CAST(0.00 AS Decimal(19, 2)))
INSERT [dbo].[TablaISR] ([id], [LimInf], [LimSup], [CuotaFija], [ExedLimInf], [Subsidio]) VALUES (20, CAST(47952.31 AS Decimal(19, 2)), CAST(143856.90 AS Decimal(19, 2)), CAST(12508.35 AS Decimal(19, 2)), CAST(34.00 AS Decimal(19, 2)), CAST(0.00 AS Decimal(19, 2)))
INSERT [dbo].[TablaISR] ([id], [LimInf], [LimSup], [CuotaFija], [ExedLimInf], [Subsidio]) VALUES (21, CAST(143856.91 AS Decimal(19, 2)), CAST(99999999.00 AS Decimal(19, 2)), CAST(45115.95 AS Decimal(19, 2)), CAST(35.00 AS Decimal(19, 2)), CAST(0.00 AS Decimal(19, 2)))
SET IDENTITY_INSERT [dbo].[TablaISR] OFF
GO

USE [InstitutoTich]
GO
SET IDENTITY_INSERT [dbo].[Alumnos] ON 

INSERT [dbo].[Alumnos] ([id], [nombre], [primerApellido], [segundoApellido], [correo], [telefono], [fechaNacimiento], [curp], [sueldoMensual], [idEstadoOrigen], [idEstatus]) VALUES (1, N'Marcelo Isai a', N'García', N'Mirón', N'marcelo@outlook.com', N'9911362600', CAST(N'1997-12-12' AS Date), N'MADA971212HVZRMN04', CAST(22000.00 AS Decimal(9, 2)), 29, 6)
INSERT [dbo].[Alumnos] ([id], [nombre], [primerApellido], [segundoApellido], [correo], [telefono], [fechaNacimiento], [curp], [sueldoMensual], [idEstadoOrigen], [idEstatus]) VALUES (2, N'Oliver Alexis', N'Martínez', N'Estudillo', N'alexis@gmail.com', N'8897877417', CAST(N'1996-04-18' AS Date), N'DIAE960418HOCSVL07', CAST(20000.00 AS Decimal(9, 2)), 19, 6)
INSERT [dbo].[Alumnos] ([id], [nombre], [primerApellido], [segundoApellido], [correo], [telefono], [fechaNacimiento], [curp], [sueldoMensual], [idEstadoOrigen], [idEstatus]) VALUES (3, N'Oscar', N'Mendoza', N'García', N'omscar@outlook.es', N'7711589568', CAST(N'1994-04-07' AS Date), N'RUVJ940407HOCSSN03', NULL, 29, 4)
INSERT [dbo].[Alumnos] ([id], [nombre], [primerApellido], [segundoApellido], [correo], [telefono], [fechaNacimiento], [curp], [sueldoMensual], [idEstadoOrigen], [idEstatus]) VALUES (4, N'Edgar', N'Martínez', N'Espinoza', N'edgargmail.com', N'5528356144', CAST(N'1996-05-23' AS Date), N'DOML960323HMNMTS00', CAST(25000.00 AS Decimal(9, 2)), 12, 5)
INSERT [dbo].[Alumnos] ([id], [nombre], [primerApellido], [segundoApellido], [correo], [telefono], [fechaNacimiento], [curp], [sueldoMensual], [idEstadoOrigen], [idEstatus]) VALUES (5, N'Rodrigo', N'Tolentino', N'Martínez', N'rodrigo@gmail.com', N'4421436224', CAST(N'1998-03-13' AS Date), N'TOMR980313HHGLRD06', NULL, 13, 5)
INSERT [dbo].[Alumnos] ([id], [nombre], [primerApellido], [segundoApellido], [correo], [telefono], [fechaNacimiento], [curp], [sueldoMensual], [idEstadoOrigen], [idEstatus]) VALUES (6, N'Jesiel', N'García', N'Pérez', N'jesiel@gmail.com', N'3317901341', CAST(N'1990-11-08' AS Date), N'GAPJ901108HHGRRS00', NULL, 13, 5)
INSERT [dbo].[Alumnos] ([id], [nombre], [primerApellido], [segundoApellido], [correo], [telefono], [fechaNacimiento], [curp], [sueldoMensual], [idEstadoOrigen], [idEstatus]) VALUES (7, N'Christian Josue ', N'Gonzalez', N'Lozano', N'christian@gmail.com', N'4922153353', CAST(N'1996-06-19' AS Date), N'GOLC960619HZSNZH08', NULL, 32, 4)
INSERT [dbo].[Alumnos] ([id], [nombre], [primerApellido], [segundoApellido], [correo], [telefono], [fechaNacimiento], [curp], [sueldoMensual], [idEstadoOrigen], [idEstatus]) VALUES (8, N'Luis Enrique', N'Lopez ', N'Cruz', N'luis@gmail.com', N'2235700644', CAST(N'1997-07-15' AS Date), N'LOCL970715HGTPRS04', NULL, 16, 5)
INSERT [dbo].[Alumnos] ([id], [nombre], [primerApellido], [segundoApellido], [correo], [telefono], [fechaNacimiento], [curp], [sueldoMensual], [idEstadoOrigen], [idEstatus]) VALUES (9, N'Rolando', N'Marquez', N'Hernandez', N'rolando@gmail.com', N'1168329969', CAST(N'1997-03-08' AS Date), N'MAHR97030815HRL600', NULL, 15, 4)
INSERT [dbo].[Alumnos] ([id], [nombre], [primerApellido], [segundoApellido], [correo], [telefono], [fechaNacimiento], [curp], [sueldoMensual], [idEstadoOrigen], [idEstatus]) VALUES (10, N'Jesús Yotecatl', N'Miranda', N'Espinosa', N'jesus@gmail.com', N'2213335247', CAST(N'1997-06-14' AS Date), N'MIEJ970614HMCRSS05', NULL, 15, 4)
INSERT [dbo].[Alumnos] ([id], [nombre], [primerApellido], [segundoApellido], [correo], [telefono], [fechaNacimiento], [curp], [sueldoMensual], [idEstadoOrigen], [idEstatus]) VALUES (11, N'Cecilia', N'Cruz', N'Luna', N'cecilia@outlook.com', N'3317052376', CAST(N'1997-08-08' AS Date), N'CULC970808MPLRNC02', CAST(22000.00 AS Decimal(9, 2)), 21, 4)
INSERT [dbo].[Alumnos] ([id], [nombre], [primerApellido], [segundoApellido], [correo], [telefono], [fechaNacimiento], [curp], [sueldoMensual], [idEstadoOrigen], [idEstatus]) VALUES (12, N'Baldomero', N'Gómez', N'García', N'baldomero@gmail.com', N'4419055010', CAST(N'2000-11-08' AS Date), N'GOGB001108HPLMRLA2', CAST(23000.00 AS Decimal(9, 2)), 21, 4)
INSERT [dbo].[Alumnos] ([id], [nombre], [primerApellido], [segundoApellido], [correo], [telefono], [fechaNacimiento], [curp], [sueldoMensual], [idEstadoOrigen], [idEstatus]) VALUES (13, N'Rubén', N'Rojas', N'Mantilla', N'ruben@outlook.com', N'5594228277', CAST(N'1997-01-17' AS Date), N'ROMR910117HVZJNB00', CAST(21000.00 AS Decimal(9, 2)), 30, 4)
INSERT [dbo].[Alumnos] ([id], [nombre], [primerApellido], [segundoApellido], [correo], [telefono], [fechaNacimiento], [curp], [sueldoMensual], [idEstadoOrigen], [idEstatus]) VALUES (14, N'Ana Patricia', N'Apatiga ', N'Olguín', N'patricia@gmail.com', N'6614913002', CAST(N'1998-06-23' AS Date), N'AAOA980623MHGPLN03', CAST(22000.00 AS Decimal(9, 2)), 13, 3)
INSERT [dbo].[Alumnos] ([id], [nombre], [primerApellido], [segundoApellido], [correo], [telefono], [fechaNacimiento], [curp], [sueldoMensual], [idEstadoOrigen], [idEstatus]) VALUES (15, N'Bryan Adiel ', N'Arroyo ', N'Tavera', N'brayan@gmail.com', N'7719034047', CAST(N'1998-04-02' AS Date), N'AOTB980402HHGRVR05', CAST(20000.00 AS Decimal(9, 2)), 13, 3)
INSERT [dbo].[Alumnos] ([id], [nombre], [primerApellido], [segundoApellido], [correo], [telefono], [fechaNacimiento], [curp], [sueldoMensual], [idEstadoOrigen], [idEstatus]) VALUES (16, N'Carlos Arath', N'Serrano', N'Berna', N'carlos@gmail.com', N'8878893014', CAST(N'2000-03-05' AS Date), N'SEBC000305HQTRRRA5', CAST(250000.00 AS Decimal(9, 2)), 22, 3)
INSERT [dbo].[Alumnos] ([id], [nombre], [primerApellido], [segundoApellido], [correo], [telefono], [fechaNacimiento], [curp], [sueldoMensual], [idEstadoOrigen], [idEstatus]) VALUES (17, N'Edith', N'Rasgado', N'Sarabia', N'edith@gmail.com', N'9911777500', CAST(N'1994-04-29' AS Date), N'RASE940429MOCSRD00', CAST(20000.00 AS Decimal(9, 2)), 20, 3)
INSERT [dbo].[Alumnos] ([id], [nombre], [primerApellido], [segundoApellido], [correo], [telefono], [fechaNacimiento], [curp], [sueldoMensual], [idEstadoOrigen], [idEstatus]) VALUES (18, N'Víctor', N'Marín', N'Pérez', N'victor@gmail.com', N'2215066253', CAST(N'1998-06-04' AS Date), N'MAPV980604HDFRRC01', CAST(21000.00 AS Decimal(9, 2)), 15, 3)
SET IDENTITY_INSERT [dbo].[Alumnos] OFF
GO
USE InstitutoTich
SET IDENTITY_INSERT [dbo].[EstatusAlumnos] ON 
INSERT [dbo].[EstatusAlumnos] ([id], [Clave], [Nombre]) VALUES (1, N'PTO       ', N'Prospecto')
INSERT [dbo].[EstatusAlumnos] ([id], [Clave], [Nombre]) VALUES (2, N'PRO       ', N'En curso propedéutico')
INSERT [dbo].[EstatusAlumnos] ([id], [Clave], [Nombre]) VALUES (3, N'CAP       ', N'En capacitación')
INSERT [dbo].[EstatusAlumnos] ([id], [Clave], [Nombre]) VALUES (4, N'INC       ', N'En Incursión')
INSERT [dbo].[EstatusAlumnos] ([id], [Clave], [Nombre]) VALUES (5, N'LAB       ', N'Laborando')
INSERT [dbo].[EstatusAlumnos] ([id], [Clave], [Nombre]) VALUES (6, N'LIB       ', N'Liberado')
INSERT [dbo].[EstatusAlumnos] ([id], [Clave], [Nombre]) VALUES (7, N'NI        ', N'No le interesó')
INSERT [dbo].[EstatusAlumnos] ([id], [Clave], [Nombre]) VALUES (8, N'BA        ', N'Baja')

SET IDENTITY_INSERT [dbo].[EstatusAlumnos] OFF 
go
USE InstitutoTich
go
SET IDENTITY_INSERT [dbo].[Estados] ON 

INSERT [dbo].[Estados] ([id], [nombre]) VALUES (1, N'Aguascalientes')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (2, N'Baja California')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (3, N'Baja California Sur')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (4, N'Campeche')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (5, N'Chihuahua')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (6, N'Chiapas')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (7, N'Coahuila')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (8, N'Colima')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (9, N'Durango')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (10, N'Guanajuato')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (11, N'Guerrero')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (12, N'Hidalgo')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (13, N'Jalisco')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (14, N'México')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (15, N'Michoacán')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (16, N'Morelos')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (17, N'Nayarit')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (18, N'Nuevo León')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (19, N'Oaxaca')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (20, N'Puebla')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (21, N'Querétaro')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (22, N'Quintana Roo')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (23, N'San Luis Potosí')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (24, N'Sinaloa')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (25, N'Sonora')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (26, N'Tabasco')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (27, N'Tamaulipas')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (28, N'Tlaxcala')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (29, N'Veracruz')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (30, N'Yucatán')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (31, N'Zacatecas')

SET IDENTITY_INSERT [dbo].[Estados] OFF
go