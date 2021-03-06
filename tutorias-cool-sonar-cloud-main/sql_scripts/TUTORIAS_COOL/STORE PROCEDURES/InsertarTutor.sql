USE [PI]
GO
/****** Object:  StoredProcedure [dbo].[insertarTutor]    Script Date: 10/13/2021 9:39:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertarTutor] @Correo char(255), @Contrasena char(255), @Apellido char(255),@primerNombre char(255), @tipoRetribucion char(255), @Region varchar(255)
AS
	DECLARE @lastUserID int;
	DECLARE @lastRetID int;
	DECLARE @REG int;
	SELECT @REG = (SELECT REGION.ID from REGION where region.Nombre=@Region)
	INSERT INTO USUARIO (Correo,Contrasena,Apellido,PrimerNombre,region) VALUES (@Correo,@Contrasena,@Apellido,@primerNombre,@reg)
	SELECT @lastUserID=SCOPE_IDENTITY();
	INSERT INTO RETRIBUCION(Tipo) VALUES(@tipoRetribucion)
	SELECT @lastRetID=SCOPE_IDENTITY()
	INSERT INTO TUTOR (RetritubucionID,UsuarioID) VALUES (@lastRetID,@lastUserID)