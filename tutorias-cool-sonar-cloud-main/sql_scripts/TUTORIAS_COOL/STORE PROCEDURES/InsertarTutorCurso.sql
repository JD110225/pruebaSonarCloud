USE [PI]
GO
/****** Object:  StoredProcedure [dbo].[insertarTutorCurso]    Script Date: 10/13/2021 9:40:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertarTutorCurso] @TutorEmail varchar(255) , @CursoName varchar(255), @Ano int, @Periodo int
AS
	DECLARE @tutorID int;
	DECLARE @cursoID int;
	SELECT @tutorID = (SELECT id from tutor t where t.UsuarioID in (select ID from usuario usr where usr.Correo=@TutorEmail))
	SELECT @cursoID =(SELECT ID from curso c where c.Nombre=@CursoName)
	INSERT INTO TUTOR_CURSO (TutorID,CursoID,Ano,Periodo) VALUES (@tutorID,@cursoID,@Ano,@Periodo)