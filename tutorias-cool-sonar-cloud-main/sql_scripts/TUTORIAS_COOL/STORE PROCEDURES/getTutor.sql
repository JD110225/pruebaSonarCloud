CREATE PROCEDURE GET_TUTOR @ID INT
AS
SELECT * FROM TUTOR T WHERE T.UsuarioID = (SELECT U.ID FROM USUARIO U WHERE U.ID = @ID)
