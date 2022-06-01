ALTER PROCEDURE updatePersonalInfo @PrimerNombre varchar(255),@apellido varchar(255), @region varchar(255), @initialEmail varchar(255)
as
update USUARIO set primerNombre=@PrimerNombre where USUARIO.correo=@initialEmail
update USUARIO set apellido=@apellido  where USUARIO.correo=@initialEmail
update USUARIO set region=(select REGION.ID from REGION where REGION.nombre=@region) where USUARIO.correo=@initialEmail

CREATE PROCEDURE getNombreByCorreo  @Correo varchar(255) AS
SELECT USUARIO.primerNombre from USUARIO where USUARIO.correo=@Correo


CREATE PROCEDURE getApellidoByCorreo  @Correo varchar(255) AS
SELECT USUARIO.apellido from USUARIO where USUARIO.correo=@Correo