/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2014 (12.0.5557)
    Source Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [HUBSPOT]
GO
/****** Object:  Table [dbo].[SL_BaseNameFull]    Script Date: 18/05/2018 09:46:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SL_BaseNameFull](
	[Brand] [varchar](50) NULL,
	[BrandAreaCode] [varchar](50) NULL,
	[BaseCode] [varchar](50) NULL,
	[BaseName] [varchar](50) NULL,
	[AreaCountry] [varchar](50) NULL,
	[Region] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SL_EFSITE_PRODUCT_INTEREST]    Script Date: 18/05/2018 09:46:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SL_EFSITE_PRODUCT_INTEREST](
	[BrandName] [varchar](50) NOT NULL,
	[EFSITE] [nvarchar](2) NOT NULL,
	[ProductInterest] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SL_HUBSPOT_FIELD_NAMES]    Script Date: 18/05/2018 09:46:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SL_HUBSPOT_FIELD_NAMES](
	[QueryFieldName] [nvarchar](100) NULL,
	[Moorings] [nvarchar](100) NULL,
	[Sunsail] [nvarchar](100) NULL,
	[Footloose] [nvarchar](100) NULL,
	[LeBoat] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SL_ISO_SalesOffice]    Script Date: 18/05/2018 09:46:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SL_ISO_SalesOffice](
	[ISO_Code] [nvarchar](2) NOT NULL,
	[Language] [varchar](50) NOT NULL,
	[CountryOfResidence] [varchar](50) NOT NULL,
	[SalesOffice] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SL_Simplified_BrochureName]    Script Date: 18/05/2018 09:46:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SL_Simplified_BrochureName](
	[BrochureNameActual] [varchar](50) NULL,
	[BrochureNameSimplified] [varchar](50) NULL,
	[BrandName] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SL_Simplified_ClientBookingOffice]    Script Date: 18/05/2018 09:46:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SL_Simplified_ClientBookingOffice](
	[ClientBookingOfficeActual] [varchar](50) NULL,
	[ClientBookingOfficeSimplified] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SL_Simplified_Country]    Script Date: 18/05/2018 09:46:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SL_Simplified_Country](
	[CountryActual] [nvarchar](50) NOT NULL,
	[CountrySimplified] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SL_Simplified_Country_Language_SourceOffice]    Script Date: 18/05/2018 09:46:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SL_Simplified_Country_Language_SourceOffice](
	[CountrySimplified_Language] [varchar](100) NULL,
	[SourceOffice] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SL_Simplified_Language]    Script Date: 18/05/2018 09:46:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SL_Simplified_Language](
	[LanguageActual] [varchar](50) NULL,
	[LanguageSimplified] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SL_Simplified_Neptune_Client_Country]    Script Date: 18/05/2018 09:46:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SL_Simplified_Neptune_Client_Country](
	[CountryActual] [varchar](50) NULL,
	[CountrySimplified] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SL_Simplified_ProductName]    Script Date: 18/05/2018 09:46:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SL_Simplified_ProductName](
	[ProductNameActual] [nvarchar](50) NULL,
	[ProductNameSimplified] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SL_Simplified_SalesOffice]    Script Date: 18/05/2018 09:46:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SL_Simplified_SalesOffice](
	[BrandName] [varchar](50) NOT NULL,
	[SalesOfficeFromRawData] [varchar](50) NOT NULL,
	[SalesOfficeSimplified] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SL_Simplified_Title]    Script Date: 18/05/2018 09:46:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SL_Simplified_Title](
	[TitleActual] [nvarchar](50) NULL,
	[TitleSimplified] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SL_Simplified_Triton_Client_Country]    Script Date: 18/05/2018 09:46:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SL_Simplified_Triton_Client_Country](
	[CountryActual] [varchar](50) NULL,
	[CountrySimplified] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ST_ERROR_LOG]    Script Date: 18/05/2018 09:46:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ST_ERROR_LOG](
	[Brand] [varchar](50) NULL,
	[LifeCycleStage] [varchar](50) NULL,
	[ClientCode] [varchar](50) NULL,
	[VID] [int] NULL,
	[Email] [nvarchar](200) NULL,
	[IsNew] [bit] NULL,
	[Status] [varchar](10) NULL,
	[Error_Msg] [nvarchar](4000) NULL,
	[LogDate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ST_ERROR_LOG] ADD  CONSTRAINT [DF_ST_ERROR_LOG_LogDate]  DEFAULT (getdate()) FOR [LogDate]
GO
