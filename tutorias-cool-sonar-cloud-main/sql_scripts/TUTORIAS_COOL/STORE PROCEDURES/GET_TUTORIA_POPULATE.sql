USE [PI]
GO
/****** Object:  StoredProcedure [dbo].[GET_TUTORIA_POPULATE]    Script Date: 10/24/2021 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[GET_TUTORIA_POPULATE] @ID INT
AS
BEGIN
	
SELECT 
T.ID [TutoriaId],
T.FechaInicial [TutoriaFechaInicial],
T.FechaFinal [TutoriaFechaFinal],
T.CantidadEstudiantes [TutoriaCantidadEstudiantes],
R.ID AS [RetribucionId],
R.Tipo AS [RetribucionTipo], 
TC.CursoID [TutorCursoId], 
TC.Ano [TutorCursoAno], 
TC.Periodo [TutorCursoPeriodo], 
CU.ID [CursoId],
CU.Nombre [CursoNombre],
CU.Sigla [CursoSigla],
CU.Descripcion [CursoDescripcion],
TU.ID AS [TutorId],
US.ID AS [TutorUsuarioId],
US.PrimerNombre [TutorPrimerNombre],
US.Apellido [TutorApellido],
US.Correo [TutorCorreo],
US.REGION [TutorRegionId],
RE.Nombre [TutorRegionNombre],
ET.ID [EstadoTutoriaId],
ET.Nombre AS [EstadoTutoriaNombre],
--P.Nombre AS [PlataformaNombre],
C.ID [CaracterId],
C.Name AS [CaracterNombre],
M.ID [ModalidadId],
M.Nombre as [ModalidadNombre],
TS.ID [TipoSesionId],
TS.Nombre AS [TipoSesionNombre]
FROM TUTORIA T
JOIN RETRIBUCION R
ON T.RetribucionID = R.ID
JOIN TUTOR_CURSO TC
ON T.TutorCursoID = TC.ID
JOIN ESTADO_TUTORIA ET
ON T.EstadoTutoriaID = ET.ID
--JOIN PLATAFORMA P
--ON T.PlataformaID = P.ID
JOIN CARACTER C
ON T.CaracterID = C.ID
JOIN MODALIDAD M
ON T.MODALIDADID = M.ID
JOIN TIPO_SESION TS
ON T.TIPO_SESIONID = TS.ID
JOIN CURSO CU
ON TC.CursoID = CU.ID
JOIN TUTOR TU
ON TC.TutorID = TU.ID
JOIN USUARIO US
JOIN REGION RE
ON US.REGION = RE.ID
ON TU.UsuarioID = US.ID
WHERE T.ID = @ID
END
