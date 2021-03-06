USE [master]
GO
/****** Object:  Database [Assignment3]    Script Date: 2022-01-10 12:05:39 ******/
CREATE DATABASE [Assignment3]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Assignment3', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Assignment3.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Assignment3_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Assignment3_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Assignment3] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Assignment3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Assignment3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Assignment3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Assignment3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Assignment3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Assignment3] SET ARITHABORT OFF 
GO
ALTER DATABASE [Assignment3] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Assignment3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Assignment3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Assignment3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Assignment3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Assignment3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Assignment3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Assignment3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Assignment3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Assignment3] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Assignment3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Assignment3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Assignment3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Assignment3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Assignment3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Assignment3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Assignment3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Assignment3] SET RECOVERY FULL 
GO
ALTER DATABASE [Assignment3] SET  MULTI_USER 
GO
ALTER DATABASE [Assignment3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Assignment3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Assignment3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Assignment3] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Assignment3] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Assignment3] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Assignment3', N'ON'
GO
ALTER DATABASE [Assignment3] SET QUERY_STORE = OFF
GO
USE [Assignment3]
GO
/****** Object:  User [usera3]    Script Date: 2022-01-10 12:05:39 ******/
CREATE USER [usera3] FOR LOGIN [usera3] WITH DEFAULT_SCHEMA=[usera3]
GO
ALTER ROLE [db_owner] ADD MEMBER [usera3]
GO
/****** Object:  Schema [usera3]    Script Date: 2022-01-10 12:05:39 ******/
CREATE SCHEMA [usera3]
GO
/****** Object:  Table [dbo].[Label]    Script Date: 2022-01-10 12:05:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Label](
	[Organisation] [varchar](255) NOT NULL,
	[Earnings] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Organisation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Artist]    Script Date: 2022-01-10 12:05:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Artist](
	[Name] [varchar](255) NOT NULL,
	[Label] [varchar](255) NULL,
	[Famefactor] [int] NULL,
	[Founded] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Song]    Script Date: 2022-01-10 12:05:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Song](
	[Title] [varchar](255) NOT NULL,
	[Artist] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[artistdata]    Script Date: 2022-01-10 12:05:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[artistdata] 
            AS 
            SELECT 
                name, 
                label, 
				title,
				FameFactor
            FROM 
                [Assignment3].[dbo].[Artist] AS art
            INNER JOIN [Assignment3].[dbo].[Label] AS label 
                ON label.organisation = art.label
            INNER JOIN [Assignment3].[dbo].[Song] AS song
                ON song.artist = art.name
GO
ALTER TABLE [dbo].[Artist]  WITH CHECK ADD FOREIGN KEY([Label])
REFERENCES [dbo].[Label] ([Organisation])
GO
ALTER TABLE [dbo].[Song]  WITH CHECK ADD FOREIGN KEY([Artist])
REFERENCES [dbo].[Artist] ([Name])
GO
USE [master]
GO
ALTER DATABASE [Assignment3] SET  READ_WRITE 
GO
