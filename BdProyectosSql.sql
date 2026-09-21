--Modelo Fisico

CREATE TABLE [Proyectos] (
  [id_proyecto] UNIQUEIDENTIFIER PRIMARY KEY,
  [nombre] varchar(100) NOT NULL,
  [fecha_creacion] datetime,
  [duracion] varchar(100)
)
GO

CREATE TABLE [estudiantes] (
  [id_estudiante] UNIQUEIDENTIFIER PRIMARY KEY NOT NULL,
  [nombre_completo] varchar(100) NOT NULL,
  [fecha_nacimiento] datetime NOT NULL,
  [identificacion] varchar(200) UNIQUE NOT NULL
)
GO

CREATE TABLE [Integrantes] (
  [id_integrante] uniqueidentifier PRIMARY KEY NOT NULL,
  [estudianteFk] uniqueidentifier,
  [proyectoFk] uniqueidentifier,
  [calificacion] decimanl(18,0)
)
GO

ALTER TABLE [Integrantes] ADD FOREIGN KEY ([proyectoFk]) REFERENCES [Proyectos] ([id_proyecto])
GO

ALTER TABLE [Integrantes] ADD FOREIGN KEY ([estudianteFk]) REFERENCES [estudiantes] ([id_estudiante])
GO
