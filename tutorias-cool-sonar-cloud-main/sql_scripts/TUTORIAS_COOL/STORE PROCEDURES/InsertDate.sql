create procedure insertDate  
@start datetime, @end datetime, @tutorid int  
as  
begin transaction
	begin try
		if cast(@start as date) <> cast(@end as date)   
		begin
			throw 50000, 'Las fechas no coinciden',1
		end   
	if cast(@start as time) >= cast(@end as time)
		begin
			throw 50001, 'La hora inicial es mayor o igual a la hora final',2
		end  
	while (@start <> @end)   
		begin    
			insert into fecha values (@start, dateadd(minute,30,@start),@tutorid,1)    
			set @start = dateadd(minute,30,@start)   
		end   
	commit transaction
	end try
	begin catch
		rollback transaction;
		throw
	end catch