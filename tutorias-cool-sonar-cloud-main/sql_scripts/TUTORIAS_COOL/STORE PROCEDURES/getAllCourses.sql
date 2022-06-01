create procedure getAllCourses
@pattern varchar(255)
as
select * from curso c where c.nombre like @pattern or c.sigla like @pattern OR c.descripcion LIKE @pattern;