CREATE PROC GET_RETRIBUCION @ID INT
AS
SELECT * FROM RETRIBUCION WHERE ID = @ID