create procedure deleteDate  @id int, @tutorid int  as  delete from fecha where id = @id and tutorid = @tutorid;