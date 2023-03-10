USE [master]
GO
/****** Object:  Database [EnokaChallengeDb]    Script Date: 18.02.2023 16:36:15 ******/
CREATE DATABASE [EnokaChallengeDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EnokaChallengeDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\EnokaChallengeDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EnokaChallengeDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\EnokaChallengeDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [EnokaChallengeDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EnokaChallengeDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EnokaChallengeDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EnokaChallengeDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EnokaChallengeDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EnokaChallengeDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EnokaChallengeDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [EnokaChallengeDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EnokaChallengeDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EnokaChallengeDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EnokaChallengeDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EnokaChallengeDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EnokaChallengeDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EnokaChallengeDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EnokaChallengeDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EnokaChallengeDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EnokaChallengeDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [EnokaChallengeDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EnokaChallengeDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EnokaChallengeDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EnokaChallengeDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EnokaChallengeDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EnokaChallengeDb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [EnokaChallengeDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EnokaChallengeDb] SET RECOVERY FULL 
GO
ALTER DATABASE [EnokaChallengeDb] SET  MULTI_USER 
GO
ALTER DATABASE [EnokaChallengeDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EnokaChallengeDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EnokaChallengeDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EnokaChallengeDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EnokaChallengeDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EnokaChallengeDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'EnokaChallengeDb', N'ON'
GO
ALTER DATABASE [EnokaChallengeDb] SET QUERY_STORE = OFF
GO
USE [EnokaChallengeDb]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 18.02.2023 16:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Firmalar]    Script Date: 18.02.2023 16:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Firmalar](
	[FirmaID] [int] IDENTITY(1,1) NOT NULL,
	[FirmaAdi] [nvarchar](max) NOT NULL,
	[OnayDurum] [bit] NOT NULL,
	[SiparisIzinBaslangicSaat] [datetime2](7) NOT NULL,
	[SiparisIzinBitisSaat] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Firmalar] PRIMARY KEY CLUSTERED 
(
	[FirmaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Siparisler]    Script Date: 18.02.2023 16:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Siparisler](
	[SiparisID] [int] IDENTITY(1,1) NOT NULL,
	[SiparisVerenKisiAdi] [nvarchar](max) NOT NULL,
	[SiparisTarihi] [datetime2](7) NOT NULL,
	[FirmaID] [int] NOT NULL,
	[UrunID] [int] NOT NULL,
 CONSTRAINT [PK_Siparisler] PRIMARY KEY CLUSTERED 
(
	[SiparisID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Urunler]    Script Date: 18.02.2023 16:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Urunler](
	[UrunID] [int] IDENTITY(1,1) NOT NULL,
	[UrunAdi] [nvarchar](max) NOT NULL,
	[Stok] [int] NOT NULL,
	[Fiyat] [float] NOT NULL,
	[FirmaID] [int] NOT NULL,
 CONSTRAINT [PK_Urunler] PRIMARY KEY CLUSTERED 
(
	[UrunID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230217153026_firstmigration', N'7.0.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230217202322_timespanmig', N'7.0.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230217202539_timespanmig2', N'7.0.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230217204339_datetimemig1', N'7.0.3')
GO
SET IDENTITY_INSERT [dbo].[Firmalar] ON 

INSERT [dbo].[Firmalar] ([FirmaID], [FirmaAdi], [OnayDurum], [SiparisIzinBaslangicSaat], [SiparisIzinBitisSaat]) VALUES (2, N'deneme1', 1, CAST(N'1900-01-01T16:50:03.5050000' AS DateTime2), CAST(N'1900-01-01T16:50:03.5050000' AS DateTime2))
INSERT [dbo].[Firmalar] ([FirmaID], [FirmaAdi], [OnayDurum], [SiparisIzinBaslangicSaat], [SiparisIzinBitisSaat]) VALUES (4, N'test3', 1, CAST(N'1900-01-01T18:58:12.1540000' AS DateTime2), CAST(N'1900-01-01T18:58:12.1540000' AS DateTime2))
INSERT [dbo].[Firmalar] ([FirmaID], [FirmaAdi], [OnayDurum], [SiparisIzinBaslangicSaat], [SiparisIzinBitisSaat]) VALUES (5, N'yenitest', 1, CAST(N'1900-01-01T19:16:01.9650000' AS DateTime2), CAST(N'1900-01-01T19:16:01.9650000' AS DateTime2))
INSERT [dbo].[Firmalar] ([FirmaID], [FirmaAdi], [OnayDurum], [SiparisIzinBaslangicSaat], [SiparisIzinBitisSaat]) VALUES (6, N'testsaat', 1, CAST(N'2023-02-17T23:48:24.9200000' AS DateTime2), CAST(N'2023-02-17T00:48:24.9200000' AS DateTime2))
INSERT [dbo].[Firmalar] ([FirmaID], [FirmaAdi], [OnayDurum], [SiparisIzinBaslangicSaat], [SiparisIzinBitisSaat]) VALUES (7, N'string', 1, CAST(N'2023-02-17T00:05:09.4110000' AS DateTime2), CAST(N'2023-02-17T00:10:05.4110000' AS DateTime2))
INSERT [dbo].[Firmalar] ([FirmaID], [FirmaAdi], [OnayDurum], [SiparisIzinBaslangicSaat], [SiparisIzinBitisSaat]) VALUES (8, N'hüseyin AŞ', 1, CAST(N'2023-02-18T08:00:00.3940000' AS DateTime2), CAST(N'2023-02-18T18:00:00.3940000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Firmalar] OFF
GO
SET IDENTITY_INSERT [dbo].[Siparisler] ON 

INSERT [dbo].[Siparisler] ([SiparisID], [SiparisVerenKisiAdi], [SiparisTarihi], [FirmaID], [UrunID]) VALUES (3, N'Mehmet Emin Kesmen', CAST(N'1900-01-01T20:01:58.8050000' AS DateTime2), 4, 3)
INSERT [dbo].[Siparisler] ([SiparisID], [SiparisVerenKisiAdi], [SiparisTarihi], [FirmaID], [UrunID]) VALUES (5, N'Ziyacan Aydın', CAST(N'1900-01-01T20:01:58.8050000' AS DateTime2), 2, 1)
INSERT [dbo].[Siparisler] ([SiparisID], [SiparisVerenKisiAdi], [SiparisTarihi], [FirmaID], [UrunID]) VALUES (6, N'testdeneme1', CAST(N'2023-02-17T00:10:43.1520000' AS DateTime2), 7, 1)
INSERT [dbo].[Siparisler] ([SiparisID], [SiparisVerenKisiAdi], [SiparisTarihi], [FirmaID], [UrunID]) VALUES (7, N'testdeneme1', CAST(N'2023-02-17T00:01:43.1520000' AS DateTime2), 7, 1)
INSERT [dbo].[Siparisler] ([SiparisID], [SiparisVerenKisiAdi], [SiparisTarihi], [FirmaID], [UrunID]) VALUES (8, N'testdeneme1', CAST(N'2023-02-17T01:30:43.1520000' AS DateTime2), 7, 1)
INSERT [dbo].[Siparisler] ([SiparisID], [SiparisVerenKisiAdi], [SiparisTarihi], [FirmaID], [UrunID]) VALUES (9, N'asdads', CAST(N'2023-02-17T21:08:54.1650000' AS DateTime2), 7, 1)
INSERT [dbo].[Siparisler] ([SiparisID], [SiparisVerenKisiAdi], [SiparisTarihi], [FirmaID], [UrunID]) VALUES (10, N'string', CAST(N'2023-02-17T21:09:48.6550000' AS DateTime2), 7, 1)
INSERT [dbo].[Siparisler] ([SiparisID], [SiparisVerenKisiAdi], [SiparisTarihi], [FirmaID], [UrunID]) VALUES (11, N'string', CAST(N'2023-02-17T00:06:49.2600000' AS DateTime2), 7, 1)
INSERT [dbo].[Siparisler] ([SiparisID], [SiparisVerenKisiAdi], [SiparisTarihi], [FirmaID], [UrunID]) VALUES (12, N'string', CAST(N'2023-02-15T00:06:49.2600000' AS DateTime2), 7, 1)
INSERT [dbo].[Siparisler] ([SiparisID], [SiparisVerenKisiAdi], [SiparisTarihi], [FirmaID], [UrunID]) VALUES (13, N'mehmet', CAST(N'2023-02-18T08:01:00.3980000' AS DateTime2), 8, 3)
SET IDENTITY_INSERT [dbo].[Siparisler] OFF
GO
SET IDENTITY_INSERT [dbo].[Urunler] ON 

INSERT [dbo].[Urunler] ([UrunID], [UrunAdi], [Stok], [Fiyat], [FirmaID]) VALUES (1, N'urun1', 15, 50, 2)
INSERT [dbo].[Urunler] ([UrunID], [UrunAdi], [Stok], [Fiyat], [FirmaID]) VALUES (3, N'urun3', 45, 150, 2)
SET IDENTITY_INSERT [dbo].[Urunler] OFF
GO
/****** Object:  Index [IX_Siparisler_UrunID]    Script Date: 18.02.2023 16:36:15 ******/
CREATE NONCLUSTERED INDEX [IX_Siparisler_UrunID] ON [dbo].[Siparisler]
(
	[UrunID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Urunler_FirmaID]    Script Date: 18.02.2023 16:36:15 ******/
CREATE NONCLUSTERED INDEX [IX_Urunler_FirmaID] ON [dbo].[Urunler]
(
	[FirmaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Siparisler]  WITH CHECK ADD  CONSTRAINT [FK_Siparisler_Urunler_UrunID] FOREIGN KEY([UrunID])
REFERENCES [dbo].[Urunler] ([UrunID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Siparisler] CHECK CONSTRAINT [FK_Siparisler_Urunler_UrunID]
GO
ALTER TABLE [dbo].[Urunler]  WITH CHECK ADD  CONSTRAINT [FK_Urunler_Firmalar_FirmaID] FOREIGN KEY([FirmaID])
REFERENCES [dbo].[Firmalar] ([FirmaID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Urunler] CHECK CONSTRAINT [FK_Urunler_Firmalar_FirmaID]
GO
USE [master]
GO
ALTER DATABASE [EnokaChallengeDb] SET  READ_WRITE 
GO
