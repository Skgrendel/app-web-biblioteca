USE [master]
GO
/****** Object:  Database [dbs_biblioteca]    Script Date: 24/06/2023 8:50:47 a. m. ******/
CREATE DATABASE [dbs_biblioteca]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbs_biblioteca', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.DARIEL\MSSQL\DATA\dbs_biblioteca.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbs_biblioteca_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.DARIEL\MSSQL\DATA\dbs_biblioteca_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [dbs_biblioteca] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbs_biblioteca].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbs_biblioteca] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbs_biblioteca] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbs_biblioteca] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbs_biblioteca] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbs_biblioteca] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbs_biblioteca] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [dbs_biblioteca] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbs_biblioteca] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbs_biblioteca] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbs_biblioteca] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbs_biblioteca] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbs_biblioteca] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbs_biblioteca] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbs_biblioteca] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbs_biblioteca] SET  ENABLE_BROKER 
GO
ALTER DATABASE [dbs_biblioteca] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbs_biblioteca] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbs_biblioteca] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbs_biblioteca] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbs_biblioteca] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbs_biblioteca] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbs_biblioteca] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbs_biblioteca] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbs_biblioteca] SET  MULTI_USER 
GO
ALTER DATABASE [dbs_biblioteca] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbs_biblioteca] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbs_biblioteca] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbs_biblioteca] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbs_biblioteca] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbs_biblioteca] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [dbs_biblioteca] SET QUERY_STORE = OFF
GO
USE [dbs_biblioteca]
GO
/****** Object:  Table [dbo].[tbl_estados]    Script Date: 24/06/2023 8:50:47 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_estados](
	[Pkcodigo] [varchar](3) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Nomenclatura] [varchar](3) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Pkcodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_libros]    Script Date: 24/06/2023 8:50:47 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_libros](
	[PKisbn] [varchar](20) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Autor] [varchar](100) NOT NULL,
	[Editorial] [varchar](70) NOT NULL,
	[N_paginas] [int] NOT NULL,
	[Genero] [varchar](50) NOT NULL,
	[Fecha_P] [date] NOT NULL,
	[Fkcodigo_tbl_estado] [varchar](3) NOT NULL,
	[Cantidad_e] [int] NOT NULL,
	[Descripcion] [varchar](5000) NULL,
 CONSTRAINT [PK__tbl_libr__F3B832A11849E77B] PRIMARY KEY CLUSTERED 
(
	[PKisbn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_prestamos]    Script Date: 24/06/2023 8:50:47 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_prestamos](
	[Pkn_prestamos] [bigint] IDENTITY(1,1) NOT NULL,
	[Fkid_tbl_usuarios] [varchar](10) NOT NULL,
	[fecha_registro] [date] NOT NULL,
	[fecha_entrega] [date] NOT NULL,
	[Fkcodigo_tbl_estado] [varchar](3) NOT NULL,
	[Fkisbn_tbl_libros] [varchar](20) NOT NULL,
	[cantidad] [int] NOT NULL,
 CONSTRAINT [PK__tbl_pres__AA2D644C32603C8D] PRIMARY KEY CLUSTERED 
(
	[Pkn_prestamos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_usuarios]    Script Date: 24/06/2023 8:50:47 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_usuarios](
	[Pkid] [varchar](10) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Contacto] [varchar](11) NOT NULL,
	[Direccion] [varchar](100) NOT NULL,
	[Correo] [varchar](50) NOT NULL,
	[Fkcodigo_tbl_estado] [varchar](3) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Pkid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tbl_estados] ([Pkcodigo], [Nombre], [Nomenclatura]) VALUES (N'1', N'Disponible', N'DIS')
INSERT [dbo].[tbl_estados] ([Pkcodigo], [Nombre], [Nomenclatura]) VALUES (N'2', N'No Disponible', N'ND')
INSERT [dbo].[tbl_estados] ([Pkcodigo], [Nombre], [Nomenclatura]) VALUES (N'3', N'Sin Existencia', N'SE')
INSERT [dbo].[tbl_estados] ([Pkcodigo], [Nombre], [Nomenclatura]) VALUES (N'4', N'Activo', N'ACT')
INSERT [dbo].[tbl_estados] ([Pkcodigo], [Nombre], [Nomenclatura]) VALUES (N'5', N'Inactivo', N'INA')
INSERT [dbo].[tbl_estados] ([Pkcodigo], [Nombre], [Nomenclatura]) VALUES (N'6', N'Sancionado', N'SAC')
INSERT [dbo].[tbl_estados] ([Pkcodigo], [Nombre], [Nomenclatura]) VALUES (N'7', N'Prestado', N'PRE')
INSERT [dbo].[tbl_estados] ([Pkcodigo], [Nombre], [Nomenclatura]) VALUES (N'8', N'Entregado', N'ENT')
GO
INSERT [dbo].[tbl_libros] ([PKisbn], [Nombre], [Autor], [Editorial], [N_paginas], [Genero], [Fecha_P], [Fkcodigo_tbl_estado], [Cantidad_e], [Descripcion]) VALUES (N'4578', N'it', N'stephen king', N'parma', 500, N'terror', CAST(N'2023-06-06' AS Date), N'1', 2, N'terror')
INSERT [dbo].[tbl_libros] ([PKisbn], [Nombre], [Autor], [Editorial], [N_paginas], [Genero], [Fecha_P], [Fkcodigo_tbl_estado], [Cantidad_e], [Descripcion]) VALUES (N'4579', N'it', N'stephen king', N'parma', 500, N'terror', CAST(N'2023-06-05' AS Date), N'1', 18, N'tr')
INSERT [dbo].[tbl_libros] ([PKisbn], [Nombre], [Autor], [Editorial], [N_paginas], [Genero], [Fecha_P], [Fkcodigo_tbl_estado], [Cantidad_e], [Descripcion]) VALUES (N'4580', N'sd', N'stephen king', N'parma', 500, N'terror', CAST(N'2023-06-07' AS Date), N'2', 18, N'sdsd')
INSERT [dbo].[tbl_libros] ([PKisbn], [Nombre], [Autor], [Editorial], [N_paginas], [Genero], [Fecha_P], [Fkcodigo_tbl_estado], [Cantidad_e], [Descripcion]) VALUES (N'4581', N'sd', N'stephen king', N'parma', 500, N'terror', CAST(N'2023-06-07' AS Date), N'2', -3, N'sdsd')
INSERT [dbo].[tbl_libros] ([PKisbn], [Nombre], [Autor], [Editorial], [N_paginas], [Genero], [Fecha_P], [Fkcodigo_tbl_estado], [Cantidad_e], [Descripcion]) VALUES (N'4582', N'asdd', N'asd', N'asd', 5, N'asdasd', CAST(N'2023-06-13' AS Date), N'2', 18, N'asdasd')
INSERT [dbo].[tbl_libros] ([PKisbn], [Nombre], [Autor], [Editorial], [N_paginas], [Genero], [Fecha_P], [Fkcodigo_tbl_estado], [Cantidad_e], [Descripcion]) VALUES (N'4583', N'sdfsdfa', N'sdasd', N'sdasd', 500, N'sddasd', CAST(N'2023-06-06' AS Date), N'1', 50, N'asdasdasdasdasdasd')
INSERT [dbo].[tbl_libros] ([PKisbn], [Nombre], [Autor], [Editorial], [N_paginas], [Genero], [Fecha_P], [Fkcodigo_tbl_estado], [Cantidad_e], [Descripcion]) VALUES (N'4683', N'asdasd', N'dfgdfg', N'dfgdf', 56, N'dfgdfg', CAST(N'2023-06-05' AS Date), N'3', 1, N'gdfgdfgdfg')
GO
SET IDENTITY_INSERT [dbo].[tbl_prestamos] ON 

INSERT [dbo].[tbl_prestamos] ([Pkn_prestamos], [Fkid_tbl_usuarios], [fecha_registro], [fecha_entrega], [Fkcodigo_tbl_estado], [Fkisbn_tbl_libros], [cantidad]) VALUES (1, N'1143442589', CAST(N'2023-06-23' AS Date), CAST(N'2023-06-13' AS Date), N'7', N'4581', 4)
INSERT [dbo].[tbl_prestamos] ([Pkn_prestamos], [Fkid_tbl_usuarios], [fecha_registro], [fecha_entrega], [Fkcodigo_tbl_estado], [Fkisbn_tbl_libros], [cantidad]) VALUES (2, N'1143442589', CAST(N'2023-06-23' AS Date), CAST(N'2023-06-13' AS Date), N'7', N'4581', 15)
INSERT [dbo].[tbl_prestamos] ([Pkn_prestamos], [Fkid_tbl_usuarios], [fecha_registro], [fecha_entrega], [Fkcodigo_tbl_estado], [Fkisbn_tbl_libros], [cantidad]) VALUES (3, N'1143442589', CAST(N'2023-06-23' AS Date), CAST(N'2023-06-27' AS Date), N'7', N'4581', 5)
INSERT [dbo].[tbl_prestamos] ([Pkn_prestamos], [Fkid_tbl_usuarios], [fecha_registro], [fecha_entrega], [Fkcodigo_tbl_estado], [Fkisbn_tbl_libros], [cantidad]) VALUES (4, N'1143442589', CAST(N'2023-06-23' AS Date), CAST(N'2023-06-25' AS Date), N'7', N'4581', 4)
INSERT [dbo].[tbl_prestamos] ([Pkn_prestamos], [Fkid_tbl_usuarios], [fecha_registro], [fecha_entrega], [Fkcodigo_tbl_estado], [Fkisbn_tbl_libros], [cantidad]) VALUES (5, N'1143442589', CAST(N'2023-06-23' AS Date), CAST(N'2023-06-30' AS Date), N'7', N'4578', 8)
INSERT [dbo].[tbl_prestamos] ([Pkn_prestamos], [Fkid_tbl_usuarios], [fecha_registro], [fecha_entrega], [Fkcodigo_tbl_estado], [Fkisbn_tbl_libros], [cantidad]) VALUES (6, N'1143442589', CAST(N'2023-06-23' AS Date), CAST(N'2023-06-28' AS Date), N'7', N'4578', 4)
INSERT [dbo].[tbl_prestamos] ([Pkn_prestamos], [Fkid_tbl_usuarios], [fecha_registro], [fecha_entrega], [Fkcodigo_tbl_estado], [Fkisbn_tbl_libros], [cantidad]) VALUES (7, N'1143442589', CAST(N'2023-06-23' AS Date), CAST(N'2023-06-28' AS Date), N'7', N'4581', 2)
INSERT [dbo].[tbl_prestamos] ([Pkn_prestamos], [Fkid_tbl_usuarios], [fecha_registro], [fecha_entrega], [Fkcodigo_tbl_estado], [Fkisbn_tbl_libros], [cantidad]) VALUES (8, N'1143442589', CAST(N'2023-06-23' AS Date), CAST(N'2023-06-20' AS Date), N'7', N'4581', 2)
INSERT [dbo].[tbl_prestamos] ([Pkn_prestamos], [Fkid_tbl_usuarios], [fecha_registro], [fecha_entrega], [Fkcodigo_tbl_estado], [Fkisbn_tbl_libros], [cantidad]) VALUES (9, N'1045683131', CAST(N'2023-06-23' AS Date), CAST(N'2023-06-07' AS Date), N'7', N'4581', 5)
INSERT [dbo].[tbl_prestamos] ([Pkn_prestamos], [Fkid_tbl_usuarios], [fecha_registro], [fecha_entrega], [Fkcodigo_tbl_estado], [Fkisbn_tbl_libros], [cantidad]) VALUES (10, N'1045683131', CAST(N'2023-06-23' AS Date), CAST(N'2023-06-06' AS Date), N'7', N'4578', 4)
SET IDENTITY_INSERT [dbo].[tbl_prestamos] OFF
GO
INSERT [dbo].[tbl_usuarios] ([Pkid], [Nombre], [Apellido], [Contacto], [Direccion], [Correo], [Fkcodigo_tbl_estado]) VALUES (N'1045683131', N'bryan ', N'andion', N'311320082', N'malambo', N'bryan.andion@gmail.com', N'4')
INSERT [dbo].[tbl_usuarios] ([Pkid], [Nombre], [Apellido], [Contacto], [Direccion], [Correo], [Fkcodigo_tbl_estado]) VALUES (N'1143442589', N'graciela isabel', N'andion carrascal', N'3113220082', N'malambo', N'graciela.f@gmail.com', N'4')
INSERT [dbo].[tbl_usuarios] ([Pkid], [Nombre], [Apellido], [Contacto], [Direccion], [Correo], [Fkcodigo_tbl_estado]) VALUES (N'1234096392', N'graciela isabel', N'flores salazar', N'3015258354', N'malambo', N'graciela.f@gmail.com', N'4')
GO
ALTER TABLE [dbo].[tbl_libros]  WITH CHECK ADD  CONSTRAINT [FK_tbl_libros_tbl_estados] FOREIGN KEY([Fkcodigo_tbl_estado])
REFERENCES [dbo].[tbl_estados] ([Pkcodigo])
GO
ALTER TABLE [dbo].[tbl_libros] CHECK CONSTRAINT [FK_tbl_libros_tbl_estados]
GO
ALTER TABLE [dbo].[tbl_prestamos]  WITH CHECK ADD  CONSTRAINT [FK_tbl_prestamos_tbl_estados] FOREIGN KEY([Fkcodigo_tbl_estado])
REFERENCES [dbo].[tbl_estados] ([Pkcodigo])
GO
ALTER TABLE [dbo].[tbl_prestamos] CHECK CONSTRAINT [FK_tbl_prestamos_tbl_estados]
GO
ALTER TABLE [dbo].[tbl_prestamos]  WITH CHECK ADD  CONSTRAINT [FK_tbl_prestamos_tbl_usuarios] FOREIGN KEY([Fkid_tbl_usuarios])
REFERENCES [dbo].[tbl_usuarios] ([Pkid])
GO
ALTER TABLE [dbo].[tbl_prestamos] CHECK CONSTRAINT [FK_tbl_prestamos_tbl_usuarios]
GO
ALTER TABLE [dbo].[tbl_usuarios]  WITH CHECK ADD  CONSTRAINT [FK_tbl_usuarios_tbl_estados] FOREIGN KEY([Fkcodigo_tbl_estado])
REFERENCES [dbo].[tbl_estados] ([Pkcodigo])
GO
ALTER TABLE [dbo].[tbl_usuarios] CHECK CONSTRAINT [FK_tbl_usuarios_tbl_estados]
GO
/****** Object:  StoredProcedure [dbo].[Sp_consultar_libro]    Script Date: 24/06/2023 8:50:47 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,bryan>
-- Create date: <Create Date,,21/06/2023>
-- Description:	<Description,, consulta de libro>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_consultar_libro]
@isbn varchar(20)
as begin
select [dbo].[tbl_libros].[Nombre] as 'nombre',[Autor] as 'autor',[Editorial] as 'editorial',[N_paginas] as 'paginas',[Genero] as'genero' ,[Fecha_P] as 'fecha', [dbo].[tbl_estados].Nombre as 'estado',[Cantidad_e] as 'cantidad',[Descripcion] as 'descripcion' from[dbo].[tbl_libros],[dbo].[tbl_estados] where [PKisbn]=@isbn and [dbo].[tbl_estados].Pkcodigo=[dbo].[tbl_libros].Fkcodigo_tbl_estado
end
GO
/****** Object:  StoredProcedure [dbo].[Sp_consultar_usuario]    Script Date: 24/06/2023 8:50:47 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_consultar_usuario]
@id varchar(10)
as begin 
select [Nombre],[Apellido] from [dbo].[tbl_usuarios] where [Pkid]=@id
end
GO
/****** Object:  StoredProcedure [dbo].[sp_devolucion_lib]    Script Date: 24/06/2023 8:50:47 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_devolucion_lib]
@id varchar (10),@isbn varchar(20),@entrega date,@cantidad int
as begin
declare @estado varchar(3)
set @estado= '8'
declare @operacion int
declare @resultado int
set @operacion = (select [Cantidad_e] from [dbo].[tbl_libros] where [PKisbn]=@isbn)
set @resultado = @operacion + @cantidad
update [dbo].[tbl_libros] set [Cantidad_e]=@resultado from [dbo].[tbl_libros] where [PKisbn]=@isbn
insert into [dbo].[tbl_prestamos]([Fkid_tbl_usuarios],[fecha_registro],[fecha_entrega],[Fkcodigo_tbl_estado],[Fkisbn_tbl_libros],[cantidad])
values
(@id,getdate(),@entrega,@estado,@isbn,@cantidad)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_editar_lib]    Script Date: 24/06/2023 8:50:47 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_editar_lib]
@isbn varchar(20),@nombre varchar (100),@autor varchar (100),@editorial varchar (100),
@numero_p int,@genero varchar (50),@fecha_p date,@estado varchar (3),@cantidad int,@descripcion varchar(5000)
as begin
update [dbo].[tbl_libros] set [PKisbn]=@isbn,[Nombre]=@nombre,[Autor]=@autor,[Editorial]=@editorial,[N_paginas]=@numero_p,[Genero]=@genero,[Fecha_P]=@fecha_p,[Cantidad_e]=@cantidad,[Descripcion]=@descripcion from [dbo].[tbl_libros] where [PKisbn]=@isbn
end
GO
/****** Object:  StoredProcedure [dbo].[Sp_Mostrar_estados]    Script Date: 24/06/2023 8:50:47 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Sp_Mostrar_estados]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT [Pkcodigo],[Nombre]  FROM [dbo].[tbl_estados] where [Pkcodigo]>=1 and [Pkcodigo]<= 3 ;
END

GO
/****** Object:  StoredProcedure [dbo].[sp_prestamos]    Script Date: 24/06/2023 8:50:47 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_prestamos]
@id varchar (10),@isbn varchar(20),@entrega date,@cantidad int
as begin
declare @operacion int
declare @resultado int
declare @estado varchar (3)
set @estado='7'
set @operacion = (select [Cantidad_e] from [dbo].[tbl_libros] where [PKisbn]=@isbn)
set @resultado = @operacion - @cantidad
update [dbo].[tbl_libros] set [Cantidad_e]=@resultado from [dbo].[tbl_libros] where [PKisbn]=@isbn
insert into [dbo].[tbl_prestamos]([Fkid_tbl_usuarios],[fecha_registro],[fecha_entrega],[Fkcodigo_tbl_estado],[Fkisbn_tbl_libros],[cantidad])
values
(@id,getdate(),@entrega,@estado,@isbn,@cantidad)
end
GO
/****** Object:  StoredProcedure [dbo].[Sp_Registrar_libros]    Script Date: 24/06/2023 8:50:47 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Bryan>
-- Create date: <Create Date,,15/06/2023>
-- Description:	<Description,,registro de libros>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_Registrar_libros]
@isbn varchar(20),@nombre varchar (100),@autor varchar (100),@editorial varchar (100),
@numero_p int,@genero varchar (50),@fecha_p date,@estado varchar (3),@cantidad int,@descripcion varchar(5000)
as begin
insert into [dbo].[tbl_libros] ([PKisbn],[Nombre],[Autor],[Editorial],[N_paginas],[Genero],[Fecha_P],[Fkcodigo_tbl_estado],[Cantidad_e],[Descripcion])
values
(@isbn,@nombre,@autor,@editorial,@numero_p,@genero,@fecha_p,@estado,@cantidad,@descripcion)
end
GO
/****** Object:  StoredProcedure [dbo].[Sp_Registrar_usuarios]    Script Date: 24/06/2023 8:50:47 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Bryan>
-- Create date: <Create Date,,15/06/2023>
-- Description:	<Description,,registro de usuarios>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_Registrar_usuarios]
@id varchar(10),@nombre varchar (50),@apellido varchar (50),@contacto varchar (11),
@direccion varchar(100),@correo varchar (50)
as begin
declare @estado varchar (3)
set @estado = '4'
insert into [dbo].[tbl_usuarios]([Pkid],[Nombre],[Apellido],[Contacto],[Direccion],[Correo],[Fkcodigo_tbl_estado])
values 
(@id,@nombre,@apellido,@contacto,
@direccion,@correo,@estado)
end
GO
/****** Object:  StoredProcedure [dbo].[Sp_Validar_libro]    Script Date: 24/06/2023 8:50:47 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_Validar_libro]
    @isbn VARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT COUNT(*) FROM [dbo].[tbl_libros] WHERE [PKisbn] = @isbn;
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_Validar_usuario]    Script Date: 24/06/2023 8:50:47 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_Validar_usuario]
    @id VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT COUNT(*) FROM [dbo].[tbl_usuarios] WHERE [Pkid] = @id;
END
GO
USE [master]
GO
ALTER DATABASE [dbs_biblioteca] SET  READ_WRITE 
GO
