CREATE PROCEDURE INSERTAR_LIBRO
@titulo varchar(100),
@genero varchar(100),
@anio int,
@precio decimal(10,2),
@id_autor int
AS
BEGIN
	declare @new_id int
	select @new_id= MAX(id_libro)+1 from libros

	INSERT INTO Libros(id_libro, titulo, genero, anio_publicacion,
	precio, id_autor)
	VALUES(@new_id,@titulo,@genero,@anio,@precio,@id_autor)

	select 'Se inserto correctamente el libro '+@titulo
END
