create procedure setSchedule
@idDate int, @idTutoria int
as
begin transaction
	begin try
		update fecha 
		set Available = 0
		where id = @idDate;

		insert into fecha_tutoria
		select @idTutoria, ff.Fecha_Inicio, ff.Fecha_Fin, ff.TutorID, ff.ID
		from fecha ff
		where ff.id = @idDate;
		commit transaction
	end try
	begin catch
	rollback transaction;
	throw;
	end catch