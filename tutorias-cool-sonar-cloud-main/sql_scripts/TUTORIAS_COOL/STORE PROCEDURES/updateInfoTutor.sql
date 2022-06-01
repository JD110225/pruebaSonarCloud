CREATE PROCEDURE insertModalidadTutor @Modalidad varchar(255), @tutorEmail varchar(255)
as
DECLARE @ModID int;
DECLARE @TutorID int;
SELECT @ModID = (SELECT MODALIDAD.ID from modalidad where modalidad.Nombre=@Modalidad)
SELECT @TutorID = (select tutor.ID from tutor inner join USUARIO on tutor.UsuarioID=USUARIO.ID where USUARIO.Correo=@tutorEmail)
INSERT into MODALIDAD_TUTOR (MODALIDADID, TUTORID) VALUES (@ModID,@TutorID)


CREATE PROCEDURE insertTipoSesionTutor @TipoSesion varchar(255), @tutorEmail varchar(255)
as
DECLARE @tipoID int;
DECLARE @TutorID int;
SELECT @tipoID = (SELECT TIPO_SESION.ID from TIPO_SESION where TIPO_SESION.Nombre=@TipoSesion)
SELECT @TutorID = (select tutor.ID from tutor inner join USUARIO on tutor.UsuarioID=USUARIO.ID where USUARIO.Correo=@tutorEmail)
INSERT INTO TIPO_SESION_TUTOR (TIPO_SESIONID, TUTORID) VALUES (@tipoID,@TutorID)

CREATE PROCEDURE UpdateRetribucion @TipoRetribucion varchar(255), @tutorEmail varchar(255)
AS
DECLARE @retID int;
DECLARE @TutorID int;
SELECT @retID = (select  RETRIBUCION.ID from RETRIBUCION where RETRIBUCION.Tipo=@TipoRetribucion)
SELECT @TutorID = (select tutor.ID from tutor inner join USUARIO on tutor.UsuarioID=USUARIO.ID where USUARIO.Correo=@tutorEmail)
UPDATE TUTOR set tutor.RetritubucionID = @retID where tutor.ID=@TutorID


Alter PROCEDURE updateMaxEstud @TutorEmail varchar(255), @maxEstud varchar(255)
as
update tutor set tutor.maxEstud = @maxEstud where tutor.UsuarioID=(select ID from usuario usr where usr.Correo=@TutorEmail)

CREATE PROCEDURE getTiposSesion AS
SELECT * from TIPO_SESION

CREATE PROCEDURE getModalidades AS
SELECT * from MODALIDAD

CREATE PROCEDURE insertPlataformaTutor @Email varchar(25), @Plataforma varchar(255) AS
DECLARE @tutorID int;
DECLARE @platID int;
SELECT @platID = (SELECT PLATAFORMA.ID from PLATAFORMA where PLATAFORMA.Nombre=@Plataforma)
SELECT @tutorID=(Select TUTOR.ID from tutor inner join USUARIO on tutor.UsuarioID=USUARIO.ID where USUARIO.Correo='josedv9898@gmail.com')
insert into PLATAFORMA_TUTOR(tutorID,plataformaID) VALUES (@tutorID,@platID)
