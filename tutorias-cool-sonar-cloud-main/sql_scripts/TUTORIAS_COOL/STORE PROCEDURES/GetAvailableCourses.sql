USE [PI]
GO
/****** Object:  StoredProcedure [dbo].[GetAvailableCourses]    Script Date: 10/15/2021 10:06:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[GetAvailableCourses]
	@pattern varchar(255)
as
select C.ID AS [CursoID], 
C.Nombre as [CursoNombre], 
C.Sigla as [CursoSigla], 
C.Descripcion as [CursoDescripcion], 
TC.Ano as[Ano] , 
TC.Periodo as [Periodo], 
TC.ID as [Tutor_CursoID], 
T.ID as [TutorID], 
U.ID as [UsuarioID], 
U.PrimerNombre, 
U.Apellido, 
U.Correo
from CURSO C
INNER JOIN TUTOR_CURSO TC ON C.ID = TC.CursoID
INNER JOIN TUTOR T ON TC.TutorID = T.ID
INNER JOIN USUARIO U ON T.UsuarioID = U.ID
where C.nombre like @pattern or C.sigla like @pattern OR C.Descripcion LIKE @pattern