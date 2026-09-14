
ALTER VIEW [dbo].[ReporteDetalleDeVentas]
AS
	select titulo, nombre, apellido, fecha_venta, cantidad,
	[dbo].[CalcularTotalVenta](id_venta) [ValorVenta]
	from Ventas as v
	join libros as l on v.id_libro = l.id_libro
	join clientes as c on v.id_cliente = c.id_cliente
GO
