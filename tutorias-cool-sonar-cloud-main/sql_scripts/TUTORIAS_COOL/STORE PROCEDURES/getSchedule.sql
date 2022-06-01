create procedure getSchedule  @id int, @available int = 1
as  
select * from fecha 
where tutorid = @id and available = @available;