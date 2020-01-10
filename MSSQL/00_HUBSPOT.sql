/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2014 (12.0.5557)
    Source Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/

USE [master]
GO
/****** Object:  Database [HUBSPOT]    Script Date: 12/04/2019 10:06:51 ******/
CREATE DATABASE [HUBSPOT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HUBSPOT', FILENAME = N'D:\SQLFiles\MSSQL.MSSQLSERVER.Data\HUBSPOT.mdf' , SIZE = 269632KB , MAXSIZE = UNLIMITED, FILEGROWTH = 262144KB )
 LOG ON 
( NAME = N'HUBSPOT_log', FILENAME = N'L:\SQLFiles\MSSQL.MSSQLSERVER.Log\HUBSPOT_log.ldf' , SIZE = 255880KB , MAXSIZE = 2048GB , FILEGROWTH = 1024000KB )
GO
ALTER DATABASE [HUBSPOT] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HUBSPOT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HUBSPOT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HUBSPOT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HUBSPOT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HUBSPOT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HUBSPOT] SET ARITHABORT OFF 
GO
ALTER DATABASE [HUBSPOT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HUBSPOT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HUBSPOT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HUBSPOT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HUBSPOT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HUBSPOT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HUBSPOT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HUBSPOT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HUBSPOT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HUBSPOT] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HUBSPOT] SET AUTO_UPDATE_STATISTICS_ASYNC ON 
GO
ALTER DATABASE [HUBSPOT] SET DATE_CORRELATION_OPTIMIZATION ON 
GO
ALTER DATABASE [HUBSPOT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HUBSPOT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HUBSPOT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HUBSPOT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HUBSPOT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HUBSPOT] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HUBSPOT] SET  MULTI_USER 
GO
ALTER DATABASE [HUBSPOT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HUBSPOT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HUBSPOT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HUBSPOT] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [HUBSPOT] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'HUBSPOT', N'ON'
GO
USE [HUBSPOT]
GO
/****** Object:  UserDefinedDataType [dbo].[HugeMoney]    Script Date: 12/04/2019 10:06:52 ******/
CREATE TYPE [dbo].[HugeMoney] FROM [decimal](28, 4) NULL
GO
/****** Object:  UserDefinedFunction [dbo].[fn_convertDate]    Script Date: 12/04/2019 10:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


--========================================================================================================================
-- Procedure Date - Procedure Description
-- 28-Nov-2017      fn_convertDate - converts a datetime date to a varchar date, e.g. '31-12-2017'
--
--========================================================================================================================
-- Change History===
--========================================================================================================================
-- Date             Version     Who                Comment
-- 19-Jun-2018      1.0         Tim Wilson         New function
--
--========================================================================================================================

CREATE FUNCTION [dbo].[fn_convertDate] (@dateInput datetime, @outputFormat varchar(10))
RETURNS varchar(50)
AS
BEGIN
   DECLARE
		@result as varchar(50)

		SET @result = ''

		IF @outputFormat = 'unix'
		BEGIN
			SET @result =
				CASE
					WHEN @dateInput IS NULL THEN ''
					ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01',@dateInput))*60*60*1000)
				END
		END

		IF @outputFormat = 'date'
		BEGIN
			SET @result =
				CASE
					WHEN @dateInput IS NULL THEN ''
					ELSE CONVERT(VARCHAR(10),@dateInput,120)
				END
		END

     RETURN (@result)
END	

GO
/****** Object:  UserDefinedFunction [dbo].[fn_convertDateFromInteger]    Script Date: 12/04/2019 10:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


--========================================================================================================================
-- Procedure Date - Procedure Description
-- 28-Nov-2017      fn_convertDateFromInteger - converts integer date, e.g. 20171231, to a varchar date, e.g. '31-12-2017'
--
--========================================================================================================================
-- Change History===
--========================================================================================================================
-- Date             Version     Who                Comment
-- 19-Jun-2018      1.0         Tim Wilson         New function
--
--========================================================================================================================

CREATE FUNCTION [dbo].[fn_convertDateFromInteger] (@dateInput int, @outputFormat varchar(10))
RETURNS varchar(50)
AS
BEGIN
   DECLARE
		@result as varchar(50)

		SET @result = ''

		IF @outputFormat = 'unix'
		BEGIN
			SET @result =
				CASE
					WHEN @dateInput IS NULL OR @dateInput = 0 THEN ''
					ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', CONVERT(DATETIME, CONVERT(VARCHAR(8), @dateInput), 112)))*60*60*1000)
					END
		END

		IF @outputFormat = 'date'
		BEGIN
			SET @result =
				CASE
					WHEN @dateInput IS NULL OR @dateInput = 0 THEN ''
					ELSE CONVERT(VARCHAR(10),CONVERT(DATETIME, CONVERT(VARCHAR(8), @dateInput), 112),120)
				END
		END

     RETURN (@result)
END	

GO
/****** Object:  UserDefinedFunction [dbo].[fn_convertDateFromText]    Script Date: 12/04/2019 10:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


--========================================================================================================================
-- Procedure Date - Procedure Description
-- 28-Nov-2017      fn_convertDateFromText - changes format of a varchar date, e.g. from '31/12/2017' to '31-12-2017'
--
--========================================================================================================================
-- Change History===
--========================================================================================================================
-- Date             Version     Who                Comment
-- 19-Jun-2018      1.0         Tim Wilson         New function
--
--========================================================================================================================

CREATE FUNCTION [dbo].[fn_convertDateFromText] (@dateInput varchar(50), @outputFormat varchar(10))
RETURNS varchar(50)
AS
BEGIN
   DECLARE
		@result as varchar(50)

		SET @result = ''

		IF @outputFormat = 'unix'
		BEGIN
			SET @result =
				CASE
					WHEN (ISNULL(@dateInput,'') = '' OR @dateInput NOT LIKE '__/__/____' OR @dateInput = '01/01/0000' OR @dateInput = '01/01/0001') THEN ''
					ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', CONVERT(DATETIME, @dateInput, 103)))*60*60*1000)
				END
		END

		IF @outputFormat = 'date'
		BEGIN
			SET @result =
				CASE
					WHEN (ISNULL(@dateInput,'') = '' OR @dateInput NOT LIKE '__/__/____' OR @dateInput = '01/01/0000' OR @dateInput = '01/01/0001') THEN ''
					ELSE CONVERT(VARCHAR(10), CONVERT(DATE,@dateInput,103), 120)
				END
		END

     RETURN (@result)
END	

GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetField]    Script Date: 12/04/2019 10:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--========================================================================================================================
-- Procedure Date - Procedure Description
-- 31-Jan-2019      fn_GetField - extract a specified field from a passed delimited string using a specified delimiter string
--                  To specify a space character as a delimiter pass '\S'
-- e.g. SELECT dbo.fn_GetField('NPT-10001683-1-lb', '-', 2) will return 10001683
--
--========================================================================================================================
-- Change History===
--========================================================================================================================
-- Date             Version     Who                Comment
-- 31-Jan-2019      1.0         Tim Wilson         New function
--
--========================================================================================================================

CREATE FUNCTION [dbo].[fn_GetField]
(
	@rowdata varchar(500),
	@delim varchar(5),
	@fieldno integer
)  
RETURNS varchar(500)
AS  
BEGIN 
    DECLARE @ctr int,
	        @result varchar(500),
			@data varchar(500);

	/* Preserve any space characters, they might be delimiters
	SET @rowdata = LTRIM(RTRIM(@rowdata));
	*/
	SET @delim   = UPPER(LTRIM(RTRIM(@delim)));
	IF @delim = '\S'
	BEGIN
		SET @delim = ' ';
	END
	
    SET @ctr = 1;
    SET @result = '';

    WHILE (CHARINDEX(@delim, @rowdata)>0) AND @ctr <= @fieldno
    BEGIN
        SET @data = LTRIM(RTRIM(SUBSTRING(@rowdata, 1, CHARINDEX(@delim, @rowdata) - 1)));

        SET @rowdata = SUBSTRING(@rowdata, CHARINDEX(@delim, @rowdata) + LEN(@delim), LEN(@rowdata));
		IF @ctr = @fieldno
		BEGIN
			SET @result = @data;
		END
		SET @ctr = @ctr + 1;
    END
	
    SET @data = LTRIM(RTRIM(@rowdata));
	IF @ctr = @fieldno
	BEGIN
		SET @result = @data;
	END

	RETURN @result;
END

GO
/****** Object:  Table [dbo].[SL_BaseNameFull]    Script Date: 12/04/2019 10:06:52 ******/
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
/****** Object:  Table [dbo].[SL_EFSITE_PRODUCT_INTEREST]    Script Date: 12/04/2019 10:06:52 ******/
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
/****** Object:  Table [dbo].[SL_HUBSPOT_FIELD_NAMES]    Script Date: 12/04/2019 10:06:52 ******/
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
/****** Object:  Table [dbo].[SL_ISO_SalesOffice]    Script Date: 12/04/2019 10:06:52 ******/
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
/****** Object:  Table [dbo].[SL_Simplified_BrochureName]    Script Date: 12/04/2019 10:06:52 ******/
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
/****** Object:  Table [dbo].[SL_Simplified_ClientBookingOffice]    Script Date: 12/04/2019 10:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SL_Simplified_ClientBookingOffice](
	[ClientBookingOfficeActual] [varchar](50) NULL,
	[ClientBookingOfficeSimplified] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SL_Simplified_Country]    Script Date: 12/04/2019 10:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SL_Simplified_Country](
	[CountryActual] [nvarchar](50) NOT NULL,
	[CountrySimplified] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SL_Simplified_Country_Language_SourceOffice]    Script Date: 12/04/2019 10:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SL_Simplified_Country_Language_SourceOffice](
	[CountrySimplified_Language] [varchar](100) NULL,
	[SourceOffice] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SL_Simplified_Language]    Script Date: 12/04/2019 10:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SL_Simplified_Language](
	[LanguageActual] [varchar](50) NULL,
	[LanguageSimplified] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SL_Simplified_Neptune_Client_Country]    Script Date: 12/04/2019 10:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SL_Simplified_Neptune_Client_Country](
	[CountryActual] [varchar](50) NULL,
	[CountrySimplified] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SL_Simplified_ProductName]    Script Date: 12/04/2019 10:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SL_Simplified_ProductName](
	[ProductNameActual] [nvarchar](50) NULL,
	[ProductNameSimplified] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SL_Simplified_SalesOffice]    Script Date: 12/04/2019 10:06:52 ******/
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
/****** Object:  Table [dbo].[SL_Simplified_Title]    Script Date: 12/04/2019 10:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SL_Simplified_Title](
	[TitleActual] [nvarchar](50) NULL,
	[TitleSimplified] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SL_Simplified_Triton_Client_Country]    Script Date: 12/04/2019 10:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SL_Simplified_Triton_Client_Country](
	[CountryActual] [varchar](50) NULL,
	[CountrySimplified] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ST_ERROR_LOG]    Script Date: 12/04/2019 10:06:52 ******/
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
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_NEPTUNE_BOOKINGS]    Script Date: 12/04/2019 10:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--========================================================================================================================
-- Procedure Date - Procedure Description
-- 01-Dec-2017      BUILD_HUBSPOT_NEPTUNE_BOOKINGS - Selects Neptune booking records for HubSpot upload
--
--========================================================================================================================
-- Change History===
--========================================================================================================================
-- Date             Version     Who                Comment
-- 01-Dec-2017      1.0         Tim Wilson         Original Version    
-- 04-Jan-2018      1.1         Tim Wilson         First Charter selection now ge 01/01/2010
-- 19-Feb-2018      1.2         Tim Wilson         New selection criterion for [ST_MARINE_BOOKINGS].BookingSourcePrimary
-- 20-Mar-2018      1.3         Tim Wilson         Remove selection filter for Deceased flag
-- 17-May-2018      1.4         Tim Wilson         Select all data from 01-01-2010
-- 17-May-2018      1.5         Tim Wilson         Output dates in yyyy-mm-dd format
-- 21-May-2018      1.6         Tim Wilson         Corrections for dedup logic
-- 13-Jun-2018      1.7         Tim Wilson         Recoded email-centrically and using temp tables for clarity
--========================================================================================================================

CREATE PROC [dbo].[BUILD_HUBSPOT_NEPTUNE_BOOKINGS] @pStartDate varchar(10) = NULL , @pEndDate varchar(10) = NULL, @pDateFormat varchar(10) = NULL
/* @pStartDate and @pEndDate are either a date string with format 'yyyy-mm-dd' or the word 'TODAY' for the current date */
AS
BEGIN

	DECLARE @startDate date, @endDate date, @dateFormat varchar(10)

	SET NOCOUNT ON;

	IF @pStartDate = 'TODAY'
	BEGIN
		SET @startDate = CONVERT(DATE,GETDATE())
	END
	ELSE
	BEGIN
		-- Default to 10 days ago
		SET @startDate = ISNULL(CONVERT(DATE,@pStartDate,120), CONVERT(DATE,GETDATE()-10))
	END

	IF @pEndDate = 'TODAY'
	BEGIN
		SET @endDate   = CONVERT(DATE,GETDATE())
	END
	ELSE
	BEGIN
		-- Default to yesterday
		SET @endDate   = ISNULL(CONVERT(DATE,@pEndDate,120), CONVERT(DATE,GETDATE()-1))
	END

	SET @dateFormat    = ISNULL(@pDateFormat, 'unix')

	IF OBJECT_ID('tempdb..#ClientPreferences') IS NOT NULL
		DROP TABLE #ClientPreferences

	SELECT
		 ClientCode
		,CancelFromBrochure
		,CancelFromMailing
		,CancelFromEmail
		,CancelFromTelephone
		,CancelFromEnews
		,CancelFromSMS
	INTO #ClientPreferences
	FROM
	(
		SELECT
			 [ClientCode]
			,MAX(ISNULL([CancelFromBrochure],'')) CancelFromBrochure
			,MAX(ISNULL([CancelFromMailing],'')) CancelFromMailing
			,MAX(ISNULL([CancelFromEmail],'')) CancelFromEmail
			,MAX(ISNULL([CancelFromTelephone],'')) CancelFromTelephone
			,MAX(ISNULL([CancelFromEnews],'')) CancelFromEnews
			,MAX(ISNULL([CancelFromSMS],'')) CancelFromSMS
		FROM [NEPTUNE_Stage].[dbo].[ST_MARINE_CLIENT_PREFERENCE] WITH (NOLOCK)
		GROUP BY ClientCode
	) ClientPreferencesInnerSelect

	IF OBJECT_ID('tempdb..#Clients') IS NOT NULL
		DROP TABLE #Clients

	SELECT 
		 ClientCode
		,REPLACE(Email1,'\@','@') AS ClientEmail
		,Lead
		,Title
        ,FirstName
        ,LastName
        ,City
        ,County
        ,Postcode
		,Country
        ,Add1
        ,Add2
        ,Add3
        ,Phone1
        ,Phone2
        ,MobilePhone
        ,DateOfBirth
		,MailNo
		,Deceased
		,Blacklisted
	INTO #Clients
	FROM [NEPTUNE_Stage].[dbo].[ST_MARINE_CLIENTS] WITH (NOLOCK)
    INNER JOIN [NEPTUNE_Stage].[dbo].[NEPTUNE_MAIL_CONTACT] WITH (NOLOCK) 
        ON [NEPTUNE_MAIL_CONTACT].F_mail_no = [ST_MARINE_CLIENTS].MailNo
    INNER JOIN [NEPTUNE_Stage].[dbo].[NEPTUNE_FAMILY] WITH (NOLOCK)
        ON [NEPTUNE_FAMILY].F_mail_no = [NEPTUNE_MAIL_CONTACT].[F_mail_no]
        AND [NEPTUNE_FAMILY].F_leader = 'true'
		AND [NEPTUNE_FAMILY].F_fam_no = 1
    WHERE
	        Lead='Yes'
        AND Email1 LIKE '%_@%_.__%'
        AND Email1 NOT LIKE '%[[]%' AND Email1 NOT LIKE '%]%' AND Email1 NOT LIKE '%(%' AND Email1 NOT LIKE '%)%' AND Email1 NOT LIKE '%''%' AND Email1 NOT LIKE '% %'

	IF OBJECT_ID('tempdb..#MostRecentBooking') IS NOT NULL
		DROP TABLE #MostRecentBooking

	SELECT
		ConfirmDate
		,BookingSourcePrimary
		,BookingOfficeLocation
		,BookingLanguage
--		,ProductName
		,BookingDate
		,DepartureDate
		,Duration
		,BookRef
		,CancelledDate
		,BrandName
		,[Status]
		,TotalPax
		,BookingType
		,ClientCode
		,ClientEmail
		,BrandCode
--		,RankResultMostRecentBooking
		INTO #MostRecentBooking
	FROM
		(
			SELECT
				[ST_MARINE_BOOKINGS].ConfirmDate,
				[ST_MARINE_BOOKINGS].BookingSourcePrimary,
				[ST_MARINE_BOOKINGS].BookingOfficeLocation,
				[ST_MARINE_BOOKINGS].BookingLanguage,
--				[ST_MARINE_BOOKINGS].ProductName,
				[ST_MARINE_BOOKINGS].BookingDate,
				[ST_MARINE_BOOKINGS].DepartureDate,
				[ST_MARINE_BOOKINGS].Duration,
				[ST_MARINE_BOOKINGS].BookRef,
				[ST_MARINE_BOOKINGS].CancelledDate,
				[ST_MARINE_BOOKINGS].BrandName,
				[ST_MARINE_BOOKINGS].[Status],
				[ST_MARINE_BOOKINGS].[TotalPax],
				[ST_MARINE_BOOKINGS].BookingType,
				CLI.ClientCode,
				CLI.ClientEmail,
				[ST_MARINE_BOOKINGS].BrandCode,
				DENSE_RANK() OVER(PARTITION BY CLI.ClientEmail
					ORDER BY 
						[ST_MARINE_BOOKINGS].BookingDate DESC,
						[ST_MARINE_BOOKINGS].BookRef DESC, 
						[ST_MARINE_BOOKINGS].ConfirmDate DESC,
						CLI.ClientCode DESC
					) AS RankResultMostRecentBooking
				FROM 
					[NEPTUNE_Stage].[dbo].[ST_MARINE_BOOKINGS] WITH (NOLOCK)
				INNER JOIN #Clients AS CLI WITH (NOLOCK)
					ON CLI.ClientCode=[ST_MARINE_BOOKINGS].ClientCode
				INNER JOIN [NEPTUNE_Stage].[dbo].[ST_MARINE_FBKG] WITH (NOLOCK)
					ON [ST_MARINE_FBKG].BkgRef=[ST_MARINE_BOOKINGS].BookRef
				INNER JOIN [NEPTUNE_Stage].[dbo].[NEPTUNE_MAIL_CONTACT] WITH (NOLOCK)
					ON [NEPTUNE_MAIL_CONTACT].F_mail_no = CLI.MailNo
				INNER JOIN [NEPTUNE_Stage].[dbo].[NEPTUNE_FAMILY] WITH (NOLOCK)
					ON [NEPTUNE_FAMILY].F_mail_no = [NEPTUNE_MAIL_CONTACT].[F_mail_no]
					AND [NEPTUNE_FAMILY].F_leader = 'true'
					AND [NEPTUNE_FAMILY].F_fam_no = 1
				WHERE 
					[ST_MARINE_BOOKINGS].BrandCode ='LBT'
				AND [ST_MARINE_BOOKINGS].[Status] IN ('Confirmed','Cancelled')
		        AND [ST_MARINE_BOOKINGS].BookingDate BETWEEN @startDate AND @endDate
--				AND MostRecentBooking.BookingDate BETWEEN CONVERT(DATE,'2013-01-01', 120) AND CONVERT(DATE, '2013-12-31', 120)
--		        AND MostRecentBooking.BookingDate BETWEEN CONVERT(DATE,'2016-01-01', 120) AND CONVERT(DATE, '2016-12-31', 120)
				AND [ST_MARINE_BOOKINGS].BookingType ='DIRECT'
		        AND [ST_MARINE_BOOKINGS].BookingSourcePrimary NOT IN ('STHOL','OPS','STAFF','OWNER','OWNS')
        ) MostRecentBookingInnerSelect
	WHERE RankResultMostRecentBooking = 1

	IF OBJECT_ID('tempdb..#FirstCharter') IS NOT NULL
		DROP TABLE #FirstCharter

		SELECT
            BookRef AS FirstCharterBookRef
            ,DepartureDate AS FirstCharterDepartureDate
            ,Destination AS FirstCharterDestination
            ,BookingDate AS FirstCharterDateBooked
            ,ProductName AS FirstCharterProduct
            ,HullType AS FirstCharterHullType
            ,BoatType AS FirstCharterBoat
            ,ClientCode AS FirstCharterClientCode
		,ClientEmail AS FirstCharterClientEmail
--          ,RankResultFirstCharter
		INTO #FirstCharter
		FROM
            (
                SELECT
					COALESCE([ST_MARINE_BOOKINGS].BookRef,'') AS BookRef
					,HUBSPOT.dbo.fn_convertDate([ST_MARINE_BOOKINGS].DepartureDate, @dateFormat) AS DepartureDate
					,COALESCE([SL_BaseNameFull].[BaseName],[ST_MARINE_FBKG].BaseLocation,'') AS Destination
					,HUBSPOT.dbo.fn_convertDate([ST_MARINE_BOOKINGS].BookingDate, @dateFormat) AS BookingDate
					,COALESCE([SL_Simplified_ProductName].ProductNameSimplified,[ST_MARINE_BOOKINGS].ProductCode,'') AS ProductName
					,COALESCE(ACC_TYPE_LOOKUP.KEEL_TYPE, '') AS HullType
					,COALESCE([ST_MARINE_FBKG].BoatType, '') AS BoatType
					,CLI.ClientCode
					,CLI.ClientEmail
					,DENSE_RANK() OVER(PARTITION BY CLI.ClientEmail
						ORDER BY 
							[ST_MARINE_BOOKINGS].BookingDate ASC,
							[ST_MARINE_BOOKINGS].BookRef DESC, 
							[ST_MARINE_BOOKINGS].ConfirmDate DESC,
							CLI.ClientCode DESC
						) AS RankResultFirstCharter
				FROM 
					[NEPTUNE_Stage].[dbo].[ST_MARINE_BOOKINGS] WITH (NOLOCK)
				INNER JOIN #Clients AS CLI WITH (NOLOCK)
					ON CLI.ClientCode=[ST_MARINE_BOOKINGS].ClientCode
				INNER JOIN [NEPTUNE_Stage].[dbo].[ST_MARINE_FBKG] WITH (NOLOCK)
					ON [ST_MARINE_FBKG].BkgRef=[ST_MARINE_BOOKINGS].BookRef
				INNER JOIN [NEPTUNE_Stage].[dbo].[NEPTUNE_MAIL_CONTACT] WITH (NOLOCK) 
					ON [NEPTUNE_MAIL_CONTACT].F_mail_no = CLI.MailNo
				INNER JOIN [NEPTUNE_Stage].[dbo].[NEPTUNE_FAMILY] WITH (NOLOCK)
		            ON [NEPTUNE_FAMILY].F_mail_no = [NEPTUNE_MAIL_CONTACT].[F_mail_no]
					AND [NEPTUNE_FAMILY].F_leader = 'true'
					AND [NEPTUNE_FAMILY].F_fam_no = 1
                LEFT JOIN [HUBSPOT].[dbo].[SL_BaseNameFull] WITH (NOLOCK)
                    ON [SL_BaseNameFull].[BaseCode]=[ST_MARINE_FBKG].BaseLocation
                    AND [SL_BaseNameFull].Brand = 'LBT'				
                LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_ProductName] WITH (NOLOCK)
                    ON [SL_Simplified_ProductName].[ProductNameActual]=[ST_MARINE_BOOKINGS].ProductCode
--                Replace with DISTINCT to avoid duplicates
--                LEFT JOIN [NEPTUNE_Stage].[dbo].[NEPTUNE_ACC_TYPE] WITH (NOLOCK)
--                    ON [NEPTUNE_ACC_TYPE].ACC_TYPE_DESC = [ST_MARINE_FBKG].BoatType
				LEFT JOIN
				(
					SELECT DISTINCT
						ACC_TYPE_DESC
						,KEEL_TYPE
					FROM
						[NEPTUNE_Stage].[dbo].[NEPTUNE_ACC_TYPE]
					WHERE
						KEEL_TYPE != ''
				) ACC_TYPE_LOOKUP
				ON ACC_TYPE_LOOKUP.ACC_TYPE_DESC = [ST_MARINE_FBKG].BoatType

				WHERE 
					[ST_MARINE_BOOKINGS].BrandCode ='LBT'
				AND [ST_MARINE_BOOKINGS].[Status] = 'Confirmed'
				AND [ST_MARINE_BOOKINGS].BookingDate >= CONVERT(date,'2010-01-01',120)
				AND [ST_MARINE_BOOKINGS].BookingType ='DIRECT'
        ) FirstCharterInnerSelect
	WHERE RankResultFirstCharter = 1

	IF OBJECT_ID('tempdb..#CancelledBookings') IS NOT NULL
		DROP TABLE #CancelledBookings

            SELECT
                CancellationBookRef AS CancellationBookRef
                ,CancellationDate AS CancellationDate
                ,ClientCode AS CancellationClientCode
				,ClientEmail AS CancellationClientEmail
--                ,RankResultCancellation
			INTO #CancelledBookings
            FROM
            (
                SELECT
                    COALESCE([ST_MARINE_BOOKINGS].BookRef,'') AS CancellationBookRef,
                    HUBSPOT.dbo.fn_convertDate([ST_MARINE_BOOKINGS].CancelledDate, @dateFormat) AS CancellationDate,
                    CLI.ClientCode,
					CLI.ClientEmail,
                    COALESCE([SL_BaseNameFull].[BaseName],[ST_MARINE_FBKG].BaseLocation,'') AS Destination,
					DENSE_RANK() OVER(PARTITION BY CLI.ClientEmail
						ORDER BY 
							[ST_MARINE_BOOKINGS].BookingDate DESC,
							[ST_MARINE_BOOKINGS].BookRef DESC, 
							[ST_MARINE_BOOKINGS].ConfirmDate DESC,
							CLI.ClientCode DESC
						) AS RankResultCancellation
				FROM 
					[NEPTUNE_Stage].[dbo].[ST_MARINE_BOOKINGS] WITH (NOLOCK)
				INNER JOIN #Clients AS CLI WITH (NOLOCK)
					ON CLI.ClientCode=[ST_MARINE_BOOKINGS].ClientCode
				INNER JOIN [NEPTUNE_Stage].[dbo].[ST_MARINE_FBKG] WITH (NOLOCK)
					ON [ST_MARINE_FBKG].BkgRef=[ST_MARINE_BOOKINGS].BookRef
				INNER JOIN [NEPTUNE_Stage].[dbo].[NEPTUNE_MAIL_CONTACT] WITH (NOLOCK) 
					ON [NEPTUNE_MAIL_CONTACT].F_mail_no = CLI.MailNo
				INNER JOIN [NEPTUNE_Stage].[dbo].[NEPTUNE_FAMILY] WITH (NOLOCK)
		            ON [NEPTUNE_FAMILY].F_mail_no = [NEPTUNE_MAIL_CONTACT].[F_mail_no]
					AND [NEPTUNE_FAMILY].F_leader = 'true'
					AND [NEPTUNE_FAMILY].F_fam_no = 1
                LEFT JOIN [HUBSPOT].[dbo].[SL_BaseNameFull] WITH (NOLOCK)
                    ON [SL_BaseNameFull].[BaseCode]=[ST_MARINE_FBKG].BaseLocation
                    AND [SL_BaseNameFull].Brand = 'LBT'				

				WHERE 
					[ST_MARINE_BOOKINGS].BrandCode ='LBT'
				AND [ST_MARINE_BOOKINGS].[Status] IN ('Confirmed','Cancelled')
				--Search all bookings for most recent cancellation records
				--AND [ST_MARINE_BOOKINGS].BookingDate >= CONVERT(date,'2010-01-01',120)
				AND [ST_MARINE_BOOKINGS].BookingType ='DIRECT'
            ) CancelledBookingsInnerSelect
            WHERE RankResultCancellation = 1

        SELECT DISTINCT
            'customer' as LifecycleStage,
            'Le Boat Charter' AS BrandName,
            'Le Boat Charter' AS Charter,
            HUBSPOT.dbo.fn_convertDate(#MostRecentBooking.ConfirmDate, @dateFormat) AS ConfirmDate,
            #MostRecentBooking.BookingSourcePrimary AS BookingSourcePrimary,
            COALESCE([SL_Simplified_SalesOffice].[SalesOfficeSimplified],#MostRecentBooking.BookingOfficeLocation,'') AS BookingOfficeLocation, 
            #MostRecentBooking.BookingLanguage,
            CLI.ClientCode,
            COALESCE([SL_Simplified_Title].[TitleSimplified],'') AS Title,
            CLI.FirstName,
            CLI.LastName,
            CLI.City,
            CLI.County,
            CLI.Postcode,
            COALESCE([SL_Simplified_Neptune_Client_Country].[CountrySimplified],CLI.Country,'') AS Country,
            CLI.ClientEmail AS Email,
            CASE #ClientPreferences.CancelFromMailing WHEN 'TRUE' THEN 'Y' ELSE 'N' END AS CancelFromMailing,
            CASE #ClientPreferences.CancelFromEmail WHEN 'TRUE' THEN 'Y' ELSE 'N' END AS CancelFromEmail,
            CASE #ClientPreferences.CancelFromBrochure WHEN 'TRUE' THEN 'Y' ELSE 'N' END AS CancelFromBrochure,
            CLI.Deceased,
            CASE CLI.Blacklisted WHEN 'Y' THEN 'Y' ELSE 'N' END AS Blacklisted,
            --#MostRecentBooking.ProductName
            HUBSPOT.dbo.fn_convertDate(#MostRecentBooking.BookingDate, @dateFormat) AS BookingDateBooked,
            HUBSPOT.dbo.fn_convertDate(#MostRecentBooking.DepartureDate, @dateFormat) AS BookingDepartureDate,
            COALESCE([SL_BaseNameFull].[BaseName],[ST_MARINE_FBKG].BaseLocation,'') AS BookingDestination, 
            COALESCE(CLI.Add1,'') AS Address1,
            COALESCE(CLI.Add2,'') AS Address2,
            COALESCE(CLI.Add3,'') AS Address3,
            COALESCE(CLI.Phone1,'') AS Phone1,
            COALESCE(CLI.Phone2,'') AS Phone2,
            COALESCE(CLI.MobilePhone,'') AS BusinessPhone,
            HUBSPOT.dbo.fn_convertDate(CLI.DateOfBirth, @dateFormat) AS DateOfBirth,
            COALESCE(#MostRecentBooking.[Duration],'') AS Duration,
            COALESCE(#MostRecentBooking.BookRef,'') AS BookingBookRef,
            'Booking' as [Status],

            -- DWYT-16 New HubSpot API fields
            CASE #ClientPreferences.CancelFromTelephone WHEN 'TRUE' THEN 'Y' ELSE 'N' END AS CancelFromTelephone,
            --'' AS Notes,
            '' AS LastContactDate,
            HUBSPOT.dbo.fn_convertDate(#MostRecentBooking.CancelledDate, @dateFormat) AS BookingCancellationDate,
            COALESCE(#CancelledBookings.CancellationDate, '') AS CancellationCancellationDate,
            COALESCE(#CancelledBookings.CancellationBookRef, '') AS CancellationBookRef,
            COALESCE(#FirstCharter.FirstCharterBookRef, '') AS FirstCharterBookRef,
            COALESCE(#FirstCharter.FirstCharterDepartureDate, '') AS FirstCharterDepartureDate,
            COALESCE(#FirstCharter.FirstCharterDestination, '') AS FirstCharterDestination,
            COALESCE(#FirstCharter.FirstCharterDateBooked, '') AS FirstCharterDateBooked,
            COALESCE(#FirstCharter.FirstCharterProduct, '') AS FirstCharterProduct,
            COALESCE(#FirstCharter.FirstCharterHullType, '') AS FirstCharterHullType,
            COALESCE(#FirstCharter.FirstCharterBoat,'') AS FirstCharterBoat,
            (SELECT COUNT(*)
                FROM [NEPTUNE_Stage].[dbo].[ST_MARINE_BOOKINGS] WITH (NOLOCK)
                INNER JOIN [NEPTUNE_Stage].[dbo].[ST_MARINE_Clients] WITH (NOLOCK)
                    ON #MostRecentBooking.ClientCode=    [ST_MARINE_Clients].ClientCode
                WHERE [ST_MARINE_Clients].ClientCode = CLI.ClientCode
                    AND #MostRecentBooking.BrandCode='LBT'
                    AND #MostRecentBooking.[Status] IN ('Confirmed','Cancelled')
            ) AS NumberOfBookings,
            HUBSPOT.dbo.fn_convertDateFromText([NEPTUNE_MAIL_CONTACT].F_added_date, @dateFormat) AS NeptuneCreateDate,
            '' AS BookingSourceSecondary,
            '' AS BookingSourceTertiary,
            COALESCE([ST_MARINE_FBKG].AgentContact,'') AS BookingSalesAgent,
            CLI.CLientCode AS CleanClientID,
            #MostRecentBooking.BookRef AS BookingCleanBookRef,
            COALESCE([ST_MARINE_FBKG].[PaxNo],0) AS BookingTotalPax,
            COALESCE(REPLACE(#MostRecentBooking.[Status], 'Booking', 'Confirmed'),'') AS BookingStatus

        FROM 
            #MostRecentBooking WITH (NOLOCK)
        INNER JOIN #Clients AS CLI WITH (NOLOCK)
            ON CLI.ClientCode=#MostRecentBooking.ClientCode
        LEFT JOIN #ClientPreferences WITH (NOLOCK)
            ON #ClientPreferences.ClientCode=CLI.ClientCode
        INNER JOIN [NEPTUNE_Stage].[dbo].[ST_MARINE_FBKG] WITH (NOLOCK)
            ON [ST_MARINE_FBKG].BkgRef=#MostRecentBooking.BookRef
        INNER JOIN [NEPTUNE_Stage].[dbo].[NEPTUNE_MAIL_CONTACT] WITH (NOLOCK) 
            ON [NEPTUNE_MAIL_CONTACT].F_mail_no = CLI.MailNo
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_SalesOffice] WITH (NOLOCK)
            ON [SL_Simplified_SalesOffice].[SalesOfficeFromRawData]=#MostRecentBooking.BookingOfficeLocation 
			AND [SL_Simplified_SalesOffice].BrandName = 'LBT'
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Neptune_Client_Country] WITH (NOLOCK)
            ON [SL_Simplified_Neptune_Client_Country].[CountryActual]=CLI.Country
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Title] WITH (NOLOCK)
            ON [SL_Simplified_Title].[TitleActual]=CLI.Title
        LEFT JOIN [HUBSPOT].[dbo].[SL_BaseNameFull] WITH (NOLOCK)
            ON [SL_BaseNameFull].[BaseCode]=[ST_MARINE_FBKG].BaseLocation
            AND [SL_BaseNameFull].Brand = 'LBT'
	   -- First Charter records
		LEFT JOIN #FirstCharter
			ON #FirstCharter.FirstCharterClientEmail = CLI.ClientEmail
		-- Most recent cancellation records
		LEFT JOIN #CancelledBookings
			ON #CancelledBookings.CancellationClientEmail = CLI.ClientEmail
	ORDER BY ConfirmDate,CLI.ClientEmail

END
GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_NEPTUNE_BROCHURE_REQUESTS]    Script Date: 12/04/2019 10:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--========================================================================================================================
-- Procedure Date - Procedure Description
-- 30-Nov-2017      BUILD_HUBSPOT_NEPTUNE_BROCHURE_REQUESTS - Selects Neptune brochure request records for HubSpot upload
--
--========================================================================================================================
-- Change History===
--========================================================================================================================
-- Date             Version     Who                Comment
-- 30-Nov-2017      1.0         Tim Wilson         Revised for CRM Phase III
-- 04-Jan-2018      1.1         Tim Wilson         Corrected joins for Most Recent Booking
-- 19-Feb-2018      1.2         Tim Wilson         Remove selection criterion for brochure type 'LBE'
--                                                 This is covered by the INNER JOIN to SL_Simplified_BrochureName
-- 20-Mar-2018      1.3         Tim Wilson         Remove selection filter for Deceased flag
-- 25-Apr-2018      1.4         Tim Wilson         Revised client link using URN
-- 01-May-2018      1.5         Tim Wilson         Remove booking data columns
-- 17-May-2018      1.6         Tim Wilson         Select all data from 01-01-2010
-- 17-May-2018      1.7         Tim Wilson         Output dates in yyyy-mm-dd format
-- 21-May-2018      1.8         Tim Wilson         Corrections for dedupe logic
-- 18-Jun-2018      1.9         Tim Wilson         Recoded email-centrically and using CTEs for clarity
--========================================================================================================================

CREATE PROC [dbo].[BUILD_HUBSPOT_NEPTUNE_BROCHURE_REQUESTS] @pStartDate varchar(10) = NULL , @pEndDate varchar(10) = NULL, @pDateFormat varchar(10) = NULL
/* @pStartDate and @pEndDate are either a date string with format 'yyyy-mm-dd' or the word 'TODAY' for the current date */
AS
BEGIN

	DECLARE @startDate date, @endDate date, @dateFormat varchar(10)

	SET NOCOUNT ON;

	IF @pStartDate = 'TODAY'
	BEGIN
		SET @startDate = CONVERT(DATE,GETDATE())
	END
	ELSE
	BEGIN
		-- Default to 10 days ago
		SET @startDate = ISNULL(CONVERT(DATE,@pStartDate,120), CONVERT(DATE,GETDATE()-10))
	END

	IF @pEndDate = 'TODAY'
	BEGIN
		SET @endDate   = CONVERT(DATE,GETDATE())
	END
	ELSE
	BEGIN
		-- Default to yesterday
		SET @endDate   = ISNULL(CONVERT(DATE,@pEndDate,120), CONVERT(DATE,GETDATE()-1))
	END

	SET @dateFormat    = ISNULL(@pDateFormat, 'unix')
;
    WITH ClientPreferences
	(
		 ClientCode
		,CancelFromBrochure
		,CancelFromMailing
		,CancelFromEmail
		,CancelFromTelephone
		,CancelFromEnews
		,CancelFromSMS
		--,RankNo
	)
	AS
	(
		SELECT
			 [ClientCode]
			,MAX(ISNULL([CancelFromBrochure],'')) CancelFromBrochure
			,MAX(ISNULL([CancelFromMailing],'')) CancelFromMailing
			,MAX(ISNULL([CancelFromEmail],'')) CancelFromEmail
			,MAX(ISNULL([CancelFromTelephone],'')) CancelFromTelephone
			,MAX(ISNULL([CancelFromEnews],'')) CancelFromEnews
			,MAX(ISNULL([CancelFromSMS],'')) CancelFromSMS
		FROM [NEPTUNE_Stage].[dbo].[ST_MARINE_CLIENT_PREFERENCE]
		GROUP BY ClientCode
	),
	Clients
	(
		ClientCode
		,ClientEmail
		,Lead
		,Title
		,FirstName
		,LastName
		,City
		,County
		,Postcode
		,Country
		,Add1
		,Add2
		,Add3
		,Phone1
		,Phone2
		,MobilePhone
		,DateOfBirth
		,MailNo
		,Deceased
		,Blacklisted
		,F_URN
	)
	AS
	(
		SELECT 
			 ClientCode
			,REPLACE(Email1,'\@','@') AS ClientEmail
			,Lead
			,Title
			,FirstName
			,LastName
			,City
			,County
			,Postcode
			,Country
			,Add1
			,Add2
			,Add3
			,Phone1
			,Phone2
			,MobilePhone
			,DateOfBirth
			,MailNo
			,Deceased
			,Blacklisted
			,F_URN
		FROM [NEPTUNE_Stage].[dbo].[ST_MARINE_CLIENTS]
		WHERE
				Lead='Yes'
			AND Email1 LIKE '%_@%_.__%'
			AND Email1 NOT LIKE '%[[]%' AND Email1 NOT LIKE '%]%' AND Email1 NOT LIKE '%(%' AND Email1 NOT LIKE '%)%' AND Email1 NOT LIKE '%''%' AND Email1 NOT LIKE '% %'
	)

	SELECT DISTINCT
         LifecycleStage
        ,BrandName
        ,Charter
        ,BookingOfficeLocation
        ,BookingLanguage
        ,ClientCode
        ,Title
        ,FirstName
        ,LastName
        ,City
        ,County
        ,Postcode
        ,Country
        ,Email
        ,Deceased
        ,Blacklisted
        ,CancelFromMailing
        ,CancelFromEmail
        ,CancelFromBrochure
        ,BrochureProductRequested
        ,BrochureDateRequested
        ,Address1
        ,Address2
        ,Address3
        ,Phone1
        ,Phone2
        ,BusinessPhone
        ,DateOfBirth
        ,[Status]
        ,CancelFromTelephone
        ,LastContactDate
        ,NeptuneCreateDate
        ,CleanClientId
    FROM
    (
        SELECT 
            'lead' AS LifecycleStage,
            'Le Boat Charter' AS BrandName,
            'Le Boat Charter' AS Charter,
            COALESCE(SO.[SourceOffice],'') AS BookingOfficeLocation,
            COALESCE([ST_MARINE_BROCHURE_REQUEST].Language,'') AS BookingLanguage,
            [ST_MARINE_BROCHURE_REQUEST].ClientCode,
            COALESCE([SL_Simplified_Title].[TitleSimplified],'') AS Title,
            CLI.FirstName,
            CLI.LastName,
            CLI.City,
            CLI.County,
            CLI.Postcode,
            COALESCE([SL_Simplified_Neptune_Client_Country].[CountrySimplified],CLI.Country,'') AS Country,
            REPLACE(CLI.ClientEmail,'\@','@') AS Email,
            CLI.Deceased,
            CASE CLI.Blacklisted WHEN 'Y' THEN 'Y' ELSE 'N' END AS Blacklisted,
            CASE CLP.CancelFromMailing WHEN 'TRUE' THEN 'Y' ELSE 'N' END AS CancelFromMailing,
            CASE CLP.CancelFromEmail WHEN 'TRUE' THEN 'Y' ELSE 'N' END AS CancelFromEmail,
            CASE CLP.CancelFromBrochure WHEN 'TRUE' THEN 'Y' ELSE 'N' END AS CancelFromBrochure,
            COALESCE([SL_Simplified_BrochureName].[BrochureNameSimplified],[ST_MARINE_BROCHURE_REQUEST].BrochureName) AS BrochureProductRequested,
            HUBSPOT.dbo.fn_convertDate([ST_MARINE_BROCHURE_REQUEST].DateRequested, @dateFormat) AS BrochureDateRequested,
            COALESCE(CLI.Add1,'') AS Address1,
            COALESCE(CLI.Add2,'') AS Address2,
            COALESCE(CLI.Add3,'') AS Address3,
            COALESCE(CLI.Phone1,'') AS Phone1,
            COALESCE(CLI.Phone2,'') AS Phone2,
            COALESCE(CLI.MobilePhone,'') AS BusinessPhone,
            HUBSPOT.dbo.fn_convertDate(CLI.DateOfBirth, @dateFormat) AS DateOfBirth,
            'Brochure' as Status,
            DENSE_RANK() OVER(PARTITION BY CLI.ClientEmail
                ORDER BY 
                    [ST_MARINE_BROCHURE_REQUEST].DateRequested DESC, 
                    [ST_MARINE_BROCHURE_REQUEST].ClientCode DESC,
                    COALESCE([SL_Simplified_BrochureName].[BrochureNameSimplified],[ST_MARINE_BROCHURE_REQUEST].BrochureName) ASC,
                    [ST_MARINE_BROCHURE_REQUEST].[Language] ASC,
                    (CASE CLP.CancelFromEmail WHEN 'TRUE' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE CLP.CancelFromMailing WHEN 'TRUE' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE CLP.CancelFromBrochure WHEN 'TRUE' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE CLP.CancelFromTelephone WHEN 'TRUE' THEN 'Y' ELSE 'N' END) DESC,
                    CLI.LastName,
                    CLI.FirstName
            ) AS RankResult,

            -- DWYT-16 New HubSpot API fields
            CASE CLP.CancelFromTelephone WHEN 'TRUE' THEN 'Y' ELSE 'N' END AS CancelFromTelephone,
            '' AS LastContactDate,
            HUBSPOT.dbo.fn_convertDateFromText([NEPTUNE_MAIL_CONTACT].F_added_date, @dateFormat) AS NeptuneCreateDate,
            COALESCE(REPLACE(REPLACE(REPLACE(CLI.ClientCode, 'TRT-M',''), 'TRT-S', ''), 'TRT-', ''), '') AS CleanClientID

        FROM    
            [NEPTUNE_Stage].[dbo].[ST_MARINE_BROCHURE_REQUEST] WITH (NOLOCK)
        INNER JOIN Clients CLI WITH (NOLOCK)
            ON [ST_MARINE_BROCHURE_REQUEST].ClientCode=CLI.ClientCode
            AND [ST_MARINE_BROCHURE_REQUEST].F_CONTACT_URN = CLI.F_URN
        INNER JOIN [HUBSPOT].[dbo].[SL_Simplified_BrochureName] WITH (NOLOCK)
            ON [SL_Simplified_BrochureName].[BrochureNameActual]=[ST_MARINE_BROCHURE_REQUEST].[Type] AND [SL_Simplified_BrochureName].[BrandName]='LBT'
        INNER JOIN [NEPTUNE_Stage].[dbo].[NEPTUNE_MAIL_CONTACT] WITH (NOLOCK) 
            ON [NEPTUNE_MAIL_CONTACT].F_mail_no = CLI.MailNo
        LEFT JOIN ClientPreferences CLP WITH (NOLOCK)
            ON CLP.ClientCode=CLI.ClientCode
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Country] WITH (NOLOCK)
            ON [SL_Simplified_Country].[CountryActual]=CLI.Country
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Country_Language_SourceOffice] SO WITH (NOLOCK) 
            ON SO.[CountrySimplified_Language]=ISNULL([SL_Simplified_Country].[CountrySimplified],'') + [ST_MARINE_BROCHURE_REQUEST].Language
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Neptune_Client_Country] WITH (NOLOCK)
            ON [SL_Simplified_Neptune_Client_Country].[CountryActual]=CLI.Country
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Title] WITH (NOLOCK)
            ON [SL_Simplified_Title].[TitleActual]=CLI.Title
        WHERE
			[ST_MARINE_BROCHURE_REQUEST].DateRequested BETWEEN @startDate AND @endDate
--        AND [ST_MARINE_BROCHURE_REQUEST].DateRequested BETWEEN CONVERT(DATE,GETDATE()-10) AND CONVERT(DATE,GETDATE()-1)
--        AND [ST_MARINE_BROCHURE_REQUEST].DateRequested BETWEEN CONVERT(DATE,'2013-01-01', 120) AND CONVERT(DATE, '2013-12-31', 120)
--        AND [ST_MARINE_BROCHURE_REQUEST].DateRequested BETWEEN CONVERT(DATE,'2016-01-01', 120) AND CONVERT(DATE, '2016-12-31', 120)
    )Result
    Where RankResult=1
    ORDER BY BrochureDateRequested,Email

END

GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_NEPTUNE_CONTACT_PREFERENCES]    Script Date: 12/04/2019 10:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--========================================================================================================================
-- Procedure Date - Procedure Description
-- 25-Feb-2018      BUILD_HUBSPOT_NEPTUNE_CONTACT_PREFERENCES - Selects Neptune contact preferences for HubSpot upload
--
--========================================================================================================================
-- Change History===
--========================================================================================================================
-- Date             Version     Who                Comment
-- 25-Feb-2019      1.0         Tim Wilson         Original Version    
-- 15-Mar-2019      1.1         Tim Wilson         New filters for associated bookings/quotes/brochures/enews, lead contact
-- 21-Mar-2019      1.2         Tim Wilson         Additional WHERE clause for P.Brand
-- 11-Apr-2019      1.3         Tim Wilson         Deployment fixes
--
--========================================================================================================================

CREATE PROC [dbo].[BUILD_HUBSPOT_NEPTUNE_CONTACT_PREFERENCES] @pStartDate varchar(10) = NULL , @pEndDate varchar(10) = NULL, @pDateFormat varchar(10) = NULL
/* @pStartDate and @pEndDate are either a date string with format 'yyyy-mm-dd' or the word 'TODAY' for the current date */
AS
BEGIN

	DECLARE @startDate date, @endDate date, @dateFormat varchar(10)

	SET NOCOUNT ON;

	IF @pStartDate = 'TODAY'
	BEGIN
		SET @startDate = CONVERT(DATE,GETDATE())
	END
	ELSE
	BEGIN
		-- Default to 10 days ago
		SET @startDate = ISNULL(CONVERT(DATE,@pStartDate,120), CONVERT(DATE,GETDATE()-10))
	END

	IF @pEndDate = 'TODAY'
	BEGIN
		SET @endDate   = CONVERT(DATE,GETDATE())
	END
	ELSE
	BEGIN
		-- Default to yesterday
		SET @endDate   = ISNULL(CONVERT(DATE,@pEndDate,120), CONVERT(DATE,GETDATE()-1))
	END

	SET @dateFormat    = ISNULL(@pDateFormat, 'unix')

    SELECT
             Email
            ,'Le Boat Charter' AS BrandName
            ,PClientCode AS ClientCode
            ,CancelFromEnews
            ,Datestamp
        FROM
            (
            SELECT DISTINCT
            --			 [Source_Key_full]
                         P.[ClientCode] AS PClientCode
            --          ,Brand AS BrandName
            --			,CASE [CancelFromBrochure] WHEN 'TRUE' THEN 'Y' ELSE 'N' END AS [CancelFromBrochure]
            --			,CASE [CancelFromMailing] WHEN 'TRUE' THEN 'Y' ELSE 'N' END AS [CancelFromMailing]
            --			,CASE [CancelFromEmail] WHEN 'TRUE' THEN 'Y' ELSE 'N' END AS [CancelFromEmail]
            --			,CASE [CancelFromTelephone] WHEN 'TRUE' THEN 'Y' ELSE 'N' END AS [CancelFromTelephone]
                        ,CASE P.[CancelFromEnews] WHEN 'TRUE' THEN 'Y' ELSE 'N' END AS [CancelFromEnews]
            --			,CASE [CancelFromSMS] WHEN 'TRUE' THEN 'Y' ELSE 'N' END AS [CancelFromSMS]
            --			,F.F_fam_no
            --			,F.F_URN
                        ,F.F_date_consent_opt1 
                        ,F.F_time_consent_opt1 
                        ,F.F_consent_withdrawn 
                        ,F.F_date_consent_withdrawn 
                        ,F.F_time_consent_withdrawn 
                        ,REPLACE(F.F_email,'\@','@') AS Email
                        ,CASE
                            WHEN LEN(RTRIM(CASE
                                WHEN CancelFromEnews = 'TRUE' THEN ISNULL(F.F_date_consent_withdrawn,'') + ' ' + ISNULL(F_time_consent_withdrawn,'')
                                WHEN CancelFromEnews = 'FALSE' THEN ISNULL(F.F_date_consent_opt1,'') + ' ' + ISNULL(F_time_consent_opt1,'')
                            END)) > 0 THEN TRY_CONVERT(datetime, CASE
                                WHEN CancelFromEnews = 'TRUE' THEN ISNULL(F.F_date_consent_withdrawn,'') + ' ' + ISNULL(F_time_consent_withdrawn,'')
                                WHEN CancelFromEnews = 'FALSE' THEN ISNULL(F.F_date_consent_opt1,'') + ' ' + ISNULL(F_time_consent_opt1,'')
                            END, 103)
                        ELSE NULL
                        END AS Datestamp

                    FROM [NEPTUNE_Stage].[dbo].[ST_MARINE_CLIENT_PREFERENCE] P WITH (NOLOCK)
                    INNER JOIN [NEPTUNE_Stage].[dbo].NEPTUNE_FAMILY F WITH (NOLOCK)
                    ON F.F_mail_no = [HUBSPOT].[dbo].fn_GetField(P.Source_Key_full, '-', 2)
                        AND F.F_fam_no = [HUBSPOT].[dbo].fn_GetField(P.Source_Key_full, '-', 3)
                        AND F.F_leader = 'true'
                        AND F.F_fam_no = 1
                    INNER JOIN NEPTUNE_Stage.dbo.ST_MARINE_CLIENTS C WITH (NOLOCK)
                    ON C.ClientCode = P.ClientCode
                        AND C.Lead = 'Yes'
                    WHERE 'lb' = [HUBSPOT].[dbo].fn_GetField(P.Source_Key_full, '-', 4)
                    -- Email address validation filters
                        AND ISNULL(F.F_email, '') != ''
                        AND F.F_email LIKE '[a-zA-Z0-9]%_@%_.__%'
                        AND F.F_email NOT LIKE '%[[]%' AND F.F_email NOT LIKE '%]%' AND F.F_email NOT LIKE '%(%' AND F.F_email NOT LIKE '%)%' AND F.F_email NOT LIKE '%''%' AND F.F_email NOT LIKE '% %'
                        AND P.Brand = 'LeBoat'
                        AND
                            (
                            EXISTS (SELECT TOP(1) Email FROM NEPTUNE_Stage.dbo.ST_MARINE_FBKG BKG WITH (NOLOCK)
                                WHERE BKG.Email = REPLACE(F.F_email,'\@','@'))
                            OR
                            EXISTS (SELECT TOP(1) BRC.ClientCode FROM NEPTUNE_Stage.dbo.ST_MARINE_BROCHURE_REQUEST BRC WITH (NOLOCK)
                                INNER JOIN [HUBSPOT].[dbo].[SL_Simplified_BrochureName] WITH (NOLOCK) 
                                        ON [SL_Simplified_BrochureName].[BrochureNameActual]=BRC.[Type] AND [SL_Simplified_BrochureName].[BrandName]='LBT'
                                WHERE BRC.ClientCode = P.ClientCode)
                            OR
                            EXISTS (SELECT TOP(1) ClientCode FROM NEPTUNE_Stage.dbo.ST_MARINE_BROCHURE_REQUEST BRC WITH (NOLOCK)
                                WHERE BRC.ClientCode = P.ClientCode AND (BRC.TYPE = 'LBE' OR BRC.BrochureName LIKE ('LeBoat Enews %')))
                            OR
                            EXISTS (SELECT TOP(1) Email1 FROM NEPTUNE_Stage.dbo.ST_MARINE_REMBOOK QTE WITH (NOLOCK)
                                WHERE QTE.Email1 = REPLACE(F.F_email,'\@','@') AND QTE.CompanyNo='5')
                            )
            ) innerSelect
        WHERE datestamp BETWEEN @startDate AND @endDate  -- date range selection for regular upload
        ORDER BY Email, Datestamp  -- ensure that CancelFromEnews settings are uploaded in chronological order

END

GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_NEPTUNE_ENEWS]    Script Date: 12/04/2019 10:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--========================================================================================================================
-- Procedure Date - Procedure Description
-- 30-Nov-2017      BUILD_HUBSPOT_NEPTUNE_ENEWS - Selects Neptune enews records for HubSpot upload
--
--========================================================================================================================
-- Change History===
--========================================================================================================================
-- Date             Version     Who                Comment
-- 30-Nov-2017      1.0         Tim Wilson         Revised for CRM Phase III
-- 04-Jan-2018      1.1         Tim Wilson         Corrected joins for Most Recent Booking
-- 19-Feb-2018      1.2         Tim Wilson         Improved brochure type/name filtering
-- 20-Mar-2018      1.3         Tim Wilson         Remove selection filter for Deceased flag
-- 25-Apr-2018      1.4         Tim Wilson         Revised client link using URN
-- 01-May-2018      1.5         Tim Wilson         Remove booking data columns
-- 17-May-2018      1.6         Tim Wilson         Select all data from 01-01-2010
-- 17-May-2018      1.7         Tim Wilson         Output dates in yyyy-mm-dd format
-- 21-May-2018      1.8         Tim Wilson         Corrections for dedupe logic
-- 18-Jun-2018      1.9         Tim Wilson         Recoded email-centrically and using CTEs for clarity
--========================================================================================================================

CREATE PROC [dbo].[BUILD_HUBSPOT_NEPTUNE_ENEWS] @pStartDate varchar(10) = NULL , @pEndDate varchar(10) = NULL, @pDateFormat varchar(10) = NULL
/* @pStartDate and @pEndDate are either a date string with format 'yyyy-mm-dd' or the word 'TODAY' for the current date */
AS
BEGIN

	DECLARE @startDate date, @endDate date, @dateFormat varchar(10)

	SET NOCOUNT ON;

	IF @pStartDate = 'TODAY'
	BEGIN
		SET @startDate = CONVERT(DATE,GETDATE())
	END
	ELSE
	BEGIN
		-- Default to 10 days ago
		SET @startDate = ISNULL(CONVERT(DATE,@pStartDate,120), CONVERT(DATE,GETDATE()-10))
	END

	IF @pEndDate = 'TODAY'
	BEGIN
		SET @endDate   = CONVERT(DATE,GETDATE())
	END
	ELSE
	BEGIN
		-- Default to yesterday
		SET @endDate   = ISNULL(CONVERT(DATE,@pEndDate,120), CONVERT(DATE,GETDATE()-1))
	END

	SET @dateFormat    = ISNULL(@pDateFormat, 'unix')
;
    WITH ClientPreferences
	(
		 ClientCode
		,CancelFromBrochure
		,CancelFromMailing
		,CancelFromEmail
		,CancelFromTelephone
		,CancelFromEnews
		,CancelFromSMS
		--,RankNo
	)
	AS
	(
		SELECT
			 [ClientCode]
			,MAX(ISNULL([CancelFromBrochure],'')) CancelFromBrochure
			,MAX(ISNULL([CancelFromMailing],'')) CancelFromMailing
			,MAX(ISNULL([CancelFromEmail],'')) CancelFromEmail
			,MAX(ISNULL([CancelFromTelephone],'')) CancelFromTelephone
			,MAX(ISNULL([CancelFromEnews],'')) CancelFromEnews
			,MAX(ISNULL([CancelFromSMS],'')) CancelFromSMS
		FROM [NEPTUNE_Stage].[dbo].[ST_MARINE_CLIENT_PREFERENCE]
		GROUP BY ClientCode
	),
	Clients
	(
		ClientCode
		,ClientEmail
		,Lead
		,Title
		,FirstName
		,LastName
		,City
		,County
		,Postcode
		,Country
		,Add1
		,Add2
		,Add3
		,Phone1
		,Phone2
		,MobilePhone
		,DateOfBirth
		,MailNo
		,Deceased
		,Blacklisted
		,F_URN
	)
	AS
	(
		SELECT 
			 ClientCode
			,REPLACE(Email1,'\@','@') AS ClientEmail
			,Lead
			,Title
			,FirstName
			,LastName
			,City
			,County
			,Postcode
			,Country
			,Add1
			,Add2
			,Add3
			,Phone1
			,Phone2
			,MobilePhone
			,DateOfBirth
			,MailNo
			,Deceased
			,Blacklisted
			,F_URN
		FROM [NEPTUNE_Stage].[dbo].[ST_MARINE_CLIENTS]
		WHERE
				Lead='Yes'
			AND Email1 LIKE '%_@%_.__%'
			AND Email1 NOT LIKE '%[[]%' AND Email1 NOT LIKE '%]%' AND Email1 NOT LIKE '%(%' AND Email1 NOT LIKE '%)%' AND Email1 NOT LIKE '%''%' AND Email1 NOT LIKE '% %'
	)

    SELECT DISTINCT
         LifecycleStage
        ,BrandName
        ,Charter
        ,BookingOfficeLocation
        ,BookingLanguage
        ,ClientCode
        ,Title
        ,FirstName
        ,LastName
        ,City
        ,County
        ,Postcode
        ,Country
        ,Email
        ,Deceased
        ,Blacklisted
        ,CancelFromMailing
        ,CancelFromEmail
        ,CancelFromBrochure
        ,EnewsDateRequested
        ,Address1
        ,Address2
        ,Address3
        ,Phone1
        ,Phone2
        ,BusinessPhone
        ,DateOfBirth
        ,[Status]
        ,CancelFromTelephone
        ,LastContactDate
        ,NeptuneCreateDate
        ,CleanClientId
    FROM
    (
        SELECT 
            'subscriber' AS LifecycleStage,
            'Le Boat Charter' AS BrandName,
            'Le Boat Charter' AS Charter,
            COALESCE(SO.[SourceOffice],'') AS BookingOfficeLocation,
            COALESCE([ST_MARINE_BROCHURE_REQUEST].[Language],'') AS BookingLanguage,
            [ST_MARINE_BROCHURE_REQUEST].ClientCode,
            COALESCE([SL_Simplified_Title].[TitleSimplified],'') AS Title,
            CLI.FirstName,
            CLI.LastName,
            CLI.City,
            CLI.County,
            CLI.Postcode,
            COALESCE([SL_Simplified_Neptune_Client_Country].[CountrySimplified],CLI.Country,'') AS Country,
            REPLACE(CLI.ClientEmail,'\@','@') AS Email,
            CLI.Deceased,
            CASE CLI.Blacklisted WHEN 'Y' THEN 'Y' ELSE 'N' END AS Blacklisted,
            CASE CLP.CancelFromMailing WHEN 'TRUE' THEN 'Y' ELSE 'N' END AS CancelFromMailing,
            CASE CLP.CancelFromEmail WHEN 'TRUE' THEN 'Y' ELSE 'N' END AS CancelFromEmail,
            CASE CLP.CancelFromBrochure WHEN 'TRUE' THEN 'Y' ELSE 'N' END AS CancelFromBrochure,
            HUBSPOT.dbo.fn_convertDate([ST_MARINE_BROCHURE_REQUEST].DateRequested, @dateFormat) AS EnewsDateRequested,
            COALESCE(CLI.Add1,'') AS Address1,
            COALESCE(CLI.Add2,'') AS Address2,
            COALESCE(CLI.Add3,'') AS Address3,
            COALESCE(CLI.Phone1,'') AS Phone1,
            COALESCE(CLI.Phone2,'') AS Phone2,
            COALESCE(CLI.MobilePhone,'') AS BusinessPhone,
            HUBSPOT.dbo.fn_convertDate(CLI.DateOfBirth, @dateFormat) AS DateOfBirth,
            'Enews' as Status,
            DENSE_RANK() OVER(PARTITION BY CLI.ClientEmail 
                ORDER BY 
                    [ST_MARINE_BROCHURE_REQUEST].DateRequested DESC, 
                    [ST_MARINE_BROCHURE_REQUEST].ClientCode DESC,
                    [ST_MARINE_BROCHURE_REQUEST].BrochureName ASC,
                    [ST_MARINE_BROCHURE_REQUEST].[Language] ASC,
                    (CASE CLP.CancelFromEmail WHEN 'TRUE' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE CLP.CancelFromMailing WHEN 'TRUE' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE CLP.CancelFromBrochure WHEN 'TRUE' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE CLP.CancelFromTelephone WHEN 'TRUE' THEN 'Y' ELSE 'N' END) DESC,
                    CLI.LastName,
                    CLI.FirstName
            ) AS RankResult,
            
            -- DWYT-16 New HubSpot API fields
            CASE CLP.CancelFromTelephone WHEN 'TRUE' THEN 'Y' ELSE 'N' END AS CancelFromTelephone,
            '' AS LastContactDate,
            HUBSPOT.dbo.fn_convertDateFromText([NEPTUNE_MAIL_CONTACT].F_added_date, @dateFormat) AS NeptuneCreateDate,
            COALESCE(REPLACE(REPLACE(REPLACE(CLI.ClientCode, 'TRT-M',''), 'TRT-S', ''), 'TRT-', ''), '') AS CleanClientID

        FROM    
            [NEPTUNE_Stage].[dbo].[ST_MARINE_BROCHURE_REQUEST] WITH (NOLOCK)
        INNER JOIN Clients CLI WITH (NOLOCK)
            ON [ST_MARINE_BROCHURE_REQUEST].ClientCode=CLI.ClientCode
            AND [ST_MARINE_BROCHURE_REQUEST].F_CONTACT_URN = CLI.F_URN
        INNER JOIN [NEPTUNE_Stage].[dbo].[NEPTUNE_MAIL_CONTACT] WITH (NOLOCK) 
            ON [NEPTUNE_MAIL_CONTACT].F_mail_no = CLI.MailNo
        LEFT JOIN ClientPreferences CLP WITH (NOLOCK)
            ON CLP.ClientCode=CLI.ClientCode
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Country] WITH (NOLOCK)
            ON [SL_Simplified_Country].[CountryActual]=CLI.Country
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Country_Language_SourceOffice] SO WITH (NOLOCK) 
            ON SO.[CountrySimplified_Language]=ISNULL([SL_Simplified_Country].[CountrySimplified],'') + [ST_MARINE_BROCHURE_REQUEST].[Language]
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Neptune_Client_Country] WITH (NOLOCK)
            ON [SL_Simplified_Neptune_Client_Country].[CountryActual]=CLI.Country
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Title] WITH (NOLOCK)
            ON [SL_Simplified_Title].[TitleActual]=CLI.Title
        WHERE
            (
                [ST_MARINE_BROCHURE_REQUEST].TYPE = 'LBE'
                OR
                [ST_MARINE_BROCHURE_REQUEST].BrochureName LIKE ('LeBoat Enews %')
            )
			AND [ST_MARINE_BROCHURE_REQUEST].DateRequested BETWEEN @startDate AND @endDate
--			AND [ST_MARINE_BROCHURE_REQUEST].DateRequested BETWEEN CONVERT(DATE,GETDATE()-10) AND CONVERT(DATE,GETDATE()-1)
--			AND [ST_MARINE_BROCHURE_REQUEST].DateRequested BETWEEN CONVERT(DATE,'2013-01-01', 120) AND CONVERT(DATE, '2013-12-31', 120)
--			AND [ST_MARINE_BROCHURE_REQUEST].DateRequested BETWEEN CONVERT(DATE,'2016-01-01', 120) AND CONVERT(DATE, '2016-12-31', 120)
    )Result
    Where RankResult=1
    ORDER BY EnewsDateRequested,Email

END

GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_NEPTUNE_QUOTES]    Script Date: 12/04/2019 10:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--========================================================================================================================
-- Procedure Date - Procedure Description
-- 30-Nov-2017      BUILD_HUBSPOT_NEPTUNE_QUOTES - Selects Neptune quote records for HubSpot upload
--
--========================================================================================================================
-- Change History===
--========================================================================================================================
-- Date             Version     Who                Comment
-- 30-Nov-2017      1.0         Tim Wilson         Revised for CRM Phase III
-- 04-Jan-2018      1.1         Tim Wilson         Corrected joins for Most Recent Booking
-- 10-Jan-2018      1.1         Tim Wilson         Added new column QuoteSalesAgent
-- 20-Mar-2018      1.3         Tim Wilson         Remove selection filter for Deceased flag
-- 23-Apr-2018      1.4         Tim Wilson         Resolve conflict between QuoteDuration and
--                                                 Bookings Duration
-- 27-Apr-2018      1.5         Tim Wilson         Drop duration columns altogether for quotes selections
-- 01-May-2018      1.6         Tim Wilson         Remove booking data columns
-- 17-May-2018      1.7         Tim Wilson         Select all data from 01-01-2010
-- 17-May-2018      1.8         Tim Wilson         Output dates in yyyy-mm-dd format
-- 21-May-2018      1.9         Tim Wilson         Corrections for dedupe logic
-- 18-Jun-2018      1.10        Tim Wilson         Recoded email-centrically
--========================================================================================================================

CREATE PROC [dbo].[BUILD_HUBSPOT_NEPTUNE_QUOTES] @pStartDate varchar(10) = NULL , @pEndDate varchar(10) = NULL, @pDateFormat varchar(10) = NULL
/* @pStartDate and @pEndDate are either a date string with format 'yyyy-mm-dd' or the word 'TODAY' for the current date */
AS
BEGIN

	DECLARE @startDate date, @endDate date, @dateFormat varchar(10)

	SET NOCOUNT ON;

	IF @pStartDate = 'TODAY'
	BEGIN
		SET @startDate = CONVERT(DATE,GETDATE())
	END
	ELSE
	BEGIN
		-- Default to 10 days ago
		SET @startDate = ISNULL(CONVERT(DATE,@pStartDate,120), CONVERT(DATE,GETDATE()-10))
	END

	IF @pEndDate = 'TODAY'
	BEGIN
		SET @endDate   = CONVERT(DATE,GETDATE())
	END
	ELSE
	BEGIN
		-- Default to yesterday
		SET @endDate   = ISNULL(CONVERT(DATE,@pEndDate,120), CONVERT(DATE,GETDATE()-1))
	END

	SET @dateFormat    = ISNULL(@pDateFormat, 'unix')

    SELECT DISTINCT
         LifecycleStage
        ,BrandName
        ,Charter
        ,BookingOfficeLocation
        ,BookingLanguage
        ,ClientCode
        ,Title
        ,FirstName
        ,LastName
        ,City
        ,County
        ,Postcode
        ,Country
        ,Email
        ,CancelFromMailing
        ,CancelFromEmail
        ,CancelFromBrochure
        ,Deceased
        ,Blacklisted
        ,QuoteDateRequested
        ,QuoteDepartureDate
        ,QuoteDestination
        ,Address1
        ,Address2
        ,Address3
        ,Phone1
        ,Phone2
        ,BusinessPhone
--        ,QuoteDuration
        ,QuoteBookRef
        ,[Status]
        ,CancelFromTelephone
--        ,Notes
        ,LastContactDate
        ,NeptuneCreateDate
        ,CleanClientID
        ,QuoteSalesAgent
    FROM
    (
        SELECT 
            'opportunity' AS LifecycleStage,
            'Le Boat Charter' AS BrandName,
            'Le Boat Charter' AS Charter,
            COALESCE([SL_Simplified_SalesOffice].[SalesOfficeSimplified],[ST_MARINE_REMBOOK].[Location],'') AS BookingOfficeLocation, 
            COALESCE([ST_MARINE_REMBOOK].[Language],'') AS BookingLanguage,
            [ST_MARINE_REMBOOK].MailNo AS ClientCode,
            COALESCE([SL_Simplified_Title].[TitleSimplified],'') AS Title,
            [ST_MARINE_REMBOOK].FirstName,
            [ST_MARINE_REMBOOK].Surname AS LastName,
            [ST_MARINE_REMBOOK].City,
            [ST_MARINE_REMBOOK].County,
            [ST_MARINE_REMBOOK].Postcode,
            COALESCE([SL_Simplified_Neptune_Client_Country].[CountrySimplified],[ST_MARINE_REMBOOK].Country,'') AS Country,
            REPLACE([ST_MARINE_REMBOOK].Email1,'\@','@') AS Email,
            CASE Client.CancelFromMailing WHEN 'TRUE' THEN 'Y' ELSE 'N' END AS CancelFromMailing,
            CASE Client.CancelFromEmail WHEN 'TRUE' THEN 'Y' ELSE 'N' END AS CancelFromEmail,
            CASE Client.CancelFromBrochure WHEN 'TRUE' THEN 'Y' ELSE 'N' END AS CancelFromBrochure,
            CASE Client.Deceased WHEN 'Y' THEN 'Y' ELSE 'N' END AS Deceased,
            CASE Client.Blacklisted WHEN 'Y' THEN 'Y' ELSE 'N' END AS Blacklisted,
            HUBSPOT.dbo.fn_convertDate([ST_MARINE_REMBOOK].RemovedDate, @dateFormat) AS QuoteDateRequested,
            HUBSPOT.dbo.fn_convertDate([ST_MARINE_REMBOOK].DepartureDate, @dateFormat) AS QuoteDepartureDate,
            COALESCE([SL_BaseNameFull].[BaseName],[ST_MARINE_REMBOOK].Fromcharterlocation) AS QuoteDestination,
            COALESCE([ST_MARINE_REMBOOK].Add1,'') AS Address1,
            COALESCE([ST_MARINE_REMBOOK].Add2,'') AS Address2,
            COALESCE([ST_MARINE_REMBOOK].Add3,'') AS Address3,
            COALESCE([ST_MARINE_REMBOOK].Phone1,'') AS Phone1,
            COALESCE([ST_MARINE_REMBOOK].Phone2,'') AS Phone2,
            COALESCE([ST_MARINE_REMBOOK].Phone3,'') AS BusinessPhone,
            COALESCE([ST_MARINE_REMBOOK].Duration,'') AS QuoteDuration, 
            COALESCE([ST_MARINE_REMBOOK].BookRef,'') AS QuoteBookRef,
            'Quote' AS Status,
            DENSE_RANK() OVER(PARTITION BY REPLACE([ST_MARINE_REMBOOK].Email1,'\@','@')
                ORDER BY 
                    [ST_MARINE_REMBOOK].RemovedDate DESC,
                    [ST_MARINE_REMBOOK].BookRef DESC,
                    (CASE Client.CancelFromEmail WHEN 'TRUE' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE Client.CancelFromMailing WHEN 'TRUE' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE Client.CancelFromBrochure WHEN 'TRUE' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE Client.CancelFromTelephone WHEN 'TRUE' THEN 'Y' ELSE 'N' END) DESC,
                    [ST_MARINE_REMBOOK].Surname,
                    [ST_MARINE_REMBOOK].FirstName
            ) AS RankResult,
            
            -- DWYT-16 New HubSpot API fields
            CASE Client.CancelFromTelephone WHEN 'TRUE' THEN 'Y' ELSE 'N' END AS CancelFromTelephone,
            '' AS Notes,
            COALESCE(Client.LastContactDate,'') AS LastContactDate,
            COALESCE(Client.CreateDate,'') AS NeptuneCreateDate,
            [ST_MARINE_REMBOOK].MailNo AS CleanClientID,
            COALESCE([ST_MARINE_REMBOOK].AgencyKeyContactName,'') AS QuoteSalesAgent

        FROM
            [NEPTUNE_Stage].[dbo].[ST_MARINE_REMBOOK] WITH (NOLOCK)
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_SalesOffice] WITH (NOLOCK)
            ON [SL_Simplified_SalesOffice].[SalesOfficeFromRawData]=[ST_MARINE_REMBOOK].[Location]
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Neptune_Client_Country] WITH (NOLOCK)
            ON [SL_Simplified_Neptune_Client_Country].[CountryActual]=[ST_MARINE_REMBOOK].Country
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Title] WITH (NOLOCK)
            ON [SL_Simplified_Title].[TitleActual]=CONVERT(NVARCHAR(50),[ST_MARINE_REMBOOK].Title)
        LEFT JOIN [SL_BaseNameFull] WITH (NOLOCK)
            ON [SL_BaseNameFull].BaseCode = [ST_MARINE_REMBOOK].Fromcharterlocation
            AND [SL_BaseNameFull].Brand = 'LBT'
        -- Client data
        LEFT JOIN
            ( SELECT 
                DISTINCT 
                    [ST_MARINE_CLIENTS].Email1 AS Email1,
                    [ST_MARINE_CLIENTS].MailNo AS MailNo,
                    [ST_MARINE_CLIENTS].Deceased,
                    [ST_MARINE_CLIENTS].Blacklisted,
                    [ST_MARINE_CLIENT_PREFERENCE].CancelFromEmail,
                    [ST_MARINE_CLIENT_PREFERENCE].CancelFromMailing,
                    [ST_MARINE_CLIENT_PREFERENCE].CancelFromBrochure,
                    [ST_MARINE_CLIENT_PREFERENCE].CancelFromTelephone,
                    [ST_MARINE_CLIENTS].ClientCode,
                    '' AS LastContactDate,
                    HUBSPOT.dbo.fn_convertDateFromText([NEPTUNE_MAIL_CONTACT].F_added_date, @dateFormat) AS CreateDate
                FROM 
                    [NEPTUNE_Stage].[dbo].[ST_MARINE_CLIENTS] WITH (NOLOCK) 
                INNER JOIN [NEPTUNE_Stage].[dbo].[ST_MARINE_CLIENT_PREFERENCE] WITH (NOLOCK) 
                    ON [ST_MARINE_CLIENT_PREFERENCE].ClientCode=[ST_MARINE_CLIENTS].ClientCode
                INNER JOIN [NEPTUNE_Stage].[dbo].[NEPTUNE_MAIL_CONTACT] WITH (NOLOCK) 
                    ON [NEPTUNE_MAIL_CONTACT].F_mail_no = [ST_MARINE_CLIENTS].MailNo
                INNER JOIN [NEPTUNE_Stage].[dbo].[NEPTUNE_FAMILY] WITH (NOLOCK)
                    ON [NEPTUNE_FAMILY].F_mail_no = [NEPTUNE_MAIL_CONTACT].[F_mail_no]
                    AND [NEPTUNE_FAMILY].F_leader = 'true'
                WHERE 
                        [ST_MARINE_CLIENTS].Lead = 'Yes'
                    AND [ST_MARINE_CLIENTS].Email1 LIKE '%_@%_.__%'
--                    AND REPLACE([ST_MARINE_CLIENTS].Email1,'\@','@') = REPLACE([ST_MARINE_REMBOOK].Email1,'\@','@')
--                    AND [ST_MARINE_CLIENTS].MailNo = [ST_MARINE_REMBOOK].MailNo
                    AND [ST_MARINE_CLIENTS].Email1 NOT LIKE '%[[]%' 
                    AND [ST_MARINE_CLIENTS].Email1 NOT LIKE '%]%' 
                    AND [ST_MARINE_CLIENTS].Email1 NOT LIKE '%(%'
                    AND [ST_MARINE_CLIENTS].Email1 NOT LIKE '%)%'
                    AND [ST_MARINE_CLIENTS].Email1 NOT LIKE '%''%'
                    AND [ST_MARINE_CLIENTS].Email1 NOT LIKE '% %'
            ) Client
            ON REPLACE([ST_MARINE_REMBOOK].Email1,'\@','@') = REPLACE(Client.Email1,'\@','@')
            AND [ST_MARINE_REMBOOK].MailNo = Client.MailNo
        WHERE
				[ST_MARINE_REMBOOK].Email1 LIKE '%_@%_.__%'
			AND [ST_MARINE_REMBOOK].Email1 NOT LIKE '%[[]%' 
			AND [ST_MARINE_REMBOOK].Email1 NOT LIKE '%]%' 
			AND [ST_MARINE_REMBOOK].Email1 NOT LIKE '%(%'
			AND [ST_MARINE_REMBOOK].Email1 NOT LIKE '%)%'
			AND [ST_MARINE_REMBOOK].Email1 NOT LIKE '%''%'
			AND [ST_MARINE_REMBOOK].Email1 NOT LIKE '% %'
			AND [ST_MARINE_REMBOOK].CompanyNo='5'
			AND [ST_MARINE_REMBOOK].RemovedDate BETWEEN @startDate AND @endDate
--	        AND [ST_MARINE_REMBOOK].RemovedDate BETWEEN CONVERT(DATE,GETDATE()-10) AND CONVERT(DATE,GETDATE()-1)
--	        AND [ST_MARINE_REMBOOK].RemovedDate BETWEEN CONVERT(DATE,'2013-01-01', 120) AND CONVERT(DATE, '2013-12-31', 120)
--	        AND [ST_MARINE_REMBOOK].RemovedDate BETWEEN CONVERT(DATE,'2016-01-01', 120) AND CONVERT(DATE, '2016-12-31', 120)
    )Result
    WHERE 
        RankResult=1 
    ORDER BY 
        QuoteDateRequested,Email

END

GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_TRITON_FL_BOOKINGS]    Script Date: 12/04/2019 10:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--========================================================================================================================
-- Procedure Date - Procedure Description
-- 30-Nov-2017      BUILD_HUBSPOT_TRITON_FL_BOOKINGS - Selects Triton Footloose booking records for HubSpot upload
--
--========================================================================================================================
-- Change History===
--========================================================================================================================
-- Date             Version     Who                Comment
-- 30-Nov-2017      1.0         Tim Wilson         Revised for CRM Phase III
-- 20-Mar-2018      1.1         Tim Wilson         Remove selection filter for Deceased flag; Add BookingStatus column
-- 25-Apr-2018      1.4         Tim Wilson         Resolve client code only unique within brand issue
-- 17-May-2018      1.5         Tim Wilson         Select all data from 01-01-2010
-- 17-May-2018      1.6         Tim Wilson         Output dates in yyyy-mm-dd format
-- 21-May-2018      1.7         Tim Wilson         Corrections for dedup logic
-- 13-Jun-2018      1.8         Tim Wilson         Recoded email-centrically and using temp tables for clarity
--========================================================================================================================

CREATE PROC [dbo].[BUILD_HUBSPOT_TRITON_FL_BOOKINGS] @pStartDate varchar(10) = NULL , @pEndDate varchar(10) = NULL, @pDateFormat varchar(10) = NULL
/* @pStartDate and @pEndDate are either a date string with format 'yyyy-mm-dd' or the word 'TODAY' for the current date */
AS
BEGIN

	DECLARE @startDate date, @endDate date, @dateFormat varchar(10)

	SET NOCOUNT ON;

	IF @pStartDate = 'TODAY'
	BEGIN
		SET @startDate = CONVERT(DATE,GETDATE())
	END
	ELSE
	BEGIN
		-- Default to 10 days ago
		SET @startDate = ISNULL(CONVERT(DATE,@pStartDate,120), CONVERT(DATE,GETDATE()-10))
	END

	IF @pEndDate = 'TODAY'
	BEGIN
		SET @endDate   = CONVERT(DATE,GETDATE())
	END
	ELSE
	BEGIN
		-- Default to yesterday
		SET @endDate   = ISNULL(CONVERT(DATE,@pEndDate,120), CONVERT(DATE,GETDATE()-1))
	END

	SET @dateFormat    = ISNULL(@pDateFormat, 'unix')

	IF OBJECT_ID('tempdb..#ClientPreferences') IS NOT NULL
		DROP TABLE #ClientPreferences

	SELECT
		 ClientCode
		,CancelFromBrochure
		,CancelFromMailing
		,CancelFromEmail
		,CancelFromTelephone
		,CancelFromSMS
		,CancelFromElectronicB
	INTO #ClientPreferences
	FROM
	(
		SELECT
			 [ClientCode]
			,MAX(ISNULL([CancelFromBrochure],'')) CancelFromBrochure
			,MAX(ISNULL([CancelFromMailing],'')) CancelFromMailing
			,MAX(ISNULL([CancelFromEmail],'')) CancelFromEmail
			,MAX(ISNULL([CancelFromTelephone],'')) CancelFromTelephone
			,MAX(ISNULL([CancelFromSMS],'')) CancelFromSMS
			,MAX(ISNULL([CancelFromElectronicB],'')) CancelFromElectronicB
		FROM [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENTPREFERENCES] WITH (NOLOCK)
		GROUP BY [ClientCode]
	) ClientPreferencesInnerSelect

	IF OBJECT_ID('tempdb..#Clients') IS NOT NULL
		DROP TABLE #Clients

	SELECT 
		 ClientCode
		,Email1 AS ClientEmail
		,Title
        ,FirstName
        ,LastName
        ,City
        ,County
        ,Postcode
		,Country
        ,Add1
        ,Add2
        ,Add3
        ,Phone1
        ,Phone2
        ,MobilePhone
        ,DateOfBirth
		,Deceased
		,Blacklisted
		,BookingOffice
		,BusinessPhone
		,NumberOfCharters
		,CustomerLinkCode
		,CustomerClass
		,GoneAway
		,ClientSourceCode
		,LastContactDate
		,DateCreated
	INTO #Clients
	FROM [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENT] WITH (NOLOCK)
    WHERE
            Brand = 'M'
	    AND Email1 LIKE '%_@%_.__%'
		AND Email1 NOT LIKE '%[[]%' AND Email1 NOT LIKE '%]%' AND Email1 NOT LIKE '%(%' AND Email1 NOT LIKE '%)%' AND Email1 NOT LIKE '%''%' AND Email1 NOT LIKE '% %'

	IF OBJECT_ID('tempdb..#MostRecentBooking') IS NOT NULL
		DROP TABLE #MostRecentBooking

	SELECT
		ConfirmDate
		,BookingSourcePrimary
		,BookingOfficeLocation
		,BookingLanguageFull
		,ProductName
		,BookingDate
		,DepartureDate
		,AreaName
		,AreaCode
		,UserDefinable1
		,ExecutiveReportingRegion
		,Duration
		,BookRef
		,CancelledDate
		,BrandName
		,[Status]
		,BookingSourceSecondary
		,AgentCode
		,TotalPax
		,BookingType
		,ClientCode
		,ClientEmail
--		,RankResultMostRecentBooking
	INTO #MostRecentBooking
	FROM
		(
			SELECT
				[CELERITY_ST_BOOKINGS].ConfirmDate,
				[CELERITY_ST_BOOKINGS].BookingSourcePrimary,
				[CELERITY_ST_BOOKINGS].BookingOfficeLocation,
				[CELERITY_ST_BOOKINGS].BookingLanguageFull,
				COALESCE([SL_Simplified_ProductName].ProductNameSimplified, '') AS ProductName,
				[CELERITY_ST_BOOKINGS].BookingDate,
				[CELERITY_ST_BOOKINGS].DepartureDate,
				[CELERITY_ST_BOOKINGS].AreaName,
				[CELERITY_ST_BOOKINGS].AreaCode,
				[CELERITY_ST_BOOKINGS].UserDefinable1,
				[CELERITY_ST_BOOKINGS].ExecutiveReportingRegion,
				[CELERITY_ST_BOOKINGS].Duration,
				[CELERITY_ST_BOOKINGS].BookRef,
				[CELERITY_ST_BOOKINGS].CancelledDate,
				[CELERITY_ST_BOOKINGS].BrandName,
				[CELERITY_ST_BOOKINGS].[Status],
				[CELERITY_ST_BOOKINGS].BookingSourceSecondary,
				[CELERITY_ST_BOOKINGS].AgentCode,
				[CELERITY_ST_BOOKINGS].[TotalPax],
				[CELERITY_ST_BOOKINGS].BookingType,
				CLI.ClientCode,
				CLI.ClientEmail,
				DENSE_RANK() OVER(PARTITION BY CLI.ClientEmail
					ORDER BY 
						[CELERITY_ST_BOOKINGS].BookingDate DESC,
						[CELERITY_ST_BOOKINGS].BookRef DESC, 
						[CELERITY_ST_BOOKINGS].ConfirmDate DESC,
						CLI.ClientCode DESC
					) AS RankResultMostRecentBooking
				FROM 
					[CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKINGS] WITH (NOLOCK)
				INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKEDPASSENGERS] WITH (NOLOCK)
					ON [CELERITY_ST_BOOKEDPASSENGERS].BookRef=[CELERITY_ST_BOOKINGS].BookRef
				INNER JOIN #Clients CLI WITH (NOLOCK)
					ON CLI.ClientCode=[CELERITY_ST_BOOKEDPASSENGERS].ClientCode
				LEFT JOIN [SL_Simplified_ProductName] WITH (NOLOCK)
					ON [SL_Simplified_ProductName].[ProductNameActual]=[CELERITY_ST_BOOKINGS].ProductName
				WHERE 
					[CELERITY_ST_BOOKINGS].BrandName ='FTL'
				AND [CELERITY_ST_BOOKINGS].[Status] IN ('Booking','Cancelled')
				AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN @startDate AND @endDate
				AND [CELERITY_ST_BOOKINGS].BookingSourcePrimary NOT IN ('PR-Pr free trip','TAAC-Ta on account','PR-Public relations-mor','PRESS-Bericht in der press','STAFF-Staff booking','OWNS-Owner with no paymen','OS-Wot-offshore sailing','OWNER-Owner','DAYCH-Day charter discount','LOCAL-Local booking','OS-Offshore sailing','OSS-Offshore sailing','OW-Owner use','OPS-Operations/maintenan','TA','STHOL-Staff holiday','TAGEN-Travel agent','OSSFF-Staff friends & fami','LOCA2-Local booking','TO-Tour operator')
				AND [CELERITY_ST_BOOKINGS].AreaCode NOT IN ('UKD','UK1','CVO','SS1','UK2','SS2','UK3','FLT','UK4')
				AND [CELERITY_ST_BOOKINGS].ProductName IN ('SAILING_SCHOOLS','CREWED','FLOTILLA','FRANCHISE','FOOTLOOSE','BAREBOAT','CORPORATE','POWER')
				AND [CELERITY_ST_BOOKINGS].BookingType ='DIRECT'
				AND [CELERITY_ST_BOOKINGS].UserDefinable1 IS NOT NULL
				AND LTRIM(RTRIM([CELERITY_ST_BOOKINGS].UserDefinable1)) <> '' 
        ) MostRecentBookingInnerSelect
	WHERE RankResultMostRecentBooking = 1

	IF OBJECT_ID('tempdb..#FirstCharter') IS NOT NULL
		DROP TABLE #FirstCharter

	SELECT
        BookRef AS FirstCharterBookRef
        ,DepartureDate AS FirstCharterDepartureDate
        ,Destination AS FirstCharterDestination
        ,BookingDate AS FirstCharterDateBooked
        ,ProductName AS FirstCharterProduct
        ,HullType AS FirstCharterHullType
        ,UserDefinable1 AS FirstCharterBoat
        ,ClientCode AS FirstCharterClientCode
		,ClientEmail AS FirstCharterClientEmail
--      ,RankResultFirstCharter
	INTO #FirstCharter
	FROM
        (
            SELECT
                [CELERITY_ST_BOOKINGS].BookRef,
                HUBSPOT.dbo.fn_convertDate([CELERITY_ST_BOOKINGS].DepartureDate, @dateFormat) AS DepartureDate,
                COALESCE([SL_BaseNameFull].[BaseName],[CELERITY_ST_BOOKINGS].AreaName) AS Destination,
                HUBSPOT.dbo.fn_convertDate([CELERITY_ST_BOOKINGS].BookingDate, @dateFormat) AS BookingDate,
                COALESCE([SL_Simplified_ProductName].ProductNameSimplified, '') AS ProductName,
                CASE
                    WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1, 3, 1) = 'P' THEN 'Power'
                    WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1, 3, 1) = 'X' THEN 'Catamaran'
                    WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1, 3, 1) = 'L' THEN 'Catamaran'
                    ELSE 'Monohull'
                END AS HullType,
                [CELERITY_ST_BOOKINGS].UserDefinable1,
                CLI.ClientCode,
				CLI.ClientEmail,
				DENSE_RANK() OVER(PARTITION BY CLI.ClientEmail
					ORDER BY 
						[CELERITY_ST_BOOKINGS].BookingDate ASC,
						[CELERITY_ST_BOOKINGS].BookRef DESC, 
						[CELERITY_ST_BOOKINGS].ConfirmDate DESC,
						CLI.ClientCode DESC
					) AS RankResultFirstCharter
            FROM 
                [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKINGS] WITH (NOLOCK)
            INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKEDPASSENGERS] WITH (NOLOCK)
                ON [CELERITY_ST_BOOKEDPASSENGERS].BookRef=[CELERITY_ST_BOOKINGS].BookRef
            INNER JOIN #Clients CLI WITH (NOLOCK)
                ON CLI.ClientCode=[CELERITY_ST_BOOKEDPASSENGERS].ClientCode
			LEFT JOIN [SL_Simplified_ProductName] WITH (NOLOCK)
				ON [SL_Simplified_ProductName].[ProductNameActual]=[CELERITY_ST_BOOKINGS].ProductName
            LEFT JOIN [HUBSPOT].[dbo].[SL_BaseNameFull] WITH (NOLOCK)
                ON [SL_BaseNameFull].BaseCode = [CELERITY_ST_BOOKINGS].AreaCode
                AND [SL_BaseNameFull].Brand = 'MRG'
            WHERE 
                [CELERITY_ST_BOOKINGS].BrandName ='FTL'
            AND [CELERITY_ST_BOOKINGS].[Status] = 'Booking'
            AND [CELERITY_ST_BOOKINGS].BookingDate >= CONVERT(date,'2010-01-01 00:00:00.000')
            AND [CELERITY_ST_BOOKINGS].BookingSourcePrimary NOT IN ('PR-Pr free trip','TAAC-Ta on account','PR-Public relations-mor','PRESS-Bericht in der press','STAFF-Staff booking','OWNS-Owner with no paymen','OS-Wot-offshore sailing','OWNER-Owner','DAYCH-Day charter discount','LOCAL-Local booking','OS-Offshore sailing','OSS-Offshore sailing','OW-Owner use','OPS-Operations/maintenan','TA','STHOL-Staff holiday','TAGEN-Travel agent','OSSFF-Staff friends & fami','LOCA2-Local booking','TO-Tour operator')
            AND [CELERITY_ST_BOOKINGS].AreaCode NOT IN ('UKD','UK1','CVO','SS1','UK2','SS2','UK3','FLT','UK4')
            AND [CELERITY_ST_BOOKINGS].ProductName IN ('SAILING_SCHOOLS','CREWED','FLOTILLA','FRANCHISE','FOOTLOOSE','BAREBOAT','CORPORATE','POWER')
            AND [CELERITY_ST_BOOKINGS].BookingType ='DIRECT'
            AND [CELERITY_ST_BOOKINGS].UserDefinable1 IS NOT NULL
            AND LTRIM(RTRIM([CELERITY_ST_BOOKINGS].UserDefinable1)) <> '' 
        ) FirstCharterInnerSelect
	WHERE RankResultFirstCharter = 1

	IF OBJECT_ID('tempdb..#CancelledBookings') IS NOT NULL
		DROP TABLE #CancelledBookings

    SELECT
        BookRef AS CancellationBookRef
        ,CancellationDate AS CancellationDate
        ,ClientCode AS CancellationClientCode
		,ClientEmail AS CancellationClientEmail
--      ,RankResultCancellation
	INTO #CancelledBookings
    FROM
		(
			SELECT
				[CELERITY_ST_BOOKINGS].BookRef,
				HUBSPOT.dbo.fn_convertDate([CELERITY_ST_BOOKINGS].CancelledDate, @dateFormat) AS CancellationDate,
				CLI.ClientCode,
				CLI.ClientEmail,
				DENSE_RANK() OVER(PARTITION BY CLI.ClientEmail
					ORDER BY 
						[CELERITY_ST_BOOKINGS].BookingDate DESC,
						[CELERITY_ST_BOOKINGS].BookRef DESC, 
						[CELERITY_ST_BOOKINGS].ConfirmDate DESC,
						CLI.ClientCode DESC
				) AS RankResultCancellation
			FROM 
				[CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKINGS] WITH (NOLOCK)
			INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKEDPASSENGERS] WITH (NOLOCK)
				ON [CELERITY_ST_BOOKEDPASSENGERS].BookRef=[CELERITY_ST_BOOKINGS].BookRef
			INNER JOIN #Clients CLI WITH (NOLOCK)
				ON CLI.ClientCode=[CELERITY_ST_BOOKEDPASSENGERS].ClientCode
			WHERE 
				[CELERITY_ST_BOOKINGS].BrandName ='FTL'
			AND [CELERITY_ST_BOOKINGS].[Status] IN ('Booking','Cancelled')
			AND [CELERITY_ST_BOOKINGS].CancelledDate IS NOT NULL
			--Search all bookings for most recent cancellation records
			--AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,GETDATE()-8) AND CONVERT(DATE,GETDATE()-1)
			--AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN '2017-08-03' AND '2017-09-10'
			--AND [CELERITY_ST_BOOKINGS].BookingDate >= CONVERT(date,'2010-01-01 00:00:00.000')
			AND [CELERITY_ST_BOOKINGS].BookingSourcePrimary NOT IN ('PR-Pr free trip','TAAC-Ta on account','PR-Public relations-mor','PRESS-Bericht in der press','STAFF-Staff booking','OWNS-Owner with no paymen','OS-Wot-offshore sailing','OWNER-Owner','DAYCH-Day charter discount','LOCAL-Local booking','OS-Offshore sailing','OSS-Offshore sailing','OW-Owner use','OPS-Operations/maintenan','TA','STHOL-Staff holiday','TAGEN-Travel agent','OSSFF-Staff friends & fami','LOCA2-Local booking','TO-Tour operator')
			AND [CELERITY_ST_BOOKINGS].AreaCode NOT IN ('UKD','UK1','CVO','SS1','UK2','SS2','UK3','FLT','UK4')
			AND [CELERITY_ST_BOOKINGS].ProductName IN ('SAILING_SCHOOLS','CREWED','FLOTILLA','FRANCHISE','FOOTLOOSE','BAREBOAT','CORPORATE','POWER')
			AND [CELERITY_ST_BOOKINGS].BookingType ='DIRECT'
			AND [CELERITY_ST_BOOKINGS].UserDefinable1 IS NOT NULL
			AND LTRIM(RTRIM([CELERITY_ST_BOOKINGS].UserDefinable1)) <> '' 
		) CancelledBookingsInnerSelect
	WHERE RankResultCancellation = 1

    SELECT
        'customer' AS LifecycleStage,
        'Footloose' AS BrandName,
        HUBSPOT.dbo.fn_convertDate(#MostRecentBooking.ConfirmDate, @dateFormat) AS ConfirmDate,
        #MostRecentBooking.BookingSourcePrimary,
        COALESCE([SL_Simplified_SalesOffice].[SalesOfficeSimplified],#MostRecentBooking.BookingOfficeLocation,'') AS BookingOfficeLocation,
        COALESCE([SL_Simplified_Language].[LanguageSimplified],#MostRecentBooking.BookingLanguageFull,'') AS BookingLanguage,
        CLI.ClientCode,
        COALESCE([SL_Simplified_Title].[TitleSimplified],'') AS Title,
        CLI.FirstName,
        CLI.LastName,
        CLI.City,
        CLI.County,
        CLI.Postcode,
        COALESCE([SL_Simplified_Triton_Client_Country].[CountrySimplified],CLI.Country,'') AS Country,
        CLI.ClientEmail AS Email,
        CASE #ClientPreferences.CancelFromMailing WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromMailing,
        CASE #ClientPreferences.CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromEmail,
        CASE #ClientPreferences.[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromBrochure,
        CLI.Deceased,
        CASE CLI.Blacklisted WHEN 'Y' THEN 'true' ELSE 'false' END AS Blacklisted,
        #MostRecentBooking.ProductName AS BookingProductName,
        HUBSPOT.dbo.fn_convertDate(#MostRecentBooking.BookingDate, @dateFormat) AS BookingDateBooked,
        HUBSPOT.dbo.fn_convertDate(#MostRecentBooking.DepartureDate, @dateFormat) AS BookingDepartureDate,
        COALESCE([SL_BaseNameFull].[BaseName],#MostRecentBooking.AreaName) AS BookingDestination,
        CASE WHEN SUBSTRING(#MostRecentBooking.UserDefinable1,3,1) IN ('X','L','P') THEN 'Catamaran' ELSE 'Monohull' END AS BookingHullType, 
        COALESCE(CLI.[Add1],'') AS Address1,
        COALESCE(CLI.[Add2],'') AS Address2,
        COALESCE(CLI.[Add3],'') AS Address3,
        COALESCE(CLI.[Phone1],'') AS Phone1,
        COALESCE(CLI.[Phone2],'') AS Phone2,
        COALESCE(CLI.[BusinessPhone],'') AS BusinessPhone,
        HUBSPOT.dbo.fn_convertDate(CLI.DateOfBirth, @dateFormat) AS DateOfBirth,
        COALESCE(#MostRecentBooking.ExecutiveReportingRegion,'') AS BookingExecutiveReportingRegion,
        COALESCE(CLI.NumberOfCharters,'') AS NumberOfCharters,
        COALESCE(#MostRecentBooking.Duration,'') AS Duration,
        --COALESCE([CELERITY_ST_BOOKINGS].CleanBaseName,'') AS CleanBaseName,--Ignore for now
        --COALESCE([CELERITY_ST_BOOKINGS].CleanBoatName,'') AS CleanBoatName,--Ignore for now
        COALESCE(#MostRecentBooking.UserDefinable1,'') AS BookingBoat,
        COALESCE(#MostRecentBooking.BookRef,'') AS BookingBookRef,
        COALESCE(CLI.CustomerLinkCode,'') AS CustomerLinkCode,
        COALESCE(CLI.[CustomerClass],'') AS CustomerClass,
        CASE CLI.GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END AS GoneAway,
        COALESCE(CLI.ClientSourceCode,'') AS ClientSourceCode,
        'Booking' AS [Status], 
        COALESCE([SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified],'') AS ClientBookingOffice,

        -- DWYT-16 New HubSpot API fields
        CASE #ClientPreferences.[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromTelephone,
        HUBSPOT.dbo.fn_convertDateFromText(CLI.LastContactDate, @dateFormat) AS LastContactDate,
        HUBSPOT.dbo.fn_convertDate(#MostRecentBooking.CancelledDate, @dateFormat) AS BookingCancellationDate,
        COALESCE(#CancelledBookings.CancellationDate,'') AS CancellationCancellationDate,
        COALESCE(#CancelledBookings.CancellationBookRef,'') AS CancellationBookRef,
        COALESCE(#FirstCharter.FirstCharterDepartureDate,'') AS FirstCharterDepartureDate,
        COALESCE(#FirstCharter.FirstCharterDestination,'') AS FirstCharterDestination,
        COALESCE(#FirstCharter.FirstCharterDateBooked,'') AS FirstCharterDateBooked,
        COALESCE(#FirstCharter.FirstCharterProduct,'') AS FirstCharterProduct,
        COALESCE(#FirstCharter.FirstCharterHullType,'') AS FirstCharterHullType,
        COALESCE(#FirstCharter.FirstCharterBoat,'') AS FirstCharterBoat,
        (SELECT COUNT(*) FROM [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKINGS] WITH (NOLOCK)
            INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKEDPASSENGERS] WITH (NOLOCK)
            ON [CELERITY_ST_BOOKEDPASSENGERS].BookRef=[CELERITY_ST_BOOKINGS].BookRef
            INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENT] WITH (NOLOCK)
            ON [CELERITY_ST_BOOKEDPASSENGERS].ClientCode = [CELERITY_ST_CLIENT].ClientCode
            WHERE [CELERITY_ST_CLIENT].ClientCode = CLI.ClientCode
            AND [CELERITY_ST_BOOKINGS].BrandName ='FTL'
            AND [CELERITY_ST_BOOKINGS].[Status] = 'Booking'
        ) AS NumberOfBookings,
        HUBSPOT.dbo.fn_convertDate(CLI.DateCreated, @dateFormat) AS TritonCreateDate,
        COALESCE(#MostRecentBooking.BookingSourceSecondary,'') AS BookingSourceSecondary,
        '' AS BookingSourceTertiary,
        COALESCE(#MostRecentBooking.AgentCode,'') AS BookingSalesAgent,
        COALESCE(REPLACE(REPLACE(REPLACE(CLI.ClientCode, 'TRT-M',''), 'TRT-S', ''), 'TRT-', ''), '') AS CleanClientID,
        COALESCE(REPLACE(REPLACE(REPLACE(#MostRecentBooking.BookRef, 'TRT-M', ''), 'TRT-S', ''), 'TRT-', ''),'') AS BookingCleanBookRef,
        COALESCE(#MostRecentBooking.[TotalPax],0) AS BookingTotalPax,
        COALESCE(REPLACE(#MostRecentBooking.[Status], 'Booking', 'Confirmed'),'') AS BookingStatus
    FROM 
        #MostRecentBooking WITH (NOLOCK)
    INNER JOIN #Clients CLI WITH (NOLOCK)
        ON CLI.ClientCode=#MostRecentBooking.ClientCode
	LEFT JOIN #ClientPreferences WITH (NOLOCK)
		ON #ClientPreferences.ClientCode = CLI.ClientCode
	LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_SalesOffice] WITH (NOLOCK)
        --ON [SL_Simplified_SalesOffice].BrandName=#MostRecentBooking.BrandName AND [SL_Simplified_SalesOffice].[SalesOfficeFromRawData]=#MostRecentBooking.BookingOfficeLocation
		ON [SL_Simplified_SalesOffice].BrandName='MRG' AND [SL_Simplified_SalesOffice].[SalesOfficeFromRawData]=#MostRecentBooking.BookingOfficeLocation
    LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Language] WITH (NOLOCK)
        ON [SL_Simplified_Language].LanguageActual=#MostRecentBooking.BookingLanguageFull
    LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Triton_Client_Country] WITH (NOLOCK)
        ON [SL_Simplified_Triton_Client_Country].[CountryActual]=CLI.Country
    LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Title] WITH (NOLOCK)
        ON [SL_Simplified_Title].[TitleActual]=CLI.Title
    LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_ClientBookingOffice] WITH (NOLOCK)
        ON [SL_Simplified_ClientBookingOffice].[ClientBookingOfficeActual]=CLI.BookingOffice
    LEFT JOIN [HUBSPOT].[dbo].[SL_BaseNameFull] WITH (NOLOCK)
        ON [SL_BaseNameFull].BaseCode = #MostRecentBooking.AreaCode
        AND [SL_BaseNameFull].Brand = 'MRG'
    -- First Charter records
    LEFT JOIN #FirstCharter
		ON #FirstCharter.FirstCharterClientEmail = CLI.ClientEmail
    -- Most recent cancellation records
    LEFT JOIN #CancelledBookings
	    ON #CancelledBookings.CancellationClientEmail = CLI.ClientEmail
	ORDER BY ConfirmDate,CLI.ClientEmail

END

GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_TRITON_FL_QUOTES]    Script Date: 12/04/2019 10:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--========================================================================================================================
-- Procedure Date - Procedure Description
-- 30-Nov-2017      BUILD_HUBSPOT_TRITON_FL_QUOTES - Selects Triton Footloose quote records for HubSpot upload
--
--========================================================================================================================
-- Change History===
--========================================================================================================================
-- Date             Version     Who                Comment
-- 30-Nov-2017      1.0         Tim Wilson         Revised for CRM Phase III
-- 10-Jan-2018      1.1         Tim Wilson         Added JOIN for most recent booking data
--                                                 Added new column QuoteSalesAgent
-- 20-Mar-2018      1.2         Tim Wilson         Remove selection filter for Deceased flag; Add BookingStatus column
-- 23-Apr-2018      1.3         Tim Wilson         Resolve conflict between QuoteDuration and
--                                                 Bookings Duration
-- 25-Apr-2018      1.4         Tim Wilson         Resolve client code only unique within brand issue
-- 27-Apr-2018      1.5         Tim Wilson         Drop duration columns altogether for quotes selections
-- 01-May-2018      1.6         Tim Wilson         Remove booking data columns
-- 17-May-2018      1.7         Tim Wilson         Select all data from 01-01-2010
-- 17-May-2018      1.8         Tim Wilson         Output dates in yyyy-mm-dd format
-- 21-May-2018      1.9         Tim Wilson         Corrections for dedupe logic
-- 18-Jun-2018      1.10        Tim Wilson         Recoded email-centrically and using CTEs for clarity
--========================================================================================================================

CREATE PROC [dbo].[BUILD_HUBSPOT_TRITON_FL_QUOTES] @pStartDate varchar(10) = NULL , @pEndDate varchar(10) = NULL, @pDateFormat varchar(10) = NULL
/* @pStartDate and @pEndDate are either a date string with format 'yyyy-mm-dd' or the word 'TODAY' for the current date */
AS
BEGIN

	DECLARE @startDate date, @endDate date, @dateFormat varchar(10)

	SET NOCOUNT ON;

	IF @pStartDate = 'TODAY'
	BEGIN
		SET @startDate = CONVERT(DATE,GETDATE())
	END
	ELSE
	BEGIN
		-- Default to 10 days ago
		SET @startDate = ISNULL(CONVERT(DATE,@pStartDate,120), CONVERT(DATE,GETDATE()-10))
	END

	IF @pEndDate = 'TODAY'
	BEGIN
		SET @endDate   = CONVERT(DATE,GETDATE())
	END
	ELSE
	BEGIN
		-- Default to yesterday
		SET @endDate   = ISNULL(CONVERT(DATE,@pEndDate,120), CONVERT(DATE,GETDATE()-1))
	END

	SET @dateFormat    = ISNULL(@pDateFormat, 'unix')
;
WITH ClientPreferences
(
	 ClientCode
	,CancelFromBrochure
	,CancelFromMailing
	,CancelFromEmail
	,CancelFromTelephone
	,CancelFromSMS
	,CancelFromElectronicB
)
AS
(
	SELECT
		 ClientCode
		,CancelFromBrochure
		,CancelFromMailing
		,CancelFromEmail
		,CancelFromTelephone
		,CancelFromSMS
		,CancelFromElectronicB
	FROM
	(
		SELECT
			 [ClientCode]
			,MAX(ISNULL([CancelFromBrochure],'')) CancelFromBrochure
			,MAX(ISNULL([CancelFromMailing],'')) CancelFromMailing
			,MAX(ISNULL([CancelFromEmail],'')) CancelFromEmail
			,MAX(ISNULL([CancelFromTelephone],'')) CancelFromTelephone
			,MAX(ISNULL([CancelFromSMS],'')) CancelFromSMS
			,MAX(ISNULL([CancelFromElectronicB],'')) CancelFromElectronicB
		FROM [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENTPREFERENCES] WITH (NOLOCK)
		GROUP BY [ClientCode]
	) ClientPreferencesInnerSelect
),

Clients
(
	 ClientCode
	,ClientEmail
	,Title
    ,FirstName
    ,LastName
    ,City
    ,County
    ,Postcode
	,Country
    ,Add1
    ,Add2
    ,Add3
    ,Phone1
    ,Phone2
    ,MobilePhone
    ,DateOfBirth
	,Deceased
	,Blacklisted
	,BookingOffice
	,BusinessPhone
	,NumberOfCharters
	,CustomerLinkCode
	,CustomerClass
	,GoneAway
	,ClientSourceCode
	,LastContactDate
	,DateCreated
)
AS
(
	SELECT 
		 ClientCode
		,Email1 AS ClientEmail
		,Title
        ,FirstName
        ,LastName
        ,City
        ,County
        ,Postcode
		,Country
        ,Add1
        ,Add2
        ,Add3
        ,Phone1
        ,Phone2
        ,MobilePhone
        ,DateOfBirth
		,Deceased
		,Blacklisted
		,BookingOffice
		,BusinessPhone
		,NumberOfCharters
		,CustomerLinkCode
		,CustomerClass
		,GoneAway
		,ClientSourceCode
		,LastContactDate
		,DateCreated
	FROM [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENT] WITH (NOLOCK)
    WHERE
            Brand = 'M'
	    AND Email1 LIKE '%_@%_.__%'
		AND Email1 NOT LIKE '%[[]%' AND Email1 NOT LIKE '%]%' AND Email1 NOT LIKE '%(%' AND Email1 NOT LIKE '%)%' AND Email1 NOT LIKE '%''%' AND Email1 NOT LIKE '% %'
)

    SELECT DISTINCT 
         LifecycleStage
        ,BrandName
        ,QuoteSourcePrimary
        ,BookingOfficeLocation
        ,BookingLanguage
        ,ClientCode
        ,Title
        ,FirstName
        ,LastName
        ,City
        ,County
        ,Postcode
        ,Country
        ,Email
        ,CancelFromMailing
        ,CancelFromEmail
        ,CancelFromBrochure
        ,Deceased
        ,Blacklisted
        ,QuoteProductName
        ,QuoteDateRequested
        ,QuoteDepartureDate
        ,QuoteDestination
        ,QuoteHullType
        ,Address1
        ,Address2
        ,Address3
        ,Phone1
        ,Phone2
        ,BusinessPhone
        ,DateOfBirth
        ,QuoteExecutiveReportingRegion
        ,QuoteBoat
        ,QuoteBookRef
        ,CustomerLinkCode
        ,CustomerClass
        ,GoneAway
        ,ClientSourceCode
        ,[Status]
        ,ClientBookingOffice
        ,CancelFromTelephone
--        ,Notes
        ,LastContactDate
        ,TritonCreateDate
        ,CleanClientID
        ,QuoteSalesAgent
    FROM 
    (
        SELECT
            'opportunity' AS LifecycleStage,
            'Footloose' AS BrandName,
            COALESCE([CELERITY_ST_BOOKINGS].BookingSourcePrimary,'') AS QuoteSourcePrimary,
            COALESCE([SL_Simplified_SalesOffice].[SalesOfficeSimplified],[CELERITY_ST_BOOKINGS].BookingOfficeLocation,'') AS BookingOfficeLocation,
            COALESCE([SL_Simplified_Language].[LanguageSimplified],[CELERITY_ST_BOOKINGS].BookingLanguageFull,'') AS BookingLanguage,
            CLI.ClientCode,
            COALESCE([SL_Simplified_Title].[TitleSimplified],'') AS Title,
            CLI.FirstName,
            CLI.LastName,
            CLI.City,
            CLI.County,
            CLI.Postcode,
            COALESCE([SL_Simplified_Triton_Client_Country].[CountrySimplified],CLI.Country,'') AS Country,
            CLI.ClientEmail AS Email,
            CASE CLP.CancelFromMailing WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromMailing,
            CASE CLP.CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromEmail,
            CASE CLP.[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromBrochure,
            CLI.Deceased,
            CASE CLI.Blacklisted WHEN 'Y' THEN 'true' ELSE 'false' END AS Blacklisted,
            COALESCE([SL_Simplified_ProductName].ProductNameSimplified,'') AS QuoteProductName,
            HUBSPOT.dbo.fn_convertDate([CELERITY_ST_BOOKINGS].BookingDate, @dateFormat) AS QuoteDateRequested,
            HUBSPOT.dbo.fn_convertDate([CELERITY_ST_BOOKINGS].DepartureDate, @dateFormat) AS QuoteDepartureDate,
            COALESCE([SL_BaseNameFull].[BaseName],[CELERITY_ST_BOOKINGS].AreaName) AS QuoteDestination,
            CASE WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1,3,1) IN ('X','L','P') THEN 'Catamaran' ELSE 'Monohull' END AS QuoteHullType, 
            COALESCE(CLI.[Add1],'') AS Address1,
            COALESCE(CLI.[Add2],'') AS Address2,
            COALESCE(CLI.[Add3],'') AS Address3,
            COALESCE(CLI.[Phone1],'') AS Phone1,
            COALESCE(CLI.[Phone2],'') AS Phone2,
            COALESCE(CLI.[BusinessPhone],'') AS BusinessPhone,
            HUBSPOT.dbo.fn_convertDate(CLI.DateOfBirth, @dateFormat) AS DateOfBirth,
            COALESCE([CELERITY_ST_BOOKINGS].ExecutiveReportingRegion,'') AS QuoteExecutiveReportingRegion,
            COALESCE([CELERITY_ST_BOOKINGS].UserDefinable1,'') AS QuoteBoat,
            COALESCE([CELERITY_ST_BOOKINGS].BookRef,'') AS QuoteBookRef,
            COALESCE(CLI.CustomerLinkCode,'') AS CustomerLinkCode,
            COALESCE(CLI.[CustomerClass],'') AS CustomerClass,
            CASE CLI.GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END AS GoneAway,
            COALESCE(CLI.ClientSourceCode,'') AS ClientSourceCode,
            [CELERITY_ST_BOOKINGS].[Status], 
            COALESCE([SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified],'') AS ClientBookingOffice,
            DENSE_RANK() OVER(PARTITION BY CLI.ClientEmail
                ORDER BY 
					[CELERITY_ST_BOOKINGS].BookingDate DESC,
					[CELERITY_ST_BOOKINGS].BookRef DESC, 
					[CELERITY_ST_BOOKINGS].ConfirmDate DESC,
					CLI.ClientCode DESC
            ) AS RankResultMostRecentQuote,

            -- DWYT-16 New HubSpot API fields
            CASE CLP.[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromTelephone,
            '' AS Notes,
            HUBSPOT.dbo.fn_convertDateFromText(CLI.LastContactDate, @dateFormat) AS LastContactDate,
            HUBSPOT.dbo.fn_convertDate(CLI.DateCreated, @dateFormat) AS TritonCreateDate,
            COALESCE(REPLACE(REPLACE(REPLACE(CLI.ClientCode, 'TRT-M',''), 'TRT-S', ''), 'TRT-', ''), '') AS CleanClientID,
            COALESCE([CELERITY_ST_BOOKINGS].AgentCode,'') AS QuoteSalesAgent
            
        FROM 
            [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKINGS] WITH (NOLOCK)
        INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKEDPASSENGERS] WITH (NOLOCK)
            ON [CELERITY_ST_BOOKEDPASSENGERS].BookRef=[CELERITY_ST_BOOKINGS].BookRef
        INNER JOIN Clients CLI WITH (NOLOCK)
            ON CLI.ClientCode=[CELERITY_ST_BOOKEDPASSENGERS].ClientCode
        LEFT JOIN ClientPreferences CLP WITH (NOLOCK)
            ON CLP.ClientCode = CLI.ClientCode
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_SalesOffice] WITH (NOLOCK)
            ON [SL_Simplified_SalesOffice].BrandName='MRG' AND [SL_Simplified_SalesOffice].[SalesOfficeFromRawData]=[CELERITY_ST_BOOKINGS].BookingOfficeLocation
        LEFT JOIN [SL_BaseNameFull] WITH (NOLOCK)
            ON [SL_BaseNameFull].BaseCode = [CELERITY_ST_BOOKINGS].AreaCode
            AND [SL_BaseNameFull].Brand = 'MRG'
        LEFT JOIN [AMI_Galaxy].[dbo].[CONF_DT_BRAND] WITH (NOLOCK)
            ON [CONF_DT_BRAND].a_BrandCd=[CELERITY_ST_BOOKINGS].BrandName
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_ProductName] WITH (NOLOCK)
            ON [SL_Simplified_ProductName].[ProductNameActual]=[CELERITY_ST_BOOKINGS].ProductName
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Language] WITH (NOLOCK)
            ON [SL_Simplified_Language].LanguageActual=[CELERITY_ST_BOOKINGS].BookingLanguageFull
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Triton_Client_Country] WITH (NOLOCK)
            ON [SL_Simplified_Triton_Client_Country].[CountryActual]=CLI.Country
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Title] WITH (NOLOCK)
            ON [SL_Simplified_Title].[TitleActual]=CLI.Title
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_ClientBookingOffice] WITH (NOLOCK)
            ON [SL_Simplified_ClientBookingOffice].[ClientBookingOfficeActual]=CLI.BookingOffice
        WHERE 
            [CELERITY_ST_BOOKINGS].BrandName ='FTL'
        AND [CELERITY_ST_BOOKINGS].[Status] IN ('Quote', 'Hold', 'Option')
        AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN @startDate AND @endDate
        AND [CELERITY_ST_BOOKINGS].BookingSourcePrimary NOT IN ('PR-Pr free trip','TAAC-Ta on account','PR-Public relations-mor','PRESS-Bericht in der press','STAFF-Staff booking','OWNS-Owner with no paymen','OS-Wot-offshore sailing','OWNER-Owner','DAYCH-Day charter discount','LOCAL-Local booking','OS-Offshore sailing','OSS-Offshore sailing','OW-Owner use','OPS-Operations/maintenan','TA','STHOL-Staff holiday','TAGEN-Travel agent','OSSFF-Staff friends & fami','LOCA2-Local booking','TO-Tour operator')
        AND [CELERITY_ST_BOOKINGS].AreaCode NOT IN ('UKD','UK1','CVO','SS1','UK2','SS2','UK3','FLT','UK4')
        AND [CELERITY_ST_BOOKINGS].ProductName IN ('SAILING_SCHOOLS','CREWED','FLOTILLA','FRANCHISE','FOOTLOOSE','BAREBOAT','CORPORATE','POWER')
        AND [CELERITY_ST_BOOKINGS].BookingType ='DIRECT'
        AND [CELERITY_ST_BOOKINGS].UserDefinable1 IS NOT NULL
        AND LTRIM(RTRIM([CELERITY_ST_BOOKINGS].UserDefinable1)) <> '' 
--        AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,GETDATE()-10) AND CONVERT(DATE,GETDATE()-1)
--        AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,'2013-01-01', 120) AND CONVERT(DATE, '2013-12-31', 120)
--        AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,'2016-01-01', 120) AND CONVERT(DATE, '2016-12-31', 120)
    ) Result

    WHERE RankResultMostRecentQuote=1
    ORDER BY QuoteDateRequested,Email

END

GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_TRITON_SS_BOOKINGS]    Script Date: 12/04/2019 10:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--========================================================================================================================
-- Procedure Date - Procedure Description
-- 29-Nov-2017      BUILD_HUBSPOT_TRITON_SS_BOOKINGS - Selects Triton Sunsail booking records for HubSpot upload
--
--========================================================================================================================
-- Change History===
--========================================================================================================================
-- Date             Version     Who                Comment
-- 29-Nov-2017      1.0         Tim Wilson         Revised for CRM Phase III
-- 20-Mar-2018      1.1         Tim Wilson         Remove selection filter for Deceased flag; Add BookingStatus column
-- 25-Apr-2018      1.4         Tim Wilson         Resolve client code only unique within brand issue
-- 17-May-2018      1.5         Tim Wilson         Select all data from 01-01-2010
-- 17-May-2018      1.6         Tim Wilson         Output dates in yyyy-mm-dd format
-- 21-May-2018      1.7         Tim Wilson         Corrections for dedup logic
-- 13-Jun-2018      1.8         Tim Wilson         Recoded email-centrically and using temp tables for clarity
--========================================================================================================================

CREATE PROC [dbo].[BUILD_HUBSPOT_TRITON_SS_BOOKINGS] @pStartDate varchar(10) = NULL , @pEndDate varchar(10) = NULL, @pDateFormat varchar(10) = NULL
/* @pStartDate and @pEndDate are either a date string with format 'yyyy-mm-dd' or the word 'TODAY' for the current date */
AS
BEGIN

	DECLARE @startDate date, @endDate date, @dateFormat varchar(10)

	SET NOCOUNT ON;

	IF @pStartDate = 'TODAY'
	BEGIN
		SET @startDate = CONVERT(DATE,GETDATE())
	END
	ELSE
	BEGIN
		-- Default to 10 days ago
		SET @startDate = ISNULL(CONVERT(DATE,@pStartDate,120), CONVERT(DATE,GETDATE()-10))
	END

	IF @pEndDate = 'TODAY'
	BEGIN
		SET @endDate   = CONVERT(DATE,GETDATE())
	END
	ELSE
	BEGIN
		-- Default to yesterday
		SET @endDate   = ISNULL(CONVERT(DATE,@pEndDate,120), CONVERT(DATE,GETDATE()-1))
	END

	SET @dateFormat    = ISNULL(@pDateFormat, 'unix')

	IF OBJECT_ID('tempdb..#ClientPreferences') IS NOT NULL
		DROP TABLE #ClientPreferences

	SELECT
		 ClientCode
		,CancelFromBrochure
		,CancelFromMailing
		,CancelFromEmail
		,CancelFromTelephone
		,CancelFromSMS
		,CancelFromElectronicB
	INTO #ClientPreferences
	FROM
	(
		SELECT
			 [ClientCode]
			,MAX(ISNULL([CancelFromBrochure],'')) CancelFromBrochure
			,MAX(ISNULL([CancelFromMailing],'')) CancelFromMailing
			,MAX(ISNULL([CancelFromEmail],'')) CancelFromEmail
			,MAX(ISNULL([CancelFromTelephone],'')) CancelFromTelephone
			,MAX(ISNULL([CancelFromSMS],'')) CancelFromSMS
			,MAX(ISNULL([CancelFromElectronicB],'')) CancelFromElectronicB
		FROM [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENTPREFERENCES] WITH (NOLOCK)
		GROUP BY [ClientCode]
	) ClientPreferencesInnerSelect

	IF OBJECT_ID('tempdb..#Clients') IS NOT NULL
		DROP TABLE #Clients

	SELECT 
		 ClientCode
		,Email1 AS ClientEmail
		,Title
        ,FirstName
        ,LastName
        ,City
        ,County
        ,Postcode
		,Country
        ,Add1
        ,Add2
        ,Add3
        ,Phone1
        ,Phone2
        ,MobilePhone
        ,DateOfBirth
		,Deceased
		,Blacklisted
		,BookingOffice
		,BusinessPhone
		,NumberOfCharters
		,CustomerLinkCode
		,CustomerClass
		,GoneAway
		,ClientSourceCode
		,LastContactDate
		,DateCreated
	INTO #Clients
	FROM [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENT] WITH (NOLOCK)
    WHERE
            Brand = 'S'
	    AND Email1 LIKE '%_@%_.__%'
		AND Email1 NOT LIKE '%[[]%' AND Email1 NOT LIKE '%]%' AND Email1 NOT LIKE '%(%' AND Email1 NOT LIKE '%)%' AND Email1 NOT LIKE '%''%' AND Email1 NOT LIKE '% %'

	IF OBJECT_ID('tempdb..#MostRecentBooking') IS NOT NULL
		DROP TABLE #MostRecentBooking

	SELECT
		ConfirmDate
		,BookingSourcePrimary
		,BookingOfficeLocation
		,BookingLanguageFull
		,ProductName
		,BookingDate
		,DepartureDate
		,AreaName
		,AreaCode
		,UserDefinable1
		,ExecutiveReportingRegion
		,Duration
		,BookRef
		,CancelledDate
		,BrandName
		,[Status]
		,BookingSourceSecondary
		,AgentCode
		,TotalPax
		,BookingType
		,ClientCode
		,ClientEmail
--		,RankResultMostRecentBooking
	INTO #MostRecentBooking
	FROM
		(
			SELECT
				[CELERITY_ST_BOOKINGS].ConfirmDate,
				[CELERITY_ST_BOOKINGS].BookingSourcePrimary,
				[CELERITY_ST_BOOKINGS].BookingOfficeLocation,
				[CELERITY_ST_BOOKINGS].BookingLanguageFull,
				[CELERITY_ST_BOOKINGS].ProductName,
				[CELERITY_ST_BOOKINGS].BookingDate,
				[CELERITY_ST_BOOKINGS].DepartureDate,
				[CELERITY_ST_BOOKINGS].AreaName,
				[CELERITY_ST_BOOKINGS].AreaCode,
				[CELERITY_ST_BOOKINGS].UserDefinable1,
				[CELERITY_ST_BOOKINGS].ExecutiveReportingRegion,
				[CELERITY_ST_BOOKINGS].Duration,
				[CELERITY_ST_BOOKINGS].BookRef,
				[CELERITY_ST_BOOKINGS].CancelledDate,
				[CELERITY_ST_BOOKINGS].BrandName,
				[CELERITY_ST_BOOKINGS].[Status],
				[CELERITY_ST_BOOKINGS].BookingSourceSecondary,
				[CELERITY_ST_BOOKINGS].AgentCode,
				[CELERITY_ST_BOOKINGS].[TotalPax],
				[CELERITY_ST_BOOKINGS].BookingType,
				CLI.ClientCode,
				CLI.ClientEmail,
				DENSE_RANK() OVER(PARTITION BY CLI.ClientEmail
					ORDER BY 
						[CELERITY_ST_BOOKINGS].BookingDate DESC,
						[CELERITY_ST_BOOKINGS].BookRef DESC, 
						[CELERITY_ST_BOOKINGS].ConfirmDate DESC,
						CLI.ClientCode DESC
					) AS RankResultMostRecentBooking
				FROM 
					[CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKINGS] WITH (NOLOCK)
				INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKEDPASSENGERS] WITH (NOLOCK)
					ON [CELERITY_ST_BOOKEDPASSENGERS].BookRef=[CELERITY_ST_BOOKINGS].BookRef
				INNER JOIN #Clients CLI WITH (NOLOCK)
					ON CLI.ClientCode=[CELERITY_ST_BOOKEDPASSENGERS].ClientCode
				WHERE 
					[CELERITY_ST_BOOKINGS].BrandName ='SUN'
				AND [CELERITY_ST_BOOKINGS].[Status] IN ('Booking','Cancelled')
				AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN @startDate AND @endDate
				AND [CELERITY_ST_BOOKINGS].BookingSourcePrimary NOT IN ('PR-Pr free trip','TAAC-Ta on account','PR-Public relations-mor','PRESS-Bericht in der press','STAFF-Staff booking','OWNS-Owner with no paymen','OS-Wot-offshore sailing','OWNER-Owner','DAYCH-Day charter discount','LOCAL-Local booking','OS-Offshore sailing','OSS-Offshore sailing','OW-Owner use','OPS-Operations/maintenan','TA','STHOL-Staff holiday','TAGEN-Travel agent','OSSFF-Staff friends & fami','LOCA2-Local booking','TO-Tour operator')
				AND [CELERITY_ST_BOOKINGS].AreaCode NOT IN ('UKD','UK1','CVO','SS1','UK2','SS2','UK3','FLT','UK4')
				AND [CELERITY_ST_BOOKINGS].ProductName IN ('SAILING_SCHOOLS','CREWED','FLOTILLA','FRANCHISE','FOOTLOOSE','BAREBOAT','CORPORATE','POWER')
				AND [CELERITY_ST_BOOKINGS].BookingType ='DIRECT'
				AND [CELERITY_ST_BOOKINGS].UserDefinable1 IS NOT NULL
				AND LTRIM(RTRIM([CELERITY_ST_BOOKINGS].UserDefinable1)) <> '' 
        ) MostRecentBookingInnerSelect
	WHERE RankResultMostRecentBooking = 1

	IF OBJECT_ID('tempdb..#FirstCharter') IS NOT NULL
		DROP TABLE #FirstCharter

	SELECT
        BookRef AS FirstCharterBookRef
        ,DepartureDate AS FirstCharterDepartureDate
        ,Destination AS FirstCharterDestination
        ,BookingDate AS FirstCharterDateBooked
        ,ProductName AS FirstCharterProduct
        ,HullType AS FirstCharterHullType
        ,UserDefinable1 AS FirstCharterBoat
        ,ClientCode AS FirstCharterClientCode
		,ClientEmail AS FirstCharterClientEmail
--      ,RankResultFirstCharter
	INTO #FirstCharter
	FROM
        (
            SELECT
                [CELERITY_ST_BOOKINGS].BookRef,
                HUBSPOT.dbo.fn_convertDate([CELERITY_ST_BOOKINGS].DepartureDate, @dateFormat) AS DepartureDate,
                COALESCE([SL_BaseNameFull].[BaseName],[CELERITY_ST_BOOKINGS].AreaName) AS Destination,
                HUBSPOT.dbo.fn_convertDate([CELERITY_ST_BOOKINGS].BookingDate, @dateFormat) AS BookingDate,
                [CELERITY_ST_BOOKINGS].ProductName,
                CASE
                    WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1, 3, 1) = 'P' THEN 'Power'
                    WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1, 3, 1) = 'X' THEN 'Catamaran'
                    WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1, 3, 1) = 'L' THEN 'Catamaran'
                    ELSE 'Monohull'
                END AS HullType,
                [CELERITY_ST_BOOKINGS].UserDefinable1,
                CLI.ClientCode,
				CLI.ClientEmail,
				DENSE_RANK() OVER(PARTITION BY CLI.ClientEmail
					ORDER BY 
						[CELERITY_ST_BOOKINGS].BookingDate ASC,
						[CELERITY_ST_BOOKINGS].BookRef DESC, 
						[CELERITY_ST_BOOKINGS].ConfirmDate DESC,
						CLI.ClientCode DESC
					) AS RankResultFirstCharter
            FROM 
                [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKINGS] WITH (NOLOCK)
            INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKEDPASSENGERS] WITH (NOLOCK)
                ON [CELERITY_ST_BOOKEDPASSENGERS].BookRef=[CELERITY_ST_BOOKINGS].BookRef
            INNER JOIN #Clients CLI WITH (NOLOCK)
                ON CLI.ClientCode=[CELERITY_ST_BOOKEDPASSENGERS].ClientCode
            LEFT JOIN [HUBSPOT].[dbo].[SL_BaseNameFull] WITH (NOLOCK)
                ON [SL_BaseNameFull].BaseCode = [CELERITY_ST_BOOKINGS].AreaCode
                AND [SL_BaseNameFull].Brand = 'SUN'
            WHERE 
                [CELERITY_ST_BOOKINGS].BrandName ='SUN'
            AND [CELERITY_ST_BOOKINGS].[Status] = 'Booking'
            AND [CELERITY_ST_BOOKINGS].BookingDate >= CONVERT(date,'2010-01-01 00:00:00.000')
            AND [CELERITY_ST_BOOKINGS].BookingSourcePrimary NOT IN ('PR-Pr free trip','TAAC-Ta on account','PR-Public relations-mor','PRESS-Bericht in der press','STAFF-Staff booking','OWNS-Owner with no paymen','OS-Wot-offshore sailing','OWNER-Owner','DAYCH-Day charter discount','LOCAL-Local booking','OS-Offshore sailing','OSS-Offshore sailing','OW-Owner use','OPS-Operations/maintenan','TA','STHOL-Staff holiday','TAGEN-Travel agent','OSSFF-Staff friends & fami','LOCA2-Local booking','TO-Tour operator')
            AND [CELERITY_ST_BOOKINGS].AreaCode NOT IN ('UKD','UK1','CVO','SS1','UK2','SS2','UK3','FLT','UK4')
            AND [CELERITY_ST_BOOKINGS].ProductName IN ('SAILING_SCHOOLS','CREWED','FLOTILLA','FRANCHISE','FOOTLOOSE','BAREBOAT','CORPORATE','POWER')
            AND [CELERITY_ST_BOOKINGS].BookingType ='DIRECT'
            AND [CELERITY_ST_BOOKINGS].UserDefinable1 IS NOT NULL
            AND LTRIM(RTRIM([CELERITY_ST_BOOKINGS].UserDefinable1)) <> '' 
        ) FirstCharterInnerSelect
	WHERE RankResultFirstCharter = 1

	IF OBJECT_ID('tempdb..#CancelledBookings') IS NOT NULL
		DROP TABLE #CancelledBookings

    SELECT
        BookRef AS CancellationBookRef
        ,CancellationDate AS CancellationDate
        ,ClientCode AS CancellationClientCode
		,ClientEmail AS CancellationClientEmail
--      ,RankResultCancellation
	INTO #CancelledBookings
    FROM
		(
			SELECT
				[CELERITY_ST_BOOKINGS].BookRef,
				HUBSPOT.dbo.fn_convertDate([CELERITY_ST_BOOKINGS].CancelledDate, @dateFormat) AS CancellationDate,
				CLI.ClientCode,
				CLI.ClientEmail,
				DENSE_RANK() OVER(PARTITION BY CLI.ClientEmail
					ORDER BY 
						[CELERITY_ST_BOOKINGS].BookingDate DESC,
						[CELERITY_ST_BOOKINGS].BookRef DESC, 
						[CELERITY_ST_BOOKINGS].ConfirmDate DESC,
						CLI.ClientCode DESC
				) AS RankResultCancellation
			FROM 
				[CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKINGS] WITH (NOLOCK)
			INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKEDPASSENGERS] WITH (NOLOCK)
				ON [CELERITY_ST_BOOKEDPASSENGERS].BookRef=[CELERITY_ST_BOOKINGS].BookRef
			INNER JOIN #Clients CLI WITH (NOLOCK)
				ON CLI.ClientCode=[CELERITY_ST_BOOKEDPASSENGERS].ClientCode
			WHERE 
				[CELERITY_ST_BOOKINGS].BrandName ='SUN'
			AND [CELERITY_ST_BOOKINGS].[Status] IN ('Booking','Cancelled')
			AND [CELERITY_ST_BOOKINGS].CancelledDate IS NOT NULL
			--Search all bookings for most recent cancellation records
			--AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,GETDATE()-8) AND CONVERT(DATE,GETDATE()-1)
			--AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN '2017-08-03' AND '2017-09-10'
			--AND [CELERITY_ST_BOOKINGS].BookingDate >= CONVERT(date,'2010-01-01 00:00:00.000')
			AND [CELERITY_ST_BOOKINGS].BookingSourcePrimary NOT IN ('PR-Pr free trip','TAAC-Ta on account','PR-Public relations-mor','PRESS-Bericht in der press','STAFF-Staff booking','OWNS-Owner with no paymen','OS-Wot-offshore sailing','OWNER-Owner','DAYCH-Day charter discount','LOCAL-Local booking','OS-Offshore sailing','OSS-Offshore sailing','OW-Owner use','OPS-Operations/maintenan','TA','STHOL-Staff holiday','TAGEN-Travel agent','OSSFF-Staff friends & fami','LOCA2-Local booking','TO-Tour operator')
			AND [CELERITY_ST_BOOKINGS].AreaCode NOT IN ('UKD','UK1','CVO','SS1','UK2','SS2','UK3','FLT','UK4')
			AND [CELERITY_ST_BOOKINGS].ProductName IN ('SAILING_SCHOOLS','CREWED','FLOTILLA','FRANCHISE','FOOTLOOSE','BAREBOAT','CORPORATE','POWER')
			AND [CELERITY_ST_BOOKINGS].BookingType ='DIRECT'
			AND [CELERITY_ST_BOOKINGS].UserDefinable1 IS NOT NULL
			AND LTRIM(RTRIM([CELERITY_ST_BOOKINGS].UserDefinable1)) <> '' 
		) CancelledBookingsInnerSelect
	WHERE RankResultCancellation = 1

	SELECT
        'customer' AS LifecycleStage,
        'Sunsail' AS BrandName,
        HUBSPOT.dbo.fn_convertDate(#MostRecentBooking.ConfirmDate, @dateFormat) AS ConfirmDate,
        #MostRecentBooking.BookingSourcePrimary,
        COALESCE([SL_Simplified_SalesOffice].[SalesOfficeSimplified],#MostRecentBooking.BookingOfficeLocation,'') AS BookingOfficeLocation,
        COALESCE([SL_Simplified_Language].[LanguageSimplified],#MostRecentBooking.BookingLanguageFull,'') AS BookingLanguage,
        CLI.ClientCode,
        COALESCE([SL_Simplified_Title].[TitleSimplified],'') AS Title,
        CLI.FirstName,
        CLI.LastName,
        CLI.City,
        CLI.County,
        CLI.Postcode,
        COALESCE([SL_Simplified_Triton_Client_Country].[CountrySimplified],CLI.Country,'') AS Country,
        CLI.ClientEmail AS Email,
        CASE #ClientPreferences.CancelFromMailing WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromMailing,
        CASE #ClientPreferences.CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromEmail,
        CASE #ClientPreferences.[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromBrochure,
        CLI.Deceased,
        CASE CLI.Blacklisted WHEN 'Y' THEN 'Y' ELSE 'N' END AS Blacklisted,
        #MostRecentBooking.ProductName AS BookingProductName,
        HUBSPOT.dbo.fn_convertDate(#MostRecentBooking.BookingDate, @dateFormat) AS BookingDateBooked,
        HUBSPOT.dbo.fn_convertDate(#MostRecentBooking.DepartureDate, @dateFormat) AS BookingDepartureDate,
        COALESCE([SL_BaseNameFull].[BaseName],#MostRecentBooking.AreaName) AS BookingDestination,
        CASE WHEN SUBSTRING(#MostRecentBooking.UserDefinable1,3,1) IN ('X','L','P') THEN 'Catamaran' ELSE 'Monohull' END AS BookingHullType, 
        COALESCE(CLI.[Add1],'') AS Address1,
        COALESCE(CLI.[Add2],'') AS Address2,
        COALESCE(CLI.[Add3],'') AS Address3,
        COALESCE(CLI.[Phone1],'') AS Phone1,
        COALESCE(CLI.[Phone2],'') AS Phone2,
        COALESCE(CLI.[BusinessPhone],'') AS BusinessPhone,
        HUBSPOT.dbo.fn_convertDate(CLI.DateOfBirth, @dateFormat) AS DateOfBirth,
        COALESCE(#MostRecentBooking.ExecutiveReportingRegion,'') AS BookingExecutiveReportingRegion,
        COALESCE(CLI.NumberOfCharters,'') AS NumberOfCharters,
        COALESCE(#MostRecentBooking.Duration,'') AS Duration,
        --COALESCE([CELERITY_ST_BOOKINGS].CleanBaseName,'') AS CleanBaseName,--Ignore for now
        --COALESCE([CELERITY_ST_BOOKINGS].CleanBoatName,'') AS CleanBoatName,--Ignore for now
        COALESCE(#MostRecentBooking.UserDefinable1,'') AS BookingBoat,
        COALESCE(#MostRecentBooking.BookRef,'') AS BookingBookRef,
        COALESCE(CLI.CustomerLinkCode,'') AS CustomerLinkCode,
        COALESCE(CLI.[CustomerClass],'') AS CustomerClass,
        CASE CLI.GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END AS GoneAway,
        COALESCE(CLI.ClientSourceCode,'') AS ClientSourceCode,
        'Booking' AS [Status], 
        COALESCE([SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified],'') AS ClientBookingOffice,

        -- DWYT-16 New HubSpot API fields
        CASE #ClientPreferences.[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromTelephone,
        HUBSPOT.dbo.fn_convertDateFromText(CLI.LastContactDate, @dateFormat) AS LastContactDate,
        HUBSPOT.dbo.fn_convertDate(#MostRecentBooking.CancelledDate, @dateFormat) AS BookingCancellationDate,
        COALESCE(#CancelledBookings.CancellationDate,'') AS CancellationCancellationDate,
        COALESCE(#CancelledBookings.CancellationBookRef,'') AS CancellationBookRef,
        COALESCE(#FirstCharter.FirstCharterDepartureDate,'') AS FirstCharterDepartureDate,
        COALESCE(#FirstCharter.FirstCharterDestination,'') AS FirstCharterDestination,
        COALESCE(#FirstCharter.FirstCharterDateBooked,'') AS FirstCharterDateBooked,
        COALESCE(#FirstCharter.FirstCharterProduct,'') AS FirstCharterProduct,
        COALESCE(#FirstCharter.FirstCharterHullType,'') AS FirstCharterHullType,
        COALESCE(#FirstCharter.FirstCharterBoat,'') AS FirstCharterBoat,
        (SELECT COUNT(*) FROM [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKINGS] WITH (NOLOCK)
            INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKEDPASSENGERS] WITH (NOLOCK)
            ON [CELERITY_ST_BOOKEDPASSENGERS].BookRef=[CELERITY_ST_BOOKINGS].BookRef
            INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENT] WITH (NOLOCK)
            ON [CELERITY_ST_BOOKEDPASSENGERS].ClientCode = [CELERITY_ST_CLIENT].ClientCode
            WHERE [CELERITY_ST_CLIENT].ClientCode = CLI.ClientCode
            AND [CELERITY_ST_BOOKINGS].BrandName ='SUN'
            AND [CELERITY_ST_BOOKINGS].[Status] = 'Booking'
        ) AS NumberOfBookings,
        HUBSPOT.dbo.fn_convertDate(CLI.DateCreated, @dateFormat) AS TritonCreateDate,
        COALESCE(#MostRecentBooking.BookingSourceSecondary,'') AS BookingSourceSecondary,
        '' AS BookingSourceTertiary,
        COALESCE(#MostRecentBooking.AgentCode,'') AS BookingSalesAgent,
        COALESCE(REPLACE(REPLACE(REPLACE(CLI.ClientCode, 'TRT-M',''), 'TRT-S', ''), 'TRT-', ''), '') AS CleanClientID,
        COALESCE(REPLACE(REPLACE(REPLACE(#MostRecentBooking.BookRef, 'TRT-M', ''), 'TRT-S', ''), 'TRT-', ''),'') AS BookingCleanBookRef,
        COALESCE(#MostRecentBooking.[TotalPax],0) AS BookingTotalPax,
        COALESCE(REPLACE(#MostRecentBooking.[Status], 'Booking', 'Confirmed'),'') AS BookingStatus
    FROM 
        #MostRecentBooking WITH (NOLOCK)
    INNER JOIN #Clients CLI WITH (NOLOCK)
        ON CLI.ClientCode=#MostRecentBooking.ClientCode
	LEFT JOIN #ClientPreferences WITH (NOLOCK)
		ON #ClientPreferences.ClientCode = CLI.ClientCode
	LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_SalesOffice] WITH (NOLOCK)
        ON [SL_Simplified_SalesOffice].BrandName=#MostRecentBooking.BrandName AND [SL_Simplified_SalesOffice].[SalesOfficeFromRawData]=#MostRecentBooking.BookingOfficeLocation
    LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Language] WITH (NOLOCK)
        ON [SL_Simplified_Language].LanguageActual=#MostRecentBooking.BookingLanguageFull
    LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Triton_Client_Country] WITH (NOLOCK)
        ON [SL_Simplified_Triton_Client_Country].[CountryActual]=CLI.Country
    LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Title] WITH (NOLOCK)
        ON [SL_Simplified_Title].[TitleActual]=CLI.Title
    LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_ClientBookingOffice] WITH (NOLOCK)
        ON [SL_Simplified_ClientBookingOffice].[ClientBookingOfficeActual]=CLI.BookingOffice
    LEFT JOIN [HUBSPOT].[dbo].[SL_BaseNameFull] WITH (NOLOCK)
        ON [SL_BaseNameFull].BaseCode = #MostRecentBooking.AreaCode
        AND [SL_BaseNameFull].Brand = 'SUN'
    -- First Charter records
    LEFT JOIN #FirstCharter
		ON #FirstCharter.FirstCharterClientEmail = CLI.ClientEmail
    -- Most recent cancellation records
    LEFT JOIN #CancelledBookings
	    ON #CancelledBookings.CancellationClientEmail = CLI.ClientEmail
	ORDER BY ConfirmDate,CLI.ClientEmail

END

GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_TRITON_SS_BROCHURE_REQUESTS]    Script Date: 12/04/2019 10:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--========================================================================================================================
-- Procedure Date - Procedure Description
-- 29-Nov-2017      BUILD_HUBSPOT_TRITON_SS_BROCHURE_REQUESTS - Selects Triton Sunsail brochure request records for HubSpot upload
--
--========================================================================================================================
-- Change History===
--========================================================================================================================
-- Date             Version     Who                Comment
-- 29-Nov-2017      1.0         Tim Wilson         Revised for CRM Phase III
-- 05-Jan-2018      1.1         Tim Wilson         Debugged recent bookings join
-- 20-Mar-2018      1.2         Tim Wilson         Remove selection filter for Deceased flag; Add BookingStatus column
-- 25-Apr-2018      1.4         Tim Wilson         Resolve client code only unique within brand issue
-- 01-May-2018      1.5         Tim Wilson         Remove booking data columns
-- 17-May-2018      1.6         Tim Wilson         Select all data from 01-01-2010
-- 17-May-2018      1.7         Tim Wilson         Output dates in yyyy-mm-dd format
-- 21-May-2018      1.8         Tim Wilson         Corrections for dedupe logic
-- 18-Jun-2018      1.9         Tim Wilson         Recoded email-centrically and using temp tables for clarity
--========================================================================================================================

CREATE PROC [dbo].[BUILD_HUBSPOT_TRITON_SS_BROCHURE_REQUESTS] @pStartDate varchar(10) = NULL , @pEndDate varchar(10) = NULL, @pDateFormat varchar(10) = NULL
/* @pStartDate and @pEndDate are either a date string with format 'yyyy-mm-dd' or the word 'TODAY' for the current date */
AS
BEGIN

	DECLARE @startDate date, @endDate date, @dateFormat varchar(10)

	SET NOCOUNT ON;

	IF @pStartDate = 'TODAY'
	BEGIN
		SET @startDate = CONVERT(DATE,GETDATE())
	END
	ELSE
	BEGIN
		-- Default to 10 days ago
		SET @startDate = ISNULL(CONVERT(DATE,@pStartDate,120), CONVERT(DATE,GETDATE()-10))
	END

	IF @pEndDate = 'TODAY'
	BEGIN
		SET @endDate   = CONVERT(DATE,GETDATE())
	END
	ELSE
	BEGIN
		-- Default to yesterday
		SET @endDate   = ISNULL(CONVERT(DATE,@pEndDate,120), CONVERT(DATE,GETDATE()-1))
	END

	SET @dateFormat    = ISNULL(@pDateFormat, 'unix')
;
WITH ClientPreferences
(
	 ClientCode
	,CancelFromBrochure
	,CancelFromMailing
	,CancelFromEmail
	,CancelFromTelephone
	,CancelFromSMS
	,CancelFromElectronicB
)
AS
(
	SELECT
		 ClientCode
		,CancelFromBrochure
		,CancelFromMailing
		,CancelFromEmail
		,CancelFromTelephone
		,CancelFromSMS
		,CancelFromElectronicB
	FROM
	(
		SELECT
			 [ClientCode]
			,MAX(ISNULL([CancelFromBrochure],'')) CancelFromBrochure
			,MAX(ISNULL([CancelFromMailing],'')) CancelFromMailing
			,MAX(ISNULL([CancelFromEmail],'')) CancelFromEmail
			,MAX(ISNULL([CancelFromTelephone],'')) CancelFromTelephone
			,MAX(ISNULL([CancelFromSMS],'')) CancelFromSMS
			,MAX(ISNULL([CancelFromElectronicB],'')) CancelFromElectronicB
		FROM [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENTPREFERENCES] WITH (NOLOCK)
		GROUP BY [ClientCode]
	) ClientPreferencesInnerSelect
),

Clients
(
	 ClientCode
	,ClientEmail
	,Title
    ,FirstName
    ,LastName
    ,City
    ,County
    ,Postcode
	,Country
    ,Add1
    ,Add2
    ,Add3
    ,Phone1
    ,Phone2
    ,MobilePhone
    ,DateOfBirth
	,Deceased
	,Blacklisted
	,BookingOffice
	,BusinessPhone
	,NumberOfCharters
	,CustomerLinkCode
	,CustomerClass
	,GoneAway
	,ClientSourceCode
	,LastContactDate
	,DateCreated
)
AS
(
	SELECT 
		 ClientCode
		,Email1 AS ClientEmail
		,Title
        ,FirstName
        ,LastName
        ,City
        ,County
        ,Postcode
		,Country
        ,Add1
        ,Add2
        ,Add3
        ,Phone1
        ,Phone2
        ,MobilePhone
        ,DateOfBirth
		,Deceased
		,Blacklisted
		,BookingOffice
		,BusinessPhone
		,NumberOfCharters
		,CustomerLinkCode
		,CustomerClass
		,GoneAway
		,ClientSourceCode
		,LastContactDate
		,DateCreated
	FROM [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENT] WITH (NOLOCK)
    WHERE
            Brand = 'S'
	    AND Email1 LIKE '%_@%_.__%'
		AND Email1 NOT LIKE '%[[]%' AND Email1 NOT LIKE '%]%' AND Email1 NOT LIKE '%(%' AND Email1 NOT LIKE '%)%' AND Email1 NOT LIKE '%''%' AND Email1 NOT LIKE '% %'
)

    SELECT DISTINCT 
         LifecycleStage
        ,BrandName
        ,BookingOfficeLocation
--        ,BookingLanguage
        ,ClientCode
        ,Title
        ,FirstName
        ,LastName
        ,City
        ,County
        ,Postcode
        ,Country
        ,Email
        ,CancelFromMailing
        ,CancelFromEmail
        ,CancelFromBrochure
        ,Deceased
        ,Blacklisted
        ,BrochureProductRequested
        ,BrochureDateRequested
        ,Address1
        ,Address2
        ,Address3
        ,Phone1
        ,Phone2
        ,BusinessPhone
        ,DateOfBirth
        ,CustomerLinkCode
        ,CustomerClass
        ,GoneAway
        ,ClientSourceCode
        ,[Status]
        ,ClientBookingOffice
        ,CancelFromTelephone
        ,LastContactDate
        ,TritonCreateDate
        ,CleanClientId
    FROM
    (
        SELECT 
            'lead' as LifecycleStage,
            'Sunsail' AS BrandName,
            COALESCE([SL_Simplified_SalesOffice].[SalesOfficeSimplified],[CELERITY_ST_BROCHUREREQUEST].[Location]) AS BookingOfficeLocation,
            [CELERITY_ST_BROCHUREREQUEST].Language AS BookingLanguage,
            [CELERITY_ST_BROCHUREREQUEST].[ClientCode],
            COALESCE([SL_Simplified_Title].[TitleSimplified],'') AS Title,
            CLI.[FirstName],
            CLI.[LastName],
            CLI.[City],
            CLI.[County],
            CLI.[Postcode],
            COALESCE([SL_Simplified_Triton_Client_Country].[CountrySimplified],CLI.Country,'') AS Country,
            CLI.ClientEmail AS Email,
            CASE CLP.CancelFromMailing WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromMailing,
            CASE CLP.CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromEmail,
            CASE CLP.[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromBrochure,
            CLI.[Deceased],
            CASE CLI.Blacklisted WHEN 'Y' THEN 'Y' ELSE 'N' END AS Blacklisted,
            COALESCE([SL_Simplified_BrochureName].[BrochureNameSimplified],[CELERITY_ST_BROCHUREREQUEST].[BrochureName],'') AS BrochureProductRequested,
			HUBSPOT.dbo.fn_convertDate([CELERITY_ST_BROCHUREREQUEST].[DateRequested], @dateFormat) AS BrochureDateRequested,
            COALESCE(CLI.[Add1],'') AS Address1,
            COALESCE(CLI.[Add2],'') AS Address2,
            COALESCE(CLI.[Add3],'') AS Address3,
            COALESCE(CLI.[Phone1],'') AS Phone1,
            COALESCE(CLI.[Phone2],'') AS Phone2,
            COALESCE(CLI.[BusinessPhone],'') AS BusinessPhone,
            HUBSPOT.dbo.fn_convertDate(CLI.DateOfBirth, @dateFormat) AS DateOfBirth,
            COALESCE(CLI.CustomerLinkCode,'') AS CustomerLinkCode,
            COALESCE(CLI.[CustomerClass],'') AS CustomerClass,
            CASE CLI.GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END AS GoneAway,
            COALESCE(CLI.ClientSourceCode,'') AS ClientSourceCode,
            'Brochure' AS Status,  
            COALESCE([SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified],'') AS ClientBookingOffice,
            DENSE_RANK() OVER(PARTITION BY CLI.ClientEmail
            ORDER BY 
                [CELERITY_ST_BROCHUREREQUEST].[DateRequested] DESC,
                CLI.ClientCode DESC,
                COALESCE([SL_Simplified_BrochureName].[BrochureNameSimplified],[CELERITY_ST_BROCHUREREQUEST].[BrochureName]),
                COALESCE([SL_Simplified_SalesOffice].[SalesOfficeSimplified],[CELERITY_ST_BROCHUREREQUEST].[Location]),
                (CASE CLP.CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,    
                (CASE CLP.CancelFromMailing WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                (CASE CLP.[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                (CASE CLP.[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                CLI.[LastName], 
                CLI.[FirstName]
            ) AS RankResult,

            -- DWYT-16 New HubSpot API fields
            CASE CLP.[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromTelephone,
            HUBSPOT.dbo.fn_convertDateFromText(CLI.LastContactDate, @dateFormat) AS LastContactDate,
            HUBSPOT.dbo.fn_convertDate(CLI.DateCreated, @dateFormat) AS TritonCreateDate,
            COALESCE(REPLACE(REPLACE(REPLACE(CLI.ClientCode, 'TRT-M',''), 'TRT-S', ''), 'TRT-', ''), '') AS CleanClientID

        FROM
            [CelerityMarine_Stage].[dbo].[CELERITY_ST_BROCHUREREQUEST] WITH (NOLOCK)
        INNER JOIN Clients CLI WITH (NOLOCK)
            ON CLI.ClientCode=[CELERITY_ST_BROCHUREREQUEST].ClientCode
        INNER JOIN [HUBSPOT].[dbo].[SL_Simplified_BrochureName] WITH (NOLOCK)
            ON [SL_Simplified_BrochureName].[BrochureNameActual]=[CELERITY_ST_BROCHUREREQUEST].[BrochureName] AND [SL_Simplified_BrochureName].[BrandName]='SUN'
        LEFT JOIN ClientPreferences CLP WITH (NOLOCK)
            ON CLP.ClientCode=CLI.ClientCode
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_SalesOffice] WITH (NOLOCK)
            ON [SL_Simplified_SalesOffice].BrandName ='SUN' AND [SL_Simplified_SalesOffice].[SalesOfficeFromRawData]=[CELERITY_ST_BROCHUREREQUEST].[Location]
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Triton_Client_Country] WITH (NOLOCK)
            ON [SL_Simplified_Triton_Client_Country].[CountryActual]=CLI.Country
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Title] WITH (NOLOCK)
            ON [SL_Simplified_Title].[TitleActual]=CLI.Title
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_ClientBookingOffice] WITH (NOLOCK)
            ON [SL_Simplified_ClientBookingOffice].[ClientBookingOfficeActual]=CLI.BookingOffice
        WHERE
            [CELERITY_ST_BROCHUREREQUEST].[DateRequested] BETWEEN @startDate AND @endDate
--            [CELERITY_ST_BROCHUREREQUEST].[DateRequested] BETWEEN CONVERT(DATE,GETDATE()-10) AND CONVERT(DATE,GETDATE()-1)
--			AND [CELERITY_ST_BROCHUREREQUEST].[DateRequested] BETWEEN CONVERT(DATE,'2013-01-01', 120) AND CONVERT(DATE, '2013-12-31', 120)
--			AND [CELERITY_ST_BROCHUREREQUEST].[DateRequested] BETWEEN CONVERT(DATE,'2016-01-01', 120) AND CONVERT(DATE, '2016-12-31', 120)
    )Result
    WHERE 
        RankResult=1
    ORDER BY 
        BrochureDateRequested,Email

END

GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_TRITON_SS_ENEWS]    Script Date: 12/04/2019 10:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--========================================================================================================================
-- Procedure Date - Procedure Description
-- 29-Nov-2017      BUILD_HUBSPOT_TRITON_SS_ENEWS - Selects Triton Sunsail enews records for HubSpot upload
--
--========================================================================================================================
-- Change History===
--========================================================================================================================
-- Date             Version     Who                Comment
-- 29-Nov-2017      1.0         Tim Wilson         Revised for CRM Phase III
-- 05-Jan-2018      1.1         Tim Wilson         Debugged recent bookings join
-- 20-Mar-2018      1.2         Tim Wilson         Remove selection filter for Deceased flag; Add BookingStatus column
-- 25-Apr-2018      1.4         Tim Wilson         Resolve client code only unique within brand issue
-- 01-May-2018      1.5         Tim Wilson         Remove booking data columns
-- 17-May-2018      1.6         Tim Wilson         Select all data from 01-01-2010
-- 17-May-2018      1.7         Tim Wilson         Output dates in yyyy-mm-dd format
-- 21-May-2018      1.8         Tim Wilson         Corrections for dedupe logic
-- 18-Jun-2018      1.9         Tim Wilson         Recoded email-centrically and using temp tables for clarity
--========================================================================================================================

CREATE PROC [dbo].[BUILD_HUBSPOT_TRITON_SS_ENEWS] @pStartDate varchar(10) = NULL , @pEndDate varchar(10) = NULL, @pDateFormat varchar(10) = NULL
/* @pStartDate and @pEndDate are either a date string with format 'yyyy-mm-dd' or the word 'TODAY' for the current date */
AS
BEGIN

	DECLARE @startDate date, @endDate date, @dateFormat varchar(10)

	SET NOCOUNT ON;

	IF @pStartDate = 'TODAY'
	BEGIN
		SET @startDate = CONVERT(DATE,GETDATE())
	END
	ELSE
	BEGIN
		-- Default to 10 days ago
		SET @startDate = ISNULL(CONVERT(DATE,@pStartDate,120), CONVERT(DATE,GETDATE()-10))
	END

	IF @pEndDate = 'TODAY'
	BEGIN
		SET @endDate   = CONVERT(DATE,GETDATE())
	END
	ELSE
	BEGIN
		-- Default to yesterday
		SET @endDate   = ISNULL(CONVERT(DATE,@pEndDate,120), CONVERT(DATE,GETDATE()-1))
	END

	SET @dateFormat    = ISNULL(@pDateFormat, 'unix')
;
WITH ClientPreferences
(
	 ClientCode
	,CancelFromBrochure
	,CancelFromMailing
	,CancelFromEmail
	,CancelFromTelephone
	,CancelFromSMS
	,CancelFromElectronicB
)
AS
(
	SELECT
		 ClientCode
		,CancelFromBrochure
		,CancelFromMailing
		,CancelFromEmail
		,CancelFromTelephone
		,CancelFromSMS
		,CancelFromElectronicB
	FROM
	(
		SELECT
			 [ClientCode]
			,MAX(ISNULL([CancelFromBrochure],'')) CancelFromBrochure
			,MAX(ISNULL([CancelFromMailing],'')) CancelFromMailing
			,MAX(ISNULL([CancelFromEmail],'')) CancelFromEmail
			,MAX(ISNULL([CancelFromTelephone],'')) CancelFromTelephone
			,MAX(ISNULL([CancelFromSMS],'')) CancelFromSMS
			,MAX(ISNULL([CancelFromElectronicB],'')) CancelFromElectronicB
		FROM [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENTPREFERENCES] WITH (NOLOCK)
		GROUP BY [ClientCode]
	) ClientPreferencesInnerSelect
),

Clients
(
	 ClientCode
	,ClientEmail
	,Title
    ,FirstName
    ,LastName
    ,City
    ,County
    ,Postcode
	,Country
    ,Add1
    ,Add2
    ,Add3
    ,Phone1
    ,Phone2
    ,MobilePhone
    ,DateOfBirth
	,Deceased
	,Blacklisted
	,BookingOffice
	,BusinessPhone
	,NumberOfCharters
	,CustomerLinkCode
	,CustomerClass
	,GoneAway
	,ClientSourceCode
	,LastContactDate
	,DateCreated
)
AS
(
	SELECT 
		 ClientCode
		,Email1 AS ClientEmail
		,Title
        ,FirstName
        ,LastName
        ,City
        ,County
        ,Postcode
		,Country
        ,Add1
        ,Add2
        ,Add3
        ,Phone1
        ,Phone2
        ,MobilePhone
        ,DateOfBirth
		,Deceased
		,Blacklisted
		,BookingOffice
		,BusinessPhone
		,NumberOfCharters
		,CustomerLinkCode
		,CustomerClass
		,GoneAway
		,ClientSourceCode
		,LastContactDate
		,DateCreated
	FROM [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENT] WITH (NOLOCK)
    WHERE
            Brand = 'S'
        AND COALESCE(Email1,'') != ''
	    AND Email1 LIKE '%_@%_.__%'
		AND Email1 NOT LIKE '%[[]%' AND Email1 NOT LIKE '%]%' AND Email1 NOT LIKE '%(%' AND Email1 NOT LIKE '%)%' AND Email1 NOT LIKE '%''%' AND Email1 NOT LIKE '% %'
)

    SELECT DISTINCT
         LifecycleStage
        ,BrandName
        ,BookingOfficeLocation
        ,BookingLanguage
        ,Title
        ,FirstName
        ,LastName
        ,Country
        ,Email
        ,EnewsProductName
        ,EnewsDateRequested
        ,Address1
        ,Address2
        ,Address3
        ,Phone1
        ,Phone2
        ,BusinessPhone
        ,DateOfBirth
        ,CustomerLinkCode
        ,CustomerClass
        ,GoneAway
        ,ClientSourceCode
        ,[Status]
        ,ClientBookingOffice
        ,CancelFromTelephone
        ,LastContactDate
        ,TritonCreateDate
        ,Deceased
        ,CancelFromEmail
        ,CancelFromBrochure
        ,ClientCode
    FROM 
    (
        SELECT
            'subscriber' as LifecycleStage, 
            'Sunsail' AS BrandName,
            COALESCE([SL_ISO_SalesOffice].[SalesOffice],'') AS BookingOfficeLocation,
            COALESCE([SL_ISO_SalesOffice].[Language],'') AS BookingLanguage,
            COALESCE([SL_Simplified_Title].[TitleSimplified],'') AS Title,
            TRT_SUNSAIL_ST_EFMST.EFFNAM AS FirstName,
            TRT_SUNSAIL_ST_EFMST.EFLNAM AS LastName,
            COALESCE([SL_Simplified_Triton_Client_Country].[CountrySimplified],[SL_ISO_SalesOffice].[CountryOfResidence],'') AS Country,
            TRT_SUNSAIL_ST_EFMST.EFMAIL AS Email,
            COALESCE([SL_EFSITE_PRODUCT_INTEREST].[ProductInterest],TRT_SUNSAIL_ST_EFMST.EFSITE) AS EnewsProductName,
            CASE WHEN TRT_SUNSAIL_ST_EFMST.EFETDT IS NULL OR TRT_SUNSAIL_ST_EFMST.EFETDT = 0 THEN '' ELSE CONVERT(VARCHAR(10),CONVERT(DATETIME, CONVERT(VARCHAR(8), TRT_SUNSAIL_ST_EFMST.EFETDT), 112),120) END AS EnewsDateRequested,
            COALESCE(CLI.[Add1],'') AS Address1,
            COALESCE(CLI.[Add2],'') AS Address2,
            COALESCE(CLI.[Add3],'') AS Address3,
            COALESCE(CLI.[Phone1],'') AS Phone1,
            COALESCE(CLI.[Phone2],'') AS Phone2,
            COALESCE(CLI.[BusinessPhone],'') AS BusinessPhone,
            HUBSPOT.dbo.fn_convertDate(CLI.DateOfBirth, @dateFormat) AS DateOfBirth,
            --COALESCE(CLI.NumberOfCharters,'') AS NumberOfCharters, -- Ignore for now
            COALESCE(CLI.CustomerLinkCode,'') AS CustomerLinkCode,
            COALESCE(CLI.[CustomerClass],'') AS CustomerClass,
            CASE CLI.GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END AS GoneAway,
            COALESCE(CLI.ClientSourceCode,'') AS ClientSourceCode,
            'Enews' as Status,
            COALESCE([SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified],'') AS ClientBookingOffice,
            DENSE_RANK() OVER(PARTITION BY TRT_SUNSAIL_ST_EFMST.EFMAIL 
                ORDER BY 
                CAST(CASE ISNULL(TRT_SUNSAIL_ST_EFMST.EFETDT,0) WHEN 0 THEN NULL ELSE CONVERT(DATETIME, CONVERT(VARCHAR(8), TRT_SUNSAIL_ST_EFMST.EFETDT), 112) END AS Datetime) DESC,
                CLI.ClientCode DESC,
                COALESCE([SL_EFSITE_PRODUCT_INTEREST].[ProductInterest],TRT_SUNSAIL_ST_EFMST.EFSITE),
                [SL_ISO_SalesOffice].[Language],
                (CASE CLP.[CancelFromEmail] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                (CASE CLP.[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                (CASE CLP.[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                TRT_SUNSAIL_ST_EFMST.EFLNAM,
                TRT_SUNSAIL_ST_EFMST.EFFNAM
            ) AS RankResult,

            -- DWYT-16 New HubSpot API fields
            CASE CLP.[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromTelephone,
			HUBSPOT.dbo.fn_convertDateFromText(CLI.LastContactDate, @dateFormat) AS LastContactDate,
			HUBSPOT.dbo.fn_convertDate(CLI.DateCreated, @dateFormat) AS TritonCreateDate,
            COALESCE(CLI.[Deceased],'') AS Deceased,
            CASE CLP.CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromEmail,
            CASE CLP.[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromBrochure,
            COALESCE(CLI.ClientCode,'') AS ClientCode
            
        FROM 
            [CelerityMarine_Stage].[dbo].[TRT_SUNSAIL_ST_EFMST] WITH (NOLOCK)
        LEFT JOIN Clients CLI WITH (NOLOCK) 
            ON REPLACE(CLI.ClientEmail,'\@','@') = REPLACE(TRT_SUNSAIL_ST_EFMST.EFMAIL,'\@','@')
        LEFT JOIN ClientPreferences CLP WITH (NOLOCK)
            ON CLP.ClientCode=CLI.ClientCode
        LEFT JOIN [HUBSPOT].[dbo].[SL_ISO_SalesOffice] WITH (NOLOCK) 
            ON [SL_ISO_SalesOffice].[ISO_Code]=TRT_SUNSAIL_ST_EFMST.EFCTCD
        LEFT JOIN [HUBSPOT].[dbo].[SL_EFSITE_PRODUCT_INTEREST] WITH (NOLOCK)
            ON [SL_EFSITE_PRODUCT_INTEREST].[EFSITE]=TRT_SUNSAIL_ST_EFMST.EFSITE AND [SL_EFSITE_PRODUCT_INTEREST].[BrandName]='Sunsail'
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Triton_Client_Country] WITH (NOLOCK)
            ON [SL_Simplified_Triton_Client_Country].[CountryActual]=[SL_ISO_SalesOffice].[CountryOfResidence]
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Title] WITH (NOLOCK)
            ON [SL_Simplified_Title].[TitleActual]=CLI.Title
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_ClientBookingOffice] WITH (NOLOCK)
            ON [SL_Simplified_ClientBookingOffice].[ClientBookingOfficeActual]=CLI.BookingOffice
        WHERE
            TRT_SUNSAIL_ST_EFMST.EFMAIL LIKE '%_@%_.__%'
        AND TRT_SUNSAIL_ST_EFMST.EFMAIL NOT LIKE '%[[]%' AND TRT_SUNSAIL_ST_EFMST.EFMAIL NOT LIKE '%]%' AND TRT_SUNSAIL_ST_EFMST.EFMAIL NOT LIKE '%(%' AND TRT_SUNSAIL_ST_EFMST.EFMAIL NOT LIKE '%)%' AND TRT_SUNSAIL_ST_EFMST.EFMAIL NOT LIKE '%''%' AND TRT_SUNSAIL_ST_EFMST.EFMAIL NOT LIKE '% %'
        AND TRT_SUNSAIL_ST_EFMST.EFETDT != 0
--        AND TRT_SUNSAIL_ST_EFMST.EFETDT >= CONVERT(INT, CONVERT(VARCHAR(8),GETDATE()-10,112)) AND TRT_SUNSAIL_ST_EFMST.EFETDT <= CONVERT(INT, CONVERT(VARCHAR(8),GETDATE()-1,112))
--        AND TRT_SUNSAIL_ST_EFMST.EFETDT BETWEEN 20130101 AND 20131231
--        AND TRT_SUNSAIL_ST_EFMST.EFETDT BETWEEN 20160101 AND 20161231
        AND TRT_SUNSAIL_ST_EFMST.EFETDT BETWEEN CONVERT(INT, CONVERT(VARCHAR(8),@startDate,112)) AND CONVERT(INT, CONVERT(VARCHAR(8),@endDate,112))
    )Result
    WHERE RankResult=1
	ORDER BY EnewsDateRequested,Email

END

GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_TRITON_SS_QUOTES]    Script Date: 12/04/2019 10:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--========================================================================================================================
-- Procedure Date - Procedure Description
-- 29-Nov-2017      BUILD_HUBSPOT_TRITON_SS_QUOTES - Selects Triton Sunsail quotes records for HubSpot upload
--
--========================================================================================================================
-- Change History===
--========================================================================================================================
-- Date             Version     Who                Comment
-- 29-Nov-2017      1.0         Tim Wilson         Revised for CRM Phase III
-- 10-Jan-2018      1.1         Tim Wilson         Added JOIN for most recent booking data
--                                                 Added new column QuoteSalesAgent
-- 20-Mar-2018      1.2         Tim Wilson         Remove selection filter for Deceased flag; Add BookingStatus column
-- 23-Apr-2018      1.3         Tim Wilson         Resolve conflict between QuoteDuration and
--                                                 Bookings Duration
-- 25-Apr-2018      1.4         Tim Wilson         Resolve client code only unique within brand issue
-- 27-Apr-2018      1.5         Tim Wilson         Drop duration columns altogether for quotes selections
-- 01-May-2018      1.6         Tim Wilson         Remove booking data columns
-- 17-May-2018      1.7         Tim Wilson         Select all data from 01-01-2010
-- 17-May-2018      1.8         Tim Wilson         Output dates in yyyy-mm-dd format
-- 21-May-2018      1.9         Tim Wilson         Corrections for dedupe logic
-- 18-Jun-2018      1.10        Tim Wilson         Recoded email-centrically and using temp tables for clarity
--========================================================================================================================

CREATE PROC [dbo].[BUILD_HUBSPOT_TRITON_SS_QUOTES] @pStartDate varchar(10) = NULL , @pEndDate varchar(10) = NULL, @pDateFormat varchar(10) = NULL
/* @pStartDate and @pEndDate are either a date string with format 'yyyy-mm-dd' or the word 'TODAY' for the current date */
AS
BEGIN

	DECLARE @startDate date, @endDate date, @dateFormat varchar(10)

	SET NOCOUNT ON;

	IF @pStartDate = 'TODAY'
	BEGIN
		SET @startDate = CONVERT(DATE,GETDATE())
	END
	ELSE
	BEGIN
		-- Default to 10 days ago
		SET @startDate = ISNULL(CONVERT(DATE,@pStartDate,120), CONVERT(DATE,GETDATE()-10))
	END

	IF @pEndDate = 'TODAY'
	BEGIN
		SET @endDate   = CONVERT(DATE,GETDATE())
	END
	ELSE
	BEGIN
		-- Default to yesterday
		SET @endDate   = ISNULL(CONVERT(DATE,@pEndDate,120), CONVERT(DATE,GETDATE()-1))
	END

	SET @dateFormat    = ISNULL(@pDateFormat, 'unix')
;
WITH ClientPreferences
(
	 ClientCode
	,CancelFromBrochure
	,CancelFromMailing
	,CancelFromEmail
	,CancelFromTelephone
	,CancelFromSMS
	,CancelFromElectronicB
)
AS
(
	SELECT
		 ClientCode
		,CancelFromBrochure
		,CancelFromMailing
		,CancelFromEmail
		,CancelFromTelephone
		,CancelFromSMS
		,CancelFromElectronicB
	FROM
	(
		SELECT
			 [ClientCode]
			,MAX(ISNULL([CancelFromBrochure],'')) CancelFromBrochure
			,MAX(ISNULL([CancelFromMailing],'')) CancelFromMailing
			,MAX(ISNULL([CancelFromEmail],'')) CancelFromEmail
			,MAX(ISNULL([CancelFromTelephone],'')) CancelFromTelephone
			,MAX(ISNULL([CancelFromSMS],'')) CancelFromSMS
			,MAX(ISNULL([CancelFromElectronicB],'')) CancelFromElectronicB
		FROM [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENTPREFERENCES] WITH (NOLOCK)
		GROUP BY [ClientCode]
	) ClientPreferencesInnerSelect
),

Clients
(
	 ClientCode
	,ClientEmail
	,Title
    ,FirstName
    ,LastName
    ,City
    ,County
    ,Postcode
	,Country
    ,Add1
    ,Add2
    ,Add3
    ,Phone1
    ,Phone2
    ,MobilePhone
    ,DateOfBirth
	,Deceased
	,Blacklisted
	,BookingOffice
	,BusinessPhone
	,NumberOfCharters
	,CustomerLinkCode
	,CustomerClass
	,GoneAway
	,ClientSourceCode
	,LastContactDate
	,DateCreated
)
AS
(
	SELECT 
		 ClientCode
		,Email1 AS ClientEmail
		,Title
        ,FirstName
        ,LastName
        ,City
        ,County
        ,Postcode
		,Country
        ,Add1
        ,Add2
        ,Add3
        ,Phone1
        ,Phone2
        ,MobilePhone
        ,DateOfBirth
		,Deceased
		,Blacklisted
		,BookingOffice
		,BusinessPhone
		,NumberOfCharters
		,CustomerLinkCode
		,CustomerClass
		,GoneAway
		,ClientSourceCode
		,LastContactDate
		,DateCreated
	FROM [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENT] WITH (NOLOCK)
    WHERE
            Brand = 'S'
	    AND Email1 LIKE '%_@%_.__%'
		AND Email1 NOT LIKE '%[[]%' AND Email1 NOT LIKE '%]%' AND Email1 NOT LIKE '%(%' AND Email1 NOT LIKE '%)%' AND Email1 NOT LIKE '%''%' AND Email1 NOT LIKE '% %'
)

    SELECT DISTINCT 
         LifecycleStage
        ,BrandName
        ,QuoteSourcePrimary
        ,BookingOfficeLocation
        ,BookingLanguage
        ,ClientCode
        ,Title
        ,FirstName
        ,LastName
        ,City
        ,County
        ,Postcode
        ,Country
        ,Email
        ,CancelFromMailing
        ,CancelFromEmail
        ,CancelFromBrochure
        ,Deceased
        ,Blacklisted
        ,QuoteProductName
        ,QuoteDateRequested
        ,QuoteDepartureDate
        ,QuoteDestination
        ,QuoteHullType
        ,Address1
        ,Address2
        ,Address3
        ,Phone1
        ,Phone2
        ,BusinessPhone
        ,DateOfBirth
        ,QuoteExecutiveReportingRegion
        ,QuoteBoat
        ,QuoteBookRef
        ,CustomerLinkCode
        ,CustomerClass
        ,GoneAway
        ,ClientSourceCode
        ,[Status]
        ,ClientBookingOffice
        ,CancelFromTelephone
--        ,Notes
        ,LastContactDate
        ,TritonCreateDate
        ,CleanClientID
        ,QuoteSalesAgent
    FROM 
    (
        SELECT
            'opportunity' AS LifecycleStage,
            'Sunsail' AS BrandName,
            COALESCE([CELERITY_ST_BOOKINGS].BookingSourcePrimary,'') AS QuoteSourcePrimary,
            COALESCE([SL_Simplified_SalesOffice].[SalesOfficeSimplified],[CELERITY_ST_BOOKINGS].BookingOfficeLocation,'') AS BookingOfficeLocation,
            COALESCE([SL_Simplified_Language].[LanguageSimplified],[CELERITY_ST_BOOKINGS].BookingLanguageFull,'') AS BookingLanguage,
            CLI.ClientCode,
            COALESCE([SL_Simplified_Title].[TitleSimplified],'') AS Title,
            CLI.FirstName,
            CLI.LastName,
            CLI.City,
            CLI.County,
            CLI.Postcode,
            COALESCE([SL_Simplified_Triton_Client_Country].[CountrySimplified],CLI.Country,'') AS Country,
            CLI.ClientEmail AS Email,
            CASE CLP.CancelFromMailing WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromMailing,
            CASE CLP.CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromEmail,
            CASE CLP.[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromBrochure,
            CLI.Deceased,
            CASE CLI.Blacklisted WHEN 'Y' THEN 'Y' ELSE 'N' END AS Blacklisted,
            [CELERITY_ST_BOOKINGS].ProductName AS QuoteProductName,
            HUBSPOT.dbo.fn_convertDate([CELERITY_ST_BOOKINGS].BookingDate, @dateFormat) AS QuoteDateRequested,
            HUBSPOT.dbo.fn_convertDate([CELERITY_ST_BOOKINGS].DepartureDate, @dateFormat) AS QuoteDepartureDate,
            COALESCE([SL_BaseNameFull].[BaseName],[CELERITY_ST_BOOKINGS].AreaName) AS QuoteDestination,
            CASE WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1,3,1) IN ('X','L','P') THEN 'Catamaran' ELSE 'Monohull' END AS QuoteHullType, 
            COALESCE(CLI.[Add1],'') AS Address1,
            COALESCE(CLI.[Add2],'') AS Address2,
            COALESCE(CLI.[Add3],'') AS Address3,
            COALESCE(CLI.[Phone1],'') AS Phone1,
            COALESCE(CLI.[Phone2],'') AS Phone2,
            COALESCE(CLI.[BusinessPhone],'') AS BusinessPhone,
            HUBSPOT.dbo.fn_convertDate(CLI.DateOfBirth, @dateFormat) AS DateOfBirth,
            COALESCE([CELERITY_ST_BOOKINGS].ExecutiveReportingRegion,'') AS QuoteExecutiveReportingRegion,
            COALESCE([CELERITY_ST_BOOKINGS].UserDefinable1,'') AS QuoteBoat,
            COALESCE([CELERITY_ST_BOOKINGS].BookRef,'') AS QuoteBookRef,
            COALESCE(CLI.CustomerLinkCode,'') AS CustomerLinkCode,
            COALESCE(CLI.[CustomerClass],'') AS CustomerClass,
            CASE CLI.GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END AS GoneAway,
            COALESCE(CLI.ClientSourceCode,'') AS ClientSourceCode,
            [CELERITY_ST_BOOKINGS].[Status], 
            COALESCE([SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified],'') AS ClientBookingOffice,
            DENSE_RANK() OVER(PARTITION BY CLI.ClientEmail
                ORDER BY 
					[CELERITY_ST_BOOKINGS].BookingDate DESC,
					[CELERITY_ST_BOOKINGS].BookRef DESC, 
					[CELERITY_ST_BOOKINGS].ConfirmDate DESC,
					CLI.ClientCode DESC
            ) AS RankResultMostRecentQuote,

            -- DWYT-16 New HubSpot API fields
            CASE CLP.[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromTelephone,
            '' AS Notes,
            HUBSPOT.dbo.fn_convertDateFromText(CLI.LastContactDate, @dateFormat) AS LastContactDate,
            HUBSPOT.dbo.fn_convertDate(CLI.DateCreated, @dateFormat) AS TritonCreateDate,
            COALESCE(REPLACE(REPLACE(REPLACE(CLI.ClientCode, 'TRT-M',''), 'TRT-S', ''), 'TRT-', ''), '') AS CleanClientID,
            COALESCE([CELERITY_ST_BOOKINGS].AgentCode,'') AS QuoteSalesAgent

        FROM 
            [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKINGS] WITH (NOLOCK)
        INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKEDPASSENGERS] WITH (NOLOCK)
            ON [CELERITY_ST_BOOKEDPASSENGERS].BookRef=[CELERITY_ST_BOOKINGS].BookRef
        INNER JOIN Clients CLI WITH (NOLOCK)
            ON CLI.ClientCode=[CELERITY_ST_BOOKEDPASSENGERS].ClientCode
        LEFT JOIN ClientPreferences CLP WITH (NOLOCK)
            ON CLP.ClientCode = CLI.ClientCode
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_SalesOffice] WITH (NOLOCK)
            ON [SL_Simplified_SalesOffice].BrandName=[CELERITY_ST_BOOKINGS].BrandName AND [SL_Simplified_SalesOffice].[SalesOfficeFromRawData]=[CELERITY_ST_BOOKINGS].BookingOfficeLocation
        LEFT JOIN [AMI_Galaxy].[dbo].[CONF_DT_BRAND] WITH (NOLOCK)
            ON [CONF_DT_BRAND].a_BrandCd=[CELERITY_ST_BOOKINGS].BrandName
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Language] WITH (NOLOCK)
            ON [SL_Simplified_Language].LanguageActual=[CELERITY_ST_BOOKINGS].BookingLanguageFull
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Triton_Client_Country] WITH (NOLOCK)
            ON [SL_Simplified_Triton_Client_Country].[CountryActual]=CLI.Country
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Title] WITH (NOLOCK)
            ON [SL_Simplified_Title].[TitleActual]=CLI.Title
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_ClientBookingOffice] WITH (NOLOCK)
            ON [SL_Simplified_ClientBookingOffice].[ClientBookingOfficeActual]=CLI.BookingOffice
        LEFT JOIN [SL_BaseNameFull] WITH (NOLOCK)
            ON [SL_BaseNameFull].BaseCode = [CELERITY_ST_BOOKINGS].AreaCode
            AND [SL_BaseNameFull].Brand = 'SUN'
        WHERE 
            [CELERITY_ST_BOOKINGS].BrandName ='SUN'
        AND [CELERITY_ST_BOOKINGS].[Status] IN ('Quote', 'Hold', 'Option')
        AND [CELERITY_ST_BOOKINGS].BookingSourcePrimary NOT IN ('PR-Pr free trip','TAAC-Ta on account','PR-Public relations-mor','PRESS-Bericht in der press','STAFF-Staff booking','OWNS-Owner with no paymen','OS-Wot-offshore sailing','OWNER-Owner','DAYCH-Day charter discount','LOCAL-Local booking','OS-Offshore sailing','OSS-Offshore sailing','OW-Owner use','OPS-Operations/maintenan','TA','STHOL-Staff holiday','TAGEN-Travel agent','OSSFF-Staff friends & fami','LOCA2-Local booking','TO-Tour operator')
        AND [CELERITY_ST_BOOKINGS].AreaCode NOT IN ('UKD','UK1','CVO','SS1','UK2','SS2','UK3','FLT','UK4')
        AND [CELERITY_ST_BOOKINGS].ProductName IN ('SAILING_SCHOOLS','CREWED','FLOTILLA','FRANCHISE','FOOTLOOSE','BAREBOAT','CORPORATE','POWER')
        AND [CELERITY_ST_BOOKINGS].BookingType ='DIRECT'
        AND [CELERITY_ST_BOOKINGS].UserDefinable1 IS NOT NULL
        AND LTRIM(RTRIM([CELERITY_ST_BOOKINGS].UserDefinable1)) <> '' 
        AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN @startDate AND @endDate
--        AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,GETDATE()-10) AND CONVERT(DATE,GETDATE()-1)
--        AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,'2013-01-01', 120) AND CONVERT(DATE, '2013-12-31', 120)
--        AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,'2016-01-01', 120) AND CONVERT(DATE, '2016-12-31', 120)
    ) Result

    WHERE RankResultMostRecentQuote=1
    ORDER BY QuoteDateRequested,Email

END

GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_TRITON_TM_BOOKINGS]    Script Date: 12/04/2019 10:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--========================================================================================================================
-- Procedure Date - Procedure Description
-- 29-Nov-2017      BUILD_HUBSPOT_TRITON_TM_BOOKINGS - Selects Triton Moorings booking records for HubSpot upload
--
--========================================================================================================================
-- Change History===
--========================================================================================================================
-- Date             Version     Who                Comment
-- 24-Nov-2017      1.0         Tim Wilson         Revised for CRM Phase III
-- 27-Nov-2017      1.1         Tim Wilson         Continued development - removed column CancellationEmail
--                                                 New left joins to provide First Charter and Most Recent Cancellation data
-- 20-Mar-2018      1.2         Tim Wilson         Remove selection filter for Deceased flag; Add BookingStatus column
-- 25-Apr-2018      1.4         Tim Wilson         Resolve client code only unique within brand issue
-- 17-May-2018      1.5         Tim Wilson         Select all data from 01-01-2010
-- 17-May-2018      1.6         Tim Wilson         Output dates in yyyy-mm-dd format
-- 21-May-2018      1.7         Tim Wilson         Corrections for dedup logic
-- 15-Jun-2018      1.8         Tim Wilson         Recoded email-centrically and using temp tables for clarity
--========================================================================================================================

CREATE PROC [dbo].[BUILD_HUBSPOT_TRITON_TM_BOOKINGS] @pStartDate varchar(10) = NULL , @pEndDate varchar(10) = NULL, @pDateFormat varchar(10) = NULL
/* @pStartDate and @pEndDate are either a date string with format 'yyyy-mm-dd' or the word 'TODAY' for the current date */
AS
BEGIN

	DECLARE @startDate date, @endDate date, @dateFormat varchar(10)

	SET NOCOUNT ON;

	IF @pStartDate = 'TODAY'
	BEGIN
		SET @startDate = CONVERT(DATE,GETDATE())
	END
	ELSE
	BEGIN
		-- Default to 10 days ago
		SET @startDate = ISNULL(CONVERT(DATE,@pStartDate,120), CONVERT(DATE,GETDATE()-10))
	END

	IF @pEndDate = 'TODAY'
	BEGIN
		SET @endDate   = CONVERT(DATE,GETDATE())
	END
	ELSE
	BEGIN
		-- Default to yesterday
		SET @endDate   = ISNULL(CONVERT(DATE,@pEndDate,120), CONVERT(DATE,GETDATE()-1))
	END

	SET @dateFormat    = ISNULL(@pDateFormat, 'unix')

	IF OBJECT_ID('tempdb..#ClientPreferences') IS NOT NULL
		DROP TABLE #ClientPreferences

	SELECT
		 ClientCode
		,CancelFromBrochure
		,CancelFromMailing
		,CancelFromEmail
		,CancelFromTelephone
		,CancelFromSMS
		,CancelFromElectronicB
	INTO #ClientPreferences
	FROM
	(
		SELECT
			 [ClientCode]
			,MAX(ISNULL([CancelFromBrochure],'')) CancelFromBrochure
			,MAX(ISNULL([CancelFromMailing],'')) CancelFromMailing
			,MAX(ISNULL([CancelFromEmail],'')) CancelFromEmail
			,MAX(ISNULL([CancelFromTelephone],'')) CancelFromTelephone
			,MAX(ISNULL([CancelFromSMS],'')) CancelFromSMS
			,MAX(ISNULL([CancelFromElectronicB],'')) CancelFromElectronicB
		FROM [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENTPREFERENCES] WITH (NOLOCK)
		GROUP BY [ClientCode]
	) ClientPreferencesInnerSelect

	IF OBJECT_ID('tempdb..#Clients') IS NOT NULL
		DROP TABLE #Clients

	SELECT 
		 ClientCode
		,Email1 AS ClientEmail
		,Title
        ,FirstName
        ,LastName
        ,City
        ,County
        ,Postcode
		,Country
        ,Add1
        ,Add2
        ,Add3
        ,Phone1
        ,Phone2
        ,MobilePhone
        ,DateOfBirth
		,Deceased
		,Blacklisted
		,BookingOffice
		,BusinessPhone
		,NumberOfCharters
		,CustomerLinkCode
		,CustomerClass
		,GoneAway
		,ClientSourceCode
		,LastContactDate
		,DateCreated
	INTO #Clients
	FROM [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENT] WITH (NOLOCK)
    WHERE
            Brand = 'M'
	    AND Email1 LIKE '%_@%_.__%'
		AND Email1 NOT LIKE '%[[]%' AND Email1 NOT LIKE '%]%' AND Email1 NOT LIKE '%(%' AND Email1 NOT LIKE '%)%' AND Email1 NOT LIKE '%''%' AND Email1 NOT LIKE '% %'

	IF OBJECT_ID('tempdb..#MostRecentBooking') IS NOT NULL
		DROP TABLE #MostRecentBooking

	SELECT
		ConfirmDate
		,BookingSourcePrimary
		,BookingOfficeLocation
		,BookingLanguageFull
		,ProductName
		,BookingDate
		,DepartureDate
		,AreaName
		,AreaCode
		,UserDefinable1
		,ExecutiveReportingRegion
		,Duration
		,BookRef
		,CancelledDate
		,BrandName
		,[Status]
		,BookingSourceSecondary
		,AgentCode
		,TotalPax
		,BookingType
		,ClientCode
		,ClientEmail
--		,RankResultMostRecentBooking
	INTO #MostRecentBooking
	FROM
		(
			SELECT
				[CELERITY_ST_BOOKINGS].ConfirmDate,
				[CELERITY_ST_BOOKINGS].BookingSourcePrimary,
				[CELERITY_ST_BOOKINGS].BookingOfficeLocation,
				[CELERITY_ST_BOOKINGS].BookingLanguageFull,
				COALESCE([SL_Simplified_ProductName].ProductNameSimplified, '') AS ProductName,
				[CELERITY_ST_BOOKINGS].BookingDate,
				[CELERITY_ST_BOOKINGS].DepartureDate,
				[CELERITY_ST_BOOKINGS].AreaName,
				[CELERITY_ST_BOOKINGS].AreaCode,
				[CELERITY_ST_BOOKINGS].UserDefinable1,
				[CELERITY_ST_BOOKINGS].ExecutiveReportingRegion,
				[CELERITY_ST_BOOKINGS].Duration,
				[CELERITY_ST_BOOKINGS].BookRef,
				[CELERITY_ST_BOOKINGS].CancelledDate,
				[CELERITY_ST_BOOKINGS].BrandName,
				[CELERITY_ST_BOOKINGS].[Status],
				[CELERITY_ST_BOOKINGS].BookingSourceSecondary,
				[CELERITY_ST_BOOKINGS].AgentCode,
				[CELERITY_ST_BOOKINGS].[TotalPax],
				[CELERITY_ST_BOOKINGS].BookingType,
				CLI.ClientCode,
				CLI.ClientEmail,
				DENSE_RANK() OVER(PARTITION BY CLI.ClientEmail
					ORDER BY 
						[CELERITY_ST_BOOKINGS].BookingDate DESC,
						[CELERITY_ST_BOOKINGS].BookRef DESC, 
						[CELERITY_ST_BOOKINGS].ConfirmDate DESC,
						CLI.ClientCode DESC
					) AS RankResultMostRecentBooking
				FROM 
					[CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKINGS] WITH (NOLOCK)
				INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKEDPASSENGERS] WITH (NOLOCK)
					ON [CELERITY_ST_BOOKEDPASSENGERS].BookRef=[CELERITY_ST_BOOKINGS].BookRef
				INNER JOIN #Clients CLI WITH (NOLOCK)
					ON CLI.ClientCode=[CELERITY_ST_BOOKEDPASSENGERS].ClientCode
				LEFT JOIN [SL_Simplified_ProductName] WITH (NOLOCK)
					ON [SL_Simplified_ProductName].[ProductNameActual]=[CELERITY_ST_BOOKINGS].ProductName
				WHERE 
					[CELERITY_ST_BOOKINGS].BrandName ='MRG'
				AND [CELERITY_ST_BOOKINGS].[Status] IN ('Booking','Cancelled')
				AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN @startDate AND @endDate
				AND [CELERITY_ST_BOOKINGS].BookingSourcePrimary NOT IN ('PR-Pr free trip','TAAC-Ta on account','PR-Public relations-mor','PRESS-Bericht in der press','STAFF-Staff booking','OWNS-Owner with no paymen','OS-Wot-offshore sailing','OWNER-Owner','DAYCH-Day charter discount','LOCAL-Local booking','OS-Offshore sailing','OSS-Offshore sailing','OW-Owner use','OPS-Operations/maintenan','TA','STHOL-Staff holiday','TAGEN-Travel agent','OSSFF-Staff friends & fami','LOCA2-Local booking','TO-Tour operator')
				AND [CELERITY_ST_BOOKINGS].AreaCode NOT IN ('UKD','UK1','CVO','SS1','UK2','SS2','UK3','FLT','UK4')
				AND [CELERITY_ST_BOOKINGS].ProductName IN ('SAILING_SCHOOLS','CREWED','FLOTILLA','FRANCHISE','FOOTLOOSE','BAREBOAT','CORPORATE','POWER')
				AND [CELERITY_ST_BOOKINGS].BookingType ='DIRECT'
				AND [CELERITY_ST_BOOKINGS].UserDefinable1 IS NOT NULL
				AND LTRIM(RTRIM([CELERITY_ST_BOOKINGS].UserDefinable1)) <> '' 
        ) MostRecentBookingInnerSelect
	WHERE RankResultMostRecentBooking = 1

	IF OBJECT_ID('tempdb..#FirstCharter') IS NOT NULL
		DROP TABLE #FirstCharter

	SELECT
        BookRef AS FirstCharterBookRef
        ,DepartureDate AS FirstCharterDepartureDate
        ,Destination AS FirstCharterDestination
        ,BookingDate AS FirstCharterDateBooked
        ,ProductName AS FirstCharterProduct
        ,HullType AS FirstCharterHullType
        ,UserDefinable1 AS FirstCharterBoat
        ,ClientCode AS FirstCharterClientCode
		,ClientEmail AS FirstCharterClientEmail
--      ,RankResultFirstCharter
	INTO #FirstCharter
	FROM
        (
            SELECT
                [CELERITY_ST_BOOKINGS].BookRef,
                HUBSPOT.dbo.fn_convertDate([CELERITY_ST_BOOKINGS].DepartureDate, @dateFormat) AS DepartureDate,
                COALESCE([SL_BaseNameFull].[BaseName],[CELERITY_ST_BOOKINGS].AreaName) AS Destination,
                HUBSPOT.dbo.fn_convertDate([CELERITY_ST_BOOKINGS].BookingDate, @dateFormat) AS BookingDate,
                COALESCE([SL_Simplified_ProductName].ProductNameSimplified, '') AS ProductName,
                CASE
                    WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1, 3, 1) = 'P' THEN 'Power'
                    WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1, 3, 1) = 'X' THEN 'Catamaran'
                    WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1, 3, 1) = 'L' THEN 'Catamaran'
                    ELSE 'Monohull'
                END AS HullType,
                [CELERITY_ST_BOOKINGS].UserDefinable1,
                CLI.ClientCode,
				CLI.ClientEmail,
				DENSE_RANK() OVER(PARTITION BY CLI.ClientEmail
					ORDER BY 
						[CELERITY_ST_BOOKINGS].BookingDate ASC,
						[CELERITY_ST_BOOKINGS].BookRef DESC, 
						[CELERITY_ST_BOOKINGS].ConfirmDate DESC,
						CLI.ClientCode DESC
					) AS RankResultFirstCharter
            FROM 
                [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKINGS] WITH (NOLOCK)
            INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKEDPASSENGERS] WITH (NOLOCK)
                ON [CELERITY_ST_BOOKEDPASSENGERS].BookRef=[CELERITY_ST_BOOKINGS].BookRef
            INNER JOIN #Clients CLI WITH (NOLOCK)
                ON CLI.ClientCode=[CELERITY_ST_BOOKEDPASSENGERS].ClientCode
			LEFT JOIN [SL_Simplified_ProductName] WITH (NOLOCK)
				ON [SL_Simplified_ProductName].[ProductNameActual]=[CELERITY_ST_BOOKINGS].ProductName
            LEFT JOIN [HUBSPOT].[dbo].[SL_BaseNameFull] WITH (NOLOCK)
                ON [SL_BaseNameFull].BaseCode = [CELERITY_ST_BOOKINGS].AreaCode
                AND [SL_BaseNameFull].Brand = 'MRG'
            WHERE 
                [CELERITY_ST_BOOKINGS].BrandName ='MRG'
            AND [CELERITY_ST_BOOKINGS].[Status] = 'Booking'
            AND [CELERITY_ST_BOOKINGS].BookingDate >= CONVERT(date,'2010-01-01 00:00:00.000')
            AND [CELERITY_ST_BOOKINGS].BookingSourcePrimary NOT IN ('PR-Pr free trip','TAAC-Ta on account','PR-Public relations-mor','PRESS-Bericht in der press','STAFF-Staff booking','OWNS-Owner with no paymen','OS-Wot-offshore sailing','OWNER-Owner','DAYCH-Day charter discount','LOCAL-Local booking','OS-Offshore sailing','OSS-Offshore sailing','OW-Owner use','OPS-Operations/maintenan','TA','STHOL-Staff holiday','TAGEN-Travel agent','OSSFF-Staff friends & fami','LOCA2-Local booking','TO-Tour operator')
            AND [CELERITY_ST_BOOKINGS].AreaCode NOT IN ('UKD','UK1','CVO','SS1','UK2','SS2','UK3','FLT','UK4')
            AND [CELERITY_ST_BOOKINGS].ProductName IN ('SAILING_SCHOOLS','CREWED','FLOTILLA','FRANCHISE','FOOTLOOSE','BAREBOAT','CORPORATE','POWER')
            AND [CELERITY_ST_BOOKINGS].BookingType ='DIRECT'
            AND [CELERITY_ST_BOOKINGS].UserDefinable1 IS NOT NULL
            AND LTRIM(RTRIM([CELERITY_ST_BOOKINGS].UserDefinable1)) <> '' 
        ) FirstCharterInnerSelect
	WHERE RankResultFirstCharter = 1

	IF OBJECT_ID('tempdb..#CancelledBookings') IS NOT NULL
		DROP TABLE #CancelledBookings

    SELECT
        BookRef AS CancellationBookRef
        ,CancellationDate AS CancellationDate
        ,ClientCode AS CancellationClientCode
		,ClientEmail AS CancellationClientEmail
--      ,RankResultCancellation
	INTO #CancelledBookings
    FROM
		(
			SELECT
				[CELERITY_ST_BOOKINGS].BookRef,
				HUBSPOT.dbo.fn_convertDate([CELERITY_ST_BOOKINGS].CancelledDate, @dateFormat) AS CancellationDate,
				CLI.ClientCode,
				CLI.ClientEmail,
				DENSE_RANK() OVER(PARTITION BY CLI.ClientEmail
					ORDER BY 
						[CELERITY_ST_BOOKINGS].BookingDate DESC,
						[CELERITY_ST_BOOKINGS].BookRef DESC, 
						[CELERITY_ST_BOOKINGS].ConfirmDate DESC,
						CLI.ClientCode DESC
				) AS RankResultCancellation
			FROM 
				[CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKINGS] WITH (NOLOCK)
			INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKEDPASSENGERS] WITH (NOLOCK)
				ON [CELERITY_ST_BOOKEDPASSENGERS].BookRef=[CELERITY_ST_BOOKINGS].BookRef
			INNER JOIN #Clients CLI WITH (NOLOCK)
				ON CLI.ClientCode=[CELERITY_ST_BOOKEDPASSENGERS].ClientCode
			WHERE 
				[CELERITY_ST_BOOKINGS].BrandName ='MRG'
			AND [CELERITY_ST_BOOKINGS].[Status] IN ('Booking','Cancelled')
			AND [CELERITY_ST_BOOKINGS].CancelledDate IS NOT NULL
			--Search all bookings for most recent cancellation records
			--AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,GETDATE()-8) AND CONVERT(DATE,GETDATE()-1)
			--AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN '2017-08-03' AND '2017-09-10'
			--AND [CELERITY_ST_BOOKINGS].BookingDate >= CONVERT(date,'2010-01-01 00:00:00.000')
			AND [CELERITY_ST_BOOKINGS].BookingSourcePrimary NOT IN ('PR-Pr free trip','TAAC-Ta on account','PR-Public relations-mor','PRESS-Bericht in der press','STAFF-Staff booking','OWNS-Owner with no paymen','OS-Wot-offshore sailing','OWNER-Owner','DAYCH-Day charter discount','LOCAL-Local booking','OS-Offshore sailing','OSS-Offshore sailing','OW-Owner use','OPS-Operations/maintenan','TA','STHOL-Staff holiday','TAGEN-Travel agent','OSSFF-Staff friends & fami','LOCA2-Local booking','TO-Tour operator')
			AND [CELERITY_ST_BOOKINGS].AreaCode NOT IN ('UKD','UK1','CVO','SS1','UK2','SS2','UK3','FLT','UK4')
			AND [CELERITY_ST_BOOKINGS].ProductName IN ('SAILING_SCHOOLS','CREWED','FLOTILLA','FRANCHISE','FOOTLOOSE','BAREBOAT','CORPORATE','POWER')
			AND [CELERITY_ST_BOOKINGS].BookingType ='DIRECT'
			AND [CELERITY_ST_BOOKINGS].UserDefinable1 IS NOT NULL
			AND LTRIM(RTRIM([CELERITY_ST_BOOKINGS].UserDefinable1)) <> '' 
		) CancelledBookingsInnerSelect
	WHERE RankResultCancellation = 1

	SELECT
        'customer' AS LifecycleStage,
        'Moorings' AS BrandName,
        HUBSPOT.dbo.fn_convertDate(#MostRecentBooking.ConfirmDate, @dateFormat) AS ConfirmDate,
        #MostRecentBooking.BookingSourcePrimary,
        COALESCE([SL_Simplified_SalesOffice].[SalesOfficeSimplified],#MostRecentBooking.BookingOfficeLocation,'') AS BookingOfficeLocation,
        COALESCE([SL_Simplified_Language].[LanguageSimplified],#MostRecentBooking.BookingLanguageFull,'') AS BookingLanguage,
        CLI.ClientCode,
        COALESCE([SL_Simplified_Title].[TitleSimplified],'') AS Title,
        CLI.FirstName,
        CLI.LastName,
        CLI.City,
        CLI.County,
        CLI.Postcode,
        COALESCE([SL_Simplified_Triton_Client_Country].[CountrySimplified],CLI.Country,'') AS Country,
        CLI.ClientEmail AS Email,
        CASE #ClientPreferences.CancelFromMailing WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromMailing,
        CASE #ClientPreferences.CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromEmail,
        CASE #ClientPreferences.[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromBrochure,
        CLI.Deceased,
        CASE CLI.Blacklisted WHEN 'Y' THEN 'true' ELSE 'false' END AS Blacklisted,
        #MostRecentBooking.ProductName AS BookingProductName,
		HUBSPOT.dbo.fn_convertDate(#MostRecentBooking.BookingDate, @dateFormat) AS BookingDateBooked,
		HUBSPOT.dbo.fn_convertDate(#MostRecentBooking.DepartureDate, @dateFormat) AS BookingDepartureDate,
        COALESCE([SL_BaseNameFull].[BaseName],#MostRecentBooking.AreaName) AS BookingDestination,
        CASE WHEN SUBSTRING(#MostRecentBooking.UserDefinable1,3,1) IN ('X','L','P') THEN 'Catamaran' ELSE 'Monohull' END AS BookingHullType, 
        COALESCE(CLI.[Add1],'') AS Address1,
        COALESCE(CLI.[Add2],'') AS Address2,
        COALESCE(CLI.[Add3],'') AS Address3,
        COALESCE(CLI.[Phone1],'') AS Phone1,
        COALESCE(CLI.[Phone2],'') AS Phone2,
        COALESCE(CLI.[BusinessPhone],'') AS BusinessPhone,
        HUBSPOT.dbo.fn_convertDate(CLI.DateOfBirth, @dateFormat) AS DateOfBirth,
        COALESCE(#MostRecentBooking.ExecutiveReportingRegion,'') AS BookingExecutiveReportingRegion,
        COALESCE(CLI.NumberOfCharters,'') AS NumberOfCharters,
        COALESCE(#MostRecentBooking.Duration,'') AS Duration,
        --COALESCE([CELERITY_ST_BOOKINGS].CleanBaseName,'') AS CleanBaseName,--Ignore for now
        --COALESCE([CELERITY_ST_BOOKINGS].CleanBoatName,'') AS CleanBoatName,--Ignore for now
        COALESCE(#MostRecentBooking.UserDefinable1,'') AS BookingBoat,
        COALESCE(#MostRecentBooking.BookRef,'') AS BookingBookRef,
        COALESCE(CLI.CustomerLinkCode,'') AS CustomerLinkCode,
        COALESCE(CLI.[CustomerClass],'') AS CustomerClass,
        CASE CLI.GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END AS GoneAway,
        COALESCE(CLI.ClientSourceCode,'') AS ClientSourceCode,
        'Booking' AS [Status], 
        COALESCE([SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified],'') AS ClientBookingOffice,

        -- DWYT-16 New HubSpot API fields
        CASE #ClientPreferences.[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromTelephone,
		HUBSPOT.dbo.fn_convertDateFromText(CLI.LastContactDate, @dateFormat) AS LastContactDate,
        HUBSPOT.dbo.fn_convertDate(#MostRecentBooking.CancelledDate, @dateFormat) AS BookingCancellationDate,
        COALESCE(#CancelledBookings.CancellationDate,'') AS CancellationCancellationDate,
        COALESCE(#CancelledBookings.CancellationBookRef,'') AS CancellationBookRef,
        COALESCE(#FirstCharter.FirstCharterDepartureDate,'') AS FirstCharterDepartureDate,
        COALESCE(#FirstCharter.FirstCharterDestination,'') AS FirstCharterDestination,
        COALESCE(#FirstCharter.FirstCharterDateBooked,'') AS FirstCharterDateBooked,
        COALESCE(#FirstCharter.FirstCharterProduct,'') AS FirstCharterProduct,
        COALESCE(#FirstCharter.FirstCharterHullType,'') AS FirstCharterHullType,
        COALESCE(#FirstCharter.FirstCharterBoat,'') AS FirstCharterBoat,
        (SELECT COUNT(*) FROM [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKINGS] WITH (NOLOCK)
            INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKEDPASSENGERS] WITH (NOLOCK)
            ON [CELERITY_ST_BOOKEDPASSENGERS].BookRef=[CELERITY_ST_BOOKINGS].BookRef
            INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENT] WITH (NOLOCK)
            ON [CELERITY_ST_BOOKEDPASSENGERS].ClientCode = [CELERITY_ST_CLIENT].ClientCode
            WHERE [CELERITY_ST_CLIENT].ClientCode = CLI.ClientCode
            AND [CELERITY_ST_BOOKINGS].BrandName ='MRG'
            AND [CELERITY_ST_BOOKINGS].[Status] = 'Booking'
        ) AS NumberOfBookings,
        HUBSPOT.dbo.fn_convertDate(CLI.DateCreated, @dateFormat) AS TritonCreateDate,
        COALESCE(#MostRecentBooking.BookingSourceSecondary,'') AS BookingSourceSecondary,
        '' AS BookingSourceTertiary,
        COALESCE(#MostRecentBooking.AgentCode,'') AS BookingSalesAgent,
        COALESCE(REPLACE(REPLACE(REPLACE(CLI.ClientCode, 'TRT-M',''), 'TRT-S', ''), 'TRT-', ''), '') AS CleanClientID,
        COALESCE(REPLACE(REPLACE(REPLACE(#MostRecentBooking.BookRef, 'TRT-M', ''), 'TRT-S', ''), 'TRT-', ''),'') AS BookingCleanBookRef,
        COALESCE(#MostRecentBooking.[TotalPax],0) AS BookingTotalPax,
        COALESCE(REPLACE(#MostRecentBooking.[Status], 'Booking', 'Confirmed'),'') AS BookingStatus
    FROM 
        #MostRecentBooking WITH (NOLOCK)
    INNER JOIN #Clients CLI WITH (NOLOCK)
        ON CLI.ClientCode=#MostRecentBooking.ClientCode
	LEFT JOIN #ClientPreferences WITH (NOLOCK)
		ON #ClientPreferences.ClientCode = CLI.ClientCode
	LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_SalesOffice] WITH (NOLOCK)
        ON [SL_Simplified_SalesOffice].BrandName=#MostRecentBooking.BrandName AND [SL_Simplified_SalesOffice].[SalesOfficeFromRawData]=#MostRecentBooking.BookingOfficeLocation
    LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Language] WITH (NOLOCK)
        ON [SL_Simplified_Language].LanguageActual=#MostRecentBooking.BookingLanguageFull
    LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Triton_Client_Country] WITH (NOLOCK)
        ON [SL_Simplified_Triton_Client_Country].[CountryActual]=CLI.Country
    LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Title] WITH (NOLOCK)
        ON [SL_Simplified_Title].[TitleActual]=CLI.Title
    LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_ClientBookingOffice] WITH (NOLOCK)
        ON [SL_Simplified_ClientBookingOffice].[ClientBookingOfficeActual]=CLI.BookingOffice
    LEFT JOIN [HUBSPOT].[dbo].[SL_BaseNameFull] WITH (NOLOCK)
        ON [SL_BaseNameFull].BaseCode = #MostRecentBooking.AreaCode
        AND [SL_BaseNameFull].Brand = 'MRG'
    -- First Charter records
    LEFT JOIN #FirstCharter
		ON #FirstCharter.FirstCharterClientEmail = CLI.ClientEmail
    -- Most recent cancellation records
    LEFT JOIN #CancelledBookings
	    ON #CancelledBookings.CancellationClientEmail = CLI.ClientEmail
	ORDER BY ConfirmDate,CLI.ClientEmail

END

GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_TRITON_TM_BROCHURE_REQUESTS]    Script Date: 12/04/2019 10:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--========================================================================================================================
-- Procedure Date - Procedure Description
-- 28-Nov-2017      BUILD_HUBSPOT_TRITON_TM_BROCHURE_REQUESTS - Selects Triton Moorings brochure request records for HubSpot upload
--
--========================================================================================================================
-- Change History===
--========================================================================================================================
-- Date             Version     Who                Comment
-- 28-Nov-2017      1.0         Tim Wilson         Revised for CRM Phase III
-- 05-Jan-2018      1.1         Tim Wilson         Debugged recent bookings join
-- 20-Mar-2018      1.2         Tim Wilson         Remove selection filter for Deceased flag; Add BookingStatus column
-- 25-Apr-2018      1.4         Tim Wilson         Resolve client code only unique within brand issue
-- 01-May-2018      1.5         Tim Wilson         Remove booking data columns
-- 17-May-2018      1.6         Tim Wilson         Select all data from 01-01-2010
-- 17-May-2018      1.7         Tim Wilson         Output dates in yyyy-mm-dd format
-- 21-May-2018      1.8         Tim Wilson         Corrections for dedupe logic
-- 18-Jun-2018      1.9         Tim Wilson         Recoded email-centrically and using CTEs for clarity
--========================================================================================================================

CREATE PROC [dbo].[BUILD_HUBSPOT_TRITON_TM_BROCHURE_REQUESTS] @pStartDate varchar(10) = NULL , @pEndDate varchar(10) = NULL, @pDateFormat varchar(10) = NULL
/* @pStartDate and @pEndDate are either a date string with format 'yyyy-mm-dd' or the word 'TODAY' for the current date */
AS
BEGIN

	DECLARE @startDate date, @endDate date, @dateFormat varchar(10)

	SET NOCOUNT ON;

	IF @pStartDate = 'TODAY'
	BEGIN
		SET @startDate = CONVERT(DATE,GETDATE())
	END
	ELSE
	BEGIN
		-- Default to 10 days ago
		SET @startDate = ISNULL(CONVERT(DATE,@pStartDate,120), CONVERT(DATE,GETDATE()-10))
	END

	IF @pEndDate = 'TODAY'
	BEGIN
		SET @endDate   = CONVERT(DATE,GETDATE())
	END
	ELSE
	BEGIN
		-- Default to yesterday
		SET @endDate   = ISNULL(CONVERT(DATE,@pEndDate,120), CONVERT(DATE,GETDATE()-1))
	END

	SET @dateFormat    = ISNULL(@pDateFormat, 'unix')
;
WITH ClientPreferences
(
	 ClientCode
	,CancelFromBrochure
	,CancelFromMailing
	,CancelFromEmail
	,CancelFromTelephone
	,CancelFromSMS
	,CancelFromElectronicB
)
AS
(
	SELECT
		 ClientCode
		,CancelFromBrochure
		,CancelFromMailing
		,CancelFromEmail
		,CancelFromTelephone
		,CancelFromSMS
		,CancelFromElectronicB
	FROM
	(
		SELECT
			 [ClientCode]
			,MAX(ISNULL([CancelFromBrochure],'')) CancelFromBrochure
			,MAX(ISNULL([CancelFromMailing],'')) CancelFromMailing
			,MAX(ISNULL([CancelFromEmail],'')) CancelFromEmail
			,MAX(ISNULL([CancelFromTelephone],'')) CancelFromTelephone
			,MAX(ISNULL([CancelFromSMS],'')) CancelFromSMS
			,MAX(ISNULL([CancelFromElectronicB],'')) CancelFromElectronicB
		FROM [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENTPREFERENCES] WITH (NOLOCK)
		GROUP BY [ClientCode]
	) ClientPreferencesInnerSelect
),

Clients
(
	 ClientCode
	,ClientEmail
	,Title
    ,FirstName
    ,LastName
    ,City
    ,County
    ,Postcode
	,Country
    ,Add1
    ,Add2
    ,Add3
    ,Phone1
    ,Phone2
    ,MobilePhone
    ,DateOfBirth
	,Deceased
	,Blacklisted
	,BookingOffice
	,BusinessPhone
	,NumberOfCharters
	,CustomerLinkCode
	,CustomerClass
	,GoneAway
	,ClientSourceCode
	,LastContactDate
	,DateCreated
)
AS
(
	SELECT 
		 ClientCode
		,Email1 AS ClientEmail
		,Title
        ,FirstName
        ,LastName
        ,City
        ,County
        ,Postcode
		,Country
        ,Add1
        ,Add2
        ,Add3
        ,Phone1
        ,Phone2
        ,MobilePhone
        ,DateOfBirth
		,Deceased
		,Blacklisted
		,BookingOffice
		,BusinessPhone
		,NumberOfCharters
		,CustomerLinkCode
		,CustomerClass
		,GoneAway
		,ClientSourceCode
		,LastContactDate
		,DateCreated
	FROM [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENT] WITH (NOLOCK)
    WHERE
            Brand = 'M'
	    AND Email1 LIKE '%_@%_.__%'
		AND Email1 NOT LIKE '%[[]%' AND Email1 NOT LIKE '%]%' AND Email1 NOT LIKE '%(%' AND Email1 NOT LIKE '%)%' AND Email1 NOT LIKE '%''%' AND Email1 NOT LIKE '% %'
)

    SELECT DISTINCT 
         LifecycleStage
        ,BrandName
        ,BookingOfficeLocation
--        ,BookingLanguage
        ,ClientCode
        ,Title
        ,FirstName
        ,LastName
        ,City
        ,County
        ,Postcode
        ,Country
        ,Email
        ,CancelFromMailing
        ,CancelFromEmail
        ,CancelFromBrochure
        ,Deceased
        ,Blacklisted
        ,BrochureProductRequested
        ,BrochureDateRequested
        ,Address1
        ,Address2
        ,Address3
        ,Phone1
        ,Phone2
        ,BusinessPhone
        ,DateOfBirth
        ,CustomerLinkCode
        ,CustomerClass
        ,GoneAway
        ,ClientSourceCode
        ,[Status]
        ,ClientBookingOffice
        ,CancelFromTelephone
        ,LastContactDate
        ,TritonCreateDate
        ,CleanClientId
    FROM
    (
        SELECT 
            'lead' as LifecycleStage,
            'Moorings' AS BrandName,
            COALESCE([SL_Simplified_SalesOffice].[SalesOfficeSimplified],[CELERITY_ST_BROCHUREREQUEST].[Location]) AS BookingOfficeLocation,
            [CELERITY_ST_BROCHUREREQUEST].Language AS BookingLanguage,
            [CELERITY_ST_BROCHUREREQUEST].[ClientCode],
            COALESCE([SL_Simplified_Title].[TitleSimplified],'') AS Title,
            CLI.[FirstName],
            CLI.[LastName],
            CLI.[City],
            CLI.[County],
            CLI.[Postcode],
            COALESCE([SL_Simplified_Triton_Client_Country].[CountrySimplified],CLI.Country,'') AS Country,
            CLI.ClientEmail AS Email,
            CASE CLP.CancelFromMailing WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromMailing,
            CASE CLP.CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromEmail,
            CASE CLP.[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromBrochure,
            CLI.[Deceased],
            CASE CLI.Blacklisted WHEN 'Y' THEN 'true' ELSE 'false' END AS Blacklisted,
            COALESCE([SL_Simplified_BrochureName].[BrochureNameSimplified],[CELERITY_ST_BROCHUREREQUEST].[BrochureName],'') AS BrochureProductRequested,
			HUBSPOT.dbo.fn_convertDate([CELERITY_ST_BROCHUREREQUEST].[DateRequested], @dateFormat) AS BrochureDateRequested,
            COALESCE(CLI.[Add1],'') AS Address1,
            COALESCE(CLI.[Add2],'') AS Address2,
            COALESCE(CLI.[Add3],'') AS Address3,
            COALESCE(CLI.[Phone1],'') AS Phone1,
            COALESCE(CLI.[Phone2],'') AS Phone2,
            COALESCE(CLI.[BusinessPhone],'') AS BusinessPhone,
            HUBSPOT.dbo.fn_convertDate(CLI.DateOfBirth, @dateFormat) AS DateOfBirth,
            COALESCE(CLI.CustomerLinkCode,'') AS CustomerLinkCode,
            COALESCE(CLI.[CustomerClass],'') AS CustomerClass,
            CASE CLI.GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END AS GoneAway,
            COALESCE(CLI.ClientSourceCode,'') AS ClientSourceCode,
            'Brochure' AS Status,  
            COALESCE([SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified],'') AS ClientBookingOffice,
            DENSE_RANK() OVER(PARTITION BY CLI.ClientEmail 
            ORDER BY 
                [CELERITY_ST_BROCHUREREQUEST].[DateRequested] DESC,
                CLI.ClientCode DESC,
                COALESCE([SL_Simplified_BrochureName].[BrochureNameSimplified],[CELERITY_ST_BROCHUREREQUEST].[BrochureName]),
                COALESCE([SL_Simplified_SalesOffice].[SalesOfficeSimplified],[CELERITY_ST_BROCHUREREQUEST].[Location]),
                (CASE CLP.CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,    
                (CASE CLP.CancelFromMailing WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                (CASE CLP.[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                (CASE CLP.[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                CLI.[LastName], 
                CLI.[FirstName]
            ) AS RankResult,

            -- DWYT-16 New HubSpot API fields
            CASE CLP.[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromTelephone,
            HUBSPOT.dbo.fn_convertDateFromText(CLI.LastContactDate, @dateFormat) AS LastContactDate,
            HUBSPOT.dbo.fn_convertDate(CLI.DateCreated, @dateFormat) AS TritonCreateDate,
            COALESCE(REPLACE(REPLACE(REPLACE(CLI.ClientCode, 'TRT-M',''), 'TRT-S', ''), 'TRT-', ''), '') AS CleanClientID

        FROM
            [CelerityMarine_Stage].[dbo].[CELERITY_ST_BROCHUREREQUEST] WITH (NOLOCK)
        INNER JOIN Clients CLI WITH (NOLOCK)
            ON CLI.ClientCode=[CELERITY_ST_BROCHUREREQUEST].ClientCode
        INNER JOIN [HUBSPOT].[dbo].[SL_Simplified_BrochureName] WITH (NOLOCK)
            ON [SL_Simplified_BrochureName].[BrochureNameActual]=[CELERITY_ST_BROCHUREREQUEST].[BrochureName] AND [SL_Simplified_BrochureName].[BrandName]='MRG'
        LEFT JOIN ClientPreferences CLP WITH (NOLOCK)
            ON CLP.ClientCode=CLI.ClientCode
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_SalesOffice] WITH (NOLOCK)
            ON [SL_Simplified_SalesOffice].BrandName ='MRG' AND [SL_Simplified_SalesOffice].[SalesOfficeFromRawData]=[CELERITY_ST_BROCHUREREQUEST].[Location]
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Triton_Client_Country] WITH (NOLOCK)
            ON [SL_Simplified_Triton_Client_Country].[CountryActual]=CLI.Country
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Title] WITH (NOLOCK)
            ON [SL_Simplified_Title].[TitleActual]=CLI.Title
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_ClientBookingOffice] WITH (NOLOCK)
            ON [SL_Simplified_ClientBookingOffice].[ClientBookingOfficeActual]=CLI.BookingOffice
        WHERE
            [CELERITY_ST_BROCHUREREQUEST].[DateRequested] BETWEEN @startDate AND @endDate
--            [CELERITY_ST_BROCHUREREQUEST].[DateRequested] BETWEEN CONVERT(DATE,GETDATE()-10) AND CONVERT(DATE,GETDATE()-1)
--      AND [CELERITY_ST_BROCHUREREQUEST].[DateRequested] BETWEEN CONVERT(DATE,'2013-01-01', 120) AND CONVERT(DATE, '2013-12-31', 120)
--        AND [CELERITY_ST_BROCHUREREQUEST].[DateRequested] BETWEEN CONVERT(DATE,'2016-01-01', 120) AND CONVERT(DATE, '2016-12-31', 120)
    ) Result
    Where 
        RankResult=1
    ORDER BY 
        BrochureDateRequested,Email

END

GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_TRITON_TM_ENEWS]    Script Date: 12/04/2019 10:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--========================================================================================================================
-- Procedure Date - Procedure Description
-- 28-Nov-2017      BUILD_HUBSPOT_TRITON_TM_ENEWS - Selects Triton Moorings enews records for HubSpot upload
--
--========================================================================================================================
-- Change History===
--========================================================================================================================
-- Date             Version     Who                Comment
-- 28-Nov-2017      1.0         Tim Wilson         Revised for CRM Phase III
-- 05-Jan-2018      1.1         Tim Wilson         Debugged recent bookings join
-- 20-Mar-2018      1.2         Tim Wilson         Remove selection filter for Deceased flag; Add BookingStatus column
-- 25-Apr-2018      1.4         Tim Wilson         Resolve client code only unique within brand issue
-- 01-May-2018      1.5         Tim Wilson         Remove booking data columns
-- 17-May-2018      1.6         Tim Wilson         Select all data from 01-01-2010
-- 17-May-2018      1.7         Tim Wilson         Output dates in yyyy-mm-dd format
-- 21-May-2018      1.8         Tim Wilson         Corrections for dedupe logic
-- 18-Jun-2018      1.9         Tim Wilson         Recoded email-centrically and using CTEs for clarity
--========================================================================================================================

CREATE PROC [dbo].[BUILD_HUBSPOT_TRITON_TM_ENEWS] @pStartDate varchar(10) = NULL , @pEndDate varchar(10) = NULL, @pDateFormat varchar(10) = NULL
/* @pStartDate and @pEndDate are either a date string with format 'yyyy-mm-dd' or the word 'TODAY' for the current date */
AS
BEGIN

	DECLARE @startDate date, @endDate date, @dateFormat varchar(10)

	SET NOCOUNT ON;

	IF @pStartDate = 'TODAY'
	BEGIN
		SET @startDate = CONVERT(DATE,GETDATE())
	END
	ELSE
	BEGIN
		-- Default to 10 days ago
		SET @startDate = ISNULL(CONVERT(DATE,@pStartDate,120), CONVERT(DATE,GETDATE()-10))
	END

	IF @pEndDate = 'TODAY'
	BEGIN
		SET @endDate   = CONVERT(DATE,GETDATE())
	END
	ELSE
	BEGIN
		-- Default to yesterday
		SET @endDate   = ISNULL(CONVERT(DATE,@pEndDate,120), CONVERT(DATE,GETDATE()-1))
	END

	SET @dateFormat    = ISNULL(@pDateFormat, 'unix')
;
WITH ClientPreferences
(
	 ClientCode
	,CancelFromBrochure
	,CancelFromMailing
	,CancelFromEmail
	,CancelFromTelephone
	,CancelFromSMS
	,CancelFromElectronicB
)
AS
(
	SELECT
		 ClientCode
		,CancelFromBrochure
		,CancelFromMailing
		,CancelFromEmail
		,CancelFromTelephone
		,CancelFromSMS
		,CancelFromElectronicB
	FROM
	(
		SELECT
			 [ClientCode]
			,MAX(ISNULL([CancelFromBrochure],'')) CancelFromBrochure
			,MAX(ISNULL([CancelFromMailing],'')) CancelFromMailing
			,MAX(ISNULL([CancelFromEmail],'')) CancelFromEmail
			,MAX(ISNULL([CancelFromTelephone],'')) CancelFromTelephone
			,MAX(ISNULL([CancelFromSMS],'')) CancelFromSMS
			,MAX(ISNULL([CancelFromElectronicB],'')) CancelFromElectronicB
		FROM [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENTPREFERENCES] WITH (NOLOCK)
		GROUP BY [ClientCode]
	) ClientPreferencesInnerSelect
),

Clients
(
	 ClientCode
	,ClientEmail
	,Title
    ,FirstName
    ,LastName
    ,City
    ,County
    ,Postcode
	,Country
    ,Add1
    ,Add2
    ,Add3
    ,Phone1
    ,Phone2
    ,MobilePhone
    ,DateOfBirth
	,Deceased
	,Blacklisted
	,BookingOffice
	,BusinessPhone
	,NumberOfCharters
	,CustomerLinkCode
	,CustomerClass
	,GoneAway
	,ClientSourceCode
	,LastContactDate
	,DateCreated
)
AS
(
	SELECT 
		 ClientCode
		,Email1 AS ClientEmail
		,Title
        ,FirstName
        ,LastName
        ,City
        ,County
        ,Postcode
		,Country
        ,Add1
        ,Add2
        ,Add3
        ,Phone1
        ,Phone2
        ,MobilePhone
        ,DateOfBirth
		,Deceased
		,Blacklisted
		,BookingOffice
		,BusinessPhone
		,NumberOfCharters
		,CustomerLinkCode
		,CustomerClass
		,GoneAway
		,ClientSourceCode
		,LastContactDate
		,DateCreated
	FROM [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENT] WITH (NOLOCK)
    WHERE
            Brand = 'M'
        AND COALESCE(Email1,'') != ''
	    AND Email1 LIKE '%_@%_.__%'
		AND Email1 NOT LIKE '%[[]%' AND Email1 NOT LIKE '%]%' AND Email1 NOT LIKE '%(%' AND Email1 NOT LIKE '%)%' AND Email1 NOT LIKE '%''%' AND Email1 NOT LIKE '% %'
)

    SELECT DISTINCT
         LifecycleStage
        ,BrandName
        ,BookingOfficeLocation
        ,BookingLanguage
        ,Title
        ,FirstName
        ,LastName
        ,Country
        ,Email
        ,EnewsProductName
        ,EnewsDateRequested
        ,Address1
        ,Address2
        ,Address3
        ,Phone1
        ,Phone2
        ,BusinessPhone
        ,DateOfBirth
        ,CustomerLinkCode
        ,CustomerClass
        ,GoneAway
        ,ClientSourceCode
        ,[Status]
        ,ClientBookingOffice
        ,CancelFromTelephone
        ,LastContactDate
        ,TritonCreateDate
        ,Deceased
        ,CancelFromEmail
        ,CancelFromBrochure
        ,ClientCode
    FROM 
    (
        SELECT
            'subscriber' as LifecycleStage, 
            'Moorings' AS BrandName,
            COALESCE([SL_ISO_SalesOffice].[SalesOffice],'') AS BookingOfficeLocation,
            COALESCE([SL_ISO_SalesOffice].[Language],'') AS BookingLanguage,
            COALESCE([SL_Simplified_Title].[TitleSimplified],'') AS Title,
            TRT_TRITON_ST_EFMST.EFFNAM AS FirstName,
            TRT_TRITON_ST_EFMST.EFLNAM AS LastName,
            COALESCE([SL_Simplified_Triton_Client_Country].[CountrySimplified],[SL_ISO_SalesOffice].[CountryOfResidence],'') AS Country,
            TRT_TRITON_ST_EFMST.EFMAIL AS Email,
            COALESCE([SL_EFSITE_PRODUCT_INTEREST].[ProductInterest],TRT_TRITON_ST_EFMST.EFSITE) AS EnewsProductName,
			HUBSPOT.dbo.fn_convertDateFromInteger(TRT_TRITON_ST_EFMST.EFETDT, @dateFormat) AS EnewsDateRequested,
            COALESCE(CLI.[Add1],'') AS Address1,
            COALESCE(CLI.[Add2],'') AS Address2,
            COALESCE(CLI.[Add3],'') AS Address3,
            COALESCE(CLI.[Phone1],'') AS Phone1,
            COALESCE(CLI.[Phone2],'') AS Phone2,
            COALESCE(CLI.[BusinessPhone],'') AS BusinessPhone,
            HUBSPOT.dbo.fn_convertDate(CLI.DateOfBirth, @dateFormat) AS DateOfBirth,
            --COALESCE(CLI.NumberOfCharters,'') AS NumberOfCharters, -- Ignore for now
            COALESCE(CLI.CustomerLinkCode,'') AS CustomerLinkCode,
            COALESCE(CLI.[CustomerClass],'') AS CustomerClass,
            CASE CLI.GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END AS GoneAway,
            COALESCE(CLI.ClientSourceCode,'') AS ClientSourceCode,
            'Enews' as Status,
            COALESCE([SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified],'') AS ClientBookingOffice,
            DENSE_RANK() OVER(PARTITION BY TRT_TRITON_ST_EFMST.EFMAIL 
                ORDER BY 
                TRT_TRITON_ST_EFMST.EFETDT DESC,
                CLI.ClientCode DESC,
                COALESCE([SL_EFSITE_PRODUCT_INTEREST].[ProductInterest],TRT_TRITON_ST_EFMST.EFSITE),
                [SL_ISO_SalesOffice].[Language],
                (CASE CLP.[CancelFromEmail] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                (CASE CLP.[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                (CASE CLP.[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                TRT_TRITON_ST_EFMST.EFLNAM,
                TRT_TRITON_ST_EFMST.EFFNAM
            ) AS RankResult,

            -- DWYT-16 New HubSpot API fields
            CASE CLP.[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromTelephone,
			HUBSPOT.dbo.fn_convertDateFromText(CLI.LastContactDate, @dateFormat) AS LastContactDate,
			HUBSPOT.dbo.fn_convertDate(CLI.DateCreated, @dateFormat) AS TritonCreateDate,
            COALESCE(CLI.[Deceased],'') AS Deceased,
            CASE CLP.CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromEmail,
            CASE CLP.[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromBrochure,
            COALESCE(CLI.ClientCode,'') AS ClientCode
            
        FROM 
            [CelerityMarine_Stage].[dbo].[TRT_TRITON_ST_EFMST] WITH (NOLOCK)
        LEFT JOIN Clients CLI WITH (NOLOCK) 
            ON REPLACE(CLI.ClientEmail,'\@','@') = REPLACE(TRT_TRITON_ST_EFMST.EFMAIL,'\@','@')
        LEFT JOIN ClientPreferences CLP WITH (NOLOCK)
            ON CLP.ClientCode=CLI.ClientCode
        LEFT JOIN [HUBSPOT].[dbo].[SL_ISO_SalesOffice] WITH (NOLOCK) 
            ON [SL_ISO_SalesOffice].[ISO_Code]=TRT_TRITON_ST_EFMST.EFCTCD
        LEFT JOIN [HUBSPOT].[dbo].[SL_EFSITE_PRODUCT_INTEREST] WITH (NOLOCK)
            ON [SL_EFSITE_PRODUCT_INTEREST].[EFSITE]=TRT_TRITON_ST_EFMST.EFSITE AND [SL_EFSITE_PRODUCT_INTEREST].[BrandName]='Moorings'
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Triton_Client_Country] WITH (NOLOCK)
            ON [SL_Simplified_Triton_Client_Country].[CountryActual]=[SL_ISO_SalesOffice].[CountryOfResidence]
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Title] WITH (NOLOCK)
            ON [SL_Simplified_Title].[TitleActual]=CLI.Title
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_ClientBookingOffice] WITH (NOLOCK)
            ON [SL_Simplified_ClientBookingOffice].[ClientBookingOfficeActual]=CLI.BookingOffice
        WHERE
            TRT_TRITON_ST_EFMST.EFMAIL LIKE '%_@%_.__%'
        AND TRT_TRITON_ST_EFMST.EFMAIL NOT LIKE '%[[]%' AND TRT_TRITON_ST_EFMST.EFMAIL NOT LIKE '%]%' AND TRT_TRITON_ST_EFMST.EFMAIL NOT LIKE '%(%' AND TRT_TRITON_ST_EFMST.EFMAIL NOT LIKE '%)%' AND TRT_TRITON_ST_EFMST.EFMAIL NOT LIKE '%''%' AND TRT_TRITON_ST_EFMST.EFMAIL NOT LIKE '% %'
        AND TRT_TRITON_ST_EFMST.EFETDT != 0
--        AND TRT_TRITON_ST_EFMST.EFETDT >= CONVERT(INT, CONVERT(VARCHAR(8),GETDATE()-10,112)) AND TRT_TRITON_ST_EFMST.EFETDT <= CONVERT(INT, CONVERT(VARCHAR(8),GETDATE()-1,112))
--        AND TRT_TRITON_ST_EFMST.EFETDT BETWEEN 20130101 AND 20131231
--        AND TRT_TRITON_ST_EFMST.EFETDT BETWEEN 20160101 AND 20161231
        AND TRT_TRITON_ST_EFMST.EFETDT BETWEEN CONVERT(INT, CONVERT(VARCHAR(8),@startDate,112)) AND CONVERT(INT, CONVERT(VARCHAR(8),@endDate,112))
    )Result
    WHERE RankResult=1
	ORDER BY EnewsDateRequested,Email

END

GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_TRITON_TM_QUOTES]    Script Date: 12/04/2019 10:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--========================================================================================================================
-- Procedure Date - Procedure Description
-- 28-Nov-2017      BUILD_HUBSPOT_TRITON_TM_QUOTES - Selects Triton Moorings quotes records for HubSpot upload
--
--========================================================================================================================
-- Change History===
--========================================================================================================================
-- Date             Version     Who                Comment
-- 28-Nov-2017      1.0         Tim Wilson         Revised for CRM Phase III
-- 10-Jan-2018      1.1         Tim Wilson         Added JOIN for most recent booking data
--                                                 Added new column QuoteSalesAgent
-- 20-Mar-2018      1.2         Tim Wilson         Remove selection filter for Deceased flag; Add BookingStatus column
-- 23-Apr-2018      1.3         Tim Wilson         Resolve conflict between QuoteDuration and
--                                                 Bookings Duration
-- 25-Apr-2018      1.4         Tim Wilson         Resolve client code only unique within brand issue
-- 27-Apr-2018      1.5         Tim Wilson         Drop duration columns altogether for quotes selections
-- 01-May-2018      1.6         Tim Wilson         Remove booking data columns
-- 17-May-2018      1.7         Tim Wilson         Select all data from 01-01-2010
-- 17-May-2018      1.8         Tim Wilson         Output dates in yyyy-mm-dd format
-- 21-May-2018      1.9         Tim Wilson         Corrections for dedupe logic
-- 18-Jun-2018      1.10        Tim Wilson         Recoded email-centrically and using CTEs for clarity
--========================================================================================================================

CREATE PROC [dbo].[BUILD_HUBSPOT_TRITON_TM_QUOTES] @pStartDate varchar(10) = NULL , @pEndDate varchar(10) = NULL, @pDateFormat varchar(10) = NULL
/* @pStartDate and @pEndDate are either a date string with format 'yyyy-mm-dd' or the word 'TODAY' for the current date */
AS
BEGIN

	DECLARE @startDate date, @endDate date, @dateFormat varchar(10)

	SET NOCOUNT ON;

	IF @pStartDate = 'TODAY'
	BEGIN
		SET @startDate = CONVERT(DATE,GETDATE())
	END
	ELSE
	BEGIN
		-- Default to 10 days ago
		SET @startDate = ISNULL(CONVERT(DATE,@pStartDate,120), CONVERT(DATE,GETDATE()-10))
	END

	IF @pEndDate = 'TODAY'
	BEGIN
		SET @endDate   = CONVERT(DATE,GETDATE())
	END
	ELSE
	BEGIN
		-- Default to yesterday
		SET @endDate   = ISNULL(CONVERT(DATE,@pEndDate,120), CONVERT(DATE,GETDATE()-1))
	END

	SET @dateFormat    = ISNULL(@pDateFormat, 'unix')
;
WITH ClientPreferences
(
	 ClientCode
	,CancelFromBrochure
	,CancelFromMailing
	,CancelFromEmail
	,CancelFromTelephone
	,CancelFromSMS
	,CancelFromElectronicB
)
AS
(
	SELECT
		 ClientCode
		,CancelFromBrochure
		,CancelFromMailing
		,CancelFromEmail
		,CancelFromTelephone
		,CancelFromSMS
		,CancelFromElectronicB
	FROM
	(
		SELECT
			 [ClientCode]
			,MAX(ISNULL([CancelFromBrochure],'')) CancelFromBrochure
			,MAX(ISNULL([CancelFromMailing],'')) CancelFromMailing
			,MAX(ISNULL([CancelFromEmail],'')) CancelFromEmail
			,MAX(ISNULL([CancelFromTelephone],'')) CancelFromTelephone
			,MAX(ISNULL([CancelFromSMS],'')) CancelFromSMS
			,MAX(ISNULL([CancelFromElectronicB],'')) CancelFromElectronicB
		FROM [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENTPREFERENCES] WITH (NOLOCK)
		GROUP BY [ClientCode]
	) ClientPreferencesInnerSelect
),

Clients
(
	 ClientCode
	,ClientEmail
	,Title
    ,FirstName
    ,LastName
    ,City
    ,County
    ,Postcode
	,Country
    ,Add1
    ,Add2
    ,Add3
    ,Phone1
    ,Phone2
    ,MobilePhone
    ,DateOfBirth
	,Deceased
	,Blacklisted
	,BookingOffice
	,BusinessPhone
	,NumberOfCharters
	,CustomerLinkCode
	,CustomerClass
	,GoneAway
	,ClientSourceCode
	,LastContactDate
	,DateCreated
)
AS
(
	SELECT 
		 ClientCode
		,Email1 AS ClientEmail
		,Title
        ,FirstName
        ,LastName
        ,City
        ,County
        ,Postcode
		,Country
        ,Add1
        ,Add2
        ,Add3
        ,Phone1
        ,Phone2
        ,MobilePhone
        ,DateOfBirth
		,Deceased
		,Blacklisted
		,BookingOffice
		,BusinessPhone
		,NumberOfCharters
		,CustomerLinkCode
		,CustomerClass
		,GoneAway
		,ClientSourceCode
		,LastContactDate
		,DateCreated
	FROM [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENT] WITH (NOLOCK)
    WHERE
            Brand = 'M'
	    AND Email1 LIKE '%_@%_.__%'
		AND Email1 NOT LIKE '%[[]%' AND Email1 NOT LIKE '%]%' AND Email1 NOT LIKE '%(%' AND Email1 NOT LIKE '%)%' AND Email1 NOT LIKE '%''%' AND Email1 NOT LIKE '% %'
)

    SELECT DISTINCT 
         LifecycleStage
        ,BrandName
        ,QuoteSourcePrimary
        ,BookingOfficeLocation
        ,BookingLanguage
        ,ClientCode
        ,Title
        ,FirstName
        ,LastName
        ,City
        ,County
        ,Postcode
        ,Country
        ,Email
        ,CancelFromMailing
        ,CancelFromEmail
        ,CancelFromBrochure
        ,Deceased
        ,Blacklisted
        ,QuoteProductName
        ,QuoteDateRequested
        ,QuoteDepartureDate
        ,QuoteDestination
        ,QuoteHullType
        ,Address1
        ,Address2
        ,Address3
        ,Phone1
        ,Phone2
        ,BusinessPhone
        ,DateOfBirth
        ,QuoteExecutiveReportingRegion
        ,QuoteBoat
        ,QuoteBookRef
        ,CustomerLinkCode
        ,CustomerClass
        ,GoneAway
        ,ClientSourceCode
        ,[Status]
        ,ClientBookingOffice
        ,CancelFromTelephone
--        ,Notes
        ,LastContactDate
        ,TritonCreateDate
        ,CleanClientID
        ,QuoteSalesAgent
    FROM 
    (
        SELECT
            'opportunity' AS LifecycleStage,
            'Moorings' AS BrandName,
            COALESCE([CELERITY_ST_BOOKINGS].BookingSourcePrimary,'') AS QuoteSourcePrimary,
            COALESCE([SL_Simplified_SalesOffice].[SalesOfficeSimplified],[CELERITY_ST_BOOKINGS].BookingOfficeLocation,'') AS BookingOfficeLocation,
            COALESCE([SL_Simplified_Language].[LanguageSimplified],[CELERITY_ST_BOOKINGS].BookingLanguageFull,'') AS BookingLanguage,
            CLI.ClientCode,
            COALESCE([SL_Simplified_Title].[TitleSimplified],'') AS Title,
            CLI.FirstName,
            CLI.LastName,
            CLI.City,
            CLI.County,
            CLI.Postcode,
            COALESCE([SL_Simplified_Triton_Client_Country].[CountrySimplified],CLI.Country,'') AS Country,
            CLI.ClientEmail AS Email,
            CASE CLP.CancelFromMailing WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromMailing,
            CASE CLP.CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromEmail,
            CASE CLP.[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromBrochure,
            CLI.Deceased,
            CASE CLI.Blacklisted WHEN 'Y' THEN 'true' ELSE 'false' END AS Blacklisted,
            [SL_Simplified_ProductName].ProductNameSimplified AS QuoteProductName,
            HUBSPOT.dbo.fn_convertDate([CELERITY_ST_BOOKINGS].BookingDate, @dateFormat) AS QuoteDateRequested,
            HUBSPOT.dbo.fn_convertDate([CELERITY_ST_BOOKINGS].DepartureDate, @dateFormat) AS QuoteDepartureDate,
			COALESCE([SL_BaseNameFull].[BaseName],[CELERITY_ST_BOOKINGS].AreaName) AS QuoteDestination,
            CASE WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1,3,1) IN ('X','L','P') THEN 'Catamaran' ELSE 'Monohull' END AS QuoteHullType, 
            COALESCE(CLI.[Add1],'') AS Address1,
            COALESCE(CLI.[Add2],'') AS Address2,
            COALESCE(CLI.[Add3],'') AS Address3,
            COALESCE(CLI.[Phone1],'') AS Phone1,
            COALESCE(CLI.[Phone2],'') AS Phone2,
            COALESCE(CLI.[BusinessPhone],'') AS BusinessPhone,
            HUBSPOT.dbo.fn_convertDate(CLI.DateOfBirth, @dateFormat) AS DateOfBirth,
            COALESCE([CELERITY_ST_BOOKINGS].ExecutiveReportingRegion,'') AS QuoteExecutiveReportingRegion,
            COALESCE([CELERITY_ST_BOOKINGS].UserDefinable1,'') AS QuoteBoat,
            COALESCE([CELERITY_ST_BOOKINGS].BookRef,'') AS QuoteBookRef,
            COALESCE(CLI.CustomerLinkCode,'') AS CustomerLinkCode,
            COALESCE(CLI.[CustomerClass],'') AS CustomerClass,
            CASE CLI.GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END AS GoneAway,
            COALESCE(CLI.ClientSourceCode,'') AS ClientSourceCode,
            [CELERITY_ST_BOOKINGS].[Status], 
            COALESCE([SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified],'') AS ClientBookingOffice,
            DENSE_RANK() OVER(PARTITION BY CLI.ClientEmail
                ORDER BY 
					[CELERITY_ST_BOOKINGS].BookingDate DESC,
					[CELERITY_ST_BOOKINGS].BookRef DESC, 
					[CELERITY_ST_BOOKINGS].ConfirmDate DESC,
					CLI.ClientCode DESC
            ) AS RankResultMostRecentQuote,

            -- DWYT-16 New HubSpot API fields
            CASE CLP.[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromTelephone,
            '' AS Notes,
            HUBSPOT.dbo.fn_convertDateFromText(CLI.LastContactDate, @dateFormat) AS LastContactDate,
            HUBSPOT.dbo.fn_convertDate(CLI.DateCreated, @dateFormat) AS TritonCreateDate,
            COALESCE(REPLACE(REPLACE(REPLACE(CLI.ClientCode, 'TRT-M',''), 'TRT-S', ''), 'TRT-', ''), '') AS CleanClientID,
            COALESCE([CELERITY_ST_BOOKINGS].AgentCode,'') AS QuoteSalesAgent

        FROM 
            [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKINGS] WITH (NOLOCK)
        INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKEDPASSENGERS] WITH (NOLOCK)
            ON [CELERITY_ST_BOOKEDPASSENGERS].BookRef=[CELERITY_ST_BOOKINGS].BookRef
        INNER JOIN Clients CLI WITH (NOLOCK)
            ON CLI.ClientCode=[CELERITY_ST_BOOKEDPASSENGERS].ClientCode
        LEFT JOIN ClientPreferences CLP WITH (NOLOCK)
            ON CLP.ClientCode = CLI.ClientCode
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_SalesOffice] WITH (NOLOCK)
            ON [SL_Simplified_SalesOffice].BrandName=[CELERITY_ST_BOOKINGS].BrandName AND [SL_Simplified_SalesOffice].[SalesOfficeFromRawData]=[CELERITY_ST_BOOKINGS].BookingOfficeLocation
        LEFT JOIN [AMI_Galaxy].[dbo].[CONF_DT_BRAND] WITH (NOLOCK)
            ON [CONF_DT_BRAND].a_BrandCd=[CELERITY_ST_BOOKINGS].BrandName
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_ProductName] WITH (NOLOCK)
            ON [SL_Simplified_ProductName].ProductNameActual=[CELERITY_ST_BOOKINGS].ProductName
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Language] WITH (NOLOCK)
            ON [SL_Simplified_Language].LanguageActual=[CELERITY_ST_BOOKINGS].BookingLanguageFull
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Triton_Client_Country] WITH (NOLOCK)
            ON [SL_Simplified_Triton_Client_Country].[CountryActual]=CLI.Country
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Title] WITH (NOLOCK)
            ON [SL_Simplified_Title].[TitleActual]=CLI.Title
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_ClientBookingOffice] WITH (NOLOCK)
            ON [SL_Simplified_ClientBookingOffice].[ClientBookingOfficeActual]=CLI.BookingOffice
        LEFT JOIN [SL_BaseNameFull] WITH (NOLOCK)
            ON [SL_BaseNameFull].BaseCode = [CELERITY_ST_BOOKINGS].AreaCode
            AND [SL_BaseNameFull].Brand = 'MRG'
        WHERE 
            [CELERITY_ST_BOOKINGS].BrandName ='MRG'
        AND [CELERITY_ST_BOOKINGS].[Status] IN ('Quote', 'Hold', 'Option')
        AND [CELERITY_ST_BOOKINGS].BookingSourcePrimary NOT IN ('PR-Pr free trip','TAAC-Ta on account','PR-Public relations-mor','PRESS-Bericht in der press','STAFF-Staff booking','OWNS-Owner with no paymen','OS-Wot-offshore sailing','OWNER-Owner','DAYCH-Day charter discount','LOCAL-Local booking','OS-Offshore sailing','OSS-Offshore sailing','OW-Owner use','OPS-Operations/maintenan','TA','STHOL-Staff holiday','TAGEN-Travel agent','OSSFF-Staff friends & fami','LOCA2-Local booking','TO-Tour operator')
        AND [CELERITY_ST_BOOKINGS].AreaCode NOT IN ('UKD','UK1','CVO','SS1','UK2','SS2','UK3','FLT','UK4')
        AND [CELERITY_ST_BOOKINGS].ProductName IN ('SAILING_SCHOOLS','CREWED','FLOTILLA','FRANCHISE','FOOTLOOSE','BAREBOAT','CORPORATE','POWER')
        AND [CELERITY_ST_BOOKINGS].BookingType ='DIRECT'
        AND [CELERITY_ST_BOOKINGS].UserDefinable1 IS NOT NULL
        AND LTRIM(RTRIM([CELERITY_ST_BOOKINGS].UserDefinable1)) <> '' 
        AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN @startDate AND @endDate
--        AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,GETDATE()-10) AND CONVERT(DATE,GETDATE()-1)
--        AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,'2013-01-01', 120) AND CONVERT(DATE, '2013-12-31', 120)
--        AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,'2016-01-01', 120) AND CONVERT(DATE, '2016-12-31', 120)
    ) Result

    WHERE RankResultMostRecentQuote=1
    ORDER BY QuoteDateRequested,Email

END

GO
/****** Object:  StoredProcedure [dbo].[BUILD_ST_ERROR_LOG]    Script Date: 12/04/2019 10:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[BUILD_ST_ERROR_LOG]
@Brand varchar(50),
@LifeCycleStage varchar(50),
@ClientCode varchar(50),
@VID int,
@Email nvarchar(200),
@IsNew bit,
@Status varchar(10),
@Error_Msg nvarchar(4000)
AS
BEGIN 
    INSERT INTO [dbo].[ST_ERROR_LOG]
               ([Brand]
               ,[LifeCycleStage]
               ,[ClientCode]
               ,[VID]
               ,[Email]
               ,[IsNew]
               ,[Status]
               ,[Error_Msg])
     VALUES
           (@Brand
           ,@LifeCycleStage
           ,@ClientCode
           ,@VID
           ,@Email
           ,@IsNew
           ,@Status
           ,@Error_Msg)
    
END
GO
/****** Object:  StoredProcedure [dbo].[SELECT_SL_HUBSPOT_FIELD_NAMES]    Script Date: 12/04/2019 10:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SELECT_SL_HUBSPOT_FIELD_NAMES]
@BrandName varchar(50)
AS
BEGIN
    IF @BrandName='SUNSAIL' 
    BEGIN
        Select 
            QueryFieldName,
            Sunsail AS HubSpotFieldName 
        FROM 
            [HUBSPOT].[dbo].[SL_HUBSPOT_FIELD_NAMES] WITH (NOLOCK)
        WHERE
            Sunsail<>''
    END
    IF @BrandName='MOORINGS'
    BEGIN
        Select 
            QueryFieldName,
            Moorings AS HubSpotFieldName 
        FROM 
            [HUBSPOT].[dbo].[SL_HUBSPOT_FIELD_NAMES] (NOLOCK)
        WHERE
            Moorings<>''
    END
    IF @BrandName='LEBOAT'
    BEGIN 
        Select 
            QueryFieldName,
            LeBoat AS HubSpotFieldName 
        FROM 
            [HUBSPOT].[dbo].[SL_HUBSPOT_FIELD_NAMES] (NOLOCK)
        WHERE
            LeBoat<>''
    END
    IF @BrandName='FOOTLOOSE'
    BEGIN 
        Select 
            QueryFieldName,
            FootLoose AS HubSpotFieldName 
        FROM 
            [HUBSPOT].[dbo].[SL_HUBSPOT_FIELD_NAMES] (NOLOCK)
        WHERE
            FootLoose<>''
    END
    IF @BrandName='DEV'
    BEGIN 
        Select 
            QueryFieldName,
            Moorings AS HubSpotFieldName 
        FROM 
            [HUBSPOT].[dbo].[SL_HUBSPOT_FIELD_NAMES] (NOLOCK)
        WHERE
            Moorings<>''
    END
    IF @BrandName='ZZTEST'
    BEGIN 
        Select 
            QueryFieldName,
            Moorings AS HubSpotFieldName 
        FROM 
            [HUBSPOT].[dbo].[SL_HUBSPOT_FIELD_NAMES] (NOLOCK)
        WHERE
            Moorings<>''
    END
    IF @BrandName='ZLBTEST'
    BEGIN 
        Select 
            QueryFieldName,
            LeBoat AS HubSpotFieldName 
        FROM 
            [HUBSPOT].[dbo].[SL_HUBSPOT_FIELD_NAMES] (NOLOCK)
        WHERE
            LeBoat<>''
    END
END
GO
USE [master]
GO
ALTER DATABASE [HUBSPOT] SET  READ_WRITE 
GO
