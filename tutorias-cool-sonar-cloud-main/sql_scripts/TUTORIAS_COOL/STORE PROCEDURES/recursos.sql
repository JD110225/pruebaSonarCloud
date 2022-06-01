ALTER PROCEDURE [dbo].[GetAllRecursos] as
SELECT Path , nombre , USUARIO.PrimerNombre,USUARIO.Apellido from materiales inner join usuario on MATERIALES.UsuarioID=USUARIO.ID

CREATE PROCEDURE addRecurso @Path varchar(255),@Email varchar(255),@Nombre varchar(255)
as
DECLARE @userID int;
Select @userID =(select ID from USUARIO where USUARIO.Correo=@email)
insert into MATERIALES (Path,UsuarioID,Nombre )VALUES(@Path ,@userID,@Nombre)





-- Alters
Alter table materiales 
DROP CONSTRAINT PK__MATERIAL__3214EC277404A615

ALTER TABLE Materiales
DROP COLUMN ID;

ALTER TABLE MATERIALES
ADD CONSTRAINT compoundPK PRIMARY KEY (Path,UsuarioID)

ALTER TABLE Materiales
ALTER COLUMN CURSOID INT NULL
