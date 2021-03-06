USE [PI]
GO
/****** Object:  StoredProcedure [dbo].[insertarTutorando]    Script Date: 10/13/2021 9:40:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertarTutorando] @Correo char(255), @Contrasena char(255), @Apellido char(255),@primerNombre char(255), @Region char(255)
AS
	DECLARE @lastUserID int;
	DECLARE @REG int;
	SELECT @REG = (SELECT REGION.ID from REGION where region.Nombre=@Region)
	INSERT INTO USUARIO (Correo,Contrasena,Apellido,PrimerNombre,REGION) VALUES (@Correo,@Contrasena,@Apellido,@primerNombre,@REG)
	SELECT @lastUserID=SCOPE_IDENTITY();
	INSERT INTO ESTUDIANTE(UsuarioID) VALUES (@lastUserID)