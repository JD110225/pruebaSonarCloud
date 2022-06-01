CREATE PROCEDURE GET_TUTOR_CURSO_INFO @TUTOR_CURSOID INT
AS
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
where TC.ID = @TUTOR_CURSOID