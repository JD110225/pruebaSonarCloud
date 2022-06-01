USE [PI]
GO
/****** Object:  StoredProcedure [dbo].[existe]    Script Date: 10/13/2021 9:37:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[existe] @Correo varchar(255)
AS
select * from USUARIO where usuario.Correo=@Correo