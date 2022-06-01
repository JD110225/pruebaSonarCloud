USE [PI]
GO
/****** Object:  StoredProcedure [dbo].[GET_TUTORIA_POPULATE]    Script Date: 10/25/2021 12:17:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[GET_ALL_TUTORIAS_THUMBNAIL] @ID INT, @ESTADO INT
AS
BEGIN
	
SELECT 
T.ID [TutoriaId],
T.FechaInicial [TutoriaFechaInicial],
T.FechaFinal [TutoriaFechaFinal],
CU.Nombre [CursoNombre],
CU.Sigla [CursoSigla],
US.PrimerNombre [TutorPrimerNombre],
US.Apellido [TutorApellido],
ET.ID [EstadoTutoriaId],
ET.Nombre AS [EstadoTutoriaNombre]
FROM TUTORIA T
JOIN TUTOR_CURSO TC
ON T.TutorCursoID = TC.ID
JOIN ESTADO_TUTORIA ET
ON T.EstadoTutoriaID = ET.ID
JOIN CURSO CU
ON TC.CursoID = CU.ID
JOIN TUTOR TU
ON TC.TutorID = TU.ID
JOIN USUARIO US
ON TU.UsuarioID = US.ID
JOIN TUTORIA_ESTUDIANTE TE
ON T.ID = TE.TutoriaID
WHERE TE.EstudianteID = @ID
AND T.EstadoTutoriaID = @ESTADO
AND T.FechaInicial IS NOT NULL
AND T.FechaFinal IS NOT NULL
ORDER BY T.FechaInicial, T.FechaFinal
END
