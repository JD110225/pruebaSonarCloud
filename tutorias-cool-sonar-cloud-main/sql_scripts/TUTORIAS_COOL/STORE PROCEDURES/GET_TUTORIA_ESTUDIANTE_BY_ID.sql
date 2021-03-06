USE [PI]
GO
/****** Object:  StoredProcedure [dbo].[GET_TUTORIA_ESTUDIANTE_BY_ID]    Script Date: 10/24/2021 11:59:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[GET_TUTORIA_ESTUDIANTE_BY_ID] @ID INT
AS
BEGIN
SELECT 
TE.HoraIngreso, TE.HoraEgreso, TE.EvaluacionID,
E.ID [EstudianteID],
U.ID [UsuarioID],
U.PrimerNombre,
U.Apellido,
U.Correo,
U.REGION [RegionId],
RE.Nombre [RegionNombre]
FROM TUTORIA_ESTUDIANTE TE
JOIN ESTUDIANTE E
ON TE.EstudianteID = E.ID
JOIN USUARIO U
ON E.UsuarioId = U.ID
JOIN REGION RE
ON U.REGION = RE.ID
WHERE TutoriaID = @ID
END
