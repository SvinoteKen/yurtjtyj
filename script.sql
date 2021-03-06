USE [master]
GO
/****** Object:  Database [TRAVEL]    Script Date: 13.12.2021 10:53:51 ******/
CREATE DATABASE [TRAVEL]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TRAVEL', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TRAVEL.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TRAVEL_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TRAVEL_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TRAVEL] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TRAVEL].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TRAVEL] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TRAVEL] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TRAVEL] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TRAVEL] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TRAVEL] SET ARITHABORT OFF 
GO
ALTER DATABASE [TRAVEL] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TRAVEL] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TRAVEL] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TRAVEL] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TRAVEL] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TRAVEL] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TRAVEL] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TRAVEL] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TRAVEL] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TRAVEL] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TRAVEL] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TRAVEL] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TRAVEL] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TRAVEL] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TRAVEL] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TRAVEL] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TRAVEL] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TRAVEL] SET RECOVERY FULL 
GO
ALTER DATABASE [TRAVEL] SET  MULTI_USER 
GO
ALTER DATABASE [TRAVEL] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TRAVEL] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TRAVEL] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TRAVEL] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TRAVEL] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TRAVEL] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TRAVEL', N'ON'
GO
ALTER DATABASE [TRAVEL] SET QUERY_STORE = OFF
GO
USE [TRAVEL]
GO
/****** Object:  Table [dbo].[HOTEL_CATEGORY]    Script Date: 13.12.2021 10:53:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOTEL_CATEGORY](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[CATEGORY] [char](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HOTEL]    Script Date: 13.12.2021 10:53:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOTEL](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[HOTEL_NAME] [char](30) NOT NULL,
	[COUNTRY_ID] [smallint] NOT NULL,
	[HOTELCATEGORY_ID] [smallint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_1]    Script Date: 13.12.2021 10:53:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_1]
AS
SELECT        dbo.HOTEL.HOTEL_NAME, dbo.HOTEL.COUNTRY_ID, dbo.HOTEL_CATEGORY.CATEGORY
FROM            dbo.HOTEL_CATEGORY INNER JOIN
                         dbo.HOTEL ON dbo.HOTEL_CATEGORY.ID = dbo.HOTEL.HOTELCATEGORY_ID
WHERE        (dbo.HOTEL.HOTELCATEGORY_ID = 1)
GO
/****** Object:  Table [dbo].[COMPANY]    Script Date: 13.12.2021 10:53:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMPANY](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[NAME_C] [char](20) NOT NULL,
	[ADRES] [char](80) NOT NULL,
	[EMAIL] [char](40) NULL,
	[PHONE] [char](20) NULL,
	[FULLNAME_MANAGER] [char](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COUNTRY]    Script Date: 13.12.2021 10:53:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COUNTRY](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[COUNTRY] [char](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CUSTOMER]    Script Date: 13.12.2021 10:53:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CUSTOMER](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[LAST_NAME] [char](15) NOT NULL,
	[MIDDLE_NAME] [char](15) NOT NULL,
	[FIRST_NAME] [char](15) NOT NULL,
	[PHONE] [char](20) NULL,
	[PASSPORT] [char](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TOUR]    Script Date: 13.12.2021 10:53:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TOUR](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[CITY] [char](30) NOT NULL,
	[TOUR_NAME] [char](50) NOT NULL,
	[DURATION] [int] NOT NULL,
	[PRICE] [int] NOT NULL,
	[TOURTYPE_ID] [smallint] NOT NULL,
	[COUNTRY_ID] [smallint] NOT NULL,
	[HOTELCATEGORY_ID] [smallint] NOT NULL,
	[HOTEL_ID] [smallint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TOUR_TYPE]    Script Date: 13.12.2021 10:53:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TOUR_TYPE](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[TOUR_TYPE] [char](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRIP]    Script Date: 13.12.2021 10:53:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRIP](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[BEGIN_DATE] [date] NOT NULL,
	[EXPIRATION_DATE] [date] NOT NULL,
	[AMOUNT] [int] NOT NULL,
	[PRICE] [int] NOT NULL,
	[TOUR_ID] [smallint] NOT NULL,
	[HOTEL_ID] [smallint] NOT NULL,
	[COMPANY_ID] [smallint] NOT NULL,
	[CUSTOMER_ID] [smallint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[TOUR_ID] ASC,
	[HOTEL_ID] ASC,
	[COMPANY_ID] ASC,
	[CUSTOMER_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[HOTEL]  WITH CHECK ADD FOREIGN KEY([COUNTRY_ID])
REFERENCES [dbo].[COUNTRY] ([ID])
GO
ALTER TABLE [dbo].[HOTEL]  WITH CHECK ADD FOREIGN KEY([HOTELCATEGORY_ID])
REFERENCES [dbo].[HOTEL_CATEGORY] ([ID])
GO
ALTER TABLE [dbo].[TOUR]  WITH CHECK ADD FOREIGN KEY([COUNTRY_ID])
REFERENCES [dbo].[COUNTRY] ([ID])
GO
ALTER TABLE [dbo].[TOUR]  WITH CHECK ADD FOREIGN KEY([HOTEL_ID])
REFERENCES [dbo].[HOTEL] ([ID])
GO
ALTER TABLE [dbo].[TOUR]  WITH CHECK ADD FOREIGN KEY([HOTELCATEGORY_ID])
REFERENCES [dbo].[HOTEL_CATEGORY] ([ID])
GO
ALTER TABLE [dbo].[TOUR]  WITH CHECK ADD FOREIGN KEY([TOURTYPE_ID])
REFERENCES [dbo].[TOUR_TYPE] ([ID])
GO
ALTER TABLE [dbo].[TRIP]  WITH CHECK ADD FOREIGN KEY([COMPANY_ID])
REFERENCES [dbo].[COMPANY] ([ID])
GO
ALTER TABLE [dbo].[TRIP]  WITH CHECK ADD FOREIGN KEY([CUSTOMER_ID])
REFERENCES [dbo].[CUSTOMER] ([ID])
GO
ALTER TABLE [dbo].[TRIP]  WITH CHECK ADD FOREIGN KEY([HOTEL_ID])
REFERENCES [dbo].[HOTEL] ([ID])
GO
ALTER TABLE [dbo].[TRIP]  WITH CHECK ADD FOREIGN KEY([TOUR_ID])
REFERENCES [dbo].[TOUR] ([ID])
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "HOTEL_CATEGORY"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 102
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HOTEL"
            Begin Extent = 
               Top = 6
               Left = 250
               Bottom = 136
               Right = 450
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
USE [master]
GO
ALTER DATABASE [TRAVEL] SET  READ_WRITE 
GO
