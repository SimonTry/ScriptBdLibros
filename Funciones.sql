ALTER FUNCTION [dbo].[CalcularTotalVenta]
(@id_venta int)
returns decimal(10,2)
AS
BEGIN
	declare @total DECIMAL(10,2)
	select @total = cantidad*precio from libros as l
	join ventas as v on l.id_libro = v.id_libro
	where id_venta = @id_venta;
	return @total;
END
