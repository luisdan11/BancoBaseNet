USE [master]
GO
/****** Object:  Database [BancoBase]    Script Date: 13/08/2024 17:43:16 ******/
CREATE DATABASE [BancoBase]
 CONTAINMENT = NONE
GO
ALTER DATABASE [BancoBase] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BancoBase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BancoBase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BancoBase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BancoBase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BancoBase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BancoBase] SET ARITHABORT OFF 
GO
ALTER DATABASE [BancoBase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BancoBase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BancoBase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BancoBase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BancoBase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BancoBase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BancoBase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BancoBase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BancoBase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BancoBase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BancoBase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BancoBase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BancoBase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BancoBase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BancoBase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BancoBase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BancoBase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BancoBase] SET RECOVERY FULL 
GO
ALTER DATABASE [BancoBase] SET  MULTI_USER 
GO
ALTER DATABASE [BancoBase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BancoBase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BancoBase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BancoBase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BancoBase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BancoBase] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BancoBase', N'ON'
GO
ALTER DATABASE [BancoBase] SET QUERY_STORE = OFF
GO
USE [BancoBase]
GO
/****** Object:  Schema [Catalog]    Script Date: 13/08/2024 17:43:17 ******/
CREATE SCHEMA [Catalog]
GO
/****** Object:  Table [Catalog].[Status]    Script Date: 13/08/2024 17:43:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Catalog].[Status](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 13/08/2024 17:43:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[ID] [nvarchar](10) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[Balance] [money] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 13/08/2024 17:43:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[ID] [uniqueidentifier] NOT NULL,
	[Concept] [nvarchar](255) NOT NULL,
	[QtyProducts] [int] NOT NULL,
	[From] [nvarchar](10) NOT NULL,
	[To] [nvarchar](10) NOT NULL,
	[Total] [money] NOT NULL,
	[StatusID] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_Payments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [Catalog].[Status] ([ID], [Name]) VALUES (1, N'PENDIENTE')
GO
INSERT [Catalog].[Status] ([ID], [Name]) VALUES (2, N'COMPLETADO')
GO
INSERT [Catalog].[Status] ([ID], [Name]) VALUES (3, N'CANCELADO')
GO
INSERT [dbo].[Accounts] ([ID], [FullName], [Balance], [CreatedOn], [UpdatedOn]) VALUES (N'A000001', N'Jhon Doe', 1000.0000, CAST(N'2024-08-13T08:56:40.290' AS DateTime), NULL)
GO
INSERT [dbo].[Accounts] ([ID], [FullName], [Balance], [CreatedOn], [UpdatedOn]) VALUES (N'B000001', N'Juan Pérez', 1000.0000, CAST(N'2024-08-13T08:56:40.290' AS DateTime), NULL)
GO
INSERT [dbo].[Payments] ([ID], [Concept], [QtyProducts], [From], [To], [Total], [StatusID], [CreatedOn], [UpdatedOn]) VALUES (N'14d60f26-1690-4bd2-a662-0f637c08b239', N'prueba3', 5, N'A000001', N'B000001', 500.0000, 2, CAST(N'2024-08-13T16:50:19.793' AS DateTime), NULL)
GO
INSERT [dbo].[Payments] ([ID], [Concept], [QtyProducts], [From], [To], [Total], [StatusID], [CreatedOn], [UpdatedOn]) VALUES (N'3a3ae97b-1284-4db1-9477-1d3c2bd5ec1c', N'Prueba2', 10, N'A000001', N'B000001', 3000.0000, 1, CAST(N'2024-08-13T16:24:06.920' AS DateTime), NULL)
GO
INSERT [dbo].[Payments] ([ID], [Concept], [QtyProducts], [From], [To], [Total], [StatusID], [CreatedOn], [UpdatedOn]) VALUES (N'a918b8e0-da81-490e-9767-9ef1b000ba01', N'prueba', 2, N'A000001', N'B000001', 500.0000, 3, CAST(N'2024-08-13T15:42:30.577' AS DateTime), NULL)
GO
ALTER TABLE [dbo].[Accounts] ADD  CONSTRAINT [DF_Accounts_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Payments] ADD  CONSTRAINT [DF_Payments_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_Accounts] FOREIGN KEY([From])
REFERENCES [dbo].[Accounts] ([ID])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_Accounts]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_Accounts1] FOREIGN KEY([To])
REFERENCES [dbo].[Accounts] ([ID])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_Accounts1]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_Status] FOREIGN KEY([StatusID])
REFERENCES [Catalog].[Status] ([ID])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_Status]
GO
/****** Object:  StoredProcedure [Catalog].[sp_GetAllCurrencies]    Script Date: 13/08/2024 17:43:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Catalog].[sp_GetAllCurrencies]
AS 
BEGIN
SELECT [ID]
      ,[Name]
  FROM [Catalog].[Currency];
END
GO
/****** Object:  StoredProcedure [Catalog].[sp_GetAllStatus]    Script Date: 13/08/2024 17:43:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Catalog].[sp_GetAllStatus]
AS 
BEGIN
SELECT [ID]
      ,[Name]
  FROM [Catalog].[Status];
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CreatePayment]    Script Date: 13/08/2024 17:43:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[sp_CreatePayment]
@ID uniqueidentifier,
@Concept nvarchar(255),
@QtyProducts int,
@From nvarchar(10),
@To nvarchar(10),
@Total money,
@StatusID int
AS 
BEGIN
INSERT INTO [dbo].[Payments]
           ([ID]
           ,[Concept]
           ,[QtyProducts]
           ,[From]
           ,[To]
           ,[Total]
           ,[StatusID])
     VALUES
           (@ID,
			@Concept,
			@QtyProducts,
			@From,
			@To,
			@Total,
			@StatusID)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetPaymentByID]    Script Date: 13/08/2024 17:43:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetPaymentByID]
@ID uniqueidentifier
AS 
BEGIN
SELECT [ID]
      ,[Concept]
      ,[QtyProducts]
      ,[From]
      ,[Total]
      ,[StatusID]
	  ,[CreatedOn]
	  ,[UpdatedOn]
  FROM [dbo].[Payments]
  WHERE ID = @ID;

END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdatePaymentStatus]    Script Date: 13/08/2024 17:43:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_UpdatePaymentStatus]
@ID uniqueidentifier,
@StatusID int
AS 
BEGIN
UPDATE [dbo].[Payments]
   SET [StatusID] = @StatusID,
       [UpdatedOn] = GETDATE()
 WHERE ID = @ID;
END
GO
USE [master]
GO
ALTER DATABASE [BancoBase] SET  READ_WRITE 
GO
