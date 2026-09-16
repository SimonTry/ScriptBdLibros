CREATE TABLE [Empresas] (
  [id_empresa] UNIQUEIDENTIFIER PRIMARY KEY NOT NULL,
  [nombreCompleto] varchar(100) NOT NULL,
  [pais_origen] varchar(100) NOT NULL,
  [ano_fundacion] datetime
)
GO

CREATE TABLE [VideoJuegos] (
  [id_videojuego] UNIQUEIDENTIFIER PRIMARY KEY NOT NULL,
  [Titulo] varchar(150) NOT NULL,
  [precio] decimal(10,2) NOT NULL,
  [fecha_lanzamiento] datetime,
  [codigo_unico] int UNIQUE NOT NULL,
  [empresaFk] UNIQUEIDENTIFIER NOT NULL
)
GO

CREATE TABLE [Online] (
  [id_online] uniqueidentifier PRIMARY KEY NOT NULL,
  [nro_jugadores] int NOT NULL,
  [conexion_permanente] bool NOT NULL,
  [videoJuegoFk] UNIQUEIDENTIFIER
)
GO

CREATE TABLE [Campaign] (
  [id_campana] UNIQUEIDENTIFIER PRIMARY KEY NOT NULL,
  [duracion] decimal(10,2),
  [videoJuegoFk] UNIQUEIDENTIFIER
)
GO

CREATE TABLE [Torneos] (
  [id_torneo] UNIQUEIDENTIFIER PRIMARY KEY NOT NULL,
  [nombre_torneo] varchar(100),
  [formato_competencia] varchar(100),
  [videoJuegoFk] UNIQUEIDENTIFIER NOT NULL
)
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'Tambien puede ser varchar y guardar si o no',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'Online',
@level2type = N'Column', @level2name = 'conexion_permanente';
GO

ALTER TABLE [VideoJuegos] ADD FOREIGN KEY ([empresaFk]) REFERENCES [Empresas] ([id_empresa])
GO

ALTER TABLE [Online] ADD FOREIGN KEY ([videoJuegoFk]) REFERENCES [VideoJuegos] ([id_videojuego])
GO

ALTER TABLE [Campaign] ADD FOREIGN KEY ([videoJuegoFk]) REFERENCES [VideoJuegos] ([id_videojuego])
GO

ALTER TABLE [Torneos] ADD FOREIGN KEY ([videoJuegoFk]) REFERENCES [VideoJuegos] ([id_videojuego])
GO
