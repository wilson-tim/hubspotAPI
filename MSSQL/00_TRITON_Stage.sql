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
/****** Object:  Database [TRITON_Stage]    Script Date: 24/08/2018 12:45:33 ******/
CREATE DATABASE [TRITON_Stage]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TRITON_Stage', FILENAME = N'D:\SQLFiles\MSSQL.MSSQLSERVER.Data\TRITON_Stage.mdf' , SIZE = 133120000KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1048576KB )
 LOG ON 
( NAME = N'TRITON_Stage_log', FILENAME = N'L:\SQLFiles\MSSQL.MSSQLSERVER.Log\TRITON_Stage.ldf' , SIZE = 106496000KB , MAXSIZE = 2048GB , FILEGROWTH = 8192000KB )
GO
ALTER DATABASE [TRITON_Stage] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TRITON_Stage].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TRITON_Stage] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TRITON_Stage] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TRITON_Stage] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TRITON_Stage] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TRITON_Stage] SET ARITHABORT OFF 
GO
ALTER DATABASE [TRITON_Stage] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TRITON_Stage] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TRITON_Stage] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TRITON_Stage] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TRITON_Stage] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TRITON_Stage] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TRITON_Stage] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TRITON_Stage] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TRITON_Stage] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TRITON_Stage] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TRITON_Stage] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TRITON_Stage] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TRITON_Stage] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TRITON_Stage] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TRITON_Stage] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TRITON_Stage] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TRITON_Stage] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TRITON_Stage] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TRITON_Stage] SET  MULTI_USER 
GO
ALTER DATABASE [TRITON_Stage] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TRITON_Stage] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TRITON_Stage] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TRITON_Stage] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [TRITON_Stage] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TRITON_Stage', N'ON'
GO
USE [TRITON_Stage]
GO
/****** Object:  User [NEXUS\svc.cognos]    Script Date: 24/08/2018 12:45:34 ******/
CREATE USER [NEXUS\svc.cognos] FOR LOGIN [NEXUS\svc.Cognos] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [NEXUS\DLG-RSCE-SHSA-ALL-IT-SQL-SERVER-MI-RO]    Script Date: 24/08/2018 12:45:34 ******/
CREATE USER [NEXUS\DLG-RSCE-SHSA-ALL-IT-SQL-SERVER-MI-RO] FOR LOGIN [NEXUS\DLG-RSCE-SHSA-ALL-IT-SQL-SERVER-MI-RO]
GO
/****** Object:  User [NEXUS\DLG-RSCE-SHSA-ALL-IT-SQL-SERVER-BI-RO]    Script Date: 24/08/2018 12:45:34 ******/
CREATE USER [NEXUS\DLG-RSCE-SHSA-ALL-IT-SQL-SERVER-BI-RO] FOR LOGIN [NEXUS\DLG-RSCE-SHSA-ALL-IT-SQL-SERVER-BI-RO]
GO
ALTER ROLE [db_owner] ADD MEMBER [NEXUS\svc.cognos]
GO
ALTER ROLE [db_datareader] ADD MEMBER [NEXUS\svc.cognos]
GO
ALTER ROLE [db_datareader] ADD MEMBER [NEXUS\DLG-RSCE-SHSA-ALL-IT-SQL-SERVER-MI-RO]
GO
ALTER ROLE [db_owner] ADD MEMBER [NEXUS\DLG-RSCE-SHSA-ALL-IT-SQL-SERVER-BI-RO]
GO
ALTER ROLE [db_datareader] ADD MEMBER [NEXUS\DLG-RSCE-SHSA-ALL-IT-SQL-SERVER-BI-RO]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_CheckDate]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE FUNCTION [dbo].[fn_CheckDate] (@isvalid varchar(20))
RETURNS bigint
AS
BEGIN
   DECLARE @output as bigint, @temp as bigint, @OnError as bigint
			SET @OnError = '19000101'
			SET @temp = LEFT(ltrim(rtrim(@isvalid)),8)
			IF @isvalid is not NULL
				BEGIN
					IF NOT EXISTS (SELECT i_SK_Calendar FROM AMI_Galaxy.dbo.CONF_DT_CALENDAR WHERE i_SK_Calendar = @temp )
					set @temp = @OnError 
				END
     SET @output = @temp 
     RETURN (@output)
END	

/*
select 
	TRITON_Stage.dbo.fn_CheckDate('90131219'),
	TRITON_Stage.dbo.fn_CheckDate(NULL)
*/





































GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetSunsailTaxPC]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE FUNCTION [dbo].[fn_GetSunsailTaxPC] (@CIETDT INT, @CISTDT INT, @CICLAS NVARCHAR(1), @CISCLS NVARCHAR(1), @CILOCT NVARCHAR(3))
RETURNS NUMERIC(5,4)
	
AS
BEGIN

	DECLARE @RetVal NUMERIC(5,4)

	SELECT TOP 1
		@RetVal=CATXPC
	FROM
		SUNSAIL_ST_CAMST
	WHERE
		CALOCT=@CILOCT
		AND
		CACLAS=@CICLAS
		AND
		CASCLS=@CISCLS
		AND
		CASTDT<=@CIETDT
		AND
		CAEFDT<=@CISTDT
	ORDER BY
		CASTDT DESC,
		CAEFDT DESC

	RETURN (ISNULL(@RetVal,0))

END


GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetSunsailTipPC]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE FUNCTION [dbo].[fn_GetSunsailTipPC] (@CIETDT INT, @CISTDT INT, @CICLAS NVARCHAR(1), @CISCLS NVARCHAR(1), @CILOCT NVARCHAR(3))
RETURNS NUMERIC(5,4)
	
AS
BEGIN

	DECLARE @RetVal NUMERIC(5,4)

	SELECT TOP 1
		@RetVal=CATPPC
	FROM
		SUNSAIL_ST_CAMST
	WHERE
		CALOCT=@CILOCT
		AND
		CACLAS=@CICLAS
		AND
		CASCLS=@CISCLS
		AND
		CASTDT<=@CIETDT
		AND
		CAEFDT<=@CISTDT
	ORDER BY
		CASTDT DESC,
		CAEFDT DESC

	RETURN (ISNULL(@RetVal,0))

END



GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetTritonTaxPC]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [dbo].[fn_GetTritonTaxPC] (@CIETDT INT, @CISTDT INT, @CICLAS NVARCHAR(1), @CISCLS NVARCHAR(1), @CILOCT NVARCHAR(3))
RETURNS NUMERIC(5,4)
	
AS
BEGIN

	DECLARE @RetVal NUMERIC(5,4)

	SELECT TOP 1
		@RetVal=CATXPC
	FROM
		TRITON_ST_CAMST
	WHERE
		CALOCT=@CILOCT
		AND
		CACLAS=@CICLAS
		AND
		CASCLS=@CISCLS
		AND
		CASTDT<=@CIETDT
		AND
		CAEFDT<=@CISTDT
	ORDER BY
		CASTDT DESC,
		CAEFDT DESC

	RETURN (ISNULL(@RetVal,0))

END

GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetTritonTipPC]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE FUNCTION [dbo].[fn_GetTritonTipPC] (@CIETDT INT, @CISTDT INT, @CICLAS NVARCHAR(1), @CISCLS NVARCHAR(1), @CILOCT NVARCHAR(3))
RETURNS NUMERIC(5,4)
	
AS
BEGIN

	DECLARE @RetVal NUMERIC(5,4)

	SELECT TOP 1
		@RetVal=CATPPC
	FROM
		TRITON_ST_CAMST
	WHERE
		CALOCT=@CILOCT
		AND
		CACLAS=@CICLAS
		AND
		CASCLS=@CISCLS
		AND
		CASTDT<=@CIETDT
		AND
		CAEFDT<=@CISTDT
	ORDER BY
		CASTDT DESC,
		CAEFDT DESC

	RETURN (ISNULL(@RetVal,0))

END


GO
/****** Object:  UserDefinedFunction [dbo].[fn_SunsailRates]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE FUNCTION [dbo].[fn_SunsailRates] (@Loc nvarchar(3),@BoatType nvarchar(5), @Crewed  nvarchar(1), @EffStartDate int, @StartDate int, @Currency Nvarchar(3))
RETURNS int
AS
BEGIN
	DECLARE @Rates as numeric(9,4)
   
	RETURN ( SELECT TOP 1 FRFRAT
	FROM
		SUNSAIL_ST_FRMST
	WHERE 
		FRLOCT  = @Loc
		AND
		FRYCTY  = @BoatType
		AND
		FRCREW  = @Crewed
		AND
		FRDESG = @Currency
		AND
		FRSTDT<=@StartDate
		AND
		FREFDT<= @EffStartDate
	ORDER BY
		FRSTDT DESC,
		FREFDT DESC
	)
END	

/*
SELECT TRITON_Stage.dbo.fn_SunsailRates('GB6','44S3K','N',20141222,20150830,'USD')
*/

	
GO
/****** Object:  UserDefinedFunction [dbo].[fn_TritonRates]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE FUNCTION [dbo].[fn_TritonRates] (@Loc nvarchar(3),@BoatType nvarchar(5), @Crewed  nvarchar(1), @EffStartDate int, @StartDate int, @Currency Nvarchar(3))
RETURNS int
AS
BEGIN
	DECLARE @Rates as numeric(9,4)
   
	RETURN ( SELECT TOP 1 FRFRAT
	FROM
		TRITON_ST_FRMST
	WHERE 
		FRLOCT  = @Loc
		AND
		FRYCTY  = @BoatType
		AND
		FRCREW  = @Crewed
		AND
		FRDESG = @Currency
		AND
		FRSTDT<=@StartDate
		AND
		FREFDT<= @EffStartDate
	ORDER BY
		FRSTDT DESC,
		FREFDT DESC
	)
END	

/*
SELECT TRITON_Stage.dbo.fn_TritonRates('GB6','44S3K','N',20141222,20150830,'USD')
*/

	
GO
/****** Object:  Table [dbo].[CONF_DT_CALENDAR]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CONF_DT_CALENDAR](
	[i_SK_Calendar] [bigint] NOT NULL,
	[i_SK_YearMonth] [int] NULL,
	[i_SK_YearWeek] [int] NULL,
	[i_BK_DaysFrom1900] [int] NULL,
	[a_TUIAcctYear] [int] NULL,
	[a_Year] [int] NULL,
	[a_CalMonth] [int] NULL,
	[a_AcctMonthNo] [int] NULL,
	[a_TUIAcctMonthNo] [int] NULL,
	[a_CalMonthName] [nvarchar](30) NULL,
	[a_AcctMonthName] [nvarchar](12) NULL,
	[a_TUIAcctMonthName] [nvarchar](12) NULL,
	[a_WeekOfYear] [int] NULL,
	[a_DayOfMonth] [int] NULL,
	[a_DayOfWeek] [int] NULL,
	[a_DayName] [nvarchar](30) NULL,
	[a_Date] [smalldatetime] NULL,
	[a_Yesterday] [smalldatetime] NULL,
	[a_1WeekAgo] [smalldatetime] NULL,
	[a_4WeeksAgo] [smalldatetime] NULL,
	[a_SaturdayOfThisWeek] [smalldatetime] NULL,
	[a_SundayOfThisWeek] [smalldatetime] NULL,
	[a_MondayOfThisWeek] [smalldatetime] NULL,
	[a_SundayOfNextWeek] [smalldatetime] NULL,
	[a_MondayOfNextWeek] [smalldatetime] NULL,
	[a_SundayOfLastWeek] [smalldatetime] NULL,
	[a_MondayOfLastWeek] [smalldatetime] NULL,
	[a_FirstDayOfThisMonth] [smalldatetime] NULL,
	[a_LastDayOfThisMonth] [smalldatetime] NULL,
	[a_FirstDayOfLastMonth] [smalldatetime] NULL,
	[a_LastDayOfLastMonth] [smalldatetime] NULL,
	[a_FirstDayOfNextMonth] [smalldatetime] NULL,
	[a_LastDayOfNextMonth] [smalldatetime] NULL,
	[a_TodayNextYear] [smalldatetime] NULL,
	[a_TodayLastYear] [smalldatetime] NULL,
	[a_YesterdayLY] [smalldatetime] NULL,
	[a_1WeekAgoLY] [smalldatetime] NULL,
	[a_4WeeksAgoLY] [smalldatetime] NULL,
	[a_SundayOfThisWeekLY] [smalldatetime] NULL,
	[a_MondayOfThisWeekLY] [smalldatetime] NULL,
	[a_FirstDayOfThisMonthLY] [smalldatetime] NULL,
	[a_LastDayOfThisMonthLY] [smalldatetime] NULL,
	[a_SundayOfNextWeekLY] [smalldatetime] NULL,
	[a_MondayOfNextWeekLY] [smalldatetime] NULL,
	[a_SundayOfLastWeekLY] [smalldatetime] NULL,
	[a_MondayOfLastWeekLY] [smalldatetime] NULL,
	[a_FirstDayOfLastMonthLY] [smalldatetime] NULL,
	[a_LastDayOfLastMonthLY] [smalldatetime] NULL,
	[a_FirstDayOfNextMonthLY] [smalldatetime] NULL,
	[a_LastDayOfNextMonthLY] [smalldatetime] NULL,
	[a_SeasonCodeLastYear] [nvarchar](4) NULL,
	[a_SeasonLastYear] [nvarchar](20) NULL,
	[a_SeasonCodeNextYear] [nvarchar](4) NULL,
	[a_SeasonNextYear] [nvarchar](20) NULL,
	[a_SeasonTwoYearsAgoCode] [nvarchar](3) NULL,
	[a_SeasonTwoYearsAgo] [nvarchar](20) NULL,
	[a_SeasonInTwoYearsCode] [nvarchar](3) NULL,
	[a_SeasonInTwoYears] [nvarchar](20) NULL,
	[a_SeasonOrder] [int] NULL,
	[a_SeasonDesc] [nvarchar](20) NULL,
	[a_SeasonCode] [nvarchar](4) NULL,
	[a_WeekStartThisYear] [smalldatetime] NULL,
	[a_WeekEndThisYear] [smalldatetime] NULL,
	[a_WeekStartNextYear] [smalldatetime] NULL,
	[a_WeekEndNextYear] [smalldatetime] NULL,
	[a_WeekStartLastYear] [smalldatetime] NULL,
	[a_WeekEndLastYear] [smalldatetime] NULL,
	[a_WeekNoOctoberStart] [int] NULL,
	[a_WeekNoNovemberStart] [int] NULL,
	[a_SapphireWeekNo] [int] NULL,
	[a_SeasonPeriodCode] [nvarchar](10) NULL,
	[a_SeasonPeriod] [varchar](50) NULL,
	[a_SeasonPeriodPriority] [int] NULL,
	[a_MondayLastWeekNextYear] [smalldatetime] NULL,
	[a_SundayLastWeekNextYear] [smalldatetime] NULL,
	[a_4WeeksStart] [smalldatetime] NULL,
	[a_4WeeksEnd] [smalldatetime] NULL,
	[a_4WeeksStartLastYear] [smalldatetime] NULL,
	[a_4WeeksEndLastYear] [smalldatetime] NULL,
	[a_4WeeksStartNextYear] [smalldatetime] NULL,
	[a_4WeeksEndNextYear] [smalldatetime] NULL,
	[a_8WeeksStart] [smalldatetime] NULL,
	[a_8WeeksEnd] [smalldatetime] NULL,
	[a_8WeeksStartLastYear] [smalldatetime] NULL,
	[a_8WeeksEndLastYear] [smalldatetime] NULL,
	[a_8WeeksStartNextYear] [smalldatetime] NULL,
	[a_8WeeksEndNextYear] [smalldatetime] NULL,
	[a_12WeeksStart] [smalldatetime] NULL,
	[a_12WeeksEnd] [smalldatetime] NULL,
	[a_12WeeksStartLastYear] [smalldatetime] NULL,
	[a_12WeeksEndLastYear] [smalldatetime] NULL,
	[a_12WeeksStartNextYear] [smalldatetime] NULL,
	[a_12WeeksEndNextYear] [smalldatetime] NULL,
	[a_AcctYear] [varchar](7) NULL,
	[a_AcctYearStartDate] [smalldatetime] NULL,
	[a_AcctYearEndDate] [smalldatetime] NULL,
	[a_AcctNextYear] [varchar](7) NULL,
	[a_AcctNextYearStartDate] [smalldatetime] NULL,
	[a_AcctNextYearEndDate] [smalldatetime] NULL,
	[a_DaysInMonth] [int] NULL,
	[a_ShortMonthYear] [varchar](10) NULL,
	[a_ShortMonthNextYear] [varchar](10) NULL,
	[a_ShortQuarter] [varchar](4) NULL,
	[a_LongQuarter] [varchar](10) NULL,
	[a_ShortQuarterYear] [varchar](12) NULL,
	[a_LongQuarterYear] [varchar](18) NULL,
	[a_ShortQuarterNextYear] [varchar](4) NULL,
	[a_LongQuarterNextYear] [varchar](10) NULL,
	[a_ShortQuarterYearNextYear] [varchar](12) NULL,
	[a_LongQuarterYearNextYear] [varchar](18) NULL,
	[a_US_TimeDiff] [smallint] NULL,
	[a_France_TimeDiff] [smallint] NULL,
	[a_Australia_TimeDiff] [smallint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CONF_DT_MARINE_CONSULTANT]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CONF_DT_MARINE_CONSULTANT](
	[i_SK_Consultant] [int] NOT NULL,
	[i_BK_Consultant] [varchar](25) NULL,
	[a_ConsultantID] [varchar](25) NULL,
	[a_ConsultantName] [varchar](50) NULL,
	[a_SeasonCode] [varchar](50) NULL,
	[a_SourceSysID] [int] NULL,
	[a_TeamCode] [varchar](12) NULL,
	[a_TeamName] [varchar](50) NULL,
	[a_TritonSource] [nvarchar](10) NULL,
	[a_Telephone] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MOORINGS_LOGTABLE]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MOORINGS_LOGTABLE](
	[LogName] [nvarchar](50) NULL,
	[LogDate] [smalldatetime] NULL,
	[LogText] [nvarchar](250) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ST_BOAT_CABIN]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ST_BOAT_CABIN](
	[i_SK_BoatCabinID] [nvarchar](50) NOT NULL,
	[a_CABIN_FLNUMB] [nvarchar](50) NULL,
	[a_CABIN_FLNAME] [nvarchar](50) NULL,
	[a_BOAT_FLNUMB] [nvarchar](50) NULL,
	[a_BOAT_FLNAME] [nvarchar](50) NULL,
	[a_SourceSysID] [int] NULL,
	[a_BOATSOURCE] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ST_BOATCABIN_TYPE]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ST_BOATCABIN_TYPE](
	[i_SK_InventoryDate] [bigint] NULL,
	[a_CABIN_FLNUMB] [nvarchar](50) NULL,
	[a_BOAT_FLNUMB] [nvarchar](50) NULL,
	[a_BoatType] [nvarchar](50) NULL,
	[i_BK_SourceSysID] [int] NULL,
	[i_BK_SourceSys] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ST_MARINE_AVAILABLEPORTS]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ST_MARINE_AVAILABLEPORTS](
	[ArrDate] [int] NULL,
	[ArrAirport] [nvarchar](9) NULL,
	[a_BaseCode] [nvarchar](3) NULL,
	[NoDays] [int] NULL,
	[SourceSysID] [int] NULL,
	[BrandCode] [nvarchar](3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ST_MARINE_AVAILPERWEEK]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ST_MARINE_AVAILPERWEEK](
	[i_BK_FLNUMB] [nvarchar](50) NULL,
	[i_BK_FLTY] [nvarchar](50) NULL,
	[ArrDate] [int] NULL,
	[ArrAirport] [nvarchar](9) NULL,
	[i_BK_LOCT] [nvarchar](3) NULL,
	[NoDays] [int] NULL,
	[SourceSysID] [int] NULL,
	[BrandCode] [nvarchar](3) NULL,
	[Available] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ST_MARINE_BEDSTOSEATS]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ST_MARINE_BEDSTOSEATS](
	[i_BK_FLNUMB] [nvarchar](50) NULL,
	[i_BK_FLTY] [nvarchar](50) NULL,
	[ArrDate] [int] NULL,
	[ArrAirport] [nvarchar](9) NULL,
	[i_BK_LOCT] [nvarchar](3) NULL,
	[NoDays] [int] NULL,
	[SourceSysID] [int] NULL,
	[BrandCode] [nvarchar](3) NULL,
	[Sold] [int] NULL,
	[Available] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ST_MARINE_BOATAVAILABILITY]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ST_MARINE_BOATAVAILABILITY](
	[i_BK_FLNUMB] [nvarchar](50) NULL,
	[i_BK_FLTY] [nvarchar](50) NULL,
	[i_BK_LOCT] [nvarchar](3) NULL,
	[i_SK_FirstContiguousInventoryDate] [int] NULL,
	[i_SK_LastContiguousInventoryDate] [int] NULL,
	[SourceSysID] [int] NULL,
	[BrandCode] [nvarchar](3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ST_MARINE_BOOKINGITEMS]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ST_MARINE_BOOKINGITEMS](
	[i_SK_Calendar] [bigint] NOT NULL,
	[i_SK_Bkg] [bigint] NOT NULL,
	[Status] [int] NOT NULL,
	[SourceSysID] [int] NULL,
	[BrandCode] [nvarchar](3) NULL,
	[CompanyNo] [nvarchar](25) NULL,
	[BoatFlag] [nvarchar](1) NULL,
	[FlightFlag] [nvarchar](1) NULL,
	[AccomFlag] [nvarchar](1) NULL,
	[TransferFlag] [nvarchar](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ST_MARINE_BROCHUREREQUESTS]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ST_MARINE_BROCHUREREQUESTS](
	[i_SK_BrochureRequests] [bigint] IDENTITY(1,1) NOT NULL,
	[SourceSysID] [int] NULL,
	[BrandCode] [varchar](3) NULL,
	[BrochureType] [nvarchar](20) NULL,
	[Client] [nvarchar](13) NULL,
	[RequestDate] [smalldatetime] NULL,
	[QtyRequested] [int] NULL,
	[BrochureCode] [nvarchar](10) NULL,
	[PrintDate] [smalldatetime] NULL,
	[Printed] [varchar](1) NULL,
	[LastCallDate] [smalldatetime] NULL,
	[NextCallDate] [smalldatetime] NULL,
	[AreaOfInterest] [nvarchar](6) NULL,
	[SeasonOfInterest] [nvarchar](6) NULL,
	[LostSaleDate] [smalldatetime] NULL,
	[LostSaleCode] [nvarchar](2) NULL,
	[BookingLocation] [nvarchar](3) NULL,
	[Primary] [varchar](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ST_MARINE_FBKG]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ST_MARINE_FBKG](
	[i_SK_Bkg] [bigint] NOT NULL,
	[SourceSysID] [int] NULL,
	[SystemName] [nvarchar](20) NULL,
	[DivisionCode] [nvarchar](1) NULL,
	[BrandCode] [nvarchar](3) NULL,
	[ProductCode] [nvarchar](25) NULL,
	[BookingType] [nvarchar](25) NULL,
	[CompanyNo] [nvarchar](25) NULL,
	[SeasonCode] [nvarchar](3) NULL,
	[BookingStatusID] [int] NULL,
	[BkgRef] [nvarchar](6) NULL,
	[ClientNo] [nvarchar](6) NULL,
	[DestResortCd] [nvarchar](25) NULL,
	[BKgLocation] [nvarchar](25) NULL,
	[PaxNo] [int] NULL,
	[Boat] [nvarchar](50) NULL,
	[BoatType] [nvarchar](50) NULL,
	[CrewedFlag] [nvarchar](1) NULL,
	[BaseLocation] [nvarchar](3) NULL,
	[DestinationLocation] [nvarchar](3) NULL,
	[OptionDate] [smalldatetime] NULL,
	[OptionExpiryDate] [smalldatetime] NULL,
	[ConfirmDate] [smalldatetime] NULL,
	[ArrivalDate] [smalldatetime] NULL,
	[CancelDate] [smalldatetime] NULL,
	[StartDate] [smalldatetime] NULL,
	[EndDate] [smalldatetime] NULL,
	[DepartureDate] [smalldatetime] NULL,
	[LastAmendDate] [smalldatetime] NULL,
	[CharterDuration] [int] NULL,
	[HolidayDuration] [int] NULL,
	[BkgSrcCd] [nvarchar](12) NULL,
	[BkgSrcDesc] [nvarchar](20) NULL,
	[AgentContact] [nvarchar](50) NULL,
	[DirectAgentFlg] [nvarchar](1) NULL,
	[DirectAgent] [nvarchar](10) NULL,
	[ContractType] [nvarchar](1) NULL,
	[LeadPaxSurname] [nvarchar](64) NULL,
	[LeadPaxForename] [nvarchar](50) NULL,
	[LeadPaxTitle] [nvarchar](12) NULL,
	[LeadPaxInitials] [nvarchar](4) NULL,
	[LeadPaxFullName] [nvarchar](150) NULL,
	[Address1] [nvarchar](255) NULL,
	[Address2] [nvarchar](255) NULL,
	[Address3] [nvarchar](255) NULL,
	[Town] [nvarchar](255) NULL,
	[County] [nvarchar](255) NULL,
	[PostCode] [nvarchar](80) NULL,
	[Country] [nvarchar](50) NULL,
	[TelephoneNo] [nvarchar](75) NULL,
	[TelephoneNo2] [nvarchar](75) NULL,
	[TelephoneNo3] [nvarchar](75) NULL,
	[Email] [nvarchar](100) NULL,
	[PaxTitleSecond] [nvarchar](12) NULL,
	[PaxForenameSecond] [nvarchar](50) NULL,
	[PaxSurnameSecond] [nvarchar](64) NULL,
	[Notes] [nvarchar](200) NULL,
	[Comment] [nvarchar](200) NULL,
	[FlightListLong] [varchar](8000) NULL,
	[Currency] [nvarchar](10) NULL,
	[BookedUser] [nvarchar](100) NULL,
	[LastAmendUser] [nvarchar](100) NULL,
	[ContractUser] [nvarchar](100) NULL,
	[CAA_BondingType] [nvarchar](20) NULL,
	[WaitListFlag] [nvarchar](1) NULL,
	[BookingChannel] [nvarchar](50) NULL,
	[ExpandedBookingChannel] [nvarchar](50) NULL,
	[WebBkgRef] [nvarchar](6) NULL,
	[WebBookedUser] [nvarchar](100) NULL,
	[InhibitProcessFlag] [nvarchar](1) NULL,
	[GroupCode] [nvarchar](10) NULL,
	[BookingCode] [nvarchar](3) NULL,
	[BookedWithMIT] [nvarchar](1) NULL,
	[i_sk_base_from] [int] NULL,
	[i_sk_base_to] [int] NULL,
 CONSTRAINT [ST_MARINE_FBKG_PK] PRIMARY KEY CLUSTERED 
(
	[i_SK_Bkg] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ST_MARINE_FBKG_INTRADAY]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ST_MARINE_FBKG_INTRADAY](
	[i_SK_Bkg] [bigint] NOT NULL,
	[SourceSysID] [int] NULL,
	[SystemName] [nvarchar](20) NULL,
	[DivisionCode] [nvarchar](1) NULL,
	[BrandCode] [nvarchar](3) NULL,
	[ProductCode] [nvarchar](25) NULL,
	[BookingType] [nvarchar](25) NULL,
	[CompanyNo] [nvarchar](25) NULL,
	[SeasonCode] [nvarchar](3) NULL,
	[BookingStatusID] [int] NULL,
	[BkgRef] [nvarchar](6) NULL,
	[ClientNo] [nvarchar](6) NULL,
	[DestResortCd] [nvarchar](25) NULL,
	[BKgLocation] [nvarchar](25) NULL,
	[PaxNo] [int] NULL,
	[Boat] [nvarchar](50) NULL,
	[BoatType] [nvarchar](50) NULL,
	[BaseLocation] [nvarchar](3) NULL,
	[OptionDate] [smalldatetime] NULL,
	[OptionExpiryDate] [smalldatetime] NULL,
	[ConfirmDate] [smalldatetime] NULL,
	[ArrivalDate] [smalldatetime] NULL,
	[CancelDate] [smalldatetime] NULL,
	[StartDate] [smalldatetime] NULL,
	[EndDate] [smalldatetime] NULL,
	[DepartureDate] [smalldatetime] NULL,
	[LastAmendDate] [smalldatetime] NULL,
	[CharterDuration] [int] NULL,
	[HolidayDuration] [int] NULL,
	[BkgSrcCd] [nvarchar](12) NULL,
	[BkgSrcDesc] [nvarchar](20) NULL,
	[AgentContact] [nvarchar](50) NULL,
	[DirectAgentFlg] [nvarchar](1) NULL,
	[DirectAgent] [nvarchar](10) NULL,
	[ContractType] [nvarchar](1) NULL,
	[LeadPaxSurname] [nvarchar](64) NULL,
	[LeadPaxForename] [nvarchar](50) NULL,
	[LeadPaxTitle] [nvarchar](12) NULL,
	[LeadPaxInitials] [nvarchar](4) NULL,
	[LeadPaxFullName] [nvarchar](150) NULL,
	[Address1] [nvarchar](255) NULL,
	[Address2] [nvarchar](255) NULL,
	[Address3] [nvarchar](255) NULL,
	[Town] [nvarchar](255) NULL,
	[County] [nvarchar](255) NULL,
	[PostCode] [nvarchar](80) NULL,
	[Country] [nvarchar](50) NULL,
	[TelephoneNo] [nvarchar](75) NULL,
	[TelephoneNo2] [nvarchar](75) NULL,
	[TelephoneNo3] [nvarchar](75) NULL,
	[Email] [nvarchar](100) NULL,
	[PaxTitleSecond] [nvarchar](12) NULL,
	[PaxForenameSecond] [nvarchar](50) NULL,
	[PaxSurnameSecond] [nvarchar](64) NULL,
	[Notes] [nvarchar](200) NULL,
	[Comment] [nvarchar](200) NULL,
	[FlightListLong] [varchar](8000) NULL,
	[Currency] [nvarchar](10) NULL,
	[BookedUser] [nvarchar](100) NULL,
	[LastAmendUser] [nvarchar](100) NULL,
	[ContractUser] [nvarchar](100) NULL,
	[CAA_BondingType] [nvarchar](20) NULL,
	[WaitListFlag] [nvarchar](1) NULL,
	[BookingChannel] [nvarchar](50) NULL,
	[ExpandedBookingChannel] [nvarchar](50) NULL,
 CONSTRAINT [ST_MARINE_FBKG_INRADAY_PK] PRIMARY KEY CLUSTERED 
(
	[i_SK_Bkg] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ST_MARINE_FITN]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ST_MARINE_FITN](
	[i_SK_Bkg] [bigint] NOT NULL,
	[ItineraryLineType] [nvarchar](3) NULL,
	[SourceSysID] [int] NULL,
	[SystemName] [nvarchar](20) NULL,
	[DivisionCode] [nvarchar](1) NULL,
	[BrandCode] [nvarchar](3) NULL,
	[ProductCode] [nvarchar](25) NULL,
	[BookingType] [nvarchar](25) NULL,
	[CompanyNo] [nvarchar](25) NULL,
	[BkgRef] [nvarchar](6) NULL,
	[ItinRef] [int] NOT NULL,
	[Status] [int] NULL,
	[Qty] [int] NULL,
	[NoPax] [int] NULL,
	[ContractSvsStartDate] [int] NULL,
	[ContractSvsEndDate] [int] NULL,
	[EntryDate] [int] NULL,
	[SvsLastAmendDate] [int] NULL,
	[ContractDuration] [int] NULL,
	[ItemStartDate] [int] NULL,
	[ItemEndDate] [int] NULL,
	[ItemDuration] [int] NULL,
	[ItemPerPerson] [int] NULL,
	[ItemPerDuration] [int] NULL,
	[ItemAmountLocal] [numeric](9, 2) NULL,
	[TotalAmountLocal] [numeric](15, 2) NULL,
	[TotalAmountLocalForCancel] [numeric](15, 2) NULL,
	[Discount] [numeric](9, 2) NULL,
	[DiscountLocal] [numeric](9, 2) NULL,
	[VatLocal] [numeric](9, 2) NULL,
	[TApercent] [numeric](9, 2) NULL,
	[CommissionLocal] [numeric](9, 2) NULL,
	[TaxLocal] [numeric](9, 4) NULL,
	[TipLocal] [numeric](9, 4) NULL,
	[TotalAmountTaxTipsLocal] [numeric](15, 4) NULL,
	[LastAmendUser] [nvarchar](50) NULL,
	[BaseLocation] [nvarchar](10) NULL,
	[Currency] [nvarchar](10) NULL,
	[ExtraCode] [nvarchar](50) NULL,
	[ExtraCodeDesc] [nvarchar](50) NULL,
	[ItemDesc] [nvarchar](50) NULL,
	[RevenueTypeCode] [nvarchar](50) NULL,
	[RevenueType] [nvarchar](50) NULL,
	[RevenueSubTypeCode] [nvarchar](50) NULL,
	[RevenueSubType] [nvarchar](50) NULL,
	[ClassCode] [nvarchar](50) NULL,
	[Class] [nvarchar](50) NULL,
	[SubClassCode] [nvarchar](50) NULL,
	[SubClass] [nvarchar](50) NULL,
	[OriginalClassCode] [nvarchar](50) NULL,
	[OriginalClass] [nvarchar](50) NULL,
	[ExtraNotes] [nvarchar](1000) NULL,
	[DepartAirport] [nvarchar](9) NULL,
	[ArrivalAirport] [nvarchar](3) NULL,
	[GLCompany] [int] NULL,
	[GLDepartment] [int] NULL,
	[GLAccount] [nvarchar](15) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ST_MARINE_FITN_INTRADAY]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ST_MARINE_FITN_INTRADAY](
	[i_SK_Bkg] [bigint] NOT NULL,
	[ItineraryLineType] [nvarchar](3) NULL,
	[SourceSysID] [int] NULL,
	[SystemName] [nvarchar](20) NULL,
	[DivisionCode] [nvarchar](1) NULL,
	[BrandCode] [nvarchar](3) NULL,
	[ProductCode] [nvarchar](25) NULL,
	[BookingType] [nvarchar](25) NULL,
	[CompanyNo] [nvarchar](25) NULL,
	[BkgRef] [nvarchar](6) NULL,
	[ItinRef] [int] NOT NULL,
	[Status] [int] NULL,
	[Qty] [int] NULL,
	[NoPax] [int] NULL,
	[ContractSvsStartDate] [int] NULL,
	[ContractSvsEndDate] [int] NULL,
	[EntryDate] [int] NULL,
	[SvsLastAmendDate] [int] NULL,
	[ContractDuration] [int] NULL,
	[ItemStartDate] [int] NULL,
	[ItemEndDate] [int] NULL,
	[ItemDuration] [int] NULL,
	[ItemPerPerson] [int] NULL,
	[ItemPerDuration] [int] NULL,
	[ItemAmountLocal] [numeric](9, 2) NULL,
	[TotalAmountLocal] [numeric](15, 2) NULL,
	[TotalAmountLocalForCancel] [numeric](15, 2) NULL,
	[Discount] [numeric](9, 2) NULL,
	[DiscountLocal] [numeric](9, 2) NULL,
	[VatLocal] [numeric](9, 2) NULL,
	[TApercent] [numeric](9, 2) NULL,
	[CommissionLocal] [numeric](9, 2) NULL,
	[TaxLocal] [numeric](9, 4) NULL,
	[TipLocal] [numeric](9, 4) NULL,
	[TotalAmountTaxTipsLocal] [numeric](15, 4) NULL,
	[LastAmendUser] [nvarchar](50) NULL,
	[BaseLocation] [nvarchar](10) NULL,
	[Currency] [nvarchar](10) NULL,
	[ExtraCode] [nvarchar](50) NULL,
	[ExtraCodeDesc] [nvarchar](50) NULL,
	[ItemDesc] [nvarchar](50) NULL,
	[RevenueTypeCode] [nvarchar](50) NULL,
	[RevenueType] [nvarchar](50) NULL,
	[RevenueSubTypeCode] [nvarchar](50) NULL,
	[RevenueSubType] [nvarchar](50) NULL,
	[ClassCode] [nvarchar](50) NULL,
	[Class] [nvarchar](50) NULL,
	[SubClassCode] [nvarchar](50) NULL,
	[SubClass] [nvarchar](50) NULL,
	[OriginalClassCode] [nvarchar](50) NULL,
	[OriginalClass] [nvarchar](50) NULL,
	[ExtraNotes] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ST_MARINE_FLIGHTINVENTORY]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ST_MARINE_FLIGHTINVENTORY](
	[i_SK_FltInv] [nvarchar](12) NOT NULL,
	[FlightNumber] [int] NULL,
	[SourceSysID] [int] NULL,
	[BrandCode] [nvarchar](3) NULL,
	[i_SK_Bkg] [bigint] NULL,
	[BkgRef] [nvarchar](6) NULL,
	[i_SK_Pax] [bigint] NULL,
	[OptionDate] [smalldatetime] NULL,
	[ConfirmDate] [smalldatetime] NULL,
	[NoDays] [int] NULL,
	[FltType] [nvarchar](10) NULL,
	[FlightRef] [nvarchar](20) NULL,
	[FlightCd] [nvarchar](30) NULL,
	[Carrier] [nvarchar](6) NULL,
	[Locator] [nvarchar](50) NULL,
	[InOutFlag] [nvarchar](15) NULL,
	[SeatPrice] [numeric](16, 2) NULL,
	[ChildSeatPrice] [numeric](16, 2) NULL,
	[DepAirport] [nvarchar](9) NULL,
	[DepDate] [int] NULL,
	[DepTime] [int] NULL,
	[ArrAirport] [nvarchar](9) NULL,
	[ArrDate] [int] NULL,
	[ArrTime] [int] NULL,
	[DepNo] [int] NULL,
	[Origin] [nvarchar](6) NULL,
	[SUMTotalSeats] [int] NULL,
	[SUMOptionSeats] [int] NULL,
	[SUMConfirmSeats] [int] NULL,
	[SUMWaitSeats] [int] NULL,
	[SUMFreeSeats] [int] NULL,
	[TotalSeats] [int] NULL,
	[OptionSeats] [int] NULL,
	[ConfirmSeats] [int] NULL,
	[WaitSeats] [int] NULL,
	[FreeSeats] [int] NULL,
	[BB_TotalSeats] [int] NULL,
	[BB_OptionSeats] [int] NULL,
	[BB_ConfirmSeats] [int] NULL,
	[BB_WaitSeats] [int] NULL,
	[BB_FreeSeats] [int] NULL,
	[FO_TotalSeats] [int] NULL,
	[FO_OptionSeats] [int] NULL,
	[FO_ConfirmSeats] [int] NULL,
	[FO_WaitSeats] [int] NULL,
	[FO_FreeSeats] [int] NULL,
	[FL_TotalSeats] [int] NULL,
	[FL_OptionSeats] [int] NULL,
	[FL_ConfirmSeats] [int] NULL,
	[FL_WaitSeats] [int] NULL,
	[FL_FreeSeats] [int] NULL,
	[CL_TotalSeats] [int] NULL,
	[CL_OptionSeats] [int] NULL,
	[CL_ConfirmSeats] [int] NULL,
	[CL_WaitSeats] [int] NULL,
	[CL_FreeSeats] [int] NULL,
	[FOTotalSeats] [int] NULL,
	[FOOptionSeats] [int] NULL,
	[FOConfirmSeats] [int] NULL,
	[FOWaitSeats] [int] NULL,
	[FOFreeSeats] [int] NULL,
	[Ticket] [nvarchar](1) NULL,
	[Manifest] [nvarchar](6) NULL,
	[Baggage] [nvarchar](10) NULL,
	[CheckInTime] [int] NULL,
	[CheckInTerminal] [nvarchar](50) NULL,
	[FlightRoute] [nvarchar](9) NULL,
	[Max7Day] [int] NULL,
	[7DayRemain] [int] NULL,
	[7DayStop] [nvarchar](13) NULL,
	[FO_Max7Day] [int] NULL,
	[FO_7DayRemain] [int] NULL,
	[FO_7DayStop] [nvarchar](6) NULL,
	[Colors] [int] NULL,
	[Class] [nvarchar](1) NULL,
	[InternetUse] [nvarchar](1) NULL,
	[InUse] [nvarchar](16) NULL,
	[LastAlloc] [int] NULL,
	[TotalOnFlight] [int] NULL,
	[OptionOnFlight] [int] NULL,
	[ConfirmOnFlight] [int] NULL,
	[WaitOnFlight] [int] NULL,
	[FreeOnFlight] [int] NULL,
	[HasAlternative] [nvarchar](1) NULL,
	[OnRequest] [nvarchar](15) NULL,
	[Cost] [numeric](16, 2) NULL,
	[Cost2] [numeric](16, 2) NULL,
	[ChildCost] [numeric](16, 2) NULL,
	[ChildCost2] [numeric](16, 2) NULL,
	[UserID] [nvarchar](10) NULL,
	[SourceOffice] [nvarchar](3) NULL,
	[SalesPlatform] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ST_MARINE_FLIGHTINVENTORY_ALL]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ST_MARINE_FLIGHTINVENTORY_ALL](
	[i_SK_FltInv] [nvarchar](12) NOT NULL,
	[FlightNumber] [int] NULL,
	[SourceSysID] [int] NULL,
	[BrandCode] [nvarchar](3) NULL,
	[i_SK_Bkg] [bigint] NULL,
	[BkgRef] [nvarchar](6) NULL,
	[i_SK_Pax] [bigint] NULL,
	[OptionDate] [smalldatetime] NULL,
	[ConfirmDate] [smalldatetime] NULL,
	[NoDays] [int] NULL,
	[FltType] [nvarchar](10) NULL,
	[FlightRef] [nvarchar](20) NULL,
	[FlightCd] [nvarchar](30) NULL,
	[Carrier] [nvarchar](6) NULL,
	[Locator] [nvarchar](50) NULL,
	[InOutFlag] [nvarchar](15) NULL,
	[SeatPrice] [numeric](16, 2) NULL,
	[ChildSeatPrice] [numeric](16, 2) NULL,
	[DepAirport] [nvarchar](9) NULL,
	[DepDate] [int] NULL,
	[DepTime] [int] NULL,
	[ArrAirport] [nvarchar](9) NULL,
	[ArrDate] [int] NULL,
	[ArrTime] [int] NULL,
	[DepNo] [int] NULL,
	[Origin] [nvarchar](6) NULL,
	[SUMTotalSeats] [int] NULL,
	[SUMOptionSeats] [int] NULL,
	[SUMConfirmSeats] [int] NULL,
	[SUMWaitSeats] [int] NULL,
	[SUMFreeSeats] [int] NULL,
	[TotalSeats] [int] NULL,
	[OptionSeats] [int] NULL,
	[ConfirmSeats] [int] NULL,
	[WaitSeats] [int] NULL,
	[FreeSeats] [int] NULL,
	[BB_TotalSeats] [int] NULL,
	[BB_OptionSeats] [int] NULL,
	[BB_ConfirmSeats] [int] NULL,
	[BB_WaitSeats] [int] NULL,
	[BB_FreeSeats] [int] NULL,
	[FO_TotalSeats] [int] NULL,
	[FO_OptionSeats] [int] NULL,
	[FO_ConfirmSeats] [int] NULL,
	[FO_WaitSeats] [int] NULL,
	[FO_FreeSeats] [int] NULL,
	[FL_TotalSeats] [int] NULL,
	[FL_OptionSeats] [int] NULL,
	[FL_ConfirmSeats] [int] NULL,
	[FL_WaitSeats] [int] NULL,
	[FL_FreeSeats] [int] NULL,
	[CL_TotalSeats] [int] NULL,
	[CL_OptionSeats] [int] NULL,
	[CL_ConfirmSeats] [int] NULL,
	[CL_WaitSeats] [int] NULL,
	[CL_FreeSeats] [int] NULL,
	[FOTotalSeats] [int] NULL,
	[FOOptionSeats] [int] NULL,
	[FOConfirmSeats] [int] NULL,
	[FOWaitSeats] [int] NULL,
	[FOFreeSeats] [int] NULL,
	[Ticket] [nvarchar](1) NULL,
	[Manifest] [nvarchar](6) NULL,
	[Baggage] [nvarchar](10) NULL,
	[CheckInTime] [int] NULL,
	[CheckInTerminal] [nvarchar](50) NULL,
	[FlightRoute] [nvarchar](9) NULL,
	[Max7Day] [int] NULL,
	[7DayRemain] [int] NULL,
	[7DayStop] [nvarchar](13) NULL,
	[FO_Max7Day] [int] NULL,
	[FO_7DayRemain] [int] NULL,
	[FO_7DayStop] [nvarchar](6) NULL,
	[Colors] [int] NULL,
	[Class] [nvarchar](1) NULL,
	[InternetUse] [nvarchar](1) NULL,
	[InUse] [nvarchar](16) NULL,
	[LastAlloc] [int] NULL,
	[TotalOnFlight] [int] NULL,
	[OptionOnFlight] [int] NULL,
	[ConfirmOnFlight] [int] NULL,
	[WaitOnFlight] [int] NULL,
	[FreeOnFlight] [int] NULL,
	[HasAlternative] [nvarchar](1) NULL,
	[OnRequest] [nvarchar](15) NULL,
	[Cost] [numeric](16, 2) NULL,
	[Cost2] [numeric](16, 2) NULL,
	[ChildCost] [numeric](16, 2) NULL,
	[ChildCost2] [numeric](16, 2) NULL,
	[UserID] [nvarchar](10) NULL,
	[FLBKNG] [nvarchar](3) NULL,
	[FLPLTFRM] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ST_MARINE_INSURANCE]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ST_MARINE_INSURANCE](
	[i_SK_Bkg] [bigint] NOT NULL,
	[i_SK_Pax] [bigint] NOT NULL,
	[SourceSysID] [int] NULL,
	[SystemName] [nvarchar](20) NULL,
	[DivisionCode] [nvarchar](1) NULL,
	[BrandCode] [nvarchar](3) NULL,
	[ProductCode] [nvarchar](25) NULL,
	[BookingType] [nvarchar](25) NULL,
	[CompanyNo] [nvarchar](25) NULL,
	[BkgRef] [nvarchar](6) NULL,
	[ItinRef] [int] NOT NULL,
	[Status] [int] NULL,
	[Qty] [int] NULL,
	[NoPax] [int] NULL,
	[ContractSvsStartDate] [int] NULL,
	[ContractSvsEndDate] [int] NULL,
	[EntryDate] [int] NULL,
	[SvsLastAmendDate] [int] NULL,
	[ContractDuration] [int] NULL,
	[ItemStartDate] [int] NULL,
	[ItemEndDate] [int] NULL,
	[ItemDuration] [int] NULL,
	[ItemPerPerson] [int] NULL,
	[ItemPerDuration] [int] NULL,
	[ItemAmountLocal] [numeric](9, 2) NULL,
	[TotalAmountLocal] [numeric](15, 2) NULL,
	[TotalAmountLocalForCancel] [numeric](15, 2) NULL,
	[LastAmendUser] [nvarchar](50) NULL,
	[BaseLocation] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ST_MARINE_PAX]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ST_MARINE_PAX](
	[i_SK_Pax] [bigint] NOT NULL,
	[i_BK_BkgConcat] [bigint] NOT NULL,
	[i_BK_PaxConcat] [bigint] NULL,
	[SourceSysID] [tinyint] NULL,
	[BrandCode] [nvarchar](3) NULL,
	[BkgRef] [nvarchar](10) NULL,
	[ClientNo] [nvarchar](25) NULL,
	[NoOfPax] [smallint] NULL,
	[PaxNo] [smallint] NULL,
	[PaxType] [varchar](3) NULL,
	[Surname] [nvarchar](40) NULL,
	[Title] [varchar](12) NULL,
	[Initials] [varchar](4) NULL,
	[Forename] [nvarchar](40) NULL,
	[MiddleName] [nvarchar](40) NULL,
	[Fullname] [nvarchar](100) NULL,
	[LeadNameFlag] [bit] NULL,
	[PaxSex] [varchar](1) NULL,
	[PaxAge] [varchar](3) NULL,
	[PaxDOB] [datetime] NULL,
	[PassportNumber] [nvarchar](40) NULL,
	[PassportExpiryDate] [datetime] NULL,
	[PassportIssuedCountry] [nvarchar](60) NULL,
	[Nationality] [nvarchar](20) NULL,
	[PlaceOfBirth] [nvarchar](60) NULL,
	[EmailAddress] [nvarchar](60) NULL,
	[SailExperience] [nvarchar](20) NULL,
	[SkipperCrewIndicator] [nvarchar](20) NULL,
	[InsurancePolicy] [nvarchar](50) NULL,
	[InsurancePolicyStartDate] [datetime] NULL,
	[InsurancePolicyEndDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ST_MARINE_PAXACC]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ST_MARINE_PAXACC](
	[i_SK_Bkg] [bigint] NOT NULL,
	[i_SK_Pax] [bigint] NULL,
	[SourceSysID] [int] NULL,
	[BrandCode] [nvarchar](3) NULL,
	[Qty] [nvarchar](50) NULL,
	[RoomType] [nvarchar](50) NULL,
	[HotelStartDate] [int] NULL,
	[HotelStartTime] [nvarchar](10) NULL,
	[HotelEndDate] [int] NULL,
	[HotelEndTime] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ST_MARINE_PAXBOAT]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ST_MARINE_PAXBOAT](
	[i_SK_Bkg] [bigint] NOT NULL,
	[i_SK_Pax] [bigint] NULL,
	[SourceSysID] [int] NULL,
	[BrandCode] [nvarchar](3) NULL,
	[Boat] [nvarchar](50) NULL,
	[BoatType] [nvarchar](50) NULL,
	[CharterStartDate] [datetime] NULL,
	[CharterStartTime] [nvarchar](10) NULL,
	[CharterEndDate] [datetime] NULL,
	[CharterEndTime] [nvarchar](10) NULL,
	[BaseLocation] [nvarchar](3) NULL,
	[DestinationLocation] [nvarchar](3) NULL,
	[BoatOwnerOwnBoat] [smallint] NULL,
	[EveningStart] [smallint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ST_MARINE_PAXFLIGHT]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ST_MARINE_PAXFLIGHT](
	[i_SK_Bkg] [bigint] NULL,
	[i_SK_Pax] [bigint] NOT NULL,
	[i_SK_Flt] [bigint] NULL,
	[FlightNumber] [bigint] NULL,
	[OutInFlag] [nvarchar](1) NULL,
	[SourceSysID] [int] NULL,
	[BrandCode] [nvarchar](3) NULL,
	[BkgRef] [nvarchar](10) NULL,
	[DepartAirport] [nvarchar](9) NULL,
	[ArrivalAirport] [nvarchar](9) NULL,
	[DepartDate] [int] NULL,
	[ArrivalDate] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ST_MARINE_PAYMENT]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ST_MARINE_PAYMENT](
	[i_SK_Bkg] [bigint] NOT NULL,
	[SourceSysID] [int] NULL,
	[SystemName] [nvarchar](20) NULL,
	[DivisionCode] [nvarchar](1) NULL,
	[BrandCode] [nvarchar](3) NULL,
	[ProductCode] [nvarchar](25) NULL,
	[CompanyNo] [nvarchar](25) NULL,
	[SeasonCode] [nvarchar](3) NULL,
	[BkgRef] [nvarchar](6) NULL,
	[EntryDate] [int] NULL,
	[EntryTime] [int] NULL,
	[StartDate] [smalldatetime] NULL,
	[BaseLocation] [nvarchar](20) NULL,
	[CashRecivedBase] [nvarchar](20) NULL,
	[User] [nvarchar](20) NULL,
	[BaseAmount] [numeric](11, 2) NULL,
	[ForeignAmount] [numeric](11, 2) NULL,
	[Currency] [nvarchar](20) NULL,
	[Source] [nvarchar](20) NULL,
	[Type] [nvarchar](4) NULL,
	[PaymentMethod] [nvarchar](25) NULL,
	[Reference] [nvarchar](20) NULL,
	[CreditCardType] [nvarchar](16) NULL,
	[CreditCardApproval] [nvarchar](11) NULL,
	[NoOfEntries] [int] NULL,
	[PaymentDesc] [nvarchar](40) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ST_MARINE_SOLDPERWEEK]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ST_MARINE_SOLDPERWEEK](
	[i_BK_FLNUMB] [nvarchar](50) NULL,
	[i_BK_FLTY] [nvarchar](50) NULL,
	[ArrDate] [int] NULL,
	[ArrAirport] [nvarchar](9) NULL,
	[i_BK_LOCT] [nvarchar](3) NULL,
	[NoDays] [int] NULL,
	[Sold] [int] NULL,
	[SourceSysID] [int] NULL,
	[BrandCode] [nvarchar](3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUNSAIL_LOGTABLE]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUNSAIL_LOGTABLE](
	[LogName] [nvarchar](50) NULL,
	[LogDate] [smalldatetime] NULL,
	[LogText] [nvarchar](250) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUNSAIL_SFT_RATES]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUNSAIL_SFT_RATES](
	[i_BK_LOCT] [nvarchar](3) NULL,
	[i_BK_FLTY] [nvarchar](5) NULL,
	[i_BK_CREW] [nvarchar](1) NULL,
	[i_SK_EffFrom] [bigint] NULL,
	[i_SK_EffTo] [bigint] NULL,
	[EffNum] [int] NULL,
	[i_SK_StartDate] [bigint] NULL,
	[i_SK_EndDate] [bigint] NULL,
	[a_Rate] [numeric](12, 4) NULL,
	[a_RatePerPerson] [numeric](12, 4) NULL,
	[a_Currency] [nvarchar](3) NULL,
	[i_BK_SourceSysID] [int] NULL,
	[i_BK_SourceSys] [nvarchar](10) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_CL_SUNSAIL_SFT_RATES]    Script Date: 24/08/2018 12:45:34 ******/
CREATE CLUSTERED INDEX [IX_CL_SUNSAIL_SFT_RATES] ON [dbo].[SUNSAIL_SFT_RATES]
(
	[i_BK_LOCT] ASC,
	[i_BK_FLTY] ASC,
	[a_Currency] ASC,
	[i_SK_EffFrom] ASC,
	[i_SK_StartDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUNSAIL_SFT_RATESSTAGE]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUNSAIL_SFT_RATESSTAGE](
	[i_BK_LOCT] [nvarchar](3) NULL,
	[i_BK_FLTY] [nvarchar](5) NULL,
	[a_Currency] [nvarchar](3) NULL,
	[i_BK_CREW] [nvarchar](1) NULL,
	[i_SK_EffFromFirst] [bigint] NULL,
	[EffNumFirst] [int] NULL,
	[i_SK_StartDateFirst] [bigint] NULL,
	[a_RateFirst] [numeric](9, 4) NULL,
	[a_RatePerPersonFirst] [numeric](9, 4) NULL,
	[i_SK_EffFromSecond] [bigint] NULL,
	[EffNumSecond] [int] NULL,
	[i_SK_StartDateSecond] [bigint] NULL,
	[i_SK_EndDateSecond] [bigint] NULL,
	[a_RateSecond] [numeric](9, 4) NULL,
	[a_RatePerPersonSecond] [numeric](9, 4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUNSAIL_ST_AMMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUNSAIL_ST_AMMST](
	[AMNUMB] [nvarchar](10) NULL,
	[AMRCNB] [int] NULL,
	[AMDATA] [nvarchar](80) NULL,
	[AMUSER] [nvarchar](15) NULL,
	[AMETDT] [int] NULL,
	[AMETTM] [int] NULL,
	[AMCGUS] [nvarchar](15) NULL,
	[AMCGDT] [int] NULL,
	[AMCGTM] [int] NULL,
	[AMUPDT] [nvarchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUNSAIL_ST_ATMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUNSAIL_ST_ATMST](
	[ATLOCT] [nvarchar](4) NULL,
	[ATTYPE] [nvarchar](5) NULL,
	[ATNAME] [nvarchar](50) NULL,
	[ATCTIN] [nvarchar](2) NULL,
	[ATMXPR] [int] NULL,
	[ATNBRM] [int] NULL,
	[ATWAIT] [int] NULL,
	[ATCONO] [int] NULL,
	[ATDEPT] [int] NULL,
	[ATGLNO] [nvarchar](8) NULL,
	[ATACTV] [nvarchar](2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUNSAIL_ST_BLMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUNSAIL_ST_BLMST](
	[BLLOCT] [nvarchar](3) NULL,
	[BLAREA] [nvarchar](3) NULL,
	[BLCODE] [nvarchar](1) NULL,
	[BLTYPE] [nvarchar](1) NULL,
	[BLGLBL] [nvarchar](3) NULL,
	[BLNAME] [nvarchar](10) NULL,
	[BLCOMP] [nvarchar](1) NULL,
	[BLPORT] [nvarchar](25) NULL,
	[BLGLCN] [numeric](3, 0) NULL,
	[BLCMLN] [nvarchar](10) NULL,
	[BLACAV] [nvarchar](1) NULL,
	[BLLTPC] [numeric](5, 4) NULL,
	[BLATPC] [numeric](5, 4) NULL,
	[BLAGPC] [numeric](5, 4) NULL,
	[BLTXAM] [numeric](5, 2) NULL,
	[BLCNAM] [numeric](5, 2) NULL,
	[BLCHLN] [numeric](3, 0) NULL,
	[BLSTME] [numeric](4, 0) NULL,
	[BLETME] [numeric](4, 0) NULL,
	[BLTURN] [numeric](4, 0) NULL,
	[BLSTL1] [numeric](3, 0) NULL,
	[BLSTL2] [numeric](3, 0) NULL,
	[BLCTRY] [nvarchar](25) NULL,
	[BLTXCM] [nvarchar](1) NULL,
	[BLACCT] [nvarchar](3) NULL,
	[BLSORT] [nvarchar](25) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUNSAIL_ST_BRMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUNSAIL_ST_BRMST](
	[BRCODE] [nvarchar](10) NULL,
	[BRDESC] [nvarchar](30) NULL,
	[BRAVAL] [numeric](8, 0) NULL,
	[BRSTCK] [nvarchar](1) NULL,
	[BRGPCD] [nvarchar](2) NULL,
	[BRTOPC] [nvarchar](2) NULL,
	[BRGRUP] [nvarchar](2) NULL,
	[BRSTRO] [numeric](4, 0) NULL,
	[BRSTTS] [nvarchar](1) NULL,
	[BRFLUP] [nvarchar](1) NULL,
	[BRBRND] [nvarchar](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUNSAIL_ST_BTMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUNSAIL_ST_BTMST](
	[BTRDTE] [numeric](8, 0) NULL,
	[BTUSER] [nvarchar](10) NULL,
	[BTNUMB] [nvarchar](6) NULL,
	[BTQNTY] [numeric](3, 0) NULL,
	[BTUNMS] [nvarchar](2) NULL,
	[BTCODE] [nvarchar](10) NULL,
	[BTPDTE] [numeric](8, 0) NULL,
	[BTPRNT] [nvarchar](1) NULL,
	[BTPRIM] [nvarchar](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUNSAIL_ST_CAMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUNSAIL_ST_CAMST](
	[CALOCT] [nvarchar](3) NULL,
	[CACLAS] [nvarchar](1) NULL,
	[CASCLS] [nvarchar](1) NULL,
	[CAEFDT] [numeric](8, 0) NULL,
	[CASTDT] [numeric](8, 0) NULL,
	[CADESC] [nvarchar](25) NULL,
	[CATXPC] [numeric](5, 4) NULL,
	[CATPPC] [numeric](5, 4) NULL,
	[CACMCD] [nvarchar](1) NULL,
	[CADSCD] [nvarchar](1) NULL,
	[CATAXD] [nvarchar](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUNSAIL_ST_CFMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUNSAIL_ST_CFMST](
	[CFDESG] [nvarchar](3) NULL,
	[CFFACT] [numeric](9, 4) NULL,
	[CFTYPE] [nvarchar](1) NULL,
	[CFDATE] [numeric](8, 0) NULL,
	[CFUSER] [nvarchar](10) NULL,
	[CFETDT] [numeric](8, 0) NULL,
	[CFETTM] [numeric](6, 0) NULL,
	[CFCHUS] [nvarchar](10) NULL,
	[CFCHDT] [numeric](8, 0) NULL,
	[CFCHTM] [numeric](6, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUNSAIL_ST_CHMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUNSAIL_ST_CHMST](
	[CHCNNB] [nvarchar](6) NULL,
	[CHCLNB] [nvarchar](6) NULL,
	[CHCLN2] [nvarchar](6) NULL,
	[CHAGNT] [nvarchar](10) NULL,
	[CHSTDT] [numeric](8, 0) NULL,
	[CHENDT] [numeric](8, 0) NULL,
	[CHNBDY] [numeric](3, 0) NULL,
	[CHFLNB] [nvarchar](10) NULL,
	[CHFLTY] [nvarchar](5) NULL,
	[CHFLCR] [nvarchar](1) NULL,
	[CHETDT] [numeric](8, 0) NULL,
	[CHCNDT] [numeric](8, 0) NULL,
	[CHDPDT] [numeric](8, 0) NULL,
	[CHDRDT] [numeric](8, 0) NULL,
	[CHFLAM] [numeric](9, 2) NULL,
	[CHACAM] [numeric](9, 2) NULL,
	[CHPRAM] [numeric](9, 2) NULL,
	[CHEXAM] [numeric](9, 2) NULL,
	[CHCMAM] [numeric](9, 2) NULL,
	[CHFSAM] [numeric](9, 2) NULL,
	[CHDSAM] [numeric](9, 2) NULL,
	[CHMSAM] [numeric](9, 2) NULL,
	[CHBVAM] [numeric](9, 2) NULL,
	[CHTXAM] [numeric](9, 2) NULL,
	[CHINAM] [numeric](9, 2) NULL,
	[CHOTHR] [numeric](9, 2) NULL,
	[CHTLAM] [numeric](9, 2) NULL,
	[CHCNTY] [nvarchar](3) NULL,
	[CHPSTY] [nvarchar](2) NULL,
	[CHDESG] [nvarchar](3) NULL,
	[CHNBPR] [numeric](3, 0) NULL,
	[CHDLVY] [numeric](9, 2) NULL,
	[CHFRLC] [nvarchar](3) NULL,
	[CHTOLC] [nvarchar](3) NULL,
	[CHBKNG] [nvarchar](3) NULL,
	[CHOPTN] [nvarchar](1) NULL,
	[CHCALC] [numeric](9, 4) NULL,
	[CHMAIL] [nvarchar](1) NULL,
	[CHCODE] [nvarchar](1) NULL,
	[CHOWNT] [numeric](3, 0) NULL,
	[CHCOMP] [numeric](3, 0) NULL,
	[CHSPR1] [numeric](8, 0) NULL,
	[CHSPR2] [numeric](3, 0) NULL,
	[CHSPR3] [nvarchar](1) NULL,
	[CHPACK] [nvarchar](10) NULL,
	[CHCTAG] [nvarchar](2) NULL,
	[CHSPR4] [nvarchar](4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUNSAIL_ST_CIMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUNSAIL_ST_CIMST](
	[CIRCID] [nvarchar](1) NULL,
	[CICNNB] [nvarchar](6) NULL,
	[CINUMB] [numeric](3, 0) NULL,
	[CICLNB] [nvarchar](6) NULL,
	[CIQNTY] [numeric](5, 0) NULL,
	[CIPERS] [numeric](2, 0) NULL,
	[CICLAS] [nvarchar](1) NULL,
	[CISCLS] [nvarchar](1) NULL,
	[CICANC] [nvarchar](10) NULL,
	[CIDESC] [nvarchar](30) NULL,
	[CIOFID] [nvarchar](10) NULL,
	[CIAMNT] [numeric](9, 2) NULL,
	[CIFAMT] [numeric](9, 2) NULL,
	[CIDISC] [numeric](3, 3) NULL,
	[CIBDSC] [numeric](9, 2) NULL,
	[CIFDSC] [numeric](9, 2) NULL,
	[CIBVAT] [numeric](9, 2) NULL,
	[CIFVAT] [numeric](9, 2) NULL,
	[CITAPR] [numeric](3, 3) NULL,
	[CIBCOM] [numeric](9, 2) NULL,
	[CIFCOM] [numeric](9, 2) NULL,
	[CICNST] [numeric](8, 0) NULL,
	[CICNEN] [numeric](8, 0) NULL,
	[CIETDT] [numeric](8, 0) NULL,
	[CICHDT] [numeric](8, 0) NULL,
	[CIUSER] [nvarchar](10) NULL,
	[CISTDT] [numeric](8, 0) NULL,
	[CIENDT] [numeric](8, 0) NULL,
	[CIEXTR] [nvarchar](21) NULL,
	[CILOCT] [nvarchar](3) NULL,
	[CIPACK] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUNSAIL_ST_CIMST_INTRADAY]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUNSAIL_ST_CIMST_INTRADAY](
	[CIRCID] [nvarchar](1) NULL,
	[CICNNB] [nvarchar](6) NULL,
	[CINUMB] [numeric](3, 0) NULL,
	[CICLNB] [nvarchar](6) NULL,
	[CIQNTY] [numeric](5, 0) NULL,
	[CIPERS] [numeric](2, 0) NULL,
	[CICLAS] [nvarchar](1) NULL,
	[CISCLS] [nvarchar](1) NULL,
	[CICANC] [nvarchar](10) NULL,
	[CIDESC] [nvarchar](30) NULL,
	[CIOFID] [nvarchar](10) NULL,
	[CIAMNT] [numeric](9, 2) NULL,
	[CIFAMT] [numeric](9, 2) NULL,
	[CIDISC] [numeric](3, 3) NULL,
	[CIBDSC] [numeric](9, 2) NULL,
	[CIFDSC] [numeric](9, 2) NULL,
	[CIBVAT] [numeric](9, 2) NULL,
	[CIFVAT] [numeric](9, 2) NULL,
	[CITAPR] [numeric](3, 3) NULL,
	[CIBCOM] [numeric](9, 2) NULL,
	[CIFCOM] [numeric](9, 2) NULL,
	[CICNST] [numeric](8, 0) NULL,
	[CICNEN] [numeric](8, 0) NULL,
	[CIETDT] [numeric](8, 0) NULL,
	[CICHDT] [numeric](8, 0) NULL,
	[CIUSER] [nvarchar](10) NULL,
	[CISTDT] [numeric](8, 0) NULL,
	[CIENDT] [numeric](8, 0) NULL,
	[CIEXTR] [nvarchar](21) NULL,
	[CILOCT] [nvarchar](3) NULL,
	[CIPACK] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUNSAIL_ST_CLMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUNSAIL_ST_CLMST](
	[CLNUMB] [nvarchar](6) NULL,
	[CLSALU] [nvarchar](10) NULL,
	[CLFNAM] [nvarchar](40) NULL,
	[CLNAME] [nvarchar](40) NULL,
	[CLADD1] [nvarchar](40) NULL,
	[CLADD2] [nvarchar](40) NULL,
	[CLADD3] [nvarchar](40) NULL,
	[CLCITY] [nvarchar](30) NULL,
	[CLSTCD] [nvarchar](40) NULL,
	[CLZIPC] [nvarchar](12) NULL,
	[CLCTRY] [nvarchar](40) NULL,
	[CLHMPH] [nvarchar](20) NULL,
	[CLBSPH] [nvarchar](20) NULL,
	[CLBSEX] [nvarchar](4) NULL,
	[CLCEPH] [nvarchar](20) NULL,
	[CLFAX#] [nvarchar](20) NULL,
	[CLNBCH] [numeric](3, 0) NULL,
	[CLCMCL] [nvarchar](1) NULL,
	[CLCLS1] [nvarchar](1) NULL,
	[CLCLS2] [nvarchar](1) NULL,
	[CLLINK] [nvarchar](2) NULL,
	[CLRTTR] [nvarchar](1) NULL,
	[CLLSCN] [numeric](8, 0) NULL,
	[CLCNTP] [nvarchar](1) NULL,
	[CLTANB] [numeric](9, 0) NULL,
	[CLLSCH] [numeric](8, 0) NULL,
	[CLMRCD] [nvarchar](2) NULL,
	[CLMRC2] [nvarchar](2) NULL,
	[CLSPI1] [nvarchar](2) NULL,
	[CLSPI2] [nvarchar](2) NULL,
	[CLSPI3] [nvarchar](2) NULL,
	[CLPSTY] [nvarchar](2) NULL,
	[CLDESG] [nvarchar](3) NULL,
	[CLETDT] [numeric](8, 0) NULL,
	[CLUSER] [nvarchar](10) NULL,
	[CLCHDT] [numeric](8, 0) NULL,
	[CLCHUS] [nvarchar](10) NULL,
	[CLSIZE] [numeric](3, 0) NULL,
	[CLDISC] [numeric](4, 3) NULL,
	[CLCOMM] [numeric](4, 3) NULL,
	[CLDTE1] [numeric](8, 0) NULL,
	[CLDTE2] [numeric](8, 0) NULL,
	[CLDTE3] [numeric](8, 0) NULL,
	[CLDTE4] [numeric](8, 0) NULL,
	[CLDTE5] [numeric](8, 0) NULL,
	[CLDTE6] [numeric](8, 0) NULL,
	[CLDTE7] [numeric](8, 0) NULL,
	[CLDTE8] [numeric](8, 0) NULL,
	[CLBKNG] [nvarchar](3) NULL,
	[CLLSDT] [numeric](8, 0) NULL,
	[CLLSCD] [nvarchar](2) NULL,
	[CLBRTH] [numeric](8, 0) NULL,
	[CLALF1] [nvarchar](1) NULL,
	[CLALF2] [nvarchar](1) NULL,
	[CLALF3] [nvarchar](1) NULL,
	[CLALF4] [nvarchar](1) NULL,
	[CLALF5] [nvarchar](10) NULL,
	[CLCART] [nvarchar](4) NULL,
	[CLERCD] [nvarchar](4) NULL,
	[CLDVPT] [nvarchar](3) NULL,
	[CLCONO] [nvarchar](2) NULL,
	[CLORGP] [nvarchar](6) NULL,
	[CLORT1] [nvarchar](2) NULL,
	[CLORT2] [nvarchar](2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUNSAIL_ST_CLMST_SUNDLIB]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUNSAIL_ST_CLMST_SUNDLIB](
	[CLNUMB] [nvarchar](6) NULL,
	[CLSALU] [nvarchar](10) NULL,
	[CLFNAM] [nvarchar](40) NULL,
	[CLNAME] [nvarchar](40) NULL,
	[CLADD1] [nvarchar](40) NULL,
	[CLADD2] [nvarchar](40) NULL,
	[CLADD3] [nvarchar](40) NULL,
	[CLCITY] [nvarchar](30) NULL,
	[CLSTCD] [nvarchar](40) NULL,
	[CLZIPC] [nvarchar](12) NULL,
	[CLCTRY] [nvarchar](40) NULL,
	[CLHMPH] [nvarchar](20) NULL,
	[CLBSPH] [nvarchar](20) NULL,
	[CLBSEX] [nvarchar](4) NULL,
	[CLCEPH] [nvarchar](20) NULL,
	[CLFAX#] [nvarchar](20) NULL,
	[CLNBCH] [numeric](3, 0) NULL,
	[CLCMCL] [nvarchar](1) NULL,
	[CLCLS1] [nvarchar](1) NULL,
	[CLCLS2] [nvarchar](1) NULL,
	[CLLINK] [nvarchar](2) NULL,
	[CLRTTR] [nvarchar](1) NULL,
	[CLLSCN] [numeric](8, 0) NULL,
	[CLCNTP] [nvarchar](1) NULL,
	[CLTANB] [numeric](9, 0) NULL,
	[CLLSCH] [numeric](8, 0) NULL,
	[CLMRCD] [nvarchar](2) NULL,
	[CLMRC2] [nvarchar](2) NULL,
	[CLSPI1] [nvarchar](2) NULL,
	[CLSPI2] [nvarchar](2) NULL,
	[CLSPI3] [nvarchar](2) NULL,
	[CLPSTY] [nvarchar](2) NULL,
	[CLDESG] [nvarchar](3) NULL,
	[CLETDT] [numeric](8, 0) NULL,
	[CLUSER] [nvarchar](10) NULL,
	[CLCHDT] [numeric](8, 0) NULL,
	[CLCHUS] [nvarchar](10) NULL,
	[CLSIZE] [numeric](3, 0) NULL,
	[CLDISC] [numeric](4, 3) NULL,
	[CLCOMM] [numeric](4, 3) NULL,
	[CLDTE1] [numeric](8, 0) NULL,
	[CLDTE2] [numeric](8, 0) NULL,
	[CLDTE3] [numeric](8, 0) NULL,
	[CLDTE4] [numeric](8, 0) NULL,
	[CLDTE5] [numeric](8, 0) NULL,
	[CLDTE6] [numeric](8, 0) NULL,
	[CLDTE7] [numeric](8, 0) NULL,
	[CLDTE8] [numeric](8, 0) NULL,
	[CLBKNG] [nvarchar](3) NULL,
	[CLLSDT] [numeric](8, 0) NULL,
	[CLLSCD] [nvarchar](2) NULL,
	[CLBRTH] [numeric](8, 0) NULL,
	[CLALF1] [nvarchar](1) NULL,
	[CLALF2] [nvarchar](1) NULL,
	[CLALF3] [nvarchar](1) NULL,
	[CLALF4] [nvarchar](1) NULL,
	[CLALF5] [nvarchar](10) NULL,
	[CLCART] [nvarchar](4) NULL,
	[CLERCD] [nvarchar](4) NULL,
	[CLDVPT] [nvarchar](3) NULL,
	[CLCONO] [nvarchar](2) NULL,
	[CLORGP] [nvarchar](6) NULL,
	[CLORT1] [nvarchar](2) NULL,
	[CLORT2] [nvarchar](2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUNSAIL_ST_CMMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUNSAIL_ST_CMMST](
	[CMNUMB] [nvarchar](6) NULL,
	[CMRCNB] [numeric](3, 0) NULL,
	[CMDATA] [nvarchar](75) NULL,
	[CMUSER] [nvarchar](10) NULL,
	[CMETDT] [numeric](8, 0) NULL,
	[CMETTM] [numeric](6, 0) NULL,
	[CMCGUS] [nvarchar](10) NULL,
	[CMCGDT] [numeric](8, 0) NULL,
	[CMCGTM] [numeric](6, 0) NULL,
	[CMUPDT] [nvarchar](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUNSAIL_ST_CNMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUNSAIL_ST_CNMST](
	[CNNUMB] [nvarchar](6) NULL,
	[CNCLNB] [nvarchar](6) NULL,
	[CNCLN2] [nvarchar](6) NULL,
	[CNSTDT] [numeric](8, 0) NULL,
	[CNENDT] [numeric](8, 0) NULL,
	[CNARDT] [numeric](8, 0) NULL,
	[CNCANX] [nvarchar](4) NULL,
	[CNPERS] [numeric](3, 0) NULL,
	[CNBDEP] [numeric](9, 2) NULL,
	[CNFDEP] [numeric](9, 2) NULL,
	[CNSTUS] [nvarchar](1) NULL,
	[CNUSER] [nvarchar](10) NULL,
	[CNETDT] [numeric](8, 0) NULL,
	[CNCHDT] [numeric](8, 0) NULL,
	[CNCNTR] [nvarchar](1) NULL,
	[CNRSUM] [nvarchar](1) NULL,
	[CNPRVS] [nvarchar](1) NULL,
	[CNBVRG] [nvarchar](1) NULL,
	[CNGUST] [nvarchar](1) NULL,
	[CNPREF] [nvarchar](1) NULL,
	[CNLIAB] [nvarchar](1) NULL,
	[CNBTOT] [numeric](9, 2) NULL,
	[CNFTOT] [numeric](9, 2) NULL,
	[CNDESG] [nvarchar](3) NULL,
	[CNTYPE] [nvarchar](3) NULL,
	[CNWAIT] [nvarchar](1) NULL,
	[CNBMIT] [nvarchar](1) NULL,
	[CNCSPR] [nvarchar](1) NULL,
	[CNPRNT] [nvarchar](1) NULL,
	[CNTRNS] [nvarchar](1) NULL,
	[CNSALU] [nvarchar](10) NULL,
	[CNFNAM] [nvarchar](40) NULL,
	[CNNAME] [nvarchar](40) NULL,
	[CNSAL2] [nvarchar](10) NULL,
	[CNFNA2] [nvarchar](40) NULL,
	[CNNAM2] [nvarchar](40) NULL,
	[CNSTCD] [nvarchar](2) NULL,
	[CNNBCH] [numeric](3, 0) NULL,
	[CNCMDR] [nvarchar](1) NULL,
	[CNCLAS] [nvarchar](1) NULL,
	[CNGRPN] [nvarchar](10) NULL,
	[CNPSTY] [nvarchar](2) NULL,
	[CNBKNG] [nvarchar](3) NULL,
	[CNLOC1] [nvarchar](3) NULL,
	[CNLOC2] [nvarchar](3) NULL,
	[CNLOC3] [nvarchar](3) NULL,
	[CNLOC4] [nvarchar](3) NULL,
	[CNDTE1] [numeric](8, 0) NULL,
	[CNDTE4] [numeric](8, 0) NULL,
	[CNTME1] [numeric](4, 0) NULL,
	[CNTME2] [numeric](4, 0) NULL,
	[CNTME3] [numeric](4, 0) NULL,
	[CNTME4] [numeric](4, 0) NULL,
	[CNFLT1] [nvarchar](5) NULL,
	[CNFLTY] [nvarchar](5) NULL,
	[CNBOAT] [nvarchar](30) NULL,
	[CNOFID] [nvarchar](10) NULL,
	[CNRCLS] [nvarchar](1) NULL,
	[CNFUSR] [nvarchar](10) NULL,
	[CNFDTE] [numeric](8, 0) NULL,
	[CNDISC] [numeric](3, 3) NULL,
	[CNBFLT] [numeric](9, 2) NULL,
	[CNFFLT] [numeric](9, 2) NULL,
	[CNBDLV] [numeric](9, 2) NULL,
	[CNFDLV] [numeric](9, 2) NULL,
	[CNCODE] [nvarchar](1) NULL,
	[CNINVC] [numeric](8, 0) NULL,
	[CNOPTN] [nvarchar](1) NULL,
	[CNINVP] [numeric](8, 0) NULL,
	[CNPACK] [nvarchar](10) NULL,
	[CNTIME] [numeric](6, 0) NULL,
	[CNUPD1] [nvarchar](1) NULL,
	[CNUPD2] [nvarchar](1) NULL,
	[CNUPD3] [nvarchar](1) NULL,
	[CNUPD4] [nvarchar](1) NULL,
	[CNUPD5] [nvarchar](1) NULL,
	[CNUPD6] [nvarchar](1) NULL,
	[CNDAT1] [numeric](8, 0) NULL,
	[CNDAT2] [numeric](8, 0) NULL,
	[CNDAT3] [numeric](8, 0) NULL,
	[CNDAT4] [numeric](8, 0) NULL,
	[CNAMT1] [numeric](9, 2) NULL,
	[CNAMT2] [numeric](9, 2) NULL,
	[CNAMT3] [numeric](9, 2) NULL,
	[CNAMT4] [numeric](9, 2) NULL,
	[CNDES1] [nvarchar](30) NULL,
	[CNDES2] [nvarchar](30) NULL,
	[CNDES3] [nvarchar](30) NULL,
	[CNDES4] [nvarchar](10) NULL,
	[CNDES5] [nvarchar](10) NULL,
	[CNDES6] [nvarchar](3) NULL,
	[CNDES7] [nvarchar](3) NULL,
	[CNCONO] [nvarchar](2) NULL,
	[CNSRCD] [nvarchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUNSAIL_ST_CNMST_INTRADAY]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUNSAIL_ST_CNMST_INTRADAY](
	[CNNUMB] [nvarchar](6) NULL,
	[CNCLNB] [nvarchar](6) NULL,
	[CNCLN2] [nvarchar](6) NULL,
	[CNSTDT] [numeric](8, 0) NULL,
	[CNENDT] [numeric](8, 0) NULL,
	[CNARDT] [numeric](8, 0) NULL,
	[CNCANX] [nvarchar](4) NULL,
	[CNPERS] [numeric](3, 0) NULL,
	[CNBDEP] [numeric](9, 2) NULL,
	[CNFDEP] [numeric](9, 2) NULL,
	[CNSTUS] [nvarchar](1) NULL,
	[CNUSER] [nvarchar](10) NULL,
	[CNETDT] [numeric](8, 0) NULL,
	[CNCHDT] [numeric](8, 0) NULL,
	[CNCNTR] [nvarchar](1) NULL,
	[CNRSUM] [nvarchar](1) NULL,
	[CNPRVS] [nvarchar](1) NULL,
	[CNBVRG] [nvarchar](1) NULL,
	[CNGUST] [nvarchar](1) NULL,
	[CNPREF] [nvarchar](1) NULL,
	[CNLIAB] [nvarchar](1) NULL,
	[CNBTOT] [numeric](9, 2) NULL,
	[CNFTOT] [numeric](9, 2) NULL,
	[CNDESG] [nvarchar](3) NULL,
	[CNTYPE] [nvarchar](3) NULL,
	[CNWAIT] [nvarchar](1) NULL,
	[CNBMIT] [nvarchar](1) NULL,
	[CNCSPR] [nvarchar](1) NULL,
	[CNPRNT] [nvarchar](1) NULL,
	[CNTRNS] [nvarchar](1) NULL,
	[CNSALU] [nvarchar](10) NULL,
	[CNFNAM] [nvarchar](40) NULL,
	[CNNAME] [nvarchar](40) NULL,
	[CNSAL2] [nvarchar](10) NULL,
	[CNFNA2] [nvarchar](40) NULL,
	[CNNAM2] [nvarchar](40) NULL,
	[CNSTCD] [nvarchar](2) NULL,
	[CNNBCH] [numeric](3, 0) NULL,
	[CNCMDR] [nvarchar](1) NULL,
	[CNCLAS] [nvarchar](1) NULL,
	[CNGRPN] [nvarchar](10) NULL,
	[CNPSTY] [nvarchar](2) NULL,
	[CNBKNG] [nvarchar](3) NULL,
	[CNLOC1] [nvarchar](3) NULL,
	[CNLOC2] [nvarchar](3) NULL,
	[CNLOC3] [nvarchar](3) NULL,
	[CNLOC4] [nvarchar](3) NULL,
	[CNDTE1] [numeric](8, 0) NULL,
	[CNDTE4] [numeric](8, 0) NULL,
	[CNTME1] [numeric](4, 0) NULL,
	[CNTME2] [numeric](4, 0) NULL,
	[CNTME3] [numeric](4, 0) NULL,
	[CNTME4] [numeric](4, 0) NULL,
	[CNFLT1] [nvarchar](5) NULL,
	[CNFLTY] [nvarchar](5) NULL,
	[CNBOAT] [nvarchar](30) NULL,
	[CNOFID] [nvarchar](10) NULL,
	[CNRCLS] [nvarchar](1) NULL,
	[CNFUSR] [nvarchar](10) NULL,
	[CNFDTE] [numeric](8, 0) NULL,
	[CNDISC] [numeric](3, 3) NULL,
	[CNBFLT] [numeric](9, 2) NULL,
	[CNFFLT] [numeric](9, 2) NULL,
	[CNBDLV] [numeric](9, 2) NULL,
	[CNFDLV] [numeric](9, 2) NULL,
	[CNCODE] [nvarchar](1) NULL,
	[CNINVC] [numeric](8, 0) NULL,
	[CNOPTN] [nvarchar](1) NULL,
	[CNINVP] [numeric](8, 0) NULL,
	[CNPACK] [nvarchar](10) NULL,
	[CNTIME] [numeric](6, 0) NULL,
	[CNUPD1] [nvarchar](1) NULL,
	[CNUPD2] [nvarchar](1) NULL,
	[CNUPD3] [nvarchar](1) NULL,
	[CNUPD4] [nvarchar](1) NULL,
	[CNUPD5] [nvarchar](1) NULL,
	[CNUPD6] [nvarchar](1) NULL,
	[CNDAT1] [numeric](8, 0) NULL,
	[CNDAT2] [numeric](8, 0) NULL,
	[CNDAT3] [numeric](8, 0) NULL,
	[CNDAT4] [numeric](8, 0) NULL,
	[CNAMT1] [numeric](9, 2) NULL,
	[CNAMT2] [numeric](9, 2) NULL,
	[CNAMT3] [numeric](9, 2) NULL,
	[CNAMT4] [numeric](9, 2) NULL,
	[CNDES1] [nvarchar](30) NULL,
	[CNDES2] [nvarchar](30) NULL,
	[CNDES3] [nvarchar](30) NULL,
	[CNDES4] [nvarchar](10) NULL,
	[CNDES5] [nvarchar](10) NULL,
	[CNDES6] [nvarchar](3) NULL,
	[CNDES7] [nvarchar](3) NULL,
	[CNCONO] [nvarchar](2) NULL,
	[CNSRCD] [nvarchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUNSAIL_ST_CRMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUNSAIL_ST_CRMST](
	[CRDATE] [numeric](8, 0) NULL,
	[CRTIME] [numeric](10, 0) NULL,
	[CRUSER] [nvarchar](20) NULL,
	[CRCNNB] [nvarchar](6) NULL,
	[CRREFR] [nvarchar](20) NULL,
	[CRCCTY] [nvarchar](16) NULL,
	[CRCCNB] [nvarchar](28) NULL,
	[CRCCDT] [numeric](10, 0) NULL,
	[CRCCAC] [nvarchar](11) NULL,
	[CRBSAM] [numeric](11, 2) NULL,
	[CRFRAM] [numeric](11, 2) NULL,
	[CRDESG] [nvarchar](20) NULL,
	[CRLORR] [nvarchar](20) NULL,
	[CRTYPE] [nvarchar](4) NULL,
	[CRNBEN] [numeric](3, 0) NULL,
	[CRLOCT] [nvarchar](3) NULL,
	[CRRCVD] [nvarchar](8) NULL,
	[CRORGN] [nvarchar](11) NULL,
	[CRRITA] [nvarchar](32) NULL,
	[CRTRAN] [nvarchar](40) NULL,
	[CRTOKN] [nvarchar](40) NULL,
	[CREXTR1] [nvarchar](40) NULL,
	[CREXTR2] [nvarchar](40) NULL,
	[CREXTR3] [nvarchar](40) NULL,
	[CREXTR4] [nvarchar](40) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUNSAIL_ST_EFMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUNSAIL_ST_EFMST](
	[EFNUMB] [nvarchar](40) NULL,
	[EFFNAM] [nvarchar](40) NULL,
	[EFLNAM] [nvarchar](56) NULL,
	[EFMAIL] [nvarchar](50) NULL,
	[EFWPID] [nvarchar](10) NULL,
	[EFCTCD] [nvarchar](2) NULL,
	[EFLGID] [nvarchar](1) NULL,
	[EFSITE] [nvarchar](1) NULL,
	[EFEMYN] [nvarchar](10) NULL,
	[EFETDT] [int] NULL,
	[EFUSER] [nvarchar](10) NULL,
	[EFCHDT] [int] NULL,
	[EFCHUS] [nvarchar](10) NULL,
	[EFCTDT] [int] NULL,
	[EFRPDT] [int] NULL,
	[EFRPCD] [int] NULL,
	[EFMRCD] [nvarchar](2) NULL,
	[EFMRC2] [nvarchar](2) NULL,
	[EFSPI1] [nvarchar](2) NULL,
	[EFSPI2] [nvarchar](2) NULL,
	[EFSPI3] [nvarchar](10) NULL,
	[EFDTE1] [int] NULL,
	[EFDTE2] [int] NULL,
	[EFFLG1] [nvarchar](3) NULL,
	[EFFLG2] [nvarchar](3) NULL,
	[EFFLG3] [nvarchar](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUNSAIL_ST_FBMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUNSAIL_ST_FBMST](
	[FBCODE] [nvarchar](10) NULL,
	[FBDESC] [nvarchar](30) NULL,
	[FBSORT] [numeric](4, 0) NULL,
	[FBSTAT] [nvarchar](1) NULL,
	[FBBKNG] [nvarchar](3) NULL,
	[FBRAND] [nvarchar](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUNSAIL_ST_FLAIRCRFT]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUNSAIL_ST_FLAIRCRFT](
	[ACCODE] [nvarchar](10) NULL,
	[ACDESC] [nvarchar](30) NULL,
	[ACUSID] [nvarchar](15) NULL,
	[ACMNUS] [nvarchar](15) NULL,
	[ACMNWS] [nvarchar](15) NULL,
	[ACMNDT] [int] NULL,
	[ACMNTM] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUNSAIL_ST_FLAIRLINE]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUNSAIL_ST_FLAIRLINE](
	[ALCODE] [nvarchar](10) NULL,
	[ALDESC] [nvarchar](30) NULL,
	[ALUSID] [nvarchar](15) NULL,
	[ALMNUS] [nvarchar](15) NULL,
	[ALMNWS] [nvarchar](15) NULL,
	[ALMNDT] [int] NULL,
	[ALMNTM] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUNSAIL_ST_FLALLOC]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUNSAIL_ST_FLALLOC](
	[ALFLTNO] [int] NULL,
	[ALPRALC] [int] NULL,
	[ALALLOC#] [int] NULL,
	[ALALCCDE] [nvarchar](5) NULL,
	[ALALVALU] [nvarchar](5) NULL,
	[ALTOTSEAT] [int] NULL,
	[ALOPTSEAT] [int] NULL,
	[ALCONSEAT] [int] NULL,
	[ALWAISEAT] [int] NULL,
	[ALFRESEAT] [int] NULL,
	[ALALWNEG] [nvarchar](5) NULL,
	[ALUSID] [nvarchar](15) NULL,
	[ALMNUS] [nvarchar](15) NULL,
	[ALMNWS] [nvarchar](15) NULL,
	[ALMNDT] [int] NULL,
	[ALMNTM] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUNSAIL_ST_FLFLREF]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUNSAIL_ST_FLFLREF](
	[RFCLNO] [nvarchar](9) NULL,
	[RFFLRF] [numeric](25, 0) NULL,
	[RFFNBR] [numeric](20, 0) NULL,
	[RFSREQ] [numeric](10, 0) NULL,
	[RFSWAIT] [numeric](10, 0) NULL,
	[RFFLTON] [nvarchar](1) NULL,
	[RF7DAYS] [nvarchar](1) NULL,
	[RFALFONL] [nvarchar](1) NULL,
	[RFALF7DY] [nvarchar](1) NULL,
	[RFSEATS] [numeric](5, 0) NULL,
	[RFADDBY] [nvarchar](10) NULL,
	[RFADDDTE] [numeric](8, 0) NULL,
	[RFADDTIM] [numeric](6, 0) NULL,
	[RFALLOC#] [numeric](15, 0) NULL,
	[RFROUTE#] [numeric](10, 0) NULL,
	[RFNUMB] [nvarchar](6) NULL,
	[RFRATE1] [numeric](9, 2) NULL,
	[RFRATE2] [numeric](9, 2) NULL,
	[RFTYPE1] [nvarchar](5) NULL,
	[RFTYPE2] [nvarchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUNSAIL_ST_FLFLTMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUNSAIL_ST_FLFLTMST](
	[FLNUMBER] [int] NULL,
	[FLTYPE] [nvarchar](10) NULL,
	[FLDPARPT] [nvarchar](9) NULL,
	[FLDPDATE] [int] NULL,
	[FLDPTIME] [int] NULL,
	[FLDPNO] [int] NULL,
	[FLARARPT] [nvarchar](9) NULL,
	[FLARDATE] [int] NULL,
	[FLARTIME] [int] NULL,
	[FLCARRIER] [nvarchar](6) NULL,
	[FLREF] [nvarchar](20) NULL,
	[FLLOCATOR] [nvarchar](50) NULL,
	[FLOUTORIN] [nvarchar](15) NULL,
	[FLSEATPRC] [numeric](16, 2) NULL,
	[FLTOTSEAT] [int] NULL,
	[FLOPTION] [int] NULL,
	[FLCONFD] [int] NULL,
	[FLWAIT] [int] NULL,
	[FLFREE] [int] NULL,
	[FLFTOTSEAT] [int] NULL,
	[FLFOPTION] [int] NULL,
	[FLFCONFD] [int] NULL,
	[FLFWAIT] [int] NULL,
	[FLFFREE] [int] NULL,
	[FLTICKETS] [nvarchar](1) NULL,
	[FLMANIFEST] [nvarchar](6) NULL,
	[FLBAGGAGE] [nvarchar](10) NULL,
	[FLCKINTIME] [int] NULL,
	[FLCKINTERM] [nvarchar](50) NULL,
	[FLROUT] [nvarchar](9) NULL,
	[FLMAX7DAY] [int] NULL,
	[FL7DAYREM] [int] NULL,
	[FL7DAYSTOP] [nvarchar](13) NULL,
	[FLFMAX7DAY] [int] NULL,
	[FLF7DAYREM] [int] NULL,
	[FLF7DAYSTP] [nvarchar](6) NULL,
	[FLCLASS] [nvarchar](1) NULL,
	[FLINTUSE] [nvarchar](1) NULL,
	[FLINUSE] [nvarchar](16) NULL,
	[FLLASTALC#] [int] NULL,
	[FLTOTONFIT] [int] NULL,
	[FLOPTONFIT] [int] NULL,
	[FLCNFONFIT] [int] NULL,
	[FLWAIONFIT] [int] NULL,
	[FLFREONFIT] [int] NULL,
	[FLHASALTN] [nvarchar](1) NULL,
	[FLONREQUST] [nvarchar](15) NULL,
	[FLCOST1] [numeric](16, 2) NULL,
	[FLCOST2] [numeric](16, 2) NULL,
	[FLUSID] [nvarchar](10) NULL,
	[FLMNUS] [nvarchar](10) NULL,
	[FLMNWS] [nvarchar](15) NULL,
	[FLMNDT] [int] NULL,
	[FLMNTM] [int] NULL,
	[FLBKNG] [nvarchar](3) NULL,
	[FLDESG] [nvarchar](3) NULL,
	[FLPLTFRM] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUNSAIL_ST_FLLINK]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUNSAIL_ST_FLLINK](
	[LKROUTE] [int] NULL,
	[LKDESC] [nvarchar](10) NULL,
	[LKDATE] [int] NULL,
	[LKTIME] [int] NULL,
	[LKDPNO] [int] NULL,
	[LKUSID] [nvarchar](15) NULL,
	[LKMNUS] [nvarchar](15) NULL,
	[LKMNWS] [nvarchar](15) NULL,
	[LKMNDT] [int] NULL,
	[LKMNTM] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUNSAIL_ST_FLMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUNSAIL_ST_FLMST](
	[FLNUMB] [nvarchar](50) NULL,
	[FLNAME] [nvarchar](50) NULL,
	[FLTYPE] [nvarchar](50) NULL,
	[FLFLAG] [nvarchar](50) NULL,
	[FLPROG] [nvarchar](50) NULL,
	[FLRANK] [numeric](5, 2) NULL,
	[FLCMNB] [numeric](3, 0) NULL,
	[FLDPNB] [numeric](3, 0) NULL,
	[FLATNB] [nvarchar](50) NULL,
	[FLHOME] [nvarchar](50) NULL,
	[FLINSR] [nvarchar](50) NULL,
	[FLALCH] [nvarchar](50) NULL,
	[FLRVMO] [numeric](2, 0) NULL,
	[FLRVTG] [numeric](7, 0) NULL,
	[FLOWNR] [nvarchar](50) NULL,
	[FLVALU] [numeric](9, 0) NULL,
	[FLDESG] [nvarchar](50) NULL,
	[FLPAYE] [nvarchar](50) NULL,
	[FLREVP] [numeric](4, 3) NULL,
	[FLSTRT] [numeric](7, 2) NULL,
	[FLABDT] [numeric](8, 0) NULL,
	[FLCRDT] [numeric](8, 0) NULL,
	[FLLCDT] [numeric](8, 0) NULL,
	[FLDBDT] [numeric](8, 0) NULL,
	[FLUSER] [nvarchar](50) NULL,
	[FLCHDT] [numeric](8, 0) NULL,
	[FLCLDT] [numeric](8, 0) NULL,
	[FLEFDT] [numeric](8, 0) NULL,
	[FLOWNI] [numeric](9, 2) NULL,
	[FLSELL] [numeric](9, 2) NULL,
	[FLTRAN] [nvarchar](50) NULL,
	[FLCLNB] [nvarchar](50) NULL,
	[FLAPVN] [nvarchar](50) NULL,
	[FLOWNT] [numeric](3, 0) NULL,
	[FLPSDO] [nvarchar](50) NULL,
	[FLLOIP] [nvarchar](50) NULL,
	[FLREDI] [nvarchar](50) NULL,
	[FLINDD] [numeric](8, 0) NULL,
	[FLSPR2] [numeric](9, 2) NULL,
	[FLCATG] [nvarchar](50) NULL,
	[FLSPR4] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUNSAIL_ST_FLPASSLK]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUNSAIL_ST_FLPASSLK](
	[PLCLNO] [nvarchar](9) NULL,
	[PLPASS#] [numeric](2, 0) NULL,
	[PLREF#] [nvarchar](9) NULL,
	[PLTYPE] [nvarchar](1) NULL,
	[PLSTATUS] [nvarchar](1) NULL,
	[PLAGE] [nvarchar](1) NULL,
	[PLNUMB] [nvarchar](6) NULL,
	[PLROUTE] [numeric](10, 0) NULL,
	[PLUSID] [nvarchar](10) NULL,
	[PLMNUS] [nvarchar](10) NULL,
	[PLMNWS] [nvarchar](10) NULL,
	[PLMNDT] [numeric](8, 0) NULL,
	[PLMNTM] [numeric](6, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUNSAIL_ST_FLROUTE]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUNSAIL_ST_FLROUTE](
	[RTCODE] [nvarchar](10) NULL,
	[RTDESC] [nvarchar](25) NULL,
	[RTUSID] [nvarchar](10) NULL,
	[RTMNUS] [nvarchar](10) NULL,
	[RTMNWS] [nvarchar](10) NULL,
	[RTMNDT] [numeric](8, 0) NULL,
	[RTMNTM] [numeric](6, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUNSAIL_ST_FPMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUNSAIL_ST_FPMST](
	[FPFLNB] [nvarchar](10) NULL,
	[FPFLTY] [nvarchar](5) NULL,
	[FPUTCD] [nvarchar](1) NULL,
	[FPSTDT] [numeric](8, 0) NULL,
	[FPENDT] [numeric](8, 0) NULL,
	[FPAUTO] [nvarchar](1) NULL,
	[FPLOCT] [nvarchar](3) NULL,
	[FPUSER] [nvarchar](10) NULL,
	[FPETDT] [numeric](8, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUNSAIL_ST_FRMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUNSAIL_ST_FRMST](
	[FRLOCT] [nvarchar](3) NULL,
	[FRYCTY] [nvarchar](5) NULL,
	[FRCREW] [nvarchar](1) NULL,
	[FRRTTR] [nvarchar](1) NULL,
	[FREFDT] [numeric](8, 0) NULL,
	[FRSTDT] [numeric](8, 0) NULL,
	[FRFRAT] [numeric](12, 4) NULL,
	[FREACH] [numeric](12, 4) NULL,
	[FRDESG] [nvarchar](3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUNSAIL_ST_FTMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUNSAIL_ST_FTMST](
	[FTTYPE] [nvarchar](5) NULL,
	[FTCREW] [nvarchar](1) NULL,
	[FTNAME] [nvarchar](25) NULL,
	[FTMXPR] [numeric](3, 0) NULL,
	[FTMXMD] [numeric](3, 0) NULL,
	[FTMXFR] [numeric](3, 0) NULL,
	[FTMXTA] [numeric](3, 0) NULL,
	[FTMXAU] [numeric](3, 0) NULL,
	[FTIPAX] [numeric](3, 0) NULL,
	[FTMXXX] [numeric](3, 0) NULL,
	[FTSIZE] [numeric](3, 0) NULL,
	[FTTPGR] [nvarchar](4) NULL,
	[FTHULL] [nvarchar](1) NULL,
	[FTACTV] [nvarchar](1) NULL,
	[FTDELP] [nvarchar](1) NULL,
	[FTYOWN] [nvarchar](1) NULL,
	[FTSRTG] [nvarchar](1) NULL,
	[FTSORT] [numeric](5, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUNSAIL_ST_IAMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUNSAIL_ST_IAMST](
	[IANUMB] [nvarchar](6) NULL,
	[IAADDR] [nvarchar](256) NULL,
	[IAETDT] [numeric](8, 0) NULL,
	[IAUSER] [nvarchar](10) NULL,
	[IACHDT] [numeric](8, 0) NULL,
	[IACHUS] [nvarchar](10) NULL,
	[IABSPM] [nvarchar](1) NULL,
	[IACSPM] [nvarchar](1) NULL,
	[IAFSPM] [nvarchar](1) NULL,
	[IAPSPM] [nvarchar](1) NULL,
	[IAACTV] [nvarchar](1) NULL,
	[IAPFMT] [nvarchar](3) NULL,
	[IAEMPW] [nvarchar](1) NULL,
	[IARUID] [nvarchar](10) NULL,
	[IAPSCD] [nvarchar](6) NULL,
	[IAPASS] [nvarchar](6) NULL,
	[IADATE] [numeric](8, 0) NULL,
	[IATIME] [numeric](6, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUNSAIL_ST_INTXRCNM]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUNSAIL_ST_INTXRCNM](
	[RCNUMB] [nvarchar](6) NULL,
	[RCCLNO] [nvarchar](9) NULL,
	[RCACRF] [nvarchar](9) NULL,
	[RCSTAT] [nvarchar](1) NULL,
	[RCCDTE] [nvarchar](20) NULL,
	[RCCTME] [nvarchar](20) NULL,
	[RCCUSR] [nvarchar](10) NULL,
	[RCCPGM] [nvarchar](10) NULL,
	[RCUDTE] [nvarchar](20) NULL,
	[RCUTME] [nvarchar](20) NULL,
	[RCUUSR] [nvarchar](10) NULL,
	[RCUPGM] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUNSAIL_ST_LSMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUNSAIL_ST_LSMST](
	[LSCODE] [nvarchar](2) NULL,
	[LSDESC] [nvarchar](30) NULL,
	[LSBKNG] [nvarchar](3) NULL,
	[LSCT01] [numeric](5, 0) NULL,
	[LSCT02] [numeric](5, 0) NULL,
	[LSCT03] [numeric](5, 0) NULL,
	[LSCT04] [numeric](5, 0) NULL,
	[LSCT05] [numeric](5, 0) NULL,
	[LSCT06] [numeric](5, 0) NULL,
	[LSCT07] [numeric](5, 0) NULL,
	[LSCT08] [numeric](5, 0) NULL,
	[LSCT09] [numeric](5, 0) NULL,
	[LSCT10] [numeric](5, 0) NULL,
	[LSCT11] [numeric](5, 0) NULL,
	[LSCT12] [numeric](5, 0) NULL,
	[LSTOT1] [numeric](5, 0) NULL,
	[LSTOT2] [numeric](5, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUNSAIL_ST_MKMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUNSAIL_ST_MKMST](
	[MKCLNB] [nvarchar](6) NULL,
	[MKCODE] [nvarchar](10) NULL,
	[MKCTCD] [nvarchar](6) NULL,
	[MKBROCH] [nvarchar](1) NULL,
	[MKDMAIL] [nvarchar](1) NULL,
	[MKEMAIL] [nvarchar](1) NULL,
	[MKPHONE] [nvarchar](1) NULL,
	[MKESMS] [nvarchar](1) NULL,
	[MKMNUS] [nvarchar](10) NULL,
	[MKMNWS] [nvarchar](10) NULL,
	[MKMNDT] [numeric](8, 0) NULL,
	[MKMNTM] [numeric](6, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUNSAIL_ST_PASSENGER]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUNSAIL_ST_PASSENGER](
	[PACLIENT] [nvarchar](9) NULL,
	[PAMAIL] [nvarchar](11) NULL,
	[PAFAM#] [nvarchar](5) NULL,
	[PAPASS#] [numeric](2, 0) NULL,
	[PASALU] [nvarchar](10) NULL,
	[PAFNAM] [nvarchar](40) NULL,
	[PAMNAM] [nvarchar](40) NULL,
	[PANAME] [nvarchar](40) NULL,
	[PACONO] [nvarchar](40) NULL,
	[PAADDR1] [nvarchar](40) NULL,
	[PAADDR2] [nvarchar](40) NULL,
	[PAADDR3] [nvarchar](40) NULL,
	[PACITY] [nvarchar](40) NULL,
	[PASTATE] [nvarchar](40) NULL,
	[PAZIPC] [nvarchar](12) NULL,
	[PACTRY] [nvarchar](40) NULL,
	[PANAT] [nvarchar](4) NULL,
	[PADAYPH] [nvarchar](20) NULL,
	[PAEVEPH] [nvarchar](20) NULL,
	[PAT1DESC] [nvarchar](20) NULL,
	[PATEL1] [nvarchar](20) NULL,
	[PAT2DESC] [nvarchar](20) NULL,
	[PATEL2] [nvarchar](20) NULL,
	[PAT3DESC] [nvarchar](20) NULL,
	[PATEL3] [nvarchar](20) NULL,
	[PATF1DESC] [nvarchar](20) NULL,
	[PAFAX1] [nvarchar](20) NULL,
	[PAEMAIL] [nvarchar](60) NULL,
	[PASEX] [nvarchar](1) NULL,
	[PADOB] [numeric](8, 0) NULL,
	[PAADULT] [nvarchar](1) NULL,
	[PAYEARS] [numeric](3, 0) NULL,
	[PAMONTHS] [numeric](2, 0) NULL,
	[PAYOB] [numeric](4, 0) NULL,
	[PAOCCUPA] [nvarchar](4) NULL,
	[PAPASSPT] [nvarchar](12) NULL,
	[PAPPDATE] [numeric](8, 0) NULL,
	[PAPPEDTE] [numeric](8, 0) NULL,
	[PAPPPLAC] [nvarchar](60) NULL,
	[PAPPNATN] [nvarchar](20) NULL,
	[PASMOKER] [nvarchar](1) NULL,
	[PAVEG] [nvarchar](1) NULL,
	[PATOD] [nvarchar](1) NULL,
	[PAINSRQ] [nvarchar](1) NULL,
	[PAINPOL] [nvarchar](20) NULL,
	[PASTDT] [numeric](8, 0) NULL,
	[PAENDT] [numeric](8, 0) NULL,
	[PATRANF] [nvarchar](1) NULL,
	[PAMSOFT] [nvarchar](6) NULL,
	[PALOGBK] [nvarchar](1) NULL,
	[PAWTRPRF] [nvarchar](1) NULL,
	[PAMAILLST] [nvarchar](1) NULL,
	[PABIRTHPL] [nvarchar](60) NULL,
	[PASAILEXP] [numeric](10, 0) NULL,
	[PASKIPPER] [nvarchar](1) NULL,
	[PAREDRESS#] [nvarchar](13) NULL,
	[PANUMB] [nvarchar](6) NULL,
	[PACLNB] [nvarchar](6) NULL,
	[PAUSID] [nvarchar](10) NULL,
	[PAMNUS] [nvarchar](10) NULL,
	[PAMNWS] [nvarchar](10) NULL,
	[PAMNDT] [numeric](8, 0) NULL,
	[PAMNTM] [numeric](6, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUNSAIL_ST_PTMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUNSAIL_ST_PTMST](
	[PTCDRF] [nvarchar](10) NULL,
	[PTCLAS] [nvarchar](1) NULL,
	[PTSCLS] [nvarchar](1) NULL,
	[PTDESC] [nvarchar](30) NULL,
	[PTCMNB] [numeric](3, 0) NULL,
	[PTDPNB] [numeric](3, 0) NULL,
	[PTATNB] [nvarchar](15) NULL,
	[PTLOCT] [nvarchar](3) NULL,
	[PTWEBS] [nvarchar](1) NULL,
	[PTPROM] [nvarchar](1) NULL,
	[PTFORM] [nvarchar](20) NULL,
	[PTWGRP] [nvarchar](1) NULL,
	[PTBRND] [nvarchar](1) NULL,
	[PTHTML] [nvarchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUNSAIL_ST_QNMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUNSAIL_ST_QNMST](
	[QNNUMB] [nvarchar](6) NULL,
	[QNCLNB] [nvarchar](6) NULL,
	[QNCLN2] [nvarchar](6) NULL,
	[QNSTDT] [numeric](8, 0) NULL,
	[QNENDT] [numeric](8, 0) NULL,
	[QNARDT] [numeric](8, 0) NULL,
	[QNCANX] [nvarchar](4) NULL,
	[QNPERS] [numeric](3, 0) NULL,
	[QNBDEP] [numeric](9, 2) NULL,
	[QNFDEP] [numeric](9, 2) NULL,
	[QNSTUS] [nvarchar](1) NULL,
	[QNUSER] [nvarchar](10) NULL,
	[QNETDT] [numeric](8, 0) NULL,
	[QNCHDT] [numeric](8, 0) NULL,
	[QNCNTR] [nvarchar](1) NULL,
	[QNRSUM] [nvarchar](1) NULL,
	[QNPRVS] [nvarchar](1) NULL,
	[QNBVRG] [nvarchar](1) NULL,
	[QNGUST] [nvarchar](1) NULL,
	[QNPREF] [nvarchar](1) NULL,
	[QNBTOT] [numeric](9, 2) NULL,
	[QNFTOT] [numeric](9, 2) NULL,
	[QNDESG] [nvarchar](3) NULL,
	[QNTYPE] [nvarchar](3) NULL,
	[QNWAIT] [nvarchar](1) NULL,
	[QNBMIT] [nvarchar](1) NULL,
	[QNCSPR] [nvarchar](1) NULL,
	[QNPRNT] [nvarchar](1) NULL,
	[QNTRNS] [nvarchar](1) NULL,
	[QNSALU] [nvarchar](10) NULL,
	[QNFNAM] [nvarchar](40) NULL,
	[QNNAME] [nvarchar](40) NULL,
	[QNSAL2] [nvarchar](10) NULL,
	[QNFNA2] [nvarchar](40) NULL,
	[QNNAM2] [nvarchar](40) NULL,
	[QNSTCD] [nvarchar](2) NULL,
	[QNNBCH] [numeric](3, 0) NULL,
	[QNCMDR] [nvarchar](1) NULL,
	[QNCLAS] [nvarchar](1) NULL,
	[QNGRPN] [nvarchar](10) NULL,
	[QNPSTY] [nvarchar](2) NULL,
	[QNBKNG] [nvarchar](3) NULL,
	[QNLOC1] [nvarchar](3) NULL,
	[QNLOC2] [nvarchar](3) NULL,
	[QNLOC3] [nvarchar](3) NULL,
	[QNLOC4] [nvarchar](3) NULL,
	[QNDTE1] [numeric](8, 0) NULL,
	[QNDTE4] [numeric](8, 0) NULL,
	[QNTME1] [numeric](4, 0) NULL,
	[QNTME2] [numeric](4, 0) NULL,
	[QNTME3] [numeric](4, 0) NULL,
	[QNTME4] [numeric](4, 0) NULL,
	[QNFLT1] [nvarchar](5) NULL,
	[QNFLTY] [nvarchar](5) NULL,
	[QNBOAT] [nvarchar](30) NULL,
	[QNOFID] [nvarchar](10) NULL,
	[QNRCLS] [nvarchar](1) NULL,
	[QNFUSR] [nvarchar](10) NULL,
	[QNFDTE] [numeric](8, 0) NULL,
	[QNDISC] [numeric](3, 3) NULL,
	[QNBFLT] [numeric](9, 2) NULL,
	[QNFFLT] [numeric](9, 2) NULL,
	[QNBDLV] [numeric](9, 2) NULL,
	[QNFDLV] [numeric](9, 2) NULL,
	[QNCODE] [nvarchar](1) NULL,
	[QNINVC] [numeric](8, 0) NULL,
	[QNOPTN] [nvarchar](1) NULL,
	[QNINVP] [numeric](8, 0) NULL,
	[QNPACK] [nvarchar](10) NULL,
	[QNTIME] [numeric](6, 0) NULL,
	[QNUPD1] [nvarchar](1) NULL,
	[QNUPD2] [nvarchar](1) NULL,
	[QNLSCB] [numeric](8, 0) NULL,
	[QNNXCB] [numeric](8, 0) NULL,
	[QNLSDT] [numeric](8, 0) NULL,
	[QNLSCD] [nvarchar](2) NULL,
	[QNUPD3] [nvarchar](1) NULL,
	[QNUPD4] [nvarchar](1) NULL,
	[QNUPD5] [nvarchar](1) NULL,
	[QNUPD6] [nvarchar](1) NULL,
	[QNDAT1] [numeric](8, 0) NULL,
	[QNDAT2] [numeric](8, 0) NULL,
	[QNDAT3] [numeric](8, 0) NULL,
	[QNDAT4] [numeric](8, 0) NULL,
	[QNAMT1] [numeric](9, 2) NULL,
	[QNAMT2] [numeric](9, 2) NULL,
	[QNAMT3] [numeric](9, 2) NULL,
	[QNAMT4] [numeric](9, 2) NULL,
	[QNDES1] [nvarchar](30) NULL,
	[QNDES2] [nvarchar](30) NULL,
	[QNDES3] [nvarchar](30) NULL,
	[QNDES4] [nvarchar](10) NULL,
	[QNDES5] [nvarchar](10) NULL,
	[QNDES6] [nvarchar](3) NULL,
	[QNDES7] [nvarchar](3) NULL,
	[QNCONO] [nvarchar](2) NULL,
	[QNSRCD] [nvarchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUNSAIL_ST_SUNMRMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUNSAIL_ST_SUNMRMST](
	[SNCODE] [nvarchar](5) NULL,
	[SNDESC] [nvarchar](20) NULL,
	[SNSLCD] [nvarchar](1) NULL,
	[SNBKG1] [nvarchar](3) NULL,
	[SNWEBS] [nvarchar](1) NULL,
	[SNBRND] [nvarchar](1) NULL,
	[SNINHS] [nvarchar](1) NULL,
	[SNITRN] [nvarchar](1) NULL,
	[SNMNUS] [nvarchar](10) NULL,
	[SNMNWS] [nvarchar](10) NULL,
	[SNMNDT] [numeric](8, 0) NULL,
	[SNMNTM] [numeric](6, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUNSAIL_ST_TBMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUNSAIL_ST_TBMST](
	[TBDATE] [numeric](8, 0) NULL,
	[TBUSER] [nvarchar](10) NULL,
	[TBCLNB] [nvarchar](6) NULL,
	[TBQNTY] [numeric](2, 0) NULL,
	[TBCODE] [nvarchar](10) NULL,
	[TBPDTE] [numeric](8, 0) NULL,
	[TBPRNT] [nvarchar](1) NULL,
	[TBLSCB] [numeric](8, 0) NULL,
	[TBNXCB] [numeric](8, 0) NULL,
	[TBAREA] [nvarchar](6) NULL,
	[TBSEAS] [nvarchar](6) NULL,
	[TBLSDT] [numeric](8, 0) NULL,
	[TBLSCD] [nvarchar](2) NULL,
	[TBBKNG] [nvarchar](3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUNSAIL_ST_TGMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUNSAIL_ST_TGMST](
	[TGTYPE] [nvarchar](4) NULL,
	[TGDESC] [nvarchar](25) NULL,
	[TGCABS] [numeric](1, 0) NULL,
	[TGHEAD] [numeric](1, 0) NULL,
	[TGSHOW] [numeric](1, 0) NULL,
	[TGWATR] [numeric](3, 0) NULL,
	[TGSAIL] [numeric](4, 0) NULL,
	[TGENGI] [nvarchar](15) NULL,
	[TGLOAF] [numeric](3, 0) NULL,
	[TGLOAI] [numeric](2, 0) NULL,
	[TGLWLF] [numeric](3, 0) NULL,
	[TGLWLI] [numeric](2, 0) NULL,
	[TGBEMF] [numeric](3, 0) NULL,
	[TGBEMI] [numeric](2, 0) NULL,
	[TGDFTF] [numeric](3, 0) NULL,
	[TGDFTI] [numeric](2, 0) NULL,
	[TGHORS] [numeric](3, 0) NULL,
	[TGFUEL] [numeric](3, 0) NULL,
	[TGBLDR] [nvarchar](25) NULL,
	[TGDSPL] [numeric](6, 0) NULL,
	[TGANCH] [nvarchar](2) NULL,
	[TGCHAN] [nvarchar](3) NULL,
	[TGRODE] [nvarchar](3) NULL,
	[TGFRIG] [numeric](3, 1) NULL,
	[TGNEWB] [nvarchar](1) NULL,
	[TGWIND] [nvarchar](1) NULL,
	[TGPWRI] [nvarchar](1) NULL,
	[TGHEDF] [numeric](1, 0) NULL,
	[TGHEDI] [numeric](2, 0) NULL,
	[TGBFLF] [numeric](1, 0) NULL,
	[TGBFLI] [numeric](2, 0) NULL,
	[TGBFWF] [numeric](1, 0) NULL,
	[TGBFWI] [numeric](2, 0) NULL,
	[TGBALF] [numeric](1, 0) NULL,
	[TGBALI] [numeric](2, 0) NULL,
	[TGBAWF] [numeric](1, 0) NULL,
	[TGBAWI] [numeric](2, 0) NULL,
	[TGHTML] [nvarchar](25) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUNSAIL_ST_USMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUNSAIL_ST_USMST](
	[USRGRP] [nvarchar](2) NULL,
	[USRPRF] [nvarchar](10) NULL,
	[USRNAM] [nvarchar](50) NULL,
	[USFNAM] [nvarchar](35) NULL,
	[USOUTQ] [nvarchar](10) NULL,
	[USEMAL] [nvarchar](30) NULL,
	[USEXTN] [nvarchar](4) NULL,
	[USSELF] [nvarchar](64) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUNSAIL_ST_XXMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUNSAIL_ST_XXMST](
	[XXHULL] [nvarchar](10) NULL,
	[XXCRDT] [numeric](8, 0) NULL,
	[XXLCDT] [numeric](8, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUNSAIL_ST_YHMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUNSAIL_ST_YHMST](
	[CHCNNB] [nvarchar](6) NULL,
	[CHCLNB] [nvarchar](6) NULL,
	[CHCLN2] [nvarchar](6) NULL,
	[CHAGNT] [nvarchar](10) NULL,
	[CHSTDT] [numeric](8, 0) NULL,
	[CHENDT] [numeric](8, 0) NULL,
	[CHNBDY] [numeric](3, 0) NULL,
	[CHFLNB] [nvarchar](10) NULL,
	[CHFLTY] [nvarchar](5) NULL,
	[CHFLCR] [nvarchar](1) NULL,
	[CHETDT] [numeric](8, 0) NULL,
	[CHCNDT] [numeric](8, 0) NULL,
	[CHDPDT] [numeric](8, 0) NULL,
	[CHDRDT] [numeric](8, 0) NULL,
	[CHFLAM] [numeric](9, 2) NULL,
	[CHACAM] [numeric](9, 2) NULL,
	[CHPRAM] [numeric](9, 2) NULL,
	[CHEXAM] [numeric](9, 2) NULL,
	[CHCMAM] [numeric](9, 2) NULL,
	[CHFSAM] [numeric](9, 2) NULL,
	[CHDSAM] [numeric](9, 2) NULL,
	[CHMSAM] [numeric](9, 2) NULL,
	[CHBVAM] [numeric](9, 2) NULL,
	[CHTXAM] [numeric](9, 2) NULL,
	[CHINAM] [numeric](9, 2) NULL,
	[CHOTHR] [numeric](9, 2) NULL,
	[CHTLAM] [numeric](9, 2) NULL,
	[CHCNTY] [nvarchar](3) NULL,
	[CHPSTY] [nvarchar](2) NULL,
	[CHDESG] [nvarchar](3) NULL,
	[CHNBPR] [numeric](3, 0) NULL,
	[CHDLVY] [numeric](9, 2) NULL,
	[CHFRLC] [nvarchar](3) NULL,
	[CHTOLC] [nvarchar](3) NULL,
	[CHBKNG] [nvarchar](3) NULL,
	[CHOPTN] [nvarchar](1) NULL,
	[CHCALC] [numeric](9, 4) NULL,
	[CHMAIL] [nvarchar](1) NULL,
	[CHCODE] [nvarchar](1) NULL,
	[CHOWNT] [numeric](3, 0) NULL,
	[CHCOMP] [numeric](3, 0) NULL,
	[CHSPR1] [numeric](8, 0) NULL,
	[CHSPR2] [numeric](3, 0) NULL,
	[CHSPR3] [nvarchar](1) NULL,
	[CHPACK] [nvarchar](10) NULL,
	[CHCTAG] [nvarchar](2) NULL,
	[CHSPR4] [nvarchar](4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUNSAIL_ST_ZIMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUNSAIL_ST_ZIMST](
	[CIRCID] [nvarchar](1) NULL,
	[CICNNB] [nvarchar](6) NULL,
	[CINUMB] [numeric](3, 0) NULL,
	[CICLNB] [nvarchar](6) NULL,
	[CIQNTY] [numeric](5, 0) NULL,
	[CIPERS] [numeric](2, 0) NULL,
	[CICLAS] [nvarchar](1) NULL,
	[CISCLS] [nvarchar](1) NULL,
	[CICANC] [nvarchar](1) NULL,
	[CIDESC] [nvarchar](30) NULL,
	[CIOFID] [nvarchar](10) NULL,
	[CIAMNT] [numeric](9, 2) NULL,
	[CIFAMT] [numeric](9, 2) NULL,
	[CIDISC] [numeric](3, 3) NULL,
	[CIBDSC] [numeric](9, 2) NULL,
	[CIFDSC] [numeric](9, 2) NULL,
	[CIBVAT] [numeric](9, 2) NULL,
	[CIFVAT] [numeric](9, 2) NULL,
	[CITAPR] [numeric](3, 3) NULL,
	[CIBCOM] [numeric](9, 2) NULL,
	[CIFCOM] [numeric](9, 2) NULL,
	[CICNST] [numeric](8, 0) NULL,
	[CICNEN] [numeric](8, 0) NULL,
	[CIETDT] [numeric](8, 0) NULL,
	[CICHDT] [numeric](8, 0) NULL,
	[CIUSER] [nvarchar](10) NULL,
	[CISTDT] [numeric](8, 0) NULL,
	[CIENDT] [numeric](8, 0) NULL,
	[CIEXTR] [nvarchar](21) NULL,
	[CILOCT] [nvarchar](3) NULL,
	[CIPACK] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUNSAIL_ST_ZNMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUNSAIL_ST_ZNMST](
	[CNNUMB] [nvarchar](6) NULL,
	[CNCLNB] [nvarchar](6) NULL,
	[CNCLN2] [nvarchar](6) NULL,
	[CNSTDT] [numeric](8, 0) NULL,
	[CNENDT] [numeric](8, 0) NULL,
	[CNARDT] [numeric](8, 0) NULL,
	[CNCANX] [nvarchar](4) NULL,
	[CNPERS] [numeric](3, 0) NULL,
	[CNBDEP] [numeric](9, 2) NULL,
	[CNFDEP] [numeric](9, 2) NULL,
	[CNSTUS] [nvarchar](1) NULL,
	[CNUSER] [nvarchar](10) NULL,
	[CNETDT] [numeric](8, 0) NULL,
	[CNCHDT] [numeric](8, 0) NULL,
	[CNCNTR] [nvarchar](1) NULL,
	[CNRSUM] [nvarchar](1) NULL,
	[CNPRVS] [nvarchar](1) NULL,
	[CNBVRG] [nvarchar](1) NULL,
	[CNGUST] [nvarchar](1) NULL,
	[CNPREF] [nvarchar](1) NULL,
	[CNLIAB] [nvarchar](1) NULL,
	[CNBTOT] [numeric](9, 2) NULL,
	[CNFTOT] [numeric](9, 2) NULL,
	[CNDESG] [nvarchar](3) NULL,
	[CNTYPE] [nvarchar](3) NULL,
	[CNWAIT] [nvarchar](1) NULL,
	[CNBMIT] [nvarchar](1) NULL,
	[CNCSPR] [nvarchar](1) NULL,
	[CNPRNT] [nvarchar](1) NULL,
	[CNTRNS] [nvarchar](1) NULL,
	[CNSALU] [nvarchar](10) NULL,
	[CNFNAM] [nvarchar](40) NULL,
	[CNNAME] [nvarchar](40) NULL,
	[CNSAL2] [nvarchar](10) NULL,
	[CNFNA2] [nvarchar](40) NULL,
	[CNNAM2] [nvarchar](40) NULL,
	[CNSTCD] [nvarchar](2) NULL,
	[CNNBCH] [numeric](3, 0) NULL,
	[CNCMDR] [nvarchar](1) NULL,
	[CNCLAS] [nvarchar](1) NULL,
	[CNGRPN] [nvarchar](10) NULL,
	[CNPSTY] [nvarchar](2) NULL,
	[CNBKNG] [nvarchar](3) NULL,
	[CNLOC1] [nvarchar](3) NULL,
	[CNLOC2] [nvarchar](3) NULL,
	[CNLOC3] [nvarchar](3) NULL,
	[CNLOC4] [nvarchar](3) NULL,
	[CNDTE1] [numeric](8, 0) NULL,
	[CNDTE4] [numeric](8, 0) NULL,
	[CNTME1] [numeric](4, 0) NULL,
	[CNTME2] [numeric](4, 0) NULL,
	[CNTME3] [numeric](4, 0) NULL,
	[CNTME4] [numeric](4, 0) NULL,
	[CNFLT1] [nvarchar](5) NULL,
	[CNFLTY] [nvarchar](5) NULL,
	[CNBOAT] [nvarchar](30) NULL,
	[CNOFID] [nvarchar](10) NULL,
	[CNRCLS] [nvarchar](1) NULL,
	[CNFUSR] [nvarchar](10) NULL,
	[CNFDTE] [numeric](8, 0) NULL,
	[CNDISC] [numeric](3, 3) NULL,
	[CNBFLT] [numeric](9, 2) NULL,
	[CNFFLT] [numeric](9, 2) NULL,
	[CNBDLV] [numeric](9, 2) NULL,
	[CNFDLV] [numeric](9, 2) NULL,
	[CNBMSC] [numeric](9, 2) NULL,
	[CNFMSC] [numeric](9, 2) NULL,
	[CNBDSC] [numeric](9, 2) NULL,
	[CNFDSC] [numeric](9, 2) NULL,
	[CNBVAT] [numeric](9, 2) NULL,
	[CNFVAT] [numeric](9, 2) NULL,
	[CNBCOM] [numeric](9, 2) NULL,
	[CNFCOM] [numeric](9, 2) NULL,
	[CNCODE] [nvarchar](1) NULL,
	[CNINVC] [numeric](8, 0) NULL,
	[CNOPTN] [nvarchar](1) NULL,
	[CNINVP] [numeric](8, 0) NULL,
	[CNPACK] [nvarchar](10) NULL,
	[CNTIME] [numeric](6, 0) NULL,
	[CNUPD1] [nvarchar](1) NULL,
	[CNUPD2] [nvarchar](1) NULL,
	[CNUPD3] [nvarchar](1) NULL,
	[CNUPD4] [nvarchar](1) NULL,
	[CNUPD5] [nvarchar](1) NULL,
	[CNUPD6] [nvarchar](1) NULL,
	[CNDAT1] [numeric](8, 0) NULL,
	[CNDAT2] [numeric](8, 0) NULL,
	[CNDAT3] [numeric](8, 0) NULL,
	[CNDAT4] [numeric](8, 0) NULL,
	[CNAMT1] [numeric](9, 2) NULL,
	[CNAMT2] [numeric](9, 2) NULL,
	[CNAMT3] [numeric](9, 2) NULL,
	[CNAMT4] [numeric](9, 2) NULL,
	[CNDES1] [nvarchar](30) NULL,
	[CNDES2] [nvarchar](30) NULL,
	[CNDES3] [nvarchar](30) NULL,
	[CNDES4] [nvarchar](10) NULL,
	[CNDES5] [nvarchar](10) NULL,
	[CNDES6] [nvarchar](3) NULL,
	[CNDES7] [nvarchar](3) NULL,
	[CNCONO] [nvarchar](2) NULL,
	[CNSRCD] [nvarchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUNSAIL_ST_ZRMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUNSAIL_ST_ZRMST](
	[CRDATE] [numeric](8, 0) NULL,
	[CRTIME] [numeric](10, 0) NULL,
	[CRUSER] [nvarchar](20) NULL,
	[CRCNNB] [nvarchar](6) NULL,
	[CRREFR] [nvarchar](20) NULL,
	[CRCCTY] [nvarchar](16) NULL,
	[CRCCDT] [numeric](6, 0) NULL,
	[CRCCAC] [nvarchar](11) NULL,
	[CRBSAM] [numeric](11, 2) NULL,
	[CRFRAM] [numeric](11, 2) NULL,
	[CRDESG] [nvarchar](20) NULL,
	[CRLORR] [nvarchar](20) NULL,
	[CRTYPE] [nvarchar](4) NULL,
	[CRNBEN] [numeric](3, 0) NULL,
	[CRLOCT] [nvarchar](3) NULL,
	[CRRCVD] [nvarchar](8) NULL,
	[CRORGN] [nvarchar](11) NULL,
	[CRRITA] [nvarchar](32) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRITON_LOG]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRITON_LOG](
	[Schema] [varchar](50) NULL,
	[LogFileName] [nvarchar](50) NULL,
	[LogSchemaExtract] [nvarchar](250) NULL,
	[LogDate] [smalldatetime] NULL,
	[PassFail] [varchar](10) NULL,
	[LogText] [nvarchar](250) NULL,
	[LogTextTransferred] [nvarchar](250) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRITON_ROW_COUNT_MAP]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRITON_ROW_COUNT_MAP](
	[DB] [varchar](20) NULL,
	[a_FileName] [varchar](50) NULL,
	[a_LogFileName] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRITON_ROW_COUNTS]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRITON_ROW_COUNTS](
	[a_DataBase] [varchar](50) NULL,
	[a_Name] [varchar](50) NULL,
	[a_Row_Count] [varchar](50) NULL,
	[i_SK_Rownumber] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRITON_SFT_ALLOCATION]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRITON_SFT_ALLOCATION](
	[i_SK_Calendar] [bigint] NOT NULL,
	[i_SK_InventoryDate] [bigint] NULL,
	[i_SK_SaleDate] [bigint] NULL,
	[i_SK_BookedDate] [bigint] NULL,
	[i_SK_CancelDate] [bigint] NULL,
	[i_BK_BookingStatus] [smallint] NULL,
	[i_BK_FLNUMB] [nvarchar](50) NULL,
	[i_BK_FLTY] [nvarchar](50) NULL,
	[i_BK_CNNB] [nvarchar](6) NULL,
	[i_BK_CLNB] [nvarchar](6) NULL,
	[i_BK_AUTO] [nvarchar](1) NULL,
	[i_BK_LOCT] [nvarchar](3) NULL,
	[i_BK_FRLOCT] [nvarchar](3) NULL,
	[i_BK_TOLOCT] [nvarchar](3) NULL,
	[i_BK_DEST] [nvarchar](3) NULL,
	[i_BK_SourceSysID] [int] NULL,
	[i_BK_SourceSys] [nvarchar](10) NULL,
	[i_BK_DivisionCode] [nvarchar](1) NULL,
	[i_BK_BrandCode] [nvarchar](3) NULL,
	[i_BK_CompanyCode] [int] NULL,
	[i_BK_BkgSrcCd] [nvarchar](12) NULL,
	[i_BK_OpenBase] [nvarchar](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRITON_SFT_RATES]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRITON_SFT_RATES](
	[i_BK_LOCT] [nvarchar](3) NULL,
	[i_BK_FLTY] [nvarchar](5) NULL,
	[i_BK_CREW] [nvarchar](1) NULL,
	[i_SK_EffFrom] [bigint] NULL,
	[i_SK_EffTo] [bigint] NULL,
	[EffNum] [int] NULL,
	[i_SK_StartDate] [bigint] NULL,
	[i_SK_EndDate] [bigint] NULL,
	[a_Rate] [numeric](9, 4) NULL,
	[a_RatePerPerson] [numeric](9, 4) NULL,
	[a_Currency] [nvarchar](3) NULL,
	[i_BK_SourceSysID] [int] NULL,
	[i_BK_SourceSys] [nvarchar](10) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_CL_TRITON_SFT_RATES]    Script Date: 24/08/2018 12:45:34 ******/
CREATE CLUSTERED INDEX [IX_CL_TRITON_SFT_RATES] ON [dbo].[TRITON_SFT_RATES]
(
	[i_BK_LOCT] ASC,
	[i_BK_FLTY] ASC,
	[a_Currency] ASC,
	[i_SK_EffFrom] ASC,
	[i_SK_StartDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRITON_SFT_RATESSTAGE]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRITON_SFT_RATESSTAGE](
	[i_BK_LOCT] [nvarchar](3) NULL,
	[i_BK_FLTY] [nvarchar](5) NULL,
	[a_Currency] [nvarchar](3) NULL,
	[i_BK_CREW] [nvarchar](1) NULL,
	[i_SK_EffFromFirst] [bigint] NULL,
	[EffNumFirst] [int] NULL,
	[i_SK_StartDateFirst] [bigint] NULL,
	[a_RateFirst] [numeric](9, 4) NULL,
	[a_RatePerPersonFirst] [numeric](9, 4) NULL,
	[i_SK_EffFromSecond] [bigint] NULL,
	[EffNumSecond] [int] NULL,
	[i_SK_StartDateSecond] [bigint] NULL,
	[i_SK_EndDateSecond] [bigint] NULL,
	[a_RateSecond] [numeric](9, 4) NULL,
	[a_RatePerPersonSecond] [numeric](9, 4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRITON_ST_AMMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRITON_ST_AMMST](
	[AMNUMB] [nvarchar](10) NULL,
	[AMRCNB] [int] NULL,
	[AMDATA] [nvarchar](80) NULL,
	[AMUSER] [nvarchar](15) NULL,
	[AMETDT] [int] NULL,
	[AMETTM] [int] NULL,
	[AMCGUS] [nvarchar](15) NULL,
	[AMCGDT] [int] NULL,
	[AMCGTM] [int] NULL,
	[AMUPDT] [nvarchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRITON_ST_ATMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRITON_ST_ATMST](
	[ATLOCT] [nvarchar](4) NULL,
	[ATTYPE] [nvarchar](5) NULL,
	[ATNAME] [nvarchar](50) NULL,
	[ATCTIN] [nvarchar](2) NULL,
	[ATMXPR] [int] NULL,
	[ATNBRM] [int] NULL,
	[ATWAIT] [int] NULL,
	[ATCONO] [int] NULL,
	[ATDEPT] [int] NULL,
	[ATGLNO] [int] NULL,
	[ATACTV] [nvarchar](2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRITON_ST_BLMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRITON_ST_BLMST](
	[BLLOCT] [nvarchar](3) NULL,
	[BLAREA] [nvarchar](3) NULL,
	[BLCODE] [nvarchar](1) NULL,
	[BLTYPE] [nvarchar](1) NULL,
	[BLGLBL] [nvarchar](3) NULL,
	[BLNAME] [nvarchar](10) NULL,
	[BLCOMP] [nvarchar](1) NULL,
	[BLPORT] [nvarchar](25) NULL,
	[BLGLCN] [numeric](3, 0) NULL,
	[BLCMLN] [nvarchar](10) NULL,
	[BLACAV] [nvarchar](1) NULL,
	[BLLTPC] [numeric](5, 4) NULL,
	[BLATPC] [numeric](5, 4) NULL,
	[BLAGPC] [numeric](5, 4) NULL,
	[BLTXAM] [numeric](5, 2) NULL,
	[BLCNAM] [numeric](5, 2) NULL,
	[BLCHLN] [numeric](3, 0) NULL,
	[BLSTME] [numeric](4, 0) NULL,
	[BLETME] [numeric](4, 0) NULL,
	[BLTURN] [numeric](4, 0) NULL,
	[BLSTL1] [numeric](3, 0) NULL,
	[BLSTL2] [numeric](3, 0) NULL,
	[BLCTRY] [nvarchar](25) NULL,
	[BLTXCM] [nvarchar](1) NULL,
	[BLACCT] [nvarchar](3) NULL,
	[BLSORT] [numeric](3, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRITON_ST_BRMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRITON_ST_BRMST](
	[BRCODE] [nvarchar](10) NULL,
	[BRDESC] [nvarchar](30) NULL,
	[BRAVAL] [numeric](8, 0) NULL,
	[BRSTCK] [nvarchar](1) NULL,
	[BRGPCD] [nvarchar](2) NULL,
	[BRTOPC] [nvarchar](2) NULL,
	[BRGRUP] [nvarchar](2) NULL,
	[BRSTRO] [numeric](4, 0) NULL,
	[BRSTTS] [nvarchar](1) NULL,
	[BRFLUP] [nvarchar](1) NULL,
	[BRBRND] [nvarchar](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRITON_ST_BTMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRITON_ST_BTMST](
	[BTRDTE] [numeric](8, 0) NULL,
	[BTUSER] [nvarchar](10) NULL,
	[BTNUMB] [nvarchar](6) NULL,
	[BTQNTY] [numeric](3, 0) NULL,
	[BTUNMS] [nvarchar](2) NULL,
	[BTCODE] [nvarchar](10) NULL,
	[BTPDTE] [numeric](8, 0) NULL,
	[BTPRNT] [nvarchar](1) NULL,
	[BTPRIM] [nvarchar](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRITON_ST_CAMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRITON_ST_CAMST](
	[CALOCT] [nvarchar](3) NULL,
	[CACLAS] [nvarchar](1) NULL,
	[CASCLS] [nvarchar](1) NULL,
	[CAEFDT] [numeric](8, 0) NULL,
	[CASTDT] [numeric](8, 0) NULL,
	[CADESC] [nvarchar](25) NULL,
	[CATXPC] [numeric](5, 4) NULL,
	[CATPPC] [numeric](5, 4) NULL,
	[CACMCD] [nvarchar](1) NULL,
	[CADSCD] [nvarchar](1) NULL,
	[CATAXD] [nvarchar](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRITON_ST_CFMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRITON_ST_CFMST](
	[CFDESG] [nvarchar](3) NULL,
	[CFFACT] [numeric](9, 4) NULL,
	[CFTYPE] [nvarchar](1) NULL,
	[CFDATE] [numeric](8, 0) NULL,
	[CFUSER] [nvarchar](10) NULL,
	[CFETDT] [numeric](8, 0) NULL,
	[CFETTM] [numeric](6, 0) NULL,
	[CFCHUS] [nvarchar](10) NULL,
	[CFCHDT] [numeric](8, 0) NULL,
	[CFCHTM] [numeric](6, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRITON_ST_CHMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRITON_ST_CHMST](
	[CHCNNB] [nvarchar](6) NULL,
	[CHCLNB] [nvarchar](6) NULL,
	[CHCLN2] [nvarchar](6) NULL,
	[CHAGNT] [nvarchar](10) NULL,
	[CHSTDT] [numeric](8, 0) NULL,
	[CHENDT] [numeric](8, 0) NULL,
	[CHNBDY] [numeric](3, 0) NULL,
	[CHFLNB] [nvarchar](10) NULL,
	[CHFLTY] [nvarchar](5) NULL,
	[CHFLCR] [nvarchar](1) NULL,
	[CHETDT] [numeric](8, 0) NULL,
	[CHCNDT] [numeric](8, 0) NULL,
	[CHDPDT] [numeric](8, 0) NULL,
	[CHDRDT] [numeric](8, 0) NULL,
	[CHFLAM] [numeric](9, 2) NULL,
	[CHACAM] [numeric](9, 2) NULL,
	[CHPRAM] [numeric](9, 2) NULL,
	[CHEXAM] [numeric](9, 2) NULL,
	[CHCMAM] [numeric](9, 2) NULL,
	[CHFSAM] [numeric](9, 2) NULL,
	[CHDSAM] [numeric](9, 2) NULL,
	[CHMSAM] [numeric](9, 2) NULL,
	[CHBVAM] [numeric](9, 2) NULL,
	[CHTXAM] [numeric](9, 2) NULL,
	[CHINAM] [numeric](9, 2) NULL,
	[CHOTHR] [numeric](9, 2) NULL,
	[CHTLAM] [numeric](9, 2) NULL,
	[CHCNTY] [nvarchar](3) NULL,
	[CHPSTY] [nvarchar](2) NULL,
	[CHDESG] [nvarchar](3) NULL,
	[CHNBPR] [numeric](3, 0) NULL,
	[CHDLVY] [numeric](9, 2) NULL,
	[CHFRLC] [nvarchar](3) NULL,
	[CHTOLC] [nvarchar](3) NULL,
	[CHBKNG] [nvarchar](3) NULL,
	[CHOPTN] [nvarchar](1) NULL,
	[CHCALC] [numeric](9, 4) NULL,
	[CHMAIL] [nvarchar](1) NULL,
	[CHCODE] [nvarchar](1) NULL,
	[CHOWNT] [numeric](3, 0) NULL,
	[CHCOMP] [numeric](3, 0) NULL,
	[CHSPR1] [numeric](8, 0) NULL,
	[CHSPR2] [numeric](3, 0) NULL,
	[CHSPR3] [nvarchar](1) NULL,
	[CHPACK] [nvarchar](10) NULL,
	[CHCTAG] [nvarchar](2) NULL,
	[CHSPR4] [nvarchar](4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRITON_ST_CIMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRITON_ST_CIMST](
	[CIRCID] [nvarchar](1) NULL,
	[CICNNB] [nvarchar](6) NULL,
	[CINUMB] [numeric](3, 0) NULL,
	[CICLNB] [nvarchar](6) NULL,
	[CIQNTY] [numeric](5, 0) NULL,
	[CIPERS] [numeric](2, 0) NULL,
	[CICLAS] [nvarchar](1) NULL,
	[CISCLS] [nvarchar](1) NULL,
	[CICANC] [nvarchar](1) NULL,
	[CIDESC] [nvarchar](30) NULL,
	[CIOFID] [nvarchar](10) NULL,
	[CIAMNT] [numeric](9, 2) NULL,
	[CIFAMT] [numeric](9, 2) NULL,
	[CIDISC] [numeric](3, 3) NULL,
	[CIBDSC] [numeric](9, 2) NULL,
	[CIFDSC] [numeric](9, 2) NULL,
	[CIBVAT] [numeric](9, 2) NULL,
	[CIFVAT] [numeric](9, 2) NULL,
	[CITAPR] [numeric](3, 3) NULL,
	[CIBCOM] [numeric](9, 2) NULL,
	[CIFCOM] [numeric](9, 2) NULL,
	[CICNST] [numeric](8, 0) NULL,
	[CICNEN] [numeric](8, 0) NULL,
	[CIETDT] [numeric](8, 0) NULL,
	[CICHDT] [numeric](8, 0) NULL,
	[CIUSER] [nvarchar](10) NULL,
	[CISTDT] [numeric](8, 0) NULL,
	[CIENDT] [numeric](8, 0) NULL,
	[CIEXTR] [nvarchar](21) NULL,
	[CILOCT] [nvarchar](3) NULL,
	[CIPACK] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRITON_ST_CIMST_INTRADAY]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRITON_ST_CIMST_INTRADAY](
	[CIRCID] [nvarchar](1) NULL,
	[CICNNB] [nvarchar](6) NULL,
	[CINUMB] [numeric](3, 0) NULL,
	[CICLNB] [nvarchar](6) NULL,
	[CIQNTY] [numeric](5, 0) NULL,
	[CIPERS] [numeric](2, 0) NULL,
	[CICLAS] [nvarchar](1) NULL,
	[CISCLS] [nvarchar](1) NULL,
	[CICANC] [nvarchar](1) NULL,
	[CIDESC] [nvarchar](30) NULL,
	[CIOFID] [nvarchar](10) NULL,
	[CIAMNT] [numeric](9, 2) NULL,
	[CIFAMT] [numeric](9, 2) NULL,
	[CIDISC] [numeric](3, 3) NULL,
	[CIBDSC] [numeric](9, 2) NULL,
	[CIFDSC] [numeric](9, 2) NULL,
	[CIBVAT] [numeric](9, 2) NULL,
	[CIFVAT] [numeric](9, 2) NULL,
	[CITAPR] [numeric](3, 3) NULL,
	[CIBCOM] [numeric](9, 2) NULL,
	[CIFCOM] [numeric](9, 2) NULL,
	[CICNST] [numeric](8, 0) NULL,
	[CICNEN] [numeric](8, 0) NULL,
	[CIETDT] [numeric](8, 0) NULL,
	[CICHDT] [numeric](8, 0) NULL,
	[CIUSER] [nvarchar](10) NULL,
	[CISTDT] [numeric](8, 0) NULL,
	[CIENDT] [numeric](8, 0) NULL,
	[CIEXTR] [nvarchar](21) NULL,
	[CILOCT] [nvarchar](3) NULL,
	[CIPACK] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRITON_ST_CLMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRITON_ST_CLMST](
	[CLNUMB] [nvarchar](6) NULL,
	[CLSALU] [nvarchar](10) NULL,
	[CLFNAM] [nvarchar](40) NULL,
	[CLNAME] [nvarchar](40) NULL,
	[CLADD1] [nvarchar](40) NULL,
	[CLADD2] [nvarchar](40) NULL,
	[CLADD3] [nvarchar](40) NULL,
	[CLCITY] [nvarchar](30) NULL,
	[CLSTCD] [nvarchar](40) NULL,
	[CLZIPC] [nvarchar](12) NULL,
	[CLCTRY] [nvarchar](40) NULL,
	[CLHMPH] [nvarchar](20) NULL,
	[CLBSPH] [nvarchar](20) NULL,
	[CLBSEX] [nvarchar](4) NULL,
	[CLCEPH] [nvarchar](20) NULL,
	[CLFAX#] [nvarchar](20) NULL,
	[CLNBCH] [numeric](3, 0) NULL,
	[CLCMCL] [nvarchar](1) NULL,
	[CLCLS1] [nvarchar](1) NULL,
	[CLCLS2] [nvarchar](1) NULL,
	[CLLINK] [nvarchar](2) NULL,
	[CLRTTR] [nvarchar](1) NULL,
	[CLLSCN] [numeric](8, 0) NULL,
	[CLCNTP] [nvarchar](1) NULL,
	[CLTANB] [numeric](9, 0) NULL,
	[CLLSCH] [numeric](8, 0) NULL,
	[CLMRCD] [nvarchar](2) NULL,
	[CLMRC2] [nvarchar](2) NULL,
	[CLSPI1] [nvarchar](2) NULL,
	[CLSPI2] [nvarchar](2) NULL,
	[CLSPI3] [nvarchar](2) NULL,
	[CLPSTY] [nvarchar](2) NULL,
	[CLDESG] [nvarchar](3) NULL,
	[CLETDT] [numeric](8, 0) NULL,
	[CLUSER] [nvarchar](10) NULL,
	[CLCHDT] [numeric](8, 0) NULL,
	[CLCHUS] [nvarchar](10) NULL,
	[CLSIZE] [numeric](3, 0) NULL,
	[CLDISC] [numeric](4, 3) NULL,
	[CLCOMM] [numeric](4, 3) NULL,
	[CLDTE1] [numeric](8, 0) NULL,
	[CLDTE2] [numeric](8, 0) NULL,
	[CLDTE3] [numeric](8, 0) NULL,
	[CLDTE4] [numeric](8, 0) NULL,
	[CLDTE5] [numeric](8, 0) NULL,
	[CLDTE6] [numeric](8, 0) NULL,
	[CLDTE7] [numeric](8, 0) NULL,
	[CLDTE8] [numeric](8, 0) NULL,
	[CLBKNG] [nvarchar](3) NULL,
	[CLLSDT] [numeric](8, 0) NULL,
	[CLLSCD] [nvarchar](2) NULL,
	[CLBRTH] [numeric](8, 0) NULL,
	[CLALF1] [nvarchar](1) NULL,
	[CLALF2] [nvarchar](1) NULL,
	[CLALF3] [nvarchar](1) NULL,
	[CLALF4] [nvarchar](1) NULL,
	[CLALF5] [nvarchar](10) NULL,
	[CLCART] [nvarchar](4) NULL,
	[CLERCD] [nvarchar](4) NULL,
	[CLDVPT] [nvarchar](3) NULL,
	[CLCONO] [nvarchar](2) NULL,
	[CLORGP] [nvarchar](6) NULL,
	[CLORT1] [nvarchar](2) NULL,
	[CLORT2] [nvarchar](2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRITON_ST_CLMST_YASDLIB]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRITON_ST_CLMST_YASDLIB](
	[CLNUMB] [nvarchar](6) NULL,
	[CLSALU] [nvarchar](10) NULL,
	[CLFNAM] [nvarchar](40) NULL,
	[CLNAME] [nvarchar](40) NULL,
	[CLADD1] [nvarchar](40) NULL,
	[CLADD2] [nvarchar](40) NULL,
	[CLADD3] [nvarchar](40) NULL,
	[CLCITY] [nvarchar](30) NULL,
	[CLSTCD] [nvarchar](40) NULL,
	[CLZIPC] [nvarchar](12) NULL,
	[CLCTRY] [nvarchar](40) NULL,
	[CLHMPH] [nvarchar](20) NULL,
	[CLBSPH] [nvarchar](20) NULL,
	[CLBSEX] [nvarchar](4) NULL,
	[CLCEPH] [nvarchar](20) NULL,
	[CLFAX#] [nvarchar](20) NULL,
	[CLNBCH] [numeric](3, 0) NULL,
	[CLCMCL] [nvarchar](1) NULL,
	[CLCLS1] [nvarchar](1) NULL,
	[CLCLS2] [nvarchar](1) NULL,
	[CLLINK] [nvarchar](2) NULL,
	[CLRTTR] [nvarchar](1) NULL,
	[CLLSCN] [numeric](8, 0) NULL,
	[CLCNTP] [nvarchar](1) NULL,
	[CLTANB] [numeric](9, 0) NULL,
	[CLLSCH] [numeric](8, 0) NULL,
	[CLMRCD] [nvarchar](2) NULL,
	[CLMRC2] [nvarchar](2) NULL,
	[CLSPI1] [nvarchar](2) NULL,
	[CLSPI2] [nvarchar](2) NULL,
	[CLSPI3] [nvarchar](2) NULL,
	[CLPSTY] [nvarchar](2) NULL,
	[CLDESG] [nvarchar](3) NULL,
	[CLETDT] [numeric](8, 0) NULL,
	[CLUSER] [nvarchar](10) NULL,
	[CLCHDT] [numeric](8, 0) NULL,
	[CLCHUS] [nvarchar](10) NULL,
	[CLSIZE] [numeric](3, 0) NULL,
	[CLDISC] [numeric](4, 3) NULL,
	[CLCOMM] [numeric](4, 3) NULL,
	[CLDTE1] [numeric](8, 0) NULL,
	[CLDTE2] [numeric](8, 0) NULL,
	[CLDTE3] [numeric](8, 0) NULL,
	[CLDTE4] [numeric](8, 0) NULL,
	[CLDTE5] [numeric](8, 0) NULL,
	[CLDTE6] [numeric](8, 0) NULL,
	[CLDTE7] [numeric](8, 0) NULL,
	[CLDTE8] [numeric](8, 0) NULL,
	[CLBKNG] [nvarchar](3) NULL,
	[CLLSDT] [numeric](8, 0) NULL,
	[CLLSCD] [nvarchar](2) NULL,
	[CLBRTH] [numeric](8, 0) NULL,
	[CLALF1] [nvarchar](1) NULL,
	[CLALF2] [nvarchar](1) NULL,
	[CLALF3] [nvarchar](1) NULL,
	[CLALF4] [nvarchar](1) NULL,
	[CLALF5] [nvarchar](10) NULL,
	[CLCART] [nvarchar](4) NULL,
	[CLERCD] [nvarchar](4) NULL,
	[CLDVPT] [nvarchar](3) NULL,
	[CLCONO] [nvarchar](2) NULL,
	[CLORGP] [nvarchar](6) NULL,
	[CLORT1] [nvarchar](2) NULL,
	[CLORT2] [nvarchar](2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRITON_ST_CMMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRITON_ST_CMMST](
	[CMNUMB] [nvarchar](6) NULL,
	[CMRCNB] [numeric](3, 0) NULL,
	[CMDATA] [nvarchar](75) NULL,
	[CMUSER] [nvarchar](75) NULL,
	[CMETDT] [numeric](8, 0) NULL,
	[CMETTM] [numeric](6, 0) NULL,
	[CMCGUS] [nvarchar](10) NULL,
	[CMCGDT] [numeric](8, 0) NULL,
	[CMCGTM] [numeric](6, 0) NULL,
	[CMUPDT] [nvarchar](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRITON_ST_CNMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRITON_ST_CNMST](
	[CNNUMB] [nvarchar](6) NULL,
	[CNCLNB] [nvarchar](6) NULL,
	[CNCLN2] [nvarchar](6) NULL,
	[CNSTDT] [numeric](8, 0) NULL,
	[CNENDT] [numeric](8, 0) NULL,
	[CNARDT] [numeric](8, 0) NULL,
	[CNCANX] [nvarchar](4) NULL,
	[CNPERS] [numeric](3, 0) NULL,
	[CNBDEP] [numeric](9, 2) NULL,
	[CNFDEP] [numeric](9, 2) NULL,
	[CNSTUS] [nvarchar](1) NULL,
	[CNUSER] [nvarchar](10) NULL,
	[CNETDT] [numeric](8, 0) NULL,
	[CNCHDT] [numeric](8, 0) NULL,
	[CNCNTR] [nvarchar](1) NULL,
	[CNRSUM] [nvarchar](1) NULL,
	[CNPRVS] [nvarchar](1) NULL,
	[CNBVRG] [nvarchar](1) NULL,
	[CNGUST] [nvarchar](1) NULL,
	[CNPREF] [nvarchar](1) NULL,
	[CNLIAB] [nvarchar](1) NULL,
	[CNBTOT] [numeric](9, 2) NULL,
	[CNFTOT] [numeric](9, 2) NULL,
	[CNDESG] [nvarchar](3) NULL,
	[CNTYPE] [nvarchar](3) NULL,
	[CNWAIT] [nvarchar](1) NULL,
	[CNBMIT] [nvarchar](1) NULL,
	[CNCSPR] [nvarchar](1) NULL,
	[CNPRNT] [nvarchar](1) NULL,
	[CNTRNS] [nvarchar](1) NULL,
	[CNSALU] [nvarchar](10) NULL,
	[CNFNAM] [nvarchar](40) NULL,
	[CNNAME] [nvarchar](40) NULL,
	[CNSAL2] [nvarchar](10) NULL,
	[CNFNA2] [nvarchar](40) NULL,
	[CNNAM2] [nvarchar](40) NULL,
	[CNSTCD] [nvarchar](2) NULL,
	[CNNBCH] [numeric](3, 0) NULL,
	[CNCMDR] [nvarchar](1) NULL,
	[CNCLAS] [nvarchar](1) NULL,
	[CNGRPN] [nvarchar](10) NULL,
	[CNPSTY] [nvarchar](2) NULL,
	[CNBKNG] [nvarchar](3) NULL,
	[CNLOC1] [nvarchar](3) NULL,
	[CNLOC2] [nvarchar](3) NULL,
	[CNLOC3] [nvarchar](3) NULL,
	[CNLOC4] [nvarchar](3) NULL,
	[CNDTE1] [numeric](8, 0) NULL,
	[CNDTE4] [numeric](8, 0) NULL,
	[CNTME1] [numeric](4, 0) NULL,
	[CNTME2] [numeric](4, 0) NULL,
	[CNTME3] [numeric](4, 0) NULL,
	[CNTME4] [numeric](4, 0) NULL,
	[CNFLT1] [nvarchar](5) NULL,
	[CNFLTY] [nvarchar](5) NULL,
	[CNBOAT] [nvarchar](30) NULL,
	[CNOFID] [nvarchar](10) NULL,
	[CNRCLS] [nvarchar](1) NULL,
	[CNFUSR] [nvarchar](10) NULL,
	[CNFDTE] [numeric](8, 0) NULL,
	[CNDISC] [numeric](3, 3) NULL,
	[CNBFLT] [numeric](9, 2) NULL,
	[CNFFLT] [numeric](9, 2) NULL,
	[CNBDLV] [numeric](9, 2) NULL,
	[CNFDLV] [numeric](9, 2) NULL,
	[CNCODE] [nvarchar](1) NULL,
	[CNINVC] [numeric](8, 0) NULL,
	[CNOPTN] [nvarchar](1) NULL,
	[CNINVP] [numeric](8, 0) NULL,
	[CNPACK] [nvarchar](10) NULL,
	[CNTIME] [numeric](6, 0) NULL,
	[CNUPD1] [nvarchar](1) NULL,
	[CNUPD2] [nvarchar](1) NULL,
	[CNUPD3] [nvarchar](1) NULL,
	[CNUPD4] [nvarchar](1) NULL,
	[CNUPD5] [nvarchar](1) NULL,
	[CNUPD6] [nvarchar](1) NULL,
	[CNDAT1] [numeric](8, 0) NULL,
	[CNDAT2] [numeric](8, 0) NULL,
	[CNDAT3] [numeric](8, 0) NULL,
	[CNDAT4] [numeric](8, 0) NULL,
	[CNAMT1] [numeric](9, 2) NULL,
	[CNAMT2] [numeric](9, 2) NULL,
	[CNAMT3] [numeric](9, 2) NULL,
	[CNAMT4] [numeric](9, 2) NULL,
	[CNDES1] [nvarchar](30) NULL,
	[CNDES2] [nvarchar](30) NULL,
	[CNDES3] [nvarchar](30) NULL,
	[CNDES4] [nvarchar](10) NULL,
	[CNDES5] [nvarchar](10) NULL,
	[CNDES6] [nvarchar](3) NULL,
	[CNDES7] [nvarchar](3) NULL,
	[CNCONO] [nvarchar](2) NULL,
	[CNSRCD] [nvarchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRITON_ST_CNMST_INTRADAY]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRITON_ST_CNMST_INTRADAY](
	[CNNUMB] [nvarchar](6) NULL,
	[CNCLNB] [nvarchar](6) NULL,
	[CNCLN2] [nvarchar](6) NULL,
	[CNSTDT] [numeric](8, 0) NULL,
	[CNENDT] [numeric](8, 0) NULL,
	[CNARDT] [numeric](8, 0) NULL,
	[CNCANX] [nvarchar](4) NULL,
	[CNPERS] [numeric](3, 0) NULL,
	[CNBDEP] [numeric](9, 2) NULL,
	[CNFDEP] [numeric](9, 2) NULL,
	[CNSTUS] [nvarchar](1) NULL,
	[CNUSER] [nvarchar](10) NULL,
	[CNETDT] [numeric](8, 0) NULL,
	[CNCHDT] [numeric](8, 0) NULL,
	[CNCNTR] [nvarchar](1) NULL,
	[CNRSUM] [nvarchar](1) NULL,
	[CNPRVS] [nvarchar](1) NULL,
	[CNBVRG] [nvarchar](1) NULL,
	[CNGUST] [nvarchar](1) NULL,
	[CNPREF] [nvarchar](1) NULL,
	[CNLIAB] [nvarchar](1) NULL,
	[CNBTOT] [numeric](9, 2) NULL,
	[CNFTOT] [numeric](9, 2) NULL,
	[CNDESG] [nvarchar](3) NULL,
	[CNTYPE] [nvarchar](3) NULL,
	[CNWAIT] [nvarchar](1) NULL,
	[CNBMIT] [nvarchar](1) NULL,
	[CNCSPR] [nvarchar](1) NULL,
	[CNPRNT] [nvarchar](1) NULL,
	[CNTRNS] [nvarchar](1) NULL,
	[CNSALU] [nvarchar](10) NULL,
	[CNFNAM] [nvarchar](40) NULL,
	[CNNAME] [nvarchar](40) NULL,
	[CNSAL2] [nvarchar](10) NULL,
	[CNFNA2] [nvarchar](40) NULL,
	[CNNAM2] [nvarchar](40) NULL,
	[CNSTCD] [nvarchar](2) NULL,
	[CNNBCH] [numeric](3, 0) NULL,
	[CNCMDR] [nvarchar](1) NULL,
	[CNCLAS] [nvarchar](1) NULL,
	[CNGRPN] [nvarchar](10) NULL,
	[CNPSTY] [nvarchar](2) NULL,
	[CNBKNG] [nvarchar](3) NULL,
	[CNLOC1] [nvarchar](3) NULL,
	[CNLOC2] [nvarchar](3) NULL,
	[CNLOC3] [nvarchar](3) NULL,
	[CNLOC4] [nvarchar](3) NULL,
	[CNDTE1] [numeric](8, 0) NULL,
	[CNDTE4] [numeric](8, 0) NULL,
	[CNTME1] [numeric](4, 0) NULL,
	[CNTME2] [numeric](4, 0) NULL,
	[CNTME3] [numeric](4, 0) NULL,
	[CNTME4] [numeric](4, 0) NULL,
	[CNFLT1] [nvarchar](5) NULL,
	[CNFLTY] [nvarchar](5) NULL,
	[CNBOAT] [nvarchar](30) NULL,
	[CNOFID] [nvarchar](10) NULL,
	[CNRCLS] [nvarchar](1) NULL,
	[CNFUSR] [nvarchar](10) NULL,
	[CNFDTE] [numeric](8, 0) NULL,
	[CNDISC] [numeric](3, 3) NULL,
	[CNBFLT] [numeric](9, 2) NULL,
	[CNFFLT] [numeric](9, 2) NULL,
	[CNBDLV] [numeric](9, 2) NULL,
	[CNFDLV] [numeric](9, 2) NULL,
	[CNCODE] [nvarchar](1) NULL,
	[CNINVC] [numeric](8, 0) NULL,
	[CNOPTN] [nvarchar](1) NULL,
	[CNINVP] [numeric](8, 0) NULL,
	[CNPACK] [nvarchar](10) NULL,
	[CNTIME] [numeric](6, 0) NULL,
	[CNUPD1] [nvarchar](1) NULL,
	[CNUPD2] [nvarchar](1) NULL,
	[CNUPD3] [nvarchar](1) NULL,
	[CNUPD4] [nvarchar](1) NULL,
	[CNUPD5] [nvarchar](1) NULL,
	[CNUPD6] [nvarchar](1) NULL,
	[CNDAT1] [numeric](8, 0) NULL,
	[CNDAT2] [numeric](8, 0) NULL,
	[CNDAT3] [numeric](8, 0) NULL,
	[CNDAT4] [numeric](8, 0) NULL,
	[CNAMT1] [numeric](9, 2) NULL,
	[CNAMT2] [numeric](9, 2) NULL,
	[CNAMT3] [numeric](9, 2) NULL,
	[CNAMT4] [numeric](9, 2) NULL,
	[CNDES1] [nvarchar](30) NULL,
	[CNDES2] [nvarchar](30) NULL,
	[CNDES3] [nvarchar](30) NULL,
	[CNDES4] [nvarchar](10) NULL,
	[CNDES5] [nvarchar](10) NULL,
	[CNDES6] [nvarchar](3) NULL,
	[CNDES7] [nvarchar](3) NULL,
	[CNCONO] [nvarchar](2) NULL,
	[CNSRCD] [nvarchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRITON_ST_CRMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRITON_ST_CRMST](
	[CRDATE] [numeric](8, 0) NULL,
	[CRTIME] [numeric](10, 0) NULL,
	[CRUSER] [nvarchar](20) NULL,
	[CRCNNB] [nvarchar](6) NULL,
	[CRREFR] [nvarchar](20) NULL,
	[CRCCTY] [nvarchar](16) NULL,
	[CRCCNB] [nvarchar](28) NULL,
	[CRCCDT] [numeric](6, 0) NULL,
	[CRCCAC] [nvarchar](11) NULL,
	[CRBSAM] [numeric](11, 2) NULL,
	[CRFRAM] [numeric](11, 2) NULL,
	[CRDESG] [nvarchar](20) NULL,
	[CRLORR] [nvarchar](20) NULL,
	[CRTYPE] [nvarchar](4) NULL,
	[CRNBEN] [numeric](3, 0) NULL,
	[CRLOCT] [nvarchar](3) NULL,
	[CRRCVD] [nvarchar](8) NULL,
	[CRORGN] [nvarchar](11) NULL,
	[CRRITA] [nvarchar](32) NULL,
	[CRTRAN] [nvarchar](40) NULL,
	[CRTOKN] [nvarchar](40) NULL,
	[CREXTR1] [nvarchar](40) NULL,
	[CREXTR2] [nvarchar](40) NULL,
	[CREXTR3] [nvarchar](40) NULL,
	[CREXTR4] [nvarchar](40) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRITON_ST_EFMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRITON_ST_EFMST](
	[EFNUMB] [nvarchar](40) NULL,
	[EFFNAM] [nvarchar](40) NULL,
	[EFLNAM] [nvarchar](56) NULL,
	[EFMAIL] [nvarchar](50) NULL,
	[EFWPID] [nvarchar](10) NULL,
	[EFCTCD] [nvarchar](2) NULL,
	[EFLGID] [nvarchar](1) NULL,
	[EFSITE] [nvarchar](1) NULL,
	[EFEMYN] [nvarchar](10) NULL,
	[EFETDT] [int] NULL,
	[EFUSER] [nvarchar](10) NULL,
	[EFCHDT] [int] NULL,
	[EFCHUS] [nvarchar](10) NULL,
	[EFCTDT] [int] NULL,
	[EFRPDT] [int] NULL,
	[EFRPCD] [int] NULL,
	[EFMRCD] [nvarchar](2) NULL,
	[EFMRC2] [nvarchar](2) NULL,
	[EFSPI1] [nvarchar](2) NULL,
	[EFSPI2] [nvarchar](2) NULL,
	[EFSPI3] [nvarchar](10) NULL,
	[EFDTE1] [int] NULL,
	[EFDTE2] [int] NULL,
	[EFFLG1] [nvarchar](3) NULL,
	[EFFLG2] [nvarchar](3) NULL,
	[EFFLG3] [nvarchar](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRITON_ST_FBMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRITON_ST_FBMST](
	[FBCODE] [nvarchar](10) NULL,
	[FBDESC] [nvarchar](30) NULL,
	[FBSORT] [numeric](4, 0) NULL,
	[FBSTAT] [nvarchar](1) NULL,
	[FBBKNG] [nvarchar](3) NULL,
	[FBRAND] [nvarchar](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRITON_ST_FLAIRCRFT]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRITON_ST_FLAIRCRFT](
	[ACCODE] [nvarchar](10) NULL,
	[ACDESC] [nvarchar](30) NULL,
	[ACUSID] [nvarchar](15) NULL,
	[ACMNUS] [nvarchar](15) NULL,
	[ACMNWS] [nvarchar](15) NULL,
	[ACMNDT] [int] NULL,
	[ACMNTM] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRITON_ST_FLAIRLINE]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRITON_ST_FLAIRLINE](
	[ALCODE] [nvarchar](10) NULL,
	[ALDESC] [nvarchar](30) NULL,
	[ALUSID] [nvarchar](15) NULL,
	[ALMNUS] [nvarchar](15) NULL,
	[ALMNWS] [nvarchar](15) NULL,
	[ALMNDT] [int] NULL,
	[ALMNTM] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRITON_ST_FLALLOC]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRITON_ST_FLALLOC](
	[ALFLTNO] [int] NULL,
	[ALPRALC] [int] NULL,
	[ALALLOC#] [int] NULL,
	[ALALCCDE] [nvarchar](5) NULL,
	[ALALVALU] [nvarchar](5) NULL,
	[ALTOTSEAT] [int] NULL,
	[ALOPTSEAT] [int] NULL,
	[ALCONSEAT] [int] NULL,
	[ALWAISEAT] [int] NULL,
	[ALFRESEAT] [int] NULL,
	[ALALWNEG] [nvarchar](5) NULL,
	[ALUSID] [nvarchar](15) NULL,
	[ALMNUS] [nvarchar](15) NULL,
	[ALMNWS] [nvarchar](15) NULL,
	[ALMNDT] [int] NULL,
	[ALMNTM] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRITON_ST_FLFLREF]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRITON_ST_FLFLREF](
	[RFCLNO] [nvarchar](9) NULL,
	[RFFLRF] [numeric](25, 0) NULL,
	[RFFNBR] [numeric](20, 0) NULL,
	[RFSREQ] [numeric](10, 0) NULL,
	[RFSWAIT] [numeric](10, 0) NULL,
	[RFFLTON] [nvarchar](1) NULL,
	[RF7DAYS] [nvarchar](1) NULL,
	[RFALFONL] [nvarchar](1) NULL,
	[RFALF7DY] [nvarchar](1) NULL,
	[RFSEATS] [numeric](5, 0) NULL,
	[RFADDBY] [nvarchar](10) NULL,
	[RFADDDTE] [numeric](8, 0) NULL,
	[RFADDTIM] [numeric](6, 0) NULL,
	[RFALLOC#] [numeric](15, 0) NULL,
	[RFROUTE#] [numeric](10, 0) NULL,
	[RFNUMB] [nvarchar](6) NULL,
	[RFRATE1] [numeric](9, 2) NULL,
	[RFRATE2] [numeric](9, 2) NULL,
	[RFTYPE1] [nvarchar](5) NULL,
	[RFTYPE2] [nvarchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRITON_ST_FLFLTMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRITON_ST_FLFLTMST](
	[FLNUMBER] [int] NULL,
	[FLTYPE] [nvarchar](10) NULL,
	[FLDPARPT] [nvarchar](9) NULL,
	[FLDPDATE] [int] NULL,
	[FLDPTIME] [int] NULL,
	[FLDPNO] [int] NULL,
	[FLARARPT] [nvarchar](9) NULL,
	[FLARDATE] [int] NULL,
	[FLARTIME] [int] NULL,
	[FLCARRIER] [nvarchar](6) NULL,
	[FLREF] [nvarchar](20) NULL,
	[FLLOCATOR] [nvarchar](50) NULL,
	[FLOUTORIN] [nvarchar](15) NULL,
	[FLSEATPRC] [numeric](16, 2) NULL,
	[FLTOTSEAT] [int] NULL,
	[FLOPTION] [int] NULL,
	[FLCONFD] [int] NULL,
	[FLWAIT] [int] NULL,
	[FLFREE] [int] NULL,
	[FLFTOTSEAT] [int] NULL,
	[FLFOPTION] [int] NULL,
	[FLFCONFD] [int] NULL,
	[FLFWAIT] [int] NULL,
	[FLFFREE] [int] NULL,
	[FLTICKETS] [nvarchar](1) NULL,
	[FLMANIFEST] [nvarchar](6) NULL,
	[FLBAGGAGE] [nvarchar](10) NULL,
	[FLCKINTIME] [int] NULL,
	[FLCKINTERM] [nvarchar](50) NULL,
	[FLROUT] [nvarchar](9) NULL,
	[FLMAX7DAY] [int] NULL,
	[FL7DAYREM] [int] NULL,
	[FL7DAYSTOP] [nvarchar](13) NULL,
	[FLFMAX7DAY] [int] NULL,
	[FLF7DAYREM] [int] NULL,
	[FLF7DAYSTP] [nvarchar](6) NULL,
	[FLCLASS] [nvarchar](1) NULL,
	[FLINTUSE] [nvarchar](1) NULL,
	[FLINUSE] [nvarchar](16) NULL,
	[FLLASTALC#] [int] NULL,
	[FLTOTONFIT] [int] NULL,
	[FLOPTONFIT] [int] NULL,
	[FLCNFONFIT] [int] NULL,
	[FLWAIONFIT] [int] NULL,
	[FLFREONFIT] [int] NULL,
	[FLHASALTN] [nvarchar](1) NULL,
	[FLONREQUST] [nvarchar](15) NULL,
	[FLCOST1] [numeric](16, 2) NULL,
	[FLCOST2] [numeric](16, 2) NULL,
	[FLUSID] [nvarchar](10) NULL,
	[FLMNUS] [nvarchar](10) NULL,
	[FLMNWS] [nvarchar](15) NULL,
	[FLMNDT] [int] NULL,
	[FLMNTM] [int] NULL,
	[FLBKNG] [nvarchar](3) NULL,
	[FLDESG] [nvarchar](3) NULL,
	[FLPLTFRM] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRITON_ST_FLLINK]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRITON_ST_FLLINK](
	[LKROUTE] [int] NULL,
	[LKDESC] [nvarchar](10) NULL,
	[LKDATE] [int] NULL,
	[LKTIME] [int] NULL,
	[LKDPNO] [int] NULL,
	[LKUSID] [nvarchar](15) NULL,
	[LKMNUS] [nvarchar](15) NULL,
	[LKMNWS] [nvarchar](15) NULL,
	[LKMNDT] [int] NULL,
	[LKMNTM] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRITON_ST_FLMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRITON_ST_FLMST](
	[FLNUMB] [nvarchar](50) NULL,
	[FLNAME] [nvarchar](50) NULL,
	[FLTYPE] [nvarchar](50) NULL,
	[FLFLAG] [nvarchar](50) NULL,
	[FLPROG] [nvarchar](50) NULL,
	[FLRANK] [numeric](5, 2) NULL,
	[FLCMNB] [numeric](3, 0) NULL,
	[FLDPNB] [numeric](3, 0) NULL,
	[FLATNB] [nvarchar](50) NULL,
	[FLHOME] [nvarchar](50) NULL,
	[FLINSR] [nvarchar](50) NULL,
	[FLALCH] [nvarchar](50) NULL,
	[FLRVMO] [numeric](2, 0) NULL,
	[FLRVTG] [numeric](7, 0) NULL,
	[FLOWNR] [nvarchar](50) NULL,
	[FLVALU] [numeric](9, 0) NULL,
	[FLDESG] [nvarchar](50) NULL,
	[FLPAYE] [nvarchar](50) NULL,
	[FLREVP] [numeric](4, 3) NULL,
	[FLSTRT] [numeric](7, 2) NULL,
	[FLABDT] [numeric](8, 0) NULL,
	[FLCRDT] [numeric](8, 0) NULL,
	[FLLCDT] [numeric](8, 0) NULL,
	[FLDBDT] [numeric](8, 0) NULL,
	[FLUSER] [nvarchar](50) NULL,
	[FLCHDT] [numeric](8, 0) NULL,
	[FLCLDT] [numeric](8, 0) NULL,
	[FLEFDT] [numeric](8, 0) NULL,
	[FLOWNI] [numeric](9, 2) NULL,
	[FLSELL] [numeric](9, 2) NULL,
	[FLTRAN] [nvarchar](50) NULL,
	[FLCLNB] [nvarchar](50) NULL,
	[FLAPVN] [nvarchar](50) NULL,
	[FLOWNT] [numeric](3, 0) NULL,
	[FLPSDO] [nvarchar](50) NULL,
	[FLLOIP] [nvarchar](50) NULL,
	[FLREDI] [nvarchar](50) NULL,
	[FLINDD] [numeric](8, 0) NULL,
	[FLSPR2] [numeric](9, 2) NULL,
	[FLCATG] [nvarchar](50) NULL,
	[FLSPR4] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRITON_ST_FLPASSLK]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRITON_ST_FLPASSLK](
	[PLCLNO] [nvarchar](9) NULL,
	[PLPASS#] [numeric](2, 0) NULL,
	[PLREF#] [nvarchar](9) NULL,
	[PLTYPE] [nvarchar](1) NULL,
	[PLSTATUS] [nvarchar](1) NULL,
	[PLAGE] [nvarchar](1) NULL,
	[PLNUMB] [nvarchar](6) NULL,
	[PLROUTE] [numeric](10, 0) NULL,
	[PLUSID] [nvarchar](10) NULL,
	[PLMNUS] [nvarchar](10) NULL,
	[PLMNWS] [nvarchar](10) NULL,
	[PLMNDT] [numeric](8, 0) NULL,
	[PLMNTM] [numeric](6, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRITON_ST_FLROUTE]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRITON_ST_FLROUTE](
	[RTCODE] [nvarchar](10) NULL,
	[RTDESC] [nvarchar](25) NULL,
	[RTUSID] [nvarchar](10) NULL,
	[RTMNUS] [nvarchar](10) NULL,
	[RTMNWS] [nvarchar](10) NULL,
	[RTMNDT] [numeric](8, 0) NULL,
	[RTMNTM] [numeric](6, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRITON_ST_FMMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRITON_ST_FMMST](
	[FMLOCT] [nvarchar](3) NULL,
	[FMTYPE] [nvarchar](5) NULL,
	[FMDATE] [numeric](8, 0) NULL,
	[FMNUMB] [numeric](3, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRITON_ST_FNMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRITON_ST_FNMST](
	[FNLOCT] [nvarchar](3) NULL,
	[FNTYPE] [nvarchar](5) NULL,
	[FNHULL] [nvarchar](10) NULL,
	[FNNAME] [nvarchar](25) NULL,
	[FNSTDT] [numeric](8, 0) NULL,
	[FNENDT] [numeric](8, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRITON_ST_FPMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRITON_ST_FPMST](
	[FPFLNB] [nvarchar](10) NULL,
	[FPFLTY] [nvarchar](5) NULL,
	[FPUTCD] [nvarchar](1) NULL,
	[FPSTDT] [numeric](8, 0) NULL,
	[FPENDT] [numeric](8, 0) NULL,
	[FPAUTO] [nvarchar](1) NULL,
	[FPLOCT] [nvarchar](3) NULL,
	[FPUSER] [nvarchar](10) NULL,
	[FPETDT] [numeric](8, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRITON_ST_FRMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRITON_ST_FRMST](
	[FRLOCT] [nvarchar](3) NULL,
	[FRYCTY] [nvarchar](5) NULL,
	[FRCREW] [nvarchar](1) NULL,
	[FRRTTR] [nvarchar](1) NULL,
	[FREFDT] [numeric](8, 0) NULL,
	[FRSTDT] [numeric](8, 0) NULL,
	[FRFRAT] [numeric](18, 4) NULL,
	[FREACH] [numeric](9, 4) NULL,
	[FRDESG] [nvarchar](3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRITON_ST_FRMST_SUNDLIB]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRITON_ST_FRMST_SUNDLIB](
	[FRLOCT] [nvarchar](3) NULL,
	[FRYCTY] [nvarchar](5) NULL,
	[FRCREW] [nvarchar](1) NULL,
	[FRRTTR] [nvarchar](1) NULL,
	[FREFDT] [numeric](8, 0) NULL,
	[FRSTDT] [numeric](8, 0) NULL,
	[FRFRAT] [numeric](12, 4) NULL,
	[FREACH] [numeric](12, 4) NULL,
	[FRDESG] [nvarchar](3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRITON_ST_FRMST_YASDLIB]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRITON_ST_FRMST_YASDLIB](
	[FRLOCT] [nvarchar](3) NULL,
	[FRYCTY] [nvarchar](5) NULL,
	[FRCREW] [nvarchar](1) NULL,
	[FRRTTR] [nvarchar](1) NULL,
	[FREFDT] [numeric](8, 0) NULL,
	[FRSTDT] [numeric](8, 0) NULL,
	[FRFRAT] [numeric](18, 4) NULL,
	[FREACH] [numeric](18, 4) NULL,
	[FRDESG] [nvarchar](3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRITON_ST_FTMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRITON_ST_FTMST](
	[FTTYPE] [nvarchar](5) NULL,
	[FTCREW] [nvarchar](1) NULL,
	[FTNAME] [nvarchar](25) NULL,
	[FTMXPR] [numeric](3, 0) NULL,
	[FTMXMD] [numeric](3, 0) NULL,
	[FTMXFR] [numeric](3, 0) NULL,
	[FTMXTA] [numeric](3, 0) NULL,
	[FTMXAU] [numeric](3, 0) NULL,
	[FTIPAX] [numeric](3, 0) NULL,
	[FTMXXX] [numeric](3, 0) NULL,
	[FTSIZE] [numeric](3, 0) NULL,
	[FTTPGR] [nvarchar](4) NULL,
	[FTHULL] [nvarchar](1) NULL,
	[FTACTV] [nvarchar](1) NULL,
	[FTDELP] [nvarchar](1) NULL,
	[FTYOWN] [nvarchar](1) NULL,
	[FTSRTG] [nvarchar](1) NULL,
	[FTSORT] [numeric](5, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRITON_ST_IAMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRITON_ST_IAMST](
	[IANUMB] [nvarchar](6) NULL,
	[IAADDR] [nvarchar](256) NULL,
	[IAETDT] [numeric](8, 0) NULL,
	[IAUSER] [nvarchar](10) NULL,
	[IACHDT] [numeric](8, 0) NULL,
	[IACHUS] [nvarchar](10) NULL,
	[IABSPM] [nvarchar](1) NULL,
	[IACSPM] [nvarchar](1) NULL,
	[IAFSPM] [nvarchar](1) NULL,
	[IAPSPM] [nvarchar](1) NULL,
	[IAACTV] [nvarchar](1) NULL,
	[IAPFMT] [nvarchar](3) NULL,
	[IAEMPW] [nvarchar](1) NULL,
	[IARUID] [nvarchar](10) NULL,
	[IAPSCD] [nvarchar](6) NULL,
	[IAPASS] [nvarchar](6) NULL,
	[IADATE] [numeric](8, 0) NULL,
	[IATIME] [numeric](6, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRITON_ST_LSMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRITON_ST_LSMST](
	[LSCODE] [nvarchar](2) NULL,
	[LSDESC] [nvarchar](30) NULL,
	[LSBKNG] [nvarchar](3) NULL,
	[LSCT01] [numeric](5, 0) NULL,
	[LSCT02] [numeric](5, 0) NULL,
	[LSCT03] [numeric](5, 0) NULL,
	[LSCT04] [numeric](5, 0) NULL,
	[LSCT05] [numeric](5, 0) NULL,
	[LSCT06] [numeric](5, 0) NULL,
	[LSCT07] [numeric](5, 0) NULL,
	[LSCT08] [numeric](5, 0) NULL,
	[LSCT09] [numeric](5, 0) NULL,
	[LSCT10] [numeric](5, 0) NULL,
	[LSCT11] [numeric](5, 0) NULL,
	[LSCT12] [numeric](5, 0) NULL,
	[LSTOT1] [numeric](5, 0) NULL,
	[LSTOT2] [numeric](5, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRITON_ST_MKMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRITON_ST_MKMST](
	[MKCLNB] [nvarchar](6) NULL,
	[MKCODE] [nvarchar](10) NULL,
	[MKCTCD] [nvarchar](6) NULL,
	[MKBROCH] [nvarchar](1) NULL,
	[MKDMAIL] [nvarchar](1) NULL,
	[MKEMAIL] [nvarchar](1) NULL,
	[MKPHONE] [nvarchar](1) NULL,
	[MKESMS] [nvarchar](1) NULL,
	[MKMNUS] [nvarchar](10) NULL,
	[MKMNWS] [nvarchar](10) NULL,
	[MKMNDT] [numeric](8, 0) NULL,
	[MKMNTM] [numeric](6, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRITON_ST_PASSENGER]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRITON_ST_PASSENGER](
	[PACLIENT] [nvarchar](9) NULL,
	[PAMAIL] [nvarchar](11) NULL,
	[PAFAM#] [nvarchar](5) NULL,
	[PAPASS#] [numeric](2, 0) NULL,
	[PASALU] [nvarchar](10) NULL,
	[PAFNAM] [nvarchar](40) NULL,
	[PAMNAM] [nvarchar](40) NULL,
	[PANAME] [nvarchar](40) NULL,
	[PACONO] [nvarchar](40) NULL,
	[PAADDR1] [nvarchar](40) NULL,
	[PAADDR2] [nvarchar](40) NULL,
	[PAADDR3] [nvarchar](40) NULL,
	[PACITY] [nvarchar](40) NULL,
	[PASTATE] [nvarchar](40) NULL,
	[PAZIPC] [nvarchar](12) NULL,
	[PACTRY] [nvarchar](40) NULL,
	[PANAT] [nvarchar](4) NULL,
	[PADAYPH] [nvarchar](20) NULL,
	[PAEVEPH] [nvarchar](20) NULL,
	[PAT1DESC] [nvarchar](20) NULL,
	[PATEL1] [nvarchar](20) NULL,
	[PAT2DESC] [nvarchar](20) NULL,
	[PATEL2] [nvarchar](20) NULL,
	[PAT3DESC] [nvarchar](20) NULL,
	[PATEL3] [nvarchar](20) NULL,
	[PATF1DESC] [nvarchar](20) NULL,
	[PAFAX1] [nvarchar](20) NULL,
	[PAEMAIL] [nvarchar](60) NULL,
	[PASEX] [nvarchar](1) NULL,
	[PADOB] [numeric](8, 0) NULL,
	[PAADULT] [nvarchar](1) NULL,
	[PAYEARS] [numeric](3, 0) NULL,
	[PAMONTHS] [nvarchar](20) NULL,
	[PAYOB] [numeric](4, 0) NULL,
	[PAOCCUPA] [nvarchar](4) NULL,
	[PAPASSPT] [nvarchar](12) NULL,
	[PAPPDATE] [numeric](8, 0) NULL,
	[PAPPEDTE] [numeric](8, 0) NULL,
	[PAPPPLAC] [nvarchar](60) NULL,
	[PAPPNATN] [nvarchar](20) NULL,
	[PASMOKER] [nvarchar](1) NULL,
	[PAVEG] [nvarchar](1) NULL,
	[PATOD] [nvarchar](1) NULL,
	[PAINSRQ] [nvarchar](1) NULL,
	[PAINPOL] [nvarchar](20) NULL,
	[PASTDT] [numeric](8, 0) NULL,
	[PAENDT] [numeric](8, 0) NULL,
	[PATRANF] [nvarchar](1) NULL,
	[PAMSOFT] [nvarchar](6) NULL,
	[PALOGBK] [nvarchar](1) NULL,
	[PAWTRPRF] [nvarchar](1) NULL,
	[PAMAILLST] [nvarchar](1) NULL,
	[PABIRTHPL] [nvarchar](60) NULL,
	[PASAILEXP] [numeric](10, 0) NULL,
	[PASKIPPER] [nvarchar](1) NULL,
	[PAREDRESS#] [nvarchar](13) NULL,
	[PANUMB] [nvarchar](6) NULL,
	[PACLNB] [nvarchar](6) NULL,
	[PAUSID] [nvarchar](10) NULL,
	[PAMNUS] [nvarchar](10) NULL,
	[PAMNWS] [nvarchar](10) NULL,
	[PAMNDT] [numeric](8, 0) NULL,
	[PAMNTM] [numeric](6, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRITON_ST_PTMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRITON_ST_PTMST](
	[PTCDRF] [nvarchar](10) NULL,
	[PTCLAS] [nvarchar](1) NULL,
	[PTSCLS] [nvarchar](1) NULL,
	[PTDESC] [nvarchar](30) NULL,
	[PTCMNB] [numeric](3, 0) NULL,
	[PTDPNB] [numeric](3, 0) NULL,
	[PTATNB] [nvarchar](15) NULL,
	[PTLOCT] [nvarchar](3) NULL,
	[PTWEBS] [nvarchar](1) NULL,
	[PTPROM] [nvarchar](1) NULL,
	[PTFORM] [nvarchar](20) NULL,
	[PTWGRP] [nvarchar](1) NULL,
	[PTBRND] [nvarchar](1) NULL,
	[PTHTML] [nvarchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRITON_ST_QNMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRITON_ST_QNMST](
	[QNNUMB] [nvarchar](6) NULL,
	[QNCLNB] [nvarchar](6) NULL,
	[QNCLN2] [nvarchar](6) NULL,
	[QNSTDT] [numeric](8, 0) NULL,
	[QNENDT] [numeric](8, 0) NULL,
	[QNARDT] [numeric](8, 0) NULL,
	[QNCANX] [nvarchar](4) NULL,
	[QNPERS] [numeric](3, 0) NULL,
	[QNBDEP] [numeric](9, 2) NULL,
	[QNFDEP] [numeric](9, 2) NULL,
	[QNSTUS] [nvarchar](1) NULL,
	[QNUSER] [nvarchar](10) NULL,
	[QNETDT] [numeric](8, 0) NULL,
	[QNCHDT] [numeric](8, 0) NULL,
	[QNCNTR] [nvarchar](1) NULL,
	[QNRSUM] [nvarchar](1) NULL,
	[QNPRVS] [nvarchar](1) NULL,
	[QNBVRG] [nvarchar](1) NULL,
	[QNGUST] [nvarchar](1) NULL,
	[QNPREF] [nvarchar](1) NULL,
	[QNBTOT] [numeric](9, 2) NULL,
	[QNFTOT] [numeric](9, 2) NULL,
	[QNDESG] [nvarchar](3) NULL,
	[QNTYPE] [nvarchar](3) NULL,
	[QNWAIT] [nvarchar](1) NULL,
	[QNBMIT] [nvarchar](1) NULL,
	[QNCSPR] [nvarchar](1) NULL,
	[QNPRNT] [nvarchar](1) NULL,
	[QNTRNS] [nvarchar](1) NULL,
	[QNSALU] [nvarchar](10) NULL,
	[QNFNAM] [nvarchar](40) NULL,
	[QNNAME] [nvarchar](40) NULL,
	[QNSAL2] [nvarchar](10) NULL,
	[QNFNA2] [nvarchar](40) NULL,
	[QNNAM2] [nvarchar](40) NULL,
	[QNSTCD] [nvarchar](2) NULL,
	[QNNBCH] [numeric](3, 0) NULL,
	[QNCMDR] [nvarchar](1) NULL,
	[QNCLAS] [nvarchar](1) NULL,
	[QNGRPN] [nvarchar](10) NULL,
	[QNPSTY] [nvarchar](2) NULL,
	[QNBKNG] [nvarchar](3) NULL,
	[QNLOC1] [nvarchar](3) NULL,
	[QNLOC2] [nvarchar](3) NULL,
	[QNLOC3] [nvarchar](3) NULL,
	[QNLOC4] [nvarchar](3) NULL,
	[QNDTE1] [numeric](8, 0) NULL,
	[QNDTE4] [numeric](8, 0) NULL,
	[QNTME1] [numeric](4, 0) NULL,
	[QNTME2] [numeric](4, 0) NULL,
	[QNTME3] [numeric](4, 0) NULL,
	[QNTME4] [numeric](4, 0) NULL,
	[QNFLT1] [nvarchar](5) NULL,
	[QNFLTY] [nvarchar](5) NULL,
	[QNBOAT] [nvarchar](30) NULL,
	[QNOFID] [nvarchar](10) NULL,
	[QNRCLS] [nvarchar](1) NULL,
	[QNFUSR] [nvarchar](10) NULL,
	[QNFDTE] [numeric](8, 0) NULL,
	[QNDISC] [numeric](3, 3) NULL,
	[QNBFLT] [numeric](9, 2) NULL,
	[QNFFLT] [numeric](9, 2) NULL,
	[QNBDLV] [numeric](9, 2) NULL,
	[QNFDLV] [numeric](9, 2) NULL,
	[QNCODE] [nvarchar](1) NULL,
	[QNINVC] [numeric](8, 0) NULL,
	[QNOPTN] [nvarchar](1) NULL,
	[QNINVP] [numeric](8, 0) NULL,
	[QNPACK] [nvarchar](10) NULL,
	[QNTIME] [numeric](6, 0) NULL,
	[QNUPD1] [nvarchar](1) NULL,
	[QNUPD2] [nvarchar](1) NULL,
	[QNLSCB] [numeric](8, 0) NULL,
	[QNNXCB] [numeric](8, 0) NULL,
	[QNLSDT] [numeric](8, 0) NULL,
	[QNLSCD] [nvarchar](2) NULL,
	[QNUPD3] [nvarchar](1) NULL,
	[QNUPD4] [nvarchar](1) NULL,
	[QNUPD5] [nvarchar](1) NULL,
	[QNUPD6] [nvarchar](1) NULL,
	[QNDAT1] [numeric](8, 0) NULL,
	[QNDAT2] [numeric](8, 0) NULL,
	[QNDAT3] [numeric](8, 0) NULL,
	[QNDAT4] [numeric](8, 0) NULL,
	[QNAMT1] [numeric](9, 2) NULL,
	[QNAMT2] [numeric](9, 2) NULL,
	[QNAMT3] [numeric](9, 2) NULL,
	[QNAMT4] [numeric](9, 2) NULL,
	[QNDES1] [nvarchar](30) NULL,
	[QNDES2] [nvarchar](30) NULL,
	[QNDES3] [nvarchar](30) NULL,
	[QNDES4] [nvarchar](10) NULL,
	[QNDES5] [nvarchar](10) NULL,
	[QNDES6] [nvarchar](3) NULL,
	[QNDES7] [nvarchar](3) NULL,
	[QNCONO] [nvarchar](2) NULL,
	[QNSRCD] [nvarchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRITON_ST_SUNMRMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRITON_ST_SUNMRMST](
	[SNCODE] [nvarchar](5) NULL,
	[SNDESC] [nvarchar](20) NULL,
	[SNSLCD] [nvarchar](1) NULL,
	[SNBKG1] [nvarchar](3) NULL,
	[SNWEBS] [nvarchar](1) NULL,
	[SNBRND] [nvarchar](1) NULL,
	[SNINHS] [nvarchar](1) NULL,
	[SNITRN] [nvarchar](1) NULL,
	[SNMNUS] [nvarchar](10) NULL,
	[SNMNWS] [nvarchar](10) NULL,
	[SNMNDT] [numeric](8, 0) NULL,
	[SNMNTM] [numeric](6, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRITON_ST_TBMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRITON_ST_TBMST](
	[TBDATE] [numeric](8, 0) NULL,
	[TBUSER] [nvarchar](10) NULL,
	[TBCLNB] [nvarchar](6) NULL,
	[TBQNTY] [numeric](2, 0) NULL,
	[TBCODE] [nvarchar](10) NULL,
	[TBPDTE] [numeric](8, 0) NULL,
	[TBPRNT] [nvarchar](1) NULL,
	[TBLSCB] [numeric](8, 0) NULL,
	[TBNXCB] [numeric](8, 0) NULL,
	[TBAREA] [nvarchar](6) NULL,
	[TBSEAS] [nvarchar](6) NULL,
	[TBLSDT] [numeric](8, 0) NULL,
	[TBLSCD] [nvarchar](2) NULL,
	[TBBKNG] [nvarchar](3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRITON_ST_TGMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRITON_ST_TGMST](
	[TGTYPE] [nvarchar](4) NULL,
	[TGDESC] [nvarchar](25) NULL,
	[TGCABS] [numeric](1, 0) NULL,
	[TGHEAD] [numeric](1, 0) NULL,
	[TGSHOW] [numeric](1, 0) NULL,
	[TGWATR] [numeric](3, 0) NULL,
	[TGSAIL] [numeric](4, 0) NULL,
	[TGENGI] [nvarchar](15) NULL,
	[TGLOAF] [numeric](3, 0) NULL,
	[TGLOAI] [numeric](2, 0) NULL,
	[TGLWLF] [numeric](3, 0) NULL,
	[TGLWLI] [numeric](2, 0) NULL,
	[TGBEMF] [numeric](3, 0) NULL,
	[TGBEMI] [numeric](2, 0) NULL,
	[TGDFTF] [numeric](3, 0) NULL,
	[TGDFTI] [numeric](2, 0) NULL,
	[TGHORS] [numeric](3, 0) NULL,
	[TGFUEL] [numeric](3, 0) NULL,
	[TGBLDR] [nvarchar](25) NULL,
	[TGDSPL] [numeric](6, 0) NULL,
	[TGANCH] [nvarchar](2) NULL,
	[TGCHAN] [nvarchar](3) NULL,
	[TGRODE] [nvarchar](3) NULL,
	[TGFRIG] [numeric](3, 1) NULL,
	[TGNEWB] [nvarchar](1) NULL,
	[TGWIND] [nvarchar](1) NULL,
	[TGPWRI] [nvarchar](1) NULL,
	[TGHEDF] [numeric](1, 0) NULL,
	[TGHEDI] [numeric](2, 0) NULL,
	[TGBFLF] [numeric](1, 0) NULL,
	[TGBFLI] [numeric](2, 0) NULL,
	[TGBFWF] [numeric](1, 0) NULL,
	[TGBFWI] [numeric](2, 0) NULL,
	[TGBALF] [numeric](1, 0) NULL,
	[TGBALI] [numeric](2, 0) NULL,
	[TGBAWF] [numeric](1, 0) NULL,
	[TGBAWI] [numeric](2, 0) NULL,
	[TGHTML] [nvarchar](25) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRITON_ST_USMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRITON_ST_USMST](
	[USRGRP] [nvarchar](2) NULL,
	[USRPRF] [nvarchar](10) NULL,
	[USRNAM] [nvarchar](50) NULL,
	[USFNAM] [nvarchar](35) NULL,
	[USOUTQ] [nvarchar](10) NULL,
	[USEMAL] [nvarchar](30) NULL,
	[USEXTN] [nvarchar](4) NULL,
	[USSELF] [nvarchar](64) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRITON_ST_XXMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRITON_ST_XXMST](
	[XXHULL] [nvarchar](10) NULL,
	[XXCRDT] [numeric](8, 0) NULL,
	[XXLCDT] [numeric](8, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRITON_ST_YHMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRITON_ST_YHMST](
	[CHCNNB] [nvarchar](6) NULL,
	[CHCLNB] [nvarchar](6) NULL,
	[CHCLN2] [nvarchar](6) NULL,
	[CHAGNT] [nvarchar](10) NULL,
	[CHSTDT] [numeric](8, 0) NULL,
	[CHENDT] [numeric](8, 0) NULL,
	[CHNBDY] [numeric](3, 0) NULL,
	[CHFLNB] [nvarchar](10) NULL,
	[CHFLTY] [nvarchar](5) NULL,
	[CHFLCR] [nvarchar](1) NULL,
	[CHETDT] [numeric](8, 0) NULL,
	[CHCNDT] [numeric](8, 0) NULL,
	[CHDPDT] [numeric](8, 0) NULL,
	[CHDRDT] [numeric](8, 0) NULL,
	[CHFLAM] [numeric](9, 2) NULL,
	[CHACAM] [numeric](9, 2) NULL,
	[CHPRAM] [numeric](9, 2) NULL,
	[CHEXAM] [numeric](9, 2) NULL,
	[CHCMAM] [numeric](9, 2) NULL,
	[CHFSAM] [numeric](9, 2) NULL,
	[CHDSAM] [numeric](9, 2) NULL,
	[CHMSAM] [numeric](9, 2) NULL,
	[CHBVAM] [numeric](9, 2) NULL,
	[CHTXAM] [numeric](9, 2) NULL,
	[CHINAM] [numeric](9, 2) NULL,
	[CHOTHR] [numeric](9, 2) NULL,
	[CHTLAM] [numeric](9, 2) NULL,
	[CHCNTY] [nvarchar](3) NULL,
	[CHPSTY] [nvarchar](2) NULL,
	[CHDESG] [nvarchar](3) NULL,
	[CHNBPR] [numeric](3, 0) NULL,
	[CHDLVY] [numeric](9, 2) NULL,
	[CHFRLC] [nvarchar](3) NULL,
	[CHTOLC] [nvarchar](3) NULL,
	[CHBKNG] [nvarchar](3) NULL,
	[CHOPTN] [nvarchar](1) NULL,
	[CHCALC] [numeric](9, 4) NULL,
	[CHMAIL] [nvarchar](1) NULL,
	[CHCODE] [nvarchar](1) NULL,
	[CHOWNT] [numeric](3, 0) NULL,
	[CHCOMP] [numeric](3, 0) NULL,
	[CHSPR1] [numeric](8, 0) NULL,
	[CHSPR2] [numeric](3, 0) NULL,
	[CHSPR3] [nvarchar](1) NULL,
	[CHPACK] [nvarchar](10) NULL,
	[CHCTAG] [nvarchar](2) NULL,
	[CHSPR4] [nvarchar](4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRITON_ST_ZIMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRITON_ST_ZIMST](
	[CIRCID] [nvarchar](1) NULL,
	[CICNNB] [nvarchar](6) NULL,
	[CINUMB] [numeric](3, 0) NULL,
	[CICLNB] [nvarchar](6) NULL,
	[CIQNTY] [numeric](5, 0) NULL,
	[CIPERS] [numeric](2, 0) NULL,
	[CICLAS] [nvarchar](1) NULL,
	[CISCLS] [nvarchar](1) NULL,
	[CICANC] [nvarchar](1) NULL,
	[CIDESC] [nvarchar](30) NULL,
	[CIOFID] [nvarchar](10) NULL,
	[CIAMNT] [numeric](9, 2) NULL,
	[CIFAMT] [numeric](9, 2) NULL,
	[CIDISC] [numeric](3, 3) NULL,
	[CIBDSC] [numeric](9, 2) NULL,
	[CIFDSC] [numeric](9, 2) NULL,
	[CIBVAT] [numeric](9, 2) NULL,
	[CIFVAT] [numeric](9, 2) NULL,
	[CITAPR] [numeric](3, 3) NULL,
	[CIBCOM] [numeric](9, 2) NULL,
	[CIFCOM] [numeric](9, 2) NULL,
	[CICNST] [numeric](8, 0) NULL,
	[CICNEN] [numeric](8, 0) NULL,
	[CIETDT] [numeric](8, 0) NULL,
	[CICHDT] [numeric](8, 0) NULL,
	[CIUSER] [nvarchar](10) NULL,
	[CISTDT] [numeric](8, 0) NULL,
	[CIENDT] [numeric](8, 0) NULL,
	[CIEXTR] [nvarchar](21) NULL,
	[CILOCT] [nvarchar](3) NULL,
	[CIPACK] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRITON_ST_ZNMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRITON_ST_ZNMST](
	[CNNUMB] [nvarchar](6) NULL,
	[CNCLNB] [nvarchar](6) NULL,
	[CNCLN2] [nvarchar](6) NULL,
	[CNSTDT] [numeric](8, 0) NULL,
	[CNENDT] [numeric](8, 0) NULL,
	[CNARDT] [numeric](8, 0) NULL,
	[CNCANX] [nvarchar](4) NULL,
	[CNPERS] [numeric](3, 0) NULL,
	[CNBDEP] [numeric](9, 2) NULL,
	[CNFDEP] [numeric](9, 2) NULL,
	[CNSTUS] [nvarchar](1) NULL,
	[CNUSER] [nvarchar](10) NULL,
	[CNETDT] [numeric](8, 0) NULL,
	[CNCHDT] [numeric](8, 0) NULL,
	[CNCNTR] [nvarchar](1) NULL,
	[CNRSUM] [nvarchar](1) NULL,
	[CNPRVS] [nvarchar](1) NULL,
	[CNBVRG] [nvarchar](1) NULL,
	[CNGUST] [nvarchar](1) NULL,
	[CNPREF] [nvarchar](1) NULL,
	[CNLIAB] [nvarchar](1) NULL,
	[CNBTOT] [numeric](9, 2) NULL,
	[CNFTOT] [numeric](9, 2) NULL,
	[CNDESG] [nvarchar](3) NULL,
	[CNTYPE] [nvarchar](3) NULL,
	[CNWAIT] [nvarchar](1) NULL,
	[CNBMIT] [nvarchar](1) NULL,
	[CNCSPR] [nvarchar](1) NULL,
	[CNPRNT] [nvarchar](1) NULL,
	[CNTRNS] [nvarchar](1) NULL,
	[CNSALU] [nvarchar](10) NULL,
	[CNFNAM] [nvarchar](40) NULL,
	[CNNAME] [nvarchar](40) NULL,
	[CNSAL2] [nvarchar](10) NULL,
	[CNFNA2] [nvarchar](40) NULL,
	[CNNAM2] [nvarchar](40) NULL,
	[CNSTCD] [nvarchar](2) NULL,
	[CNNBCH] [numeric](3, 0) NULL,
	[CNCMDR] [nvarchar](1) NULL,
	[CNCLAS] [nvarchar](1) NULL,
	[CNGRPN] [nvarchar](10) NULL,
	[CNPSTY] [nvarchar](2) NULL,
	[CNBKNG] [nvarchar](3) NULL,
	[CNLOC1] [nvarchar](3) NULL,
	[CNLOC2] [nvarchar](3) NULL,
	[CNLOC3] [nvarchar](3) NULL,
	[CNLOC4] [nvarchar](3) NULL,
	[CNDTE1] [numeric](8, 0) NULL,
	[CNDTE4] [numeric](8, 0) NULL,
	[CNTME1] [numeric](4, 0) NULL,
	[CNTME2] [numeric](4, 0) NULL,
	[CNTME3] [numeric](4, 0) NULL,
	[CNTME4] [numeric](4, 0) NULL,
	[CNFLT1] [nvarchar](5) NULL,
	[CNFLTY] [nvarchar](5) NULL,
	[CNBOAT] [nvarchar](30) NULL,
	[CNOFID] [nvarchar](10) NULL,
	[CNRCLS] [nvarchar](1) NULL,
	[CNFUSR] [nvarchar](10) NULL,
	[CNFDTE] [numeric](8, 0) NULL,
	[CNDISC] [numeric](3, 3) NULL,
	[CNBFLT] [numeric](9, 2) NULL,
	[CNFFLT] [numeric](9, 2) NULL,
	[CNBDLV] [numeric](9, 2) NULL,
	[CNFDLV] [numeric](9, 2) NULL,
	[CNBMSC] [numeric](9, 2) NULL,
	[CNFMSC] [numeric](9, 2) NULL,
	[CNBDSC] [numeric](9, 2) NULL,
	[CNFDSC] [numeric](9, 2) NULL,
	[CNBVAT] [numeric](9, 2) NULL,
	[CNFVAT] [numeric](9, 2) NULL,
	[CNBCOM] [numeric](9, 2) NULL,
	[CNFCOM] [numeric](9, 2) NULL,
	[CNCODE] [nvarchar](1) NULL,
	[CNINVC] [numeric](8, 0) NULL,
	[CNOPTN] [nvarchar](1) NULL,
	[CNINVP] [numeric](8, 0) NULL,
	[CNPACK] [nvarchar](10) NULL,
	[CNTIME] [numeric](6, 0) NULL,
	[CNUPD1] [nvarchar](1) NULL,
	[CNUPD2] [nvarchar](1) NULL,
	[CNUPD3] [nvarchar](1) NULL,
	[CNUPD4] [nvarchar](1) NULL,
	[CNUPD5] [nvarchar](1) NULL,
	[CNUPD6] [nvarchar](1) NULL,
	[CNDAT1] [numeric](8, 0) NULL,
	[CNDAT2] [numeric](8, 0) NULL,
	[CNDAT3] [numeric](8, 0) NULL,
	[CNDAT4] [numeric](8, 0) NULL,
	[CNAMT1] [numeric](9, 2) NULL,
	[CNAMT2] [numeric](9, 2) NULL,
	[CNAMT3] [numeric](9, 2) NULL,
	[CNAMT4] [numeric](9, 2) NULL,
	[CNDES1] [nvarchar](30) NULL,
	[CNDES2] [nvarchar](30) NULL,
	[CNDES3] [nvarchar](30) NULL,
	[CNDES4] [nvarchar](10) NULL,
	[CNDES5] [nvarchar](10) NULL,
	[CNDES6] [nvarchar](3) NULL,
	[CNDES7] [nvarchar](3) NULL,
	[CNCONO] [nvarchar](2) NULL,
	[CNSRCD] [nvarchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRITON_ST_ZRMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRITON_ST_ZRMST](
	[CRDATE] [numeric](8, 0) NULL,
	[CRTIME] [numeric](10, 0) NULL,
	[CRUSER] [nvarchar](20) NULL,
	[CRCNNB] [nvarchar](6) NULL,
	[CRREFR] [nvarchar](20) NULL,
	[CRCCTY] [nvarchar](16) NULL,
	[CRCCDT] [numeric](6, 0) NULL,
	[CRCCAC] [nvarchar](11) NULL,
	[CRBSAM] [numeric](11, 2) NULL,
	[CRFRAM] [numeric](11, 2) NULL,
	[CRDESG] [nvarchar](20) NULL,
	[CRLORR] [nvarchar](20) NULL,
	[CRTYPE] [nvarchar](4) NULL,
	[CRNBEN] [numeric](3, 0) NULL,
	[CRLOCT] [nvarchar](3) NULL,
	[CRRCVD] [nvarchar](8) NULL,
	[CRORGN] [nvarchar](11) NULL,
	[CRRITA] [nvarchar](32) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WEBLIB_ST_CNMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WEBLIB_ST_CNMST](
	[CNNUMB] [nvarchar](6) NULL,
	[CNCLNB] [nvarchar](6) NULL,
	[CNCLN2] [nvarchar](6) NULL,
	[CNSTDT] [numeric](8, 0) NULL,
	[CNENDT] [numeric](8, 0) NULL,
	[CNARDT] [numeric](8, 0) NULL,
	[CNCANX] [nvarchar](4) NULL,
	[CNPERS] [numeric](3, 0) NULL,
	[CNBDEP] [numeric](9, 2) NULL,
	[CNFDEP] [numeric](9, 2) NULL,
	[CNSTUS] [nvarchar](1) NULL,
	[CNUSER] [nvarchar](10) NULL,
	[CNETDT] [numeric](8, 0) NULL,
	[CNCHDT] [numeric](8, 0) NULL,
	[CNCNTR] [nvarchar](1) NULL,
	[CNRSUM] [nvarchar](1) NULL,
	[CNPRVS] [nvarchar](1) NULL,
	[CNBVRG] [nvarchar](1) NULL,
	[CNGUST] [nvarchar](1) NULL,
	[CNPREF] [nvarchar](1) NULL,
	[CNLIAB] [nvarchar](1) NULL,
	[CNBTOT] [numeric](9, 2) NULL,
	[CNFTOT] [numeric](9, 2) NULL,
	[CNDESG] [nvarchar](3) NULL,
	[CNTYPE] [nvarchar](3) NULL,
	[CNWAIT] [nvarchar](1) NULL,
	[CNBMIT] [nvarchar](1) NULL,
	[CNTEXT] [nvarchar](1) NULL,
	[CNCSPR] [nvarchar](1) NULL,
	[CNPRNT] [nvarchar](1) NULL,
	[CNTRNS] [nvarchar](1) NULL,
	[CNSALU] [nvarchar](10) NULL,
	[CNFNAM] [nvarchar](40) NULL,
	[CNNAME] [nvarchar](40) NULL,
	[CNSAL2] [nvarchar](10) NULL,
	[CNFNA2] [nvarchar](40) NULL,
	[CNNAM2] [nvarchar](40) NULL,
	[CNSTCD] [nvarchar](2) NULL,
	[CNNBCH] [numeric](3, 0) NULL,
	[CNCMDR] [nvarchar](1) NULL,
	[CNCLAS] [nvarchar](1) NULL,
	[CNGRPN] [nvarchar](10) NULL,
	[CNPSTY] [nvarchar](2) NULL,
	[CNBKNG] [nvarchar](3) NULL,
	[CNLOC1] [nvarchar](3) NULL,
	[CNLOC2] [nvarchar](3) NULL,
	[CNLOC3] [nvarchar](3) NULL,
	[CNLOC4] [nvarchar](3) NULL,
	[CNDTE1] [numeric](8, 0) NULL,
	[CNDTE4] [numeric](8, 0) NULL,
	[CNTME1] [numeric](4, 0) NULL,
	[CNTME2] [numeric](4, 0) NULL,
	[CNTME3] [numeric](4, 0) NULL,
	[CNTME4] [numeric](4, 0) NULL,
	[CNFLT1] [nvarchar](5) NULL,
	[CNFLTY] [nvarchar](5) NULL,
	[CNBOAT] [nvarchar](30) NULL,
	[CNOFID] [nvarchar](10) NULL,
	[CNRCLS] [nvarchar](1) NULL,
	[CNFUSR] [nvarchar](10) NULL,
	[CNFDTE] [numeric](8, 0) NULL,
	[CNDISC] [numeric](3, 3) NULL,
	[CNBFLT] [numeric](9, 2) NULL,
	[CNFFLT] [numeric](9, 2) NULL,
	[CNBDLV] [numeric](9, 2) NULL,
	[CNFDLV] [numeric](9, 2) NULL,
	[CNCODE] [nvarchar](1) NULL,
	[CNINVC] [numeric](8, 0) NULL,
	[CNOPTN] [nvarchar](1) NULL,
	[CNINVP] [numeric](8, 0) NULL,
	[CNPACK] [nvarchar](10) NULL,
	[CNTIME] [numeric](6, 0) NULL,
	[CNUPD1] [nvarchar](1) NULL,
	[CNUPD2] [nvarchar](1) NULL,
	[CNUPD3] [nvarchar](1) NULL,
	[CNUPD4] [nvarchar](1) NULL,
	[CNUPD5] [nvarchar](1) NULL,
	[CNUPD6] [nvarchar](1) NULL,
	[CNDAT1] [numeric](8, 0) NULL,
	[CNDAT2] [numeric](8, 0) NULL,
	[CNDAT3] [numeric](8, 0) NULL,
	[CNDAT4] [numeric](8, 0) NULL,
	[CNAMT1] [numeric](9, 2) NULL,
	[CNAMT2] [numeric](9, 2) NULL,
	[CNAMT3] [numeric](9, 2) NULL,
	[CNAMT4] [numeric](9, 2) NULL,
	[CNDES1] [nvarchar](30) NULL,
	[CNDES2] [nvarchar](30) NULL,
	[CNDES3] [nvarchar](30) NULL,
	[CNDES4] [nvarchar](10) NULL,
	[CNDES5] [nvarchar](10) NULL,
	[CNDES6] [nvarchar](3) NULL,
	[CNDES7] [nvarchar](3) NULL,
	[CNCONO] [nvarchar](2) NULL,
	[CNSRCD] [nvarchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WEBLIBSSL_ST_CNMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WEBLIBSSL_ST_CNMST](
	[CNNUMB] [nvarchar](6) NULL,
	[CNCLNB] [nvarchar](6) NULL,
	[CNCLN2] [nvarchar](6) NULL,
	[CNSTDT] [numeric](8, 0) NULL,
	[CNENDT] [numeric](8, 0) NULL,
	[CNARDT] [numeric](8, 0) NULL,
	[CNCANX] [nvarchar](4) NULL,
	[CNPERS] [numeric](3, 0) NULL,
	[CNBDEP] [numeric](9, 2) NULL,
	[CNFDEP] [numeric](9, 2) NULL,
	[CNSTUS] [nvarchar](1) NULL,
	[CNUSER] [nvarchar](10) NULL,
	[CNETDT] [numeric](8, 0) NULL,
	[CNCHDT] [numeric](8, 0) NULL,
	[CNCNTR] [nvarchar](1) NULL,
	[CNRSUM] [nvarchar](1) NULL,
	[CNPRVS] [nvarchar](1) NULL,
	[CNBVRG] [nvarchar](1) NULL,
	[CNGUST] [nvarchar](1) NULL,
	[CNPREF] [nvarchar](1) NULL,
	[CNLIAB] [nvarchar](1) NULL,
	[CNBTOT] [numeric](9, 2) NULL,
	[CNFTOT] [numeric](9, 2) NULL,
	[CNDESG] [nvarchar](3) NULL,
	[CNTYPE] [nvarchar](3) NULL,
	[CNWAIT] [nvarchar](1) NULL,
	[CNBMIT] [nvarchar](1) NULL,
	[CNTEXT] [nvarchar](1) NULL,
	[CNCSPR] [nvarchar](1) NULL,
	[CNPRNT] [nvarchar](1) NULL,
	[CNTRNS] [nvarchar](1) NULL,
	[CNSALU] [nvarchar](10) NULL,
	[CNFNAM] [nvarchar](40) NULL,
	[CNNAME] [nvarchar](40) NULL,
	[CNSAL2] [nvarchar](10) NULL,
	[CNFNA2] [nvarchar](40) NULL,
	[CNNAM2] [nvarchar](40) NULL,
	[CNSTCD] [nvarchar](2) NULL,
	[CNNBCH] [numeric](3, 0) NULL,
	[CNCMDR] [nvarchar](1) NULL,
	[CNCLAS] [nvarchar](1) NULL,
	[CNGRPN] [nvarchar](10) NULL,
	[CNPSTY] [nvarchar](2) NULL,
	[CNBKNG] [nvarchar](3) NULL,
	[CNLOC1] [nvarchar](3) NULL,
	[CNLOC2] [nvarchar](3) NULL,
	[CNLOC3] [nvarchar](3) NULL,
	[CNLOC4] [nvarchar](3) NULL,
	[CNDTE1] [numeric](8, 0) NULL,
	[CNDTE4] [numeric](8, 0) NULL,
	[CNTME1] [numeric](4, 0) NULL,
	[CNTME2] [numeric](4, 0) NULL,
	[CNTME3] [numeric](4, 0) NULL,
	[CNTME4] [numeric](4, 0) NULL,
	[CNFLT1] [nvarchar](5) NULL,
	[CNFLTY] [nvarchar](5) NULL,
	[CNBOAT] [nvarchar](30) NULL,
	[CNOFID] [nvarchar](10) NULL,
	[CNRCLS] [nvarchar](1) NULL,
	[CNFUSR] [nvarchar](10) NULL,
	[CNFDTE] [numeric](8, 0) NULL,
	[CNDISC] [numeric](3, 3) NULL,
	[CNBFLT] [numeric](9, 2) NULL,
	[CNFFLT] [numeric](9, 2) NULL,
	[CNBDLV] [numeric](9, 2) NULL,
	[CNFDLV] [numeric](9, 2) NULL,
	[CNCODE] [nvarchar](1) NULL,
	[CNINVC] [numeric](8, 0) NULL,
	[CNOPTN] [nvarchar](1) NULL,
	[CNINVP] [numeric](8, 0) NULL,
	[CNPACK] [nvarchar](10) NULL,
	[CNTIME] [numeric](6, 0) NULL,
	[CNUPD1] [nvarchar](1) NULL,
	[CNUPD2] [nvarchar](1) NULL,
	[CNUPD3] [nvarchar](1) NULL,
	[CNUPD4] [nvarchar](1) NULL,
	[CNUPD5] [nvarchar](1) NULL,
	[CNUPD6] [nvarchar](1) NULL,
	[CNDAT1] [numeric](8, 0) NULL,
	[CNDAT2] [numeric](8, 0) NULL,
	[CNDAT3] [numeric](8, 0) NULL,
	[CNDAT4] [numeric](8, 0) NULL,
	[CNAMT1] [numeric](9, 2) NULL,
	[CNAMT2] [numeric](9, 2) NULL,
	[CNAMT3] [numeric](9, 2) NULL,
	[CNAMT4] [numeric](9, 2) NULL,
	[CNDES1] [nvarchar](30) NULL,
	[CNDES2] [nvarchar](30) NULL,
	[CNDES3] [nvarchar](30) NULL,
	[CNDES4] [nvarchar](10) NULL,
	[CNDES5] [nvarchar](10) NULL,
	[CNDES6] [nvarchar](3) NULL,
	[CNDES7] [nvarchar](3) NULL,
	[CNCONO] [nvarchar](2) NULL,
	[CNSRCD] [nvarchar](5) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_NC_BookingStatusID]    Script Date: 24/08/2018 12:45:34 ******/
CREATE NONCLUSTERED INDEX [IDX_NC_BookingStatusID] ON [dbo].[ST_MARINE_FBKG]
(
	[BookingStatusID] ASC
)
INCLUDE ( 	[i_SK_Bkg],
	[SourceSysID],
	[SystemName],
	[BrandCode],
	[ProductCode],
	[CompanyNo],
	[SeasonCode],
	[ClientNo],
	[BKgLocation],
	[Boat],
	[BoatType],
	[BaseLocation],
	[DestinationLocation],
	[OptionDate],
	[ConfirmDate],
	[ArrivalDate],
	[CancelDate],
	[StartDate],
	[EndDate],
	[DepartureDate],
	[LastAmendDate],
	[CharterDuration],
	[HolidayDuration],
	[Currency],
	[BookedUser],
	[LastAmendUser],
	[ContractUser],
	[BookingChannel],
	[ExpandedBookingChannel]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ST_MARINE_PAX_NC_BKG_PAX]    Script Date: 24/08/2018 12:45:34 ******/
CREATE NONCLUSTERED INDEX [IX_ST_MARINE_PAX_NC_BKG_PAX] ON [dbo].[ST_MARINE_PAX]
(
	[BkgRef] ASC,
	[PaxNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SUNSAIL_ST_FLFLREF_NC]    Script Date: 24/08/2018 12:45:34 ******/
CREATE NONCLUSTERED INDEX [IX_SUNSAIL_ST_FLFLREF_NC] ON [dbo].[SUNSAIL_ST_FLFLREF]
(
	[RFROUTE#] ASC,
	[RFNUMB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SUNSAIL_ST_FLPASSLK_NC]    Script Date: 24/08/2018 12:45:34 ******/
CREATE NONCLUSTERED INDEX [IX_SUNSAIL_ST_FLPASSLK_NC] ON [dbo].[SUNSAIL_ST_FLPASSLK]
(
	[PLPASS#] ASC,
	[PLNUMB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_PK_TRITON_ST_CAMST]    Script Date: 24/08/2018 12:45:34 ******/
CREATE NONCLUSTERED INDEX [IX_PK_TRITON_ST_CAMST] ON [dbo].[TRITON_ST_CAMST]
(
	[CALOCT] ASC,
	[CACLAS] ASC,
	[CASCLS] ASC,
	[CAEFDT] ASC,
	[CASTDT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_TRITON_ST_FLFLREF_NC]    Script Date: 24/08/2018 12:45:34 ******/
CREATE NONCLUSTERED INDEX [IX_TRITON_ST_FLFLREF_NC] ON [dbo].[TRITON_ST_FLFLREF]
(
	[RFROUTE#] ASC,
	[RFNUMB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_TRITON_ST_FLPASSLK_NC]    Script Date: 24/08/2018 12:45:34 ******/
CREATE NONCLUSTERED INDEX [IX_TRITON_ST_FLPASSLK_NC] ON [dbo].[TRITON_ST_FLPASSLK]
(
	[PLPASS#] ASC,
	[PLNUMB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[BUILD_MOORINGS_LOG]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[BUILD_MOORINGS_LOG]
AS
  
  BEGIN
  
	SELECT 
		'TRTN-Moorings' AS [Schema], 
		LogNameFILE AS LogFileName,
		'Extract Moorings File '+ LogNameFILE AS LogSchemaExtract,
		LogDate,
		CASE WHEN LogNamePASS IS NOT NULL THEN 'PASS' ELSE 'FAIL' END AS PassFail,
		CASE WHEN LogTextPASS IS NOT NULL THEN LogTextPASS ELSE LogTextFAIL END AS LogText,
		LogTextTransferred
	FROM 
	(
		SELECT
			LOG_FILE.LogName AS LogNameFILE,
			LOG_FILE.LogText AS LogTextFILE,
			LOG_FILE.LogDate,
			LOG_FAIL.LogName AS LogNameFAIL,
			LOG_FAIL.LogText AS LogTextFAIL,
			LOG_PASS.LogName AS LogNamePASS,
			LOG_PASS.LogText AS LogTextPASS,
			LOG_TRANSFERRED.LogName AS LogNameTRANSFERRED,
			LOG_TRANSFERRED.LogText AS LogTextTRANSFERRED
		FROM
		(
			SELECT 
				LogName,
				LogText,
				LogDate
			FROM 
				MOORINGS_LOGTABLE
			WHERE
				LogText LIKE 'Transfer file:%'
		) LOG_FILE
		LEFT JOIN
		(
			SELECT 
				LogName,
				LogText
			FROM 
				MOORINGS_LOGTABLE
			WHERE
				LogText LIKE 'Receive failed%'
		) LOG_FAIL
		ON
			LOG_FAIL.LogName=LOG_FILE.LogName
		LEFT JOIN
		(
			SELECT 
				LogName,
				LogText
			FROM 
				MOORINGS_LOGTABLE
			WHERE
				LogText LIKE 'Receive completed successfully%'
		) LOG_PASS
		ON
			LOG_PASS.LogName=LOG_FILE.LogName
		LEFT JOIN
		(
			SELECT 
				LogName,
				LogText
			FROM 
				MOORINGS_LOGTABLE
			WHERE
				LogText LIKE 'Rows Transferred%'
		) LOG_TRANSFERRED
		ON
			LOG_TRANSFERRED.LogName=LOG_FILE.LogName
	)LogFile
		
END
GO
/****** Object:  StoredProcedure [dbo].[BUILD_ST_BOAT_CABIN]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[BUILD_ST_BOAT_CABIN]
AS

	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'TRTN','ST_CABIN','BUILD_ST_BOAT_CABIN'

	INSERT INTO
		ST_BOAT_CABIN
	SELECT
		'102'+ LTRIM(RTRIM(CABIN_FLMST.FLNUMB)) AS a_CABIN_FLNUMB,
		LTRIM(RTRIM(CABIN_FLMST.FLNUMB)) AS a_CABIN_FLNUMB,
		LTRIM(RTRIM(CABIN_FLMST.FLNAME)) AS a_CABIN_FLNAME,
		LTRIM(RTRIM(BOAT_FLMST.FLNUMB)) AS a_BOAT_FLNUMB,
		LTRIM(RTRIM(BOAT_FLMST.FLNAME)) AS a_BOAT_FLNAME,
		102 AS SourceSusID,
		'Triton' AS a_BOATSOURCE
	FROM 
		TRITON_ST_FLMST CABIN_FLMST
	INNER JOIN 
		TRITON_ST_FLMST BOAT_FLMST
		ON
			BOAT_FLMST.FLNUMB = LEFT(CABIN_FLMST.FLNUMB,LEN(CABIN_FLMST.FLNUMB)-1)
	LEFT JOIN 
		ST_BOAT_CABIN
		ON
			ST_BOAT_CABIN.a_CABIN_FLNUMB = CABIN_FLMST.FLNUMB
	WHERE
		RTRIM(CABIN_FLMST.FLNAME) LIKE '%'+RTRIM(BOAT_FLMST.FLNAME)+'%'
		AND
		CABIN_FLMST.FLNUMB NOT IN (RTRIM('AL432-III'),RTRIM('AL432-VII'), RTRIM('AL432-VIII'),RTRIM('AL432-XI') , RTRIM('AL432-VI')) 
		AND 
		ST_BOAT_CABIN.a_CABIN_FLNUMB IS NULL

	INSERT INTO
		ST_BOAT_CABIN
	SELECT 
		'101'+ LTRIM(RTRIM(CABIN_FLMST.FLNUMB)) AS a_CABIN_FLNUMB,
		LTRIM(RTRIM(CABIN_FLMST.FLNUMB)) AS a_CABIN_FLNUMB,
		LTRIM(RTRIM(CABIN_FLMST.FLNAME)) AS a_CABIN_FLNAME,
		LTRIM(RTRIM(BOAT_FLMST.FLNUMB)) AS a_BOAT_FLNUMB,
		LTRIM(RTRIM(BOAT_FLMST.FLNAME)) AS a_BOAT_FLNAME,
		101 AS SourceSusID,
		'Neptune' AS a_BOATSOURCE
	FROM 
		SUNSAIL_ST_FLMST CABIN_FLMST
	INNER JOIN 
		SUNSAIL_ST_FLMST BOAT_FLMST
		ON
			BOAT_FLMST.FLNUMB = LEFT(CABIN_FLMST.FLNUMB,LEN(CABIN_FLMST.FLNUMB)-1)
	LEFT JOIN 
		ST_BOAT_CABIN
		ON
			ST_BOAT_CABIN.a_CABIN_FLNUMB = CABIN_FLMST.FLNUMB
	WHERE
		RTRIM(CABIN_FLMST.FLNUMB) LIKE '%'+RTRIM(BOAT_FLMST.FLNUMB)+'%'
		AND
		SUBSTRING(CABIN_FLMST.FLNUMB,LEN(CABIN_FLMST.FLNUMB),1) IN ('A','B','C','D','E')
		AND
		CABIN_FLMST.FLNUMB NOT IN (RTRIM('AL432-III'),RTRIM('AL432-VII'), RTRIM('AL432-VIII'),RTRIM('AL432-XI') , RTRIM('AL432-VI')) 
		AND 
		ST_BOAT_CABIN.a_CABIN_FLNUMB IS NULL

	EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'TRTN','ST_CABIN'




GO
/****** Object:  StoredProcedure [dbo].[BUILD_ST_BOATCABIN_TYPE]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[BUILD_ST_BOATCABIN_TYPE]
AS

	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'TRTN','ST_BC_TYPE','BUILD_ST_BOATCABIN_TYPE'

	TRUNCATE TABLE 
		ST_BOATCABIN_TYPE

	INSERT INTO
		ST_BOATCABIN_TYPE

	SELECT
		BoatType.i_SK_InventoryDate,
		a_CABIN_FLNUMB,
		a_BOAT_FLNUMB,
		TRITON_SFT_ALLOCATION_BOAT.i_BK_FLTY AS BoatType,
		BoatType.i_BK_SourceSysID,
		BoatType.i_BK_SourceSys
	FROM
		(
			SELECT 
				i_SK_InventoryDate,
				MAX(BoatDate) AS MaxBoatDate,
				a_CABIN_FLNUMB,
				a_BOAT_FLNUMB,
				i_BK_SourceSysID, 
				i_BK_SourceSys
			FROM 
				(
				SELECT 
				   TRITON_SFT_ALLOCATION.i_SK_InventoryDate,
				   ST_BOAT_CABIN.a_CABIN_FLNUMB,
				   ST_BOAT_CABIN.a_BOAT_FLNUMB,
				   TRITON_SFT_ALLOCATION_BOAT.i_SK_InventoryDate AS BoatDate,
				   TRITON_SFT_ALLOCATION.i_BK_SourceSysID AS i_BK_SourceSysID, 
				   TRITON_SFT_ALLOCATION.i_BK_SourceSys AS i_BK_SourceSys 
				FROM
					TRITON_SFT_ALLOCATION
				LEFT JOIN 
					ST_BOAT_CABIN
					ON
						ST_BOAT_CABIN.a_CABIN_FLNUMB = TRITON_SFT_ALLOCATION.i_BK_FLNUMB 
				INNER JOIN 
					TRITON_SFT_ALLOCATION  TRITON_SFT_ALLOCATION_BOAT
					ON
						ST_BOAT_CABIN.a_BOAT_FLNUMB = TRITON_SFT_ALLOCATION_BOAT.i_BK_FLNUMB
						AND
						TRITON_SFT_ALLOCATION.i_SK_InventoryDate >= TRITON_SFT_ALLOCATION_BOAT.i_SK_InventoryDate
						AND
						ST_BOAT_CABIN.a_SourceSysID = TRITON_SFT_ALLOCATION_BOAT.i_BK_SourceSysID
					WHERE 
						i_SK_boatCabinID IS NOT NULL
				) BoatNum
			GROUP BY 
				i_SK_InventoryDate,
				a_CABIN_FLNUMB,
				a_BOAT_FLNUMB,
				i_BK_SourceSysID,
				i_BK_SourceSys
		)BoatType
		LEFT JOIN
			(
			SELECT
				MAX(i_BK_FLTY) AS i_BK_FLTY,
				i_SK_InventoryDate,
				i_BK_FLNUMB,
				i_BK_SourceSysID,
				i_BK_SourceSys
			FROM 	
				TRITON_SFT_ALLOCATION 
			GROUP BY 
				i_SK_InventoryDate,
				i_BK_FLNUMB,
				i_BK_SourceSysID,
				i_BK_SourceSys
			)TRITON_SFT_ALLOCATION_BOAT
			ON
				TRITON_SFT_ALLOCATION_BOAT.i_SK_InventoryDate = BoatType.MaxBoatDate
				AND
				TRITON_SFT_ALLOCATION_BOAT.i_BK_FLNUMB = BoatType.a_BOAT_FLNUMB	
				AND
				TRITON_SFT_ALLOCATION_BOAT.i_BK_SourceSysID = BoatType.i_BK_SourceSysID	

	
EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'TRTN','ST_BC_TYPE'
GO
/****** Object:  StoredProcedure [dbo].[BUILD_ST_MARINE_AVAILABLEPORTS]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[BUILD_ST_MARINE_AVAILABLEPORTS]
AS

	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'TRTN','ST_AVPORTS','BUILD_ST_MARINE_AVAILABLEPORTS'	
	
	TRUNCATE TABLE
		ST_MARINE_AVAILABLEPORTS
			
	INSERT INTO 
		ST_MARINE_AVAILABLEPORTS
	SELECT 
			ST_MARINE_FLIGHTINVENTORY.ArrDate AS ArrDate,
			ST_MARINE_FLIGHTINVENTORY.ArrAirport AS ArrAirport,
			a_BaseCode,
			NoDays,
			SourceSysID,
			BrandCode
		FROM 
			ST_MARINE_FLIGHTINVENTORY
		INNER JOIN
			AMI_Static.dbo.SB_MARINE_BASEAIRPORTLINK SB_MARINE_BASEAIRPORTLINK
			ON 
				ST_MARINE_FLIGHTINVENTORY.ArrAirport =  SB_MARINE_BASEAIRPORTLINK.a_ArrAirportCode
				AND
				ST_MARINE_FLIGHTINVENTORY.SourceSysID = SB_MARINE_BASEAIRPORTLINK.a_SourceSystemID			
		GROUP BY
			ST_MARINE_FLIGHTINVENTORY.ArrDate,
			ST_MARINE_FLIGHTINVENTORY.ArrAirport,
			a_BaseCode,
			NoDays,
			SourceSysID,
			BrandCode
			
	EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'TRTN','ST_AVPORTS'
GO
/****** Object:  StoredProcedure [dbo].[BUILD_ST_MARINE_AVAILPERWEEK]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[BUILD_ST_MARINE_AVAILPERWEEK]
AS

BEGIN


	EXEC  AMI_Galaxy.dbo.AMI_LOG_OPEN 'TRTN','ST_AVWEEKLY','BUILD_ST_MARINE_AVAILPERWEEK'
	
	TRUNCATE TABLE
		ST_MARINE_AVAILPERWEEK
	
	INSERT INTO
		ST_MARINE_AVAILPERWEEK
	SELECT 
		i_BK_FLNUMB,
		i_BK_FLTY,
		ST_MARINE_AVAILABLEPORTS.ArrDate,
		ST_MARINE_AVAILABLEPORTS.ArrAirport,
		i_BK_LOCT,
		ST_MARINE_AVAILABLEPORTS.NoDays,
		ST_MARINE_AVAILABLEPORTS.SourceSysID,
		ST_MARINE_AVAILABLEPORTS.BrandCode,
		1 AS Available
	FROM 
		ST_MARINE_AVAILABLEPORTS				
	LEFT JOIN			
		ST_MARINE_BOATAVAILABILITY
		ON
				ST_MARINE_BOATAVAILABILITY.i_BK_LOCT = ST_MARINE_AVAILABLEPORTS.a_BaseCode
				AND
				ST_MARINE_AVAILABLEPORTS.ArrDate  BETWEEN 
													ST_MARINE_BOATAVAILABILITY.i_SK_FirstContiguousInventoryDate 
													AND
													ST_MARINE_BOATAVAILABILITY.i_SK_LastContiguousInventoryDate 
				AND
				CONVERT(INT,(CONVERT(VARCHAR(8),DATEADD(d,ST_MARINE_AVAILABLEPORTS.NoDays-1,
								CONVERT(DATETIME,CONVERT(VARCHAR(8),BRAINII.dbo.fn_CheckDate(ST_MARINE_AVAILABLEPORTS.ArrDate),112))),112))) 
													BETWEEN 
													ST_MARINE_BOATAVAILABILITY.i_SK_FirstContiguousInventoryDate 
													AND
													ST_MARINE_BOATAVAILABILITY.i_SK_LastContiguousInventoryDate 
	WHERE 
		i_BK_FLNUMB IS NOT NULL

     EXEC  AMI_Galaxy.dbo.AMI_LOG_CLOSE 'TRTN','ST_AVWEEKLY'
     
 END
  
GO
/****** Object:  StoredProcedure [dbo].[BUILD_ST_MARINE_BEDSTOSEATS]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[BUILD_ST_MARINE_BEDSTOSEATS]
AS

BEGIN


	EXEC  AMI_Galaxy.dbo.AMI_LOG_OPEN 'TRTN','ST_B2S','BUILD_ST_MARINE_BEDSTOSEATS'
	
	TRUNCATE TABLE ST_MARINE_BEDSTOSEATS

	INSERT INTO 
		ST_MARINE_BEDSTOSEATS	
	SELECT 
		ST_MARINE_AVAILPERWEEK.i_BK_FLNUMB,
		ST_MARINE_AVAILPERWEEK.i_BK_FLTY,
		ST_MARINE_AVAILPERWEEK.ArrDate,
		ST_MARINE_AVAILPERWEEK.ArrAirport,
		ST_MARINE_AVAILPERWEEK.i_BK_LOCT,
		ST_MARINE_AVAILPERWEEK.NoDays,
		ST_MARINE_AVAILPERWEEK.SourceSysID,
		ST_MARINE_AVAILPERWEEK.BrandCode,
		CASE WHEN ST_MARINE_SOLDPERWEEK.i_BK_FLNUMB IS NOT NULL THEN 1 ELSE 0 END AS Sold,
		ST_MARINE_AVAILPERWEEK.Available
	FROM	
		ST_MARINE_AVAILPERWEEK
	LEFT JOIN
			ST_MARINE_SOLDPERWEEK
		ON
			ST_MARINE_AVAILPERWEEK.ArrDate = ST_MARINE_SOLDPERWEEK.ArrDate
			AND
			ST_MARINE_AVAILPERWEEK.ArrAirport = ST_MARINE_SOLDPERWEEK.ArrAirport
			AND
			ST_MARINE_AVAILPERWEEK.NoDays= ST_MARINE_SOLDPERWEEK.NoDays
			AND
			ST_MARINE_AVAILPERWEEK.i_BK_FLNUMB= ST_MARINE_SOLDPERWEEK.i_BK_FLNUMB
			AND
			ST_MARINE_AVAILPERWEEK.i_BK_FLTY= ST_MARINE_SOLDPERWEEK.i_BK_FLTY
			
	EXEC  AMI_Galaxy.dbo.AMI_LOG_CLOSE 'TRTN','ST_B2S'
	
END
	
GO
/****** Object:  StoredProcedure [dbo].[BUILD_ST_MARINE_BOATAVAILABILITY]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[BUILD_ST_MARINE_BOATAVAILABILITY]
AS

	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'TRTN','ST_AVAIL','BUILD_ST_MARINE_BOATAVAILABILITY'

	TRUNCATE TABLE ST_MARINE_BOATAVAILABILITY

	INSERT INTO
		ST_MARINE_BOATAVAILABILITY
	SELECT
		CONTIGUOUS_ALLOCATION.i_BK_FLNUMB,
		CONTIGUOUS_ALLOCATION.i_BK_FLTY,
		CONTIGUOUS_ALLOCATION.i_BK_LOCT,
		MIN(CONTIGUOUS_ALLOCATION.i_SK_InventoryDate) AS i_SK_FirstContiguousInventoryDate,
		CONTIGUOUS_ALLOCATION.i_SK_LastContiguousInventoryDate,
		CONTIGUOUS_ALLOCATION.I_BK_SourceSysID,
		CONTIGUOUS_ALLOCATION.i_BK_BrandCode
	FROM
	(
		SELECT
			TRITON_SFT_ALLOCATION.i_BK_FLNUMB,
			TRITON_SFT_ALLOCATION.i_BK_FLTY,
			TRITON_SFT_ALLOCATION.i_BK_LOCT,
			TRITON_SFT_ALLOCATION.i_SK_InventoryDate,
			MIN(CONTIGUOUS_ALLOCATION.i_SK_InventoryDate) AS i_SK_LastContiguousInventoryDate,
			TRITON_SFT_ALLOCATION.I_BK_SourceSysID,
			TRITON_SFT_ALLOCATION.i_BK_BrandCode
		FROM
			TRITON_SFT_ALLOCATION
		LEFT JOIN
			(
				SELECT
					  TRITON_SFT_ALLOCATION.i_BK_FLNUMB,
					  TRITON_SFT_ALLOCATION.i_BK_FLTY,
					  TRITON_SFT_ALLOCATION.i_BK_LOCT,
					  TRITON_SFT_ALLOCATION.i_SK_InventoryDate,
					  CASE WHEN SFT_ALLOCATION_NEXT_DAY.i_SK_InventoryDate IS NOT NULL THEN 'Y' ELSE 'N' END AS NextDayRecordAvailable,
					  TRITON_SFT_ALLOCATION.I_BK_SourceSysID,
					  TRITON_SFT_ALLOCATION.i_BK_BrandCode
				FROM
					  TRITON_SFT_ALLOCATION
				LEFT JOIN
					  AMI_Galaxy.dbo.CONF_DT_CALENDAR TODAY_DT_CALENDAR
					  ON
							TODAY_DT_CALENDAR.i_SK_Calendar=TRITON_SFT_ALLOCATION.i_SK_InventoryDate
				LEFT JOIN
					  AMI_Galaxy.dbo.CONF_DT_CALENDAR TOMORROW_DT_CALENDAR
					  ON
							TOMORROW_DT_CALENDAR.a_Date=TODAY_DT_CALENDAR.a_Date+1
				LEFT JOIN
					  TRITON_SFT_ALLOCATION SFT_ALLOCATION_NEXT_DAY
					  ON
							SFT_ALLOCATION_NEXT_DAY.i_BK_FLNUMB=TRITON_SFT_ALLOCATION.i_BK_FLNUMB
							AND
							SFT_ALLOCATION_NEXT_DAY.i_BK_FLTY=TRITON_SFT_ALLOCATION.i_BK_FLTY
							AND
							SFT_ALLOCATION_NEXT_DAY.i_BK_LOCT=TRITON_SFT_ALLOCATION.i_BK_LOCT
							AND
							SFT_ALLOCATION_NEXT_DAY.i_SK_InventoryDate=TOMORROW_DT_CALENDAR.i_SK_Calendar
							AND
							SFT_ALLOCATION_NEXT_DAY.I_BK_SourceSysID=TRITON_SFT_ALLOCATION.I_BK_SourceSysID
							AND
							SFT_ALLOCATION_NEXT_DAY.i_BK_BrandCode=TRITON_SFT_ALLOCATION.i_BK_BrandCode
				WHERE
					  --TRITON_SFT_ALLOCATION.i_SK_InventoryDate> CONVERT(INT,CONVERT(VARCHAR(8),DATEADD(d,-60,GETDATE()),112))
					  TRITON_SFT_ALLOCATION.i_SK_InventoryDate > 20131101
			) CONTIGUOUS_ALLOCATION
			ON
				CONTIGUOUS_ALLOCATION.i_BK_FLNUMB=TRITON_SFT_ALLOCATION.i_BK_FLNUMB
				AND
				CONTIGUOUS_ALLOCATION.i_BK_FLTY=TRITON_SFT_ALLOCATION.i_BK_FLTY
				AND
				CONTIGUOUS_ALLOCATION.i_BK_LOCT=TRITON_SFT_ALLOCATION.i_BK_LOCT
				AND
				CONTIGUOUS_ALLOCATION.i_SK_InventoryDate>=TRITON_SFT_ALLOCATION.i_SK_InventoryDate
				AND
				CONTIGUOUS_ALLOCATION.NextDayRecordAvailable='N'
		WHERE
			--TRITON_SFT_ALLOCATION.i_SK_InventoryDate> CONVERT(INT,CONVERT(VARCHAR(8),DATEADD(d,-60,GETDATE()),112))
			TRITON_SFT_ALLOCATION.i_SK_InventoryDate > 20131101
		GROUP BY
			TRITON_SFT_ALLOCATION.i_BK_FLNUMB,
			TRITON_SFT_ALLOCATION.i_BK_FLTY,
			TRITON_SFT_ALLOCATION.i_BK_LOCT,
			TRITON_SFT_ALLOCATION.i_SK_InventoryDate,
			TRITON_SFT_ALLOCATION.I_BK_SourceSysID,
			TRITON_SFT_ALLOCATION.i_BK_BrandCode
      ) CONTIGUOUS_ALLOCATION
	GROUP BY
		CONTIGUOUS_ALLOCATION.i_BK_FLNUMB,
		CONTIGUOUS_ALLOCATION.i_BK_FLTY,
		CONTIGUOUS_ALLOCATION.i_BK_LOCT,
		CONTIGUOUS_ALLOCATION.i_SK_LastContiguousInventoryDate,
		CONTIGUOUS_ALLOCATION.I_BK_SourceSysID,
		CONTIGUOUS_ALLOCATION.i_BK_BrandCode
		
	EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'TRTN','ST_AVAIL'
GO
/****** Object:  StoredProcedure [dbo].[BUILD_ST_MARINE_BOOKINGITEMS]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[BUILD_ST_MARINE_BOOKINGITEMS]
AS

BEGIN


	EXEC  AMI_Galaxy.dbo.AMI_LOG_OPEN 'TRTN','ST_BKGITEMS','BUILD_ST_MARINE_BOOKINGITEMS'
			
	TRUNCATE TABLE ST_MARINE_BOOKINGITEMS
	
	INSERT INTO	
		ST_MARINE_BOOKINGITEMS
	SELECT 
		DISTINCT
		i_SK_Calendar,
		ST_MARINE_FITN.i_SK_Bkg,
		ST_MARINE_FITN.[Status],
		ST_MARINE_FITN.SourceSysID,
		ST_MARINE_FITN.BrandCode,
		ST_MARINE_FITN.CompanyNo,
		'Y' AS BoatFlag,
		'N' AS FlightFlag,
		'N' AS AccomFlag,
		'N' AS TransferFlag
	FROM 
		AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR
	INNER JOIN 
		ST_MARINE_FITN 
		ON 
			CONF_DT_CALENDAR.i_SK_Calendar BETWEEN  ST_MARINE_FITN.ItemStartDate 
													AND 
													CASE  
														WHEN ST_MARINE_FITN.ItemStartDate= ST_MARINE_FITN.ItemEndDate 
																THEN ST_MARINE_FITN.ItemEndDate
																ELSE ST_MARINE_FITN.ItemEndDate - 1 END
	WHERE
		ST_MARINE_FITN.ClassCode = 'F'
				
		
	-- Update flight flags for the date and bookings which already exist in the ST_MARINE_BOOKINGITEMS table	
	UPDATE 
		ST_MARINE_BOOKINGITEMS
	SET 
		FlightFlag ='Y'
	FROM 
		AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR
	INNER JOIN 
		ST_MARINE_FITN 
		ON 
			CONF_DT_CALENDAR.i_SK_Calendar BETWEEN  ST_MARINE_FITN.ItemStartDate 
													AND 
													CASE  
														WHEN ST_MARINE_FITN.ItemStartDate= ST_MARINE_FITN.ItemEndDate 
																THEN ST_MARINE_FITN.ItemEndDate
																ELSE ST_MARINE_FITN.ItemEndDate - 1 END
	INNER JOIN
		ST_MARINE_BOOKINGITEMS
		ON
			ST_MARINE_BOOKINGITEMS.i_SK_Calendar = CONF_DT_CALENDAR	.i_SK_Calendar
			AND
			ST_MARINE_FITN.i_SK_Bkg = ST_MARINE_BOOKINGITEMS.i_SK_Bkg
	WHERE
		ST_MARINE_FITN.ItineraryLineType = 'FLT'
	
	-- Insert new records for the bookings and dates which they don't exist in ST_MARINE_BOOKINGITEMS table		
	INSERT INTO	
		ST_MARINE_BOOKINGITEMS
	SELECT DISTINCT
		CONF_DT_CALENDAR.i_SK_Calendar,
		ST_MARINE_FITN.i_SK_Bkg,
		ST_MARINE_FITN.[Status],
		ST_MARINE_FITN.SourceSysID,
		ST_MARINE_FITN.BrandCode,
		ST_MARINE_FITN.CompanyNo,
		'N' AS BoatFlag,
		'Y' AS FlightFlag,
		'N' AS AccomFlag,
		'N' AS TransferFlag
	FROM 
		AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR
	INNER JOIN 
		ST_MARINE_FITN 
		ON 
			CONF_DT_CALENDAR.i_SK_Calendar BETWEEN  ST_MARINE_FITN.ItemStartDate 
													AND 
													CASE  
														WHEN ST_MARINE_FITN.ItemStartDate= ST_MARINE_FITN.ItemEndDate 
																THEN ST_MARINE_FITN.ItemEndDate
																ELSE ST_MARINE_FITN.ItemEndDate - 1 END
	LEFT JOIN
		ST_MARINE_BOOKINGITEMS
		ON
			ISNULL(ST_MARINE_FITN.i_SK_Bkg,'~') = ISNULL(ST_MARINE_BOOKINGITEMS.i_SK_Bkg,'~')
			AND
			CONF_DT_CALENDAR.i_SK_Calendar = ISNULL(ST_MARINE_BOOKINGITEMS.i_SK_Calendar,'~')
	WHERE
		ST_MARINE_FITN.ItineraryLineType = 'FLT'
		AND
		ST_MARINE_BOOKINGITEMS.i_SK_Calendar  IS NULL
		
	-- Update accom flags for the date and bookings which already exist in the ST_MARINE_BOOKINGITEMS table	
	UPDATE 
		ST_MARINE_BOOKINGITEMS
	SET 
		AccomFlag ='Y'
	FROM 
		AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR
	INNER JOIN 
		ST_MARINE_FITN 
		ON 
			CONF_DT_CALENDAR.i_SK_Calendar BETWEEN  ST_MARINE_FITN.ItemStartDate 
													AND 
													CASE  
														WHEN ST_MARINE_FITN.ItemStartDate= ST_MARINE_FITN.ItemEndDate 
																THEN ST_MARINE_FITN.ItemEndDate
																ELSE ST_MARINE_FITN.ItemEndDate - 1 END
	INNER JOIN
		ST_MARINE_BOOKINGITEMS
		ON
			ST_MARINE_BOOKINGITEMS.i_SK_Calendar = CONF_DT_CALENDAR	.i_SK_Calendar
			AND
			ST_MARINE_FITN.i_SK_Bkg = ST_MARINE_BOOKINGITEMS.i_SK_Bkg
	WHERE
		ST_MARINE_FITN.ClassCode = 'A'
		
	-- Insert new records for the bookings and dates which they don't exist in ST_MARINE_BOOKINGITEMS table		
	INSERT INTO	
		ST_MARINE_BOOKINGITEMS
	SELECT DISTINCT
		CONF_DT_CALENDAR.i_SK_Calendar,
		ST_MARINE_FITN.i_SK_Bkg,
		ST_MARINE_FITN.[Status],
		ST_MARINE_FITN.SourceSysID,
		ST_MARINE_FITN.BrandCode,
		ST_MARINE_FITN.CompanyNo,
		'N' AS BoatFlag,
		'N' AS FlightFlag,
		'Y' AS AccomFlag,
		'N' AS TransferFlag
	FROM 
		AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR
	INNER JOIN 
		ST_MARINE_FITN 
		ON 
			CONF_DT_CALENDAR.i_SK_Calendar BETWEEN  ST_MARINE_FITN.ItemStartDate 
													AND 
													CASE  
														WHEN ST_MARINE_FITN.ItemStartDate= ST_MARINE_FITN.ItemEndDate 
																THEN ST_MARINE_FITN.ItemEndDate
																ELSE ST_MARINE_FITN.ItemEndDate - 1 END
	LEFT JOIN
		ST_MARINE_BOOKINGITEMS
		ON
			ISNULL(ST_MARINE_FITN.i_SK_Bkg,'~') = ISNULL(ST_MARINE_BOOKINGITEMS.i_SK_Bkg,'~')
			AND
			CONF_DT_CALENDAR.i_SK_Calendar = ISNULL(ST_MARINE_BOOKINGITEMS.i_SK_Calendar,'~')
	WHERE
		ST_MARINE_FITN.ClassCode = 'A'
		AND
		ST_MARINE_BOOKINGITEMS.i_SK_Calendar  IS NULL	
		
	
	-- Update transfer flags for the date and bookings which already exist in the ST_MARINE_BOOKINGITEMS table	
	UPDATE 
		ST_MARINE_BOOKINGITEMS
	SET 
		TransferFlag ='Y'
	FROM 
		AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR
	INNER JOIN 
		ST_MARINE_FITN 
		ON 
			CONF_DT_CALENDAR.i_SK_Calendar BETWEEN 
											CASE WHEN ST_MARINE_FITN.ItemStartDate = 0 THEN ST_MARINE_FITN.ItemEndDate ELSE ST_MARINE_FITN.ItemStartDate END 
											AND 
											CASE WHEN ST_MARINE_FITN.ItemEndDate = 0 THEN ST_MARINE_FITN.ItemStartDate ELSE ST_MARINE_FITN.ItemEndDate END
	INNER JOIN
		ST_MARINE_BOOKINGITEMS
		ON
			ST_MARINE_BOOKINGITEMS.i_SK_Calendar = CONF_DT_CALENDAR	.i_SK_Calendar
			AND
			ST_MARINE_FITN.i_SK_Bkg = ST_MARINE_BOOKINGITEMS.i_SK_Bkg
	WHERE
		ST_MARINE_FITN.ClassCode = 'B'
		
	-- Insert new records for the bookings and dates which they don't exist in ST_MARINE_BOOKINGITEMS table		
	INSERT INTO	
		ST_MARINE_BOOKINGITEMS
	SELECT DISTINCT
		CONF_DT_CALENDAR.i_SK_Calendar,
		ST_MARINE_FITN.i_SK_Bkg,
		ST_MARINE_FITN.[Status],
		ST_MARINE_FITN.SourceSysID,
		ST_MARINE_FITN.BrandCode,
		ST_MARINE_FITN.CompanyNo,
		'N' AS BoatFlag,
		'N' AS FlightFlag,
		'N' AS AccomFlag,
		'Y' AS TransferFlag
	FROM 
		AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR
	INNER JOIN 
		ST_MARINE_FITN 
		ON 
			CONF_DT_CALENDAR.i_SK_Calendar BETWEEN 
											CASE WHEN ST_MARINE_FITN.ItemStartDate = 0 THEN ST_MARINE_FITN.ItemEndDate ELSE ST_MARINE_FITN.ItemStartDate END 
											AND 
											CASE WHEN ST_MARINE_FITN.ItemEndDate = 0 THEN ST_MARINE_FITN.ItemStartDate ELSE ST_MARINE_FITN.ItemEndDate END
	LEFT JOIN
		ST_MARINE_BOOKINGITEMS
		ON
			ISNULL(ST_MARINE_FITN.i_SK_Bkg,'~') = ISNULL(ST_MARINE_BOOKINGITEMS.i_SK_Bkg,'~')
			AND
			CONF_DT_CALENDAR.i_SK_Calendar = ISNULL(ST_MARINE_BOOKINGITEMS.i_SK_Calendar,'~')
	WHERE
		ST_MARINE_FITN.ClassCode = 'B'
		AND
		ST_MARINE_BOOKINGITEMS.i_SK_Calendar  IS NULL
		
		
			
		
	EXEC  AMI_Galaxy.dbo.AMI_LOG_CLOSE 'TRTN','ST_BKGITEMS'	
END
	
	
		
				
				
		


GO
/****** Object:  StoredProcedure [dbo].[BUILD_ST_MARINE_BROCHUREREQUESTS]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[BUILD_ST_MARINE_BROCHUREREQUESTS]
AS

	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'TRTN','ST_BRREQ','BUILD_ST_MARINE_BROCHUREREQUESTS'


	INSERT INTO 
		ST_MARINE_BROCHUREREQUESTS
	SELECT  DISTINCT
		101 AS a_SourceSysID,
		'SUN' AS BrandCode,
		'French Brochure' AS BrochureType,
		TBCLNB AS Client,
		CASE WHEN LEN(SUNSAIL_ST_TBMST.TBDATE) < 8  THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_TBMST.TBDATE),112)) END  AS RequestDate,
		TBQNTY AS QtyRequested,
		TBCODE AS BrochureCode,
		CASE WHEN LEN(SUNSAIL_ST_TBMST.TBPDTE) < 8 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_TBMST.TBPDTE),112)) END AS PrintDate,
		TBPRNT AS Printed,
		CASE WHEN LEN(SUNSAIL_ST_TBMST.TBLSCB) < 8 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_TBMST.TBLSCB),112)) END AS LastCallDate,
		CASE WHEN SUNSAIL_ST_TBMST.TBNXCB IN (0,101) THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_TBMST.TBNXCB),112)) END AS NextCallDate,
		TBAREA AS AreaOfInterest,
		TBSEAS AS SeasonOfInterest,
		CASE WHEN SUNSAIL_ST_TBMST.TBLSDT = 0 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_TBMST.TBLSDT),112)) END AS LostSaleDate,
		TBLSCD AS LostSaleCode,
		TBBKNG AS BookingLocation,
		NULL AS [Primary]
	FROM 
		SUNSAIL_ST_TBMST
	LEFT JOIN 
		ST_MARINE_BROCHUREREQUESTS
		ON
			ST_MARINE_BROCHUREREQUESTS.Client = SUNSAIL_ST_TBMST.TBCLNB
			AND
			ST_MARINE_BROCHUREREQUESTS.RequestDate = CASE WHEN LEN(SUNSAIL_ST_TBMST.TBDATE) < 8  THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_TBMST.TBDATE),112)) END
			AND
			ST_MARINE_BROCHUREREQUESTS.BrochureCode = SUNSAIL_ST_TBMST.TBCODE
			AND
			ST_MARINE_BROCHUREREQUESTS.PrintDate = CASE WHEN LEN(SUNSAIL_ST_TBMST.TBPDTE) < 8 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_TBMST.TBPDTE),112)) END
			AND
			ST_MARINE_BROCHUREREQUESTS.Printed = SUNSAIL_ST_TBMST.TBPRNT
			AND
			ST_MARINE_BROCHUREREQUESTS.LastCallDate =  CASE WHEN LEN(SUNSAIL_ST_TBMST.TBLSCB) < 8 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_TBMST.TBLSCB),112)) END
			AND 
			ST_MARINE_BROCHUREREQUESTS.NextCallDate = CASE WHEN SUNSAIL_ST_TBMST.TBNXCB IN (0,101) THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_TBMST.TBNXCB),112)) END
			AND
			ST_MARINE_BROCHUREREQUESTS.AreaOfInterest = SUNSAIL_ST_TBMST.TBAREA 
			AND
			ST_MARINE_BROCHUREREQUESTS.SeasonOfInterest = SUNSAIL_ST_TBMST.TBSEAS
			AND
			ST_MARINE_BROCHUREREQUESTS.LostSaleDate = CASE WHEN SUNSAIL_ST_TBMST.TBLSDT = 0 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_TBMST.TBLSDT),112)) END
			AND
			ST_MARINE_BROCHUREREQUESTS.LostSaleCode= SUNSAIL_ST_TBMST.TBLSCD
			AND
			ST_MARINE_BROCHUREREQUESTS.BookingLocation= SUNSAIL_ST_TBMST.TBBKNG
			AND
			ST_MARINE_BROCHUREREQUESTS.SourceSysID =101
			AND
			ST_MARINE_BROCHUREREQUESTS.BrochureType = 'French Brochure'
	WHERE 
		ST_MARINE_BROCHUREREQUESTS.SourceSysID IS NULL
		
		
	INSERT INTO 
		ST_MARINE_BROCHUREREQUESTS
	SELECT  DISTINCT
		101 AS SourceSysID,
		'SUN' AS BrandCode,
		'Brochure' AS BrochureType,
		BTNUMB AS Client,
		CASE WHEN LEN(SUNSAIL_ST_BTMST.BTRDTE) < 8  THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_BTMST.BTRDTE),112)) END  AS RequestDate,
		BTQNTY AS QtyRequested,
		BTCODE AS BrochureCode,
		CASE WHEN LEN(SUNSAIL_ST_BTMST.BTPDTE) < 8 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_BTMST.BTPDTE),112)) END AS PrintDate,
		BTPRNT AS Printed,
		NULL AS LastCallDate,
		NULL AS NextCallDate,
		NULL AS AreaOfInterest,
		NULL AS SeasonOfInterest,
		NULL AS LostSaleDate,
		NULL AS LostSaleCode,
		NULL AS BookingLocation,
		BTPRIM AS [Primary]
	FROM 
		SUNSAIL_ST_BTMST
	LEFT JOIN 
		ST_MARINE_BROCHUREREQUESTS
		ON
			ST_MARINE_BROCHUREREQUESTS.Client = SUNSAIL_ST_BTMST.BTNUMB
			AND
			ST_MARINE_BROCHUREREQUESTS.RequestDate = CASE WHEN LEN(SUNSAIL_ST_BTMST.BTRDTE) < 8  THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_BTMST.BTRDTE),112)) END
			AND
			ST_MARINE_BROCHUREREQUESTS.BrochureCode = SUNSAIL_ST_BTMST.BTCODE
			AND
			ST_MARINE_BROCHUREREQUESTS.PrintDate =  CASE WHEN LEN(SUNSAIL_ST_BTMST.BTPDTE) < 8 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_BTMST.BTPDTE),112)) END
			AND
			ST_MARINE_BROCHUREREQUESTS.Printed = SUNSAIL_ST_BTMST.BTPRNT
			AND
			ST_MARINE_BROCHUREREQUESTS.[Primary]= SUNSAIL_ST_BTMST.BTPRIM 
			AND
			ST_MARINE_BROCHUREREQUESTS.SourceSysID =101
			AND
			ST_MARINE_BROCHUREREQUESTS.BrochureType = 'Brochure'
	WHERE 
		ST_MARINE_BROCHUREREQUESTS.SourceSysID IS NULL
		
	INSERT INTO 
		ST_MARINE_BROCHUREREQUESTS
	SELECT  DISTINCT
		102 AS a_SourceSysID,
		'MRG' AS BrandCode,
		'French Brochure' AS BrochureType,
		TBCLNB AS Client,
		CASE WHEN LEN(TRITON_ST_TBMST.TBDATE) < 8  THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(TRITON_ST_TBMST.TBDATE),112)) END  AS RequestDate,
		TBQNTY AS QtyRequested,
		TBCODE AS BrochureCode,
		CASE WHEN LEN(TRITON_ST_TBMST.TBPDTE) < 8 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(TRITON_ST_TBMST.TBPDTE),112)) END AS PrintDate,
		TBPRNT AS Printed,
		CASE WHEN LEN(TRITON_ST_TBMST.TBLSCB) < 8 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(TRITON_ST_TBMST.TBLSCB),112)) END AS LastCallDate,
		CASE WHEN TRITON_ST_TBMST.TBNXCB IN (0,101) THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(TRITON_ST_TBMST.TBNXCB),112)) END AS NextCallDate,
		TBAREA AS AreaOfInterest,
		TBSEAS AS SeasonOfInterest,
		CASE WHEN TRITON_ST_TBMST.TBLSDT = 0 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(TRITON_ST_TBMST.TBLSDT),112)) END AS LostSaleDate,
		TBLSCD AS LostSaleCode,
		TBBKNG AS BookingLocation,
		NULL AS [Primary]
	FROM 
		TRITON_ST_TBMST
	LEFT JOIN 
		ST_MARINE_BROCHUREREQUESTS
		ON
			ST_MARINE_BROCHUREREQUESTS.Client = TRITON_ST_TBMST.TBCLNB
			AND
			ST_MARINE_BROCHUREREQUESTS.RequestDate = CASE WHEN LEN(TRITON_ST_TBMST.TBDATE) < 8  THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(TRITON_ST_TBMST.TBDATE),112)) END
			AND
			ST_MARINE_BROCHUREREQUESTS.BrochureCode = TRITON_ST_TBMST.TBCODE
			AND
			ST_MARINE_BROCHUREREQUESTS.PrintDate = CASE WHEN LEN(TRITON_ST_TBMST.TBPDTE) < 8 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(TRITON_ST_TBMST.TBPDTE),112)) END
			AND
			ST_MARINE_BROCHUREREQUESTS.Printed = TRITON_ST_TBMST.TBPRNT
			AND
			ST_MARINE_BROCHUREREQUESTS.LastCallDate =  CASE WHEN LEN(TRITON_ST_TBMST.TBLSCB) < 8 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(TRITON_ST_TBMST.TBLSCB),112)) END
			AND 
			ST_MARINE_BROCHUREREQUESTS.NextCallDate = CASE WHEN TRITON_ST_TBMST.TBNXCB IN (0,101) THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(TRITON_ST_TBMST.TBNXCB),112)) END
			AND
			ST_MARINE_BROCHUREREQUESTS.AreaOfInterest = TRITON_ST_TBMST.TBAREA 
			AND
			ST_MARINE_BROCHUREREQUESTS.SeasonOfInterest = TRITON_ST_TBMST.TBSEAS
			AND
			ST_MARINE_BROCHUREREQUESTS.LostSaleDate = CASE WHEN TRITON_ST_TBMST.TBLSDT = 0 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(TRITON_ST_TBMST.TBLSDT),112)) END
			AND
			ST_MARINE_BROCHUREREQUESTS.LostSaleCode = TRITON_ST_TBMST.TBLSCD
			AND
			ST_MARINE_BROCHUREREQUESTS.BookingLocation= TRITON_ST_TBMST.TBBKNG
			AND
			ST_MARINE_BROCHUREREQUESTS.SourceSysID =102
			AND
			ST_MARINE_BROCHUREREQUESTS.BrochureType = 'French Brochure'
	WHERE 
		ST_MARINE_BROCHUREREQUESTS.SourceSysID IS NULL
		
		
	INSERT INTO 
		ST_MARINE_BROCHUREREQUESTS
	SELECT  DISTINCT
		102 AS SourceSysID,
		'MRG' AS BrandCode,
		'Brochure' AS BrochureType,
		BTNUMB AS Client,
		CASE WHEN LEN(TRITON_ST_BTMST.BTRDTE) < 8  THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(TRITON_ST_BTMST.BTRDTE),112)) END  AS RequestDate,
		BTQNTY AS QtyRequested,
		BTCODE AS BrochureCode,
		CASE WHEN LEN(TRITON_ST_BTMST.BTPDTE) < 8 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(TRITON_ST_BTMST.BTPDTE),112)) END AS PrintDate,
		BTPRNT AS Printed,
		NULL AS LastCallDate,
		NULL AS NextCallDate,
		NULL AS AreaOfInterest,
		NULL AS SeasonOfInterest,
		NULL AS LostSaleDate,
		NULL AS LostSaleCode,
		NULL AS BookingLocation,
		BTPRIM AS [Primary]
	FROM 
		TRITON_ST_BTMST
	LEFT JOIN 
		ST_MARINE_BROCHUREREQUESTS
		ON
			ST_MARINE_BROCHUREREQUESTS.Client = TRITON_ST_BTMST.BTNUMB
			AND
			ST_MARINE_BROCHUREREQUESTS.RequestDate = CASE WHEN LEN(TRITON_ST_BTMST.BTRDTE) < 8  THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(TRITON_ST_BTMST.BTRDTE),112)) END
			AND
			ST_MARINE_BROCHUREREQUESTS.BrochureCode = TRITON_ST_BTMST.BTCODE
			AND
			ST_MARINE_BROCHUREREQUESTS.PrintDate =  CASE WHEN LEN(TRITON_ST_BTMST.BTPDTE) < 8 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(TRITON_ST_BTMST.BTPDTE),112)) END
			AND
			ST_MARINE_BROCHUREREQUESTS.Printed = TRITON_ST_BTMST.BTPRNT
			AND
			ST_MARINE_BROCHUREREQUESTS.[Primary]= TRITON_ST_BTMST.BTPRIM 
			AND
			ST_MARINE_BROCHUREREQUESTS.SourceSysID =102
			AND
			ST_MARINE_BROCHUREREQUESTS.BrochureType = 'Brochure'
	WHERE 
		ST_MARINE_BROCHUREREQUESTS.SourceSysID IS NULL

	
	EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'TRTN','ST_BRREQ'
GO
/****** Object:  StoredProcedure [dbo].[BUILD_ST_MARINE_FBKG]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Description:	KFeaster(19/07/2017): Added the column BookedWithMIT
--				KFeaster(20/07/2017): Comented out the column BookedWithMIT
---				KFeaster(20/07/2017): Added the column BookedWithMIT
--				KFeaster(23/08/2017): Added columns, SB_MARINE_BASE_START.i_sk_base_from ,
--									  SB_MARINE_BASE_END.i_sk_base_to
--              RTeji   (04/01/2018): MI-1307(JIRA) Product Code Logic where Crewed preceds Power applied for Moorings only 
--              RTeji   (02/05/2018): MMK MI-90 Add Update bookingchannel & Expandedbookingchanel definition to include MMK when CNUSER='MMK'
--              RTeji   (19/06/2018): MI-1392(JIRA) Update Confirmdate & Bookingstatusid definition to include booking sourcecode 'MMK2' when option status is confirmed 
--              RTeji   (09/08/2018): MI-1311(JIRA) Update Bookingchannelexpanded definition for master yachting to precede all above rules.
-- =============================================


CREATE PROCEDURE [dbo].[BUILD_ST_MARINE_FBKG]
AS

	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'TRTN','ST_FBKG','BUILD_ST_MARINE_FBKG'

	TRUNCATE TABLE ST_MARINE_FBKG

	INSERT INTO 
		ST_MARINE_FBKG
	SELECT				
		CAST(CAST(102 AS VARCHAR(3)) 
		+	CASE WHEN SUBSTRING(TRITON_ST_CNMST.CNNUMB,1,1) IN ('0','1','2','3','4','5','6','7','8','9') 
				THEN
					RIGHT('0000000'+ CAST(TRITON_ST_CNMST.CNNUMB AS VARCHAR(7)), 7) 
				ELSE
					CAST(ASCII(SUBSTRING(TRITON_ST_CNMST.CNNUMB,1,1)) AS CHAR(2)) + SUBSTRING(TRITON_ST_CNMST.CNNUMB,2,LEN(TRITON_ST_CNMST.CNNUMB)) 
				END	
		AS BIGINT) AS i_Sk_Bkg,
		102 AS SourceSysID,
		'TRITON' AS SystemName,
		'M' AS	DivisionCode,
		CASE WHEN SB_MARINE_BASE.a_ProductCode ='FOOTLOOSE' THEN 'FTL' ELSE 'MRG'END AS Brandcode,
		CASE WHEN SB_MARINE_BASE.a_ProductCode ='FOOTLOOSE' THEN 'FOOTLOOSE'
			 WHEN SB_MARINE_BASE.a_ProductCode ='FRANCHISE' THEN 'FRANCHISE'
			 WHEN TRITON_ST_FTMST.FTCREW = 'Y' THEN 'CREWED'
			 WHEN TRITON_ST_FTMST.FTHULL IN('P','T') THEN 'POWER'
			 ELSE SB_MARINE_BASE.a_ProductCode END AS ProductCode,
		NULL AS BookingType,
		0 AS CompanyNo,
		SB_SEASON.i_BK_SeasonCode AS SeasonCode,
		CASE
				WHEN TRITON_ST_CHMST.CHDPDT=0 AND TRITON_ST_CHMST.CHCNDT<>0 THEN 9
				WHEN TRITON_ST_CHMST.CHCNDT<>0 THEN 8
				WHEN TRITON_ST_CHMST.CHDPDT<>0 THEN 3
				WHEN TRITON_ST_CHMST.CHDPDT=0 AND TRITON_ST_CNMST.CNSRCD IN ('OWNER','OPS','TAAC','MMK2') AND TRITON_ST_CNMST.CNOPTN = 'C' THEN 3
				ELSE 1
			END AS BookingStatusID,
		RTRIM(LTRIM(TRITON_ST_CNMST.CNNUMB)) AS BkgRef,
		RTRIM(LTRIM(TRITON_ST_CNMST.CNCLNB)) AS ClientNo,
		RTRIM(LTRIM(TRITON_ST_CNMST.CNLOC2)) AS DestResortCd, 
		RTRIM(LTRIM(TRITON_ST_CNMST.CNBKNG)) AS BkgLocation, 
		TRITON_ST_CNMST.CNPERS AS PaxNo,
		TRITON_ST_CNMST.CNOFID AS Boat,
		TRITON_ST_CNMST.CNFLTY AS BoatType, 
		TRITON_ST_FTMST.FTCREW AS CrewedFlag, 
		TRITON_ST_CNMST.CNLOC2 AS BaseLocation,
		TRITON_ST_CNMST.CNDES6 AS DestinationLocation, 
		CASE WHEN TRITON_ST_CNMST.CNETDT = 0 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_ST_CNMST.CNETDT),112) END  AS OptionDate,
		CASE WHEN TRITON_ST_CHMST.CHDRDT = 0 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_ST_CHMST.CHDRDT),112) END  AS OptionExpiryDate,
		CASE 
			WHEN TRITON_ST_CNMST.CNSRCD IN ('OWNER','OPS','TAAC','MMK2') AND TRITON_ST_CNMST.CNOPTN = 'C' 
				THEN 
					CASE WHEN TRITON_ST_CNMST.CNETDT = 0 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_ST_CNMST.CNETDT),112) 
				END 
			WHEN TRITON_ST_CHMST.CHDPDT = 0 
				THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_ST_CHMST.CHDPDT),112) 
			END  
		AS ConfirmDate,
		CASE WHEN TRITON_ST_CNMST.CNARDT = 0 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),BRAINII.dbo.fn_CheckDate(TRITON_ST_CNMST.CNARDT),112)) END  AS ArrivalDate,
		CASE WHEN TRITON_ST_CHMST.CHCNDT = 0 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_ST_CHMST.CHCNDT),112) END  AS CancelDate,
		CASE WHEN TRITON_ST_CNMST.CNSTDT = 0 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_ST_CNMST.CNSTDT),112) END  AS StartDate,
		CASE WHEN TRITON_ST_CNMST.CNENDT = 0 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_ST_CNMST.CNENDT),112) END  AS EndDate,
		CONVERT(DATETIME,CONVERT(VARCHAR(8),BRAINII.dbo.fn_CheckDate(TRITON_ST_CNMST.CNSTDT),112)) AS DepartDate,
		CASE WHEN TRITON_ST_CNMST.CNCHDT = 0 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_ST_CNMST.CNCHDT),112) END  AS LastAmendDate,
		CASE 
			WHEN 
				TRITON_ST_CNMST.CNSTDT  = TRITON_ST_CNMST.CNENDT THEN 1 
			ELSE 
				DATEDIFF(d,CONVERT(DATETIME,CONVERT(VARCHAR(8),BRAINII.dbo.fn_CheckDate(TRITON_ST_CNMST.CNSTDT),112)),
				CONVERT(DATETIME,CONVERT(VARCHAR(8),BRAINII.dbo.fn_CheckDate(TRITON_ST_CNMST.CNENDT),112))) 
		END AS CharterDuration,
		CASE 
			WHEN 
				TRITON_ST_CNMST.CNSTDT  = TRITON_ST_CNMST.CNENDT THEN 1 
			ELSE 
				DATEDIFF(d,CONVERT(DATETIME,CONVERT(VARCHAR(8),BRAINII.dbo.fn_CheckDate(TRITON_ST_CNMST.CNSTDT),112)),
				CONVERT(DATETIME,CONVERT(VARCHAR(8),BRAINII.dbo.fn_CheckDate(TRITON_ST_CNMST.CNENDT),112))) 
		END AS HolidayDuration,
		RTRIM(LTRIM(TRITON_ST_CNMST.CNSRCD)) AS BkgSrcCd,
		COALESCE(RTRIM(LTRIM(TRITON_ST_SUNMRMST_BASE.SNDESC)),
			     RTRIM(LTRIM(TRITON_ST_SUNMRMST_ALL.SNDESC)),
			     RTRIM(LTRIM(TRITON_ST_SUNMRMST_NO_BASE.SNDESC)))
			AS BkgSrcDesc,
		CASE WHEN CLCLS2 IN ('E','T','U') THEN CLNAME ELSE '' END AS AgentContact,
		CASE WHEN CLCLS2 IN ('E','T','U') THEN 'A' ELSE 'D' END AS DirectAgentFlg,
		CASE WHEN CLCLS2 IN ('E','T','U') THEN 'Agent' ELSE 'Direct' END AS DirectAgent,
		RTRIM(LTRIM(CHCNTY)) AS ContractType, 
		RTRIM(LTRIM(CLNAME)) AS LeadPaxSurname,
		RTRIM(LTRIM(CLFNAM)) AS LeadPaxForename,
		RTRIM(LTRIM(CLSALU)) AS LeadPaxTitle,
		SUBSTRING(CLFNAM,1,1) AS LeadPaxInitials,
		RTRIM(LTRIM(CLSALU)) +' ' + RTRIM(LTRIM(CLFNAM)) + ' ' + RTRIM(LTRIM(CLNAME)) AS LeadPaxFullName,
		RTRIM(LTRIM(CLADD1)) AS Address1,
		RTRIM(LTRIM(CLADD2)) AS Address2,
		RTRIM(LTRIM(CLADD3)) AS Address3,
		RTRIM(LTRIM(CLCITY)) AS Town,
		RTRIM(LTRIM(CLSTCD)) AS County,
		RTRIM(LTRIM(CLZIPC)) AS PostCode,
		RTRIM(LTRIM(CLCTRY)) AS Country, 
		RTRIM(LTRIM(CLHMPH)) AS TelephoneNo,
		RTRIM(LTRIM(CLBSPH)) AS TelephoneNo2,
		RTRIM(LTRIM(CLCEPH)) AS TelephoneNo3, 
		RTRIM(LTRIM(IAADDR)) AS Email,
		RTRIM(LTRIM(TRITON_ST_CNMST.CNSAL2)) AS PaxTitleSecond,
		RTRIM(LTRIM(TRITON_ST_CNMST.CNFNA2)) AS PaxForenameSecond,
		RTRIM(LTRIM(TRITON_ST_CNMST.CNNAM2)) AS PaxSurnameSecond,
		NULL AS Notes, 
		NULL AS Comment,
		CASE WHEN CHDPDT<> 0 AND CHSTDT <> 0 THEN  CONVERT(VARCHAR(10), CONVERT(DATETIME,CONVERT(VARCHAR(12),BRAINII.dbo.fn_CheckDate(CHSTDT)),112),121) + ' '  
			+ CASE WHEN TRITON_ST_CNMST.CNTME2 > 0 THEN RIGHT('0000'+ CONVERT(VARCHAR(4),TRITON_ST_CNMST.CNTME2),4) ELSE  RIGHT('0000'+ CONVERT(VARCHAR(4),CONVERT(NUMERIC(4,0),SB_MARINE_BASE_START.a_StartCharterTime)),4) END
			+ '     '
			+  CONVERT(VARCHAR(10), CONVERT(DATETIME,CONVERT(VARCHAR(12),BRAINII.dbo.fn_CheckDate(CHENDT)),112),121) + ' '
			+  CASE WHEN TRITON_ST_CNMST.CNTME3 > 0 THEN RIGHT('0000'+ CONVERT(VARCHAR(4),TRITON_ST_CNMST.CNTME3),4) ELSE  RIGHT('0000'+ CONVERT(VARCHAR(4),CONVERT(NUMERIC(4,0),SB_MARINE_BASE_END.a_EndCharterTime)),4) END
		END 
		AS FlightListLong,
		TRITON_ST_CNMST.CNDESG AS Currency,
		TRITON_ST_CNMST.CNUSER AS BookedUser,
		TRITON_ST_CNMST.CNFUSR AS LastAmendUser,
		TRITON_ST_CNMST.CNDES4 AS ContractUser,
		NULL AS CAA_BondingType,
		TRITON_ST_CNMST.CNWAIT AS WaitListFlag,
		CASE 
			 WHEN TRITON_ST_CNMST.CNUSER = 'INTERNET' AND CLCLS2 IN ('E','T','U') THEN 'Broker Portal'
			 WHEN TRITON_ST_CNMST.CNUSER = 'INTERNET' AND CLCLS2 IN ('L') THEN 'Extranet'
			 WHEN TRITON_ST_CNMST.CNUSER = 'INTERNET' THEN 'Web'
			 WHEN TRITON_ST_CNMST.CNUSER = 'MMK' THEN 'MMK'
			 WHEN CLCLS2 IN ('E','T','U') THEN 'Broker'
			 WHEN CLCLS2 IN ('','G','L') THEN 'Sales Centre'
			 ELSE 'Other' 
		END AS BookingChannel,
		CASE
		    WHEN CLNAME LIKE '%MASTER YACHTING%' THEN 'Master Yachting'
			WHEN TRITON_ST_CNMST.CNUSER = 'INTERNET' AND CLCLS2 IN ('E','T','U') THEN 'Broker Portal'  
			WHEN TRITON_ST_CNMST.CNUSER = 'INTERNET' AND CLCLS2 IN ('L') THEN 'Extranet'
			WHEN TRITON_ST_CNMST.CNUSER = 'INTERNET' THEN 'Web'
			WHEN TRITON_ST_CNMST.CNUSER = 'MMK' THEN 'MMK'  
			WHEN CLCLS2 = 'E' THEN 'European Broker' 
			WHEN CLCLS2 = 'T' THEN 'Travel Agent' 
			WHEN CLCLS2 = 'U' THEN 'US Broker'  
			WHEN CLCLS2 IN ('','G','L') THEN 'Sales Centre' 
			ELSE 'Other' 
		END AS ExpandedBookingChannel,
		WEBLIB_ST_CNMST.CNNUMB AS WebBkgRef,
		WEBLIB_ST_CNMST.CNUSER AS WebBookedUser,
		TRITON_ST_CNMST.CNCODE AS InhibitProcessFlag,
		TRITON_ST_CNMST.CNGRPN AS GroupCode,
		TRITON_ST_CNMST.CNTYPE AS BookingCode,
		TRITON_ST_CNMST.CNBMIT AS BookedWithMIT,
		SB_MARINE_BASE_START.i_sk_base AS i_sk_base_from,		
		SB_MARINE_BASE_END.i_sk_base AS i_sk_base_to
	FROM 
		TRITON_Stage.dbo.TRITON_ST_CNMST TRITON_ST_CNMST 
	LEFT JOIN 
		TRITON_Stage.dbo.TRITON_ST_CHMST TRITON_ST_CHMST
		ON 
			TRITON_ST_CNMST.CNNUMB = TRITON_ST_CHMST.CHCNNB 
	LEFT JOIN 
		TRITON_Stage.dbo.TRITON_ST_CLMST TRITON_ST_CLMST 
		ON
			TRITON_ST_CLMST.CLNUMB = TRITON_ST_CNMST.CNCLNB
	LEFT JOIN 
		TRITON_Stage.dbo.TRITON_ST_IAMST TRITON_ST_IAMST
		ON
			TRITON_ST_IAMST.IANUMB = TRITON_ST_CNMST.CNCLNB
	LEFT JOIN 
		AMI_Static.dbo.SB_SEASON
		ON
			CONVERT(DATETIME,CONVERT(VARCHAR(8),BRAINII.dbo.fn_CheckDate(TRITON_ST_CNMST.CNSTDT),112)) BETWEEN SB_SEASON.a_StartDate AND SB_SEASON.a_EndDate
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_BASE   SB_MARINE_BASE_START  
		ON
			TRITON_ST_CNMST.CNLOC2 = SB_MARINE_BASE_START.a_BaseCode
		AND 
			SB_MARINE_BASE_START.a_SourceSystemID = 102
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_BASE   SB_MARINE_BASE_END  
		ON
			TRITON_ST_CNMST.CNLOC3 = SB_MARINE_BASE_END.a_BaseCode
		AND 
			SB_MARINE_BASE_END.a_SourceSystemID = 102
	LEFT JOIN
		AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_START 
		ON
			CONF_DT_CALENDAR_START.i_SK_Calendar = TRITON_ST_CNMST.CNSTDT
	LEFT JOIN 
		TRITON_Stage.dbo.TRITON_ST_FTMST TRITON_ST_FTMST
		ON 
			TRITON_ST_FTMST.FTTYPE = TRITON_ST_CNMST.CNFLTY	
	LEFT JOIN
		TRITON_Stage.dbo.TRITON_ST_SUNMRMST TRITON_ST_SUNMRMST_BASE
		ON
			TRITON_ST_SUNMRMST_BASE.SNCODE = TRITON_ST_CNMST.CNSRCD
			AND
			TRITON_ST_SUNMRMST_BASE.SNBKG1 = TRITON_ST_CNMST.CNBKNG
	LEFT JOIN
		TRITON_Stage.dbo.TRITON_ST_SUNMRMST TRITON_ST_SUNMRMST_ALL
		ON
			TRITON_ST_SUNMRMST_ALL.SNCODE = TRITON_ST_CNMST.CNSRCD
			AND
			TRITON_ST_SUNMRMST_ALL.SNBKG1 = 'ALL'
	LEFT JOIN
		TRITON_Stage.dbo.TRITON_ST_SUNMRMST TRITON_ST_SUNMRMST_NO_BASE
		ON
			TRITON_ST_SUNMRMST_NO_BASE.SNCODE = TRITON_ST_CNMST.CNSRCD
			AND
			TRITON_ST_SUNMRMST_NO_BASE.SNBKG1 = ''
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_BASE
		ON
			SB_MARINE_BASE.a_BaseCode = TRITON_ST_CNMST.CNLOC2
			AND
			SB_MARINE_BASE.a_SourceSystemID = 102
	LEFT JOIN 
		TRITON_Stage.dbo.WEBLIB_ST_CNMST WEBLIB_ST_CNMST
		ON
			TRITON_ST_CNMST.CNNUMB = WEBLIB_ST_CNMST.CNPACK	
	WHERE 
			CONF_DT_CALENDAR_START.a_Year >= 2010
			

	INSERT INTO 
		ST_MARINE_FBKG
	SELECT				
		CAST(CAST(102 AS VARCHAR(3)) 
		+	CASE WHEN SUBSTRING(TRITON_ST_ZNMST.CNNUMB,1,1) IN ('0','1','2','3','4','5','6','7','8','9') 
				THEN
					RIGHT('0000000'+ CAST(TRITON_ST_ZNMST.CNNUMB AS VARCHAR(7)), 7) 
				ELSE
					CAST(ASCII(SUBSTRING(TRITON_ST_ZNMST.CNNUMB,1,1)) AS CHAR(2)) + SUBSTRING(TRITON_ST_ZNMST.CNNUMB,2,LEN(TRITON_ST_ZNMST.CNNUMB)) 
				END	
		AS BIGINT) AS i_Sk_Bkg,
		102 AS SourceSysID,
		'TRITON' AS SystemName,
		'M' AS	DivisionCode,
		CASE WHEN SB_MARINE_BASE.a_ProductCode ='FOOTLOOSE' THEN 'FTL' ELSE 'MRG' END AS Brandcode,
		CASE WHEN SB_MARINE_BASE.a_ProductCode ='FOOTLOOSE' THEN 'FOOTLOOSE'
			 WHEN SB_MARINE_BASE.a_ProductCode ='FRANCHISE' THEN 'FRANCHISE'
			 WHEN TRITON_ST_FTMST.FTCREW = 'Y' THEN 'CREWED'
			 WHEN TRITON_ST_FTMST.FTHULL IN('P','T') THEN 'POWER'
			 ELSE SB_MARINE_BASE.a_ProductCode END AS ProductCode,
		NULL AS BookingType,
		0 AS CompanyNo,
		SB_SEASON.i_BK_SeasonCode AS SeasonCode,
		CASE
				WHEN TRITON_ST_CHMST.CHDPDT=0 AND TRITON_ST_CHMST.CHCNDT<>0 THEN 9
				WHEN TRITON_ST_CHMST.CHCNDT<>0 THEN 8
				WHEN TRITON_ST_CHMST.CHDPDT<>0 THEN 3
				WHEN TRITON_ST_CHMST.CHDPDT=0 AND TRITON_ST_ZNMST.CNSRCD IN ('OWNER','OPS','TAAC','MMK2') AND TRITON_ST_ZNMST.CNOPTN = 'C' THEN 3
				ELSE 1
			END AS BookingStatusID,
		RTRIM(LTRIM(TRITON_ST_ZNMST.CNNUMB)) AS BkgRef,
		RTRIM(LTRIM(TRITON_ST_ZNMST.CNCLNB)) AS ClientNo,
		RTRIM(LTRIM(TRITON_ST_ZNMST.CNLOC2)) AS DestResortCd, 
		RTRIM(LTRIM(TRITON_ST_ZNMST.CNBKNG)) AS BkgLocation, 
		TRITON_ST_ZNMST.CNPERS AS PaxNo,
		TRITON_ST_ZNMST.CNOFID AS Boat,
		TRITON_ST_ZNMST.CNFLTY AS BoatType, 
		TRITON_ST_FTMST.FTCREW AS CrewedFlag, 
		TRITON_ST_ZNMST.CNLOC2 AS BaseLocation, 
		TRITON_ST_ZNMST.CNDES6 AS DestinationLocation,
		CASE WHEN TRITON_ST_ZNMST.CNETDT = 0 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_ST_ZNMST.CNETDT),112) END  AS OptionDate,
		CASE WHEN TRITON_ST_CHMST.CHDRDT = 0 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_ST_CHMST.CHDRDT),112) END  AS OptionExpiryDate,
		CASE 
			WHEN TRITON_ST_ZNMST.CNSRCD IN ('OWNER','OPS','TAAC','MMK2') AND TRITON_ST_ZNMST.CNOPTN = 'C' 
				THEN 
					CASE WHEN TRITON_ST_ZNMST.CNETDT = 0 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_ST_ZNMST.CNETDT),112) 
				END 
			WHEN TRITON_ST_CHMST.CHDPDT = 0 
				THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_ST_CHMST.CHDPDT),112) 
			END  
		AS ConfirmDate,
		CASE WHEN TRITON_ST_ZNMST.CNARDT = 0 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),BRAINII.dbo.fn_CheckDate(TRITON_ST_ZNMST.CNARDT),112)) END  AS ArrivalDate,
		CASE WHEN TRITON_ST_CHMST.CHCNDT = 0 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_ST_CHMST.CHCNDT),112) END  AS CancelDate,
		CASE WHEN TRITON_ST_ZNMST.CNSTDT = 0 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_ST_ZNMST.CNSTDT),112) END  AS StartDate,
		CASE WHEN TRITON_ST_ZNMST.CNENDT = 0 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_ST_ZNMST.CNENDT),112) END  AS EndDate,
		CONVERT(DATETIME,CONVERT(VARCHAR(8),BRAINII.dbo.fn_CheckDate(TRITON_ST_ZNMST.CNSTDT),112)) AS DepartDate,
		CASE WHEN TRITON_ST_ZNMST.CNCHDT = 0 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_ST_ZNMST.CNCHDT),112) END  AS LastAmendDate,
		CASE 
			WHEN 
				TRITON_ST_ZNMST.CNSTDT  = TRITON_ST_ZNMST.CNENDT THEN 1 
			ELSE 
				DATEDIFF(d,CONVERT(DATETIME,CONVERT(VARCHAR(8),BRAINII.dbo.fn_CheckDate(TRITON_ST_ZNMST.CNSTDT),112)),
				CONVERT(DATETIME,CONVERT(VARCHAR(8),BRAINII.dbo.fn_CheckDate(TRITON_ST_ZNMST.CNENDT),112))) 
		END AS CharterDuration,
		CASE 
			WHEN 
				TRITON_ST_ZNMST.CNSTDT  = TRITON_ST_ZNMST.CNENDT THEN 1 
			ELSE 
				DATEDIFF(d,CONVERT(DATETIME,CONVERT(VARCHAR(8),BRAINII.dbo.fn_CheckDate(TRITON_ST_ZNMST.CNSTDT),112)),
				CONVERT(DATETIME,CONVERT(VARCHAR(8),BRAINII.dbo.fn_CheckDate(TRITON_ST_ZNMST.CNENDT),112))) 
		END AS HolidayDuration,
		RTRIM(LTRIM(TRITON_ST_ZNMST.CNSRCD)) AS BkgSrcCd, 
		COALESCE(RTRIM(LTRIM(TRITON_ST_SUNMRMST_BASE.SNDESC)),
			     RTRIM(LTRIM(TRITON_ST_SUNMRMST_ALL.SNDESC)),
			     RTRIM(LTRIM(TRITON_ST_SUNMRMST_NO_BASE.SNDESC)))
			AS BkgSrcDesc,
		CASE WHEN CLCLS2 IN ('E','T','U') THEN CLNAME ELSE '' END AS AgentContact,
		CASE WHEN CLCLS2 IN ('E','T','U') THEN 'A' ELSE 'D' END AS DirectAgentFlg,
		CASE WHEN CLCLS2 IN ('E','T','U') THEN 'Agent' ELSE 'Direct' END AS DirectAgent,
		RTRIM(LTRIM(CHCNTY)) AS ContractType, 
		RTRIM(LTRIM(CLNAME)) AS LeadPaxSurname,
		RTRIM(LTRIM(CLFNAM)) AS LeadPaxForename,
		RTRIM(LTRIM(CLSALU)) AS LeadPaxTitle,
		SUBSTRING(CLFNAM,1,1) AS LeadPaxInitials,
		RTRIM(LTRIM(CLSALU)) +' ' + RTRIM(LTRIM(CLFNAM)) + ' ' + RTRIM(LTRIM(CLNAME)) AS LeadPaxFullName,
		RTRIM(LTRIM(CLADD1)) AS Address1,
		RTRIM(LTRIM(CLADD2)) AS Address2,
		RTRIM(LTRIM(CLADD3)) AS Address3,
		RTRIM(LTRIM(CLCITY)) AS Town,
		RTRIM(LTRIM(CLSTCD)) AS County,
		RTRIM(LTRIM(CLZIPC)) AS PostCode,
		RTRIM(LTRIM(CLCTRY)) AS Country, 
		RTRIM(LTRIM(CLHMPH)) AS TelephoneNo,
		RTRIM(LTRIM(CLBSPH)) AS TelephoneNo2,
		RTRIM(LTRIM(CLCEPH)) AS TelephoneNo3, 
		RTRIM(LTRIM(IAADDR)) AS Email,
		RTRIM(LTRIM(TRITON_ST_ZNMST.CNSAL2)) AS PaxTitleSecond,
		RTRIM(LTRIM(TRITON_ST_ZNMST.CNFNA2)) AS PaxForenameSecond,
		RTRIM(LTRIM(TRITON_ST_ZNMST.CNNAM2)) AS PaxSurnameSecond,
		NULL AS Notes, 
		NULL AS Comment,
		CASE WHEN CHDPDT<> 0 AND CHSTDT <> 0 THEN  CONVERT(VARCHAR(10), CONVERT(DATETIME,CONVERT(VARCHAR(12),BRAINII.dbo.fn_CheckDate(CHSTDT)),112),121) + ' '  
			+ CASE WHEN TRITON_ST_ZNMST.CNTME2 > 0 THEN RIGHT('0000'+ CONVERT(VARCHAR(4),TRITON_ST_ZNMST.CNTME2),4) ELSE  RIGHT('0000'+ CONVERT(VARCHAR(4),CONVERT(NUMERIC(4,0),SB_MARINE_BASE_START.a_StartCharterTime)),4) END
			+ '     '
			+  CONVERT(VARCHAR(10), CONVERT(DATETIME,CONVERT(VARCHAR(12),BRAINII.dbo.fn_CheckDate(CHENDT)),112),121) + ' '
			+  CASE WHEN TRITON_ST_ZNMST.CNTME3 > 0 THEN RIGHT('0000'+ CONVERT(VARCHAR(4),TRITON_ST_ZNMST.CNTME3),4) ELSE  RIGHT('0000'+ CONVERT(VARCHAR(4),CONVERT(NUMERIC(4,0),SB_MARINE_BASE_END.a_EndCharterTime)),4) END
		END 
		AS FlightListLong,
		TRITON_ST_ZNMST.CNDESG AS Currency,
		TRITON_ST_ZNMST.CNUSER AS BookedUser,
		TRITON_ST_ZNMST.CNFUSR AS LastAmendUser,
		TRITON_ST_ZNMST.CNDES4 AS ContractUser,
		NULL AS CAA_BondingType,
		TRITON_ST_ZNMST.CNWAIT AS WaitListFlag,
		CASE 
			 WHEN TRITON_ST_ZNMST.CNUSER = 'INTERNET' AND CLCLS2 IN ('E','T','U') THEN 'Broker Portal'
			 WHEN TRITON_ST_ZNMST.CNUSER = 'INTERNET' AND CLCLS2 IN ('L') THEN 'Extranet'
			 WHEN TRITON_ST_ZNMST.CNUSER = 'INTERNET' THEN 'Web'
			 WHEN TRITON_ST_ZNMST.CNUSER = 'MMK' THEN 'MMK'
			 WHEN CLCLS2 IN ('E','T','U') THEN 'Broker'
			 WHEN CLCLS2 IN ('','G','L') THEN 'Sales Centre'
			 ELSE 'Other' 
		END AS BookingChannel,
		CASE
		    WHEN CLNAME LIKE '%MASTER YACHTING%' THEN 'Master Yachting' 
			WHEN TRITON_ST_ZNMST.CNUSER = 'INTERNET' AND CLCLS2 IN ('E','T','U') THEN 'Broker Portal'  
			WHEN TRITON_ST_ZNMST.CNUSER = 'INTERNET' AND CLCLS2 IN ('L') THEN 'Extranet'
			WHEN TRITON_ST_ZNMST.CNUSER = 'INTERNET' THEN 'Web'
			WHEN TRITON_ST_ZNMST.CNUSER = 'MMK' THEN 'MMK' 
			WHEN CLCLS2 = 'E' THEN 'European Broker' 
			WHEN CLCLS2 = 'T' THEN 'Travel Agent' 
			WHEN CLCLS2 = 'U' THEN 'US Broker'  
			WHEN CLCLS2 IN ('','G','L') THEN 'Sales Centre' 
			ELSE 'Other' 
		END AS ExpandedBookingChannel,
		WEBLIB_ST_CNMST.CNNUMB AS WebBkgRef,
		WEBLIB_ST_CNMST.CNUSER AS WebBookedUser,
		TRITON_ST_ZNMST.CNCODE AS InhibitProcessFlag,
		TRITON_ST_ZNMST.CNGRPN AS GroupCode,
		TRITON_ST_ZNMST.CNTYPE AS BookingCode,
		TRITON_ST_ZNMST.CNBMIT AS BookedWithMIT,
		SB_MARINE_BASE_START.i_sk_base AS i_sk_base_from,		
		SB_MARINE_BASE_END.i_sk_base AS i_sk_base_to
	FROM 
		TRITON_Stage.dbo.TRITON_ST_ZNMST TRITON_ST_ZNMST
	LEFT JOIN 
		TRITON_Stage.dbo.TRITON_ST_CNMST TRITON_ST_CNMST
		ON 
			TRITON_ST_CNMST.CNNUMB = TRITON_ST_ZNMST.CNNUMB
	LEFT JOIN 
		TRITON_Stage.dbo.TRITON_ST_CHMST TRITON_ST_CHMST
		ON 
			TRITON_ST_ZNMST.CNNUMB = TRITON_ST_CHMST.CHCNNB 
	LEFT JOIN 
		TRITON_Stage.dbo.TRITON_ST_CLMST TRITON_ST_CLMST
		ON
			TRITON_ST_CLMST.CLNUMB = TRITON_ST_ZNMST.CNCLNB
	LEFT JOIN 
		TRITON_Stage.dbo.TRITON_ST_IAMST TRITON_ST_IAMST
		ON
			TRITON_ST_IAMST.IANUMB = TRITON_ST_ZNMST.CNCLNB
	LEFT JOIN 
		AMI_Static.dbo.SB_SEASON
		ON
			CONVERT(DATETIME,CONVERT(VARCHAR(8),BRAINII.dbo.fn_CheckDate(TRITON_ST_ZNMST.CNSTDT),112)) BETWEEN SB_SEASON.a_StartDate AND SB_SEASON.a_EndDate
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_BASE   SB_MARINE_BASE_START  
		ON
			TRITON_ST_ZNMST.CNLOC2 = SB_MARINE_BASE_START.a_BaseCode
		AND 
			SB_MARINE_BASE_START.a_SourceSystemID = 102
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_BASE   SB_MARINE_BASE_END  
		ON
			TRITON_ST_ZNMST.CNLOC3 = SB_MARINE_BASE_END.a_BaseCode
		AND 
			SB_MARINE_BASE_END.a_SourceSystemID = 102
	LEFT JOIN
		AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_START 
		ON
			CONF_DT_CALENDAR_START.i_SK_Calendar = TRITON_ST_ZNMST.CNSTDT	
	LEFT JOIN 
		TRITON_Stage.dbo.TRITON_ST_FTMST TRITON_ST_FTMST
		ON 
			TRITON_ST_FTMST.FTTYPE = TRITON_ST_ZNMST.CNFLTY	
	LEFT JOIN
		TRITON_Stage.dbo.TRITON_ST_SUNMRMST TRITON_ST_SUNMRMST_BASE
		ON
			TRITON_ST_SUNMRMST_BASE.SNCODE = TRITON_ST_ZNMST.CNSRCD
			AND
			TRITON_ST_SUNMRMST_BASE.SNBKG1 = TRITON_ST_ZNMST.CNBKNG
	LEFT JOIN
		TRITON_Stage.dbo.TRITON_ST_SUNMRMST TRITON_ST_SUNMRMST_ALL
		ON
			TRITON_ST_SUNMRMST_ALL.SNCODE = TRITON_ST_ZNMST.CNSRCD
			AND
			TRITON_ST_SUNMRMST_ALL.SNBKG1 = 'ALL'
	LEFT JOIN
		TRITON_Stage.dbo.TRITON_ST_SUNMRMST TRITON_ST_SUNMRMST_NO_BASE
		ON
			TRITON_ST_SUNMRMST_NO_BASE.SNCODE = TRITON_ST_ZNMST.CNSRCD
			AND
			TRITON_ST_SUNMRMST_NO_BASE.SNBKG1 = ''
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_BASE
		ON
			SB_MARINE_BASE.a_BaseCode = TRITON_ST_ZNMST.CNLOC2
			AND
			SB_MARINE_BASE.a_SourceSystemID = 102	
	LEFT JOIN 
		TRITON_Stage.dbo.WEBLIB_ST_CNMST WEBLIB_ST_CNMST
		ON
			TRITON_ST_ZNMST.CNNUMB = WEBLIB_ST_CNMST.CNPACK
	WHERE 
		TRITON_ST_CNMST.CNNUMB IS NULL
		AND
		CONF_DT_CALENDAR_START.a_Year >= 2010
		
	
	INSERT INTO 
		ST_MARINE_FBKG
	SELECT		
		CAST(CAST(101 AS VARCHAR(3)) 
		+	CASE WHEN SUBSTRING(SUNSAIL_ST_CNMST.CNNUMB,1,1) IN ('0','1','2','3','4','5','6','7','8','9') 
				THEN
					RIGHT('0000000'+ CAST(SUNSAIL_ST_CNMST.CNNUMB AS VARCHAR(7)), 7) 
				ELSE
					CAST(ASCII(SUBSTRING(SUNSAIL_ST_CNMST.CNNUMB,1,1)) AS CHAR(2)) + SUBSTRING(SUNSAIL_ST_CNMST.CNNUMB,2,LEN(SUNSAIL_ST_CNMST.CNNUMB)) 
				END	
		AS BIGINT) AS i_Sk_Bkg,
		101 AS SourceSysID,
		'NEPTUNE' AS SystemName,
		'M' AS	DivisionCode,
		'SUN'AS Brandcode,
		CASE WHEN SUNSAIL_ST_FTMST.FTHULL IN('P','T') THEN 'POWER'
			 WHEN SUNSAIL_ST_FTMST.FTCREW = 'Y' THEN 'CREWED'
			 WHEN SUNSAIL_ST_CNMST.CNDES6 <> '' THEN 'FLOTILLA'
			 ELSE SB_MARINE_BASE.a_ProductCode END AS ProductCode,
		NULL AS BookingType,
		1 AS CompanyNo,
		SB_SEASON.i_BK_SeasonCode AS SeasonCode,
		CASE	WHEN SUNSAIL_ST_INTXRCNM.RCSTAT = '2' THEN 20
				WHEN SUNSAIL_ST_CHMST.CHDPDT=0 AND SUNSAIL_ST_CHMST.CHCNDT<>0 THEN 9
				WHEN SUNSAIL_ST_CHMST.CHCNDT<>0 THEN 8
				WHEN SUNSAIL_ST_CHMST.CHDPDT<>0 THEN 3
				WHEN SUNSAIL_ST_CHMST.CHDPDT=0 AND SUNSAIL_ST_CNMST.CNSRCD IN ('OWNER','OPS','TAAC','MMK2') AND SUNSAIL_ST_CNMST.CNOPTN = 'C' THEN 3
				ELSE 1
			END AS BookingStatusID,
		RTRIM(LTRIM(SUNSAIL_ST_CNMST.CNNUMB)) AS BkgRef,
		RTRIM(LTRIM(SUNSAIL_ST_CNMST.CNCLNB)) AS ClientNo,
		RTRIM(LTRIM(SUNSAIL_ST_CNMST.CNLOC2)) AS DestResortCd, 
		RTRIM(LTRIM(SUNSAIL_ST_CNMST.CNBKNG)) AS BkgLocation, 
		SUNSAIL_ST_CNMST.CNPERS AS PaxNo,
		SUNSAIL_ST_CNMST.CNOFID AS Boat,
		SUNSAIL_ST_CNMST.CNFLTY AS BoatType, 
		SUNSAIL_ST_FTMST.FTCREW AS CrewedFlag, 
		SUNSAIL_ST_CNMST.CNLOC2 AS BaseLocation, 
		SUNSAIL_ST_CNMST.CNDES6 AS DestinationLocation,
		CASE WHEN SUNSAIL_ST_CNMST.CNETDT = 0 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),SUNSAIL_ST_CNMST.CNETDT),112) END  AS OptionDate,
		CASE WHEN SUNSAIL_ST_CHMST.CHDRDT = 0 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),SUNSAIL_ST_CHMST.CHDRDT),112) END  AS OptionExpiryDate,
		CASE 
			WHEN SUNSAIL_ST_CNMST.CNSRCD IN ('OWNER','OPS','TAAC','MMK2') AND SUNSAIL_ST_CNMST.CNOPTN = 'C' 
				THEN 
					CASE WHEN SUNSAIL_ST_CNMST.CNETDT = 0 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),SUNSAIL_ST_CNMST.CNETDT),112) 
				END 
			WHEN SUNSAIL_ST_CHMST.CHDPDT = 0 
				THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),SUNSAIL_ST_CHMST.CHDPDT),112) 
			END  
		AS ConfirmDate,
		CASE WHEN SUNSAIL_ST_CNMST.CNARDT = 0 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),BRAINII.dbo.fn_CheckDate(SUNSAIL_ST_CNMST.CNARDT),112)) END  AS ArrivalDate,
		CASE WHEN SUNSAIL_ST_CHMST.CHCNDT = 0 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),SUNSAIL_ST_CHMST.CHCNDT),112) END  AS CancelDate,
		CASE WHEN SUNSAIL_ST_CNMST.CNSTDT = 0 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),SUNSAIL_ST_CNMST.CNSTDT),112) END  AS StartDate,
		CASE WHEN SUNSAIL_ST_CNMST.CNENDT = 0 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),SUNSAIL_ST_CNMST.CNENDT),112) END  AS EndDate,
		CONVERT(DATETIME,CONVERT(VARCHAR(8),BRAINII.dbo.fn_CheckDate(SUNSAIL_ST_CNMST.CNSTDT),112)) AS DepartDate,
		CASE WHEN SUNSAIL_ST_CNMST.CNCHDT = 0 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),SUNSAIL_ST_CNMST.CNCHDT),112) END  AS LastAmendDate,
		CASE 
			WHEN 
				SUNSAIL_ST_CNMST.CNSTDT  = SUNSAIL_ST_CNMST.CNENDT THEN 1 
			ELSE 
				DATEDIFF(d,CONVERT(DATETIME,CONVERT(VARCHAR(8),BRAINII.dbo.fn_CheckDate(SUNSAIL_ST_CNMST.CNSTDT),112)),
				CONVERT(DATETIME,CONVERT(VARCHAR(8),BRAINII.dbo.fn_CheckDate(SUNSAIL_ST_CNMST.CNENDT),112))) 
		END AS CharterDuration,
		CASE 
			WHEN 
				SUNSAIL_ST_CNMST.CNSTDT  = SUNSAIL_ST_CNMST.CNENDT THEN 1 
			ELSE 
				DATEDIFF(d,CONVERT(DATETIME,CONVERT(VARCHAR(8),BRAINII.dbo.fn_CheckDate(SUNSAIL_ST_CNMST.CNSTDT),112)),
				CONVERT(DATETIME,CONVERT(VARCHAR(8),BRAINII.dbo.fn_CheckDate(SUNSAIL_ST_CNMST.CNENDT),112))) 
		END AS HolidayDuration,
		RTRIM(LTRIM(SUNSAIL_ST_CNMST.CNSRCD)) AS BkgSrcCd, 
		COALESCE(RTRIM(LTRIM(SUNSAIL_ST_SUNMRMST_BASE.SNDESC)),
			     RTRIM(LTRIM(SUNSAIL_ST_SUNMRMST_ALL.SNDESC)),
			     RTRIM(LTRIM(SUNSAIL_ST_SUNMRMST_NO_BASE.SNDESC)))
			AS BkgSrcDesc,
		CASE WHEN CLCLS2 IN ('E','T','U') THEN CLNAME ELSE '' END AS AgentContact,
		CASE WHEN CLCLS2 IN ('E','T','U') THEN 'A' ELSE 'D' END AS DirectAgentFlg,
		CASE WHEN CLCLS2 IN ('E','T','U') THEN 'Agent' ELSE 'Direct' END AS DirectAgent,
		RTRIM(LTRIM(CHCNTY)) AS ContractType, 
		RTRIM(LTRIM(CLNAME)) AS LeadPaxSurname,
		RTRIM(LTRIM(CLFNAM)) AS LeadPaxForename,
		RTRIM(LTRIM(CLSALU)) AS LeadPaxTitle,
		SUBSTRING(CLFNAM,1,1) AS LeadPaxInitials,
		RTRIM(LTRIM(CLSALU)) +' ' + RTRIM(LTRIM(CLFNAM)) + ' ' + RTRIM(LTRIM(CLNAME)) AS LeadPaxFullName,
		RTRIM(LTRIM(CLADD1)) AS Address1,
		RTRIM(LTRIM(CLADD2)) AS Address2,
		RTRIM(LTRIM(CLADD3)) AS Address3,
		RTRIM(LTRIM(CLCITY)) AS Town,
		RTRIM(LTRIM(CLSTCD)) AS County,
		RTRIM(LTRIM(CLZIPC)) AS PostCode,
		RTRIM(LTRIM(CLCTRY)) AS Country, 
		RTRIM(LTRIM(CLHMPH)) AS TelephoneNo,
		RTRIM(LTRIM(CLBSPH)) AS TelephoneNo2,
		RTRIM(LTRIM(CLCEPH)) AS TelephoneNo3, 
		RTRIM(LTRIM(IAADDR)) AS Email,
		RTRIM(LTRIM(SUNSAIL_ST_CNMST.CNSAL2)) AS PaxTitleSecond,
		RTRIM(LTRIM(SUNSAIL_ST_CNMST.CNFNA2)) AS PaxForenameSecond,
		RTRIM(LTRIM(SUNSAIL_ST_CNMST.CNNAM2)) AS PaxSurnameSecond,
		SUNSAIL_ST_INTXRCNM.RCCLNO AS Notes, 
		SUNSAIL_ST_INTXRCNM.RCSTAT + ' ' 
			+ CASE WHEN NEPTUNE_BOOK.CLIENT_NO IS NOT NULL THEN 'In Neptune'
														   ELSE 'Not in Neptune' END AS Comment,
		CASE WHEN CHDPDT<> 0 AND CHSTDT <> 0 THEN  CONVERT(VARCHAR(10), CONVERT(DATETIME,CONVERT(VARCHAR(12),BRAINII.dbo.fn_CheckDate(CHSTDT)),112),121) + ' '  
			+ CASE WHEN SUNSAIL_ST_CNMST.CNTME2 > 0 THEN RIGHT('0000'+ CONVERT(VARCHAR(4),SUNSAIL_ST_CNMST.CNTME2),4) ELSE  RIGHT('0000'+ CONVERT(VARCHAR(4),CONVERT(NUMERIC(4,0),SB_MARINE_BASE_START.a_StartCharterTime)),4) END
			+ '     '
			+  CONVERT(VARCHAR(10), CONVERT(DATETIME,CONVERT(VARCHAR(12),BRAINII.dbo.fn_CheckDate(CHENDT)),112),121) + ' '
			+  CASE WHEN SUNSAIL_ST_CNMST.CNTME3 > 0 THEN RIGHT('0000'+ CONVERT(VARCHAR(4),SUNSAIL_ST_CNMST.CNTME3),4) ELSE  RIGHT('0000'+ CONVERT(VARCHAR(4),CONVERT(NUMERIC(4,0),SB_MARINE_BASE_END.a_EndCharterTime)),4) END
		END 
		AS FlightListLong,
		SUNSAIL_ST_CNMST.CNDESG AS Currency,
		SUNSAIL_ST_CNMST.CNUSER AS BookedUser,
		SUNSAIL_ST_CNMST.CNFUSR AS LastAmendUser,
		SUNSAIL_ST_CNMST.CNDES4 AS ContractUser,
		NULL AS CAA_BondingType,
		SUNSAIL_ST_CNMST.CNWAIT AS WaitListFlag,
		CASE 
			 WHEN SUNSAIL_ST_CNMST.CNUSER = 'INTERNET' AND CLCLS2 IN ('E','T','U') THEN 'Broker Portal'
			 WHEN SUNSAIL_ST_CNMST.CNUSER = 'INTERNET' AND CLCLS2 IN ('L') THEN 'Extranet'
			 WHEN SUNSAIL_ST_CNMST.CNUSER = 'INTERNET' THEN 'Web'
			 WHEN SUNSAIL_ST_CNMST.CNUSER = 'MMK' THEN 'MMK'
			 WHEN CLCLS2 IN ('E','T','U') THEN 'Broker'
			 WHEN CLCLS2 IN ('','G','L') THEN 'Sales Centre'
			 ELSE 'Other' 
		END AS BookingChannel,
		CASE
		    WHEN CLNAME LIKE '%MASTER YACHTING%' THEN 'Master Yachting'
			WHEN SUNSAIL_ST_CNMST.CNUSER = 'INTERNET' AND CLCLS2 IN ('E','T','U') THEN 'Broker Portal'  
			WHEN SUNSAIL_ST_CNMST.CNUSER = 'INTERNET' AND CLCLS2 IN ('L') THEN 'Extranet'
			WHEN SUNSAIL_ST_CNMST.CNUSER = 'INTERNET' THEN 'Web'
			WHEN SUNSAIL_ST_CNMST.CNUSER = 'MMK' THEN 'MMK'  
			WHEN CLCLS2 = 'E' THEN 'European Broker' 
			WHEN CLCLS2 = 'T' THEN 'Travel Agent' 
			WHEN CLCLS2 = 'U' THEN 'US Broker'  
			WHEN CLCLS2 IN ('','G','L') THEN 'Sales Centre' 
			ELSE 'Other'
		END AS ExpandedBookingChannel,
		WEBLIBSSL_ST_CNMST.CNNUMB AS WebBkgRef,
		WEBLIBSSL_ST_CNMST.CNUSER AS WebBookedUser,
		SUNSAIL_ST_CNMST.CNCODE AS InhibitProcessFlag,
		SUNSAIL_ST_CNMST.CNGRPN AS GroupCode,
		SUNSAIL_ST_CNMST.CNTYPE AS BookingCode,
		SUNSAIL_ST_CNMST.CNBMIT AS BookedWithMIT,
		SB_MARINE_BASE_START.i_sk_base AS i_sk_base_from,		
		SB_MARINE_BASE_END.i_sk_base AS i_sk_base_to
	FROM 
		TRITON_Stage.dbo.SUNSAIL_ST_CNMST SUNSAIL_ST_CNMST 
	LEFT JOIN 
		TRITON_Stage.dbo.SUNSAIL_ST_CHMST SUNSAIL_ST_CHMST
		ON 
			SUNSAIL_ST_CNMST.CNNUMB = SUNSAIL_ST_CHMST.CHCNNB 
	LEFT JOIN 
		TRITON_Stage.dbo.SUNSAIL_ST_CLMST SUNSAIL_ST_CLMST
		ON
			SUNSAIL_ST_CLMST.CLNUMB = SUNSAIL_ST_CNMST.CNCLNB
	LEFT JOIN 
		TRITON_Stage.dbo.SUNSAIL_ST_IAMST SUNSAIL_ST_IAMST
		ON
			SUNSAIL_ST_IAMST.IANUMB = SUNSAIL_ST_CNMST.CNCLNB
	LEFT JOIN 
		AMI_Static.dbo.SB_SEASON
		ON
			CONVERT(DATETIME,CONVERT(VARCHAR(8),BRAINII.dbo.fn_CheckDate(SUNSAIL_ST_CNMST.CNSTDT),112)) BETWEEN SB_SEASON.a_StartDate AND SB_SEASON.a_EndDate
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_BASE   SB_MARINE_BASE_START  
		ON
			SUNSAIL_ST_CNMST.CNLOC2 = SB_MARINE_BASE_START.a_BaseCode
		AND 
			SB_MARINE_BASE_START.a_SourceSystemID = 101
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_BASE   SB_MARINE_BASE_END  
		ON
			SUNSAIL_ST_CNMST.CNLOC3 = SB_MARINE_BASE_END.a_BaseCode
		AND 
			SB_MARINE_BASE_END.a_SourceSystemID = 101
	LEFT JOIN
		AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_START 
		ON
			CONF_DT_CALENDAR_START.i_SK_Calendar = SUNSAIL_ST_CNMST.CNSTDT
	LEFT JOIN 
		TRITON_Stage.dbo.SUNSAIL_ST_FTMST SUNSAIL_ST_FTMST
		ON 
			SUNSAIL_ST_FTMST.FTTYPE = SUNSAIL_ST_CNMST.CNFLTY
	LEFT JOIN
		TRITON_Stage.dbo.SUNSAIL_ST_SUNMRMST SUNSAIL_ST_SUNMRMST_BASE
		ON
			SUNSAIL_ST_SUNMRMST_BASE.SNCODE = SUNSAIL_ST_CNMST.CNSRCD
			AND
			SUNSAIL_ST_SUNMRMST_BASE.SNBKG1 = SUNSAIL_ST_CNMST.CNBKNG
	LEFT JOIN
		TRITON_Stage.dbo.SUNSAIL_ST_SUNMRMST SUNSAIL_ST_SUNMRMST_ALL
		ON
			SUNSAIL_ST_SUNMRMST_ALL.SNCODE = SUNSAIL_ST_CNMST.CNSRCD
			AND
			SUNSAIL_ST_SUNMRMST_ALL.SNBKG1 = 'ALL'
	LEFT JOIN
		TRITON_Stage.dbo.SUNSAIL_ST_SUNMRMST SUNSAIL_ST_SUNMRMST_NO_BASE
		ON
			SUNSAIL_ST_SUNMRMST_NO_BASE.SNCODE = SUNSAIL_ST_CNMST.CNSRCD
			AND
			SUNSAIL_ST_SUNMRMST_NO_BASE.SNBKG1 = ''
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_BASE
		ON
			SB_MARINE_BASE.a_BaseCode = SUNSAIL_ST_CNMST.CNLOC2
			AND
			SB_MARINE_BASE.a_SourceSystemID = 101	
	LEFT JOIN 
		TRITON_Stage.dbo.SUNSAIL_ST_INTXRCNM SUNSAIL_ST_INTXRCNM
		ON
			SUNSAIL_ST_INTXRCNM.RCNUMB  = SUNSAIL_ST_CNMST.CNNUMB
	LEFT JOIN
		NEPTUNE_Stage.dbo.NEPTUNE_BOOK NEPTUNE_BOOK
		ON
			CONVERT(VARCHAR(10),NEPTUNE_BOOK.CLIENT_NO) = SUNSAIL_ST_INTXRCNM.RCCLNO
	LEFT JOIN 
		TRITON_Stage.dbo.WEBLIBSSL_ST_CNMST WEBLIBSSL_ST_CNMST
		ON
			SUNSAIL_ST_CNMST.CNNUMB = WEBLIBSSL_ST_CNMST.CNPACK			
	WHERE 
			CONF_DT_CALENDAR_START.a_Year >= 2010


	INSERT INTO 
		ST_MARINE_FBKG
	SELECT				
		CAST(CAST(101 AS VARCHAR(3)) 
		+	CASE WHEN SUBSTRING(SUNSAIL_ST_ZNMST.CNNUMB,1,1) IN ('0','1','2','3','4','5','6','7','8','9') 
				THEN
					RIGHT('0000000'+ CAST(SUNSAIL_ST_ZNMST.CNNUMB AS VARCHAR(7)), 7) 
				ELSE
					CAST(ASCII(SUBSTRING(SUNSAIL_ST_ZNMST.CNNUMB,1,1)) AS CHAR(2)) + SUBSTRING(SUNSAIL_ST_ZNMST.CNNUMB,2,LEN(SUNSAIL_ST_ZNMST.CNNUMB)) 
				END	
		AS BIGINT) AS i_Sk_Bkg,
		101 AS SourceSysID,
		'NEPTUNE' AS SystemName,
		'M' AS	DivisionCode,
		'SUN'AS Brandcode,
		CASE WHEN SUNSAIL_ST_FTMST.FTHULL IN('P','T') THEN 'POWER'
			 WHEN SUNSAIL_ST_FTMST.FTCREW = 'Y' THEN 'CREWED'
			 WHEN SUNSAIL_ST_ZNMST.CNDES6 <> '' THEN 'FLOTILLA'
			 ELSE SB_MARINE_BASE.a_ProductCode END AS ProductCode,
		NULL AS BookingType,
		1 AS CompanyNo,
		SB_SEASON.i_BK_SeasonCode AS SeasonCode,
		CASE	
				WHEN SUNSAIL_ST_INTXRCNM.RCSTAT = '2' THEN 20
				WHEN SUNSAIL_ST_CHMST.CHDPDT=0 AND SUNSAIL_ST_CHMST.CHCNDT<>0 THEN 9
				WHEN SUNSAIL_ST_CHMST.CHCNDT<>0 THEN 8
				WHEN SUNSAIL_ST_CHMST.CHDPDT<>0 THEN 3
				WHEN SUNSAIL_ST_CHMST.CHDPDT=0 AND SUNSAIL_ST_ZNMST.CNSRCD IN ('OWNER','OPS','TAAC','MMK2') AND SUNSAIL_ST_ZNMST.CNOPTN = 'C' THEN 3
				ELSE 1
			END AS BookingStatusID,
		RTRIM(LTRIM(SUNSAIL_ST_ZNMST.CNNUMB)) AS BkgRef,
		RTRIM(LTRIM(SUNSAIL_ST_ZNMST.CNCLNB)) AS ClientNo,
		RTRIM(LTRIM(SUNSAIL_ST_ZNMST.CNLOC2)) AS DestResortCd, 
		RTRIM(LTRIM(SUNSAIL_ST_ZNMST.CNBKNG)) AS BkgLocation,
		SUNSAIL_ST_ZNMST.CNPERS AS PaxNo,
		SUNSAIL_ST_ZNMST.CNOFID AS Boat,
		SUNSAIL_ST_ZNMST.CNFLTY AS BoatType, 
		SUNSAIL_ST_FTMST.FTCREW AS CrewedFlag, 
		SUNSAIL_ST_ZNMST.CNLOC2 AS BaseLocation, 
		SUNSAIL_ST_ZNMST.CNDES6 AS DestinationLocation,
		CASE WHEN SUNSAIL_ST_ZNMST.CNETDT = 0 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),SUNSAIL_ST_ZNMST.CNETDT),112) END  AS OptionDate,
		CASE WHEN SUNSAIL_ST_CHMST.CHDRDT = 0 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),SUNSAIL_ST_CHMST.CHDRDT),112) END  AS OptionExpiryDate,
		CASE 
			WHEN SUNSAIL_ST_ZNMST.CNSRCD IN ('OWNER','OPS','TAAC','MMK2') AND SUNSAIL_ST_ZNMST.CNOPTN = 'C' 
				THEN 
					CASE WHEN SUNSAIL_ST_ZNMST.CNETDT = 0 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),SUNSAIL_ST_ZNMST.CNETDT),112) 
				END 
			WHEN SUNSAIL_ST_CHMST.CHDPDT = 0 
				THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),SUNSAIL_ST_CHMST.CHDPDT),112) 
			END  
		AS ConfirmDate,
		CASE WHEN SUNSAIL_ST_ZNMST.CNARDT = 0 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),BRAINII.dbo.fn_CheckDate(SUNSAIL_ST_ZNMST.CNARDT),112)) END  AS ArrivalDate,
		CASE WHEN SUNSAIL_ST_CHMST.CHCNDT = 0 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),SUNSAIL_ST_CHMST.CHCNDT),112) END  AS CancelDate,
		CASE WHEN SUNSAIL_ST_ZNMST.CNSTDT = 0 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),SUNSAIL_ST_ZNMST.CNSTDT),112) END  AS StartDate,
		CASE WHEN SUNSAIL_ST_ZNMST.CNENDT = 0 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),SUNSAIL_ST_ZNMST.CNENDT),112) END  AS EndDate,
		CONVERT(DATETIME,CONVERT(VARCHAR(8),BRAINII.dbo.fn_CheckDate(SUNSAIL_ST_ZNMST.CNSTDT),112)) AS DepartDate,
		CASE WHEN SUNSAIL_ST_ZNMST.CNCHDT = 0 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),CASE WHEN SUNSAIL_ST_ZNMST.CNCHDT BETWEEN 19000101 AND 20491231 THEN SUNSAIL_ST_ZNMST.CNCHDT ELSE 19000101 END),112) END  AS LastAmendDate,
		CASE 
			WHEN 
				SUNSAIL_ST_ZNMST.CNSTDT  = SUNSAIL_ST_ZNMST.CNENDT THEN 1 
			ELSE 
				DATEDIFF(d,CONVERT(DATETIME,CONVERT(VARCHAR(8),BRAINII.dbo.fn_CheckDate(SUNSAIL_ST_ZNMST.CNSTDT),112)),
				CONVERT(DATETIME,CONVERT(VARCHAR(8),BRAINII.dbo.fn_CheckDate(SUNSAIL_ST_ZNMST.CNENDT),112))) 
		END AS CharterDuration,
		CASE 
			WHEN 
				SUNSAIL_ST_ZNMST.CNSTDT  = SUNSAIL_ST_ZNMST.CNENDT THEN 1 
			ELSE 
				DATEDIFF(d,CONVERT(DATETIME,CONVERT(VARCHAR(8),BRAINII.dbo.fn_CheckDate(SUNSAIL_ST_ZNMST.CNSTDT),112)),
				CONVERT(DATETIME,CONVERT(VARCHAR(8),BRAINII.dbo.fn_CheckDate(SUNSAIL_ST_ZNMST.CNENDT),112))) 
		END AS HolidayDuration,
		RTRIM(LTRIM(SUNSAIL_ST_ZNMST.CNSRCD)) AS BkgSrcCd, 
		COALESCE(RTRIM(LTRIM(SUNSAIL_ST_SUNMRMST_BASE.SNDESC)),
			     RTRIM(LTRIM(SUNSAIL_ST_SUNMRMST_ALL.SNDESC)),
			     RTRIM(LTRIM(SUNSAIL_ST_SUNMRMST_NO_BASE.SNDESC)))
			AS BkgSrcDesc,
		CASE WHEN CLCLS2 IN ('E','T','U') THEN CLNAME ELSE '' END AS AgentContact,
		CASE WHEN CLCLS2 IN ('E','T','U') THEN 'A' ELSE 'D' END AS DirectAgentFlg,
		CASE WHEN CLCLS2 IN ('E','T','U') THEN 'Agent' ELSE 'Direct' END AS DirectAgent,
		RTRIM(LTRIM(CHCNTY)) AS ContractType, 
		RTRIM(LTRIM(CLNAME)) AS LeadPaxSurname,
		RTRIM(LTRIM(CLFNAM)) AS LeadPaxForename,
		RTRIM(LTRIM(CLSALU)) AS LeadPaxTitle,
		SUBSTRING(CLFNAM,1,1) AS LeadPaxInitials,
		RTRIM(LTRIM(CLSALU)) +' ' + RTRIM(LTRIM(CLFNAM)) + ' ' + RTRIM(LTRIM(CLNAME)) AS LeadPaxFullName,
		RTRIM(LTRIM(CLADD1)) AS Address1,
		RTRIM(LTRIM(CLADD2)) AS Address2,
		RTRIM(LTRIM(CLADD3)) AS Address3,
		RTRIM(LTRIM(CLCITY)) AS Town,
		RTRIM(LTRIM(CLSTCD)) AS County,
		RTRIM(LTRIM(CLZIPC)) AS PostCode,
		RTRIM(LTRIM(CLCTRY)) AS Country, 
		RTRIM(LTRIM(CLHMPH)) AS TelephoneNo,
		RTRIM(LTRIM(CLBSPH)) AS TelephoneNo2,
		RTRIM(LTRIM(CLCEPH)) AS TelephoneNo3, 
		RTRIM(LTRIM(IAADDR)) AS Email,
		RTRIM(LTRIM(SUNSAIL_ST_ZNMST.CNSAL2)) AS PaxTitleSecond,
		RTRIM(LTRIM(SUNSAIL_ST_ZNMST.CNFNA2)) AS PaxForenameSecond,
		RTRIM(LTRIM(SUNSAIL_ST_ZNMST.CNNAM2)) AS PaxSurnameSecond,
		SUNSAIL_ST_INTXRCNM.RCCLNO AS Notes, 
		SUNSAIL_ST_INTXRCNM.RCSTAT + ' ' 
			+ CASE WHEN NEPTUNE_BOOK.CLIENT_NO IS NOT NULL THEN 'In Neptune'
														   ELSE 'Not in Neptune' END AS Comment,
		CASE WHEN CHDPDT<> 0 AND CHSTDT <> 0 THEN  CONVERT(VARCHAR(10), CONVERT(DATETIME,CONVERT(VARCHAR(12),BRAINII.dbo.fn_CheckDate(CHSTDT)),112),121) + ' '  
			+ CASE WHEN SUNSAIL_ST_ZNMST.CNTME2 > 0 THEN RIGHT('0000'+ CONVERT(VARCHAR(4),SUNSAIL_ST_ZNMST.CNTME2),4) ELSE  RIGHT('0000'+ CONVERT(VARCHAR(4),CONVERT(NUMERIC(4,0),SB_MARINE_BASE_START.a_StartCharterTime)),4) END
			+ '     '
			+  CONVERT(VARCHAR(10), CONVERT(DATETIME,CONVERT(VARCHAR(12),BRAINII.dbo.fn_CheckDate(CHENDT)),112),121) + ' '
			+  CASE WHEN SUNSAIL_ST_ZNMST.CNTME3 > 0 THEN RIGHT('0000'+ CONVERT(VARCHAR(4),SUNSAIL_ST_ZNMST.CNTME3),4) ELSE  RIGHT('0000'+ CONVERT(VARCHAR(4),CONVERT(NUMERIC(4,0),SB_MARINE_BASE_END.a_EndCharterTime)),4) END
		END 
		AS FlightListLong,
		SUNSAIL_ST_ZNMST.CNDESG AS Currency,
		SUNSAIL_ST_ZNMST.CNUSER AS BookedUser,
		SUNSAIL_ST_ZNMST.CNFUSR AS LastAmendUser,
		SUNSAIL_ST_ZNMST.CNDES4 AS ContractUser,
		NULL AS CAA_BondingType,
		SUNSAIL_ST_ZNMST.CNWAIT AS WaitListFlag,
		CASE 
			 WHEN SUNSAIL_ST_ZNMST.CNUSER = 'INTERNET' AND CLCLS2 IN ('E','T','U') THEN 'Broker Portal'
			 WHEN SUNSAIL_ST_ZNMST.CNUSER = 'INTERNET' AND CLCLS2 IN ('L') THEN 'Extranet'
			 WHEN SUNSAIL_ST_ZNMST.CNUSER = 'INTERNET' THEN 'Web'
			 WHEN SUNSAIL_ST_ZNMST.CNUSER = 'MMK' THEN 'MMK'
			 WHEN CLCLS2 IN ('E','T','U') THEN 'Broker'
			 WHEN CLCLS2 IN ('','G','L') THEN 'Sales Centre'
			 ELSE 'Other' 
		END AS BookingChannel,
		CASE
		    WHEN CLNAME LIKE '%MASTER YACHTING%' THEN 'Master Yachting'
			WHEN SUNSAIL_ST_ZNMST.CNUSER = 'INTERNET' AND CLCLS2 IN ('E','T','U') THEN 'Broker Portal'  
			WHEN SUNSAIL_ST_ZNMST.CNUSER = 'INTERNET' AND CLCLS2 IN ('L') THEN 'Extranet'
			WHEN SUNSAIL_ST_ZNMST.CNUSER = 'INTERNET' THEN 'Web'
		    WHEN SUNSAIL_ST_ZNMST.CNUSER = 'MMK' THEN 'MMK'  
			WHEN CLCLS2 = 'E' THEN 'European Broker' 
			WHEN CLCLS2 = 'T' THEN 'Travel Agent' 
			WHEN CLCLS2 = 'U' THEN 'US Broker'  
			WHEN CLCLS2 IN ('','G','L') THEN 'Sales Centre' 
			ELSE 'Other' 
		END AS ExpandedBookingChannel,
		WEBLIBSSL_ST_CNMST.CNNUMB AS WebBkgRef,
		WEBLIBSSL_ST_CNMST.CNUSER AS WebBookedUser,
		SUNSAIL_ST_ZNMST.CNCODE AS InhibitProcessFlag,
		SUNSAIL_ST_ZNMST.CNGRPN AS GroupCode,
		SUNSAIL_ST_ZNMST.CNTYPE AS BookingCode,
		SUNSAIL_ST_ZNMST.CNBMIT AS BookedWithMIT,
		SB_MARINE_BASE_START.i_sk_base AS i_sk_base_from,		
		SB_MARINE_BASE_END.i_sk_base AS i_sk_base_to
	FROM 
		TRITON_Stage.dbo.SUNSAIL_ST_ZNMST SUNSAIL_ST_ZNMST
	LEFT JOIN 
		TRITON_Stage.dbo.SUNSAIL_ST_CNMST SUNSAIL_ST_CNMST
		ON 
			SUNSAIL_ST_CNMST.CNNUMB = SUNSAIL_ST_ZNMST.CNNUMB
	LEFT JOIN 
		TRITON_Stage.dbo.SUNSAIL_ST_CHMST SUNSAIL_ST_CHMST
		ON 
			SUNSAIL_ST_ZNMST.CNNUMB = SUNSAIL_ST_CHMST.CHCNNB 
	LEFT JOIN 
		TRITON_Stage.dbo.SUNSAIL_ST_CLMST SUNSAIL_ST_CLMST
		ON
			SUNSAIL_ST_CLMST.CLNUMB = SUNSAIL_ST_ZNMST.CNCLNB
	LEFT JOIN 
		TRITON_Stage.dbo.SUNSAIL_ST_IAMST SUNSAIL_ST_IAMST
		ON
			SUNSAIL_ST_IAMST.IANUMB = SUNSAIL_ST_ZNMST.CNCLNB
	LEFT JOIN 
		AMI_Static.dbo.SB_SEASON
		ON
			CONVERT(DATETIME,CONVERT(VARCHAR(8),BRAINII.dbo.fn_CheckDate(SUNSAIL_ST_ZNMST.CNSTDT),112)) BETWEEN SB_SEASON.a_StartDate AND SB_SEASON.a_EndDate
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_BASE   SB_MARINE_BASE_START  
		ON
			SUNSAIL_ST_ZNMST.CNLOC2 = SB_MARINE_BASE_START.a_BaseCode
		AND 
			SB_MARINE_BASE_START.a_SourceSystemID = 101
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_BASE   SB_MARINE_BASE_END  
		ON
			SUNSAIL_ST_ZNMST.CNLOC3 = SB_MARINE_BASE_END.a_BaseCode
		AND 
			SB_MARINE_BASE_END.a_SourceSystemID = 101
	LEFT JOIN 
		TRITON_Stage.dbo.SUNSAIL_ST_INTXRCNM SUNSAIL_ST_INTXRCNM
		ON
			SUNSAIL_ST_INTXRCNM.RCNUMB  = SUNSAIL_ST_ZNMST.CNNUMB
	LEFT JOIN
		AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_START 
		ON
			CONF_DT_CALENDAR_START.i_SK_Calendar = SUNSAIL_ST_ZNMST.CNSTDT	
	LEFT JOIN 
		TRITON_Stage.dbo.SUNSAIL_ST_FTMST SUNSAIL_ST_FTMST
		ON 
			SUNSAIL_ST_FTMST.FTTYPE = SUNSAIL_ST_ZNMST.CNFLTY	
	LEFT JOIN
		TRITON_Stage.dbo.SUNSAIL_ST_SUNMRMST SUNSAIL_ST_SUNMRMST_BASE
		ON
			SUNSAIL_ST_SUNMRMST_BASE.SNCODE = SUNSAIL_ST_ZNMST.CNSRCD
			AND
			SUNSAIL_ST_SUNMRMST_BASE.SNBKG1 = SUNSAIL_ST_ZNMST.CNBKNG
	LEFT JOIN
		TRITON_Stage.dbo.SUNSAIL_ST_SUNMRMST SUNSAIL_ST_SUNMRMST_ALL
		ON
			SUNSAIL_ST_SUNMRMST_ALL.SNCODE = SUNSAIL_ST_ZNMST.CNSRCD
			AND
			SUNSAIL_ST_SUNMRMST_ALL.SNBKG1 = 'ALL'
	LEFT JOIN
		TRITON_Stage.dbo.SUNSAIL_ST_SUNMRMST SUNSAIL_ST_SUNMRMST_NO_BASE
		ON
			SUNSAIL_ST_SUNMRMST_NO_BASE.SNCODE = SUNSAIL_ST_ZNMST.CNSRCD
			AND
			SUNSAIL_ST_SUNMRMST_NO_BASE.SNBKG1 = ''
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_BASE
		ON
			SB_MARINE_BASE.a_BaseCode = SUNSAIL_ST_ZNMST.CNLOC2
			AND
			SB_MARINE_BASE.a_SourceSystemID = 101
	LEFT JOIN
		NEPTUNE_Stage.dbo.NEPTUNE_BOOK NEPTUNE_BOOK
		ON
			CONVERT(VARCHAR(10),NEPTUNE_BOOK.CLIENT_NO) = SUNSAIL_ST_INTXRCNM.RCCLNO
	LEFT JOIN 
		TRITON_Stage.dbo.WEBLIBSSL_ST_CNMST WEBLIBSSL_ST_CNMST
		ON
			SUNSAIL_ST_ZNMST.CNNUMB = WEBLIBSSL_ST_CNMST.CNPACK				
	WHERE 
		SUNSAIL_ST_CNMST.CNNUMB IS NULL
		AND
		CONF_DT_CALENDAR_START.a_Year >= 2010


	EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'TRTN','ST_FBKG'
	

	







	

GO
/****** Object:  StoredProcedure [dbo].[BUILD_ST_MARINE_FBKG_INTRADAY]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[BUILD_ST_MARINE_FBKG_INTRADAY]
AS

	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'TRTN','INTR_FBKG','BUILD_ST_MARINE_FBKG_INTRADAY'

	TRUNCATE TABLE ST_MARINE_FBKG_INTRADAY
	
	INSERT INTO 
		ST_MARINE_FBKG_INTRADAY
	SELECT				
		CAST(CAST(102 AS VARCHAR(3)) 
		+	CASE WHEN SUBSTRING(TRITON_ST_CNMST_INTRADAY.CNNUMB,1,1) IN ('0','1','2','3','4','5','6','7','8','9') 
				THEN
					RIGHT('0000000'+ CAST(TRITON_ST_CNMST_INTRADAY.CNNUMB AS VARCHAR(7)), 7) 
				ELSE
					CAST(ASCII(SUBSTRING(TRITON_ST_CNMST_INTRADAY.CNNUMB,1,1)) AS CHAR(2)) + SUBSTRING(TRITON_ST_CNMST_INTRADAY.CNNUMB,2,LEN(TRITON_ST_CNMST_INTRADAY.CNNUMB)) 
				END	
		AS BIGINT) AS i_Sk_Bkg,
		102 AS SourceSysID,
		'TRITON' AS SystemName,
		'M' AS	DivisionCode,
		CASE WHEN SB_MARINE_BASE.a_ProductCode ='FOOTLOOSE' THEN 'FTL' ELSE 'MRG'END AS Brandcode,
		CASE WHEN SB_MARINE_BASE.a_ProductCode ='FOOTLOOSE' THEN 'FOOTLOOSE'
			 WHEN SB_MARINE_BASE.a_ProductCode ='FRANCHISE' THEN 'FRANCHISE'
			 WHEN TRITON_ST_FTMST.FTHULL IN('P','T') THEN 'POWER'
			 WHEN TRITON_ST_FTMST.FTCREW = 'Y' THEN 'CREWED'
			 ELSE SB_MARINE_BASE.a_ProductCode END AS ProductCode,
		NULL AS BookingType,
		0 AS CompanyNo,
		SB_SEASON.i_BK_SeasonCode AS SeasonCode,
		CASE
				WHEN TRITON_ST_CNMST_INTRADAY.CNCANX = 'CANX' THEN 8
				WHEN TRITON_ST_CNMST_INTRADAY.CNOPTN ='C' THEN 3
				ELSE 1
			END AS BookingStatusID,
		RTRIM(LTRIM(TRITON_ST_CNMST_INTRADAY.CNNUMB)) AS BkgRef,
		RTRIM(LTRIM(TRITON_ST_CNMST_INTRADAY.CNCLNB)) AS ClientNo,
		RTRIM(LTRIM(TRITON_ST_CNMST_INTRADAY.CNLOC2)) AS DestResortCd, 
		RTRIM(LTRIM(TRITON_ST_CNMST_INTRADAY.CNBKNG)) AS BkgLocation, 
		TRITON_ST_CNMST_INTRADAY.CNPERS AS PaxNo,
		TRITON_ST_CNMST_INTRADAY.CNOFID AS Boat,
		TRITON_ST_CNMST_INTRADAY.CNFLTY AS BoatType, 
		TRITON_ST_CNMST_INTRADAY.CNLOC2 AS BaseLocation, 
		CASE WHEN TRITON_ST_CNMST_INTRADAY.CNETDT = 0 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_ST_CNMST_INTRADAY.CNETDT),112) END  AS OptionDate,
		NULL  AS OptionExpiryDate,
		CASE 
			WHEN TRITON_ST_CNMST_INTRADAY.CNSRCD IN ('OWNER','OPS','TAAC') AND TRITON_ST_CNMST_INTRADAY.CNOPTN = 'C' THEN 
					CASE WHEN TRITON_ST_CNMST_INTRADAY.CNETDT = 0 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_ST_CNMST_INTRADAY.CNETDT),112) END 
			WHEN ISNULL(TRITON_ST_CHMST.CHDPDT,0) <> 0  THEN 
				CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_ST_CHMST.CHDPDT),112) 
			WHEN ISNULL(TRITON_ST_CHMST.CHDPDT,0) = 0 THEN
				CASE WHEN TRITON_ST_CNMST_INTRADAY.CNOPTN = 'C' AND TRITON_ST_CNMST_INTRADAY.CNCANX <> 'CANX' THEN 
					CASE 
						WHEN TRITON_ST_CNMST_INTRADAY.CNUPD1 = 1 THEN 
							CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_ST_CNMST_INTRADAY.CNETDT),112) 
						ELSE
							CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_ST_CNMST_INTRADAY.CNCHDT),112) 
					END  
				ELSE 
					CONVERT(DATETIME,'19000101',112) 
				END
		END AS ConfirmDate,
		CASE WHEN TRITON_ST_CNMST_INTRADAY.CNARDT = 0 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),BRAINII.dbo.fn_CheckDate(TRITON_ST_CNMST_INTRADAY.CNARDT),112)) END  AS ArrivalDate,
		CASE 
			WHEN ISNULL(TRITON_ST_CHMST.CHCNDT,0) <> 0  THEN 
				CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_ST_CHMST.CHCNDT),112) 
			WHEN ISNULL(TRITON_ST_CHMST.CHCNDT,0) = 0  THEN 
				CASE WHEN TRITON_ST_CNMST_INTRADAY.CNCANX = 'CANX' THEN	
					CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_ST_CNMST_INTRADAY.CNCHDT),112)
				END
		END AS CancelDate,
		CASE WHEN TRITON_ST_CNMST_INTRADAY.CNSTDT = 0 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_ST_CNMST_INTRADAY.CNSTDT),112) END  AS StartDate,
		CASE WHEN TRITON_ST_CNMST_INTRADAY.CNENDT = 0 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_ST_CNMST_INTRADAY.CNENDT),112) END  AS EndDate,
		CONVERT(DATETIME,CONVERT(VARCHAR(8),BRAINII.dbo.fn_CheckDate(TRITON_ST_CNMST_INTRADAY.CNSTDT),112)) AS DepartDate,
		CASE WHEN TRITON_ST_CNMST_INTRADAY.CNCHDT = 0 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_ST_CNMST_INTRADAY.CNCHDT),112) END  AS LastAmendDate,
		CASE 
			WHEN 
				TRITON_ST_CNMST_INTRADAY.CNSTDT  = TRITON_ST_CNMST_INTRADAY.CNENDT THEN 1 
			ELSE 
				DATEDIFF(d,CONVERT(DATETIME,CONVERT(VARCHAR(8),BRAINII.dbo.fn_CheckDate(TRITON_ST_CNMST_INTRADAY.CNSTDT),112)),
				CONVERT(DATETIME,CONVERT(VARCHAR(8),BRAINII.dbo.fn_CheckDate(TRITON_ST_CNMST_INTRADAY.CNENDT),112))) 
		END AS CharterDuration,
		CASE 
			WHEN 
				TRITON_ST_CNMST_INTRADAY.CNSTDT  = TRITON_ST_CNMST_INTRADAY.CNENDT THEN 1 
			ELSE 
				DATEDIFF(d,CONVERT(DATETIME,CONVERT(VARCHAR(8),BRAINII.dbo.fn_CheckDate(TRITON_ST_CNMST_INTRADAY.CNSTDT),112)),
				CONVERT(DATETIME,CONVERT(VARCHAR(8),BRAINII.dbo.fn_CheckDate(TRITON_ST_CNMST_INTRADAY.CNENDT),112))) 
		END AS HolidayDuration,
		RTRIM(LTRIM(CNSRCD)) AS BkgSrcCd,
		COALESCE(RTRIM(LTRIM(TRITON_ST_SUNMRMST_BASE.SNDESC)),
			     RTRIM(LTRIM(TRITON_ST_SUNMRMST_ALL.SNDESC)),
			     RTRIM(LTRIM(TRITON_ST_SUNMRMST_NO_BASE.SNDESC)))
			AS BkgSrcDesc,
		CASE WHEN CLCLS2 IN ('E','T','U') THEN CLNAME ELSE '' END AS AgentContact,
		CASE WHEN CLCLS2 IN ('E','T','U') THEN 'A' ELSE 'D' END AS DirectAgentFlg,
		CASE WHEN CLCLS2 IN ('E','T','U') THEN 'Agent' ELSE 'Direct' END AS DirectAgent,
		RTRIM(LTRIM(CHCNTY)) AS ContractType, 
		RTRIM(LTRIM(CLNAME)) AS LeadPaxSurname,
		RTRIM(LTRIM(CLFNAM)) AS LeadPaxForename,
		RTRIM(LTRIM(CLSALU)) AS LeadPaxTitle,
		SUBSTRING(CLFNAM,1,1) AS LeadPaxInitials,
		RTRIM(LTRIM(CLSALU)) +' ' + RTRIM(LTRIM(CLFNAM)) + ' ' + RTRIM(LTRIM(CLNAME)) AS LeadPaxFullName,
		RTRIM(LTRIM(CLADD1)) AS Address1,
		RTRIM(LTRIM(CLADD2)) AS Address2,
		RTRIM(LTRIM(CLADD3)) AS Address3,
		RTRIM(LTRIM(CLCITY)) AS Town,
		RTRIM(LTRIM(CLSTCD)) AS County,
		RTRIM(LTRIM(CLZIPC)) AS PostCode,
		RTRIM(LTRIM(CLCTRY)) AS Country, 
		RTRIM(LTRIM(CLHMPH)) AS TelephoneNo,
		RTRIM(LTRIM(CLBSPH)) AS TelephoneNo2,
		RTRIM(LTRIM(CLCEPH)) AS TelephoneNo3, 
		RTRIM(LTRIM(IAADDR)) AS Email,
		RTRIM(LTRIM(CNSAL2)) AS PaxTitleSecond,
		RTRIM(LTRIM(CNFNA2)) AS PaxForenameSecond,
		RTRIM(LTRIM(CNNAM2)) AS PaxSurnameSecond,
		NULL AS Notes, 
		NULL AS Comment,
		CASE WHEN CHDPDT<> 0 AND CHSTDT <> 0 THEN  CONVERT(VARCHAR(10), CONVERT(DATETIME,CONVERT(VARCHAR(12),BRAINII.dbo.fn_CheckDate(CHSTDT)),112),121) + ' '  
			+ CASE WHEN CNTME2 > 0 THEN RIGHT('0000'+ CONVERT(VARCHAR(4),CNTME2),4) ELSE  RIGHT('0000'+ CONVERT(VARCHAR(4),CONVERT(NUMERIC(4,0),SB_MARINE_BASE_START.a_StartCharterTime)),4) END
			+ '     '
			+  CONVERT(VARCHAR(10), CONVERT(DATETIME,CONVERT(VARCHAR(12),BRAINII.dbo.fn_CheckDate(CHENDT)),112),121) + ' '
			+  CASE WHEN CNTME3 > 0 THEN RIGHT('0000'+ CONVERT(VARCHAR(4),CNTME3),4) ELSE  RIGHT('0000'+ CONVERT(VARCHAR(4),CONVERT(NUMERIC(4,0),SB_MARINE_BASE_END.a_EndCharterTime)),4) END
		END 
		AS FlightListLong,
		TRITON_ST_CNMST_INTRADAY.CNDESG AS Currency,
		TRITON_ST_CNMST_INTRADAY.CNUSER AS BookedUser,
		TRITON_ST_CNMST_INTRADAY.CNFUSR AS LastAmendUser,
		TRITON_ST_CNMST_INTRADAY.CNDES4 AS ContractUser,
		NULL AS CAA_BondingType,
		TRITON_ST_CNMST_INTRADAY.CNWAIT AS WaitListFlag,
		CASE 
			 WHEN CNUSER = 'INTERNET' AND CLCLS2 IN ('E','T','U') THEN 'Broker Portal'
			 WHEN CNUSER = 'INTERNET' AND CLCLS2 IN ('L') THEN 'Extranet'
			 WHEN CNUSER = 'INTERNET' THEN 'Web'
			 WHEN CLCLS2 IN ('E','T','U') THEN 'Broker'
			 WHEN CLCLS2 IN ('','G','L') THEN 'Sales Centre'
			 ELSE 'Other' 
		END AS BookingChannel,
		CASE
			WHEN CNUSER = 'INTERNET' AND CLCLS2 IN ('E','T','U') THEN 'Broker Portal'  
			WHEN CNUSER = 'INTERNET' AND CLCLS2 IN ('L') THEN 'Extranet'
			WHEN CNUSER = 'INTERNET' THEN 'Web'
			WHEN CLNAME LIKE '%MASTER YACHTING%' THEN 'Master Yachting'  
			WHEN CLCLS2 = 'E' THEN 'European Broker' 
			WHEN CLCLS2 = 'T' THEN 'Travel Agent' 
			WHEN CLCLS2 = 'U' THEN 'US Broker'  
			WHEN CLCLS2 IN ('','G','L') THEN 'Sales Centre' 
			ELSE 'Other' 
		END AS ExpandedBookingChannel
	FROM 
		TRITON_Stage.dbo.TRITON_ST_CNMST_INTRADAY TRITON_ST_CNMST_INTRADAY 
	LEFT JOIN
		TRITON_Stage.dbo.TRITON_ST_CHMST TRITON_ST_CHMST
		ON
			TRITON_ST_CHMST.CHCNNB = TRITON_ST_CNMST_INTRADAY.CNNUMB
	LEFT JOIN 
		TRITON_Stage.dbo.TRITON_ST_CLMST TRITON_ST_CLMST 
		ON
			TRITON_ST_CLMST.CLNUMB = TRITON_ST_CNMST_INTRADAY.CNCLNB
	LEFT JOIN 
		TRITON_Stage.dbo.TRITON_ST_IAMST TRITON_ST_IAMST
		ON
			TRITON_ST_IAMST.IANUMB = TRITON_ST_CNMST_INTRADAY.CNCLNB
	LEFT JOIN 
		AMI_Static.dbo.SB_SEASON
		ON
			CONVERT(DATETIME,CONVERT(VARCHAR(8),BRAINII.dbo.fn_CheckDate(TRITON_ST_CNMST_INTRADAY.CNSTDT),112)) BETWEEN SB_SEASON.a_StartDate AND SB_SEASON.a_EndDate
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_BASE   SB_MARINE_BASE_START  
		ON
			TRITON_ST_CNMST_INTRADAY.CNLOC2 = SB_MARINE_BASE_START.a_BaseCode
		AND 
			SB_MARINE_BASE_START.a_SourceSystemID = 102
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_BASE   SB_MARINE_BASE_END  
		ON
			TRITON_ST_CNMST_INTRADAY.CNLOC3 = SB_MARINE_BASE_END.a_BaseCode
		AND 
			SB_MARINE_BASE_END.a_SourceSystemID = 102
	LEFT JOIN
		AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_START 
		ON
			CONF_DT_CALENDAR_START.i_SK_Calendar = TRITON_ST_CNMST_INTRADAY.CNSTDT
	LEFT JOIN 
		TRITON_Stage.dbo.TRITON_ST_FTMST TRITON_ST_FTMST
		ON 
			TRITON_ST_FTMST.FTTYPE = TRITON_ST_CNMST_INTRADAY.CNFLTY	
	LEFT JOIN
		TRITON_Stage.dbo.TRITON_ST_SUNMRMST TRITON_ST_SUNMRMST_BASE
		ON
			TRITON_ST_SUNMRMST_BASE.SNCODE = TRITON_ST_CNMST_INTRADAY.CNSRCD
			AND
			TRITON_ST_SUNMRMST_BASE.SNBKG1 = TRITON_ST_CNMST_INTRADAY.CNBKNG
	LEFT JOIN
		TRITON_Stage.dbo.TRITON_ST_SUNMRMST TRITON_ST_SUNMRMST_ALL
		ON
			TRITON_ST_SUNMRMST_ALL.SNCODE = TRITON_ST_CNMST_INTRADAY.CNSRCD
			AND
			TRITON_ST_SUNMRMST_ALL.SNBKG1 = 'ALL'
	LEFT JOIN
		TRITON_Stage.dbo.TRITON_ST_SUNMRMST TRITON_ST_SUNMRMST_NO_BASE
		ON
			TRITON_ST_SUNMRMST_NO_BASE.SNCODE = TRITON_ST_CNMST_INTRADAY.CNSRCD
			AND
			TRITON_ST_SUNMRMST_NO_BASE.SNBKG1 = ''
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_BASE
		ON
			SB_MARINE_BASE.a_BaseCode = TRITON_ST_CNMST_INTRADAY.CNLOC2
			AND
			SB_MARINE_BASE.a_SourceSystemID = 102		
	--WHERE 
	--	CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_ST_CNMST_INTRADAY.CNCHDT),112) >= CAST(DATEADD(DAY,-1, GETDATE()) AS DATE)
		
	INSERT INTO 
		ST_MARINE_FBKG_INTRADAY
	SELECT		
		CAST(CAST(101 AS VARCHAR(3)) 
		+	CASE WHEN SUBSTRING(SUNSAIL_ST_CNMST_INTRADAY.CNNUMB,1,1) IN ('0','1','2','3','4','5','6','7','8','9') 
				THEN
					RIGHT('0000000'+ CAST(SUNSAIL_ST_CNMST_INTRADAY.CNNUMB AS VARCHAR(7)), 7) 
				ELSE
					CAST(ASCII(SUBSTRING(SUNSAIL_ST_CNMST_INTRADAY.CNNUMB,1,1)) AS CHAR(2)) + SUBSTRING(SUNSAIL_ST_CNMST_INTRADAY.CNNUMB,2,LEN(SUNSAIL_ST_CNMST_INTRADAY.CNNUMB)) 
				END	
		AS BIGINT) AS i_Sk_Bkg,
		101 AS SourceSysID,
		'NEPTUNE' AS SystemName,
		'M' AS	DivisionCode,
		'SUN'AS Brandcode,
		CASE WHEN SUNSAIL_ST_FTMST.FTHULL IN('P','T') THEN 'POWER'
			 WHEN SUNSAIL_ST_FTMST.FTCREW = 'Y' THEN 'CREWED'
			 ELSE SB_MARINE_BASE.a_ProductCode END AS ProductCode,
		NULL AS BookingType,
		1 AS CompanyNo,
		SB_SEASON.i_BK_SeasonCode AS SeasonCode,
		CASE	WHEN SUNSAIL_ST_CNMST_INTRADAY.CNCANX = 'CANX' THEN 8
				WHEN SUNSAIL_ST_CNMST_INTRADAY.CNOPTN ='C' THEN 3
				ELSE 1
			END AS BookingStatusID,
		RTRIM(LTRIM(SUNSAIL_ST_CNMST_INTRADAY.CNNUMB)) AS BkgRef,
		RTRIM(LTRIM(SUNSAIL_ST_CNMST_INTRADAY.CNCLNB)) AS ClientNo,
		RTRIM(LTRIM(CNLOC2)) AS DestResortCd, 
		RTRIM(LTRIM(CNBKNG)) AS BkgLocation, 
		SUNSAIL_ST_CNMST_INTRADAY.CNPERS AS PaxNo,
		SUNSAIL_ST_CNMST_INTRADAY.CNOFID AS Boat,
		SUNSAIL_ST_CNMST_INTRADAY.CNFLTY AS BoatType, 
		SUNSAIL_ST_CNMST_INTRADAY.CNLOC2 AS BaseLocation, 
		CASE WHEN SUNSAIL_ST_CNMST_INTRADAY.CNETDT = 0 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),SUNSAIL_ST_CNMST_INTRADAY.CNETDT),112) END  AS OptionDate,
		NULL AS OptionExpiryDate,
		CASE 
			WHEN SUNSAIL_ST_CNMST_INTRADAY.CNSRCD IN ('OWNER','OPS','TAAC') AND SUNSAIL_ST_CNMST_INTRADAY.CNOPTN = 'C' THEN 
					CASE WHEN SUNSAIL_ST_CNMST_INTRADAY.CNETDT = 0 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),SUNSAIL_ST_CNMST_INTRADAY.CNETDT),112) END 
			WHEN ISNULL(SUNSAIL_ST_CHMST.CHDPDT,0) <> 0  THEN 
				CONVERT(DATETIME,CONVERT(VARCHAR(8),SUNSAIL_ST_CHMST.CHDPDT),112) 
			WHEN ISNULL(SUNSAIL_ST_CHMST.CHDPDT,0) = 0 THEN
				CASE WHEN SUNSAIL_ST_CNMST_INTRADAY.CNOPTN = 'C' AND SUNSAIL_ST_CNMST_INTRADAY.CNCANX <> 'CANX' THEN 
					CASE 
						WHEN SUNSAIL_ST_CNMST_INTRADAY.CNUPD1 = 1 THEN 
							CONVERT(DATETIME,CONVERT(VARCHAR(8),SUNSAIL_ST_CNMST_INTRADAY.CNETDT),112) 
						ELSE
							CONVERT(DATETIME,CONVERT(VARCHAR(8),SUNSAIL_ST_CNMST_INTRADAY.CNCHDT),112) 
					END  
				ELSE 
					CONVERT(DATETIME,'19000101',112) 
				END
		END AS ConfirmDate,
		CASE WHEN SUNSAIL_ST_CNMST_INTRADAY.CNARDT = 0 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),BRAINII.dbo.fn_CheckDate(SUNSAIL_ST_CNMST_INTRADAY.CNARDT),112)) END  AS ArrivalDate,
		CASE 
			WHEN ISNULL(SUNSAIL_ST_CHMST.CHCNDT,0) <> 0  THEN 
				CONVERT(DATETIME,CONVERT(VARCHAR(8),SUNSAIL_ST_CHMST.CHCNDT),112) 
			WHEN ISNULL(SUNSAIL_ST_CHMST.CHCNDT,0) = 0  THEN 
				CASE WHEN SUNSAIL_ST_CNMST_INTRADAY.CNCANX = 'CANX' THEN	
					CONVERT(DATETIME,CONVERT(VARCHAR(8),SUNSAIL_ST_CNMST_INTRADAY.CNCHDT),112)
				END
		END AS CancelDate,
		CASE WHEN SUNSAIL_ST_CNMST_INTRADAY.CNSTDT = 0 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),SUNSAIL_ST_CNMST_INTRADAY.CNSTDT),112) END  AS StartDate,
		CASE WHEN SUNSAIL_ST_CNMST_INTRADAY.CNENDT = 0 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),SUNSAIL_ST_CNMST_INTRADAY.CNENDT),112) END  AS EndDate,
		CONVERT(DATETIME,CONVERT(VARCHAR(8),BRAINII.dbo.fn_CheckDate(SUNSAIL_ST_CNMST_INTRADAY.CNSTDT),112)) AS DepartDate,
		CASE WHEN SUNSAIL_ST_CNMST_INTRADAY.CNCHDT = 0 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),SUNSAIL_ST_CNMST_INTRADAY.CNCHDT),112) END  AS LastAmendDate,
		CASE 
			WHEN 
				SUNSAIL_ST_CNMST_INTRADAY.CNSTDT  = SUNSAIL_ST_CNMST_INTRADAY.CNENDT THEN 1 
			ELSE 
				DATEDIFF(d,CONVERT(DATETIME,CONVERT(VARCHAR(8),BRAINII.dbo.fn_CheckDate(SUNSAIL_ST_CNMST_INTRADAY.CNSTDT),112)),
				CONVERT(DATETIME,CONVERT(VARCHAR(8),BRAINII.dbo.fn_CheckDate(SUNSAIL_ST_CNMST_INTRADAY.CNENDT),112))) 
		END AS CharterDuration,
		CASE 
			WHEN 
				SUNSAIL_ST_CNMST_INTRADAY.CNSTDT  = SUNSAIL_ST_CNMST_INTRADAY.CNENDT THEN 1 
			ELSE 
				DATEDIFF(d,CONVERT(DATETIME,CONVERT(VARCHAR(8),BRAINII.dbo.fn_CheckDate(SUNSAIL_ST_CNMST_INTRADAY.CNSTDT),112)),
				CONVERT(DATETIME,CONVERT(VARCHAR(8),BRAINII.dbo.fn_CheckDate(SUNSAIL_ST_CNMST_INTRADAY.CNENDT),112))) 
		END AS HolidayDuration,
		RTRIM(LTRIM(CNSRCD)) AS BkgSrcCd, 
		COALESCE(RTRIM(LTRIM(SUNSAIL_ST_SUNMRMST_BASE.SNDESC)),
			     RTRIM(LTRIM(SUNSAIL_ST_SUNMRMST_ALL.SNDESC)),
			     RTRIM(LTRIM(SUNSAIL_ST_SUNMRMST_NO_BASE.SNDESC)))
			AS BkgSrcDesc,
		CASE WHEN CLCLS2 IN ('E','T','U') THEN CLNAME ELSE '' END AS AgentContact,
		CASE WHEN CLCLS2 IN ('E','T','U') THEN 'A' ELSE 'D' END AS DirectAgentFlg,
		CASE WHEN CLCLS2 IN ('E','T','U') THEN 'Agent' ELSE 'Direct' END AS DirectAgent,
		RTRIM(LTRIM(CHCNTY)) AS ContractType, 
		RTRIM(LTRIM(CLNAME)) AS LeadPaxSurname,
		RTRIM(LTRIM(CLFNAM)) AS LeadPaxForename,
		RTRIM(LTRIM(CLSALU)) AS LeadPaxTitle,
		SUBSTRING(CLFNAM,1,1) AS LeadPaxInitials,
		RTRIM(LTRIM(CLSALU)) +' ' + RTRIM(LTRIM(CLFNAM)) + ' ' + RTRIM(LTRIM(CLNAME)) AS LeadPaxFullName,
		RTRIM(LTRIM(CLADD1)) AS Address1,
		RTRIM(LTRIM(CLADD2)) AS Address2,
		RTRIM(LTRIM(CLADD3)) AS Address3,
		RTRIM(LTRIM(CLCITY)) AS Town,
		RTRIM(LTRIM(CLSTCD)) AS County,
		RTRIM(LTRIM(CLZIPC)) AS PostCode,
		RTRIM(LTRIM(CLCTRY)) AS Country, 
		RTRIM(LTRIM(CLHMPH)) AS TelephoneNo,
		RTRIM(LTRIM(CLBSPH)) AS TelephoneNo2,
		RTRIM(LTRIM(CLCEPH)) AS TelephoneNo3, 
		RTRIM(LTRIM(IAADDR)) AS Email,
		RTRIM(LTRIM(CNSAL2)) AS PaxTitleSecond,
		RTRIM(LTRIM(CNFNA2)) AS PaxForenameSecond,
		RTRIM(LTRIM(CNNAM2)) AS PaxSurnameSecond,
		NULL AS Notes, 
		NULL AS Comment,
		CASE WHEN CHDPDT<> 0 AND CHSTDT <> 0 THEN  CONVERT(VARCHAR(10), CONVERT(DATETIME,CONVERT(VARCHAR(12),BRAINII.dbo.fn_CheckDate(CHSTDT)),112),121) + ' '  
			+ CASE WHEN CNTME2 > 0 THEN RIGHT('0000'+ CONVERT(VARCHAR(4),CNTME2),4) ELSE  RIGHT('0000'+ CONVERT(VARCHAR(4),CONVERT(NUMERIC(4,0),SB_MARINE_BASE_START.a_StartCharterTime)),4) END
			+ '     '
			+  CONVERT(VARCHAR(10), CONVERT(DATETIME,CONVERT(VARCHAR(12),BRAINII.dbo.fn_CheckDate(CHENDT)),112),121) + ' '
			+  CASE WHEN CNTME3 > 0 THEN RIGHT('0000'+ CONVERT(VARCHAR(4),CNTME3),4) ELSE  RIGHT('0000'+ CONVERT(VARCHAR(4),CONVERT(NUMERIC(4,0),SB_MARINE_BASE_END.a_EndCharterTime)),4) END
		END 
		AS FlightListLong,
		SUNSAIL_ST_CNMST_INTRADAY.CNDESG AS Currency,
		SUNSAIL_ST_CNMST_INTRADAY.CNUSER AS BookedUser,
		SUNSAIL_ST_CNMST_INTRADAY.CNFUSR AS LastAmendUser,
		SUNSAIL_ST_CNMST_INTRADAY.CNDES4 AS ContractUser,
		NULL AS CAA_BondingType,
		SUNSAIL_ST_CNMST_INTRADAY.CNWAIT AS WaitListFlag,
		CASE 
			 WHEN CNUSER = 'INTERNET' AND CLCLS2 IN ('E','T','U') THEN 'Broker Portal'
			 WHEN CNUSER = 'INTERNET' AND CLCLS2 IN ('L') THEN 'Extranet'
			 WHEN CNUSER = 'INTERNET' THEN 'Web'
			 WHEN CLCLS2 IN ('E','T','U') THEN 'Broker'
			 WHEN CLCLS2 IN ('','G','L') THEN 'Sales Centre'
			 ELSE 'Other' 
		END AS BookingChannel,
		CASE
			WHEN CNUSER = 'INTERNET' AND CLCLS2 IN ('E','T','U') THEN 'Broker Portal'  
			WHEN CNUSER = 'INTERNET' AND CLCLS2 IN ('L') THEN 'Extranet'
			WHEN CNUSER = 'INTERNET' THEN 'Web'
			WHEN CLNAME LIKE '%MASTER YACHTING%' THEN 'Master Yachting'  
			WHEN CLCLS2 = 'E' THEN 'European Broker' 
			WHEN CLCLS2 = 'T' THEN 'Travel Agent' 
			WHEN CLCLS2 = 'U' THEN 'US Broker'  
			WHEN CLCLS2 IN ('','G','L') THEN 'Sales Centre' 
			ELSE 'Other'
		END AS ExpandedBookingChannel
	FROM 
		TRITON_Stage.dbo.SUNSAIL_ST_CNMST_INTRADAY SUNSAIL_ST_CNMST_INTRADAY 
	LEFT JOIN
		TRITON_Stage.dbo.SUNSAIL_ST_CHMST SUNSAIL_ST_CHMST
		ON
			SUNSAIL_ST_CHMST.CHCNNB = SUNSAIL_ST_CNMST_INTRADAY.CNNUMB
	LEFT JOIN 
		TRITON_Stage.dbo.SUNSAIL_ST_CLMST SUNSAIL_ST_CLMST
		ON
			SUNSAIL_ST_CLMST.CLNUMB = SUNSAIL_ST_CNMST_INTRADAY.CNCLNB
	LEFT JOIN 
		TRITON_Stage.dbo.SUNSAIL_ST_IAMST SUNSAIL_ST_IAMST
		ON
			SUNSAIL_ST_IAMST.IANUMB = SUNSAIL_ST_CNMST_INTRADAY.CNCLNB
	LEFT JOIN 
		AMI_Static.dbo.SB_SEASON
		ON
			CONVERT(DATETIME,CONVERT(VARCHAR(8),BRAINII.dbo.fn_CheckDate(SUNSAIL_ST_CNMST_INTRADAY.CNSTDT),112)) BETWEEN SB_SEASON.a_StartDate AND SB_SEASON.a_EndDate
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_BASE   SB_MARINE_BASE_START  
		ON
			SUNSAIL_ST_CNMST_INTRADAY.CNLOC2 = SB_MARINE_BASE_START.a_BaseCode
		AND 
			SB_MARINE_BASE_START.a_SourceSystemID = 101
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_BASE   SB_MARINE_BASE_END  
		ON
			SUNSAIL_ST_CNMST_INTRADAY.CNLOC3 = SB_MARINE_BASE_END.a_BaseCode
		AND 
			SB_MARINE_BASE_END.a_SourceSystemID = 101
	LEFT JOIN
		AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_START 
		ON
			CONF_DT_CALENDAR_START.i_SK_Calendar = SUNSAIL_ST_CNMST_INTRADAY.CNSTDT
	LEFT JOIN 
		TRITON_Stage.dbo.SUNSAIL_ST_FTMST SUNSAIL_ST_FTMST
		ON 
			SUNSAIL_ST_FTMST.FTTYPE = SUNSAIL_ST_CNMST_INTRADAY.CNFLTY
	LEFT JOIN
		TRITON_Stage.dbo.SUNSAIL_ST_SUNMRMST SUNSAIL_ST_SUNMRMST_BASE
		ON
			SUNSAIL_ST_SUNMRMST_BASE.SNCODE = SUNSAIL_ST_CNMST_INTRADAY.CNSRCD
			AND
			SUNSAIL_ST_SUNMRMST_BASE.SNBKG1 = SUNSAIL_ST_CNMST_INTRADAY.CNBKNG
	LEFT JOIN
		TRITON_Stage.dbo.SUNSAIL_ST_SUNMRMST SUNSAIL_ST_SUNMRMST_ALL
		ON
			SUNSAIL_ST_SUNMRMST_ALL.SNCODE = SUNSAIL_ST_CNMST_INTRADAY.CNSRCD
			AND
			SUNSAIL_ST_SUNMRMST_ALL.SNBKG1 = 'ALL'
	LEFT JOIN
		TRITON_Stage.dbo.SUNSAIL_ST_SUNMRMST SUNSAIL_ST_SUNMRMST_NO_BASE
		ON
			SUNSAIL_ST_SUNMRMST_NO_BASE.SNCODE = SUNSAIL_ST_CNMST_INTRADAY.CNSRCD
			AND
			SUNSAIL_ST_SUNMRMST_NO_BASE.SNBKG1 = ''
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_BASE
		ON
			SB_MARINE_BASE.a_BaseCode = SUNSAIL_ST_CNMST_INTRADAY.CNLOC2
			AND
			SB_MARINE_BASE.a_SourceSystemID = 101	
	LEFT JOIN 
		TRITON_Stage.dbo.SUNSAIL_ST_INTXRCNM SUNSAIL_ST_INTXRCNM
		ON
			SUNSAIL_ST_INTXRCNM.RCNUMB  = SUNSAIL_ST_CNMST_INTRADAY.CNNUMB
	--WHERE 
	--	CONVERT(DATETIME,CONVERT(VARCHAR(8),SUNSAIL_ST_CNMST_INTRADAY.CNCHDT),112) >= CAST(DATEADD(DAY,-1, GETDATE()) AS DATE)
	
		
EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'TRTN','INTR_FBKG'
GO
/****** Object:  StoredProcedure [dbo].[BUILD_ST_MARINE_FBKG_QUOTES]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




/**************************************************************************************************************************
** File:    
** Name: [dbo].[BUILD_ST_MARINE_FBKG_QUOTES]
** Desc:
** Auth: 
** Date: 
***************************************************************************************************************************
** Change History
***************************************************************************************************************************
** PR   Date	     Author        Description	
** --   ----------   -----------   ----------------------------------------------------------------------------------------
** 1    11/03/2016   Murali        Added one more replace function to QuoteComment for replacing the character 0x0001 to ''
**     	20/07/2017   KFeaster      Added the column BookedWithMIT
-- 1	23/08/2017	KFeaster	   Added columns: i_sk_base_from & i_sk_base_to with NULL values as the table requires the column 
***************************************************************************************************************************/


CREATE PROCEDURE [dbo].[BUILD_ST_MARINE_FBKG_QUOTES]
AS

	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'TRTN','ST_FBKGQ','BUILD_ST_MARINE_FBKG_QUOTES'

	DELETE FROM ST_MARINE_FBKG WHERE BookingStatusID IN (4,22)

	INSERT INTO 
		ST_MARINE_FBKG
	SELECT		
		CAST(CAST(101 AS VARCHAR(3)) + '09'+  
		+	CASE WHEN SUBSTRING(SUNSAIL_ST_QNMST.QNNUMB,1,1) IN ('0','1','2','3','4','5','6','7','8','9') 
				THEN
					RIGHT('0000000'+ CAST(SUNSAIL_ST_QNMST.QNNUMB AS VARCHAR(7)), 7) 
				ELSE
					CAST(ASCII(SUBSTRING(SUNSAIL_ST_QNMST.QNNUMB,1,1)) AS CHAR(2)) + SUBSTRING(SUNSAIL_ST_QNMST.QNNUMB,2,LEN(SUNSAIL_ST_QNMST.QNNUMB)) 
				END	
		AS BIGINT) AS i_Sk_Bkg,
		101 AS SourceSysID,
		'NEPTUNE' AS SystemName,
		'M' AS	DivisionCode,
		'SUN'AS Brandcode,
		CASE WHEN SUNSAIL_ST_QNMST.QNSTUS = 'B' THEN 'BAREBOAT'
			 WHEN SUNSAIL_ST_QNMST.QNSTUS = 'F' THEN 'FLIGHT'
			 WHEN SUNSAIL_ST_QNMST.QNSTUS = 'L' THEN 'FLOTILLA'
			 WHEN SUNSAIL_ST_QNMST.QNSTUS = 'T' THEN 'LEBOAT' END AS ProductCode,
		NULL AS BookingType,
		1 AS CompanyNo,
		SB_SEASON.i_BK_SeasonCode AS SeasonCode,
		CASE WHEN QNCANX = '' THEN 4 ELSE 22 END  AS BookingStatusID,
		RTRIM(LTRIM(SUNSAIL_ST_QNMST.QNNUMB)) AS BkgRef,
		RTRIM(LTRIM(SUNSAIL_ST_QNMST.QNCLNB)) AS ClientNo,
		RTRIM(LTRIM(SUNSAIL_ST_QNMST.QNLOC2)) AS DestResortCd, 
		RTRIM(LTRIM(SUNSAIL_ST_QNMST.QNBKNG)) AS BkgLocation, 
		SUNSAIL_ST_QNMST.QNPERS AS PaxNo,
		SUNSAIL_ST_QNMST.QNOFID AS Boat,
		SUNSAIL_ST_QNMST.QNFLTY AS BoatType, 
		SUNSAIL_ST_FTMST.FTCREW AS CrewedFlag, 
		SUNSAIL_ST_QNMST.QNLOC2 AS BaseLocation, 
		SUNSAIL_ST_QNMST.QNDES6 AS DestinationLocation,
		CASE WHEN SUNSAIL_ST_QNMST.QNETDT = 0 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_QNMST.QNETDT),112)) END  AS OptionDate,
		NULL  AS OptionExpiryDate,
		NULL  AS ConfirmDate,
		CASE WHEN SUNSAIL_ST_QNMST.QNARDT = 0 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_QNMST.QNARDT),112)) END  AS ArrivalDate,
		NULL AS CancelDate,
		CASE WHEN SUNSAIL_ST_QNMST.QNSTDT = 0 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_QNMST.QNSTDT),112)) END  AS StartDate,
		CASE WHEN SUNSAIL_ST_QNMST.QNENDT = 0 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_QNMST.QNENDT),112)) END  AS EndDate,
		CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_QNMST.QNSTDT),112)) AS DepartDate,
		CASE WHEN SUNSAIL_ST_QNMST.QNCHDT = 0 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_QNMST.QNCHDT),112)) END  AS LastAmendDate,
		CASE 
			WHEN 
				SUNSAIL_ST_QNMST.QNSTDT  = SUNSAIL_ST_QNMST.QNENDT THEN 1 
			ELSE 
				DATEDIFF(d,CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_QNMST.QNSTDT),112)),
				CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_QNMST.QNENDT),112))) 
		END AS CharterDuration,
		CASE 
			WHEN 
				SUNSAIL_ST_QNMST.QNSTDT  = SUNSAIL_ST_QNMST.QNENDT THEN 1 
			ELSE 
				DATEDIFF(d,CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_QNMST.QNSTDT),112)),
				CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_QNMST.QNENDT),112))) 
		END AS HolidayDuration,
		RTRIM(LTRIM(SUNSAIL_ST_QNMST.QNSRCD)) AS BkgSrcCd, 
		COALESCE(RTRIM(LTRIM(SUNSAIL_ST_SUNMRMST_BASE.SNDESC)),
			     RTRIM(LTRIM(SUNSAIL_ST_SUNMRMST_ALL.SNDESC)),
			     RTRIM(LTRIM(SUNSAIL_ST_SUNMRMST_NO_BASE.SNDESC)))
			AS BkgSrcDesc,
		CASE WHEN CLCLS2 IN ('E','T','U') THEN CLNAME ELSE '' END AS AgentContact,
		CASE WHEN CLCLS2 IN ('E','T','U') THEN 'A' ELSE 'D' END AS DirectAgentFlg,
		CASE WHEN CLCLS2 IN ('E','T','U') THEN 'Agent' ELSE 'Direct' END AS DirectAgent,
		NULL AS ContractType, 
		RTRIM(LTRIM(CLNAME)) AS LeadPaxSurname,
		RTRIM(LTRIM(CLFNAM)) AS LeadPaxForename,
		RTRIM(LTRIM(CLSALU)) AS LeadPaxTitle,
		SUBSTRING(CLFNAM,1,1) AS LeadPaxInitials,
		RTRIM(LTRIM(CLSALU)) +' ' + RTRIM(LTRIM(CLFNAM)) + ' ' + RTRIM(LTRIM(CLNAME)) AS LeadPaxFullName,
		RTRIM(LTRIM(CLADD1)) AS Address1,
		RTRIM(LTRIM(CLADD2)) AS Address2,
		RTRIM(LTRIM(CLADD3)) AS Address3,
		RTRIM(LTRIM(CLCITY)) AS Town,
		RTRIM(LTRIM(CLSTCD)) AS County,
		RTRIM(LTRIM(CLZIPC)) AS PostCode,
		RTRIM(LTRIM(CLCTRY)) AS Country, 
		RTRIM(LTRIM(CLHMPH)) AS TelephoneNo,
		RTRIM(LTRIM(CLBSPH)) AS TelephoneNo2,
		RTRIM(LTRIM(CLCEPH)) AS TelephoneNo3, 
		RTRIM(LTRIM(IAADDR)) AS Email,
		RTRIM(LTRIM(SUNSAIL_ST_QNMST.QNSAL2)) AS PaxTitleSecond,
		RTRIM(LTRIM(SUNSAIL_ST_QNMST.QNFNA2)) AS PaxForenameSecond,
		RTRIM(LTRIM(SUNSAIL_ST_QNMST.QNNAM2)) AS PaxSurnameSecond,
		NULL AS Notes, 
		NULL AS Comments,
		NULL AS FlightListLong,
		SUNSAIL_ST_QNMST.QNDESG AS Currency,
		SUNSAIL_ST_QNMST.QNUSER AS BookedUser,
		SUNSAIL_ST_QNMST.QNFUSR AS LastAmendUser,
		SUNSAIL_ST_QNMST.QNDES4 AS ContractUser,
		NULL AS CAA_BondingType,
		SUNSAIL_ST_QNMST.QNWAIT AS WaitListFlag,
		CASE 
			 WHEN SUNSAIL_ST_QNMST.QNUSER = 'INTERNET' AND CLCLS2 IN ('E','T','U') THEN 'Broker Portal'
			 WHEN SUNSAIL_ST_QNMST.QNUSER = 'INTERNET' AND CLCLS2 IN ('L') THEN 'Extranet'
			 WHEN SUNSAIL_ST_QNMST.QNUSER = 'INTERNET' THEN 'Web'
			 WHEN CLCLS2 IN ('E','T','U') THEN 'Broker'
			 WHEN CLCLS2 IN ('','G','L') THEN 'Sales Centre'
			 ELSE 'Other' 
		END AS BookingChannel,
		CASE
			WHEN SUNSAIL_ST_QNMST.QNUSER = 'INTERNET' AND CLCLS2 IN ('E','T','U') THEN 'Broker Portal'  
			WHEN SUNSAIL_ST_QNMST.QNUSER = 'INTERNET' AND CLCLS2 IN ('L') THEN 'Extranet'
			WHEN SUNSAIL_ST_QNMST.QNUSER = 'INTERNET' THEN 'Web'
			WHEN CLNAME LIKE '%MASTER YACHTING%' THEN 'Master Yachting'  
			WHEN CLCLS2 = 'E' THEN 'European Broker' 
			WHEN CLCLS2 = 'T' THEN 'Travel Agent' 
			WHEN CLCLS2 = 'U' THEN 'US Broker'  
			WHEN CLCLS2 IN ('','G','L') THEN 'Sales Centre' 
			ELSE 'Other'
		END AS ExpandedBookingChannel,
		WEBLIBSSL_ST_CNMST.CNNUMB AS WebBkgRef,
		WEBLIBSSL_ST_CNMST.CNUSER AS WebBookedUser,
		SUNSAIL_ST_QNMST.QNCODE AS InhibitProcessFlag,
		SUNSAIL_ST_QNMST.QNGRPN AS GroupCode,
		SUNSAIL_ST_QNMST.QNTYPE AS BookingCode,
		SUNSAIL_ST_CNMST.CNBMIT AS BookedWithMIT,
		i_sk_base_from = NULL,		
		i_sk_base_to = NULL
	FROM 
		TRITON_Stage.dbo.SUNSAIL_ST_QNMST SUNSAIL_ST_QNMST
	LEFT JOIN 
		TRITON_Stage.dbo.SUNSAIL_ST_CLMST SUNSAIL_ST_CLMST
		ON
			SUNSAIL_ST_CLMST.CLNUMB = SUNSAIL_ST_QNMST.QNCLNB
	LEFT JOIN 
		TRITON_Stage.dbo.SUNSAIL_ST_IAMST SUNSAIL_ST_IAMST
		ON
			SUNSAIL_ST_IAMST.IANUMB = SUNSAIL_ST_QNMST.QNCLNB
	LEFT JOIN 
		AMI_Static.dbo.SB_SEASON
		ON
			CONVERT(DATETIME,CONVERT(VARCHAR(8),CASE WHEN SUNSAIL_ST_QNMST.QNSTDT BETWEEN 19000101 AND 20451231 THEN SUNSAIL_ST_QNMST.QNSTDT ELSE 19000101 END,112)) BETWEEN SB_SEASON.a_StartDate AND SB_SEASON.a_EndDate
	LEFT JOIN
		AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_START 
		ON
			CONF_DT_CALENDAR_START.i_SK_Calendar = SUNSAIL_ST_QNMST.QNSTDT
	LEFT JOIN 
		TRITON_Stage.dbo.SUNSAIL_ST_FTMST SUNSAIL_ST_FTMST
		ON 
			SUNSAIL_ST_FTMST.FTTYPE = SUNSAIL_ST_QNMST.QNFLTY
	LEFT JOIN
		TRITON_Stage.dbo.SUNSAIL_ST_SUNMRMST SUNSAIL_ST_SUNMRMST_BASE
		ON
			SUNSAIL_ST_SUNMRMST_BASE.SNCODE = SUNSAIL_ST_QNMST.QNSRCD
			AND
			SUNSAIL_ST_SUNMRMST_BASE.SNBKG1 = SUNSAIL_ST_QNMST.QNBKNG
	LEFT JOIN
		TRITON_Stage.dbo.SUNSAIL_ST_SUNMRMST SUNSAIL_ST_SUNMRMST_ALL
		ON
			SUNSAIL_ST_SUNMRMST_ALL.SNCODE = SUNSAIL_ST_QNMST.QNSRCD
			AND
			SUNSAIL_ST_SUNMRMST_ALL.SNBKG1 = 'ALL'
	LEFT JOIN
		TRITON_Stage.dbo.SUNSAIL_ST_SUNMRMST SUNSAIL_ST_SUNMRMST_NO_BASE
		ON
			SUNSAIL_ST_SUNMRMST_NO_BASE.SNCODE = SUNSAIL_ST_QNMST.QNSRCD
			AND
			SUNSAIL_ST_SUNMRMST_NO_BASE.SNBKG1 = ''	
	LEFT JOIN 
		TRITON_Stage.dbo.WEBLIBSSL_ST_CNMST WEBLIBSSL_ST_CNMST
		ON
			SUNSAIL_ST_QNMST.QNNUMB = WEBLIBSSL_ST_CNMST.CNPACK
	LEFT JOIN 
		TRITON_Stage.dbo.SUNSAIL_ST_LSMST SUNSAIL_ST_LSMST
		ON
			SUNSAIL_ST_LSMST.LSCODE  = SUNSAIL_ST_QNMST.QNLSCD	
	LEFT JOIN 
		SUNSAIL_ST_CNMST	
		ON 
			SUNSAIL_ST_CNMST.CNNUMB = SUNSAIL_ST_QNMST.QNNUMB

		
	INSERT INTO 
		ST_MARINE_FBKG
	SELECT		
		CAST(CAST(102 AS VARCHAR(3)) + '09'+  
		+	CASE WHEN SUBSTRING(TRITON_ST_QNMST.QNNUMB,1,1) IN ('0','1','2','3','4','5','6','7','8','9') 
				THEN
					RIGHT('0000000'+ CAST(TRITON_ST_QNMST.QNNUMB AS VARCHAR(7)), 7) 
				ELSE
					CAST(ASCII(SUBSTRING(TRITON_ST_QNMST.QNNUMB,1,1)) AS CHAR(2)) + SUBSTRING(TRITON_ST_QNMST.QNNUMB,2,LEN(TRITON_ST_QNMST.QNNUMB)) 
				END	
		AS BIGINT) AS i_Sk_Bkg,
		102 AS SourceSysID,
		'TRITON' AS SystemName,
		'M' AS	DivisionCode,
		CASE WHEN TRITON_ST_QNMST.QNSTUS ='F' THEN 'FTL' ELSE 'MRG'END AS Brandcode,
		CASE WHEN TRITON_ST_QNMST.QNSTUS = 'L' THEN 'MOORINGS'
			 WHEN TRITON_ST_QNMST.QNSTUS = 'F' THEN 'FOOTLOOSE' END AS ProductCode,
		NULL AS BookingType,
		1 AS CompanyNo,
		SB_SEASON.i_BK_SeasonCode AS SeasonCode,
		CASE WHEN QNCANX = '' THEN 4 ELSE 22 END  AS BookingStatusID,
		RTRIM(LTRIM(TRITON_ST_QNMST.QNNUMB)) AS BkgRef,
		RTRIM(LTRIM(TRITON_ST_QNMST.QNCLNB)) AS ClientNo,
		RTRIM(LTRIM(TRITON_ST_QNMST.QNLOC2)) AS DestResortCd, 
		RTRIM(LTRIM(TRITON_ST_QNMST.QNBKNG)) AS BkgLocation, 
		TRITON_ST_QNMST.QNPERS AS PaxNo,
		TRITON_ST_QNMST.QNOFID AS Boat,
		TRITON_ST_QNMST.QNFLTY AS BoatType, 
		TRITON_ST_FTMST.FTCREW AS CrewedFlag, 
		TRITON_ST_QNMST.QNLOC2 AS BaseLocation, 
		TRITON_ST_QNMST.QNDES6 AS DestinationLocation,
		CASE WHEN TRITON_ST_QNMST.QNETDT = 0 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_ST_QNMST.QNETDT),112) END  AS OptionDate,
		NULL  AS OptionExpiryDate,
		NULL  AS ConfirmDate,
		CASE WHEN TRITON_ST_QNMST.QNARDT = 0 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(TRITON_ST_QNMST.QNARDT),112)) END  AS ArrivalDate,
		NULL AS CancelDate,
		CASE WHEN TRITON_ST_QNMST.QNSTDT = 0 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(TRITON_ST_QNMST.QNSTDT),112)) END  AS StartDate,
		CASE WHEN TRITON_ST_QNMST.QNENDT = 0 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(TRITON_ST_QNMST.QNENDT),112)) END  AS EndDate,
		CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(TRITON_ST_QNMST.QNSTDT),112)) AS DepartDate,
		CASE WHEN TRITON_ST_QNMST.QNCHDT = 0 THEN CONVERT(DATETIME,'19000101',112)  ELSE CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(TRITON_ST_QNMST.QNCHDT),112)) END  AS LastAmendDate,
		CASE 
			WHEN 
				TRITON_ST_QNMST.QNSTDT  = TRITON_ST_QNMST.QNENDT THEN 1 
			ELSE 
				DATEDIFF(d,CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(TRITON_ST_QNMST.QNSTDT),112)),
				CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(TRITON_ST_QNMST.QNENDT),112))) 
		END AS CharterDuration,
		CASE 
			WHEN 
				TRITON_ST_QNMST.QNSTDT  = TRITON_ST_QNMST.QNENDT THEN 1 
			ELSE 
				DATEDIFF(d,CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(TRITON_ST_QNMST.QNSTDT),112)),
				CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(TRITON_ST_QNMST.QNENDT),112))) 
		END AS HolidayDuration,
		RTRIM(LTRIM(TRITON_ST_QNMST.QNSRCD)) AS BkgSrcCd, 
		COALESCE(RTRIM(LTRIM(TRITON_ST_SUNMRMST_BASE.SNDESC)),
			     RTRIM(LTRIM(TRITON_ST_SUNMRMST_ALL.SNDESC)),
			     RTRIM(LTRIM(TRITON_ST_SUNMRMST_NO_BASE.SNDESC)))
			AS BkgSrcDesc,
		CASE WHEN CLCLS2 IN ('E','T','U') THEN CLNAME ELSE '' END AS AgentContact,
		CASE WHEN CLCLS2 IN ('E','T','U') THEN 'A' ELSE 'D' END AS DirectAgentFlg,
		CASE WHEN CLCLS2 IN ('E','T','U') THEN 'Agent' ELSE 'Direct' END AS DirectAgent,
		NULL AS ContractType, 
		RTRIM(LTRIM(CLNAME)) AS LeadPaxSurname,
		RTRIM(LTRIM(CLFNAM)) AS LeadPaxForename,
		RTRIM(LTRIM(CLSALU)) AS LeadPaxTitle,
		SUBSTRING(CLFNAM,1,1) AS LeadPaxInitials,
		RTRIM(LTRIM(CLSALU)) +' ' + RTRIM(LTRIM(CLFNAM)) + ' ' + RTRIM(LTRIM(CLNAME)) AS LeadPaxFullName,
		RTRIM(LTRIM(CLADD1)) AS Address1,
		RTRIM(LTRIM(CLADD2)) AS Address2,
		RTRIM(LTRIM(CLADD3)) AS Address3,
		RTRIM(LTRIM(CLCITY)) AS Town,
		RTRIM(LTRIM(CLSTCD)) AS County,
		RTRIM(LTRIM(CLZIPC)) AS PostCode,
		RTRIM(LTRIM(CLCTRY)) AS Country, 
		RTRIM(LTRIM(CLHMPH)) AS TelephoneNo,
		RTRIM(LTRIM(CLBSPH)) AS TelephoneNo2,
		RTRIM(LTRIM(CLCEPH)) AS TelephoneNo3, 
		RTRIM(LTRIM(IAADDR)) AS Email,
		RTRIM(LTRIM(TRITON_ST_QNMST.QNSAL2)) AS PaxTitleSecond,
		RTRIM(LTRIM(TRITON_ST_QNMST.QNFNA2)) AS PaxForenameSecond,
		RTRIM(LTRIM(TRITON_ST_QNMST.QNNAM2)) AS PaxSurnameSecond,
		NULL AS Notes, 
		NULL AS Comments,
		NULL AS FlightListLong,
		TRITON_ST_QNMST.QNDESG AS Currency,
		TRITON_ST_QNMST.QNUSER AS BookedUser,
		TRITON_ST_QNMST.QNFUSR AS LastAmendUser,
		TRITON_ST_QNMST.QNDES4 AS ContractUser,
		NULL AS CAA_BondingType,
		TRITON_ST_QNMST.QNWAIT AS WaitListFlag,
		CASE 
			 WHEN TRITON_ST_QNMST.QNUSER = 'INTERNET' AND CLCLS2 IN ('E','T','U') THEN 'Broker Portal'
			 WHEN TRITON_ST_QNMST.QNUSER = 'INTERNET' AND CLCLS2 IN ('L') THEN 'Extranet'
			 WHEN TRITON_ST_QNMST.QNUSER = 'INTERNET' THEN 'Web'
			 WHEN CLCLS2 IN ('E','T','U') THEN 'Broker'
			 WHEN CLCLS2 IN ('','G','L') THEN 'Sales Centre'
			 ELSE 'Other' 
		END AS BookingChannel,
		CASE
			WHEN TRITON_ST_QNMST.QNUSER = 'INTERNET' AND CLCLS2 IN ('E','T','U') THEN 'Broker Portal'  
			WHEN TRITON_ST_QNMST.QNUSER = 'INTERNET' AND CLCLS2 IN ('L') THEN 'Extranet'
			WHEN TRITON_ST_QNMST.QNUSER = 'INTERNET' THEN 'Web'
			WHEN CLNAME LIKE '%MASTER YACHTING%' THEN 'Master Yachting'  
			WHEN CLCLS2 = 'E' THEN 'European Broker' 
			WHEN CLCLS2 = 'T' THEN 'Travel Agent' 
			WHEN CLCLS2 = 'U' THEN 'US Broker'  
			WHEN CLCLS2 IN ('','G','L') THEN 'Sales Centre' 
			ELSE 'Other'
		END AS ExpandedBookingChannel,
		WEBLIBSSL_ST_CNMST.CNNUMB AS WebBkgRef,
		WEBLIBSSL_ST_CNMST.CNUSER AS WebBookedUser,
		TRITON_ST_QNMST.QNCODE AS InhibitProcessFlag,
		TRITON_ST_QNMST.QNGRPN AS GroupCode,
		TRITON_ST_QNMST.QNTYPE AS BookingCode,
    	TRITON_ST_CNMST.CNBMIT AS BookedWithMIT,
		i_sk_base_from = NULL,		
		i_sk_base_to = NULL
	FROM 
		TRITON_Stage.dbo.TRITON_ST_QNMST TRITON_ST_QNMST
	LEFT JOIN 
		TRITON_Stage.dbo.TRITON_ST_CLMST TRITON_ST_CLMST
		ON
			TRITON_ST_CLMST.CLNUMB = TRITON_ST_QNMST.QNCLNB
	LEFT JOIN 
		TRITON_Stage.dbo.SUNSAIL_ST_IAMST TRITON_ST_IAMST
		ON
			TRITON_ST_IAMST.IANUMB = TRITON_ST_QNMST.QNCLNB
	LEFT JOIN 
		AMI_Static.dbo.SB_SEASON
		ON
			CONVERT(DATETIME,CONVERT(VARCHAR(8),CASE WHEN TRITON_ST_QNMST.QNSTDT BETWEEN 19000101 AND 20451231 THEN TRITON_ST_QNMST.QNSTDT ELSE 19000101 END,112)) BETWEEN SB_SEASON.a_StartDate AND SB_SEASON.a_EndDate
	LEFT JOIN
		AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_START 
		ON
			CONF_DT_CALENDAR_START.i_SK_Calendar = TRITON_ST_QNMST.QNSTDT
	LEFT JOIN 
		TRITON_Stage.dbo.TRITON_ST_FTMST TRITON_ST_FTMST
		ON 
			TRITON_ST_FTMST.FTTYPE = TRITON_ST_QNMST.QNFLTY
	LEFT JOIN
		TRITON_Stage.dbo.TRITON_ST_SUNMRMST TRITON_ST_SUNMRMST_BASE
		ON
			TRITON_ST_SUNMRMST_BASE.SNCODE = TRITON_ST_QNMST.QNSRCD
			AND
			TRITON_ST_SUNMRMST_BASE.SNBKG1 = TRITON_ST_QNMST.QNBKNG
	LEFT JOIN
		TRITON_Stage.dbo.TRITON_ST_SUNMRMST TRITON_ST_SUNMRMST_ALL
		ON
			TRITON_ST_SUNMRMST_ALL.SNCODE = TRITON_ST_QNMST.QNSRCD
			AND
			TRITON_ST_SUNMRMST_ALL.SNBKG1 = 'ALL'
	LEFT JOIN
		TRITON_Stage.dbo.TRITON_ST_SUNMRMST TRITON_ST_SUNMRMST_NO_BASE
		ON
			TRITON_ST_SUNMRMST_NO_BASE.SNCODE = TRITON_ST_QNMST.QNSRCD
			AND
			TRITON_ST_SUNMRMST_NO_BASE.SNBKG1 = ''
	LEFT JOIN 
		TRITON_Stage.dbo.WEBLIBSSL_ST_CNMST WEBLIBSSL_ST_CNMST
		ON
			TRITON_ST_QNMST.QNNUMB = WEBLIBSSL_ST_CNMST.CNPACK
	LEFT JOIN 
		TRITON_Stage.dbo.TRITON_ST_LSMST TRITON_ST_LSMST
		ON
			TRITON_ST_LSMST.LSCODE  = TRITON_ST_QNMST.QNLSCD	
	LEFT JOIN 
		TRITON_ST_CNMST	
		ON 
			TRITON_ST_CNMST.CNNUMB = TRITON_ST_QNMST.QNNUMB
	LEFT JOIN 
		TRITON_ST_ZNMST
		ON 
			TRITON_ST_ZNMST.CNNUMB = TRITON_ST_QNMST.QNNUMB

	EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'TRTN','ST_FBKGQ'
GO
/****** Object:  StoredProcedure [dbo].[BUILD_ST_MARINE_FITN]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[BUILD_ST_MARINE_FITN]
AS

	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'TRTN','ST_FITN','BUILD_ST_MARINE_FITN'

	TRUNCATE TABLE ST_MARINE_FITN

	INSERT INTO 
		ST_MARINE_FITN
	SELECT 
		CAST(CAST(102 AS VARCHAR(3)) 
		+	CASE WHEN SUBSTRING(TRITON_ST_CIMST.CICNNB,1,1) IN ('0','1','2','3','4','5','6','7','8','9') 
				THEN
					RIGHT('0000000'+ CAST(TRITON_ST_CIMST.CICNNB AS VARCHAR(7)), 7) 
				ELSE
					CAST(ASCII(SUBSTRING(TRITON_ST_CIMST.CICNNB,1,1)) AS CHAR(2)) + SUBSTRING(TRITON_ST_CIMST.CICNNB,2,LEN(TRITON_ST_CIMST.CICNNB)) 
				END	
		AS BIGINT) AS i_Sk_Bkg,
		'REV' AS ItineraryLineType,
		102 AS SourceSysID,
		'TRITON' AS SystemName,
		'M' AS DivisionCode,
		NULL AS BrandCode,
		NULL AS Product,
		NULL AS BookingType,
		0 AS CompanyNo,
		RTRIM(LTRIM(TRITON_ST_CIMST.CICNNB)) AS BkgRef,
		RANK() OVER
			(
				PARTITION BY 
					TRITON_ST_CIMST.CICNNB
				ORDER BY 
					TRITON_ST_CIMST.CICNNB,
					TRITON_ST_CIMST.CINUMB
			)  AS ItinRef,
		CASE WHEN TRITON_ST_CIMST.CICLAS ='*' AND 
			(TRITON_ST_CIMST.CICANC <> ' ' OR (TRITON_ST_CIMST.CICANC =  ' ' AND TRITON_ST_CIMST.CIFAMT <>0.0)) THEN 8 
			ELSE 3 END 
		AS [Status],
		TRITON_ST_CIMST.CIQNTY AS Qty,
		TRITON_ST_CIMST.CIPERS AS NoPax,
		TRITON_ST_CIMST.CICNST AS ContractSvsStartDate,
		TRITON_ST_CIMST.CICNEN AS ContractSvsEndDate,
		TRITON_ST_CIMST.CIETDT AS EntryDate,
		TRITON_ST_CIMST.CICHDT AS SvsLastAmendDate,
		CASE 
			WHEN 
				TRITON_ST_CIMST.CICNST  = TRITON_ST_CIMST.CICNEN THEN 1 
			ELSE 
				DATEDIFF(d,CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(TRITON_ST_CIMST.CICNST),112)),
				CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(TRITON_ST_CIMST.CICNEN),112))) 
			END AS ContractDuration,
		CASE WHEN LEN(TRITON_ST_CIMST.CISTDT) = 8 THEN TRITON_Stage.dbo.fn_CheckDate(TRITON_ST_CIMST.CISTDT) ELSE 0 END AS ItemStartDate,
		CASE WHEN LEN(TRITON_ST_CIMST.CIENDT) = 8 THEN TRITON_Stage.dbo.fn_CheckDate(TRITON_ST_CIMST.CIENDT) ELSE 0 END AS ItemEndDate,
		CASE 
			WHEN 
				LEN(TRITON_ST_CIMST.CISTDT) = 8  AND LEN(TRITON_ST_CIMST.CIENDT) = 8
			THEN
				DATEDIFF(d,CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(TRITON_ST_CIMST.CISTDT),112)),
				CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(TRITON_ST_CIMST.CIENDT),112))) 
			ELSE
				0
			END AS ItemDuration,
		CASE 
			WHEN TRITON_ST_CIMST.CISTDT = 0 THEN 1
			WHEN LEN(TRITON_ST_CIMST.CISTDT) >2 THEN 1
			ELSE TRITON_ST_CIMST.CISTDT
		END AS ItemPerPerson,
		CASE
			WHEN TRITON_ST_CIMST.CIENDT = 0 THEN 1
			WHEN LEN(TRITON_ST_CIMST.CIENDT) >2 THEN 1
			ELSE TRITON_ST_CIMST.CIENDT
		END AS ItemPerDuration,
		TRITON_ST_CIMST.CIFAMT AS ItemAmountLocal,
		CASE 
			WHEN TRITON_ST_CIMST.CICLAS ='*' THEN 0
			WHEN TRITON_ST_CIMST.CICLAS ='B' THEN TRITON_ST_CIMST.CIFAMT * CASE WHEN LEN(TRITON_ST_CIMST.CIQNTY) = 5 THEN 1 ELSE TRITON_ST_CIMST.CIQNTY END
			WHEN TRITON_ST_CIMST.CICLAS ='E' THEN TRITON_ST_CIMST.CIFAMT *CASE WHEN LEN(TRITON_ST_CIMST.CIQNTY) = 5 THEN 1 ELSE TRITON_ST_CIMST.CIQNTY END * 
				CASE 
					WHEN LEN(TRITON_ST_CIMST.CISTDT) = 8  AND LEN(TRITON_ST_CIMST.CIENDT) = 8
			    THEN
					DATEDIFF(d,CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(TRITON_ST_CIMST.CISTDT),112)),
					CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(TRITON_ST_CIMST.CIENDT),112))) 
				ELSE
					0
				END
			  WHEN TRITON_ST_CIMST.CICLAS IN('P','C','K','I','T') THEN TRITON_ST_CIMST.CIFAMT * 	
				CASE 
					WHEN TRITON_ST_CIMST.CIENDT = 0 THEN 1
					WHEN LEN(TRITON_ST_CIMST.CIENDT) >2 THEN 1
					ELSE TRITON_ST_CIMST.CIENDT END 
				*
				CASE 
					WHEN TRITON_ST_CIMST.CISTDT = 0 THEN 1
					WHEN LEN(TRITON_ST_CIMST.CISTDT) >2 THEN 1
					ELSE TRITON_ST_CIMST.CISTDT END				
			 ELSE TRITON_ST_CIMST.CIFAMT * CASE WHEN LEN(TRITON_ST_CIMST.CIQNTY) = 5 THEN 1 ELSE TRITON_ST_CIMST.CIQNTY END * 
				CASE 
					WHEN TRITON_ST_CIMST.CICLAS IN ('A','B','D','E','F','G','J','L','M','N','Q','S','X','Z','*') THEN 1
					WHEN TRITON_ST_CIMST.CIENDT = 0 THEN 1
					WHEN LEN(TRITON_ST_CIMST.CIENDT) >2 THEN 1
					ELSE TRITON_ST_CIMST.CIENDT END 
				*
				CASE 
					WHEN TRITON_ST_CIMST.CICLAS IN ('A','B','D','E','F','G','J','L','M','N','Q','S','X','Z','*') THEN 1
					WHEN TRITON_ST_CIMST.CISTDT = 0 THEN 1
					WHEN LEN(TRITON_ST_CIMST.CISTDT) >2 THEN 1
					ELSE TRITON_ST_CIMST.CISTDT END
		END AS TotalAmountLocal,
		CASE 
			WHEN TRITON_ST_CIMST.CICLAS <>'*' THEN 0
			WHEN TRITON_ST_CIMST.CICANC ='B' THEN TRITON_ST_CIMST.CIFAMT * CASE WHEN LEN(TRITON_ST_CIMST.CIQNTY) = 5 THEN 1 ELSE TRITON_ST_CIMST.CIQNTY END
			WHEN TRITON_ST_CIMST.CICANC ='E' THEN TRITON_ST_CIMST.CIFAMT * CASE WHEN LEN(TRITON_ST_CIMST.CIQNTY) = 5 THEN 1 ELSE TRITON_ST_CIMST.CIQNTY END * 
				CASE 
					WHEN LEN(TRITON_ST_CIMST.CISTDT) = 8  AND LEN(TRITON_ST_CIMST.CIENDT) = 8
			    THEN
					DATEDIFF(d,CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(TRITON_ST_CIMST.CISTDT),112)),
					CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(TRITON_ST_CIMST.CIENDT),112))) 
				ELSE
					0
				END
			  WHEN TRITON_ST_CIMST.CICANC IN('P','C','K','I','T') THEN TRITON_ST_CIMST.CIFAMT * 	
				CASE 
					WHEN TRITON_ST_CIMST.CIENDT = 0 THEN 1
					WHEN LEN(TRITON_ST_CIMST.CIENDT) >2 THEN 1
					ELSE TRITON_ST_CIMST.CIENDT END 
				*
				CASE 
					WHEN TRITON_ST_CIMST.CISTDT = 0 THEN 1
					WHEN LEN(TRITON_ST_CIMST.CISTDT) >2 THEN 1
					ELSE TRITON_ST_CIMST.CISTDT END	
			 ELSE TRITON_ST_CIMST.CIFAMT * CASE WHEN LEN(TRITON_ST_CIMST.CIQNTY) = 5 THEN 1 ELSE TRITON_ST_CIMST.CIQNTY END * 
				CASE 
					WHEN TRITON_ST_CIMST.CICANC IN ('A','B','D','E','F','G','J','L','M','N','Q','S','X','Z','*') THEN 1
					WHEN TRITON_ST_CIMST.CIENDT = 0 THEN 1
					WHEN LEN(TRITON_ST_CIMST.CIENDT) >2 THEN 1
					ELSE TRITON_ST_CIMST.CIENDT END 
				*
				CASE 
					WHEN TRITON_ST_CIMST.CICANC IN ('A','B','D','E','F','G','J','L','M','N','Q','S','X','Z','*') THEN 1
					WHEN TRITON_ST_CIMST.CISTDT = 0 THEN 1
					WHEN LEN(TRITON_ST_CIMST.CISTDT) >2 THEN 1
					ELSE TRITON_ST_CIMST.CISTDT END
		END AS TotalAmountLocalForCancel,
		TRITON_ST_CIMST.CIDISC AS Discount,
		TRITON_ST_CIMST.CIFDSC AS DiscountLocal,
		TRITON_ST_CIMST.CIFVAT AS VatLocal,
		TRITON_ST_CIMST.CITAPR AS TApercent,
		TRITON_ST_CIMST.CIFCOM AS CommissionLocal,
		CASE WHEN TRITON_ST_CIMST.CICLAS ='F' THEN (TRITON_ST_CIMST.CIFAMT * dbo.fn_GetTritonTaxPC(CIETDT,CISTDT,CICLAS,CISCLS,CILOCT)) ELSE 0 END AS TaxLocal,
		ISNULL(TRITON_ST_CIMST.CIFAMT * 
			CASE WHEN TRITON_ST_CIMST.CICLAS ='Q' AND TRITON_ST_CIMST.CISCLS ='A' THEN CASE WHEN CISTDT = 0 THEN dbo.fn_GetTritonTipPC(CICNEN,CICNST,'A','',CILOCT)END 
			ELSE dbo.fn_GetTritonTipPC(CIETDT,CISTDT,CICLAS,CISCLS,CILOCT) END
			+ CASE WHEN TRITON_ST_CIMST.CICLAS ='A' OR (TRITON_ST_CIMST.CICLAS ='Q' AND TRITON_ST_CIMST.CISCLS ='A' ) THEN TRITON_ST_CIMST.CIFAMT * TRITON_ST_BLMST.BLATPC ELSE 0 END,0) AS TipLocal,
		0 AS TotalAmountTaxTipsLocal,
		RTRIM(LTRIM(TRITON_ST_CIMST.CIUSER)) AS LastAmendUser,
		RTRIM(LTRIM(TRITON_ST_CIMST.CILOCT)) AS BaseLocation,
		RTRIM(LTRIM(TRITON_ST_CNMST.CNDESG)) AS Currency,
		ISNULL(RTRIM(LTRIM(SB_MARINE_CODE.a_code)),RTRIM(LTRIM(TRITON_ST_CIMST.CIOFID))) AS ExtraCode, 
		ISNULL(RTRIM(LTRIM(SB_MARINE_CODE.a_description)),RTRIM(LTRIM(TRITON_ST_CIMST.CIDESC))) AS ExtraCodeDesc, 
		RTRIM(LTRIM(TRITON_ST_CIMST.CIDESC)) AS ItemDesc,
		RTRIM(LTRIM(SB_MARINE_TYPE.a_RevenueTypeCode)) AS RevenueTypeCode,
		RTRIM(LTRIM(SB_MARINE_TYPE.a_RevenueType)) AS RevenueType,
		RTRIM(LTRIM(SB_MARINE_SUBTYPE.a_RevenueSubTypeCode)) AS RevenueSubTypeCode,
		RTRIM(LTRIM(SB_MARINE_SUBTYPE.a_RevenueSubType)) AS RevenueSubType,
		RTRIM(LTRIM(TRITON_ST_CIMST.CICLAS)) AS ClassCode,
		RTRIM(LTRIM(SB_MARINE_CLASS.a_Description)) AS Class,
		RTRIM(LTRIM(TRITON_ST_CIMST.CISCLS)) AS SubClassCode,
		RTRIM(LTRIM(SB_MARINE_SUBCLASS.a_SubClassDescription)) AS SubClass,
		RTRIM(LTRIM(TRITON_ST_CIMST.CICANC)) AS OriginalClassCode,
		RTRIM(LTRIM(SB_MARINE_ORCLASS.a_Description)) AS OriginalClass,  
		RTRIM(LTRIM(TRITON_ST_CIMST.CIEXTR)) AS ExtraNotes,
		NULL AS DepAirport,
		NULL AS ArrAirport,
		TRITON_ST_PTMST.PTCMNB AS GLCompany,
		TRITON_ST_PTMST.PTDPNB AS GLDepartment,
		TRITON_ST_PTMST.PTATNB AS GLAccount
	FROM  
		TRITON_ST_CIMST
	INNER JOIN 
		TRITON_ST_CNMST
		ON 
			TRITON_ST_CNMST.CNNUMB = TRITON_ST_CIMST.CICNNB
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_TYPE SB_MARINE_TYPE
		ON
			SB_MARINE_TYPE.a_RevenueTypeCode =  TRITON_ST_CIMST.CICLAS
			AND
			SB_MARINE_TYPE.a_SystemSourceID = 102
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_SUBTYPE SB_MARINE_SUBTYPE
		ON
			SB_MARINE_SUBTYPE.i_FK_RevenueTypeID = SB_MARINE_TYPE.i_SK_RevenueTypeID
			AND
			SB_MARINE_SUBTYPE.a_RevenueSubTypeCode = TRITON_ST_CIMST.CISCLS
			AND
			SB_MARINE_SUBTYPE.a_SystemSourceID = 102
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_CODE SB_MARINE_CODE
		ON
			SB_MARINE_CODE.a_code = TRITON_ST_CIMST.CIOFID
			AND
			SB_MARINE_CODE.a_SystemSourceID = 102
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_CLASS SB_MARINE_CLASS
		ON
			SB_MARINE_CLASS.a_Class = TRITON_ST_CIMST.CICLAS
			AND
			SB_MARINE_CLASS.a_SystemSourceID = 102
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_SUBCLASS SB_MARINE_SUBCLASS
		ON
			SB_MARINE_SUBCLASS.i_FK_ClassID = SB_MARINE_CLASS.i_SK_ClassID
			AND
			SB_MARINE_SUBCLASS.a_SubClass = TRITON_ST_CIMST.CISCLS
			AND
			SB_MARINE_SUBCLASS.a_SystemSourceID = 102
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_CLASS SB_MARINE_ORCLASS
		ON
			SB_MARINE_ORCLASS.a_Class = TRITON_ST_CIMST.CICANC
			AND
			SB_MARINE_ORCLASS.a_SystemSourceID = 102
	LEFT JOIN
		AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_START 
		ON
			CONF_DT_CALENDAR_START.i_SK_Calendar = TRITON_ST_CNMST.CNSTDT
	LEFT JOIN 
		TRITON_ST_BLMST
		ON
			TRITON_ST_CIMST.CILOCT = TRITON_ST_BLMST.BLLOCT 
	LEFT JOIN
		TRITON_ST_PTMST
		ON
			TRITON_ST_CIMST.CIOFID = TRITON_ST_PTMST.PTCDRF 
			AND
			TRITON_ST_CIMST.CILOCT = TRITON_ST_PTMST.PTLOCT
	WHERE 
		CONF_DT_CALENDAR_START.a_Year >= 2010
			
	

		
	INSERT INTO 
		ST_MARINE_FITN
	SELECT 
		CAST(CAST(102 AS VARCHAR(3)) 
		+	CASE WHEN SUBSTRING(TRITON_ST_ZIMST.CICNNB,1,1) IN ('0','1','2','3','4','5','6','7','8','9') 
				THEN
					RIGHT('0000000'+ CAST(TRITON_ST_ZIMST.CICNNB AS VARCHAR(7)), 7) 
				ELSE
					CAST(ASCII(SUBSTRING(TRITON_ST_ZIMST.CICNNB,1,1)) AS CHAR(2)) + SUBSTRING(TRITON_ST_ZIMST.CICNNB,2,LEN(TRITON_ST_ZIMST.CICNNB)) 
				END	
		AS BIGINT) AS i_Sk_Bkg,
		'REV' AS ItineraryLineType,
		102 AS SourceSysID,
		'TRITON' AS SystemName,
		'M' AS DivisionCode,
		NULL AS BrandCode,
		NULL AS Product,
		NULL AS BookingType,
		0 AS CompanyNo,
		RTRIM(LTRIM(TRITON_ST_ZIMST.CICNNB)) AS BkgRef,
		RANK() OVER
			(
				PARTITION BY 
					TRITON_ST_ZIMST.CICNNB
				ORDER BY 
					TRITON_ST_ZIMST.CICNNB,
					TRITON_ST_ZIMST.CINUMB
			)  AS ItinRef,
		CASE WHEN TRITON_ST_ZIMST.CICLAS ='*' AND 
			(TRITON_ST_ZIMST.CICANC <> ' ' OR (TRITON_ST_ZIMST.CICANC =  ' ' AND TRITON_ST_ZIMST.CIFAMT <>0.0)) THEN 8 
			ELSE 3 END 
		AS [Status],
		TRITON_ST_ZIMST.CIQNTY AS Qty,
		TRITON_ST_ZIMST.CIPERS AS NoPax,
		TRITON_ST_ZIMST.CICNST AS ContractSvsStartDate,
		TRITON_ST_ZIMST.CICNEN AS ContractSvsEndDate,
		TRITON_ST_ZIMST.CIETDT AS EntryDate,
		TRITON_ST_ZIMST.CICHDT AS SvsLastAmendDate,
		CASE 
			WHEN 
				TRITON_ST_ZIMST.CICNST  = TRITON_ST_ZIMST.CICNEN THEN 1 
			ELSE 
				DATEDIFF(d,CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(TRITON_ST_ZIMST.CICNST),112)),
				CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(TRITON_ST_ZIMST.CICNEN),112))) 
			END AS ContractDuration,
		CASE WHEN LEN(TRITON_ST_ZIMST.CISTDT) = 8 THEN TRITON_Stage.dbo.fn_CheckDate(TRITON_ST_ZIMST.CISTDT) ELSE 0 END AS ItemStartDate,
		CASE WHEN LEN(TRITON_ST_ZIMST.CIENDT) = 8 THEN TRITON_Stage.dbo.fn_CheckDate(TRITON_ST_ZIMST.CIENDT) ELSE 0 END AS ItemEndDate,
		CASE 
			WHEN 
				LEN(TRITON_ST_ZIMST.CISTDT) = 8  AND LEN(TRITON_ST_ZIMST.CIENDT) = 8
			THEN
				DATEDIFF(d,CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(TRITON_ST_ZIMST.CISTDT),112)),
				CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(TRITON_ST_ZIMST.CIENDT),112))) 
			ELSE
				0
			END AS ItemDuration,
		CASE 
			WHEN TRITON_ST_ZIMST.CISTDT = 0 THEN 1
			WHEN LEN(TRITON_ST_ZIMST.CISTDT) >2 THEN 1
			ELSE TRITON_ST_ZIMST.CISTDT
		END AS ItemPerPerson,
		CASE
			WHEN TRITON_ST_ZIMST.CIENDT = 0 THEN 1
			WHEN LEN(TRITON_ST_ZIMST.CIENDT) >2 THEN 1
			ELSE TRITON_ST_ZIMST.CIENDT
		END AS ItemPerDuration,
		TRITON_ST_ZIMST.CIFAMT AS ItemAmountLocal,
		CASE 
			WHEN TRITON_ST_ZIMST.CICLAS ='*' THEN 0
			WHEN TRITON_ST_ZIMST.CICLAS ='B' THEN TRITON_ST_ZIMST.CIFAMT * CASE WHEN LEN(TRITON_ST_ZIMST.CIQNTY) = 5 THEN 1 ELSE TRITON_ST_ZIMST.CIQNTY END
			WHEN TRITON_ST_ZIMST.CICLAS ='E' THEN TRITON_ST_ZIMST.CIFAMT * CASE WHEN LEN(TRITON_ST_ZIMST.CIQNTY) = 5 THEN 1 ELSE TRITON_ST_ZIMST.CIQNTY END * 
				CASE 
					WHEN LEN(TRITON_ST_ZIMST.CISTDT) = 8  AND LEN(TRITON_ST_ZIMST.CIENDT) = 8
			    THEN
					DATEDIFF(d,CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(TRITON_ST_ZIMST.CISTDT),112)),
					CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(TRITON_ST_ZIMST.CIENDT),112))) 
				ELSE
					0
				END
			 	WHEN TRITON_ST_ZIMST.CICLAS IN('P','C','K','I','T') THEN TRITON_ST_ZIMST.CIFAMT * 	
				CASE 
					WHEN TRITON_ST_ZIMST.CIENDT = 0 THEN 1
					WHEN LEN(TRITON_ST_ZIMST.CIENDT) >2 THEN 1
					ELSE TRITON_ST_ZIMST.CIENDT END 
				*
				CASE 
					WHEN TRITON_ST_ZIMST.CISTDT = 0 THEN 1
					WHEN LEN(TRITON_ST_ZIMST.CISTDT) >2 THEN 1
					ELSE TRITON_ST_ZIMST.CISTDT END	
			 ELSE TRITON_ST_ZIMST.CIFAMT * CASE WHEN LEN(TRITON_ST_ZIMST.CIQNTY) = 5 THEN 1 ELSE TRITON_ST_ZIMST.CIQNTY END * 
				CASE 
					WHEN TRITON_ST_ZIMST.CICLAS IN ('A','B','D','E','F','G','J','L','M','N','Q','S','X','Z','*') THEN 1
					WHEN TRITON_ST_ZIMST.CIENDT = 0 THEN 1
					WHEN LEN(TRITON_ST_ZIMST.CIENDT) >2 THEN 1
					ELSE TRITON_ST_ZIMST.CIENDT END 
				*
				CASE 
					WHEN TRITON_ST_ZIMST.CICLAS IN ('A','B','D','E','F','G','J','L','M','N','Q','S','X','Z','*') THEN 1
					WHEN TRITON_ST_ZIMST.CISTDT = 0 THEN 1
					WHEN LEN(TRITON_ST_ZIMST.CISTDT) >2 THEN 1
					ELSE TRITON_ST_ZIMST.CISTDT END
		END AS TotalAmountLocal,
		CASE 
			WHEN TRITON_ST_ZIMST.CICLAS <>'*' THEN 0
			WHEN TRITON_ST_ZIMST.CICANC ='B' THEN TRITON_ST_ZIMST.CIFAMT * CASE WHEN LEN(TRITON_ST_ZIMST.CIQNTY) = 5 THEN 1 ELSE TRITON_ST_ZIMST.CIQNTY END
			WHEN TRITON_ST_ZIMST.CICANC ='E' THEN TRITON_ST_ZIMST.CIFAMT * CASE WHEN LEN(TRITON_ST_ZIMST.CIQNTY) = 5 THEN 1 ELSE TRITON_ST_ZIMST.CIQNTY END * 
				CASE 
					WHEN LEN(TRITON_ST_ZIMST.CISTDT) = 8  AND LEN(TRITON_ST_ZIMST.CIENDT) = 8
			    THEN
					DATEDIFF(d,CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(TRITON_ST_ZIMST.CISTDT),112)),
					CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(TRITON_ST_ZIMST.CIENDT),112))) 
				ELSE
					0
				END
			 WHEN TRITON_ST_ZIMST.CICANC IN('P','C','K','I','T') THEN TRITON_ST_ZIMST.CIFAMT * 	
				CASE 
					WHEN TRITON_ST_ZIMST.CIENDT = 0 THEN 1
					WHEN LEN(TRITON_ST_ZIMST.CIENDT) >2 THEN 1
					ELSE TRITON_ST_ZIMST.CIENDT END 
				*
				CASE 
					WHEN TRITON_ST_ZIMST.CISTDT = 0 THEN 1
					WHEN LEN(TRITON_ST_ZIMST.CISTDT) >2 THEN 1
					ELSE TRITON_ST_ZIMST.CISTDT END	
			 ELSE TRITON_ST_ZIMST.CIFAMT * CASE WHEN LEN(TRITON_ST_ZIMST.CIQNTY) = 5 THEN 1 ELSE TRITON_ST_ZIMST.CIQNTY END * 
				CASE 
					WHEN TRITON_ST_ZIMST.CICANC IN ('A','B','D','E','F','G','J','L','M','N','Q','S','X','Z','*') THEN 1
					WHEN TRITON_ST_ZIMST.CIENDT = 0 THEN 1
					WHEN LEN(TRITON_ST_ZIMST.CIENDT) >2 THEN 1
					ELSE TRITON_ST_ZIMST.CIENDT END 
				*
				CASE 
					WHEN TRITON_ST_ZIMST.CICANC IN ('A','B','D','E','F','G','J','L','M','N','Q','S','X','Z','*') THEN 1
					WHEN TRITON_ST_ZIMST.CISTDT = 0 THEN 1
					WHEN LEN(TRITON_ST_ZIMST.CISTDT) >2 THEN 1
					ELSE TRITON_ST_ZIMST.CISTDT END
		END AS TotalAmountLocalForCancel,
		TRITON_ST_ZIMST.CIDISC AS Discount,
		TRITON_ST_ZIMST.CIFDSC AS DiscountLocal,
		TRITON_ST_ZIMST.CIFVAT AS VatLocal,
		TRITON_ST_ZIMST.CITAPR AS TApercent,
		TRITON_ST_ZIMST.CIFCOM AS CommissionLocal,
		CASE WHEN TRITON_ST_ZIMST.CICLAS ='F' THEN TRITON_ST_ZIMST.CIFAMT * dbo.fn_GetTritonTaxPC(TRITON_ST_ZIMST.CIETDT,TRITON_ST_ZIMST.CISTDT,TRITON_ST_ZIMST.CICLAS,TRITON_ST_ZIMST.CISCLS,TRITON_ST_ZIMST.CILOCT) ELSE 0 END AS TaxLocal,
		ISNULL(TRITON_ST_ZIMST.CIFAMT * 
			CASE WHEN TRITON_ST_ZIMST.CICLAS ='Q' AND TRITON_ST_ZIMST.CISCLS ='A' THEN CASE WHEN TRITON_ST_ZIMST.CISTDT = 0 THEN dbo.fn_GetTritonTipPC(TRITON_ST_ZIMST.CICNEN,TRITON_ST_ZIMST.CICNST,'A','',TRITON_ST_ZIMST.CILOCT)END 
			ELSE dbo.fn_GetTritonTipPC(TRITON_ST_ZIMST.CIETDT,TRITON_ST_ZIMST.CISTDT,TRITON_ST_ZIMST.CICLAS,TRITON_ST_ZIMST.CISCLS,TRITON_ST_ZIMST.CILOCT) END 
			+ CASE WHEN TRITON_ST_ZIMST.CICLAS ='A' OR (TRITON_ST_ZIMST.CICLAS ='Q' AND TRITON_ST_ZIMST.CISCLS ='A' ) THEN  TRITON_ST_ZIMST.CIFAMT * TRITON_ST_BLMST.BLATPC ELSE 0 END,0) AS TipLocal,
		0 AS TotalAmountTaxTipsLocal,
		RTRIM(LTRIM(TRITON_ST_ZIMST.CIUSER)) AS LastAmendUser,
		RTRIM(LTRIM(TRITON_ST_ZIMST.CILOCT)) AS BaseLocation,
		RTRIM(LTRIM(TRITON_ST_ZNMST.CNDESG)) AS Currency,
		ISNULL(RTRIM(LTRIM(SB_MARINE_CODE.a_code)),RTRIM(LTRIM(TRITON_ST_ZIMST.CIOFID))) AS ExtraCode, 
		ISNULL(RTRIM(LTRIM(SB_MARINE_CODE.a_description)),RTRIM(LTRIM(TRITON_ST_ZIMST.CIDESC))) AS ExtraCodeDesc, 
		RTRIM(LTRIM(TRITON_ST_ZIMST.CIDESC)) AS ItemDesc,
		RTRIM(LTRIM(SB_MARINE_TYPE.a_RevenueTypeCode)) AS RevenueTypeCode,
		RTRIM(LTRIM(SB_MARINE_TYPE.a_RevenueType)) AS RevenueType,
		RTRIM(LTRIM(SB_MARINE_SUBTYPE.a_RevenueSubTypeCode)) AS RevenueSubTypeCode,
		RTRIM(LTRIM(SB_MARINE_SUBTYPE.a_RevenueSubType)) AS RevenueSubType,
		RTRIM(LTRIM(TRITON_ST_ZIMST.CICLAS)) AS ClassCode,
		RTRIM(LTRIM(SB_MARINE_CLASS.a_Description)) AS Class,
		RTRIM(LTRIM(TRITON_ST_ZIMST.CISCLS)) AS SubClassCode,
		RTRIM(LTRIM(SB_MARINE_SUBCLASS.a_SubClassDescription)) AS SubClass,
		RTRIM(LTRIM(TRITON_ST_ZIMST.CICANC)) AS OriginalClassCode,
		RTRIM(LTRIM(SB_MARINE_ORCLASS.a_Description)) AS OriginalClass,  
		RTRIM(LTRIM(TRITON_ST_ZIMST.CIEXTR)) AS ExtraNotes,
		NULL AS DepAirport,
		NULL AS ArrAirport,
		TRITON_ST_PTMST.PTCMNB AS GLCompany,
		TRITON_ST_PTMST.PTDPNB AS GLDepartment,
		TRITON_ST_PTMST.PTATNB AS GLAccount
	FROM 
		TRITON_ST_ZIMST
	LEFT JOIN 
		TRITON_ST_CIMST
		ON 
			TRITON_ST_CIMST.CICNNB = TRITON_ST_ZIMST.CICNNB
			AND
			TRITON_ST_CIMST.CINUMB = TRITON_ST_ZIMST.CINUMB
	INNER JOIN 
		TRITON_ST_ZNMST
		ON 
			TRITON_ST_ZNMST.CNNUMB = TRITON_ST_ZIMST.CICNNB
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_TYPE SB_MARINE_TYPE
		ON
			SB_MARINE_TYPE.a_RevenueTypeCode =  TRITON_ST_ZIMST.CICLAS
			AND
			SB_MARINE_TYPE.a_SystemSourceID = 102
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_SUBTYPE SB_MARINE_SUBTYPE
		ON
			SB_MARINE_SUBTYPE.i_FK_RevenueTypeID = SB_MARINE_TYPE.i_SK_RevenueTypeID
			AND
			SB_MARINE_SUBTYPE.a_RevenueSubTypeCode = TRITON_ST_ZIMST.CISCLS
			AND
			SB_MARINE_SUBTYPE.a_SystemSourceID = 102
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_CODE SB_MARINE_CODE
		ON
			SB_MARINE_CODE.a_code = TRITON_ST_ZIMST.CIOFID
			AND
			SB_MARINE_CODE.a_SystemSourceID = 102
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_CLASS SB_MARINE_CLASS
		ON
			SB_MARINE_CLASS.a_Class = TRITON_ST_ZIMST.CICLAS
			AND
			SB_MARINE_CLASS.a_SystemSourceID = 102
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_SUBCLASS SB_MARINE_SUBCLASS
		ON
			SB_MARINE_SUBCLASS.i_FK_ClassID = SB_MARINE_CLASS.i_SK_ClassID
			AND
			SB_MARINE_SUBCLASS.a_SubClass = TRITON_ST_ZIMST.CISCLS
			AND
			SB_MARINE_SUBCLASS.a_SystemSourceID = 102
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_CLASS SB_MARINE_ORCLASS
		ON
			SB_MARINE_ORCLASS.a_Class = TRITON_ST_ZIMST.CICANC
			AND
			SB_MARINE_ORCLASS.a_SystemSourceID = 102
	LEFT JOIN
		AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_START 
		ON
			CONF_DT_CALENDAR_START.i_SK_Calendar = TRITON_ST_ZNMST.CNSTDT
	LEFT JOIN 
		TRITON_ST_BLMST
		ON
			TRITON_ST_ZIMST.CILOCT = TRITON_ST_BLMST.BLLOCT
	LEFT JOIN
		TRITON_ST_PTMST
		ON
			TRITON_ST_ZIMST.CIOFID = TRITON_ST_PTMST.PTCDRF 
			AND
			TRITON_ST_ZIMST.CILOCT = TRITON_ST_PTMST.PTLOCT
	WHERE 
		TRITON_ST_CIMST.CICNNB IS NULL
		AND
		CONF_DT_CALENDAR_START.a_Year >= 2010
		
		
	INSERT INTO 
		ST_MARINE_FITN
	SELECT 
		CAST(CAST(101 AS VARCHAR(3)) 
		+	CASE WHEN SUBSTRING(SUNSAIL_ST_CIMST.CICNNB,1,1) IN ('0','1','2','3','4','5','6','7','8','9') 
				THEN
					RIGHT('0000000'+ CAST(SUNSAIL_ST_CIMST.CICNNB AS VARCHAR(7)), 7) 
				ELSE
					CAST(ASCII(SUBSTRING(SUNSAIL_ST_CIMST.CICNNB,1,1)) AS CHAR(2)) + SUBSTRING(SUNSAIL_ST_CIMST.CICNNB,2,LEN(SUNSAIL_ST_CIMST.CICNNB)) 
				END	
		AS BIGINT) AS i_Sk_Bkg,
		'REV' AS ItineraryLineType,
		101 AS SourceSysID,
		'SUNSAIL' AS SystemName,
		'M' AS DivisionCode,
		NULL AS BrandCode,
		NULL AS Product,
		NULL AS BookingType,
		1 AS CompanyNo,
		RTRIM(LTRIM(SUNSAIL_ST_CIMST.CICNNB)) AS BkgRef,
		RANK() OVER
			(
				PARTITION BY 
					SUNSAIL_ST_CIMST.CICNNB
				ORDER BY 
					SUNSAIL_ST_CIMST.CICNNB,
					SUNSAIL_ST_CIMST.CINUMB
			)  AS ItinRef,
		CASE WHEN SUNSAIL_ST_CIMST.CICLAS ='*' AND 
			(SUNSAIL_ST_CIMST.CICANC <> ' ' OR (SUNSAIL_ST_CIMST.CICANC =  ' ' AND SUNSAIL_ST_CIMST.CIFAMT <>0.0)) THEN 8 
			ELSE 3 END 
		AS [Status],
		SUNSAIL_ST_CIMST.CIQNTY AS Qty,
		SUNSAIL_ST_CIMST.CIPERS AS NoPax,
		SUNSAIL_ST_CIMST.CICNST AS ContractSvsStartDate,
		SUNSAIL_ST_CIMST.CICNEN AS ContractSvsEndDate,
		SUNSAIL_ST_CIMST.CIETDT AS EntryDate,
		SUNSAIL_ST_CIMST.CICHDT AS SvsLastAmendDate,
		CASE 
			WHEN 
				SUNSAIL_ST_CIMST.CICNST  = SUNSAIL_ST_CIMST.CICNEN THEN 1 
			ELSE 
				DATEDIFF(d,CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_CIMST.CICNST),112)),
				CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_CIMST.CICNEN),112))) 
			END AS ContractDuration,
		CASE WHEN LEN(SUNSAIL_ST_CIMST.CISTDT) = 8 THEN TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_CIMST.CISTDT) ELSE 0 END AS ItemStartDate,
		CASE WHEN LEN(SUNSAIL_ST_CIMST.CIENDT) = 8 THEN TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_CIMST.CIENDT) ELSE 0 END AS ItemEndDate,
		CASE 
			WHEN 
				LEN(SUNSAIL_ST_CIMST.CISTDT) = 8  AND LEN(SUNSAIL_ST_CIMST.CIENDT) = 8
			THEN
				DATEDIFF(d,CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_CIMST.CISTDT),112)),
				CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_CIMST.CIENDT),112))) 
			ELSE
				0
			END AS ItemDuration,
		CASE 
			WHEN SUNSAIL_ST_CIMST.CISTDT = 0 THEN 1
			WHEN LEN(SUNSAIL_ST_CIMST.CISTDT) >2 THEN 1
			ELSE SUNSAIL_ST_CIMST.CISTDT
		END AS ItemPerPerson,
		CASE
			WHEN SUNSAIL_ST_CIMST.CIENDT = 0 THEN 1
			WHEN LEN(SUNSAIL_ST_CIMST.CIENDT) >2 THEN 1
			ELSE SUNSAIL_ST_CIMST.CIENDT
		END AS ItemPerDuration,
		SUNSAIL_ST_CIMST.CIFAMT AS ItemAmountLocal,
		CASE 
			WHEN SUNSAIL_ST_CIMST.CICLAS ='*' THEN 0
			WHEN SUNSAIL_ST_CIMST.CICLAS ='B' THEN SUNSAIL_ST_CIMST.CIFAMT * CASE WHEN LEN(SUNSAIL_ST_CIMST.CIQNTY) = 5 THEN 1 ELSE SUNSAIL_ST_CIMST.CIQNTY END
			WHEN SUNSAIL_ST_CIMST.CICLAS ='E' THEN SUNSAIL_ST_CIMST.CIFAMT * CASE WHEN LEN(SUNSAIL_ST_CIMST.CIQNTY) = 5 THEN 1 ELSE SUNSAIL_ST_CIMST.CIQNTY END * 
				CASE 
					WHEN LEN(SUNSAIL_ST_CIMST.CISTDT) = 8  AND LEN(SUNSAIL_ST_CIMST.CIENDT) = 8
			    THEN
					DATEDIFF(d,CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_CIMST.CISTDT),112)),
					CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_CIMST.CIENDT),112))) 
				ELSE
					0
				END
			 	WHEN SUNSAIL_ST_CIMST.CICLAS IN('P','C','K','I','T') THEN SUNSAIL_ST_CIMST.CIFAMT * 	
				CASE 
					WHEN SUNSAIL_ST_CIMST.CIENDT = 0 THEN 1
					WHEN LEN(SUNSAIL_ST_CIMST.CIENDT) >2 THEN 1
					ELSE SUNSAIL_ST_CIMST.CIENDT END 
				*
				CASE 
					WHEN SUNSAIL_ST_CIMST.CISTDT = 0 THEN 1
					WHEN LEN(SUNSAIL_ST_CIMST.CISTDT) >2 THEN 1
					ELSE SUNSAIL_ST_CIMST.CISTDT END
			 ELSE SUNSAIL_ST_CIMST.CIFAMT * CASE WHEN LEN(SUNSAIL_ST_CIMST.CIQNTY) = 5 THEN 1 ELSE SUNSAIL_ST_CIMST.CIQNTY END * 
				CASE 
					WHEN SUNSAIL_ST_CIMST.CICLAS IN ('A','B','D','E','F','G','J','L','M','N','Q','S','X','Z','*') THEN 1
					WHEN SUNSAIL_ST_CIMST.CIENDT = 0 THEN 1
					WHEN LEN(SUNSAIL_ST_CIMST.CIENDT) >2 THEN 1
					ELSE SUNSAIL_ST_CIMST.CIENDT END 
				*
				CASE 
					WHEN SUNSAIL_ST_CIMST.CICLAS IN ('A','B','D','E','F','G','J','L','M','N','Q','S','X','Z','*') THEN 1
					WHEN SUNSAIL_ST_CIMST.CISTDT = 0 THEN 1
					WHEN LEN(SUNSAIL_ST_CIMST.CISTDT) >2 THEN 1
					ELSE SUNSAIL_ST_CIMST.CISTDT END
		END AS TotalAmountLocal,
		CASE 
			WHEN SUNSAIL_ST_CIMST.CICLAS <>'*' THEN 0
			WHEN SUNSAIL_ST_CIMST.CICANC ='B' THEN SUNSAIL_ST_CIMST.CIFAMT * CASE WHEN LEN(SUNSAIL_ST_CIMST.CIQNTY) = 5 THEN 1 ELSE SUNSAIL_ST_CIMST.CIQNTY END
			WHEN SUNSAIL_ST_CIMST.CICANC ='E' THEN SUNSAIL_ST_CIMST.CIFAMT * CASE WHEN LEN(SUNSAIL_ST_CIMST.CIQNTY) = 5 THEN 1 ELSE SUNSAIL_ST_CIMST.CIQNTY END * 
				CASE 
					WHEN LEN(SUNSAIL_ST_CIMST.CISTDT) = 8  AND LEN(SUNSAIL_ST_CIMST.CIENDT) = 8
			    THEN
					DATEDIFF(d,CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_CIMST.CISTDT),112)),
					CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_CIMST.CIENDT),112))) 
				ELSE
					0
				END
			  WHEN SUNSAIL_ST_CIMST.CICANC IN('P','C','K','I','T') THEN SUNSAIL_ST_CIMST.CIFAMT * 	
				CASE 
					WHEN SUNSAIL_ST_CIMST.CIENDT = 0 THEN 1
					WHEN LEN(SUNSAIL_ST_CIMST.CIENDT) >2 THEN 1
					ELSE SUNSAIL_ST_CIMST.CIENDT END 
				*
				CASE 
					WHEN SUNSAIL_ST_CIMST.CISTDT = 0 THEN 1
					WHEN LEN(SUNSAIL_ST_CIMST.CISTDT) >2 THEN 1
					ELSE SUNSAIL_ST_CIMST.CISTDT END
			 ELSE SUNSAIL_ST_CIMST.CIFAMT * CASE WHEN LEN(SUNSAIL_ST_CIMST.CIQNTY) = 5 THEN 1 ELSE SUNSAIL_ST_CIMST.CIQNTY END * 
				CASE 
					WHEN SUNSAIL_ST_CIMST.CICANC IN ('A','B','D','E','F','G','J','L','M','N','Q','S','X','Z','*') THEN 1
					WHEN SUNSAIL_ST_CIMST.CIENDT = 0 THEN 1
					WHEN LEN(SUNSAIL_ST_CIMST.CIENDT) >2 THEN 1
					ELSE SUNSAIL_ST_CIMST.CIENDT END 
				*
				CASE 
					WHEN SUNSAIL_ST_CIMST.CICANC IN ('A','B','D','E','F','G','J','L','M','N','Q','S','X','Z','*') THEN 1
					WHEN SUNSAIL_ST_CIMST.CISTDT = 0 THEN 1
					WHEN LEN(SUNSAIL_ST_CIMST.CISTDT) >2 THEN 1
					ELSE SUNSAIL_ST_CIMST.CISTDT END
		END AS TotalAmountLocalForCancel,
		SUNSAIL_ST_CIMST.CIDISC AS Discount,
		SUNSAIL_ST_CIMST.CIFDSC AS DiscountLocal,
		SUNSAIL_ST_CIMST.CIFVAT AS VatLocal,
		SUNSAIL_ST_CIMST.CITAPR AS TApercent,
		SUNSAIL_ST_CIMST.CIFCOM AS CommissionLocal,
		CASE WHEN SUNSAIL_ST_CIMST.CICLAS ='F' THEN  SUNSAIL_ST_CIMST.CIFAMT * dbo.fn_GetSunsailTaxPC(CIETDT,CISTDT,CICLAS,CISCLS,CILOCT) ELSE 0 END AS TaxLocal,
		ISNULL(SUNSAIL_ST_CIMST.CIFAMT * 
			CASE WHEN SUNSAIL_ST_CIMST.CICLAS ='Q' AND SUNSAIL_ST_CIMST.CISCLS ='A' THEN CASE WHEN CISTDT = 0 THEN dbo.fn_GetTritonTipPC(CICNEN,CICNST,'A','',CILOCT)END 
			ELSE dbo.fn_GetTritonTipPC(CIETDT,CISTDT,CICLAS,CISCLS,CILOCT) END 
			+ CASE WHEN SUNSAIL_ST_CIMST.CICLAS ='A' OR (SUNSAIL_ST_CIMST.CICLAS ='Q' AND SUNSAIL_ST_CIMST.CISCLS ='A' ) THEN  SUNSAIL_ST_CIMST.CIFAMT * SUNSAIL_ST_BLMST.BLATPC ELSE 0 END,0) AS TipLocal,
		0 AS TotalAmountTaxTipsLocal,
		RTRIM(LTRIM(SUNSAIL_ST_CIMST.CIUSER)) AS LastAmendUser,
		RTRIM(LTRIM(SUNSAIL_ST_CIMST.CILOCT)) AS BaseLocation,
		RTRIM(LTRIM(SUNSAIL_ST_CNMST.CNDESG)) AS Currency,
		ISNULL(RTRIM(LTRIM(SB_MARINE_CODE.a_code)),RTRIM(LTRIM(SUNSAIL_ST_CIMST.CIOFID))) AS ExtraCode, 
		ISNULL(RTRIM(LTRIM(SB_MARINE_CODE.a_description)),RTRIM(LTRIM(SUNSAIL_ST_CIMST.CIDESC))) AS ExtraCodeDesc, 
		RTRIM(LTRIM(SUNSAIL_ST_CIMST.CIDESC)) AS ItemDesc,
		RTRIM(LTRIM(SB_MARINE_TYPE.a_RevenueTypeCode)) AS RevenueTypeCode,
		RTRIM(LTRIM(SB_MARINE_TYPE.a_RevenueType)) AS RevenueType,
		RTRIM(LTRIM(SB_MARINE_SUBTYPE.a_RevenueSubTypeCode)) AS RevenueSubTypeCode,
		RTRIM(LTRIM(SB_MARINE_SUBTYPE.a_RevenueSubType)) AS RevenueSubType,
		RTRIM(LTRIM(SUNSAIL_ST_CIMST.CICLAS)) AS ClassCode,
		RTRIM(LTRIM(SB_MARINE_CLASS.a_Description)) AS Class,
		RTRIM(LTRIM(SUNSAIL_ST_CIMST.CISCLS)) AS SubClassCode,
		RTRIM(LTRIM(SB_MARINE_SUBCLASS.a_SubClassDescription)) AS SubClass,
		RTRIM(LTRIM(SUNSAIL_ST_CIMST.CICANC)) AS OriginalClassCode,
		RTRIM(LTRIM(SB_MARINE_ORCLASS.a_Description)) AS OriginalClass,  
		RTRIM(LTRIM(SUNSAIL_ST_CIMST.CIEXTR)) AS ExtraNotes,
		NULL AS DepAirport,
		NULL AS ArrAirport,
		SUNSAIL_ST_PTMST.PTCMNB AS GLCompany,
		SUNSAIL_ST_PTMST.PTDPNB AS GLDepartment,
		SUNSAIL_ST_PTMST.PTATNB AS GLAccount
	FROM 
		SUNSAIL_ST_CIMST
	INNER JOIN 
		SUNSAIL_ST_CNMST
		ON 
			SUNSAIL_ST_CNMST.CNNUMB = SUNSAIL_ST_CIMST.CICNNB
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_TYPE SB_MARINE_TYPE
		ON
			SB_MARINE_TYPE.a_RevenueTypeCode =  SUNSAIL_ST_CIMST.CICLAS
			AND
			SB_MARINE_TYPE.a_SystemSourceID = 101
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_SUBTYPE SB_MARINE_SUBTYPE
		ON
			SB_MARINE_SUBTYPE.i_FK_RevenueTypeID = SB_MARINE_TYPE.i_SK_RevenueTypeID
			AND
			SB_MARINE_SUBTYPE.a_RevenueSubTypeCode = SUNSAIL_ST_CIMST.CISCLS
			AND
			SB_MARINE_SUBTYPE.a_SystemSourceID = 101
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_CODE SB_MARINE_CODE
		ON
			SB_MARINE_CODE.a_code = SUNSAIL_ST_CIMST.CIOFID
			AND
			SB_MARINE_CODE.a_SystemSourceID = 101
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_CLASS SB_MARINE_CLASS
		ON
			SB_MARINE_CLASS.a_Class = SUNSAIL_ST_CIMST.CICLAS
			AND
			SB_MARINE_CLASS.a_SystemSourceID = 101
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_SUBCLASS SB_MARINE_SUBCLASS
		ON
			SB_MARINE_SUBCLASS.i_FK_ClassID = SB_MARINE_CLASS.i_SK_ClassID
			AND
			SB_MARINE_SUBCLASS.a_SubClass = SUNSAIL_ST_CIMST.CISCLS
			AND
			SB_MARINE_SUBCLASS.a_SystemSourceID = 101
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_CLASS SB_MARINE_ORCLASS
		ON
			SB_MARINE_ORCLASS.a_Class = SUNSAIL_ST_CIMST.CICANC
			AND
			SB_MARINE_ORCLASS.a_SystemSourceID = 101
	LEFT JOIN
		AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_START 
		ON
			CONF_DT_CALENDAR_START.i_SK_Calendar = SUNSAIL_ST_CNMST.CNSTDT
	LEFT JOIN 
		SUNSAIL_ST_BLMST
		ON
			SUNSAIL_ST_CIMST.CILOCT = SUNSAIL_ST_BLMST.BLLOCT
	LEFT JOIN
		SUNSAIL_ST_PTMST
		ON
			SUNSAIL_ST_CIMST.CIOFID = SUNSAIL_ST_PTMST.PTCDRF 
			AND
			SUNSAIL_ST_CIMST.CILOCT = SUNSAIL_ST_PTMST.PTLOCT
	WHERE 
		CONF_DT_CALENDAR_START.a_Year >= 2010


	INSERT INTO 
		ST_MARINE_FITN
	SELECT 
		CAST(CAST(101 AS VARCHAR(3)) 
		+	CASE WHEN SUBSTRING(SUNSAIL_ST_ZIMST.CICNNB,1,1) IN ('0','1','2','3','4','5','6','7','8','9') 
				THEN
					RIGHT('0000000'+ CAST(SUNSAIL_ST_ZIMST.CICNNB AS VARCHAR(7)), 7) 
				ELSE
					CAST(ASCII(SUBSTRING(SUNSAIL_ST_ZIMST.CICNNB,1,1)) AS CHAR(2)) + SUBSTRING(SUNSAIL_ST_ZIMST.CICNNB,2,LEN(SUNSAIL_ST_ZIMST.CICNNB)) 
				END	
		AS BIGINT) AS i_Sk_Bkg,
		'REV' AS ItineraryLineType,
		101 AS SourceSysID,
		'SUNSAIL' AS SystemName,
		'M' AS DivisionCode,
		NULL AS BrandCode,
		NULL AS Product,
		NULL AS BookingType,
		1 AS CompanyNo,
		RTRIM(LTRIM(SUNSAIL_ST_ZIMST.CICNNB)) AS BkgRef,
		RANK() OVER
			(
				PARTITION BY 
					SUNSAIL_ST_ZIMST.CICNNB
				ORDER BY 
					SUNSAIL_ST_ZIMST.CICNNB,
					SUNSAIL_ST_ZIMST.CINUMB
			)  AS ItinRef,
		CASE WHEN SUNSAIL_ST_ZIMST.CICLAS ='*' AND 
			(SUNSAIL_ST_ZIMST.CICANC <> ' ' OR (SUNSAIL_ST_ZIMST.CICANC =  ' ' AND SUNSAIL_ST_ZIMST.CIFAMT <>0.0)) THEN 8 
			ELSE 3 END 
		AS [Status],
		SUNSAIL_ST_ZIMST.CIQNTY AS Qty,
		SUNSAIL_ST_ZIMST.CIPERS AS NoPax,
		SUNSAIL_ST_ZIMST.CICNST AS ContractSvsStartDate,
		SUNSAIL_ST_ZIMST.CICNEN AS ContractSvsEndDate,
		SUNSAIL_ST_ZIMST.CIETDT AS EntryDate,
		SUNSAIL_ST_ZIMST.CICHDT AS SvsLastAmendDate,
		CASE 
			WHEN 
				SUNSAIL_ST_ZIMST.CICNST  = SUNSAIL_ST_ZIMST.CICNEN THEN 1 
			ELSE 
				DATEDIFF(d,CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_ZIMST.CICNST),112)),
				CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_ZIMST.CICNEN),112))) 
			END AS ContractDuration,
		CASE WHEN LEN(SUNSAIL_ST_ZIMST.CISTDT) = 8 THEN TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_ZIMST.CISTDT) ELSE 0 END AS ItemStartDate,
		CASE WHEN LEN(SUNSAIL_ST_ZIMST.CIENDT) = 8 THEN TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_ZIMST.CIENDT) ELSE 0 END AS ItemEndDate,
		CASE 
			WHEN 
				LEN(SUNSAIL_ST_ZIMST.CISTDT) = 8  AND LEN(SUNSAIL_ST_ZIMST.CIENDT) = 8
			THEN
				DATEDIFF(d,CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_ZIMST.CISTDT),112)),
				CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_ZIMST.CIENDT),112))) 
			ELSE
				0
			END AS ItemDuration,
		CASE 
			WHEN SUNSAIL_ST_ZIMST.CISTDT = 0 THEN 1
			WHEN LEN(SUNSAIL_ST_ZIMST.CISTDT) >2 THEN 1
			ELSE SUNSAIL_ST_ZIMST.CISTDT
		END AS ItemPerPerson,
		CASE
			WHEN SUNSAIL_ST_ZIMST.CIENDT = 0 THEN 1
			WHEN LEN(SUNSAIL_ST_ZIMST.CIENDT) >2 THEN 1
			ELSE SUNSAIL_ST_ZIMST.CIENDT
		END AS ItemPerDuration,
		SUNSAIL_ST_ZIMST.CIFAMT AS ItemAmountLocal,
		CASE 
			WHEN SUNSAIL_ST_ZIMST.CICLAS ='*' THEN 0
			WHEN SUNSAIL_ST_ZIMST.CICLAS ='B' THEN SUNSAIL_ST_ZIMST.CIFAMT * CASE WHEN LEN(SUNSAIL_ST_ZIMST.CIQNTY) = 5 THEN 1 ELSE SUNSAIL_ST_ZIMST.CIQNTY END
			WHEN SUNSAIL_ST_ZIMST.CICLAS ='E' THEN SUNSAIL_ST_ZIMST.CIFAMT * CASE WHEN LEN(SUNSAIL_ST_ZIMST.CIQNTY) = 5 THEN 1 ELSE SUNSAIL_ST_ZIMST.CIQNTY END * 
				CASE 
					WHEN LEN(SUNSAIL_ST_ZIMST.CISTDT) = 8  AND LEN(SUNSAIL_ST_ZIMST.CIENDT) = 8
			    THEN
					DATEDIFF(d,CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_ZIMST.CISTDT),112)),
					CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_ZIMST.CIENDT),112))) 
				ELSE
					0
				END
			 	WHEN SUNSAIL_ST_ZIMST.CICLAS IN('P','C','K','I','T') THEN SUNSAIL_ST_ZIMST.CIFAMT * 	
				CASE 
					WHEN SUNSAIL_ST_ZIMST.CIENDT = 0 THEN 1
					WHEN LEN(SUNSAIL_ST_ZIMST.CIENDT) >2 THEN 1
					ELSE SUNSAIL_ST_ZIMST.CIENDT END 
				*
				CASE 
					WHEN SUNSAIL_ST_ZIMST.CISTDT = 0 THEN 1
					WHEN LEN(SUNSAIL_ST_ZIMST.CISTDT) >2 THEN 1
					ELSE SUNSAIL_ST_ZIMST.CISTDT END	
			 ELSE SUNSAIL_ST_ZIMST.CIFAMT * CASE WHEN LEN(SUNSAIL_ST_ZIMST.CIQNTY) = 5 THEN 1 ELSE SUNSAIL_ST_ZIMST.CIQNTY END * 
				CASE 
					WHEN SUNSAIL_ST_ZIMST.CICLAS IN ('A','B','D','E','F','G','J','L','M','N','Q','S','X','Z','*') THEN 1
					WHEN SUNSAIL_ST_ZIMST.CIENDT = 0 THEN 1
					WHEN LEN(SUNSAIL_ST_ZIMST.CIENDT) >2 THEN 1
					ELSE SUNSAIL_ST_ZIMST.CIENDT END 
				*
				CASE 
					WHEN SUNSAIL_ST_ZIMST.CICLAS IN ('A','B','D','E','F','G','J','L','M','N','Q','S','X','Z','*') THEN 1
					WHEN SUNSAIL_ST_ZIMST.CISTDT = 0 THEN 1
					WHEN LEN(SUNSAIL_ST_ZIMST.CISTDT) >2 THEN 1
					ELSE SUNSAIL_ST_ZIMST.CISTDT END
		END AS TotalAmountLocal,
		CASE 
			WHEN SUNSAIL_ST_ZIMST.CICLAS <>'*' THEN 0
			WHEN SUNSAIL_ST_ZIMST.CICANC ='B' THEN SUNSAIL_ST_ZIMST.CIFAMT * CASE WHEN LEN(SUNSAIL_ST_ZIMST.CIQNTY) = 5 THEN 1 ELSE SUNSAIL_ST_ZIMST.CIQNTY END
			WHEN SUNSAIL_ST_ZIMST.CICANC ='E' THEN SUNSAIL_ST_ZIMST.CIFAMT * CASE WHEN LEN(SUNSAIL_ST_ZIMST.CIQNTY) = 5 THEN 1 ELSE SUNSAIL_ST_ZIMST.CIQNTY END * 
				CASE 
					WHEN LEN(SUNSAIL_ST_ZIMST.CISTDT) = 8  AND LEN(SUNSAIL_ST_ZIMST.CIENDT) = 8
			    THEN
					DATEDIFF(d,CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_ZIMST.CISTDT),112)),
					CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_ZIMST.CIENDT),112))) 
				ELSE
					0
				END
			 WHEN SUNSAIL_ST_ZIMST.CICANC IN('P','C','K','I','T') THEN SUNSAIL_ST_ZIMST.CIFAMT * 	
				CASE 
					WHEN SUNSAIL_ST_ZIMST.CIENDT = 0 THEN 1
					WHEN LEN(SUNSAIL_ST_ZIMST.CIENDT) >2 THEN 1
					ELSE SUNSAIL_ST_ZIMST.CIENDT END 
				*
				CASE 
					WHEN SUNSAIL_ST_ZIMST.CISTDT = 0 THEN 1
					WHEN LEN(SUNSAIL_ST_ZIMST.CISTDT) >2 THEN 1
					ELSE SUNSAIL_ST_ZIMST.CISTDT END	
			 ELSE SUNSAIL_ST_ZIMST.CIFAMT * CASE WHEN LEN(SUNSAIL_ST_ZIMST.CIQNTY) = 5 THEN 1 ELSE SUNSAIL_ST_ZIMST.CIQNTY END * 
				CASE 
					WHEN SUNSAIL_ST_ZIMST.CICANC IN ('A','B','D','E','F','G','J','L','M','N','Q','S','X','Z','*') THEN 1
					WHEN SUNSAIL_ST_ZIMST.CIENDT = 0 THEN 1
					WHEN LEN(SUNSAIL_ST_ZIMST.CIENDT) >2 THEN 1
					ELSE SUNSAIL_ST_ZIMST.CIENDT END 
				*
				CASE 
					WHEN SUNSAIL_ST_ZIMST.CICANC IN ('A','B','D','E','F','G','J','L','M','N','Q','S','X','Z','*') THEN 1
					WHEN SUNSAIL_ST_ZIMST.CISTDT = 0 THEN 1
					WHEN LEN(SUNSAIL_ST_ZIMST.CISTDT) >2 THEN 1
					ELSE SUNSAIL_ST_ZIMST.CISTDT END
		END AS TotalAmountLocalForCancel,
		SUNSAIL_ST_ZIMST.CIDISC AS Discount,
		SUNSAIL_ST_ZIMST.CIFDSC AS DiscountLocal,
		SUNSAIL_ST_ZIMST.CIFVAT AS VatLocal,
		SUNSAIL_ST_ZIMST.CITAPR AS TApercent,
		SUNSAIL_ST_ZIMST.CIFCOM AS CommissionLocal,
		CASE WHEN SUNSAIL_ST_ZIMST.CICLAS ='F' THEN SUNSAIL_ST_ZIMST.CIFAMT * dbo.fn_GetSUNSAILTaxPC(SUNSAIL_ST_ZIMST.CIETDT,SUNSAIL_ST_ZIMST.CISTDT,SUNSAIL_ST_ZIMST.CICLAS,SUNSAIL_ST_ZIMST.CISCLS,SUNSAIL_ST_ZIMST.CILOCT) ELSE 0 END AS TaxLocal,
		ISNULL(SUNSAIL_ST_ZIMST.CIFAMT * 
			CASE WHEN SUNSAIL_ST_ZIMST.CICLAS ='Q' AND SUNSAIL_ST_ZIMST.CISCLS ='A' THEN CASE WHEN SUNSAIL_ST_ZIMST.CISTDT = 0 THEN dbo.fn_GetSUNSAILTipPC(SUNSAIL_ST_ZIMST.CICNEN,SUNSAIL_ST_ZIMST.CICNST,'A','',SUNSAIL_ST_ZIMST.CILOCT)END 
			ELSE dbo.fn_GetSUNSAILTipPC(SUNSAIL_ST_ZIMST.CIETDT,SUNSAIL_ST_ZIMST.CISTDT,SUNSAIL_ST_ZIMST.CICLAS,SUNSAIL_ST_ZIMST.CISCLS,SUNSAIL_ST_ZIMST.CILOCT) END 
			+ CASE WHEN SUNSAIL_ST_ZIMST.CICLAS ='A' OR (SUNSAIL_ST_ZIMST.CICLAS ='Q' AND SUNSAIL_ST_ZIMST.CISCLS ='A' ) THEN  SUNSAIL_ST_ZIMST.CIFAMT * SUNSAIL_ST_BLMST.BLATPC ELSE 0 END,0) AS TipLocal,
		0 AS TotalAmountTaxTipsLocal,
		RTRIM(LTRIM(SUNSAIL_ST_ZIMST.CIUSER)) AS LastAmendUser,
		RTRIM(LTRIM(SUNSAIL_ST_ZIMST.CILOCT)) AS BaseLocation,
		RTRIM(LTRIM(SUNSAIL_ST_ZNMST.CNDESG)) AS Currency,
		ISNULL(RTRIM(LTRIM(SB_MARINE_CODE.a_code)),RTRIM(LTRIM(SUNSAIL_ST_ZIMST.CIOFID))) AS ExtraCode, 
		ISNULL(RTRIM(LTRIM(SB_MARINE_CODE.a_description)),RTRIM(LTRIM(SUNSAIL_ST_ZIMST.CIDESC))) AS ExtraCodeDesc, 
		RTRIM(LTRIM(SUNSAIL_ST_ZIMST.CIDESC)) AS ItemDesc,
		RTRIM(LTRIM(SB_MARINE_TYPE.a_RevenueTypeCode)) AS RevenueTypeCode,
		RTRIM(LTRIM(SB_MARINE_TYPE.a_RevenueType)) AS RevenueType,
		RTRIM(LTRIM(SB_MARINE_SUBTYPE.a_RevenueSubTypeCode)) AS RevenueSubTypeCode,
		RTRIM(LTRIM(SB_MARINE_SUBTYPE.a_RevenueSubType)) AS RevenueSubType,
		RTRIM(LTRIM(SUNSAIL_ST_ZIMST.CICLAS)) AS ClassCode,
		RTRIM(LTRIM(SB_MARINE_CLASS.a_Description)) AS Class,
		RTRIM(LTRIM(SUNSAIL_ST_ZIMST.CISCLS)) AS SubClassCode,
		RTRIM(LTRIM(SB_MARINE_SUBCLASS.a_SubClassDescription)) AS SubClass,
		RTRIM(LTRIM(SUNSAIL_ST_ZIMST.CICANC)) AS OriginalClassCode,
		RTRIM(LTRIM(SB_MARINE_ORCLASS.a_Description)) AS OriginalClass,  
		RTRIM(LTRIM(SUNSAIL_ST_ZIMST.CIEXTR)) AS ExtraNotes,
		NULL AS DepAirport,
		NULL AS ArrAirport,
		SUNSAIL_ST_PTMST.PTCMNB AS GLCompany,
		SUNSAIL_ST_PTMST.PTDPNB AS GLDepartment,
		SUNSAIL_ST_PTMST.PTATNB AS GLAccount
	FROM 
		SUNSAIL_ST_ZIMST
	LEFT JOIN 
		SUNSAIL_ST_CIMST
		ON 
			SUNSAIL_ST_CIMST.CICNNB = SUNSAIL_ST_ZIMST.CICNNB
			AND
			SUNSAIL_ST_CIMST.CINUMB = SUNSAIL_ST_ZIMST.CINUMB
	INNER JOIN 
		SUNSAIL_ST_ZNMST
		ON 
			SUNSAIL_ST_ZNMST.CNNUMB = SUNSAIL_ST_ZIMST.CICNNB
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_TYPE SB_MARINE_TYPE
		ON
			SB_MARINE_TYPE.a_RevenueTypeCode =  SUNSAIL_ST_ZIMST.CICLAS
			AND
			SB_MARINE_TYPE.a_SystemSourceID = 101
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_SUBTYPE SB_MARINE_SUBTYPE
		ON
			SB_MARINE_SUBTYPE.i_FK_RevenueTypeID = SB_MARINE_TYPE.i_SK_RevenueTypeID
			AND
			SB_MARINE_SUBTYPE.a_RevenueSubTypeCode = SUNSAIL_ST_ZIMST.CISCLS
			AND
			SB_MARINE_SUBTYPE.a_SystemSourceID = 101
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_CODE SB_MARINE_CODE
		ON
			SB_MARINE_CODE.a_code = SUNSAIL_ST_ZIMST.CIOFID
			AND
			SB_MARINE_CODE.a_SystemSourceID = 101
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_CLASS SB_MARINE_CLASS
		ON
			SB_MARINE_CLASS.a_Class = SUNSAIL_ST_ZIMST.CICLAS
			AND
			SB_MARINE_CLASS.a_SystemSourceID = 101
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_SUBCLASS SB_MARINE_SUBCLASS
		ON
			SB_MARINE_SUBCLASS.i_FK_ClassID = SB_MARINE_CLASS.i_SK_ClassID
			AND
			SB_MARINE_SUBCLASS.a_SubClass = SUNSAIL_ST_ZIMST.CISCLS
			AND
			SB_MARINE_SUBCLASS.a_SystemSourceID = 101
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_CLASS SB_MARINE_ORCLASS
		ON
			SB_MARINE_ORCLASS.a_Class = SUNSAIL_ST_ZIMST.CICANC
			AND
			SB_MARINE_ORCLASS.a_SystemSourceID = 101
	LEFT JOIN
		AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_START 
		ON
			CONF_DT_CALENDAR_START.i_SK_Calendar = SUNSAIL_ST_ZNMST.CNSTDT
	LEFT JOIN 
		SUNSAIL_ST_BLMST
		ON
			SUNSAIL_ST_ZIMST.CILOCT = SUNSAIL_ST_BLMST.BLLOCT
	LEFT JOIN
		SUNSAIL_ST_PTMST
		ON
			SUNSAIL_ST_ZIMST.CIOFID = SUNSAIL_ST_PTMST.PTCDRF 
			AND
			SUNSAIL_ST_ZIMST.CILOCT = SUNSAIL_ST_PTMST.PTLOCT
	WHERE 
		SUNSAIL_ST_CIMST.CICNNB IS NULL
		AND
		CONF_DT_CALENDAR_START.a_Year >= 2010
		


	EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'TRTN','ST_FITN'




GO
/****** Object:  StoredProcedure [dbo].[BUILD_ST_MARINE_FITN_FLIGHT]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[BUILD_ST_MARINE_FITN_FLIGHT]
AS

	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'TRTN','FITN_FLT','BUILD_ST_MARINE_FITN_FLIGHT'

	DELETE FROM ST_MARINE_FITN WHERE ItineraryLineType = 'FLT'

	INSERT INTO 
		ST_MARINE_FITN
	SELECT 
		ST_MARINE_FBKG.i_SK_Bkg AS i_Sk_Bkg,
		'FLT' AS ItineraryLineType,
		101 AS SourceSysID,
		'NEPTUNE' AS SystemName,
		'M' AS DivisionCode,
		BrandCode AS BrandCode,
		ProductCode AS Product,
		BookingType AS BookingType,
		1 AS CompanyNo,
		BkgRef AS BkgRef,
		RANK() OVER 
			(
				PARTITION BY 
					SUNSAIL_ST_FLFLREF.RFNUMB
				ORDER BY 
					SUNSAIL_ST_FLFLREF.RFNUMB,
					SUNSAIL_ST_FLFLREF.RFFNBR
			) AS ItinRef,	
		BookingStatusID AS [Status],
		1 AS Qty,
		NULL AS NoPax,
		NULL AS ContractSvsStartDate,
		NULL AS ContractSvsEndDate,
		NULL AS EntryDate,
		NULL AS SvsLastAmendDate,
		NULL AS ContractDuration,
		FLDPDATE  AS ItemStartDate,
		FLARDATE AS ItemEndDate,
		DATEDIFF(d,CONF_DT_CALENDAR_DEP.a_Date,CONF_DT_CALENDAR_ARR.a_Date) AS ItemDuration,
		NULL AS ItemPerPerson,
		NULL AS ItemPerDuration,
		NULL AS ItemAmountLocal,
		NULL AS TotalAmountLocal,
		NULL AS TotalAmountLocalForCancel,
		NULL AS Discount,
		NULL AS DiscountLocal,
		NULL AS VatLocal,
		NULL AS TApercent,
		NULL AS CommissionLocal,
		NULL AS TaxLocal,
		NULL AS TipLocal,
		NULL AS TotalAmountTaxTipsLocal,
		NULL AS LastAmendUser,
		NULL AS BaseLocation,
		NULL AS Currency,
		LTRIM(RTRIM(SUNSAIL_ST_FLFLTMST.FLCARRIER))+LTRIM(RTRIM(SUNSAIL_ST_FLFLTMST.FLREF)) AS ExtraCode, 
		NULL AS ExtraCodeDesc, 
		NULL AS ItemDesc,
		NULL AS RevenueTypeCode,
		NULL AS RevenueType,
		NULL AS RevenueSubTypeCode,
		NULL AS RevenueSubType,
		NULL AS ClassCode,
		NULL AS Class,
		NULL AS SubClassCode,
		NULL AS SubClass,
		NULL AS OriginalClassCode,
		NULL AS OriginalClass,  
		NULL AS ExtraNotes,
		FLDPARPT AS DepAirport,
		FLARARPT AS ArrAirport,
		NULL AS GLCompany,
		NULL AS GLDepartment,
		NULL AS GLAccount
	FROM 
		TRITON_STAGE.dbo.ST_MARINE_FBKG  ST_MARINE_FBKG
	INNER JOIN 
		TRITON_STAGE.dbo.SUNSAIL_ST_FLFLREF SUNSAIL_ST_FLFLREF
		ON
			SUNSAIL_ST_FLFLREF.RFNUMB = ST_MARINE_FBKG.BkgRef
	LEFT JOIN
		TRITON_STAGE.dbo.SUNSAIL_ST_FLFLTMST SUNSAIL_ST_FLFLTMST
		ON
			SUNSAIL_ST_FLFLTMST.FLNUMBER = SUNSAIL_ST_FLFLREF.RFFNBR
	LEFT JOIN
		AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_DEP
		ON
			CONF_DT_CALENDAR_DEP.i_SK_Calendar = SUNSAIL_ST_FLFLTMST.FLDPDATE
	LEFT JOIN
		AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_ARR
		ON
			CONF_DT_CALENDAR_ARR.i_SK_Calendar = SUNSAIL_ST_FLFLTMST.FLARDATE
	LEFT JOIN
		(
	 
			SELECT 
				ST_MARINE_FBKG.i_SK_Bkg,
				SUNSAIL_ST_FLFLREF.RFFLRF	
			FROM
				TRITON_STAGE.dbo.ST_MARINE_FBKG  ST_MARINE_FBKG
			LEFT JOIN 
				TRITON_STAGE.dbo.SUNSAIL_ST_FLFLREF SUNSAIL_ST_FLFLREF
				ON
					SUNSAIL_ST_FLFLREF.RFNUMB = ST_MARINE_FBKG.BkgRef
			GROUP BY 
				ST_MARINE_FBKG.i_SK_Bkg,
				SUNSAIL_ST_FLFLREF.RFFLRF
			HAVING COUNT(*)>1
		)Duplication
	ON
		 ST_MARINE_FBKG.i_SK_Bkg = Duplication.i_SK_Bkg
		 AND
		 SUNSAIL_ST_FLFLREF.RFFLRF = Duplication.RFFLRF
	WHERE	
		Duplication.i_SK_Bkg IS NULL
	AND
		ST_MARINE_FBKG.SourceSysID = 101	
		
	INSERT INTO 
		ST_MARINE_FITN
	SELECT 
		ST_MARINE_FBKG.i_SK_Bkg AS i_Sk_Bkg,
		'FLT' AS ItineraryLineType,
		102 AS SourceSysID,
		'TRITON' AS SystemName,
		'M' AS DivisionCode,
		BrandCode AS BrandCode,
		ProductCode AS ProductCode,
		BookingType AS BookingType,
		0 AS CompanyNo,
		BkgRef AS BkgRef,
		RANK() OVER 
			(
				PARTITION BY 
					TRITON_ST_FLFLREF.RFNUMB
				ORDER BY 
					TRITON_ST_FLFLREF.RFNUMB,
					TRITON_ST_FLFLREF.RFFNBR
			) AS ItinRef,
		BookingStatusID AS [Status],
		1 AS Qty,
		NULL AS NoPax,
		NULL AS ContractSvsStartDate,
		NULL AS ContractSvsEndDate,
		NULL AS EntryDate,
		NULL AS SvsLastAmendDate,
		NULL AS ContractDuration,
		FLDPDATE  AS ItemStartDate,
		FLARDATE AS ItemEndDate,
		DATEDIFF(d,CONF_DT_CALENDAR_DEP.a_Date,CONF_DT_CALENDAR_ARR.a_Date) AS ItemDuration,
		NULL AS ItemPerPerson,
		NULL AS ItemPerDuration,
		NULL AS ItemAmountLocal,
		NULL AS TotalAmountLocal,
		NULL AS TotalAmountLocalForCancel,
		NULL AS Discount,
		NULL AS DiscountLocal,
		NULL AS VatLocal,
		NULL AS TApercent,
		NULL AS CommissionLocal,
		NULL AS TaxLocal,
		NULL AS TipLocal,
		NULL AS TotalAmountTaxTipsLocal,
		NULL AS LastAmendUser,
		NULL AS BaseLocation,
		NULL AS Currency,
		LTRIM(RTRIM(TRITON_ST_FLFLTMST.FLCARRIER))+LTRIM(RTRIM(TRITON_ST_FLFLTMST.FLREF)) AS ExtraCode, 
		NULL AS ExtraCodeDesc, 
		NULL AS ItemDesc,
		NULL AS RevenueTypeCode,
		NULL AS RevenueType,
		NULL AS RevenueSubTypeCode,
		NULL AS RevenueSubType,
		NULL AS ClassCode,
		NULL AS Class,
		NULL AS SubClassCode,
		NULL AS SubClass,
		NULL AS OriginalClassCode,
		NULL AS OriginalClass,  
		NULL AS ExtraNotes,	
		FLDPARPT AS DepAirport,
		FLARARPT AS ArrAirport,
		NULL AS GLCompany,
		NULL AS GLDepartment,
		NULL AS GLAccount
	FROM
		TRITON_STAGE.dbo.ST_MARINE_FBKG  ST_MARINE_FBKG
	INNER JOIN 
		TRITON_STAGE.dbo.TRITON_ST_FLFLREF TRITON_ST_FLFLREF
		ON
			TRITON_ST_FLFLREF.RFNUMB = ST_MARINE_FBKG.BkgRef
	LEFT JOIN
		TRITON_STAGE.dbo.TRITON_ST_FLFLTMST TRITON_ST_FLFLTMST
		ON
			TRITON_ST_FLFLTMST.FLNUMBER = TRITON_ST_FLFLREF.RFFNBR
	LEFT JOIN
		TRITON_STAGE.dbo.TRITON_ST_FLAIRLINE TRITON_ST_FLAIRLINE
		ON
			TRITON_ST_FLAIRLINE.ALCODE = TRITON_ST_FLFLTMST.FLCARRIER
	LEFT JOIN
		AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_DEP
		ON
			CONF_DT_CALENDAR_DEP.i_SK_Calendar = TRITON_ST_FLFLTMST.FLDPDATE
	LEFT JOIN
		AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_ARR
		ON
			CONF_DT_CALENDAR_ARR.i_SK_Calendar = TRITON_ST_FLFLTMST.FLARDATE
	WHERE 
		ST_MARINE_FBKG.SourceSysID = 102		
	

	EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'TRTN','FITN_FLT'




GO
/****** Object:  StoredProcedure [dbo].[BUILD_ST_MARINE_FITN_INTRADAY]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[BUILD_ST_MARINE_FITN_INTRADAY]
AS

	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'TRTN','INTR_FITN','BUILD_ST_MARINE_FITN_INTRADAY'

	TRUNCATE TABLE ST_MARINE_FITN_INTRADAY

	INSERT INTO 
		ST_MARINE_FITN_INTRADAY
	SELECT 
		CAST(CAST(102 AS VARCHAR(3)) 
		+	CASE WHEN SUBSTRING(TRITON_ST_CIMST_INTRADAY.CICNNB,1,1) IN ('0','1','2','3','4','5','6','7','8','9') 
				THEN
					RIGHT('0000000'+ CAST(TRITON_ST_CIMST_INTRADAY.CICNNB AS VARCHAR(7)), 7) 
				ELSE
					CAST(ASCII(SUBSTRING(TRITON_ST_CIMST_INTRADAY.CICNNB,1,1)) AS CHAR(2)) + SUBSTRING(TRITON_ST_CIMST_INTRADAY.CICNNB,2,LEN(TRITON_ST_CIMST_INTRADAY.CICNNB)) 
				END	
		AS BIGINT) AS i_Sk_Bkg,
		'REV' AS ItineraryLineType,
		102 AS SourceSysID,
		'TRITON' AS SystemName,
		'M' AS DivisionCode,
		NULL AS BrandCode,
		NULL AS Product,
		NULL AS BookingType,
		0 AS CompanyNo,
		RTRIM(LTRIM(TRITON_ST_CIMST_INTRADAY.CICNNB)) AS BkgRef,
		RANK() OVER
			(
				PARTITION BY 
					TRITON_ST_CIMST_INTRADAY.CICNNB
				ORDER BY 
					TRITON_ST_CIMST_INTRADAY.CICNNB,
					TRITON_ST_CIMST_INTRADAY.CINUMB
			)  AS ItinRef,
		CASE WHEN TRITON_ST_CIMST_INTRADAY.CICLAS ='*' AND 
			(TRITON_ST_CIMST_INTRADAY.CICANC <> ' ' OR (TRITON_ST_CIMST_INTRADAY.CICANC =  ' ' AND TRITON_ST_CIMST_INTRADAY.CIFAMT <>0.0)) THEN 8 
			ELSE 3 END 
		AS [Status],
		TRITON_ST_CIMST_INTRADAY.CIQNTY AS Qty,
		TRITON_ST_CIMST_INTRADAY.CIPERS AS NoPax,
		TRITON_ST_CIMST_INTRADAY.CICNST AS ContractSvsStartDate,
		TRITON_ST_CIMST_INTRADAY.CICNEN AS ContractSvsEndDate,
		TRITON_ST_CIMST_INTRADAY.CIETDT AS EntryDate,
		TRITON_ST_CIMST_INTRADAY.CICHDT AS SvsLastAmendDate,
		CASE 
			WHEN 
				TRITON_ST_CIMST_INTRADAY.CICNST  = TRITON_ST_CIMST_INTRADAY.CICNEN THEN 1 
			ELSE 
				DATEDIFF(d,CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(TRITON_ST_CIMST_INTRADAY.CICNST),112)),
				CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(TRITON_ST_CIMST_INTRADAY.CICNEN),112))) 
			END AS ContractDuration,
		CASE WHEN LEN(TRITON_ST_CIMST_INTRADAY.CISTDT) = 8 THEN TRITON_Stage.dbo.fn_CheckDate(TRITON_ST_CIMST_INTRADAY.CISTDT) ELSE 0 END AS ItemStartDate,
		CASE WHEN LEN(TRITON_ST_CIMST_INTRADAY.CIENDT) = 8 THEN TRITON_Stage.dbo.fn_CheckDate(TRITON_ST_CIMST_INTRADAY.CIENDT) ELSE 0 END AS ItemEndDate,
		CASE 
			WHEN 
				LEN(TRITON_ST_CIMST_INTRADAY.CISTDT) = 8  AND LEN(TRITON_ST_CIMST_INTRADAY.CIENDT) = 8
			THEN
				DATEDIFF(d,CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(TRITON_ST_CIMST_INTRADAY.CISTDT),112)),
				CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(TRITON_ST_CIMST_INTRADAY.CIENDT),112))) 
			ELSE
				0
			END AS ItemDuration,
		CASE 
			WHEN TRITON_ST_CIMST_INTRADAY.CISTDT = 0 THEN 1
			WHEN LEN(TRITON_ST_CIMST_INTRADAY.CISTDT) >2 THEN 1
			ELSE TRITON_ST_CIMST_INTRADAY.CISTDT
		END AS ItemPerPerson,
		CASE
			WHEN TRITON_ST_CIMST_INTRADAY.CIENDT = 0 THEN 1
			WHEN LEN(TRITON_ST_CIMST_INTRADAY.CIENDT) >2 THEN 1
			ELSE TRITON_ST_CIMST_INTRADAY.CIENDT
		END AS ItemPerDuration,
		TRITON_ST_CIMST_INTRADAY.CIFAMT AS ItemAmountLocal,
		CASE 
			WHEN TRITON_ST_CIMST_INTRADAY.CICLAS ='*' THEN 0
			WHEN TRITON_ST_CIMST_INTRADAY.CICLAS ='B' THEN TRITON_ST_CIMST_INTRADAY.CIFAMT * CASE WHEN LEN(TRITON_ST_CIMST_INTRADAY.CIQNTY) = 5 THEN 1 ELSE TRITON_ST_CIMST_INTRADAY.CIQNTY END
			WHEN TRITON_ST_CIMST_INTRADAY.CICLAS ='E' THEN TRITON_ST_CIMST_INTRADAY.CIFAMT *CASE WHEN LEN(TRITON_ST_CIMST_INTRADAY.CIQNTY) = 5 THEN 1 ELSE TRITON_ST_CIMST_INTRADAY.CIQNTY END * 
				CASE 
					WHEN LEN(TRITON_ST_CIMST_INTRADAY.CISTDT) = 8  AND LEN(TRITON_ST_CIMST_INTRADAY.CIENDT) = 8
			    THEN
					DATEDIFF(d,CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(TRITON_ST_CIMST_INTRADAY.CISTDT),112)),
					CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(TRITON_ST_CIMST_INTRADAY.CIENDT),112))) 
				ELSE
					0
				END
			  WHEN TRITON_ST_CIMST_INTRADAY.CICLAS IN('P','C','K','I','T') THEN TRITON_ST_CIMST_INTRADAY.CIFAMT * 	
				CASE 
					WHEN TRITON_ST_CIMST_INTRADAY.CIENDT = 0 THEN 1
					WHEN LEN(TRITON_ST_CIMST_INTRADAY.CIENDT) >2 THEN 1
					ELSE TRITON_ST_CIMST_INTRADAY.CIENDT END 
				*
				CASE 
					WHEN TRITON_ST_CIMST_INTRADAY.CISTDT = 0 THEN 1
					WHEN LEN(TRITON_ST_CIMST_INTRADAY.CISTDT) >2 THEN 1
					ELSE TRITON_ST_CIMST_INTRADAY.CISTDT END				
			 ELSE TRITON_ST_CIMST_INTRADAY.CIFAMT * CASE WHEN LEN(TRITON_ST_CIMST_INTRADAY.CIQNTY) = 5 THEN 1 ELSE TRITON_ST_CIMST_INTRADAY.CIQNTY END * 
				CASE 
					WHEN TRITON_ST_CIMST_INTRADAY.CICLAS IN ('A','B','D','E','F','G','J','L','M','N','Q','S','X','Z','*') THEN 1
					WHEN TRITON_ST_CIMST_INTRADAY.CIENDT = 0 THEN 1
					WHEN LEN(TRITON_ST_CIMST_INTRADAY.CIENDT) >2 THEN 1
					ELSE TRITON_ST_CIMST_INTRADAY.CIENDT END 
				*
				CASE 
					WHEN TRITON_ST_CIMST_INTRADAY.CICLAS IN ('A','B','D','E','F','G','J','L','M','N','Q','S','X','Z','*') THEN 1
					WHEN TRITON_ST_CIMST_INTRADAY.CISTDT = 0 THEN 1
					WHEN LEN(TRITON_ST_CIMST_INTRADAY.CISTDT) >2 THEN 1
					ELSE TRITON_ST_CIMST_INTRADAY.CISTDT END
		END AS TotalAmountLocal,
		CASE 
			WHEN TRITON_ST_CIMST_INTRADAY.CICLAS <>'*' THEN 0
			WHEN TRITON_ST_CIMST_INTRADAY.CICANC ='B' THEN TRITON_ST_CIMST_INTRADAY.CIFAMT * CASE WHEN LEN(TRITON_ST_CIMST_INTRADAY.CIQNTY) = 5 THEN 1 ELSE TRITON_ST_CIMST_INTRADAY.CIQNTY END
			WHEN TRITON_ST_CIMST_INTRADAY.CICANC ='E' THEN TRITON_ST_CIMST_INTRADAY.CIFAMT * CASE WHEN LEN(TRITON_ST_CIMST_INTRADAY.CIQNTY) = 5 THEN 1 ELSE TRITON_ST_CIMST_INTRADAY.CIQNTY END * 
				CASE 
					WHEN LEN(TRITON_ST_CIMST_INTRADAY.CISTDT) = 8  AND LEN(TRITON_ST_CIMST_INTRADAY.CIENDT) = 8
			    THEN
					DATEDIFF(d,CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(TRITON_ST_CIMST_INTRADAY.CISTDT),112)),
					CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(TRITON_ST_CIMST_INTRADAY.CIENDT),112))) 
				ELSE
					0
				END
			  WHEN TRITON_ST_CIMST_INTRADAY.CICANC IN('P','C','K','I','T') THEN TRITON_ST_CIMST_INTRADAY.CIFAMT * 	
				CASE 
					WHEN TRITON_ST_CIMST_INTRADAY.CIENDT = 0 THEN 1
					WHEN LEN(TRITON_ST_CIMST_INTRADAY.CIENDT) >2 THEN 1
					ELSE TRITON_ST_CIMST_INTRADAY.CIENDT END 
				*
				CASE 
					WHEN TRITON_ST_CIMST_INTRADAY.CISTDT = 0 THEN 1
					WHEN LEN(TRITON_ST_CIMST_INTRADAY.CISTDT) >2 THEN 1
					ELSE TRITON_ST_CIMST_INTRADAY.CISTDT END	
			 ELSE TRITON_ST_CIMST_INTRADAY.CIFAMT * CASE WHEN LEN(TRITON_ST_CIMST_INTRADAY.CIQNTY) = 5 THEN 1 ELSE TRITON_ST_CIMST_INTRADAY.CIQNTY END * 
				CASE 
					WHEN TRITON_ST_CIMST_INTRADAY.CICANC IN ('A','B','D','E','F','G','J','L','M','N','Q','S','X','Z','*') THEN 1
					WHEN TRITON_ST_CIMST_INTRADAY.CIENDT = 0 THEN 1
					WHEN LEN(TRITON_ST_CIMST_INTRADAY.CIENDT) >2 THEN 1
					ELSE TRITON_ST_CIMST_INTRADAY.CIENDT END 
				*
				CASE 
					WHEN TRITON_ST_CIMST_INTRADAY.CICANC IN ('A','B','D','E','F','G','J','L','M','N','Q','S','X','Z','*') THEN 1
					WHEN TRITON_ST_CIMST_INTRADAY.CISTDT = 0 THEN 1
					WHEN LEN(TRITON_ST_CIMST_INTRADAY.CISTDT) >2 THEN 1
					ELSE TRITON_ST_CIMST_INTRADAY.CISTDT END
		END AS TotalAmountLocalForCancel,
		TRITON_ST_CIMST_INTRADAY.CIDISC AS Discount,
		TRITON_ST_CIMST_INTRADAY.CIFDSC AS DiscountLocal,
		TRITON_ST_CIMST_INTRADAY.CIFVAT AS VatLocal,
		TRITON_ST_CIMST_INTRADAY.CITAPR AS TApercent,
		TRITON_ST_CIMST_INTRADAY.CIFCOM AS CommissionLocal,
		CASE WHEN TRITON_ST_CIMST_INTRADAY.CICLAS ='F' THEN (TRITON_ST_CIMST_INTRADAY.CIFAMT * dbo.fn_GetTritonTaxPC(CIETDT,CISTDT,CICLAS,CISCLS,CILOCT)) ELSE 0 END AS TaxLocal,
		ISNULL(TRITON_ST_CIMST_INTRADAY.CIFAMT * 
			CASE WHEN TRITON_ST_CIMST_INTRADAY.CICLAS ='Q' AND TRITON_ST_CIMST_INTRADAY.CISCLS ='A' THEN CASE WHEN CISTDT = 0 THEN dbo.fn_GetTritonTipPC(CICNEN,CICNST,'A','',CILOCT)END 
			ELSE dbo.fn_GetTritonTipPC(CIETDT,CISTDT,CICLAS,CISCLS,CILOCT) END
			+ CASE WHEN TRITON_ST_CIMST_INTRADAY.CICLAS ='A' OR (TRITON_ST_CIMST_INTRADAY.CICLAS ='Q' AND TRITON_ST_CIMST_INTRADAY.CISCLS ='A' ) THEN TRITON_ST_CIMST_INTRADAY.CIFAMT * TRITON_ST_BLMST.BLATPC ELSE 0 END,0) AS TipLocal,
		0 AS TotalAmountTaxTipsLocal,
		RTRIM(LTRIM(TRITON_ST_CIMST_INTRADAY.CIUSER)) AS LastAmendUser,
		RTRIM(LTRIM(TRITON_ST_CIMST_INTRADAY.CILOCT)) AS BaseLocation,
		RTRIM(LTRIM(TRITON_ST_CNMST_INTRADAY.CNDESG)) AS Currency,
		ISNULL(RTRIM(LTRIM(SB_MARINE_CODE.a_code)),RTRIM(LTRIM(TRITON_ST_CIMST_INTRADAY.CIOFID))) AS ExtraCode, 
		ISNULL(RTRIM(LTRIM(SB_MARINE_CODE.a_description)),RTRIM(LTRIM(TRITON_ST_CIMST_INTRADAY.CIDESC))) AS ExtraCodeDesc, 
		RTRIM(LTRIM(TRITON_ST_CIMST_INTRADAY.CIDESC)) AS ItemDesc,
		RTRIM(LTRIM(SB_MARINE_TYPE.a_RevenueTypeCode)) AS RevenueTypeCode,
		RTRIM(LTRIM(SB_MARINE_TYPE.a_RevenueType)) AS RevenueType,
		RTRIM(LTRIM(SB_MARINE_SUBTYPE.a_RevenueSubTypeCode)) AS RevenueSubTypeCode,
		RTRIM(LTRIM(SB_MARINE_SUBTYPE.a_RevenueSubType)) AS RevenueSubType,
		RTRIM(LTRIM(TRITON_ST_CIMST_INTRADAY.CICLAS)) AS ClassCode,
		RTRIM(LTRIM(SB_MARINE_CLASS.a_Description)) AS Class,
		RTRIM(LTRIM(TRITON_ST_CIMST_INTRADAY.CISCLS)) AS SubClassCode,
		RTRIM(LTRIM(SB_MARINE_SUBCLASS.a_SubClassDescription)) AS SubClass,
		RTRIM(LTRIM(TRITON_ST_CIMST_INTRADAY.CICANC)) AS OriginalClassCode,
		RTRIM(LTRIM(SB_MARINE_ORCLASS.a_Description)) AS OriginalClass,  
		RTRIM(LTRIM(TRITON_ST_CIMST_INTRADAY.CIEXTR)) AS ExtraNotes
	FROM  
		TRITON_ST_CIMST_INTRADAY
	INNER JOIN 
		TRITON_ST_CNMST_INTRADAY
		ON 
			TRITON_ST_CNMST_INTRADAY.CNNUMB = TRITON_ST_CIMST_INTRADAY.CICNNB
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_TYPE SB_MARINE_TYPE
		ON
			SB_MARINE_TYPE.a_RevenueTypeCode =  TRITON_ST_CIMST_INTRADAY.CICLAS
			AND
			SB_MARINE_TYPE.a_SystemSourceID = 102
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_SUBTYPE SB_MARINE_SUBTYPE
		ON
			SB_MARINE_SUBTYPE.i_FK_RevenueTypeID = SB_MARINE_TYPE.i_SK_RevenueTypeID
			AND
			SB_MARINE_SUBTYPE.a_RevenueSubTypeCode = TRITON_ST_CIMST_INTRADAY.CISCLS
			AND
			SB_MARINE_SUBTYPE.a_SystemSourceID = 102
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_CODE SB_MARINE_CODE
		ON
			SB_MARINE_CODE.a_code = TRITON_ST_CIMST_INTRADAY.CIOFID
			AND
			SB_MARINE_CODE.a_SystemSourceID = 102
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_CLASS SB_MARINE_CLASS
		ON
			SB_MARINE_CLASS.a_Class = TRITON_ST_CIMST_INTRADAY.CICLAS
			AND
			SB_MARINE_CLASS.a_SystemSourceID = 102
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_SUBCLASS SB_MARINE_SUBCLASS
		ON
			SB_MARINE_SUBCLASS.i_FK_ClassID = SB_MARINE_CLASS.i_SK_ClassID
			AND
			SB_MARINE_SUBCLASS.a_SubClass = TRITON_ST_CIMST_INTRADAY.CISCLS
			AND
			SB_MARINE_SUBCLASS.a_SystemSourceID = 102
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_CLASS SB_MARINE_ORCLASS
		ON
			SB_MARINE_ORCLASS.a_Class = TRITON_ST_CIMST_INTRADAY.CICANC
			AND
			SB_MARINE_ORCLASS.a_SystemSourceID = 102
	LEFT JOIN
		AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_START 
		ON
			CONF_DT_CALENDAR_START.i_SK_Calendar = TRITON_ST_CNMST_INTRADAY.CNSTDT
	LEFT JOIN 
		TRITON_ST_BLMST
		ON
			TRITON_ST_CIMST_INTRADAY.CILOCT = TRITON_ST_BLMST.BLLOCT 
		
		
	INSERT INTO 
		ST_MARINE_FITN_INTRADAY
	SELECT 
		CAST(CAST(101 AS VARCHAR(3)) 
		+	CASE WHEN SUBSTRING(SUNSAIL_ST_CIMST_INTRADAY.CICNNB,1,1) IN ('0','1','2','3','4','5','6','7','8','9') 
				THEN
					RIGHT('0000000'+ CAST(SUNSAIL_ST_CIMST_INTRADAY.CICNNB AS VARCHAR(7)), 7) 
				ELSE
					CAST(ASCII(SUBSTRING(SUNSAIL_ST_CIMST_INTRADAY.CICNNB,1,1)) AS CHAR(2)) + SUBSTRING(SUNSAIL_ST_CIMST_INTRADAY.CICNNB,2,LEN(SUNSAIL_ST_CIMST_INTRADAY.CICNNB)) 
				END	
		AS BIGINT) AS i_Sk_Bkg,
		'REV' AS ItineraryLineType,
		101 AS SourceSysID,
		'SUNSAIL' AS SystemName,
		'M' AS DivisionCode,
		NULL AS BrandCode,
		NULL AS Product,
		NULL AS BookingType,
		1 AS CompanyNo,
		RTRIM(LTRIM(SUNSAIL_ST_CIMST_INTRADAY.CICNNB)) AS BkgRef,
		RANK() OVER
			(
				PARTITION BY 
					SUNSAIL_ST_CIMST_INTRADAY.CICNNB
				ORDER BY 
					SUNSAIL_ST_CIMST_INTRADAY.CICNNB,
					SUNSAIL_ST_CIMST_INTRADAY.CINUMB
			)  AS ItinRef,
		CASE WHEN SUNSAIL_ST_CIMST_INTRADAY.CICLAS ='*' AND 
			(SUNSAIL_ST_CIMST_INTRADAY.CICANC <> ' ' OR (SUNSAIL_ST_CIMST_INTRADAY.CICANC =  ' ' AND SUNSAIL_ST_CIMST_INTRADAY.CIFAMT <>0.0)) THEN 8 
			ELSE 3 END 
		AS [Status],
		SUNSAIL_ST_CIMST_INTRADAY.CIQNTY AS Qty,
		SUNSAIL_ST_CIMST_INTRADAY.CIPERS AS NoPax,
		SUNSAIL_ST_CIMST_INTRADAY.CICNST AS ContractSvsStartDate,
		SUNSAIL_ST_CIMST_INTRADAY.CICNEN AS ContractSvsEndDate,
		SUNSAIL_ST_CIMST_INTRADAY.CIETDT AS EntryDate,
		SUNSAIL_ST_CIMST_INTRADAY.CICHDT AS SvsLastAmendDate,
		CASE 
			WHEN 
				SUNSAIL_ST_CIMST_INTRADAY.CICNST  = SUNSAIL_ST_CIMST_INTRADAY.CICNEN THEN 1 
			ELSE 
				DATEDIFF(d,CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_CIMST_INTRADAY.CICNST),112)),
				CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_CIMST_INTRADAY.CICNEN),112))) 
			END AS ContractDuration,
		CASE WHEN LEN(SUNSAIL_ST_CIMST_INTRADAY.CISTDT) = 8 THEN TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_CIMST_INTRADAY.CISTDT) ELSE 0 END AS ItemStartDate,
		CASE WHEN LEN(SUNSAIL_ST_CIMST_INTRADAY.CIENDT) = 8 THEN TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_CIMST_INTRADAY.CIENDT) ELSE 0 END AS ItemEndDate,
		CASE 
			WHEN 
				LEN(SUNSAIL_ST_CIMST_INTRADAY.CISTDT) = 8  AND LEN(SUNSAIL_ST_CIMST_INTRADAY.CIENDT) = 8
			THEN
				DATEDIFF(d,CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_CIMST_INTRADAY.CISTDT),112)),
				CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_CIMST_INTRADAY.CIENDT),112))) 
			ELSE
				0
			END AS ItemDuration,
		CASE 
			WHEN SUNSAIL_ST_CIMST_INTRADAY.CISTDT = 0 THEN 1
			WHEN LEN(SUNSAIL_ST_CIMST_INTRADAY.CISTDT) >2 THEN 1
			ELSE SUNSAIL_ST_CIMST_INTRADAY.CISTDT
		END AS ItemPerPerson,
		CASE
			WHEN SUNSAIL_ST_CIMST_INTRADAY.CIENDT = 0 THEN 1
			WHEN LEN(SUNSAIL_ST_CIMST_INTRADAY.CIENDT) >2 THEN 1
			ELSE SUNSAIL_ST_CIMST_INTRADAY.CIENDT
		END AS ItemPerDuration,
		SUNSAIL_ST_CIMST_INTRADAY.CIFAMT AS ItemAmountLocal,
		CASE 
			WHEN SUNSAIL_ST_CIMST_INTRADAY.CICLAS ='*' THEN 0
			WHEN SUNSAIL_ST_CIMST_INTRADAY.CICLAS ='B' THEN SUNSAIL_ST_CIMST_INTRADAY.CIFAMT * CASE WHEN LEN(SUNSAIL_ST_CIMST_INTRADAY.CIQNTY) = 5 THEN 1 ELSE SUNSAIL_ST_CIMST_INTRADAY.CIQNTY END
			WHEN SUNSAIL_ST_CIMST_INTRADAY.CICLAS ='E' THEN SUNSAIL_ST_CIMST_INTRADAY.CIFAMT * CASE WHEN LEN(SUNSAIL_ST_CIMST_INTRADAY.CIQNTY) = 5 THEN 1 ELSE SUNSAIL_ST_CIMST_INTRADAY.CIQNTY END * 
				CASE 
					WHEN LEN(SUNSAIL_ST_CIMST_INTRADAY.CISTDT) = 8  AND LEN(SUNSAIL_ST_CIMST_INTRADAY.CIENDT) = 8
			    THEN
					DATEDIFF(d,CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_CIMST_INTRADAY.CISTDT),112)),
					CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_CIMST_INTRADAY.CIENDT),112))) 
				ELSE
					0
				END
			 	WHEN SUNSAIL_ST_CIMST_INTRADAY.CICLAS IN('P','C','K','I','T') THEN SUNSAIL_ST_CIMST_INTRADAY.CIFAMT * 	
				CASE 
					WHEN SUNSAIL_ST_CIMST_INTRADAY.CIENDT = 0 THEN 1
					WHEN LEN(SUNSAIL_ST_CIMST_INTRADAY.CIENDT) >2 THEN 1
					ELSE SUNSAIL_ST_CIMST_INTRADAY.CIENDT END 
				*
				CASE 
					WHEN SUNSAIL_ST_CIMST_INTRADAY.CISTDT = 0 THEN 1
					WHEN LEN(SUNSAIL_ST_CIMST_INTRADAY.CISTDT) >2 THEN 1
					ELSE SUNSAIL_ST_CIMST_INTRADAY.CISTDT END
			 ELSE SUNSAIL_ST_CIMST_INTRADAY.CIFAMT * CASE WHEN LEN(SUNSAIL_ST_CIMST_INTRADAY.CIQNTY) = 5 THEN 1 ELSE SUNSAIL_ST_CIMST_INTRADAY.CIQNTY END * 
				CASE 
					WHEN SUNSAIL_ST_CIMST_INTRADAY.CICLAS IN ('A','B','D','E','F','G','J','L','M','N','Q','S','X','Z','*') THEN 1
					WHEN SUNSAIL_ST_CIMST_INTRADAY.CIENDT = 0 THEN 1
					WHEN LEN(SUNSAIL_ST_CIMST_INTRADAY.CIENDT) >2 THEN 1
					ELSE SUNSAIL_ST_CIMST_INTRADAY.CIENDT END 
				*
				CASE 
					WHEN SUNSAIL_ST_CIMST_INTRADAY.CICLAS IN ('A','B','D','E','F','G','J','L','M','N','Q','S','X','Z','*') THEN 1
					WHEN SUNSAIL_ST_CIMST_INTRADAY.CISTDT = 0 THEN 1
					WHEN LEN(SUNSAIL_ST_CIMST_INTRADAY.CISTDT) >2 THEN 1
					ELSE SUNSAIL_ST_CIMST_INTRADAY.CISTDT END
		END AS TotalAmountLocal,
		CASE 
			WHEN SUNSAIL_ST_CIMST_INTRADAY.CICLAS <>'*' THEN 0
			WHEN SUNSAIL_ST_CIMST_INTRADAY.CICANC ='B' THEN SUNSAIL_ST_CIMST_INTRADAY.CIFAMT * CASE WHEN LEN(SUNSAIL_ST_CIMST_INTRADAY.CIQNTY) = 5 THEN 1 ELSE SUNSAIL_ST_CIMST_INTRADAY.CIQNTY END
			WHEN SUNSAIL_ST_CIMST_INTRADAY.CICANC ='E' THEN SUNSAIL_ST_CIMST_INTRADAY.CIFAMT * CASE WHEN LEN(SUNSAIL_ST_CIMST_INTRADAY.CIQNTY) = 5 THEN 1 ELSE SUNSAIL_ST_CIMST_INTRADAY.CIQNTY END * 
				CASE 
					WHEN LEN(SUNSAIL_ST_CIMST_INTRADAY.CISTDT) = 8  AND LEN(SUNSAIL_ST_CIMST_INTRADAY.CIENDT) = 8
			    THEN
					DATEDIFF(d,CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_CIMST_INTRADAY.CISTDT),112)),
					CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_CIMST_INTRADAY.CIENDT),112))) 
				ELSE
					0
				END
			  WHEN SUNSAIL_ST_CIMST_INTRADAY.CICANC IN('P','C','K','I','T') THEN SUNSAIL_ST_CIMST_INTRADAY.CIFAMT * 	
				CASE 
					WHEN SUNSAIL_ST_CIMST_INTRADAY.CIENDT = 0 THEN 1
					WHEN LEN(SUNSAIL_ST_CIMST_INTRADAY.CIENDT) >2 THEN 1
					ELSE SUNSAIL_ST_CIMST_INTRADAY.CIENDT END 
				*
				CASE 
					WHEN SUNSAIL_ST_CIMST_INTRADAY.CISTDT = 0 THEN 1
					WHEN LEN(SUNSAIL_ST_CIMST_INTRADAY.CISTDT) >2 THEN 1
					ELSE SUNSAIL_ST_CIMST_INTRADAY.CISTDT END
			 ELSE SUNSAIL_ST_CIMST_INTRADAY.CIFAMT * CASE WHEN LEN(SUNSAIL_ST_CIMST_INTRADAY.CIQNTY) = 5 THEN 1 ELSE SUNSAIL_ST_CIMST_INTRADAY.CIQNTY END * 
				CASE 
					WHEN SUNSAIL_ST_CIMST_INTRADAY.CICANC IN ('A','B','D','E','F','G','J','L','M','N','Q','S','X','Z','*') THEN 1
					WHEN SUNSAIL_ST_CIMST_INTRADAY.CIENDT = 0 THEN 1
					WHEN LEN(SUNSAIL_ST_CIMST_INTRADAY.CIENDT) >2 THEN 1
					ELSE SUNSAIL_ST_CIMST_INTRADAY.CIENDT END 
				*
				CASE 
					WHEN SUNSAIL_ST_CIMST_INTRADAY.CICANC IN ('A','B','D','E','F','G','J','L','M','N','Q','S','X','Z','*') THEN 1
					WHEN SUNSAIL_ST_CIMST_INTRADAY.CISTDT = 0 THEN 1
					WHEN LEN(SUNSAIL_ST_CIMST_INTRADAY.CISTDT) >2 THEN 1
					ELSE SUNSAIL_ST_CIMST_INTRADAY.CISTDT END
		END AS TotalAmountLocalForCancel,
		SUNSAIL_ST_CIMST_INTRADAY.CIDISC AS Discount,
		SUNSAIL_ST_CIMST_INTRADAY.CIFDSC AS DiscountLocal,
		SUNSAIL_ST_CIMST_INTRADAY.CIFVAT AS VatLocal,
		SUNSAIL_ST_CIMST_INTRADAY.CITAPR AS TApercent,
		SUNSAIL_ST_CIMST_INTRADAY.CIFCOM AS CommissionLocal,
		CASE WHEN SUNSAIL_ST_CIMST_INTRADAY.CICLAS ='F' THEN  SUNSAIL_ST_CIMST_INTRADAY.CIFAMT * dbo.fn_GetSunsailTaxPC(CIETDT,CISTDT,CICLAS,CISCLS,CILOCT) ELSE 0 END AS TaxLocal,
		ISNULL(SUNSAIL_ST_CIMST_INTRADAY.CIFAMT * 
			CASE WHEN SUNSAIL_ST_CIMST_INTRADAY.CICLAS ='Q' AND SUNSAIL_ST_CIMST_INTRADAY.CISCLS ='A' THEN CASE WHEN CISTDT = 0 THEN dbo.fn_GetTritonTipPC(CICNEN,CICNST,'A','',CILOCT)END 
			ELSE dbo.fn_GetTritonTipPC(CIETDT,CISTDT,CICLAS,CISCLS,CILOCT) END 
			+ CASE WHEN SUNSAIL_ST_CIMST_INTRADAY.CICLAS ='A' OR (SUNSAIL_ST_CIMST_INTRADAY.CICLAS ='Q' AND SUNSAIL_ST_CIMST_INTRADAY.CISCLS ='A' ) THEN  SUNSAIL_ST_CIMST_INTRADAY.CIFAMT * SUNSAIL_ST_BLMST.BLATPC ELSE 0 END,0) AS TipLocal,
		0 AS TotalAmountTaxTipsLocal,
		RTRIM(LTRIM(SUNSAIL_ST_CIMST_INTRADAY.CIUSER)) AS LastAmendUser,
		RTRIM(LTRIM(SUNSAIL_ST_CIMST_INTRADAY.CILOCT)) AS BaseLocation,
		RTRIM(LTRIM(SUNSAIL_ST_CNMST_INTRADAY.CNDESG)) AS Currency,
		ISNULL(RTRIM(LTRIM(SB_MARINE_CODE.a_code)),RTRIM(LTRIM(SUNSAIL_ST_CIMST_INTRADAY.CIOFID))) AS ExtraCode, 
		ISNULL(RTRIM(LTRIM(SB_MARINE_CODE.a_description)),RTRIM(LTRIM(SUNSAIL_ST_CIMST_INTRADAY.CIDESC))) AS ExtraCodeDesc, 
		RTRIM(LTRIM(SUNSAIL_ST_CIMST_INTRADAY.CIDESC)) AS ItemDesc,
		RTRIM(LTRIM(SB_MARINE_TYPE.a_RevenueTypeCode)) AS RevenueTypeCode,
		RTRIM(LTRIM(SB_MARINE_TYPE.a_RevenueType)) AS RevenueType,
		RTRIM(LTRIM(SB_MARINE_SUBTYPE.a_RevenueSubTypeCode)) AS RevenueSubTypeCode,
		RTRIM(LTRIM(SB_MARINE_SUBTYPE.a_RevenueSubType)) AS RevenueSubType,
		RTRIM(LTRIM(SUNSAIL_ST_CIMST_INTRADAY.CICLAS)) AS ClassCode,
		RTRIM(LTRIM(SB_MARINE_CLASS.a_Description)) AS Class,
		RTRIM(LTRIM(SUNSAIL_ST_CIMST_INTRADAY.CISCLS)) AS SubClassCode,
		RTRIM(LTRIM(SB_MARINE_SUBCLASS.a_SubClassDescription)) AS SubClass,
		RTRIM(LTRIM(SUNSAIL_ST_CIMST_INTRADAY.CICANC)) AS OriginalClassCode,
		RTRIM(LTRIM(SB_MARINE_ORCLASS.a_Description)) AS OriginalClass,  
		RTRIM(LTRIM(SUNSAIL_ST_CIMST_INTRADAY.CIEXTR)) AS ExtraNotes
	FROM 
		SUNSAIL_ST_CIMST_INTRADAY
	INNER JOIN 
		SUNSAIL_ST_CNMST_INTRADAY
		ON 
			SUNSAIL_ST_CNMST_INTRADAY.CNNUMB = SUNSAIL_ST_CIMST_INTRADAY.CICNNB
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_TYPE SB_MARINE_TYPE
		ON
			SB_MARINE_TYPE.a_RevenueTypeCode =  SUNSAIL_ST_CIMST_INTRADAY.CICLAS
			AND
			SB_MARINE_TYPE.a_SystemSourceID = 101
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_SUBTYPE SB_MARINE_SUBTYPE
		ON
			SB_MARINE_SUBTYPE.i_FK_RevenueTypeID = SB_MARINE_TYPE.i_SK_RevenueTypeID
			AND
			SB_MARINE_SUBTYPE.a_RevenueSubTypeCode = SUNSAIL_ST_CIMST_INTRADAY.CISCLS
			AND
			SB_MARINE_SUBTYPE.a_SystemSourceID = 101
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_CODE SB_MARINE_CODE
		ON
			SB_MARINE_CODE.a_code = SUNSAIL_ST_CIMST_INTRADAY.CIOFID
			AND
			SB_MARINE_CODE.a_SystemSourceID = 101
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_CLASS SB_MARINE_CLASS
		ON
			SB_MARINE_CLASS.a_Class = SUNSAIL_ST_CIMST_INTRADAY.CICLAS
			AND
			SB_MARINE_CLASS.a_SystemSourceID = 101
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_SUBCLASS SB_MARINE_SUBCLASS
		ON
			SB_MARINE_SUBCLASS.i_FK_ClassID = SB_MARINE_CLASS.i_SK_ClassID
			AND
			SB_MARINE_SUBCLASS.a_SubClass = SUNSAIL_ST_CIMST_INTRADAY.CISCLS
			AND
			SB_MARINE_SUBCLASS.a_SystemSourceID = 101
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_CLASS SB_MARINE_ORCLASS
		ON
			SB_MARINE_ORCLASS.a_Class = SUNSAIL_ST_CIMST_INTRADAY.CICANC
			AND
			SB_MARINE_ORCLASS.a_SystemSourceID = 101
	LEFT JOIN
		AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_START 
		ON
			CONF_DT_CALENDAR_START.i_SK_Calendar = SUNSAIL_ST_CNMST_INTRADAY.CNSTDT
	LEFT JOIN 
		SUNSAIL_ST_BLMST
		ON
			SUNSAIL_ST_CIMST_INTRADAY.CILOCT = SUNSAIL_ST_BLMST.BLLOCT


	EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'TRTN','INTR_FITN'






GO
/****** Object:  StoredProcedure [dbo].[BUILD_ST_MARINE_FITN_QUOTES]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[BUILD_ST_MARINE_FITN_QUOTES]
AS

	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'TRTN','ST_FITNQ','BUILD_ST_MARINE_FITN_QUOTES'

	DELETE FROM ST_MARINE_Fitn WHERE [Status] IN (4,22)

	INSERT INTO 
		ST_MARINE_FITN
	SELECT 
		CAST(CAST(102 AS VARCHAR(3)) + '09'+  
		+	CASE WHEN SUBSTRING(TRITON_ST_QIMST.QICNNB,1,1) IN ('0','1','2','3','4','5','6','7','8','9') 
				THEN
					RIGHT('0000000'+ CAST(TRITON_ST_QIMST.QICNNB AS VARCHAR(7)), 7) 
				ELSE
					CAST(ASCII(SUBSTRING(TRITON_ST_QIMST.QICNNB,1,1)) AS CHAR(2)) + SUBSTRING(TRITON_ST_QIMST.QICNNB,2,LEN(TRITON_ST_QIMST.QICNNB)) 
				END	
		AS BIGINT) AS i_Sk_Bkg,
		'REV' AS ItineraryLineType,
		102 AS SourceSysID,
		'TRITON' AS SystemName,
		'M' AS DivisionCode,
		CASE WHEN TRITON_ST_QNMST.QNSTUS ='F' THEN 'FTL' ELSE 'MRG'END  AS BrandCode,
		CASE WHEN TRITON_ST_QNMST.QNSTUS = 'L' THEN 'MOORINGS'
			 WHEN TRITON_ST_QNMST.QNSTUS = 'F' THEN 'FOOTLOOSE' END AS Product,
		NULL AS BookingType,
		0 AS CompanyNo,
		RTRIM(LTRIM(TRITON_ST_QIMST.QICNNB)) AS BkgRef,
		RANK() OVER
			(
				PARTITION BY 
					TRITON_ST_QIMST.QICNNB
				ORDER BY 
					TRITON_ST_QIMST.QICNNB,
					TRITON_ST_QIMST.QINUMB
			)  AS ItinRef,
		CASE WHEN TRITON_ST_QIMST.QICLAS ='*' AND 
			(TRITON_ST_QIMST.QICANC <> ' ' OR (TRITON_ST_QIMST.QICANC =  ' ' AND TRITON_ST_QIMST.QIFAMT <>0.0)) THEN 22 
			ELSE 4 END 
		AS [Status],
		TRITON_ST_QIMST.QIQNTY AS Qty,
		TRITON_ST_QIMST.QIPERS AS NoPax,
		TRITON_ST_QIMST.QICNST AS ContractSvsStartDate,
		TRITON_ST_QIMST.QICNEN AS ContractSvsEndDate,
		TRITON_ST_QIMST.QIETDT AS EntryDate,
		TRITON_ST_QIMST.QICHDT AS SvsLastAmendDate,
		CASE 
			WHEN 
				TRITON_ST_QIMST.QICNST  = TRITON_ST_QIMST.QICNEN THEN 1 
			ELSE 
				DATEDIFF(d,CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(TRITON_ST_QIMST.QICNST),112)),
				CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(TRITON_ST_QIMST.QICNEN),112))) 
			END AS ContractDuration,
		CASE WHEN LEN(TRITON_ST_QIMST.QISTDT) = 8 THEN TRITON_Stage.dbo.fn_CheckDate(TRITON_ST_QIMST.QISTDT) ELSE 0 END AS ItemStartDate,
		CASE WHEN LEN(TRITON_ST_QIMST.QIENDT) = 8 THEN TRITON_Stage.dbo.fn_CheckDate(TRITON_ST_QIMST.QIENDT) ELSE 0 END AS ItemEndDate,
		CASE 
			WHEN 
				LEN(TRITON_ST_QIMST.QISTDT) = 8  AND LEN(TRITON_ST_QIMST.QIENDT) = 8
			THEN
				DATEDIFF(d,CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(TRITON_ST_QIMST.QISTDT),112)),
				CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(TRITON_ST_QIMST.QIENDT),112))) 
			ELSE
				0
			END AS ItemDuration,
		CASE 
			WHEN TRITON_ST_QIMST.QISTDT = 0 THEN 1
			WHEN LEN(TRITON_ST_QIMST.QISTDT) >2 THEN 1
			ELSE TRITON_ST_QIMST.QISTDT
		END AS ItemPerPerson,
		CASE
			WHEN TRITON_ST_QIMST.QIENDT = 0 THEN 1
			WHEN LEN(TRITON_ST_QIMST.QIENDT) >2 THEN 1
			ELSE TRITON_ST_QIMST.QIENDT
		END AS ItemPerDuration,
		TRITON_ST_QIMST.QIFAMT AS ItemAmountLocal,
		CASE 
			WHEN TRITON_ST_QIMST.QICLAS ='*' THEN 0
			WHEN TRITON_ST_QIMST.QICLAS ='B' THEN TRITON_ST_QIMST.QIFAMT * CASE WHEN LEN(TRITON_ST_QIMST.QIQNTY) = 5 THEN 1 ELSE TRITON_ST_QIMST.QIQNTY END
			WHEN TRITON_ST_QIMST.QICLAS ='E' THEN TRITON_ST_QIMST.QIFAMT *CASE WHEN LEN(TRITON_ST_QIMST.QIQNTY) = 5 THEN 1 ELSE TRITON_ST_QIMST.QIQNTY END * 
				CASE 
					WHEN LEN(TRITON_ST_QIMST.QISTDT) = 8  AND LEN(TRITON_ST_QIMST.QIENDT) = 8
			    THEN
					DATEDIFF(d,CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(TRITON_ST_QIMST.QISTDT),112)),
					CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(TRITON_ST_QIMST.QIENDT),112))) 
				ELSE
					0
				END
			  WHEN TRITON_ST_QIMST.QICLAS IN('P','C','K','I','T') THEN TRITON_ST_QIMST.QIFAMT * 	
				CASE 
					WHEN TRITON_ST_QIMST.QIENDT = 0 THEN 1
					WHEN LEN(TRITON_ST_QIMST.QIENDT) >2 THEN 1
					ELSE TRITON_ST_QIMST.QIENDT END 
				*
				CASE 
					WHEN TRITON_ST_QIMST.QISTDT = 0 THEN 1
					WHEN LEN(TRITON_ST_QIMST.QISTDT) >2 THEN 1
					ELSE TRITON_ST_QIMST.QISTDT END				
			 ELSE TRITON_ST_QIMST.QIFAMT * CASE WHEN LEN(TRITON_ST_QIMST.QIQNTY) = 5 THEN 1 ELSE TRITON_ST_QIMST.QIQNTY END * 
				CASE 
					WHEN TRITON_ST_QIMST.QICLAS IN ('A','B','D','E','F','G','J','L','M','N','Q','S','X','Z','*') THEN 1
					WHEN TRITON_ST_QIMST.QIENDT = 0 THEN 1
					WHEN LEN(TRITON_ST_QIMST.QIENDT) >2 THEN 1
					ELSE TRITON_ST_QIMST.QIENDT END 
				*
				CASE 
					WHEN TRITON_ST_QIMST.QICLAS IN ('A','B','D','E','F','G','J','L','M','N','Q','S','X','Z','*') THEN 1
					WHEN TRITON_ST_QIMST.QISTDT = 0 THEN 1
					WHEN LEN(TRITON_ST_QIMST.QISTDT) >2 THEN 1
					ELSE TRITON_ST_QIMST.QISTDT END
		END AS TotalAmountLocal,
		CASE 
			WHEN TRITON_ST_QIMST.QICLAS <>'*' THEN 0
			WHEN TRITON_ST_QIMST.QICANC ='B' THEN TRITON_ST_QIMST.QIFAMT * CASE WHEN LEN(TRITON_ST_QIMST.QIQNTY) = 5 THEN 1 ELSE TRITON_ST_QIMST.QIQNTY END
			WHEN TRITON_ST_QIMST.QICANC ='E' THEN TRITON_ST_QIMST.QIFAMT * CASE WHEN LEN(TRITON_ST_QIMST.QIQNTY) = 5 THEN 1 ELSE TRITON_ST_QIMST.QIQNTY END * 
				CASE 
					WHEN LEN(TRITON_ST_QIMST.QISTDT) = 8  AND LEN(TRITON_ST_QIMST.QIENDT) = 8
			    THEN
					DATEDIFF(d,CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(TRITON_ST_QIMST.QISTDT),112)),
					CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(TRITON_ST_QIMST.QIENDT),112))) 
				ELSE
					0
				END
			  WHEN TRITON_ST_QIMST.QICANC IN('P','C','K','I','T') THEN TRITON_ST_QIMST.QIFAMT * 	
				CASE 
					WHEN TRITON_ST_QIMST.QIENDT = 0 THEN 1
					WHEN LEN(TRITON_ST_QIMST.QIENDT) >2 THEN 1
					ELSE TRITON_ST_QIMST.QIENDT END 
				*
				CASE 
					WHEN TRITON_ST_QIMST.QISTDT = 0 THEN 1
					WHEN LEN(TRITON_ST_QIMST.QISTDT) >2 THEN 1
					ELSE TRITON_ST_QIMST.QISTDT END	
			 ELSE TRITON_ST_QIMST.QIFAMT * CASE WHEN LEN(TRITON_ST_QIMST.QIQNTY) = 5 THEN 1 ELSE TRITON_ST_QIMST.QIQNTY END * 
				CASE 
					WHEN TRITON_ST_QIMST.QICANC IN ('A','B','D','E','F','G','J','L','M','N','Q','S','X','Z','*') THEN 1
					WHEN TRITON_ST_QIMST.QIENDT = 0 THEN 1
					WHEN LEN(TRITON_ST_QIMST.QIENDT) >2 THEN 1
					ELSE TRITON_ST_QIMST.QIENDT END 
				*
				CASE 
					WHEN TRITON_ST_QIMST.QICANC IN ('A','B','D','E','F','G','J','L','M','N','Q','S','X','Z','*') THEN 1
					WHEN TRITON_ST_QIMST.QISTDT = 0 THEN 1
					WHEN LEN(TRITON_ST_QIMST.QISTDT) >2 THEN 1
					ELSE TRITON_ST_QIMST.QISTDT END
		END AS TotalAmountLocalForCancel,
		TRITON_ST_QIMST.QIDISC AS Discount,
		TRITON_ST_QIMST.QIFDSC AS DiscountLocal,
		TRITON_ST_QIMST.QIFVAT AS VatLocal,
		TRITON_ST_QIMST.QITAPR AS TApercent,
		TRITON_ST_QIMST.QIFCOM AS CommissionLocal,
		CASE WHEN TRITON_ST_QIMST.QICLAS ='F' THEN (TRITON_ST_QIMST.QIFAMT * dbo.fn_GetTritonTaxPC(QIETDT,QISTDT,QICLAS,QISCLS,QILOCT)) ELSE 0 END AS TaxLocal,
		ISNULL(TRITON_ST_QIMST.QIFAMT * 
			CASE WHEN TRITON_ST_QIMST.QICLAS ='Q' AND TRITON_ST_QIMST.QISCLS ='A' THEN CASE WHEN QISTDT = 0 THEN dbo.fn_GetTritonTipPC(QICNEN,QICNST,'A','',QILOCT)END 
			ELSE dbo.fn_GetTritonTipPC(QIETDT,QISTDT,QICLAS,QISCLS,QILOCT) END
			+ CASE WHEN TRITON_ST_QIMST.QICLAS ='A' OR (TRITON_ST_QIMST.QICLAS ='Q' AND TRITON_ST_QIMST.QISCLS ='A' ) THEN TRITON_ST_QIMST.QIFAMT * TRITON_ST_BLMST.BLATPC ELSE 0 END,0) AS TipLocal,
		0 AS TotalAmountTaxTipsLocal,
		RTRIM(LTRIM(TRITON_ST_QIMST.QIUSER)) AS LastAmendUser,
		RTRIM(LTRIM(TRITON_ST_QIMST.QILOCT)) AS BaseLocation,
		RTRIM(LTRIM(TRITON_ST_QNMST.QNDESG)) AS Currency,
		ISNULL(RTRIM(LTRIM(SB_MARINE_CODE.a_code)),RTRIM(LTRIM(TRITON_ST_QIMST.QIOFID))) AS ExtraCode, 
		ISNULL(RTRIM(LTRIM(SB_MARINE_CODE.a_description)),RTRIM(LTRIM(TRITON_ST_QIMST.QIDESC))) AS ExtraCodeDesc, 
		RTRIM(LTRIM(TRITON_ST_QIMST.QIDESC)) AS ItemDesc,
		RTRIM(LTRIM(SB_MARINE_TYPE.a_RevenueTypeCode)) AS RevenueTypeCode,
		RTRIM(LTRIM(SB_MARINE_TYPE.a_RevenueType)) AS RevenueType,
		RTRIM(LTRIM(SB_MARINE_SUBTYPE.a_RevenueSubTypeCode)) AS RevenueSubTypeCode,
		RTRIM(LTRIM(SB_MARINE_SUBTYPE.a_RevenueSubType)) AS RevenueSubType,
		RTRIM(LTRIM(TRITON_ST_QIMST.QICLAS)) AS ClassCode,
		RTRIM(LTRIM(SB_MARINE_CLASS.a_Description)) AS Class,
		RTRIM(LTRIM(TRITON_ST_QIMST.QISCLS)) AS SubClassCode,
		RTRIM(LTRIM(SB_MARINE_SUBCLASS.a_SubClassDescription)) AS SubClass,
		RTRIM(LTRIM(TRITON_ST_QIMST.QICANC)) AS OriginalClassCode,
		RTRIM(LTRIM(SB_MARINE_ORCLASS.a_Description)) AS OriginalClass,  
		RTRIM(LTRIM(TRITON_ST_QIMST.QIEXTR)) AS ExtraNotes,
		NULL AS DepAirport,
		NULL AS ArrAirport,
		TRITON_ST_PTMST.PTCMNB AS GLCompany,
		TRITON_ST_PTMST.PTDPNB AS GLDepartment,
		TRITON_ST_PTMST.PTATNB AS GLAccount
	FROM  
		TRITON_ST_QIMST
	INNER JOIN 
		TRITON_ST_QNMST
		ON 
			TRITON_ST_QNMST.QNNUMB = TRITON_ST_QIMST.QICNNB
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_TYPE SB_MARINE_TYPE
		ON
			SB_MARINE_TYPE.a_RevenueTypeCode =  TRITON_ST_QIMST.QICLAS
			AND
			SB_MARINE_TYPE.a_SystemSourceID = 102
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_SUBTYPE SB_MARINE_SUBTYPE
		ON
			SB_MARINE_SUBTYPE.i_FK_RevenueTypeID = SB_MARINE_TYPE.i_SK_RevenueTypeID
			AND
			SB_MARINE_SUBTYPE.a_RevenueSubTypeCode = TRITON_ST_QIMST.QISCLS
			AND
			SB_MARINE_SUBTYPE.a_SystemSourceID = 102
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_CODE SB_MARINE_CODE
		ON
			SB_MARINE_CODE.a_code = TRITON_ST_QIMST.QIOFID
			AND
			SB_MARINE_CODE.a_SystemSourceID = 102
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_CLASS SB_MARINE_CLASS
		ON
			SB_MARINE_CLASS.a_Class = TRITON_ST_QIMST.QICLAS
			AND
			SB_MARINE_CLASS.a_SystemSourceID = 102
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_SUBCLASS SB_MARINE_SUBCLASS
		ON
			SB_MARINE_SUBCLASS.i_FK_ClassID = SB_MARINE_CLASS.i_SK_ClassID
			AND
			SB_MARINE_SUBCLASS.a_SubClass = TRITON_ST_QIMST.QISCLS
			AND
			SB_MARINE_SUBCLASS.a_SystemSourceID = 102
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_CLASS SB_MARINE_ORCLASS
		ON
			SB_MARINE_ORCLASS.a_Class = TRITON_ST_QIMST.QICANC
			AND
			SB_MARINE_ORCLASS.a_SystemSourceID = 102
	LEFT JOIN
		AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_START 
		ON
			CONF_DT_CALENDAR_START.i_SK_Calendar = TRITON_ST_QNMST.QNSTDT
	LEFT JOIN 
		TRITON_ST_BLMST
		ON
			TRITON_ST_QIMST.QILOCT = TRITON_ST_BLMST.BLLOCT 
	LEFT JOIN
		TRITON_ST_PTMST
		ON
			TRITON_ST_QIMST.QIOFID = TRITON_ST_PTMST.PTCDRF 
			AND
			TRITON_ST_QIMST.QILOCT = TRITON_ST_PTMST.PTLOCT
	WHERE 
		CONF_DT_CALENDAR_START.a_Year >= 2010
			
	

		
	INSERT INTO 
		ST_MARINE_FITN
	SELECT 
		CAST(CAST(101 AS VARCHAR(3))  + '09'+  
		+	CASE WHEN SUBSTRING(SUNSAIL_ST_QIMST.QICNNB,1,1) IN ('0','1','2','3','4','5','6','7','8','9') 
				THEN
					RIGHT('0000000'+ CAST(SUNSAIL_ST_QIMST.QICNNB AS VARCHAR(7)), 7) 
				ELSE
					CAST(ASCII(SUBSTRING(SUNSAIL_ST_QIMST.QICNNB,1,1)) AS CHAR(2)) + SUBSTRING(SUNSAIL_ST_QIMST.QICNNB,2,LEN(SUNSAIL_ST_QIMST.QICNNB)) 
				END	
		AS BIGINT) AS i_Sk_Bkg,
		'REV' AS ItineraryLineType,
		101 AS SourceSysID,
		'SUNSAIL' AS SystemName,
		'M' AS DivisionCode,
		'SUN'AS BrandCode,
		CASE WHEN SUNSAIL_ST_QNMST.QNSTUS = 'B' THEN 'BAREBOAT'
			 WHEN SUNSAIL_ST_QNMST.QNSTUS = 'F' THEN 'FLIGHT'
			 WHEN SUNSAIL_ST_QNMST.QNSTUS = 'L' THEN 'FLOTILLA'
			 WHEN SUNSAIL_ST_QNMST.QNSTUS = 'T' THEN 'LEBOAT' END AS Product,
		NULL AS BookingType,
		1 AS CompanyNo,
		RTRIM(LTRIM(SUNSAIL_ST_QIMST.QICNNB)) AS BkgRef,
		RANK() OVER
			(
				PARTITION BY 
					SUNSAIL_ST_QIMST.QICNNB
				ORDER BY 
					SUNSAIL_ST_QIMST.QICNNB,
					SUNSAIL_ST_QIMST.QINUMB
			)  AS ItinRef,
		CASE WHEN SUNSAIL_ST_QIMST.QICLAS ='*' AND 
			(SUNSAIL_ST_QIMST.QICANC <> ' ' OR (SUNSAIL_ST_QIMST.QICANC =  ' ' AND SUNSAIL_ST_QIMST.QIFAMT <>0.0)) THEN 22 
			ELSE 4 END 
		AS [Status],
		SUNSAIL_ST_QIMST.QIQNTY AS Qty,
		SUNSAIL_ST_QIMST.QIPERS AS NoPax,
		SUNSAIL_ST_QIMST.QICNST AS ContractSvsStartDate,
		SUNSAIL_ST_QIMST.QICNEN AS ContractSvsEndDate,
		SUNSAIL_ST_QIMST.QIETDT AS EntryDate,
		SUNSAIL_ST_QIMST.QICHDT AS SvsLastAmendDate,
		CASE 
			WHEN 
				SUNSAIL_ST_QIMST.QICNST  = SUNSAIL_ST_QIMST.QICNEN THEN 1 
			ELSE 
				DATEDIFF(d,CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_QIMST.QICNST),112)),
				CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_QIMST.QICNEN),112))) 
			END AS ContractDuration,
		CASE WHEN LEN(SUNSAIL_ST_QIMST.QISTDT) = 8 THEN TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_QIMST.QISTDT) ELSE 0 END AS ItemStartDate,
		CASE WHEN LEN(SUNSAIL_ST_QIMST.QIENDT) = 8 THEN TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_QIMST.QIENDT) ELSE 0 END AS ItemEndDate,
		CASE 
			WHEN 
				LEN(SUNSAIL_ST_QIMST.QISTDT) = 8  AND LEN(SUNSAIL_ST_QIMST.QIENDT) = 8
			THEN
				DATEDIFF(d,CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_QIMST.QISTDT),112)),
				CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_QIMST.QIENDT),112))) 
			ELSE
				0
			END AS ItemDuration,
		CASE 
			WHEN SUNSAIL_ST_QIMST.QISTDT = 0 THEN 1
			WHEN LEN(SUNSAIL_ST_QIMST.QISTDT) >2 THEN 1
			ELSE SUNSAIL_ST_QIMST.QISTDT
		END AS ItemPerPerson,
		CASE
			WHEN SUNSAIL_ST_QIMST.QIENDT = 0 THEN 1
			WHEN LEN(SUNSAIL_ST_QIMST.QIENDT) >2 THEN 1
			ELSE SUNSAIL_ST_QIMST.QIENDT
		END AS ItemPerDuration,
		SUNSAIL_ST_QIMST.QIFAMT AS ItemAmountLocal,
		CASE 
			WHEN SUNSAIL_ST_QIMST.QICLAS ='*' THEN 0
			WHEN SUNSAIL_ST_QIMST.QICLAS ='B' THEN SUNSAIL_ST_QIMST.QIFAMT * CASE WHEN LEN(SUNSAIL_ST_QIMST.QIQNTY) = 5 THEN 1 ELSE SUNSAIL_ST_QIMST.QIQNTY END
			WHEN SUNSAIL_ST_QIMST.QICLAS ='E' THEN SUNSAIL_ST_QIMST.QIFAMT * CASE WHEN LEN(SUNSAIL_ST_QIMST.QIQNTY) = 5 THEN 1 ELSE SUNSAIL_ST_QIMST.QIQNTY END * 
				CASE 
					WHEN LEN(SUNSAIL_ST_QIMST.QISTDT) = 8  AND LEN(SUNSAIL_ST_QIMST.QIENDT) = 8
			    THEN
					DATEDIFF(d,CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_QIMST.QISTDT),112)),
					CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_QIMST.QIENDT),112))) 
				ELSE
					0
				END
			 	WHEN SUNSAIL_ST_QIMST.QICLAS IN('P','C','K','I','T') THEN SUNSAIL_ST_QIMST.QIFAMT * 	
				CASE 
					WHEN SUNSAIL_ST_QIMST.QIENDT = 0 THEN 1
					WHEN LEN(SUNSAIL_ST_QIMST.QIENDT) >2 THEN 1
					ELSE SUNSAIL_ST_QIMST.QIENDT END 
				*
				CASE 
					WHEN SUNSAIL_ST_QIMST.QISTDT = 0 THEN 1
					WHEN LEN(SUNSAIL_ST_QIMST.QISTDT) >2 THEN 1
					ELSE SUNSAIL_ST_QIMST.QISTDT END
			 ELSE SUNSAIL_ST_QIMST.QIFAMT * CASE WHEN LEN(SUNSAIL_ST_QIMST.QIQNTY) = 5 THEN 1 ELSE SUNSAIL_ST_QIMST.QIQNTY END * 
				CASE 
					WHEN SUNSAIL_ST_QIMST.QICLAS IN ('A','B','D','E','F','G','J','L','M','N','Q','S','X','Z','*') THEN 1
					WHEN SUNSAIL_ST_QIMST.QIENDT = 0 THEN 1
					WHEN LEN(SUNSAIL_ST_QIMST.QIENDT) >2 THEN 1
					ELSE SUNSAIL_ST_QIMST.QIENDT END 
				*
				CASE 
					WHEN SUNSAIL_ST_QIMST.QICLAS IN ('A','B','D','E','F','G','J','L','M','N','Q','S','X','Z','*') THEN 1
					WHEN SUNSAIL_ST_QIMST.QISTDT = 0 THEN 1
					WHEN LEN(SUNSAIL_ST_QIMST.QISTDT) >2 THEN 1
					ELSE SUNSAIL_ST_QIMST.QISTDT END
		END AS TotalAmountLocal,
		CASE 
			WHEN SUNSAIL_ST_QIMST.QICLAS <>'*' THEN 0
			WHEN SUNSAIL_ST_QIMST.QICANC ='B' THEN SUNSAIL_ST_QIMST.QIFAMT * CASE WHEN LEN(SUNSAIL_ST_QIMST.QIQNTY) = 5 THEN 1 ELSE SUNSAIL_ST_QIMST.QIQNTY END
			WHEN SUNSAIL_ST_QIMST.QICANC ='E' THEN SUNSAIL_ST_QIMST.QIFAMT * CASE WHEN LEN(SUNSAIL_ST_QIMST.QIQNTY) = 5 THEN 1 ELSE SUNSAIL_ST_QIMST.QIQNTY END * 
				CASE 
					WHEN LEN(SUNSAIL_ST_QIMST.QISTDT) = 8  AND LEN(SUNSAIL_ST_QIMST.QIENDT) = 8
			    THEN
					DATEDIFF(d,CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_QIMST.QISTDT),112)),
					CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_Stage.dbo.fn_CheckDate(SUNSAIL_ST_QIMST.QIENDT),112))) 
				ELSE
					0
				END
			  WHEN SUNSAIL_ST_QIMST.QICANC IN('P','C','K','I','T') THEN SUNSAIL_ST_QIMST.QIFAMT * 	
				CASE 
					WHEN SUNSAIL_ST_QIMST.QIENDT = 0 THEN 1
					WHEN LEN(SUNSAIL_ST_QIMST.QIENDT) >2 THEN 1
					ELSE SUNSAIL_ST_QIMST.QIENDT END 
				*
				CASE 
					WHEN SUNSAIL_ST_QIMST.QISTDT = 0 THEN 1
					WHEN LEN(SUNSAIL_ST_QIMST.QISTDT) >2 THEN 1
					ELSE SUNSAIL_ST_QIMST.QISTDT END
			 ELSE SUNSAIL_ST_QIMST.QIFAMT * CASE WHEN LEN(SUNSAIL_ST_QIMST.QIQNTY) = 5 THEN 1 ELSE SUNSAIL_ST_QIMST.QIQNTY END * 
				CASE 
					WHEN SUNSAIL_ST_QIMST.QICANC IN ('A','B','D','E','F','G','J','L','M','N','Q','S','X','Z','*') THEN 1
					WHEN SUNSAIL_ST_QIMST.QIENDT = 0 THEN 1
					WHEN LEN(SUNSAIL_ST_QIMST.QIENDT) >2 THEN 1
					ELSE SUNSAIL_ST_QIMST.QIENDT END 
				*
				CASE 
					WHEN SUNSAIL_ST_QIMST.QICANC IN ('A','B','D','E','F','G','J','L','M','N','Q','S','X','Z','*') THEN 1
					WHEN SUNSAIL_ST_QIMST.QISTDT = 0 THEN 1
					WHEN LEN(SUNSAIL_ST_QIMST.QISTDT) >2 THEN 1
					ELSE SUNSAIL_ST_QIMST.QISTDT END
		END AS TotalAmountLocalForCancel,
		SUNSAIL_ST_QIMST.QIDISC AS Discount,
		SUNSAIL_ST_QIMST.QIFDSC AS DiscountLocal,
		SUNSAIL_ST_QIMST.QIFVAT AS VatLocal,
		SUNSAIL_ST_QIMST.QITAPR AS TApercent,
		SUNSAIL_ST_QIMST.QIFCOM AS CommissionLocal,
		CASE WHEN SUNSAIL_ST_QIMST.QICLAS ='F' THEN  SUNSAIL_ST_QIMST.QIFAMT * dbo.fn_GetSunsailTaxPC(QIETDT,QISTDT,QICLAS,QISCLS,QILOCT) ELSE 0 END AS TaxLocal,
		ISNULL(SUNSAIL_ST_QIMST.QIFAMT * 
			CASE WHEN SUNSAIL_ST_QIMST.QICLAS ='Q' AND SUNSAIL_ST_QIMST.QISCLS ='A' THEN CASE WHEN QISTDT = 0 THEN dbo.fn_GetTritonTipPC(QICNEN,QICNST,'A','',QILOCT)END 
			ELSE dbo.fn_GetTritonTipPC(QIETDT,QISTDT,QICLAS,QISCLS,QILOCT) END 
			+ CASE WHEN SUNSAIL_ST_QIMST.QICLAS ='A' OR (SUNSAIL_ST_QIMST.QICLAS ='Q' AND SUNSAIL_ST_QIMST.QISCLS ='A' ) THEN  SUNSAIL_ST_QIMST.QIFAMT * SUNSAIL_ST_BLMST.BLATPC ELSE 0 END,0) AS TipLocal,
		0 AS TotalAmountTaxTipsLocal,
		RTRIM(LTRIM(SUNSAIL_ST_QIMST.QIUSER)) AS LastAmendUser,
		RTRIM(LTRIM(SUNSAIL_ST_QIMST.QILOCT)) AS BaseLocation,
		RTRIM(LTRIM(SUNSAIL_ST_QNMST.QNDESG)) AS Currency,
		ISNULL(RTRIM(LTRIM(SB_MARINE_CODE.a_code)),RTRIM(LTRIM(SUNSAIL_ST_QIMST.QIOFID))) AS ExtraCode, 
		ISNULL(RTRIM(LTRIM(SB_MARINE_CODE.a_description)),RTRIM(LTRIM(SUNSAIL_ST_QIMST.QIDESC))) AS ExtraCodeDesc, 
		RTRIM(LTRIM(SUNSAIL_ST_QIMST.QIDESC)) AS ItemDesc,
		RTRIM(LTRIM(SB_MARINE_TYPE.a_RevenueTypeCode)) AS RevenueTypeCode,
		RTRIM(LTRIM(SB_MARINE_TYPE.a_RevenueType)) AS RevenueType,
		RTRIM(LTRIM(SB_MARINE_SUBTYPE.a_RevenueSubTypeCode)) AS RevenueSubTypeCode,
		RTRIM(LTRIM(SB_MARINE_SUBTYPE.a_RevenueSubType)) AS RevenueSubType,
		RTRIM(LTRIM(SUNSAIL_ST_QIMST.QICLAS)) AS ClassCode,
		RTRIM(LTRIM(SB_MARINE_CLASS.a_Description)) AS Class,
		RTRIM(LTRIM(SUNSAIL_ST_QIMST.QISCLS)) AS SubClassCode,
		RTRIM(LTRIM(SB_MARINE_SUBCLASS.a_SubClassDescription)) AS SubClass,
		RTRIM(LTRIM(SUNSAIL_ST_QIMST.QICANC)) AS OriginalClassCode,
		RTRIM(LTRIM(SB_MARINE_ORCLASS.a_Description)) AS OriginalClass,  
		RTRIM(LTRIM(SUNSAIL_ST_QIMST.QIEXTR)) AS ExtraNotes,
		NULL AS DepAirport,
		NULL AS ArrAirport,
		SUNSAIL_ST_PTMST.PTCMNB AS GLCompany,
		SUNSAIL_ST_PTMST.PTDPNB AS GLDepartment,
		SUNSAIL_ST_PTMST.PTATNB AS GLAccount
	FROM 
		SUNSAIL_ST_QIMST
	INNER JOIN 
		SUNSAIL_ST_QNMST
		ON 
			SUNSAIL_ST_QNMST.QNNUMB = SUNSAIL_ST_QIMST.QICNNB
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_TYPE SB_MARINE_TYPE
		ON
			SB_MARINE_TYPE.a_RevenueTypeCode =  SUNSAIL_ST_QIMST.QICLAS
			AND
			SB_MARINE_TYPE.a_SystemSourceID = 101
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_SUBTYPE SB_MARINE_SUBTYPE
		ON
			SB_MARINE_SUBTYPE.i_FK_RevenueTypeID = SB_MARINE_TYPE.i_SK_RevenueTypeID
			AND
			SB_MARINE_SUBTYPE.a_RevenueSubTypeCode = SUNSAIL_ST_QIMST.QISCLS
			AND
			SB_MARINE_SUBTYPE.a_SystemSourceID = 101
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_CODE SB_MARINE_CODE
		ON
			SB_MARINE_CODE.a_code = SUNSAIL_ST_QIMST.QIOFID
			AND
			SB_MARINE_CODE.a_SystemSourceID = 101
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_CLASS SB_MARINE_CLASS
		ON
			SB_MARINE_CLASS.a_Class = SUNSAIL_ST_QIMST.QICLAS
			AND
			SB_MARINE_CLASS.a_SystemSourceID = 101
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_SUBCLASS SB_MARINE_SUBCLASS
		ON
			SB_MARINE_SUBCLASS.i_FK_ClassID = SB_MARINE_CLASS.i_SK_ClassID
			AND
			SB_MARINE_SUBCLASS.a_SubClass = SUNSAIL_ST_QIMST.QISCLS
			AND
			SB_MARINE_SUBCLASS.a_SystemSourceID = 101
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_CLASS SB_MARINE_ORCLASS
		ON
			SB_MARINE_ORCLASS.a_Class = SUNSAIL_ST_QIMST.QICANC
			AND
			SB_MARINE_ORCLASS.a_SystemSourceID = 101
	LEFT JOIN
		AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_START 
		ON
			CONF_DT_CALENDAR_START.i_SK_Calendar = SUNSAIL_ST_QNMST.QNSTDT
	LEFT JOIN 
		SUNSAIL_ST_BLMST
		ON
			SUNSAIL_ST_QIMST.QILOCT = SUNSAIL_ST_BLMST.BLLOCT
	LEFT JOIN
		SUNSAIL_ST_PTMST
		ON
			SUNSAIL_ST_QIMST.QIOFID = SUNSAIL_ST_PTMST.PTCDRF 
			AND
			SUNSAIL_ST_QIMST.QILOCT = SUNSAIL_ST_PTMST.PTLOCT
	WHERE 
		CONF_DT_CALENDAR_START.a_Year >= 2010


	EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'TRTN','ST_FITNQ'







GO
/****** Object:  StoredProcedure [dbo].[BUILD_ST_MARINE_FLIGHTINVENTORY]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[BUILD_ST_MARINE_FLIGHTINVENTORY]
AS

	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'TRTN','ST_FLINV','BUILD_ST_MARINE_FLIGHTINVENTORY'

	TRUNCATE TABLE ST_MARINE_FLIGHTINVENTORY
		
	INSERT INTO 
		ST_MARINE_FLIGHTINVENTORY
	SELECT
		ST_MARINE_FLIGHTINVENTORY_ALL.*
	FROM
		ST_MARINE_FLIGHTINVENTORY_ALL
	INNER JOIN
			ST_MARINE_PAXFLIGHT
			ON
				ST_MARINE_PAXFLIGHT.i_SK_Bkg = ST_MARINE_FLIGHTINVENTORY_ALL.i_SK_Bkg
				AND
				 ST_MARINE_PAXFLIGHT.i_SK_Pax = ST_MARINE_FLIGHTINVENTORY_ALL.i_SK_Pax
				AND
				ST_MARINE_PAXFLIGHT.FlightNumber = ST_MARINE_FLIGHTINVENTORY_ALL.FlightNumber
	WHERE 
		ST_MARINE_FLIGHTINVENTORY_ALL.i_SK_Bkg <>0
		
		
	INSERT INTO 
		ST_MARINE_FLIGHTINVENTORY
	SELECT
		ST_MARINE_FLIGHTINVENTORY_ALL.*
	FROM
		ST_MARINE_FLIGHTINVENTORY_ALL
	WHERE
		ST_MARINE_FLIGHTINVENTORY_ALL.i_SK_Bkg = 0 		

	EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'TRTN','ST_FLINV'
	 
  
  
 
GO
/****** Object:  StoredProcedure [dbo].[BUILD_ST_MARINE_FLIGHTINVENTORY_ALL]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[BUILD_ST_MARINE_FLIGHTINVENTORY_ALL]
AS

	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'TRTN','ST_FLINVALL','BUILD_ST_MARINE_FLIGHTINVENTORY_ALL'

	TRUNCATE TABLE ST_MARINE_FLIGHTINVENTORY_ALL	

	INSERT INTO 
		ST_MARINE_FLIGHTINVENTORY_ALL
	SELECT 
		CONVERT(VARCHAR(10),FLNUMBER) + ISNULL(RIGHT('00' + SUNSAIL_ST_FLALLOC.ALALVALU ,2),'00') AS i_SK_FltInv,
		FLNUMBER AS FlightNumber, 
		101 AS SourceSyID,
		'SUN' AS BrandCode,
		0 AS i_SK_Bkg,
		0 AS BkgRef,
		0 AS i_SK_Pax,
		NULL AS OptionDate,
		NULL AS ConfirmDate,
		ISNULL(LTRIM(RTRIM(SUNSAIL_ST_FLALLOC.ALALVALU)),0) AS NoDays,
		LTRIM(RTRIM(FLTYPE)) AS FltType,
		LTRIM(RTRIM(FLREF)) AS FlightRef,
		LTRIM(RTRIM(FLCARRIER)) + LTRIM(RTRIM(FLREF)) AS FlightCd,
		LTRIM(RTRIM(FLCARRIER)) AS Carrier,
		LTRIM(RTRIM(FLLOCATOR)) AS Locator,
		LTRIM(RTRIM(FLOUTORIN)) AS InOutFlag,
		FLSEATPRC AS SeatPrice,
		--FLSCSEATP AS ChildSeatPrice,-----------------DROPPED --but will keep as nulls mi-1038
		NULL as ChildSeatPrice,
		LTRIM(RTRIM(FLDPARPT)) AS DepAirport,
		FLDPDATE AS DepDate,
		FLDPTIME AS DepTime,
		LTRIM(RTRIM(FLARARPT)) AS ArrAirport,
		FLARDATE AS ArrDate,
		FLARTIME AS ArrTime,
		FLDPNO AS DepNo,
		--LTRIM(RTRIM(FLORGIN)) AS Origin,--------------DROPPED --but will keep as nulls mi-1038
		NULL as Origin,
		FLTOTSEAT AS SUMTotalSeats,
		FLOPTION AS SUMOptionSeats,
		FLCONFD AS SUMConfirmSeats,
		FLWAIT AS SUMWaitSeats,
		FLFREE AS SUMFreeSeats,
		SUNSAIL_ST_FLALLOC.ALTOTSEAT AS TotalSeats,
		SUNSAIL_ST_FLALLOC.ALOPTSEAT AS OptionSeats,
		SUNSAIL_ST_FLALLOC.ALCONSEAT AS ConfirmSeats,
		SUNSAIL_ST_FLALLOC.ALWAISEAT AS WaitSeats,
		SUNSAIL_ST_FLALLOC.ALFRESEAT AS FreeSeats,
		SUNSAIL_ST_FLALLOC_BB.ALTOTSEAT AS BB_TotalSeats,
		SUNSAIL_ST_FLALLOC_BB.ALOPTSEAT AS BB_OptionSeats,
		SUNSAIL_ST_FLALLOC_BB.ALCONSEAT AS BB_ConfirmSeats,
		SUNSAIL_ST_FLALLOC_BB.ALWAISEAT AS BB_WaitSeats,
		SUNSAIL_ST_FLALLOC_BB.ALFRESEAT AS BB_FreeSeats,
		SUNSAIL_ST_FLALLOC_FO.ALTOTSEAT AS FO_TotalSeats,
		SUNSAIL_ST_FLALLOC_FO.ALOPTSEAT AS FO_OptionSeats,
		SUNSAIL_ST_FLALLOC_FO.ALCONSEAT AS FO_ConfirmSeats,
		SUNSAIL_ST_FLALLOC_FO.ALWAISEAT AS FO_WaitSeats,
		SUNSAIL_ST_FLALLOC_FO.ALFRESEAT AS FO_FreeSeats,
		SUNSAIL_ST_FLALLOC_FL.ALTOTSEAT AS FL_TotalSeats,
		SUNSAIL_ST_FLALLOC_FL.ALOPTSEAT AS FL_OptionSeats,
		SUNSAIL_ST_FLALLOC_FL.ALCONSEAT AS FL_ConfirmSeats,
		SUNSAIL_ST_FLALLOC_FL.ALWAISEAT AS FL_WaitSeats,
		SUNSAIL_ST_FLALLOC_FL.ALFRESEAT AS FL_FreeSeats,
		SUNSAIL_ST_FLALLOC_CL.ALTOTSEAT AS CL_TotalSeats,
		SUNSAIL_ST_FLALLOC_CL.ALOPTSEAT AS CL_OptionSeats,
		SUNSAIL_ST_FLALLOC_CL.ALCONSEAT AS CL_ConfirmSeats,
		SUNSAIL_ST_FLALLOC_CL.ALWAISEAT AS CL_WaitSeats,
		SUNSAIL_ST_FLALLOC_CL.ALFRESEAT AS CL_FreeSeats,
		FLFTOTSEAT AS FOTotalSeats,
		FLFOPTION AS FOOptionSeats,
		FLFCONFD AS FOConfirmSeats,
		FLFWAIT AS FOWaitSeats, 
		FLFFREE AS FOFreeSeats,
		LTRIM(RTRIM(FLTICKETS)) AS Ticket,
		LTRIM(RTRIM(FLMANIFEST)) AS Manifest,
		LTRIM(RTRIM(FLBAGGAGE)) AS Baggage,
		FLCKINTIME AS CheckInTime,
		LTRIM(RTRIM(FLCKINTERM)) AS CheckInTerminal,
		LTRIM(RTRIM(FLROUT)) AS FlightRoute,
		FLMAX7DAY AS Max7Day,
		FL7DAYREM AS [7DayRemain],
		LTRIM(RTRIM(FL7DAYSTOP)) AS [7DayStop],
		FLFMAX7DAY AS FO_Max7Day,
		FLF7DAYREM AS FO_7DayRemain,
		LTRIM(RTRIM(FLF7DAYSTP)) AS FO_7DayStop,
		--FLCOLORS AS Colors,-------------DROPPED --but will keep as nulls mi-1038
		NULL as Colors,
		LTRIM(RTRIM(FLCLASS)) As Class,
		LTRIM(RTRIM(FLINTUSE)) AS InternetUse,
		LTRIM(RTRIM(FLINUSE)) AS InUse,
		FLLASTALC# AS LastAlloc,
		FLTOTONFIT AS TotalOnFlight,
		FLOPTONFIT AS OptionOnFlight,
		FLCNFONFIT AS ConfirmOnFlight,
		FLWAIONFIT AS WaitOnFlight,
		FLFREONFIT AS FreeOnFlight,
		FLHASALTN AS HasAlternative,
		FLONREQUST As OnRequest,
		FLCOST1 AS Cost,
		FLCOST2 AS Cost2,
		--FLCOST1SC AS ChildCost,--------------DROPPED --but will keep as nulls mi-1038
		NULL as Childcost,
		--FLCOST2SC AS ChildCost2,-------------DROPPED --but will keep as nulls mi-1038
		NULL as Childcost2,
		LTRIM(RTRIM(FLUSID)) As UserID,
		FLBKNG as SourceOffice,
		FLPLTFRM as SalesPlatform
	FROM 
		SUNSAIL_ST_FLFLTMST
	LEFT  JOIN
		(
		SELECT  
			ALFLTNO,
			MAX(ALALLOC#) AS ALALLOC,
			ALALVALU
		FROM 
			SUNSAIL_ST_FLALLOC
		WHERE 
			ALALCCDE = 'D'
		GROUP BY
			ALFLTNO,
			ALALVALU
		)VW_SUNSAIL_ST_FLALLOC
			ON
				VW_SUNSAIL_ST_FLALLOC.ALFLTNO = SUNSAIL_ST_FLFLTMST.FLNUMBER
	LEFT JOIN
		SUNSAIL_ST_FLALLOC
		ON
			SUNSAIL_ST_FLALLOC.ALFLTNO = VW_SUNSAIL_ST_FLALLOC.ALFLTNO
			AND
			SUNSAIL_ST_FLALLOC.ALALVALU = VW_SUNSAIL_ST_FLALLOC.ALALVALU
			AND
			SUNSAIL_ST_FLALLOC.ALALLOC# = VW_SUNSAIL_ST_FLALLOC.ALALLOC
	LEFT JOIN
		(
		SELECT  
			ALFLTNO,
			MAX(ALALLOC#) AS ALALLOC,
			ALPRALC,
			ALALVALU
		FROM 
			SUNSAIL_ST_FLALLOC
		WHERE 
			ALALVALU = 'BB' 
		GROUP BY
			ALFLTNO,
			ALPRALC,
			ALALVALU
		)VW_SUNSAIL_ST_FLALLOC_BB
		ON
			VW_SUNSAIL_ST_FLALLOC_BB.ALFLTNO = SUNSAIL_ST_FLALLOC.ALFLTNO
			AND
			VW_SUNSAIL_ST_FLALLOC_BB.ALPRALC = SUNSAIL_ST_FLALLOC.ALALLOC#
	LEFT JOIN
		SUNSAIL_ST_FLALLOC SUNSAIL_ST_FLALLOC_BB
		ON
			SUNSAIL_ST_FLALLOC_BB.ALFLTNO = VW_SUNSAIL_ST_FLALLOC_BB.ALFLTNO
			AND
			SUNSAIL_ST_FLALLOC_BB.ALALVALU = VW_SUNSAIL_ST_FLALLOC_BB.ALALVALU
			AND
			SUNSAIL_ST_FLALLOC_BB.ALALLOC# = VW_SUNSAIL_ST_FLALLOC_BB.ALALLOC
	LEFT JOIN
		(
		SELECT  
			ALFLTNO,
			MAX(ALALLOC#) AS ALALLOC,
			ALPRALC,
			ALALVALU
		FROM 
			SUNSAIL_ST_FLALLOC
		WHERE 
			ALALVALU = 'FO'
		GROUP BY
			ALFLTNO,
			ALPRALC,
			ALALVALU
		)VW_SUNSAIL_ST_FLALLOC_FO
		ON
			VW_SUNSAIL_ST_FLALLOC_FO.ALFLTNO = SUNSAIL_ST_FLALLOC.ALFLTNO
			AND
			VW_SUNSAIL_ST_FLALLOC_FO.ALPRALC = SUNSAIL_ST_FLALLOC.ALALLOC#	
	LEFT JOIN
		SUNSAIL_ST_FLALLOC SUNSAIL_ST_FLALLOC_FO
		ON
			SUNSAIL_ST_FLALLOC_FO.ALFLTNO = VW_SUNSAIL_ST_FLALLOC_FO.ALFLTNO
			AND
			SUNSAIL_ST_FLALLOC_FO.ALALVALU = VW_SUNSAIL_ST_FLALLOC_FO.ALALVALU
			AND
			SUNSAIL_ST_FLALLOC_FO.ALALLOC# = VW_SUNSAIL_ST_FLALLOC_FO.ALALLOC
	LEFT JOIN
		(
		SELECT  
			ALFLTNO,
			MAX(ALALLOC#) AS ALALLOC,
			ALPRALC,
			ALALVALU
		FROM 
			SUNSAIL_ST_FLALLOC
		WHERE 
			ALALVALU = 'FL'
		GROUP BY
			ALFLTNO,
			ALPRALC,
			ALALVALU
		)VW_SUNSAIL_ST_FLALLOC_FL
		ON
			VW_SUNSAIL_ST_FLALLOC_FL.ALFLTNO = SUNSAIL_ST_FLALLOC.ALFLTNO
			AND
			VW_SUNSAIL_ST_FLALLOC_FL.ALPRALC = SUNSAIL_ST_FLALLOC.ALALLOC#	
	LEFT JOIN
		SUNSAIL_ST_FLALLOC SUNSAIL_ST_FLALLOC_FL
		ON
			SUNSAIL_ST_FLALLOC_FL.ALFLTNO = VW_SUNSAIL_ST_FLALLOC_FL.ALFLTNO
			AND
			SUNSAIL_ST_FLALLOC_FL.ALALVALU = VW_SUNSAIL_ST_FLALLOC_FL.ALALVALU
			AND
			SUNSAIL_ST_FLALLOC_FL.ALALLOC# = VW_SUNSAIL_ST_FLALLOC_FL.ALALLOC
	LEFT JOIN
		(
		SELECT  
			ALFLTNO,
			MAX(ALALLOC#) AS ALALLOC,
			ALPRALC,
			ALALVALU
		FROM 
			SUNSAIL_ST_FLALLOC
		WHERE 
			ALALVALU = 'CL'
		GROUP BY
			ALFLTNO,
			ALPRALC,
			ALALVALU
		)VW_SUNSAIL_ST_FLALLOC_CL
		ON
			VW_SUNSAIL_ST_FLALLOC_CL.ALFLTNO = SUNSAIL_ST_FLALLOC.ALFLTNO
			AND
			VW_SUNSAIL_ST_FLALLOC_CL.ALPRALC = SUNSAIL_ST_FLALLOC.ALALLOC#	
	LEFT JOIN
		SUNSAIL_ST_FLALLOC SUNSAIL_ST_FLALLOC_CL
		ON
			SUNSAIL_ST_FLALLOC_CL.ALFLTNO = VW_SUNSAIL_ST_FLALLOC_CL.ALFLTNO
			AND
			SUNSAIL_ST_FLALLOC_CL.ALALVALU = VW_SUNSAIL_ST_FLALLOC_CL.ALALVALU
			AND
			SUNSAIL_ST_FLALLOC_CL.ALALLOC# = VW_SUNSAIL_ST_FLALLOC_CL.ALALLOC
	WHERE 
		FLDPDATE > 20100101
		
	INSERT INTO 
		ST_MARINE_FLIGHTINVENTORY_ALL
	SELECT 
		CONVERT(VARCHAR(10),FLNUMBER) + ISNULL(RIGHT('00' + SUNSAIL_ST_FLALLOC.ALALVALU ,2),'00') AS i_SK_FltInv,
		FLNUMBER AS FlightNumber, 
		101 AS SourceSyID,
		ST_MARINE_FBKG.BrandCode,
        ST_MARINE_FBKG.i_SK_Bkg AS i_SK_Bkg,
		RFNUMB AS BkgRef,
		MARINE_PAXFLIGHT.i_SK_Pax AS i_SK_Pax,
		ST_MARINE_FBKG.OptionDate AS OptionDate,
		ST_MARINE_FBKG.ConfirmDate AS ConfirmDate,
		ISNULL(LTRIM(RTRIM(SUNSAIL_ST_FLALLOC.ALALVALU)),0) AS NoDays,
		LTRIM(RTRIM(FLTYPE)) AS FltType,
		LTRIM(RTRIM(FLREF)) AS FlightRef,
		LTRIM(RTRIM(FLCARRIER)) + LTRIM(RTRIM(FLREF)) AS FlightCd,
		LTRIM(RTRIM(FLCARRIER)) AS Carrier,
		LTRIM(RTRIM(FLLOCATOR)) AS Locator,
		LTRIM(RTRIM(FLOUTORIN)) AS InOutFlag,
		FLSEATPRC AS SeatPrice,
		--FLSCSEATP AS ChildSeatPrice,-------------------------DROPPED --but will keep as nulls mi-1038
		NULL asChildSeatPrice,
		LTRIM(RTRIM(FLDPARPT)) AS DepAirport,
		FLDPDATE AS DepDate,
		FLDPTIME AS DepTime,
		LTRIM(RTRIM(FLARARPT)) AS ArrAirport,
		FLARDATE AS ArrDate,
		FLARTIME AS ArrTime,
		FLDPNO AS DepNo,
		--LTRIM(RTRIM(FLORGIN)) AS Origin,-------------------DROPPED --but will keep as nulls mi-1038
		NULL as Origin,
		NULL AS SUMTotalSeats,
		NULL AS SUMOptionSeats,
		NULL AS SUMConfirmSeats,
		NULL AS SUMWaitSeats,
		NULL AS SUMFreeSeats,
		NULL AS TotalSeats,
		CASE WHEN ST_MARINE_FBKG.BookingStatusID = 1 THEN 1 ELSE 0 END AS OptionSeats,
		CASE WHEN ST_MARINE_FBKG.BookingStatusID = 3 THEN 1 ELSE 0 END AS ConfirmSeats,
		NULL AS WaitSeats,
		NULL AS FreeSeats,
		NULL AS BB_TotalSeats,
		CASE WHEN ST_MARINE_FBKG.BookingStatusID = 1 AND BookingType IN ('Bareboat')
			 THEN 1 ELSE 0 END AS BB_OptionSeats,
		CASE WHEN ST_MARINE_FBKG.BookingStatusID = 3 AND BookingType IN ('Bareboat') 
			 THEN 1 ELSE 0 END AS BB_ConfirmSeats,
		NULL AS BB_WaitSeats,
		NULL AS BB_FreeSeats,
		NULL AS FO_TotalSeats,
		CASE WHEN ST_MARINE_FBKG.BookingStatusID = 1 AND BookingType IN ('Flight Only')
			 THEN 1 ELSE 0 END AS FO_OptionSeats,
		CASE WHEN ST_MARINE_FBKG.BookingStatusID = 3 AND BookingType IN ('Flight Only') 
			 THEN 1 ELSE 0 END AS FO_ConfirmSeats,
		NULL AS FO_WaitSeats,
		NULL AS FO_FreeSeats,
		NULL AS FL_TotalSeats,
		CASE WHEN ST_MARINE_FBKG.BookingStatusID = 1 AND BookingType IN ('Flotilla')
			 THEN 1 ELSE 0 END AS BFL_OptionSeats,
		CASE WHEN ST_MARINE_FBKG.BookingStatusID = 3 AND BookingType IN ('Flotilla') 
			 THEN 1 ELSE 0 END AS FL_ConfirmSeats,
		NULL AS FL_WaitSeats,
		NULL AS FL_FreeSeats,
			NULL AS FL_TotalSeats,
		CASE WHEN ST_MARINE_FBKG.BookingStatusID = 1 AND BookingType IN ('Club/Flotilla','Club')
			 THEN 1 ELSE 0 END AS BFL_OptionSeats,
		CASE WHEN ST_MARINE_FBKG.BookingStatusID = 3 AND BookingType IN ('Club/Flotilla','Club') 
			 THEN 1 ELSE 0 END AS FL_ConfirmSeats,
		NULL AS FL_WaitSeats,
		NULL AS FL_FreeSeats,
		NULL AS FOTotalSeats,
		NULL AS FOOptionSeats,
		NULL AS FOConfirmSeats,
		NULL AS FOWaitSeats, 
		NULL AS FOFreeSeats,
		NULL AS Ticket,
		NULL AS Manifest,
		LTRIM(RTRIM(FLBAGGAGE)) AS Baggage,
		FLCKINTIME AS CheckInTime,
		LTRIM(RTRIM(FLCKINTERM)) AS CheckInTerminal,
		LTRIM(RTRIM(FLROUT)) AS FlightRoute,
		NULL AS Max7Day,
		NULL AS [7DayRemain],
		NULL AS [7DayStop],
		NULL AS FO_Max7Day,
		NULL AS FO_7DayRemain,
		NULL AS FO_7DayStop,
		NULL AS Colors,
		NULL As Class,
		NULL AS InternetUse,
		NULL AS InUse,
		NULL AS LastAlloc,
		NULL AS TotalOnFlight,
		NULL AS OptionOnFlight,
		NULL AS ConfirmOnFlight,
		NULL AS WaitOnFlight,
		NULL AS FreeOnFlight,
		NULL AS HasAlternative,
		NULL As OnRequest,
		FLCOST1 AS Cost,
		FLCOST2 AS Cost2,
		--FLCOST1SC AS ChildCost,----------------DROPPED --but will keep as nulls mi-1038
		NULL as Childcost,
		--FLCOST2SC AS ChildCost2,---------------DROPPED --but will keep as nulls mi-1038
		NULL as Childcost2,
		NULL As UserID,
		NULL as SourceOffice,
		NULL as SalesPlatform
	FROM 
		SUNSAIL_ST_FLFLTMST
	LEFT  JOIN
		(
		SELECT  
			ALFLTNO,
			MAX(ALALLOC#) AS ALALLOC,
			ALALVALU
		FROM 
			SUNSAIL_ST_FLALLOC
		WHERE 
			ALALCCDE = 'D'
		GROUP BY
			ALFLTNO,
			ALALVALU
		)VW_SUNSAIL_ST_FLALLOC
			ON
				VW_SUNSAIL_ST_FLALLOC.ALFLTNO = SUNSAIL_ST_FLFLTMST.FLNUMBER
	LEFT JOIN
		SUNSAIL_ST_FLALLOC
		ON
			SUNSAIL_ST_FLALLOC.ALFLTNO = VW_SUNSAIL_ST_FLALLOC.ALFLTNO
			AND
			SUNSAIL_ST_FLALLOC.ALALVALU = VW_SUNSAIL_ST_FLALLOC.ALALVALU
			AND
			SUNSAIL_ST_FLALLOC.ALALLOC# = VW_SUNSAIL_ST_FLALLOC.ALALLOC
	INNER JOIN
		SUNSAIL_ST_FLFLREF
		ON
			SUNSAIL_ST_FLFLTMST.FLNUMBER = SUNSAIL_ST_FLFLREF.RFFNBR
	INNER JOIN
		ST_MARINE_FBKG
		ON
			ST_MARINE_FBKG.BkgRef = SUNSAIL_ST_FLFLREF.RFNUMB
			AND
			ST_MARINE_FBKG.SourceSysID = 101
	INNER JOIN 
		(
			SELECT 
				OUT_ST_MARINE_PAXFLIGHT.i_SK_Bkg,
				OUT_ST_MARINE_PAXFLIGHT.i_SK_Pax,
				OUT_ST_MARINE_PAXFLIGHT.BkgRef,
				OUT_ST_MARINE_PAXFLIGHT.SourceSysID,
				DATEDIFF(d,CONVERT(DATETIME,CONVERT(VARCHAR(8),BRAINII.dbo.fn_CheckDate(OUT_ST_MARINE_PAXFLIGHT.MinDepartDate),112)),
				CONVERT(DATETIME,CONVERT(VARCHAR(8),BRAINII.dbo.fn_CheckDate(IN_ST_MARINE_PAXFLIGHT.MinDepartDate),112))) AS FlightHolidayDuration
			FROM 
				(	
				SELECT 
					i_SK_Bkg,
					i_SK_Pax,
					BkgRef,
					SourceSysID,
					MIN(DepartDate) AS MinDepartDate
				FROM
					ST_MARINE_PAXFLIGHT
				WHERE 
					OutInFlag ='O'		
				GROUP BY 
					i_SK_Bkg,
					i_SK_Pax,
					BkgRef,
					SourceSysID
				)OUT_ST_MARINE_PAXFLIGHT
				LEFT JOIN
				(
				SELECT 
					i_SK_Bkg,
					i_SK_Pax,
					BkgRef,
					SourceSysID,
					MIN(DepartDate) AS MinDepartDate
				FROM
					ST_MARINE_PAXFLIGHT
				WHERE 
					OutInFlag ='I'		
				GROUP BY 
					i_SK_Bkg,
					i_SK_Pax,
					BkgRef,
					SourceSysID
				)IN_ST_MARINE_PAXFLIGHT
			ON
				OUT_ST_MARINE_PAXFLIGHT.i_SK_Bkg = IN_ST_MARINE_PAXFLIGHT.i_SK_Bkg 
				AND
				OUT_ST_MARINE_PAXFLIGHT.i_SK_Pax = IN_ST_MARINE_PAXFLIGHT.i_SK_Pax 
		)MARINE_PAXFLIGHT
		ON
			MARINE_PAXFLIGHT.BkgRef =  SUNSAIL_ST_FLFLREF.RFNUMB	
			AND
			MARINE_PAXFLIGHT.SourceSysID = 101
			AND
			MARINE_PAXFLIGHT.FlightHolidayDuration = ISNULL(LTRIM(RTRIM(SUNSAIL_ST_FLALLOC.ALALVALU)),0) 
	WHERE 
		FLDPDATE > 20100101
			
			
			
	INSERT INTO 
		ST_MARINE_FLIGHTINVENTORY_ALL
	SELECT 
		CONVERT(VARCHAR(10),FLNUMBER) + ISNULL(RIGHT('00' + TRITON_ST_FLALLOC.ALALVALU ,2),'00') AS i_SK_FltInv,
		FLNUMBER AS FlightNumber, 	
		102 AS SourceSyID,	
		'MRG' AS BrandCode,
		0 AS i_SK_Bkg,
		0 AS BkgRef,
		0 AS i_SK_Pax,
		NULL AS OptionDate,
		NULL AS ConfirmDate,
		ISNULL(LTRIM(RTRIM(TRITON_ST_FLALLOC.ALALVALU)),0) AS NoDays,
		LTRIM(RTRIM(FLTYPE)) AS FltType,
		LTRIM(RTRIM(FLREF)) AS FlightRef,
		LTRIM(RTRIM(FLCARRIER)) + LTRIM(RTRIM(FLREF)) AS FlightCd,
		LTRIM(RTRIM(FLCARRIER)) AS Carrier,
		LTRIM(RTRIM(FLLOCATOR)) AS Locator,
		LTRIM(RTRIM(FLOUTORIN)) AS InOutFlag,
		FLSEATPRC AS SeatPrice,
		--FLSCSEATP AS ChildSeatPrice,-----------------------DROPPED --but will keep as nulls mi-1038
		NULL as Childseatprice,		
		LTRIM(RTRIM(FLDPARPT)) AS DepAirport,
		FLDPDATE AS DepDate,
		FLDPTIME AS DepTime,
		LTRIM(RTRIM(FLARARPT)) AS ArrAirport,
		FLARDATE AS ArrDate,
		FLARTIME AS ArrTime,
		FLDPNO AS DepNo,
		--LTRIM(RTRIM(FLORGIN)) AS Origin,-----------------DROPPED --but will keep as nulls mi-1038
		NULL as Origin,
		FLTOTSEAT AS SUMTotalSeats,
		FLOPTION AS SUMOptionSeats,
		FLCONFD AS SUMConfirmSeats,
		FLWAIT AS SUMWaitSeats,
		FLFREE AS SUMFreeSeats,
		TRITON_ST_FLALLOC.ALTOTSEAT AS TotalSeats,
		TRITON_ST_FLALLOC.ALOPTSEAT AS OptionSeats,
		TRITON_ST_FLALLOC.ALCONSEAT AS ConfirmSeats,
		TRITON_ST_FLALLOC.ALWAISEAT AS WaitSeats,
		TRITON_ST_FLALLOC.ALFRESEAT AS FreeSeats,
		TRITON_ST_FLALLOC_BB.ALTOTSEAT AS BB_TotalSeats,
		TRITON_ST_FLALLOC_BB.ALOPTSEAT AS BB_OptionSeats,
		TRITON_ST_FLALLOC_BB.ALCONSEAT AS BB_ConfirmSeats,
		TRITON_ST_FLALLOC_BB.ALWAISEAT AS BB_WaitSeats,
		TRITON_ST_FLALLOC_BB.ALFRESEAT AS BB_FreeSeats,
		TRITON_ST_FLALLOC_FO.ALTOTSEAT AS FO_TotalSeats,
		TRITON_ST_FLALLOC_FO.ALOPTSEAT AS FO_OptionSeats,
		TRITON_ST_FLALLOC_FO.ALCONSEAT AS FO_ConfirmSeats,
		TRITON_ST_FLALLOC_FO.ALWAISEAT AS FO_WaitSeats,
		TRITON_ST_FLALLOC_FO.ALFRESEAT AS FO_FreeSeats,
		TRITON_ST_FLALLOC_FL.ALTOTSEAT AS FL_TotalSeats,
		TRITON_ST_FLALLOC_FL.ALOPTSEAT AS FL_OptionSeats,
		TRITON_ST_FLALLOC_FL.ALCONSEAT AS FL_ConfirmSeats,
		TRITON_ST_FLALLOC_FL.ALWAISEAT AS FL_WaitSeats,
		TRITON_ST_FLALLOC_FL.ALFRESEAT AS FL_FreeSeats,
		TRITON_ST_FLALLOC_FL.ALTOTSEAT AS CL_TotalSeats,
		TRITON_ST_FLALLOC_FL.ALOPTSEAT AS CL_OptionSeats,
		TRITON_ST_FLALLOC_FL.ALCONSEAT AS CL_ConfirmSeats,
		TRITON_ST_FLALLOC_FL.ALWAISEAT AS CL_WaitSeats,
		TRITON_ST_FLALLOC_FL.ALFRESEAT AS CL_FreeSeats,
		FLFTOTSEAT AS FOTotalSeats,
		FLFOPTION AS FOOptionSeats,
		FLFCONFD AS FOConfirmSeats,
		FLFWAIT AS FOWaitSeats, 
		FLFFREE AS FOFreeSeats,
		LTRIM(RTRIM(FLTICKETS)) AS Ticket,
		LTRIM(RTRIM(FLMANIFEST)) AS Manifest,
		LTRIM(RTRIM(FLBAGGAGE)) AS Baggage,
		FLCKINTIME AS CheckInTime,
		LTRIM(RTRIM(FLCKINTERM)) AS CheckInTerminal,
		LTRIM(RTRIM(FLROUT)) AS FlightRoute,
		FLMAX7DAY AS Max7Day,
		FL7DAYREM AS [7DayRemain],
		LTRIM(RTRIM(FL7DAYSTOP)) AS [7DayStop],
		FLFMAX7DAY AS FO_Max7Day,
		FLF7DAYREM AS FO_7DayRemain,
		LTRIM(RTRIM(FLF7DAYSTP)) AS FO_7DayStop,
		--FLCOLORS AS Colors,--------------DROPPED --but will keep as nulls mi-1038
		NULL as Colors,
		LTRIM(RTRIM(FLCLASS)) As Class,
		LTRIM(RTRIM(FLINTUSE)) AS InternetUse,
		LTRIM(RTRIM(FLINUSE)) AS InUse,
		FLLASTALC# AS LastAlloc,
		FLTOTONFIT AS TotalOnFlight,
		FLOPTONFIT AS OptionOnFlight,
		FLCNFONFIT AS ConfirmOnFlight,
		FLWAIONFIT AS WaitOnFlight,
		FLFREONFIT AS FreeOnFlight,
		FLHASALTN AS HasAlternative,
		FLONREQUST As OnRequest,
		FLCOST1 AS Cost,
		FLCOST2 AS Cost2,
		--FLCOST1SC AS ChildCost,-----------------DROPPED --but will keep as nulls mi-1038
		NULL as Childcost,
		--FLCOST2SC AS ChildCost2,----------------DROPPED --but will keep as nulls mi-1038
		NULL as Childcost2,
		LTRIM(RTRIM(FLUSID)) As UserID,
		FLBKNG as SourceOffice,
		FLPLTFRM as SalesPlatform
	FROM 
		TRITON_ST_FLFLTMST
	LEFT  JOIN
		(
		SELECT  
			ALFLTNO,
			MAX(ALALLOC#) AS ALALLOC,
			ALALVALU
		FROM 
			TRITON_ST_FLALLOC
		WHERE 
			ALALCCDE = 'D'
		GROUP BY
			ALFLTNO,
			ALALVALU
		)VW_TRITON_ST_FLALLOC
			ON
				VW_TRITON_ST_FLALLOC.ALFLTNO = TRITON_ST_FLFLTMST.FLNUMBER
	LEFT JOIN
		TRITON_ST_FLALLOC
		ON
			TRITON_ST_FLALLOC.ALFLTNO = VW_TRITON_ST_FLALLOC.ALFLTNO
			AND
			TRITON_ST_FLALLOC.ALALVALU = VW_TRITON_ST_FLALLOC.ALALVALU
			AND
			TRITON_ST_FLALLOC.ALALLOC# = VW_TRITON_ST_FLALLOC.ALALLOC
	LEFT JOIN
		(
		SELECT  
			ALFLTNO,
			MAX(ALALLOC#) AS ALALLOC,
			ALPRALC,
			ALALVALU
		FROM 
			TRITON_ST_FLALLOC
		WHERE 
			ALALVALU = 'BB' 
		GROUP BY
			ALFLTNO,
			ALPRALC,
			ALALVALU
		)VW_TRITON_ST_FLALLOC_BB
		ON
			VW_TRITON_ST_FLALLOC_BB.ALFLTNO = TRITON_ST_FLALLOC.ALFLTNO
			AND
			VW_TRITON_ST_FLALLOC_BB.ALPRALC = TRITON_ST_FLALLOC.ALALLOC#
	LEFT JOIN
		TRITON_ST_FLALLOC TRITON_ST_FLALLOC_BB
		ON
			TRITON_ST_FLALLOC_BB.ALFLTNO = VW_TRITON_ST_FLALLOC_BB.ALFLTNO
			AND
			TRITON_ST_FLALLOC_BB.ALALVALU = VW_TRITON_ST_FLALLOC_BB.ALALVALU
			AND
			TRITON_ST_FLALLOC_BB.ALALLOC# = VW_TRITON_ST_FLALLOC_BB.ALALLOC
	LEFT JOIN
		(
		SELECT  
			ALFLTNO,
			MAX(ALALLOC#) AS ALALLOC,
			ALPRALC,
			ALALVALU
		FROM 
			TRITON_ST_FLALLOC
		WHERE 
			ALALVALU = 'FO'
		GROUP BY
			ALFLTNO,
			ALPRALC,
			ALALVALU
		)VW_TRITON_ST_FLALLOC_FO
		ON
			VW_TRITON_ST_FLALLOC_FO.ALFLTNO = TRITON_ST_FLALLOC.ALFLTNO
			AND
			VW_TRITON_ST_FLALLOC_FO.ALPRALC = TRITON_ST_FLALLOC.ALALLOC#	
	LEFT JOIN
		TRITON_ST_FLALLOC TRITON_ST_FLALLOC_FO
		ON
			TRITON_ST_FLALLOC_FO.ALFLTNO = VW_TRITON_ST_FLALLOC_FO.ALFLTNO
			AND
			TRITON_ST_FLALLOC_FO.ALALVALU = VW_TRITON_ST_FLALLOC_FO.ALALVALU
			AND
			TRITON_ST_FLALLOC_FO.ALALLOC# = VW_TRITON_ST_FLALLOC_FO.ALALLOC
	LEFT JOIN
		(
		SELECT  
			ALFLTNO,
			MAX(ALALLOC#) AS ALALLOC,
			ALPRALC,
			ALALVALU
		FROM 
			TRITON_ST_FLALLOC
		WHERE 
			ALALVALU = 'FL'
		GROUP BY
			ALFLTNO,
			ALPRALC,
			ALALVALU
		)VW_TRITON_ST_FLALLOC_FL
		ON
			VW_TRITON_ST_FLALLOC_FL.ALFLTNO = TRITON_ST_FLALLOC.ALFLTNO
			AND
			VW_TRITON_ST_FLALLOC_FL.ALPRALC = TRITON_ST_FLALLOC.ALALLOC#	
	LEFT JOIN
		TRITON_ST_FLALLOC TRITON_ST_FLALLOC_FL
		ON
			TRITON_ST_FLALLOC_FL.ALFLTNO = VW_TRITON_ST_FLALLOC_FL.ALFLTNO
			AND
			TRITON_ST_FLALLOC_FL.ALALVALU = VW_TRITON_ST_FLALLOC_FL.ALALVALU
			AND
			TRITON_ST_FLALLOC_FL.ALALLOC# = VW_TRITON_ST_FLALLOC_FL.ALALLOC
	LEFT JOIN
		(
		SELECT  
			ALFLTNO,
			MAX(ALALLOC#) AS ALALLOC,
			ALPRALC,
			ALALVALU
		FROM 
			TRITON_ST_FLALLOC
		WHERE 
			ALALVALU = 'CL'
		GROUP BY
			ALFLTNO,
			ALPRALC,
			ALALVALU
		)VW_TRITON_ST_FLALLOC_CL
		ON
			VW_TRITON_ST_FLALLOC_CL.ALFLTNO = TRITON_ST_FLALLOC.ALFLTNO
			AND
			VW_TRITON_ST_FLALLOC_CL.ALPRALC = TRITON_ST_FLALLOC.ALALLOC#	
	LEFT JOIN
		TRITON_ST_FLALLOC TRITON_ST_FLALLOC_CL
		ON
			TRITON_ST_FLALLOC_CL.ALFLTNO = VW_TRITON_ST_FLALLOC_CL.ALFLTNO
			AND
			TRITON_ST_FLALLOC_CL.ALALVALU = VW_TRITON_ST_FLALLOC_CL.ALALVALU
			AND
			TRITON_ST_FLALLOC_CL.ALALLOC# = VW_TRITON_ST_FLALLOC_CL.ALALLOC
	WHERE 
		FLDPDATE > 20100101
		
		
	INSERT INTO 
		ST_MARINE_FLIGHTINVENTORY_ALL
	SELECT 
		CONVERT(VARCHAR(10),FLNUMBER) + ISNULL(RIGHT('00' + TRITON_ST_FLALLOC.ALALVALU ,2),'00') AS i_SK_FltInv,
		FLNUMBER AS FlightNumber, 
		102 AS SourceSyID,
		ST_MARINE_FBKG.BrandCode,
        ST_MARINE_FBKG.i_SK_Bkg AS i_SK_Bkg,
		RFNUMB As BkgRef,
		MARINE_PAXFLIGHT.i_SK_Pax AS i_SK_Pax,
		ST_MARINE_FBKG.OptionDate AS OptionDate,
		ST_MARINE_FBKG.ConfirmDate AS ConfirmDate,
		ISNULL(LTRIM(RTRIM(TRITON_ST_FLALLOC.ALALVALU)),0) AS NoDays,
		LTRIM(RTRIM(FLTYPE)) AS FltType,
		LTRIM(RTRIM(FLREF)) AS FlightRef,
		LTRIM(RTRIM(FLCARRIER)) + LTRIM(RTRIM(FLREF)) AS FlightCd,
		LTRIM(RTRIM(FLCARRIER)) AS Carrier,
		LTRIM(RTRIM(FLLOCATOR)) AS Locator,
		LTRIM(RTRIM(FLOUTORIN)) AS InOutFlag,
		FLSEATPRC AS SeatPrice,
		--FLSCSEATP AS ChildSeatPrice,--------------------DROPPED --but will keep as nulls mi-1038
		NULL as Childseatprice,
		LTRIM(RTRIM(FLDPARPT)) AS DepAirport,
		FLDPDATE AS DepDate,
		FLDPTIME AS DepTime,
		LTRIM(RTRIM(FLARARPT)) AS ArrAirport,
		FLARDATE AS ArrDate,
		FLARTIME AS ArrTime,
		FLDPNO AS DepNo,
		--LTRIM(RTRIM(FLORGIN)) AS Origin,-------------DROPPED --but will keep as nulls mi-1038
		NULL as Origin,
		NULL AS SUMTotalSeats,
		NULL AS SUMOptionSeats,
		NULL AS SUMConfirmSeats,
		NULL AS SUMWaitSeats,
		NULL AS SUMFreeSeats,
		NULL AS TotalSeats,
		CASE WHEN ST_MARINE_FBKG.BookingStatusID = 1 THEN 1 ELSE 0 END AS OptionSeats,
		CASE WHEN ST_MARINE_FBKG.BookingStatusID = 3 THEN 1 ELSE 0 END AS ConfirmSeats,
		NULL AS WaitSeats,
		NULL AS FreeSeats,
		NULL AS BB_TotalSeats,
		CASE WHEN ST_MARINE_FBKG.BookingStatusID = 1 AND BookingType IN ('Bareboat')
			 THEN 1 ELSE 0 END AS BB_OptionSeats,
		CASE WHEN ST_MARINE_FBKG.BookingStatusID = 3 AND BookingType IN ('Bareboat') 
			 THEN 1 ELSE 0 END AS BB_ConfirmSeats,
		NULL AS BB_WaitSeats,
		NULL AS BB_FreeSeats,
		NULL AS FO_TotalSeats,
		CASE WHEN ST_MARINE_FBKG.BookingStatusID = 1 AND BookingType IN ('Flight Only')
			 THEN 1 ELSE 0 END AS FO_OptionSeats,
		CASE WHEN ST_MARINE_FBKG.BookingStatusID = 3 AND BookingType IN ('Flight Only') 
			 THEN 1 ELSE 0 END AS FO_ConfirmSeats,
		NULL AS FO_WaitSeats,
		NULL AS FO_FreeSeats,
		NULL AS FL_TotalSeats,
		CASE WHEN ST_MARINE_FBKG.BookingStatusID = 1 AND BookingType IN ('Flotilla')
			 THEN 1 ELSE 0 END AS BFL_OptionSeats,
		CASE WHEN ST_MARINE_FBKG.BookingStatusID = 3 AND BookingType IN ('Flotilla') 
			 THEN 1 ELSE 0 END AS FL_ConfirmSeats,
		NULL AS FL_WaitSeats,
		NULL AS FL_FreeSeats,
			NULL AS FL_TotalSeats,
		CASE WHEN ST_MARINE_FBKG.BookingStatusID = 1 AND BookingType IN ('Club/Flotilla','Club')
			 THEN 1 ELSE 0 END AS BFL_OptionSeats,
		CASE WHEN ST_MARINE_FBKG.BookingStatusID = 3 AND BookingType IN ('Club/Flotilla','Club') 
			 THEN 1 ELSE 0 END AS FL_ConfirmSeats,
		NULL AS FL_WaitSeats,
		NULL AS FL_FreeSeats,
		NULL AS FOTotalSeats,
		NULL AS FOOptionSeats,
		NULL AS FOConfirmSeats,
		NULL AS FOWaitSeats, 
		NULL AS FOFreeSeats,
		NULL AS Ticket,
		NULL AS Manifest,
		LTRIM(RTRIM(FLBAGGAGE)) AS Baggage,
		FLCKINTIME AS CheckInTime,
		LTRIM(RTRIM(FLCKINTERM)) AS CheckInTerminal,
		LTRIM(RTRIM(FLROUT)) AS FlightRoute,
		NULL AS Max7Day,
		NULL AS [7DayRemain],
		NULL AS [7DayStop],
		NULL AS FO_Max7Day,
		NULL AS FO_7DayRemain,
		NULL AS FO_7DayStop,
		NULL AS Colors,
		NULL As Class,
		NULL AS InternetUse,
		NULL AS InUse,
		NULL AS LastAlloc,
		NULL AS TotalOnFlight,
		NULL AS OptionOnFlight,
		NULL AS ConfirmOnFlight,
		NULL AS WaitOnFlight,
		NULL AS FreeOnFlight,
		NULL AS HasAlternative,
		NULL As OnRequest,
		FLCOST1 AS Cost,
		FLCOST2 AS Cost2,
		--FLCOST1SC AS ChildCost,---------------DROPPED --but will keep as nulls mi-1038
		NULL as Childcost,
		--FLCOST2SC AS ChildCost2,--------------DROPPED --but will keep as nulls mi-1038
		NULL as Childcost2,
		NULL As UserID,
		NULL as SourceOffice,
		NULL as SalesPlatform
	FROM 
		TRITON_ST_FLFLTMST
	LEFT  JOIN
		(
		SELECT  
			ALFLTNO,
			MAX(ALALLOC#) AS ALALLOC,
			ALALVALU
		FROM 
			TRITON_ST_FLALLOC
		WHERE 
			ALALCCDE = 'D'
		GROUP BY
			ALFLTNO,
			ALALVALU
		)VW_TRITON_ST_FLALLOC
			ON
				VW_TRITON_ST_FLALLOC.ALFLTNO = TRITON_ST_FLFLTMST.FLNUMBER
	LEFT JOIN
		TRITON_ST_FLALLOC
		ON
			TRITON_ST_FLALLOC.ALFLTNO = VW_TRITON_ST_FLALLOC.ALFLTNO
			AND
			TRITON_ST_FLALLOC.ALALVALU = VW_TRITON_ST_FLALLOC.ALALVALU
			AND
			TRITON_ST_FLALLOC.ALALLOC# = VW_TRITON_ST_FLALLOC.ALALLOC
	INNER JOIN
		TRITON_ST_FLFLREF
		ON
			TRITON_ST_FLFLTMST.FLNUMBER = TRITON_ST_FLFLREF.RFFNBR
	INNER JOIN
		ST_MARINE_FBKG
		ON
			ST_MARINE_FBKG.BkgRef = TRITON_ST_FLFLREF.RFNUMB
			AND
			ST_MARINE_FBKG.SourceSysID = 102
	INNER JOIN 
		(
			SELECT 
				OUT_ST_MARINE_PAXFLIGHT.i_SK_Bkg,
				OUT_ST_MARINE_PAXFLIGHT.i_SK_Pax,
				OUT_ST_MARINE_PAXFLIGHT.BkgRef,
				OUT_ST_MARINE_PAXFLIGHT.SourceSysID,
				DATEDIFF(d,CONVERT(DATETIME,CONVERT(VARCHAR(8),BRAINII.dbo.fn_CheckDate(OUT_ST_MARINE_PAXFLIGHT.MinDepartDate),112)),
				CONVERT(DATETIME,CONVERT(VARCHAR(8),BRAINII.dbo.fn_CheckDate(IN_ST_MARINE_PAXFLIGHT.MinDepartDate),112))) AS FlightHolidayDuration
			FROM 
			(	
			SELECT 
				i_SK_Bkg,
				i_SK_Pax,
				BkgRef,
				SourceSysID,
				MIN(DepartDate) AS MinDepartDate
			FROM
				ST_MARINE_PAXFLIGHT
			WHERE 
				OutInFlag ='O'		
			GROUP BY 
				i_SK_Bkg,
				i_SK_Pax,
				BkgRef,
				SourceSysID
			)OUT_ST_MARINE_PAXFLIGHT
			LEFT JOIN
			(
			SELECT 
				i_SK_Bkg,
				i_SK_Pax,
				BkgRef,
				SourceSysID,
				MIN(DepartDate) AS MinDepartDate
			FROM
				ST_MARINE_PAXFLIGHT
			WHERE 
				OutInFlag ='I'		
			GROUP BY 
				i_SK_Bkg,
				i_SK_Pax,
				BkgRef,
				SourceSysID
			)IN_ST_MARINE_PAXFLIGHT
			ON
				OUT_ST_MARINE_PAXFLIGHT.i_SK_Bkg = IN_ST_MARINE_PAXFLIGHT.i_SK_Bkg 
				AND
				OUT_ST_MARINE_PAXFLIGHT.i_SK_Pax = IN_ST_MARINE_PAXFLIGHT.i_SK_Pax 
		)MARINE_PAXFLIGHT
		ON
			MARINE_PAXFLIGHT.BkgRef =  TRITON_ST_FLFLREF.RFNUMB	
			AND
			MARINE_PAXFLIGHT.SourceSysID = 102	
			AND
			MARINE_PAXFLIGHT.FlightHolidayDuration = ISNULL(LTRIM(RTRIM(TRITON_ST_FLALLOC.ALALVALU)),0) 
	WHERE 
		FLDPDATE > 20100101

	EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'TRTN','ST_FLINVALL'	
GO
/****** Object:  StoredProcedure [dbo].[BUILD_ST_MARINE_INSURANCE]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[BUILD_ST_MARINE_INSURANCE]
AS

BEGIN


	EXEC  AMI_Galaxy.dbo.AMI_LOG_OPEN 'TRTN','ST_INS','BUILD_ST_MARINE_INSURANCE'

	TRUNCATE TABLE ST_MARINE_INSURANCE

	INSERT INTO
		ST_MARINE_INSURANCE
	SELECT 
		i_SK_Bkg,
		i_SK_Pax,
		ST_MARINE_PAX.SourceSysID,
		SystemName,
		DivisionCode,
		ST_MARINE_PAX.BrandCode,
		ProductCode,
		BookingType,
		CompanyNo,
		ST_MARINE_PAX.BkgRef,
		ItinRef,
		[Status],
		Qty,
		NoPax,
		ContractSvsStartDate,
		ContractSvsEndDate,
		EntryDate,
		SvsLastAmendDate,
		ContractDuration,
		ItemStartDate,
		ItemEndDate,
		ItemDuration,
		ItemPerPerson,
		ItemPerDuration,
		ItemAmountLocal,
		TotalAmountLocal,
		TotalAmountLocalForCancel,
		LastAmendUser,
		BaseLocation
	FROM 
		ST_MARINE_PAX
	INNER JOIN 
		ST_MARINE_FITN
		ON 
			ST_MARINE_PAX.i_BK_BkgConcat = ST_MARINE_FITN.i_SK_Bkg
			AND
			ST_MARINE_PAX.InsurancePolicy= ST_MARINE_FITN.ExtraCode
	WHERE 
		ST_MARINE_PAX.InsurancePolicy <>''

	EXEC  AMI_Galaxy.dbo.AMI_LOG_CLOSE 'TRTN','ST_INS'

END
GO
/****** Object:  StoredProcedure [dbo].[BUILD_ST_MARINE_PAX]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[BUILD_ST_MARINE_PAX]
AS

BEGIN


	EXEC  AMI_Galaxy.dbo.AMI_LOG_OPEN 'TRTN','ST_PAX','BUILD_ST_MARINE_PAX'

	TRUNCATE TABLE ST_MARINE_PAX

	INSERT INTO
		ST_MARINE_PAX
	SELECT
		CONVERT(BIGINT,(CONVERT(VARCHAR(16), ST_MARINE_FBKG.i_SK_Bkg) + CONVERT(VARCHAR(3),VW_SUNSAIL_ST_PASSENGER.[PAPASS#]))) AS i_SK_Pax,
		ST_MARINE_FBKG.i_SK_Bkg AS i_BK_BkgConcat,
		CONVERT(BIGINT,(CONVERT(VARCHAR(16), ST_MARINE_FBKG.i_SK_Bkg) + CONVERT(VARCHAR(3),VW_SUNSAIL_ST_PASSENGER.[PAPASS#]))) AS i_BK_PaxConcat,
		ST_MARINE_FBKG.SourceSysID AS SourceSysID,
		ST_MARINE_FBKG.BrandCode AS BrandCode,
		LTRIM(RTRIM(VW_SUNSAIL_ST_PASSENGER.PANUMB)) AS BkgRef,
		LTRIM(RTRIM(VW_SUNSAIL_ST_PASSENGER.PACLNB)) AS ClientNo,
		1 AS NoOfPax,
		LTRIM(RTRIM(VW_SUNSAIL_ST_PASSENGER.[PAPASS#])) AS PaxNo,
		CASE 
			WHEN VW_SUNSAIL_ST_PASSENGER.PAADULT = 'Y' THEN 'A' 
			WHEN VW_SUNSAIL_ST_PASSENGER.PAADULT = 'N' THEN 'C' 
			WHEN VW_SUNSAIL_ST_PASSENGER.PAADULT ='' THEN CASE WHEN PADOB <> 0 THEN 
					CASE WHEN DATEDIFF(year,NEPTUNE_Stage.dbo.fn_CheckDate(PADOB),DepartureDate) < 2 THEN 'I' 
						 WHEN DATEDIFF(year,NEPTUNE_Stage.dbo.fn_CheckDate(PADOB),DepartureDate) > 12 THEN 'A' ELSE 'C' END 
				ELSE 'A' END
			ELSE 'A' END 
		AS PaxType,
		LTRIM(RTRIM(VW_SUNSAIL_ST_PASSENGER.PANAME)) AS Surname,
		LTRIM(RTRIM(VW_SUNSAIL_ST_PASSENGER.PASALU)) AS Title,
		SUBSTRING(VW_SUNSAIL_ST_PASSENGER.PAFNAM,1,1) AS Initials,
		LTRIM(RTRIM(VW_SUNSAIL_ST_PASSENGER.PAFNAM)) AS Forename,
		LTRIM(RTRIM(VW_SUNSAIL_ST_PASSENGER.PAMNAM)) AS MiddleName, --new
		LTRIM(RTRIM(VW_SUNSAIL_ST_PASSENGER.PASALU)) + ' ' 
			+ LTRIM(RTRIM(VW_SUNSAIL_ST_PASSENGER.PAFNAM)) + ' ' 
			+ LTRIM(RTRIM(VW_SUNSAIL_ST_PASSENGER.PANAME)) As Fullname,
		CASE WHEN VW_SUNSAIL_ST_PASSENGER.PACLNB=ST_MARINE_FBKG.ClientNo THEN 1 ELSE 0 END  AS LeadNameFlag, 
		LTRIM(RTRIM(VW_SUNSAIL_ST_PASSENGER.PASEX)) AS PaxSex,
		CASE WHEN VW_SUNSAIL_ST_PASSENGER.PADOB <> 0 THEN  DATEDIFF(year,NEPTUNE_Stage.dbo.fn_CheckDate(PADOB),DepartureDate) ELSE 0 END  AS PaxAge, 
		NEPTUNE_Stage.dbo.fn_CheckDate(VW_SUNSAIL_ST_PASSENGER.PADOB) AS PaxDOB,
		LTRIM(RTRIM(VW_SUNSAIL_ST_PASSENGER.PAPASSPT)) AS PassportNumber,
		NEPTUNE_Stage.dbo.fn_CheckDate(VW_SUNSAIL_ST_PASSENGER.PAPPEDTE) AS PassportExpiryDate,  
		LTRIM(RTRIM(VW_SUNSAIL_ST_PASSENGER.PAPPPLAC)) AS PassportIssuedCountry, 
		LTRIM(RTRIM(VW_SUNSAIL_ST_PASSENGER.PAPPNATN)) AS Nationality,  
		LTRIM(RTRIM(VW_SUNSAIL_ST_PASSENGER.PABIRTHPL)) AS PlaceOfBirth,  
		LTRIM(RTRIM(VW_SUNSAIL_ST_PASSENGER.PAEMAIL)) AS  EmailAddress, 
		LTRIM(RTRIM(VW_SUNSAIL_ST_PASSENGER.PASAILEXP)) AS SailExperience,
		LTRIM(RTRIM(VW_SUNSAIL_ST_PASSENGER.PASKIPPER)) AS SkipperCrewIndicator,
		LTRIM(RTRIM(VW_SUNSAIL_ST_PASSENGER.PAINPOL)) AS InsurancePolicy,
		NEPTUNE_Stage.dbo.fn_CheckDate(VW_SUNSAIL_ST_PASSENGER.PASTDT) AS InsurancePolicyStartDate,
		NEPTUNE_Stage.dbo.fn_CheckDate(VW_SUNSAIL_ST_PASSENGER.PAENDT)AS InsurancePolicyEndDate
	FROM
		TRITON_Stage.dbo.ST_MARINE_FBKG ST_MARINE_FBKG
	INNER JOIN 
		(
		SELECT
			PACLIENT,
			PAMAIL,
			SUNSAIL_ST_PASSENGER.PAFAM#,
			SUNSAIL_ST_PASSENGER.PAPASS#,
			PASALU,
			PAFNAM,
			PAMNAM,
			PANAME,
			PACONO,
			PAADDR1,
			PAADDR2,
			PAADDR3,
			PACITY,
			PASTATE,
			PAZIPC,
			PACTRY,
			PANAT,
			PADAYPH,
			PAEVEPH,
			PAT1DESC,
			PATEL1,
			PAT2DESC,
			PATEL2,
			PAT3DESC,
			PATEL3,
			PATF1DESC,
			PAFAX1,
			PAEMAIL,
			PASEX,
			PADOB,
			PAADULT,
			PAYEARS,
			PAMONTHS,
			PAYOB,
			PAOCCUPA,
			PAPASSPT,
			PAPPDATE,
			PAPPEDTE,
			PAPPPLAC,
			PAPPNATN,
			PASMOKER,
			PAVEG,
			PATOD,
			PAINSRQ,
			PAINPOL,
			PASTDT,
			PAENDT,
			PATRANF,
			PAMSOFT,
			PALOGBK,
			PAWTRPRF,
			PAMAILLST,
			PABIRTHPL,
			PASAILEXP,
			PASKIPPER,
			PAREDRESS#,
			SUNSAIL_ST_PASSENGER.PANUMB,
			PACLNB
		FROM 
			TRITON_Stage.dbo.SUNSAIL_ST_PASSENGER SUNSAIL_ST_PASSENGER
		LEFT JOIN
		(
		SELECT 
			PAFAM#,
			PAPASS#,
			PANUMB
		FROM 
			TRITON_Stage.dbo.SUNSAIL_ST_PASSENGER 
		WHERE 
			PAFAM# = '0' 
			AND
			PAPASS# = 1
		)SUNSAIL_ST_PASSENGER_AGENT
		ON
			SUNSAIL_ST_PASSENGER.PAFAM# = SUNSAIL_ST_PASSENGER_AGENT.PAFAM# 
			AND
			SUNSAIL_ST_PASSENGER.PAPASS# = SUNSAIL_ST_PASSENGER_AGENT.PAPASS#
			AND
			SUNSAIL_ST_PASSENGER.PANUMB = SUNSAIL_ST_PASSENGER_AGENT.PANUMB 
		WHERE 
			SUNSAIL_ST_PASSENGER_AGENT.PANUMB IS NULL
		)VW_SUNSAIL_ST_PASSENGER
		ON
			VW_SUNSAIL_ST_PASSENGER.PANUMB = ST_MARINE_FBKG.BkgRef
	LEFT JOIN
		(
			SELECT 
				PANUMB,[PAPASS#] 
			FROM 
				TRITON_Stage.dbo.SUNSAIL_ST_PASSENGER 
			GROUP BY 
				PANUMB,[PAPASS#] 
			HAVING COUNT(*)>1
		)Duplication
	ON
		VW_SUNSAIL_ST_PASSENGER.PANUMB = Duplication.PANUMB
		AND
		VW_SUNSAIL_ST_PASSENGER.[PAPASS#] = Duplication.[PAPASS#]
	WHERE
		ST_MARINE_FBKG.SourceSysID = 101
		AND 
		Duplication.PANUMB IS NULL
	
		
	
	
	INSERT INTO
		ST_MARINE_PAX
	SELECT
		CONVERT(BIGINT,(CONVERT(VARCHAR(16), ST_MARINE_FBKG.i_SK_Bkg) + CONVERT(VARCHAR(3),VW_TRITON_ST_PASSENGER.[PAPASS#]))) AS i_SK_Pax,
		ST_MARINE_FBKG.i_SK_Bkg AS i_BK_BkgConcat,
		CONVERT(BIGINT,(CONVERT(VARCHAR(16), ST_MARINE_FBKG.i_SK_Bkg) + CONVERT(VARCHAR(3),VW_TRITON_ST_PASSENGER.[PAPASS#]))) AS i_BK_PaxConcat,
		ST_MARINE_FBKG.SourceSysID AS SourceSysID,
		ST_MARINE_FBKG.BrandCode AS BrandCode,
		LTRIM(RTRIM(VW_TRITON_ST_PASSENGER.PANUMB)) AS BkgRef,
		LTRIM(RTRIM(VW_TRITON_ST_PASSENGER.PACLNB)) AS ClientNo,
		1 AS NoOfPax,
		LTRIM(RTRIM(VW_TRITON_ST_PASSENGER.[PAPASS#])) AS PaxNo,
		CASE 
			WHEN VW_TRITON_ST_PASSENGER.PAADULT = 'Y' THEN 'A' 
			WHEN VW_TRITON_ST_PASSENGER.PAADULT = 'N' THEN 'C' 
			WHEN VW_TRITON_ST_PASSENGER.PAADULT ='' THEN CASE WHEN PADOB <> 0 THEN 
					CASE WHEN DATEDIFF(year,NEPTUNE_Stage.dbo.fn_CheckDate(PADOB),DepartureDate) < 2 THEN 'I' 
						 WHEN DATEDIFF(year,NEPTUNE_Stage.dbo.fn_CheckDate(PADOB),DepartureDate) > 12 THEN 'A' ELSE 'C' END 
				ELSE 'A' END
			ELSE 'A' END 
		AS PaxType,
		LTRIM(RTRIM(VW_TRITON_ST_PASSENGER.PANAME)) AS Surname,
		LTRIM(RTRIM(VW_TRITON_ST_PASSENGER.PASALU)) AS Title,
		SUBSTRING(VW_TRITON_ST_PASSENGER.PAFNAM,1,1) AS Initials,
		LTRIM(RTRIM(VW_TRITON_ST_PASSENGER.PAFNAM)) AS Forename,
		LTRIM(RTRIM(VW_TRITON_ST_PASSENGER.PAMNAM)) AS MiddleName, 
		LTRIM(RTRIM(VW_TRITON_ST_PASSENGER.PASALU)) + ' ' 
			+ LTRIM(RTRIM(VW_TRITON_ST_PASSENGER.PAFNAM)) + ' ' 
			+ LTRIM(RTRIM(VW_TRITON_ST_PASSENGER.PANAME)) As Fullname,
		CASE WHEN VW_TRITON_ST_PASSENGER.PACLNB=ST_MARINE_FBKG.ClientNo THEN 1 ELSE 0 END  AS LeadNameFlag, 
		LTRIM(RTRIM(VW_TRITON_ST_PASSENGER.PASEX)) AS PaxSex,
		CASE WHEN VW_TRITON_ST_PASSENGER.PADOB <> 0 THEN  DATEDIFF(year,NEPTUNE_Stage.dbo.fn_CheckDate(VW_TRITON_ST_PASSENGER.PADOB),DepartureDate) ELSE 0 END  AS PaxAge, 
		NEPTUNE_Stage.dbo.fn_CheckDate(PADOB) AS PaxDOB,
		LTRIM(RTRIM(VW_TRITON_ST_PASSENGER.PAPASSPT)) AS PassportNumber,
		NEPTUNE_Stage.dbo.fn_CheckDate(VW_TRITON_ST_PASSENGER.PAPPEDTE) AS PassportExpiryDate,  
		LTRIM(RTRIM(VW_TRITON_ST_PASSENGER.PAPPPLAC)) AS PassportIssuedCountry, 
		LTRIM(RTRIM(VW_TRITON_ST_PASSENGER.PAPPNATN)) AS Nationality, 
		LTRIM(RTRIM(VW_TRITON_ST_PASSENGER.PABIRTHPL)) AS PlaceOfBirth,  
		LTRIM(RTRIM(VW_TRITON_ST_PASSENGER.PAEMAIL)) AS  EmailAddress, 
		LTRIM(RTRIM(VW_TRITON_ST_PASSENGER.PASAILEXP)) AS SailExperience,
		LTRIM(RTRIM(VW_TRITON_ST_PASSENGER.PASKIPPER)) AS SkipperCrewIndicator,
		LTRIM(RTRIM(VW_TRITON_ST_PASSENGER.PAINPOL)) AS InsurancePolicy,
		NEPTUNE_Stage.dbo.fn_CheckDate(VW_TRITON_ST_PASSENGER.PASTDT) AS InsurancePolicyStartDate,
		NEPTUNE_Stage.dbo.fn_CheckDate(VW_TRITON_ST_PASSENGER.PAENDT)AS InsurancePolicyEndDate
	FROM
		TRITON_Stage.dbo.ST_MARINE_FBKG ST_MARINE_FBKG
	INNER JOIN 
		(
		SELECT
			PACLIENT,
			PAMAIL,
			TRITON_ST_PASSENGER.PAFAM#,
			TRITON_ST_PASSENGER.PAPASS#,
			PASALU,
			PAFNAM,
			PAMNAM,
			PANAME,
			PACONO,
			PAADDR1,
			PAADDR2,
			PAADDR3,
			PACITY,
			PASTATE,
			PAZIPC,
			PACTRY,
			PANAT,
			PADAYPH,
			PAEVEPH,
			PAT1DESC,
			PATEL1,
			PAT2DESC,
			PATEL2,
			PAT3DESC,
			PATEL3,
			PATF1DESC,
			PAFAX1,
			PAEMAIL,
			PASEX,
			PADOB,
			PAADULT,
			PAYEARS,
			PAMONTHS,
			PAYOB,
			PAOCCUPA,
			PAPASSPT,
			PAPPDATE,
			PAPPEDTE,
			PAPPPLAC,
			PAPPNATN,
			PASMOKER,
			PAVEG,
			PATOD,
			PAINSRQ,
			PAINPOL,
			PASTDT,
			PAENDT,
			PATRANF,
			PAMSOFT,
			PALOGBK,
			PAWTRPRF,
			PAMAILLST,
			PABIRTHPL,
			PASAILEXP,
			PASKIPPER,
			PAREDRESS#,
			TRITON_ST_PASSENGER.PANUMB,
			PACLNB
		FROM 
			TRITON_Stage.dbo.TRITON_ST_PASSENGER TRITON_ST_PASSENGER
		LEFT JOIN
		(
		SELECT 
			PAFAM#,
			PAPASS#,
			PANUMB
		FROM 
			TRITON_Stage.dbo.TRITON_ST_PASSENGER 
		WHERE 
			PAFAM# = '0' 
			AND
			PAPASS# = 1
		)TRITON_ST_PASSENGER_AGENT
		ON
			TRITON_ST_PASSENGER.PAFAM# = TRITON_ST_PASSENGER_AGENT.PAFAM# 
			AND
			TRITON_ST_PASSENGER.PAPASS# = TRITON_ST_PASSENGER_AGENT.PAPASS#
			AND
			TRITON_ST_PASSENGER.PANUMB = TRITON_ST_PASSENGER_AGENT.PANUMB 
		WHERE 
			TRITON_ST_PASSENGER_AGENT.PANUMB IS NULL
		)VW_TRITON_ST_PASSENGER
		ON
			VW_TRITON_ST_PASSENGER.PANUMB = ST_MARINE_FBKG.BkgRef
	LEFT JOIN
		(
			SELECT 
				PANUMB,[PAPASS#] 
			FROM 
				TRITON_Stage.dbo.TRITON_ST_PASSENGER 
			GROUP BY 
				PANUMB,[PAPASS#] 
			HAVING COUNT(*)>1
		)Duplication
	ON
		VW_TRITON_ST_PASSENGER.PANUMB = Duplication.PANUMB
		AND
		VW_TRITON_ST_PASSENGER.[PAPASS#] = Duplication.[PAPASS#]
	WHERE
		ST_MARINE_FBKG.SourceSysID = 102
		AND 
		Duplication.PANUMB IS NULL
		
	
	INSERT INTO
		ST_MARINE_PAX
	SELECT
		CONVERT(BIGINT,(CONVERT(VARCHAR(16), ST_MARINE_FITN.i_SK_Bkg) + CONVERT(VARCHAR(3),ST_MARINE_FITN.ItinRef))) AS i_SK_Pax,
		ST_MARINE_FITN.i_SK_Bkg AS i_BK_BkgConcat,
		CONVERT(BIGINT,(CONVERT(VARCHAR(16), ST_MARINE_FITN.i_SK_Bkg) + CONVERT(VARCHAR(3),ST_MARINE_FITN.ItinRef))) AS i_BK_PaxConcat,
		ST_MARINE_FITN.SourceSysID AS a_SourceSysID,
		ST_MARINE_FITN.BrandCode AS BrandCode,
		ST_MARINE_FITN.BkgRef AS a_BkgRef,
		ExtraCode AS a_ClientNo,
		CASE WHEN LEN(Qty) = 5 THEN 1 ELSE Qty END AS NoOfPax,
		CASE WHEN LEN(Qty) = 5 THEN 1 ELSE Qty END AS a_PaxNo,
		NULL AS a_PaxType,
		NULL AS a_Surname,
		NULL AS a_Title,
		NULL AS a_Initials,
		NULL AS a_Forename,
		NULL AS MiddleName, 
		ST_MARINE_FITN.ExtraCodeDesc AS a_Fullname,
		CASE WHEN ST_MARINE_FITN.ExtraCode = ST_MARINE_FBKG.ClientNo THEN 1 ELSE 0 END  AS a_LeadNameFlag, 
		NULL AS a_PaxSex,
		0 AS a_PaxAge,
		NULL AS a_PaxDOB,
		NULL AS a_PassportNumber,
		NULL AS PassportExpiryDate,  
		NULL AS PassportIssuedCountry, 
		NULL AS Nationality,  
		NULL AS PlaceOfBirth,  
		NULL AS  EmailAddress, 
		NULL AS a_SailExperience,
		NULL AS a_SkipperCrewIndicator,
		NULL AS InsurancePolicy,
		NULL AS InsurancePolicyStartDate,
		NULL AS InsurancePolicyEndDate
	FROM
		TRITON_Stage.dbo.ST_MARINE_FITN ST_MARINE_FITN
	INNER JOIN
		TRITON_Stage.dbo.ST_MARINE_FBKG ST_MARINE_FBKG
		ON
			ST_MARINE_FITN.i_SK_Bkg = ST_MARINE_FBKG.i_SK_Bkg
	LEFT JOIN 
		ST_MARINE_PAX
		ON
			ST_MARINE_PAX.i_BK_BkgConcat = ST_MARINE_FITN.i_SK_Bkg
	WHERE
		ST_MARINE_FITN.ClassCode = 'G'
		AND
		ST_MARINE_PAX.i_BK_BkgConcat IS NULL
		
		
	INSERT INTO
		ST_MARINE_PAX	
	SELECT 
		CONVERT(BIGINT,(CONVERT(VARCHAR(16), ST_MARINE_FBKG.i_SK_Bkg))) AS i_SK_Pax,
		ST_MARINE_FBKG.i_SK_Bkg AS i_BK_BkgConcat,
		CONVERT(BIGINT,(CONVERT(VARCHAR(16), ST_MARINE_FBKG.i_SK_Bkg))) AS i_BK_PaxConcat,
		ST_MARINE_FBKG.SourceSysID AS a_SourceSysID,
		ST_MARINE_FBKG.BrandCode AS BrandCode,
		ST_MARINE_FBKG.BkgRef AS a_BkgRef,
		ST_MARINE_PAX.ClientNo AS a_ClientNo,
		ST_MARINE_FBKG.PaxNo AS a_PaxNo,
		ST_MARINE_FBKG.PaxNo AS a_PaxNo,
		NULL AS a_PaxType,
		LeadPaxSurname AS a_Surname,
		LeadPaxTitle AS a_Title,
		LeadPaxInitials AS a_Initials,
		LeadPaxForename AS a_Forename,
		NULL AS MiddleName, 
		LeadPaxFullName AS a_Fullname,
		1 AS a_LeadNameFlag, 
		NULL AS a_PaxSex,
		0 AS a_PaxAge, 
		NULL AS a_PaxDOB,
		NULL AS a_PassportNumber,
		NULL AS PassportExpiryDate,  
		NULL AS PassportIssuedCountry, 
		NULL AS Nationality,  
		NULL AS PlaceOfBirth, 
		NULL AS  EmailAddress, 
		NULL AS a_SailExperience,
		NULL AS a_SkipperCrewIndicator,
		NULL AS InsurancePolicy,
		NULL AS InsurancePolicyStartDate,
		NULL AS InsurancePolicyEndDate
	FROM 
		TRITON_Stage.dbo.ST_MARINE_FBKG ST_MARINE_FBKG
	LEFT JOIN 
		ST_MARINE_PAX
		ON
			ST_MARINE_PAX.i_BK_BkgConcat = ST_MARINE_FBKG.i_SK_Bkg
	WHERE
		ST_MARINE_PAX.i_BK_BkgConcat IS NULL
	

	EXEC  AMI_Galaxy.dbo.AMI_LOG_CLOSE  'TRTN','ST_PAX' 
END
GO
/****** Object:  StoredProcedure [dbo].[BUILD_ST_MARINE_PAXACC]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[BUILD_ST_MARINE_PAXACC]
AS

BEGIN


	EXEC  AMI_Galaxy.dbo.AMI_LOG_OPEN 'TRTN','ST_ACC','BUILD_ST_MARINE_PAXACC'

	TRUNCATE TABLE ST_MARINE_PAXACC

	INSERT INTO
		ST_MARINE_PAXACC
	SELECT
		i_SK_Bkg,
		i_SK_Pax,
		AccomBkg.SourceSysID,
		AccomBkg.BrandCode,
		NoRooms AS Qty,
		ExtraCode AS RoomType,
		ItemStartDate AS HotelStartDate,
		0.00 AS HotelStartTime,
		ItemEndDate AS HotelEndDate,
		0.00 AS HotelEndTime
	FROM
		(
			SELECT 
				i_SK_Bkg,
				SourceSysID,
				BrandCode,
				ExtraCode,
				ItemStartDate,
				ItemEndDate,
				COUNT(*) AS NoRooms
			FROM 
				ST_MARINE_FITN
			LEFT JOIN
				SUNSAIL_ST_ATMST
				ON
					SUNSAIL_ST_ATMST.ATLOCT + SUNSAIL_ST_ATMST.ATTYPE = ST_MARINE_FITN.ExtraCode
			WHERE 
				ClassCode ='A'
				AND
				SourceSysID = 101
			GROUP BY 
				i_SK_Bkg,
				SourceSysID,
				BrandCode,
				ExtraCode,
				ItemStartDate,
				ItemEndDate
		)AccomBkg
	 LEFT JOIN
		ST_MARINE_PAX
		ON
			ST_MARINE_PAX.i_BK_BkgConcat = AccomBkg.i_SK_Bkg
		
	INSERT INTO
		ST_MARINE_PAXACC
	SELECT
		i_SK_Bkg,
		i_SK_Pax,
		AccomBkg.SourceSysID,
		AccomBkg.BrandCode,
		NoRooms AS Qty,
		ExtraCode AS RoomType,
		ItemStartDate AS HotelStartDate,
		0.00 AS HotelStartTime,
		ItemEndDate AS HotelEndDate,
		0.00 AS HotelEndTime
	FROM
		(
			SELECT 
				i_SK_Bkg,
				SourceSysID,
				BrandCode,
				ExtraCode,
				ItemStartDate,
				ItemEndDate,
				COUNT(*) AS NoRooms
			FROM 
				ST_MARINE_FITN
			LEFT JOIN
				TRITON_ST_ATMST
				ON
					TRITON_ST_ATMST.ATLOCT + TRITON_ST_ATMST.ATTYPE = ST_MARINE_FITN.ExtraCode
			WHERE 
				ClassCode ='A'
				AND
				SourceSysID = 102
			GROUP BY 
				i_SK_Bkg,
				SourceSysID,
				BrandCode,
				ExtraCode,
				ItemStartDate,
				ItemEndDate
		)AccomBkg
	 LEFT JOIN
		ST_MARINE_PAX
		ON
			ST_MARINE_PAX.i_BK_BkgConcat = AccomBkg.i_SK_Bkg

	EXEC  AMI_Galaxy.dbo.AMI_LOG_CLOSE  'TRTN','ST_ACC' --, @row_count=@rowcount
END
GO
/****** Object:  StoredProcedure [dbo].[BUILD_ST_MARINE_PAXBOAT]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[BUILD_ST_MARINE_PAXBOAT]
AS

BEGIN


	EXEC  AMI_Galaxy.dbo.AMI_LOG_OPEN 'TRTN','ST_PAXBOAT','BUILD_ST_MARINE_PAXBOAT'

	TRUNCATE TABLE ST_MARINE_PAXBOAT

	INSERT INTO
		ST_MARINE_PAXBOAT
	SELECT 
		ST_MARINE_FBKG.i_SK_Bkg AS i_SK_Bkg,
		ST_MARINE_PAX.i_SK_Pax AS i_SK_Pax,
		ST_MARINE_FBKG.SourceSysID,
		ST_MARINE_FBKG.BrandCode,
		Boat AS Boat,
		BoatType,
		StartDate AS BoatStartDate,
		TRITON_ST_BLMST.BLSTME AS BoatStartTime,
		EndDate AS BoatEndDate,
		TRITON_ST_BLMST.BLETME AS BoatEndTime,
		ST_MARINE_FBKG.BaseLocation,
		ST_MARINE_FBKG.DestinationLocation,
		CASE WHEN ST_MARINE_FBKG.ClientNo = FLCLNB THEN 1 ELSE 0 END AS BoatOwnerOwnBoat,
		CASE WHEN Sleepaboard.i_SK_Bkg IS NOT NULL THEN 1 ELSE 0 END AS EveningStart
	FROM 
		ST_MARINE_FBKG
	INNER JOIN
		ST_MARINE_PAX
		ON
			ST_MARINE_FBKG.i_SK_Bkg = ST_MARINE_PAX.i_BK_BkgConcat
	LEFT JOIN 
		TRITON_ST_FLMST
		ON
			TRITON_ST_FLMST.FLNUMB = ST_MARINE_FBKG.Boat
	LEFT JOIN
		TRITON_ST_BLMST
		ON
			TRITON_ST_BLMST.BLLOCT = ST_MARINE_FBKG.BaseLocation
	LEFT JOIN
		(
			SELECT
				i_SK_Bkg
			FROM
				ST_MARINE_FITN
			WHERE 
				ExtraCode IN  ('EVENSTART','OWNEVESTRT')
			GROUP BY
				i_SK_Bkg
		) Sleepaboard
		ON
			ST_MARINE_FBKG.i_SK_Bkg = Sleepaboard.i_SK_Bkg		
	WHERE 
		ST_MARINE_FBKG.SourceSysID = 102
		AND
		BoatType <>''	

			
	INSERT INTO
		ST_MARINE_PAXBOAT
	SELECT 
		ST_MARINE_FBKG.i_SK_Bkg AS i_SK_Bkg,
		ST_MARINE_PAX.i_SK_Pax AS i_SK_Pax,
		ST_MARINE_FBKG.SourceSysID,
		ST_MARINE_FBKG.BrandCode,
		Boat AS Boat,
		BoatType,
		StartDate AS BoatStartDate,
		SUNSAIL_ST_BLMST.BLSTME AS BoatStartTime,
		EndDate AS BoatEndDate,
		SUNSAIL_ST_BLMST.BLETME AS BoatEndTime,
		ST_MARINE_FBKG.BaseLocation,
		ST_MARINE_FBKG.DestinationLocation,
		CASE WHEN ST_MARINE_FBKG.ClientNo = FLCLNB THEN 1 ELSE 0 END As BoatOwnerOwnBoat,
		CASE WHEN Sleepaboard.i_SK_Bkg IS NOT NULL THEN 1 ELSE 0 END AS EveningStart
	FROM 
		ST_MARINE_FBKG
	INNER JOIN
		ST_MARINE_PAX
		ON
			ST_MARINE_FBKG.i_SK_Bkg = ST_MARINE_PAX.i_BK_BkgConcat
	LEFT JOIN
		SUNSAIL_ST_FLMST
		ON
			SUNSAIL_ST_FLMST.FLNUMB = ST_MARINE_FBKG.Boat
	LEFT JOIN
		SUNSAIL_ST_BLMST
		ON
			SUNSAIL_ST_BLMST.BLLOCT = ST_MARINE_FBKG.BaseLocation
	LEFT JOIN
		(
		SELECT
			i_SK_Bkg
		FROM
			ST_MARINE_FITN
		WHERE 
			ExtraCode = 'SAB'
		GROUP BY
			i_SK_Bkg
		)Sleepaboard
		ON
			ST_MARINE_FBKG.i_SK_Bkg = Sleepaboard.i_SK_Bkg	
	WHERE 
		ST_MARINE_FBKG.SourceSysID = 101
		AND
		BoatType <>''		
				

	EXEC  AMI_Galaxy.dbo.AMI_LOG_CLOSE  'TRTN','ST_PAXBOAT' --, @row_count=@rowcount
	
END



GO
/****** Object:  StoredProcedure [dbo].[BUILD_ST_MARINE_PAXFLIGHT]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[BUILD_ST_MARINE_PAXFLIGHT]
AS

BEGIN


	EXEC  AMI_Galaxy.dbo.AMI_LOG_OPEN 'TRTN','ST_PAXFLT','BUILD_ST_MARINE_PAXFLIGHT'

	TRUNCATE TABLE ST_MARINE_PAXFLIGHT

	INSERT INTO
		ST_MARINE_PAXFLIGHT
	SELECT
		ST_MARINE_PAX.i_BK_BkgConcat AS i_SK_Bkg,
		ST_MARINE_PAX.i_SK_Pax,
		CONVERT(
			BIGINT,
			(
				(
					CONVERT(VARCHAR(16),ST_MARINE_PAX.i_BK_BkgConcat)  +
					CONVERT(VARCHAR(3),DENSE_RANK() OVER 
							(PARTITION BY SUNSAIL_ST_FLFLREF.RFNUMB ORDER BY  SUNSAIL_ST_FLFLREF.RFFLRF))
				)
			)
		) AS i_SK_Flt,	 
		SUNSAIL_ST_FLFLTMST.FLNUMBER AS FlightNumber,
		FLOUTORIN AS OutInFlag,	 
		ST_MARINE_PAX.SourceSysID,
		ST_MARINE_PAX.BrandCode,
		ST_MARINE_PAX.BkgRef,
		SUNSAIL_ST_FLFLTMST.FLDPARPT AS DepartAirport,
		SUNSAIL_ST_FLFLTMST.FLARARPT As ArrivalAirport,
		SUNSAIL_ST_FLFLTMST.FLDPDATE AS DepartDate,
		SUNSAIL_ST_FLFLTMST.FLARDATE AS ArrivalDate
	FROM 
		ST_MARINE_PAX	
	INNER JOIN 
		SUNSAIL_ST_FLPASSLK
		ON
			ST_MARINE_PAX.BkgRef = SUNSAIL_ST_FLPASSLK.PLNUMB
			AND
			ST_MARINE_PAX.PaxNo = SUNSAIL_ST_FLPASSLK.PLPASS#
	INNER JOIN 
		(
			SELECT
				RFCLNO,
				RFFNBR,
				RFROUTE#,
				RFNUMB,
				MIN(RFFLRF) AS RFFLRF,
				SUM(RFSREQ) AS RFSREQ
			FROM
				SUNSAIL_ST_FLFLREF
			GROUP BY
				RFCLNO,
				RFFNBR,
				RFROUTE#,
				RFNUMB
		) SUNSAIL_ST_FLFLREF
		ON
			SUNSAIL_ST_FLFLREF.RFNUMB = SUNSAIL_ST_FLPASSLK.PLNUMB
			AND
			SUNSAIL_ST_FLFLREF.RFROUTE# = SUNSAIL_ST_FLPASSLK.PLROUTE
	LEFT JOIN
		TRITON_STAGE.dbo.SUNSAIL_ST_FLFLTMST SUNSAIL_ST_FLFLTMST
		ON
			SUNSAIL_ST_FLFLTMST.FLNUMBER = SUNSAIL_ST_FLFLREF.RFFNBR
	WHERE
		ST_MARINE_PAX.SourceSysID = 101
		AND
		SUNSAIL_ST_FLPASSLK.PLAGE <>'B'

		
		
	INSERT INTO
		ST_MARINE_PAXFLIGHT
	SELECT 
		 ST_MARINE_PAX.i_BK_BkgConcat AS i_SK_Bkg,
		 ST_MARINE_PAX.i_SK_Pax,
		 CONVERT(
			BIGINT,
			(
				(
					CONVERT(VARCHAR(16),ST_MARINE_PAX.i_BK_BkgConcat)  + 
					CONVERT(VARCHAR(3),DENSE_RANK() OVER 
						(PARTITION BY TRITON_ST_FLFLREF.RFNUMB ORDER BY  TRITON_ST_FLFLREF.RFFLRF))
				)
			)
		 ) AS i_SK_Flt,
		 TRITON_ST_FLFLTMST.FLNUMBER AS FlightNumber,
		 FLOUTORIN AS OutInFlag,	
		 ST_MARINE_PAX.SourceSysID,
		 ST_MARINE_PAX.BrandCode,
		 ST_MARINE_PAX.BkgRef,
		 TRITON_ST_FLFLTMST.FLDPARPT AS DepartAirport,
		 TRITON_ST_FLFLTMST.FLARARPT As ArrivalAirport,
		 TRITON_ST_FLFLTMST.FLDPDATE AS DepartDate,
		 TRITON_ST_FLFLTMST.FLARDATE AS ArrivalDate
	FROM 
		ST_MARINE_PAX	
	INNER JOIN 
		TRITON_ST_FLPASSLK
		ON
			ST_MARINE_PAX.BkgRef = TRITON_ST_FLPASSLK.PLNUMB
			AND
			ST_MARINE_PAX.PaxNo = TRITON_ST_FLPASSLK.PLPASS#
	INNER JOIN 
		(
			SELECT
				RFCLNO,
				RFFNBR,
				RFROUTE#,
				RFNUMB,
				MIN(RFFLRF) AS RFFLRF,
				SUM(RFSREQ) AS RFSREQ
			FROM
				TRITON_ST_FLFLREF
			GROUP BY
				RFCLNO,
				RFFNBR,
				RFROUTE#,
				RFNUMB
		) TRITON_ST_FLFLREF
		ON
			TRITON_ST_FLFLREF.RFNUMB = TRITON_ST_FLPASSLK.PLNUMB
			AND
			TRITON_ST_FLFLREF.RFROUTE# = TRITON_ST_FLPASSLK.PLROUTE	
	LEFT JOIN
		TRITON_STAGE.dbo.TRITON_ST_FLFLTMST TRITON_ST_FLFLTMST
		ON
			TRITON_ST_FLFLTMST.FLNUMBER = TRITON_ST_FLFLREF.RFFNBR
	WHERE
		ST_MARINE_PAX.SourceSysID = 102
		AND
		TRITON_ST_FLPASSLK.PLAGE <>'B'
		

	EXEC  AMI_Galaxy.dbo.AMI_LOG_CLOSE  'TRTN','ST_PAXFLT' --, @row_count=@rowcount
	
END

GO
/****** Object:  StoredProcedure [dbo].[BUILD_ST_MARINE_PAYMENT]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[BUILD_ST_MARINE_PAYMENT]


AS

	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'TRTN','ST_PAY','BUILD_ST_MARINE_PAYMENT'

	TRUNCATE TABLE ST_MARINE_PAYMENT

	INSERT INTO 
		ST_MARINE_PAYMENT
	SELECT 
		CAST(CAST(102 AS VARCHAR(3)) 
		+	CASE WHEN SUBSTRING(TRITON_ST_CRMST.CRCNNB,1,1) IN ('0','1','2','3','4','5','6','7','8','9') 
				THEN
					RIGHT('0000000'+ CAST(TRITON_ST_CRMST.CRCNNB AS VARCHAR(7)), 7) 
				ELSE
					CAST(ASCII(SUBSTRING(TRITON_ST_CRMST.CRCNNB,1,1)) AS CHAR(2)) + SUBSTRING(TRITON_ST_CRMST.CRCNNB,2,LEN(TRITON_ST_CRMST.CRCNNB)) 
				END	
		AS BIGINT) AS i_Sk_Bkg,
		102 AS SourceSysID,
		'TRITON' AS SystemName,
		'M' AS DivisionCode,
		BrandCode AS BrandCode,
		ProductCode AS ProductCode,	
		0 AS CompanyNo,
		SeasonCode As SeasonCode,
		LTRIM(RTRIM(TRITON_ST_CRMST.CRCNNB)) AS BkgRef,
		CRDATE AS EntrytDate,
		CRTIME AS EntrytTime,
		ST_MARINE_FBKG.StartDate,
		LTRIM(RTRIM(CRLOCT)) AS BaseLocation,
		LTRIM(RTRIM(CRRCVD)) AS CashRecivedLocation,
		LTRIM(RTRIM(CRUSER)) AS [User],
		CRBSAM AS BaseAmount,
		CRFRAM AS ForeignAmount,
		LTRIM(RTRIM(CRDESG)) AS Currency,
		LTRIM(RTRIM(CRLORR)) AS [Source],
		LTRIM(RTRIM(CRTYPE)) AS [Type],
		CASE 
			WHEN CRTYPE = 'C' THEN 'Cash Receipt'
			WHEN CRTYPE = 'W' THEN 'Write-Off'
			WHEN CRTYPE = 'B' THEN  'Base Collection'
            WHEN CRTYPE = 'R' THEN  'Refund' 
            WHEN CRTYPE = 'T' THEN  'Transfer'
			WHEN CRTYPE = 'V' THEN 'Wires' END      
		AS PaymentMethod,
		LTRIM(RTRIM(CRREFR)) AS Reference,
		LTRIM(RTRIM(CRCCTY)) AS CreditCardType,
		LTRIM(RTRIM(CRCCAC)) AS CreditCardApproval,
		LTRIM(RTRIM(CRNBEN)) AS NoOfEntries,
		LTRIM(RTRIM(CRTRAN)) AS PaymentDesc	
	FROM
		TRITON_ST_CRMST	
	INNER JOIN 
		ST_MARINE_FBKG
		ON 
			TRITON_ST_CRMST.CRCNNB = ST_MARINE_FBKG.BkgRef
			AND
			ST_MARINE_FBKG.SourceSysID = 102
			
	INSERT INTO 
		ST_MARINE_PAYMENT
	SELECT 
		CAST(CAST(102 AS VARCHAR(3)) 
		+	CASE WHEN SUBSTRING(TRITON_ST_ZRMST.CRCNNB,1,1) IN ('0','1','2','3','4','5','6','7','8','9') 
				THEN
					RIGHT('0000000'+ CAST(TRITON_ST_ZRMST.CRCNNB AS VARCHAR(7)), 7) 
				ELSE
					CAST(ASCII(SUBSTRING(TRITON_ST_ZRMST.CRCNNB,1,1)) AS CHAR(2)) + SUBSTRING(TRITON_ST_ZRMST.CRCNNB,2,LEN(TRITON_ST_ZRMST.CRCNNB)) 
				END	
		AS BIGINT) AS i_Sk_Bkg,
		102 AS SourceSysID,
		'TRITON' AS SystemName,
		'M' AS DivisionCode,
		BrandCode AS BrandCode,
		ProductCode AS ProductCode,	
		0 AS CompanyNo,
		SeasonCode As SeasonCode,
		LTRIM(RTRIM(TRITON_ST_ZRMST.CRCNNB)) AS BkgRef,
		CRDATE AS EntrytDate,
		CRTIME AS EntrytTime,
		ST_MARINE_FBKG.StartDate,
		LTRIM(RTRIM(CRLOCT)) AS BaseLocation,
		LTRIM(RTRIM(CRRCVD)) AS CashRecivedLocation,
		LTRIM(RTRIM(CRUSER)) AS [User],
		CRBSAM AS BaseAmount,
		CRFRAM AS ForeignAmount,
		LTRIM(RTRIM(CRDESG)) AS Currency,
		LTRIM(RTRIM(CRLORR)) AS [Source],
		LTRIM(RTRIM(CRTYPE)) AS [Type],
		CASE 
			WHEN CRTYPE = 'C' THEN 'Cash Receipt'
			WHEN CRTYPE = 'W' THEN 'Write-Off'
			WHEN CRTYPE = 'B' THEN  'Base Collection'
            WHEN CRTYPE = 'R' THEN  'Refund' 
            WHEN CRTYPE = 'T' THEN  'Transfer'
			WHEN CRTYPE = 'V' THEN 'Wires' END      
		AS PaymentMethod,
		LTRIM(RTRIM(CRREFR)) AS Reference,
		LTRIM(RTRIM(CRCCTY)) AS CreditCardType,
		LTRIM(RTRIM(CRCCAC)) AS CreditCardApproval,
		LTRIM(RTRIM(CRNBEN)) AS NoOfEntries,
		NULL AS PaymentDesc	
	FROM
		TRITON_ST_ZRMST	
	INNER JOIN 
		ST_MARINE_FBKG
		ON 
			TRITON_ST_ZRMST.CRCNNB = ST_MARINE_FBKG.BkgRef
			AND
			ST_MARINE_FBKG.SourceSysID = 102

			
			
	INSERT INTO 
		ST_MARINE_PAYMENT
	SELECT 
		CAST(CAST(101 AS VARCHAR(3)) 
		+	CASE WHEN SUBSTRING(SUNSAIL_ST_CRMST.CRCNNB,1,1) IN ('0','1','2','3','4','5','6','7','8','9') 
				THEN
					RIGHT('0000000'+ CAST(SUNSAIL_ST_CRMST.CRCNNB AS VARCHAR(7)), 7) 
				ELSE
					CAST(ASCII(SUBSTRING(SUNSAIL_ST_CRMST.CRCNNB,1,1)) AS CHAR(2)) + SUBSTRING(SUNSAIL_ST_CRMST.CRCNNB,2,LEN(SUNSAIL_ST_CRMST.CRCNNB)) 
				END	
		AS BIGINT) AS i_Sk_Bkg,
		101 AS SourceSysID,
		'TRITON' AS SystemName,
		'M' AS DivisionCode,
		BrandCode AS BrandCode,
		ProductCode AS ProductCode,
		1 AS CompanyNo,
		SeasonCode As SeasonCode,	
		RTRIM(LTRIM(SUNSAIL_ST_CRMST.CRCNNB)) AS BkgRef,
		CRDATE AS EntrytDate,
		CRTIME AS EntrytTime,
		ST_MARINE_FBKG.StartDate,
		LTRIM(RTRIM(CRLOCT)) AS BaseLocation,
		LTRIM(RTRIM(CRRCVD)) AS CashRecivedLocation,
		LTRIM(RTRIM(CRUSER)) AS [User],
		CRBSAM AS BaseAmount,
		CRFRAM AS ForeignAmount,
		LTRIM(RTRIM(CRDESG)) AS Currency,
		LTRIM(RTRIM(CRLORR)) AS [Source],
		LTRIM(RTRIM(CRTYPE)) AS [Type],CASE 
			WHEN CRTYPE = 'C' THEN 'Cash Receipt'
			WHEN CRTYPE = 'W' THEN 'Write-Off'
			WHEN CRTYPE = 'B' THEN  'Base Collection'
            WHEN CRTYPE = 'R' THEN  'Refund' 
            WHEN CRTYPE = 'T' THEN  'Transfer'
			WHEN CRTYPE = 'V' THEN 'Wires' END      
		AS PaymentMethod,
		LTRIM(RTRIM(CRREFR)) AS Reference,
		LTRIM(RTRIM(CRCCTY)) AS CreditCardType,
		LTRIM(RTRIM(CRCCAC)) AS CreditCardApproval,
		LTRIM(RTRIM(CRNBEN)) AS NoOfEntries,
		LTRIM(RTRIM(CRTRAN)) AS PaymentDesc	
	FROM
		SUNSAIL_ST_CRMST	
	INNER JOIN 
		ST_MARINE_FBKG
		ON 
			SUNSAIL_ST_CRMST.CRCNNB = ST_MARINE_FBKG.BkgRef
			AND
			ST_MARINE_FBKG.SourceSysID = 101
	WHERE 
		SUNSAIL_ST_CRMST.CRCNNB NOT IN ('XXXXXX')


	INSERT INTO 
		ST_MARINE_PAYMENT
	SELECT 
		CAST(CAST(101 AS VARCHAR(3)) 
		+	CASE WHEN SUBSTRING(SUNSAIL_ST_ZRMST.CRCNNB,1,1) IN ('0','1','2','3','4','5','6','7','8','9') 
				THEN
					RIGHT('0000000'+ CAST(SUNSAIL_ST_ZRMST.CRCNNB AS VARCHAR(7)), 7) 
				ELSE
					CAST(ASCII(SUBSTRING(SUNSAIL_ST_ZRMST.CRCNNB,1,1)) AS CHAR(2)) + SUBSTRING(SUNSAIL_ST_ZRMST.CRCNNB,2,LEN(SUNSAIL_ST_ZRMST.CRCNNB)) 
				END	
		AS BIGINT) AS i_Sk_Bkg,
		101 AS SourceSysID,
		'TRITON' AS SystemName,
		'M' AS DivisionCode,
		BrandCode AS BrandCode,
		ProductCode AS ProductCode,	
		1 AS CompanyNo,
		SeasonCode As SeasonCode,
		LTRIM(RTRIM(SUNSAIL_ST_ZRMST.CRCNNB)) AS BkgRef,
		CRDATE AS EntrytDate,
		CRTIME AS EntrytTime,
		ST_MARINE_FBKG.StartDate,
		LTRIM(RTRIM(CRLOCT)) AS BaseLocation,
		LTRIM(RTRIM(CRRCVD)) AS CashRecivedLocation,
		LTRIM(RTRIM(CRUSER)) AS [User],
		CRBSAM AS BaseAmount,
		CRFRAM AS ForeignAmount,
		LTRIM(RTRIM(CRDESG)) AS Currency,
		LTRIM(RTRIM(CRLORR)) AS [Source],
		LTRIM(RTRIM(CRTYPE)) AS [Type],
		CASE 
			WHEN CRTYPE = 'C' THEN 'Cash Receipt'
			WHEN CRTYPE = 'W' THEN 'Write-Off'
			WHEN CRTYPE = 'B' THEN  'Base Collection'
            WHEN CRTYPE = 'R' THEN  'Refund' 
            WHEN CRTYPE = 'T' THEN  'Transfer'
			WHEN CRTYPE = 'V' THEN 'Wires' END      
		AS PaymentMethod,
		LTRIM(RTRIM(CRREFR)) AS Reference,
		LTRIM(RTRIM(CRCCTY)) AS CreditCardType,
		LTRIM(RTRIM(CRCCAC)) AS CreditCardApproval,
		LTRIM(RTRIM(CRNBEN)) AS NoOfEntries,
		NULL AS PaymentDesc	
	FROM
		SUNSAIL_ST_ZRMST	
	INNER JOIN 
		ST_MARINE_FBKG
		ON 
			SUNSAIL_ST_ZRMST.CRCNNB = ST_MARINE_FBKG.BkgRef
			AND
			ST_MARINE_FBKG.SourceSysID = 101

	EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'TRTN','ST_PAY'
	




GO
/****** Object:  StoredProcedure [dbo].[BUILD_ST_MARINE_SOLDPERWEEK]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[BUILD_ST_MARINE_SOLDPERWEEK]
AS

BEGIN


	EXEC  AMI_Galaxy.dbo.AMI_LOG_OPEN 'TRTN','ST_SOLD','BUILD_ST_MARINE_SOLDPERWEEK'
	
	TRUNCATE TABLE ST_MARINE_SOLDPERWEEK

	INSERT INTO 
		ST_MARINE_SOLDPERWEEK
	SELECT
		i_BK_FLNUMB,
		i_BK_FLTY,
		ST_MARINE_FLIGHTINVENTORY.ArrDate,
		ST_MARINE_FLIGHTINVENTORY.ArrAirport,
		i_BK_LOCT,
		NoDays,
		1 AS Sold,
		SourceSysID,
		BrandCode
	FROM 
		ST_MARINE_FLIGHTINVENTORY
	INNER JOIN
		AMI_Static.dbo.SB_MARINE_BASEAIRPORTLINK SB_MARINE_BASEAIRPORTLINK
		ON 
			ST_MARINE_FLIGHTINVENTORY.ArrAirport =  SB_MARINE_BASEAIRPORTLINK.a_ArrAirportCode
			AND
			ST_MARINE_FLIGHTINVENTORY.SourceSysID = SB_MARINE_BASEAIRPORTLINK.a_SourceSystemID
	LEFT JOIN 			
		TRITON_SFT_ALLOCATION
		ON
			TRITON_SFT_ALLOCATION.i_BK_LOCT = SB_MARINE_BASEAIRPORTLINK.a_BaseCode
			AND
			TRITON_SFT_ALLOCATION.i_SK_SaleDate BETWEEN 
												ST_MARINE_FLIGHTINVENTORY.ArrDate 
												AND 
												CONVERT(INT,(CONVERT(VARCHAR(8),DATEADD(d,ST_MARINE_FLIGHTINVENTORY.NoDays-1,
												CONVERT(DATETIME,CONVERT(VARCHAR(8),BRAINII.dbo.fn_CheckDate(ST_MARINE_FLIGHTINVENTORY.ArrDate),112))),112)))
												
	
			AND
			TRITON_SFT_ALLOCATION.i_BK_SourceSysID = ST_MARINE_FLIGHTINVENTORY.SourceSysID 
			AND 
			i_BK_BookingStatus IN  (1,3,21)
	WHERE 
		ST_MARINE_FLIGHTINVENTORY.i_SK_Bkg = 0 
		AND
		CONVERT(DATETIME,CONVERT(VARCHAR(8),BRAINII.dbo.fn_CheckDate(ST_MARINE_FLIGHTINVENTORY.ArrDate),112)) > '2013-11-01' --DATEADD(d,-60,GETDATE())
	GROUP BY
		i_BK_FLNUMB,
		i_BK_FLTY,
		ST_MARINE_FLIGHTINVENTORY.ArrDate,
		ST_MARINE_FLIGHTINVENTORY.ArrAirport,
		i_BK_LOCT,
		NoDays,
		SourceSysID,
		BrandCode

		
	EXEC  AMI_Galaxy.dbo.AMI_LOG_CLOSE 'TRTN','ST_SOLD'
END
GO
/****** Object:  StoredProcedure [dbo].[BUILD_SUNSAIL_LOG]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[BUILD_SUNSAIL_LOG]
AS
  
  BEGIN
  
	SELECT 
		'TRTN-Sunsail' AS [Schema], 
		LogNameFILE AS LogFileName,
		'Extract SUNSAIL File '+ LogNameFILE AS LogSchemaExtract,
		LogDate,
		CASE WHEN LogNamePASS IS NOT NULL THEN 'PASS' ELSE 'FAIL' END AS PassFail,
		CASE WHEN LogTextPASS IS NOT NULL THEN LogTextPASS ELSE LogTextFAIL END AS LogText,
		LogTextTransferred
	FROM 
	(
		SELECT
			LOG_FILE.LogName AS LogNameFILE,
			LOG_FILE.LogText AS LogTextFILE,
			LOG_FILE.LogDate,
			LOG_FAIL.LogName AS LogNameFAIL,
			LOG_FAIL.LogText AS LogTextFAIL,
			LOG_PASS.LogName AS LogNamePASS,
			LOG_PASS.LogText AS LogTextPASS,
			LOG_TRANSFERRED.LogName AS LogNameTRANSFERRED,
			LOG_TRANSFERRED.LogText AS LogTextTRANSFERRED
		FROM
		(
			SELECT 
				LogName,
				LogText,
				LogDate
			FROM 
				SUNSAIL_LOGTABLE
			WHERE
				LogText LIKE 'Transfer file:%'
		) LOG_FILE
		LEFT JOIN
		(
			SELECT 
				LogName,
				LogText
			FROM 
				SUNSAIL_LOGTABLE
			WHERE
				LogText LIKE 'Receive failed%'
		) LOG_FAIL
		ON
			LOG_FAIL.LogName=LOG_FILE.LogName
		LEFT JOIN
		(
			SELECT 
				LogName,
				LogText
			FROM 
				SUNSAIL_LOGTABLE
			WHERE
				LogText LIKE 'Receive completed successfully%'
		) LOG_PASS
		ON
			LOG_PASS.LogName=LOG_FILE.LogName
		LEFT JOIN
		(
			SELECT 
				LogName,
				LogText
			FROM 
				SUNSAIL_LOGTABLE
			WHERE
				LogText LIKE 'Rows Transferred%'
		) LOG_TRANSFERRED
		ON
			LOG_TRANSFERRED.LogName=LOG_FILE.LogName
	)LogFile
		
END
GO
/****** Object:  StoredProcedure [dbo].[BUILD_SUNSAIL_SFT_RATES]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE PROCEDURE [dbo].[BUILD_SUNSAIL_SFT_RATES]
AS

	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'TRTN','SUNRATES','BUILD_SUNSAIL_SFT_RATES'

	DECLARE @MaxDate INT

	SET @MaxDate = 
		(
			SELECT 
				CONVERT(INT,CONVERT(VARCHAR(4),a_Year +1) + '0101')
			FROM 
				(
				SELECT 
					MAX(FRSTDT) AS MAXDate 
				FROM 
					SUNSAIL_ST_FRMST
				) VWMaxDate
			LEFT JOIN 
				AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR
				ON
					VWMaxDate.MAXDate  = CONF_DT_CALENDAR.i_SK_Calendar
		)



	TRUNCATE TABLE SUNSAIL_SFT_RATES

	--CREATE INDEXES
	EXEC IX_CREATE_SUNSAIL_ST_FRMST

	-- Triton inventory
	INSERT INTO
		SUNSAIL_SFT_RATES

	SELECT
		VWEndDate.FRLOCT, 
		VWEndDate.FRYCTY, 
		SUNSAIL_ST_FRMST_RATE.FRCREW, 
		CONF_DT_CALENDAR_FREFDT.i_SK_Calendar,
		NULL AS i_SK_EffTo,
		DENSE_RANK() OVER (PARTITION BY VWEndDate.FRLOCT,VWEndDate.FRYCTY,VWEndDate.FRDESG ORDER BY CONF_DT_CALENDAR_FREFDT.i_SK_Calendar) AS EffNum,
		CONF_DT_CALENDAR_START.i_SK_Calendar As StartDate,
		CONF_DT_CALENDAR_END.i_SK_Calendar As EndDate,
		SUNSAIL_ST_FRMST_RATE.FRFRAT,
		SUNSAIL_ST_FRMST_RATE.FREACH,
		VWEndDate.FRDESG,
		101,
		'Neptune'
	FROM
		(
			SELECT 
				SUNSAIL_ST_FRMST_START.FRLOCT, 
				SUNSAIL_ST_FRMST_START.FRYCTY, 
				SUNSAIL_ST_FRMST_START.FREFDT,
				SUNSAIL_ST_FRMST_START.FRSTDT As StartDate,
				ISNULL(MIN(SUNSAIL_ST_FRMST_END.FRSTDT),@MaxDate) AS EndDate,
				SUNSAIL_ST_FRMST_START.FRDESG 
			FROM 
				TRITON_Stage.dbo.SUNSAIL_ST_FRMST SUNSAIL_ST_FRMST_START
			LEFT JOIN 
				TRITON_Stage.dbo.SUNSAIL_ST_FRMST SUNSAIL_ST_FRMST_END
				ON
					SUNSAIL_ST_FRMST_START.FRLOCT = SUNSAIL_ST_FRMST_END.FRLOCT
					AND
					SUNSAIL_ST_FRMST_START.FRYCTY = SUNSAIL_ST_FRMST_END.FRYCTY
					AND
					SUNSAIL_ST_FRMST_START.FRDESG = SUNSAIL_ST_FRMST_END.FRDESG
					AND
					SUNSAIL_ST_FRMST_START.FREFDT = SUNSAIL_ST_FRMST_END.FREFDT
					AND
					SUNSAIL_ST_FRMST_START.FRSTDT < ISNULL(SUNSAIL_ST_FRMST_END.FRSTDT,@MaxDate)
			GROUP BY
				SUNSAIL_ST_FRMST_START.FRLOCT, 
				SUNSAIL_ST_FRMST_START.FRYCTY, 
				SUNSAIL_ST_FRMST_START.FREFDT,
				SUNSAIL_ST_FRMST_START.FRSTDT,
				SUNSAIL_ST_FRMST_START.FRDESG
			)VWEndDate
		LEFT JOIN
			AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_FREFDT
			ON
				VWEndDate.FREFDT = CONF_DT_CALENDAR_FREFDT.i_SK_Calendar 
		LEFT JOIN
			AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_START
			ON
				VWEndDate.StartDate = CONF_DT_CALENDAR_START.i_SK_Calendar 
		LEFT JOIN
			AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_YESTERDAY
			ON
				VWEndDate.EndDate = CONF_DT_CALENDAR_YESTERDAY.i_SK_Calendar 
		LEFT JOIN
			AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_END
			ON
				CONF_DT_CALENDAR_YESTERDAY.a_Yesterday = CONF_DT_CALENDAR_END.a_Date 
		LEFT JOIN 
			TRITON_Stage.dbo.SUNSAIL_ST_FRMST SUNSAIL_ST_FRMST_RATE
			ON
				VWEndDate.FRLOCT = SUNSAIL_ST_FRMST_RATE.FRLOCT
				AND
				VWEndDate.FRYCTY = SUNSAIL_ST_FRMST_RATE.FRYCTY
				AND
				VWEndDate.FRDESG = SUNSAIL_ST_FRMST_RATE.FRDESG
				AND
				VWEndDate.FREFDT = SUNSAIL_ST_FRMST_RATE.FREFDT
				AND
				VWEndDate.Startdate = SUNSAIL_ST_FRMST_RATE.FRSTDT

	--DROP INDEXES
	EXEC IX_DROP_SUNSAIL_ST_FRMST

	--- Populate SUNSAIL_SFT_RATESSTAGE with the start date that don't exist in the new effective from list dates
	SET NOCOUNT ON;

	DECLARE @EffNumFirst INT
	DECLARE @EffNumSecond INT
	DECLARE @MaxEffNum INT
	DECLARE @LOCT VARCHAR(3)
	DECLARE @FLTY VARCHAR(10)
	DECLARE @Currency VARCHAR(3)

	TRUNCATE TABLE SUNSAIL_SFT_RATESSTAGE

	DECLARE FleetRate_cursor CURSOR FOR
		SELECT
			i_BK_LOCT,
			i_BK_FLTY,
			a_Currency,
			MAX(EffNum) AS MaxEffNum
		FROM
			SUNSAIL_SFT_RATES
		GROUP BY
			i_BK_LOCT,
			i_BK_FLTY,
			a_Currency

	OPEN FleetRate_cursor

	FETCH NEXT FROM FleetRate_cursor
	INTO @LOCT, @FLTY, @Currency, @MaxEffNum
	
	WHILE @@FETCH_STATUS = 0
	BEGIN
		--PRINT @LOCT + ' ' +  @FLTY +' ' + @Currency
	
		SET @EffNumFirst = 1

		WHILE @EffNumFirst < @MaxEffNum 
			BEGIN

				SET @EffNumSecond = @EffNumFirst + 1

				WHILE @EffNumSecond <= @MaxEffNum 	  
				BEGIN

					INSERT INTO 
						SUNSAIL_SFT_RATESSTAGE
					SELECT 
						SUNSAIL_SFT_RATES.i_BK_LOCT, 
						SUNSAIL_SFT_RATES.i_BK_FLTY, 
						SUNSAIL_SFT_RATES.a_Currency,
						SUNSAIL_SFT_RATES.i_BK_CREW,
						SUNSAIL_SFT_RATES.i_SK_EffFrom,
						SUNSAIL_SFT_RATES.EffNum,
						SUNSAIL_SFT_RATES.i_SK_StartDate,
						SUNSAIL_SFT_RATES.a_Rate,
						SUNSAIL_SFT_RATES.a_RatePerPerson,
						SUNSAIL_SFT_RATES_NEXT.i_SK_EffFrom,
						SUNSAIL_SFT_RATES_NEXT.EffNum,
						SUNSAIL_SFT_RATES_NEXT.i_SK_StartDate,
						SUNSAIL_SFT_RATES_NEXT.i_SK_EndDate,
						SUNSAIL_SFT_RATES_NEXT.a_Rate,
						SUNSAIL_SFT_RATES_NEXT.a_RatePerPerson
					FROM 
						SUNSAIL_SFT_RATES
					LEFT  JOIN
							SUNSAIL_SFT_RATES SUNSAIL_SFT_RATES_NEXT
							ON
							SUNSAIL_SFT_RATES.i_BK_LOCT = SUNSAIL_SFT_RATES_NEXT.i_BK_LOCT
							AND
							SUNSAIL_SFT_RATES.i_BK_FLTY = SUNSAIL_SFT_RATES_NEXT.i_BK_FLTY
							AND
							SUNSAIL_SFT_RATES.a_Currency = SUNSAIL_SFT_RATES_NEXT.a_Currency
							AND
							SUNSAIL_SFT_RATES.i_SK_StartDate BETWEEN SUNSAIL_SFT_RATES_NEXT.i_SK_StartDate AND SUNSAIL_SFT_RATES_NEXT.i_SK_EndDate
							AND
							SUNSAIL_SFT_RATES_NEXT.EffNum = @EffNumSecond
					WHERE 
						SUNSAIL_SFT_RATES.i_BK_LOCT = @LOCT
						AND
						SUNSAIL_SFT_RATES.i_BK_FLTY = @FLTY
						AND
						SUNSAIL_SFT_RATES.a_Currency =@Currency
						AND
						SUNSAIL_SFT_RATES.EffNum = @EffNumFirst
						AND
						SUNSAIL_SFT_RATES.i_SK_StartDate > SUNSAIL_SFT_RATES_NEXT.i_SK_EffFrom
						AND
						SUNSAIL_SFT_RATES.i_SK_StartDate <> SUNSAIL_SFT_RATES_NEXT.i_SK_StartDate

						--- dates less than the min next date

					INSERT INTO 
						SUNSAIL_SFT_RATESSTAGE
					SELECT 
						SUNSAIL_SFT_RATES.i_BK_LOCT, 
						SUNSAIL_SFT_RATES.i_BK_FLTY, 
						SUNSAIL_SFT_RATES.a_Currency,
						SUNSAIL_SFT_RATES.i_BK_CREW,
						SUNSAIL_SFT_RATES.i_SK_EffFrom,
						SUNSAIL_SFT_RATES.EffNum,
						SUNSAIL_SFT_RATES.i_SK_StartDate,
						SUNSAIL_SFT_RATES.a_Rate,
						SUNSAIL_SFT_RATES.a_RatePerPerson,
						SUNSAIL_SFT_RATES_NEXT.i_SK_EffFrom,
						SUNSAIL_SFT_RATES_NEXT.EffNum,
						SUNSAIL_SFT_RATES.i_SK_StartDate,
						SUNSAIL_SFT_RATES.i_SK_EndDate,
						SUNSAIL_SFT_RATES.a_Rate,
						SUNSAIL_SFT_RATES.a_RatePerPerson
					FROM 
						SUNSAIL_SFT_RATES
					LEFT  JOIN
						(
						SELECT 
							i_BK_LOCT,
							i_BK_FLTY,
							a_Currency,
							EffNum,
							i_SK_EffFrom,
							MIN( i_SK_StartDate) AS i_SK_StartDate
						FROM
							SUNSAIL_SFT_RATES 
						GROUP BY
							i_BK_LOCT,
							i_BK_FLTY,
							a_Currency,
							i_SK_EffFrom,
							EffNum
						) SUNSAIL_SFT_RATES_NEXT
							ON
							SUNSAIL_SFT_RATES.i_BK_LOCT = SUNSAIL_SFT_RATES_NEXT.i_BK_LOCT
							AND
							SUNSAIL_SFT_RATES.i_BK_FLTY = SUNSAIL_SFT_RATES_NEXT.i_BK_FLTY
							AND
							SUNSAIL_SFT_RATES.a_Currency = SUNSAIL_SFT_RATES_NEXT.a_Currency
							AND
							SUNSAIL_SFT_RATES.i_SK_StartDate < SUNSAIL_SFT_RATES_NEXT.i_SK_StartDate
							AND
							SUNSAIL_SFT_RATES_NEXT.EffNum = @EffNumSecond
					WHERE 
						SUNSAIL_SFT_RATES.i_BK_LOCT = @LOCT
						AND
						SUNSAIL_SFT_RATES.i_BK_FLTY = @FLTY
						AND
						SUNSAIL_SFT_RATES.a_Currency =@Currency
						AND
						SUNSAIL_SFT_RATES.EffNum = @EffNumFirst
						AND
						SUNSAIL_SFT_RATES.i_SK_StartDate > SUNSAIL_SFT_RATES_NEXT.i_SK_EffFrom


					SET @EffNumSecond= @EffNumSecond + 1
				END

				SET @EffNumFirst= @EffNumFirst + 1
			END
		FETCH NEXT FROM FleetRate_cursor
		INTO @LOCT, @FLTY, @Currency, @MaxEffNum
	END

	CLOSE FleetRate_cursor
	DEALLOCATE FleetRate_cursor

	-- Add the dates from the SUNSAIL_SFT_RATESSTAGE table
	INSERT INTO
		SUNSAIL_SFT_RATES
			(
				i_BK_LOCT,
				i_BK_FLTY,
				i_BK_CREW,
				i_SK_EffFrom,
				i_SK_EffTo,
				EffNum,
				i_SK_StartDate,
				i_SK_EndDate,
				a_Rate,
				a_RatePerPerson,
				a_Currency,
				i_BK_SourceSysID,
				i_BK_SourceSys
			)
			SELECT 
				SUNSAIL_SFT_RATESSTAGE.i_BK_LOCT,
				SUNSAIL_SFT_RATESSTAGE.i_BK_FLTY,
				SUNSAIL_SFT_RATESSTAGE.i_BK_CREW,
				i_SK_EffFromSecond,
				NULL AS i_SK_EffTo,
				MAXEffectiveDate.EffNumSecond,
				MAXEffectiveDate.i_SK_StartDateFirst,
				i_SK_EndDateSecond,
				a_RateSecond,
				a_RatePerPersonSecond,
				SUNSAIL_SFT_RATESSTAGE.a_Currency,
				101 AS i_BK_SourceSysID,
				'Neptune' AS i_BK_SourceSys
			FROM
			(
				SELECT 
						SUNSAIL_SFT_RATESSTAGE.i_BK_LOCT,
						SUNSAIL_SFT_RATESSTAGE.i_BK_FLTY,
						--SUNSAIL_SFT_RATESSTAGE.i_BK_CREW,
						--NULL AS i_SK_EffTo,
						MAX(EffNumFirst) AS EffNUM,
						EffNumSecond,
						i_SK_StartDateFirst,
						SUNSAIL_SFT_RATESSTAGE.a_Currency,
						101 AS i_BK_SourceSysID,
						'Neptune' AS i_BK_SourceSys	
				FROM 
					SUNSAIL_SFT_RATESSTAGE
				GROUP BY 
					SUNSAIL_SFT_RATESSTAGE.i_BK_LOCT,
					SUNSAIL_SFT_RATESSTAGE.i_BK_FLTY,
					--SUNSAIL_SFT_RATESSTAGE.i_BK_CREW,
					EffNumSecond,
					i_SK_StartDateFirst,
					SUNSAIL_SFT_RATESSTAGE.a_Currency
			) MAXEffectiveDate
			LEFT JOIN 
				SUNSAIL_SFT_RATESSTAGE
				ON
					SUNSAIL_SFT_RATESSTAGE.i_BK_LOCT = MAXEffectiveDate.i_BK_LOCT
					AND
					SUNSAIL_SFT_RATESSTAGE.i_BK_FLTY = MAXEffectiveDate.i_BK_FLTY
					AND
					SUNSAIL_SFT_RATESSTAGE.a_Currency = MAXEffectiveDate.a_Currency 
					AND
					SUNSAIL_SFT_RATESSTAGE.EffNumFirst = MAXEffectiveDate.EffNum
					AND
					SUNSAIL_SFT_RATESSTAGE.EffNumSecond = MAXEffectiveDate.EffNumSecond
					AND
					SUNSAIL_SFT_RATESSTAGE.i_SK_StartDateFirst = MAXEffectiveDate.i_SK_StartDateFirst
				

	-- Update i_SK_EndDate
	UPDATE 
		TRITON_Stage.dbo.SUNSAIL_SFT_RATES
	SET
		i_SK_EndDate = CONF_DT_CALENDAR_END.i_SK_Calendar	
	FROM
		TRITON_Stage.dbo.SUNSAIL_SFT_RATES SUNSAIL_SFT_RATES
	LEFT JOIN
		(
			SELECT 
				SUNSAIL_SFT_RATES_START.i_BK_LOCT, 
				SUNSAIL_SFT_RATES_START.i_BK_FLTY, 
				SUNSAIL_SFT_RATES_START.i_SK_EffFrom,
				SUNSAIL_SFT_RATES_START.i_SK_StartDate As StartDate,
				ISNULL(MIN(SUNSAIL_SFT_RATES_END.i_SK_StartDate),@MaxDate) AS EndDate,
				SUNSAIL_SFT_RATES_START.a_Currency 
			FROM 
				TRITON_Stage.dbo.SUNSAIL_SFT_RATES SUNSAIL_SFT_RATES_START
			LEFT JOIN 
				TRITON_Stage.dbo.SUNSAIL_SFT_RATES SUNSAIL_SFT_RATES_END
				ON
					SUNSAIL_SFT_RATES_START.i_BK_LOCT = SUNSAIL_SFT_RATES_END.i_BK_LOCT
					AND
					SUNSAIL_SFT_RATES_START.i_BK_FLTY = SUNSAIL_SFT_RATES_END.i_BK_FLTY
					AND
					SUNSAIL_SFT_RATES_START.a_Currency = SUNSAIL_SFT_RATES_END.a_Currency
					AND
					SUNSAIL_SFT_RATES_START.i_SK_EffFrom = SUNSAIL_SFT_RATES_END.i_SK_EffFrom
					AND
					SUNSAIL_SFT_RATES_START.i_SK_StartDate < ISNULL(SUNSAIL_SFT_RATES_END.i_SK_StartDate,@MaxDate)
			GROUP BY
				SUNSAIL_SFT_RATES_START.i_BK_LOCT, 
				SUNSAIL_SFT_RATES_START.i_BK_FLTY, 
				SUNSAIL_SFT_RATES_START.i_SK_EffFrom,
				SUNSAIL_SFT_RATES_START.i_SK_StartDate,
				SUNSAIL_SFT_RATES_START.a_Currency
			)VWEndDate
		ON
			VWEndDate.i_BK_LOCT = SUNSAIL_SFT_RATES.i_BK_LOCT
			AND
			VWEndDate.i_BK_FLTY = SUNSAIL_SFT_RATES.i_BK_FLTY
			AND
			VWEndDate.a_Currency = SUNSAIL_SFT_RATES.a_Currency
			AND
			VWEndDate.i_SK_EffFrom = SUNSAIL_SFT_RATES.i_SK_EffFrom
			AND
			VWEndDate.Startdate = SUNSAIL_SFT_RATES.i_SK_StartDate
		LEFT JOIN
			AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_YESTERDAY
			ON
				VWEndDate.EndDate = CONF_DT_CALENDAR_YESTERDAY.i_SK_Calendar 
		LEFT JOIN
			AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_END
			ON
				CONF_DT_CALENDAR_YESTERDAY.a_Yesterday = CONF_DT_CALENDAR_END.a_Date

	-- Update EffectiveTo dates
	DECLARE FleetRate_cursor CURSOR FOR
		SELECT
			i_BK_LOCT,
			i_BK_FLTY,
			a_Currency,
			MAX(EffNum) AS MaxEffNum
		FROM
			SUNSAIL_SFT_RATES
		GROUP BY
			i_BK_LOCT,
			i_BK_FLTY,
			a_Currency

	OPEN FleetRate_cursor

	FETCH NEXT FROM FleetRate_cursor
	INTO @LOCT, @FLTY, @Currency, @MaxEffNum
	
	WHILE @@FETCH_STATUS = 0
	BEGIN
		--PRINT @LOCT + ' ' +  @FLTY +' ' + @Currency
	
		SET @EffNumSecond = @MaxEffNum

		WHILE @EffNumSecond > 1	 
			BEGIN
	
				SET @EffNumFirst = @EffNumSecond - 1

				WHILE @EffNumFirst >= 1	  
				BEGIN
					
					-- Update the dates with the dates that are between start booking date and end regadles if
					-- they are cover by effective date
					UPDATE 
						SUNSAIL_SFT_RATES
					SET 
						i_SK_EffTo = ISNULL(CONF_DT_CALENDAR_END.i_SK_Calendar , @MaxDate)
					FROM 
						SUNSAIL_SFT_RATES
					LEFT  JOIN
						 SUNSAIL_SFT_RATES SUNSAIL_SFT_RATES_NEXT
						 ON
							SUNSAIL_SFT_RATES.i_BK_LOCT = SUNSAIL_SFT_RATES_NEXT.i_BK_LOCT
							AND
							SUNSAIL_SFT_RATES.i_BK_FLTY = SUNSAIL_SFT_RATES_NEXT.i_BK_FLTY
							AND
							SUNSAIL_SFT_RATES.a_Currency = SUNSAIL_SFT_RATES_NEXT.a_Currency
							AND
							SUNSAIL_SFT_RATES.i_SK_StartDate BETWEEN SUNSAIL_SFT_RATES_NEXT.i_SK_StartDate AND SUNSAIL_SFT_RATES_NEXT.i_SK_EndDate
							AND
							SUNSAIL_SFT_RATES_NEXT.EffNum = @EffNumSecond
					LEFT JOIN
						AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_YESTERDAY
						ON
							SUNSAIL_SFT_RATES_NEXT.i_SK_EffFrom = CONF_DT_CALENDAR_YESTERDAY.i_SK_Calendar 
					LEFT JOIN
						AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_END
						ON
							CONF_DT_CALENDAR_YESTERDAY.a_Yesterday = CONF_DT_CALENDAR_END.a_Date
					WHERE 
						SUNSAIL_SFT_RATES.i_BK_LOCT = @LOCT
						AND
						SUNSAIL_SFT_RATES.i_BK_FLTY = @FLTY
						AND
						SUNSAIL_SFT_RATES.a_Currency =@Currency
						AND
						SUNSAIL_SFT_RATES.EffNum = @EffNumFirst

					-- Update the dates with the dates that exist in the following effective dates
					UPDATE
						SUNSAIL_SFT_RATES
					SET
						i_SK_EffTo = CONF_DT_CALENDAR_END.i_SK_Calendar
					FROM 
						SUNSAIL_SFT_RATES
					LEFT  JOIN
						(
							SELECT 
								i_BK_LOCT, 
								i_BK_FLTY, 
								a_Currency,
								i_SK_EffFrom,
								EffNum
							FROM 
								SUNSAIL_SFT_RATES 
							GROUP BY 
								i_BK_LOCT, 
								i_BK_FLTY, 
								a_Currency,
								i_SK_EffFrom,
								EffNum
						)VW_EffDate
							ON
							SUNSAIL_SFT_RATES.i_BK_LOCT = VW_EffDate.i_BK_LOCT
							AND
							SUNSAIL_SFT_RATES.i_BK_FLTY = VW_EffDate.i_BK_FLTY
							AND
							SUNSAIL_SFT_RATES.a_Currency = VW_EffDate.a_Currency
							AND
							VW_EffDate.EffNum =  @EffNumSecond
					LEFT JOIN
						AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_YESTERDAY
						ON
							VW_EffDate.i_SK_EffFrom = CONF_DT_CALENDAR_YESTERDAY.i_SK_Calendar 
					LEFT JOIN
						AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_END
						ON
							CONF_DT_CALENDAR_YESTERDAY.a_Yesterday = CONF_DT_CALENDAR_END.a_Date
					WHERE 
						SUNSAIL_SFT_RATES.i_BK_LOCT = @LOCT
						AND
						SUNSAIL_SFT_RATES.i_BK_FLTY = @FLTY
						AND
						SUNSAIL_SFT_RATES.a_Currency =@Currency
						AND
						SUNSAIL_SFT_RATES.EffNum = @EffNumFirst
						AND
						SUNSAIL_SFT_RATES.i_SK_StartDate < VW_EffDate.i_SK_EffFrom

					SET @EffNumFirst= @EffNumFirst - 1 
				END

				SET @EffNumSecond= @EffNumSecond - 1
			END

			UPDATE 
				SUNSAIL_SFT_RATES
			SET
				i_SK_EffTo  = @MaxDate
			FROM 
				SUNSAIL_SFT_RATES
			WHERE 
				SUNSAIL_SFT_RATES.i_BK_LOCT = @LOCT
				AND
				SUNSAIL_SFT_RATES.i_BK_FLTY = @FLTY
				AND
				SUNSAIL_SFT_RATES.a_Currency =@Currency
				AND
				SUNSAIL_SFT_RATES.EffNum = @MaxEffNum

		FETCH NEXT FROM FleetRate_cursor
		INTO @LOCT, @FLTY, @Currency, @MaxEffNum
	END

	CLOSE FleetRate_cursor
	DEALLOCATE FleetRate_cursor


	EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'TRTN','SUNRATES'







GO
/****** Object:  StoredProcedure [dbo].[BUILD_SUNSAIL_SFT_RATES_MONTHLY]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE PROCEDURE [dbo].[BUILD_SUNSAIL_SFT_RATES_MONTHLY]
AS

	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'TRTN','SUNRATES','BUILD_SUNSAIL_SFT_RATES_MONTHLY'

	DECLARE @MaxDate INT
	DECLARE @CutOffDate INT

	SET @MaxDate = 
		(
			SELECT 
				CONVERT(INT,CONVERT(VARCHAR(4),a_Year +1) + '0101')
			FROM 
				(
				SELECT 
					MAX(FRSTDT) AS MAXDate 
				FROM 
					SUNSAIL_ST_FRMST
				) VWMaxDate
			LEFT JOIN 
				AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR
				ON
					VWMaxDate.MAXDate  = CONF_DT_CALENDAR.i_SK_Calendar
		)

	
	SET @CutOffDate = 
		(
			SELECT
				i_SK_Calendar
			FROM 
				(
					SELECT 
						DATEADD(day, -500, a_Date) As CutOffDate
					FROM
					(
						SELECT 
							CASE WHEN MAX(i_SK_EffFrom)> CONVERT(INT,( CONVERT(VARCHAR(8),GETDATE(),112))) THEN CONVERT(INT,( CONVERT(VARCHAR(8),GETDATE(),112))) ELSE MAX(i_SK_EffFrom) END AS MAXEffFrom
						FROM 
							SUNSAIL_SFT_RATES
						)VWMAXEffFrom
						LEFT JOIN 
							AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR
							ON
								VWMAXEffFrom.MAXEffFrom= CONF_DT_CALENDAR.i_SK_Calendar
					)VWCutOffDate
					LEFT JOIN 
						AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR
						ON
							VWCutOffDate.CutOffDate = CONF_DT_CALENDAR.a_Date
		)

	--CREATE INDEXES
	EXEC IX_CREATE_SUNSAIL_ST_FRMST

	-- Triton inventory
	DELETE FROM 
		SUNSAIL_SFT_RATES
	WHERE 
		i_SK_EffFrom > @CutOffDate

	INSERT INTO
		SUNSAIL_SFT_RATES
	SELECT
		VWEndDate.FRLOCT, 
		VWEndDate.FRYCTY, 
		SUNSAIL_ST_FRMST_RATE.FRCREW, 
		CONF_DT_CALENDAR_FREFDT.i_SK_Calendar,
		NULL AS i_SK_EffTo,
		(ISNULL(MaxEffNum,0) + DENSE_RANK() OVER (PARTITION BY VWEndDate.FRLOCT,VWEndDate.FRYCTY,VWEndDate.FRDESG ORDER BY CONF_DT_CALENDAR_FREFDT.i_SK_Calendar)) AS EffNum,
		CONF_DT_CALENDAR_START.i_SK_Calendar As StartDate,
		CONF_DT_CALENDAR_END.i_SK_Calendar As EndDate,
		SUNSAIL_ST_FRMST_RATE.FRFRAT,
		SUNSAIL_ST_FRMST_RATE.FREACH,
		VWEndDate.FRDESG,
		101,
		'Neptune'
	FROM
		(
			SELECT 
				SUNSAIL_ST_FRMST_START.FRLOCT, 
				SUNSAIL_ST_FRMST_START.FRYCTY, 
				SUNSAIL_ST_FRMST_START.FREFDT,
				SUNSAIL_ST_FRMST_START.FRSTDT As StartDate,
				ISNULL(MIN(SUNSAIL_ST_FRMST_END.FRSTDT), @MaxDate) AS EndDate,
				SUNSAIL_ST_FRMST_START.FRDESG 
			FROM 
				TRITON_Stage.dbo.SUNSAIL_ST_FRMST SUNSAIL_ST_FRMST_START
			LEFT JOIN 
				TRITON_Stage.dbo.SUNSAIL_ST_FRMST SUNSAIL_ST_FRMST_END
				ON
					SUNSAIL_ST_FRMST_START.FRLOCT = SUNSAIL_ST_FRMST_END.FRLOCT
					AND
					SUNSAIL_ST_FRMST_START.FRYCTY = SUNSAIL_ST_FRMST_END.FRYCTY
					AND
					SUNSAIL_ST_FRMST_START.FRDESG = SUNSAIL_ST_FRMST_END.FRDESG
					AND
					SUNSAIL_ST_FRMST_START.FREFDT = SUNSAIL_ST_FRMST_END.FREFDT
					AND
					SUNSAIL_ST_FRMST_START.FRSTDT < ISNULL(SUNSAIL_ST_FRMST_END.FRSTDT,@MaxDate)
			GROUP BY
				SUNSAIL_ST_FRMST_START.FRLOCT, 
				SUNSAIL_ST_FRMST_START.FRYCTY, 
				SUNSAIL_ST_FRMST_START.FREFDT,
				SUNSAIL_ST_FRMST_START.FRSTDT,
				SUNSAIL_ST_FRMST_START.FRDESG
			)VWEndDate
		LEFT JOIN
			AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_FREFDT
			ON
				VWEndDate.FREFDT = CONF_DT_CALENDAR_FREFDT.i_SK_Calendar 
		LEFT JOIN
			AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_START
			ON
				VWEndDate.StartDate = CONF_DT_CALENDAR_START.i_SK_Calendar 
		LEFT JOIN
			AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_YESTERDAY
			ON
				VWEndDate.EndDate = CONF_DT_CALENDAR_YESTERDAY.i_SK_Calendar 
		LEFT JOIN
			AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_END
			ON
				CONF_DT_CALENDAR_YESTERDAY.a_Yesterday = CONF_DT_CALENDAR_END.a_Date 
		LEFT JOIN 
			TRITON_Stage.dbo.SUNSAIL_ST_FRMST SUNSAIL_ST_FRMST_RATE
			ON
				VWEndDate.FRLOCT = SUNSAIL_ST_FRMST_RATE.FRLOCT
				AND
				VWEndDate.FRYCTY = SUNSAIL_ST_FRMST_RATE.FRYCTY
				AND
				VWEndDate.FRDESG = SUNSAIL_ST_FRMST_RATE.FRDESG
				AND
				VWEndDate.FREFDT = SUNSAIL_ST_FRMST_RATE.FREFDT
				AND
				VWEndDate.Startdate = SUNSAIL_ST_FRMST_RATE.FRSTDT
		LEFT JOIN 
			(
			SELECT
				i_BK_LOCT,
				i_BK_FLTY,
				a_Currency,
				MAX(EffNum) AS MaxEffNum
			FROM
				SUNSAIL_SFT_RATES
			WHERE
				i_SK_EffFrom < = @CutOffDate
			GROUP BY 
				i_BK_LOCT,
				i_BK_FLTY,
				a_Currency
			)VWMaxEffDate
			ON
				VWEndDate.FRLOCT = VWMaxEffDate.i_BK_LOCT
				AND
				VWEndDate.FRYCTY = VWMaxEffDate.i_BK_FLTY
				AND
				VWEndDate.FRDESG = VWMaxEffDate.a_Currency
		WHERE 
			VWEndDate.FREFDT > @CutOffDate

	--DROP INDEXES
	EXEC IX_DROP_SUNSAIL_ST_FRMST

	--- Populate SUNSAIL_SFT_RATESSTAGE with the start date that don't exist in the new effective from list dates
	SET NOCOUNT ON;

	DECLARE @EffNumFirst INT
	DECLARE @EffNumSecond INT
	DECLARE @MaxEffNum INT
	DECLARE @LOCT VARCHAR(3)
	DECLARE @FLTY VARCHAR(10)
	DECLARE @Currency VARCHAR(3)

	TRUNCATE TABLE SUNSAIL_SFT_RATESSTAGE

	DECLARE FleetRate_cursor CURSOR FOR
		SELECT
			i_BK_LOCT,
			i_BK_FLTY,
			a_Currency,
			MAX(EffNum) AS MaxEffNum
		FROM
			SUNSAIL_SFT_RATES
		GROUP BY
			i_BK_LOCT,
			i_BK_FLTY,
			a_Currency

	OPEN FleetRate_cursor

	FETCH NEXT FROM FleetRate_cursor
	INTO @LOCT, @FLTY, @Currency, @MaxEffNum
	
	WHILE @@FETCH_STATUS = 0
	BEGIN
		--PRINT @LOCT + ' ' +  @FLTY +' ' + @Currency

		--SET @EffNumFirst = 1
		SET @EffNumFirst = ISNULL(
			(
			SELECT 
				MAX(EffNum) 
			FROM
				SUNSAIL_SFT_RATES
			WHERE
				SUNSAIL_SFT_RATES.i_BK_LOCT = @LOCT
				AND
				SUNSAIL_SFT_RATES.i_BK_FLTY = @FLTY
				AND
				SUNSAIL_SFT_RATES.a_Currency =@Currency
				AND
				i_SK_EffFrom < = @CutOffDate
			GROUP BY 
				i_BK_LOCT,
				i_BK_FLTY,
				a_Currency
			) 
				,1)

		WHILE @EffNumFirst < @MaxEffNum 
			BEGIN

				SET @EffNumSecond = @EffNumFirst + 1

				WHILE @EffNumSecond < = @MaxEffNum 	  
				BEGIN

					INSERT INTO 
						SUNSAIL_SFT_RATESSTAGE
					SELECT 
						SUNSAIL_SFT_RATES.i_BK_LOCT, 
						SUNSAIL_SFT_RATES.i_BK_FLTY, 
						SUNSAIL_SFT_RATES.a_Currency,
						SUNSAIL_SFT_RATES.i_BK_CREW,
						SUNSAIL_SFT_RATES.i_SK_EffFrom,
						SUNSAIL_SFT_RATES.EffNum,
						SUNSAIL_SFT_RATES.i_SK_StartDate,
						SUNSAIL_SFT_RATES.a_Rate,
						SUNSAIL_SFT_RATES.a_RatePerPerson,
						SUNSAIL_SFT_RATES_NEXT.i_SK_EffFrom,
						SUNSAIL_SFT_RATES_NEXT.EffNum,
						SUNSAIL_SFT_RATES_NEXT.i_SK_StartDate,
						SUNSAIL_SFT_RATES_NEXT.i_SK_EndDate,
						SUNSAIL_SFT_RATES_NEXT.a_Rate,
						SUNSAIL_SFT_RATES_NEXT.a_RatePerPerson
					FROM 
						SUNSAIL_SFT_RATES
					LEFT  JOIN
							SUNSAIL_SFT_RATES SUNSAIL_SFT_RATES_NEXT
							ON
							SUNSAIL_SFT_RATES.i_BK_LOCT = SUNSAIL_SFT_RATES_NEXT.i_BK_LOCT
							AND
							SUNSAIL_SFT_RATES.i_BK_FLTY = SUNSAIL_SFT_RATES_NEXT.i_BK_FLTY
							AND
							SUNSAIL_SFT_RATES.a_Currency = SUNSAIL_SFT_RATES_NEXT.a_Currency
							AND
							SUNSAIL_SFT_RATES.i_SK_StartDate BETWEEN SUNSAIL_SFT_RATES_NEXT.i_SK_StartDate AND SUNSAIL_SFT_RATES_NEXT.i_SK_EndDate
							AND
							SUNSAIL_SFT_RATES_NEXT.EffNum = @EffNumSecond
					WHERE 
						SUNSAIL_SFT_RATES.i_BK_LOCT = @LOCT
						AND
						SUNSAIL_SFT_RATES.i_BK_FLTY = @FLTY
						AND
						SUNSAIL_SFT_RATES.a_Currency =@Currency
						AND
						SUNSAIL_SFT_RATES.EffNum = @EffNumFirst
						AND
						SUNSAIL_SFT_RATES.i_SK_StartDate > SUNSAIL_SFT_RATES_NEXT.i_SK_EffFrom
						AND
						SUNSAIL_SFT_RATES.i_SK_StartDate <> SUNSAIL_SFT_RATES_NEXT.i_SK_StartDate

						--- dates less than the min next date

					INSERT INTO 
						SUNSAIL_SFT_RATESSTAGE
					SELECT 
						SUNSAIL_SFT_RATES.i_BK_LOCT, 
						SUNSAIL_SFT_RATES.i_BK_FLTY, 
						SUNSAIL_SFT_RATES.a_Currency,
						SUNSAIL_SFT_RATES.i_BK_CREW,
						SUNSAIL_SFT_RATES.i_SK_EffFrom,
						SUNSAIL_SFT_RATES.EffNum,
						SUNSAIL_SFT_RATES.i_SK_StartDate,
						SUNSAIL_SFT_RATES.a_Rate,
						SUNSAIL_SFT_RATES.a_RatePerPerson,
						SUNSAIL_SFT_RATES_NEXT.i_SK_EffFrom,
						SUNSAIL_SFT_RATES_NEXT.EffNum,
						SUNSAIL_SFT_RATES.i_SK_StartDate,
						SUNSAIL_SFT_RATES.i_SK_EndDate,
						SUNSAIL_SFT_RATES.a_Rate,
						SUNSAIL_SFT_RATES.a_RatePerPerson
					FROM 
						SUNSAIL_SFT_RATES
					LEFT  JOIN
						(
						SELECT 
							i_BK_LOCT,
							i_BK_FLTY,
							a_Currency,
							EffNum,
							i_SK_EffFrom,
							MIN( i_SK_StartDate) AS i_SK_StartDate
						FROM
							SUNSAIL_SFT_RATES 
						GROUP BY
							i_BK_LOCT,
							i_BK_FLTY,
							a_Currency,
							i_SK_EffFrom,
							EffNum
						) SUNSAIL_SFT_RATES_NEXT
							ON
							SUNSAIL_SFT_RATES.i_BK_LOCT = SUNSAIL_SFT_RATES_NEXT.i_BK_LOCT
							AND
							SUNSAIL_SFT_RATES.i_BK_FLTY = SUNSAIL_SFT_RATES_NEXT.i_BK_FLTY
							AND
							SUNSAIL_SFT_RATES.a_Currency = SUNSAIL_SFT_RATES_NEXT.a_Currency
							AND
							SUNSAIL_SFT_RATES.i_SK_StartDate < SUNSAIL_SFT_RATES_NEXT.i_SK_StartDate
							AND
							SUNSAIL_SFT_RATES_NEXT.EffNum = @EffNumSecond
					WHERE 
						SUNSAIL_SFT_RATES.i_BK_LOCT = @LOCT
						AND
						SUNSAIL_SFT_RATES.i_BK_FLTY = @FLTY
						AND
						SUNSAIL_SFT_RATES.a_Currency =@Currency
						AND
						SUNSAIL_SFT_RATES.EffNum = @EffNumFirst
						AND
						SUNSAIL_SFT_RATES.i_SK_StartDate > SUNSAIL_SFT_RATES_NEXT.i_SK_EffFrom

					SET @EffNumSecond= @EffNumSecond + 1
				END

				SET @EffNumFirst= @EffNumFirst + 1
			END
		FETCH NEXT FROM FleetRate_cursor
		INTO @LOCT, @FLTY, @Currency, @MaxEffNum
	END

	CLOSE FleetRate_cursor
	DEALLOCATE FleetRate_cursor

	-- Add the dates from the SUNSAIL_SFT_RATESSTAGE table
	INSERT INTO
		SUNSAIL_SFT_RATES
			(
				i_BK_LOCT,
				i_BK_FLTY,
				i_BK_CREW,
				i_SK_EffFrom,
				i_SK_EffTo,
				EffNum,
				i_SK_StartDate,
				i_SK_EndDate,
				a_Rate,
				a_RatePerPerson,
				a_Currency,
				i_BK_SourceSysID,
				i_BK_SourceSys
			)
			SELECT
				SUNSAIL_SFT_RATESSTAGE.i_BK_LOCT,
				SUNSAIL_SFT_RATESSTAGE.i_BK_FLTY,
				SUNSAIL_SFT_RATESSTAGE.i_BK_CREW,
				i_SK_EffFromSecond,
				NULL AS i_SK_EffTo,
				MAXEffectiveDate.EffNumSecond,
				MAXEffectiveDate.i_SK_StartDateFirst,
				i_SK_EndDateSecond,
				a_RateSecond,
				a_RatePerPersonSecond,
				SUNSAIL_SFT_RATESSTAGE.a_Currency,
				101 AS i_BK_SourceSysID,
				'Neptune' AS i_BK_SourceSys
			FROM
			(
				SELECT 
						SUNSAIL_SFT_RATESSTAGE.i_BK_LOCT,
						SUNSAIL_SFT_RATESSTAGE.i_BK_FLTY,
						--SUNSAIL_SFT_RATESSTAGE.i_BK_CREW,
						--NULL AS i_SK_EffTo,
						MAX(EffNumFirst) AS EffNUM,
						EffNumSecond,
						i_SK_StartDateFirst,
						SUNSAIL_SFT_RATESSTAGE.a_Currency,
						101 AS i_BK_SourceSysID,
						'Neptune' AS i_BK_SourceSys	
				FROM 
					SUNSAIL_SFT_RATESSTAGE
				GROUP BY 
					SUNSAIL_SFT_RATESSTAGE.i_BK_LOCT,
					SUNSAIL_SFT_RATESSTAGE.i_BK_FLTY,
					--SUNSAIL_SFT_RATESSTAGE.i_BK_CREW,
					EffNumSecond,
					i_SK_StartDateFirst,
					SUNSAIL_SFT_RATESSTAGE.a_Currency
			) MAXEffectiveDate
			LEFT JOIN 
				SUNSAIL_SFT_RATESSTAGE
				ON
					SUNSAIL_SFT_RATESSTAGE.i_BK_LOCT = MAXEffectiveDate.i_BK_LOCT
					AND
					SUNSAIL_SFT_RATESSTAGE.i_BK_FLTY = MAXEffectiveDate.i_BK_FLTY
					AND
					SUNSAIL_SFT_RATESSTAGE.a_Currency = MAXEffectiveDate.a_Currency 
					AND
					SUNSAIL_SFT_RATESSTAGE.EffNumFirst = MAXEffectiveDate.EffNum
					AND
					SUNSAIL_SFT_RATESSTAGE.EffNumSecond = MAXEffectiveDate.EffNumSecond
					AND
					SUNSAIL_SFT_RATESSTAGE.i_SK_StartDateFirst = MAXEffectiveDate.i_SK_StartDateFirst
				

	-- Update i_SK_EndDate
	UPDATE 
		TRITON_Stage.dbo.SUNSAIL_SFT_RATES
	SET
		i_SK_EndDate = CONF_DT_CALENDAR_END.i_SK_Calendar	
	FROM
		TRITON_Stage.dbo.SUNSAIL_SFT_RATES SUNSAIL_SFT_RATES
	LEFT JOIN
		(
			SELECT 
				SUNSAIL_SFT_RATES_START.i_BK_LOCT, 
				SUNSAIL_SFT_RATES_START.i_BK_FLTY, 
				SUNSAIL_SFT_RATES_START.i_SK_EffFrom,
				SUNSAIL_SFT_RATES_START.i_SK_StartDate As StartDate,
				ISNULL(MIN(SUNSAIL_SFT_RATES_END.i_SK_StartDate), @MaxDate) AS EndDate,
				SUNSAIL_SFT_RATES_START.a_Currency 
			FROM 
				TRITON_Stage.dbo.SUNSAIL_SFT_RATES SUNSAIL_SFT_RATES_START
			LEFT JOIN 
				TRITON_Stage.dbo.SUNSAIL_SFT_RATES SUNSAIL_SFT_RATES_END
				ON
					SUNSAIL_SFT_RATES_START.i_BK_LOCT = SUNSAIL_SFT_RATES_END.i_BK_LOCT
					AND
					SUNSAIL_SFT_RATES_START.i_BK_FLTY = SUNSAIL_SFT_RATES_END.i_BK_FLTY
					AND
					SUNSAIL_SFT_RATES_START.a_Currency = SUNSAIL_SFT_RATES_END.a_Currency
					AND
					SUNSAIL_SFT_RATES_START.i_SK_EffFrom = SUNSAIL_SFT_RATES_END.i_SK_EffFrom
					AND
					SUNSAIL_SFT_RATES_START.i_SK_StartDate < ISNULL(SUNSAIL_SFT_RATES_END.i_SK_StartDate, @MaxDate)
			GROUP BY
				SUNSAIL_SFT_RATES_START.i_BK_LOCT, 
				SUNSAIL_SFT_RATES_START.i_BK_FLTY, 
				SUNSAIL_SFT_RATES_START.i_SK_EffFrom,
				SUNSAIL_SFT_RATES_START.i_SK_StartDate,
				SUNSAIL_SFT_RATES_START.a_Currency
			)VWEndDate
		ON
			VWEndDate.i_BK_LOCT = SUNSAIL_SFT_RATES.i_BK_LOCT
			AND
			VWEndDate.i_BK_FLTY = SUNSAIL_SFT_RATES.i_BK_FLTY
			AND
			VWEndDate.a_Currency = SUNSAIL_SFT_RATES.a_Currency
			AND
			VWEndDate.i_SK_EffFrom = SUNSAIL_SFT_RATES.i_SK_EffFrom
			AND
			VWEndDate.Startdate = SUNSAIL_SFT_RATES.i_SK_StartDate
		LEFT JOIN
			AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_YESTERDAY
			ON
				VWEndDate.EndDate = CONF_DT_CALENDAR_YESTERDAY.i_SK_Calendar 
		LEFT JOIN
			AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_END
			ON
				CONF_DT_CALENDAR_YESTERDAY.a_Yesterday = CONF_DT_CALENDAR_END.a_Date
		WHERE 
			VWEndDate.i_SK_EffFrom > @CutOffDate

	-- Update EffectiveTo dates
	DECLARE FleetRate_cursor CURSOR FOR
		SELECT
			i_BK_LOCT,
			i_BK_FLTY,
			a_Currency,
			MAX(EffNum) AS MaxEffNum
		FROM
			SUNSAIL_SFT_RATES
		GROUP BY
			i_BK_LOCT,
			i_BK_FLTY,
			a_Currency

	OPEN FleetRate_cursor

	FETCH NEXT FROM FleetRate_cursor
	INTO @LOCT, @FLTY, @Currency, @MaxEffNum
	
	WHILE @@FETCH_STATUS = 0
	BEGIN
		--PRINT @LOCT + ' ' +  @FLTY +' ' + @Currency
	
		SET @EffNumSecond = @MaxEffNum

		WHILE @EffNumSecond > 1	 
			BEGIN
	
				SET @EffNumFirst = @EffNumSecond - 1

				WHILE @EffNumFirst >= 1	  
				BEGIN
					
					-- Update the dates with the dates that are between start booking date and end regadles if
					-- they are cover by effective date
					UPDATE 
						SUNSAIL_SFT_RATES
					SET 
						i_SK_EffTo = ISNULL(CONF_DT_CALENDAR_END.i_SK_Calendar , @MaxDate)
					FROM 
						SUNSAIL_SFT_RATES
					LEFT  JOIN
						 SUNSAIL_SFT_RATES SUNSAIL_SFT_RATES_NEXT
						 ON
							SUNSAIL_SFT_RATES.i_BK_LOCT = SUNSAIL_SFT_RATES_NEXT.i_BK_LOCT
							AND
							SUNSAIL_SFT_RATES.i_BK_FLTY = SUNSAIL_SFT_RATES_NEXT.i_BK_FLTY
							AND
							SUNSAIL_SFT_RATES.a_Currency = SUNSAIL_SFT_RATES_NEXT.a_Currency
							AND
							SUNSAIL_SFT_RATES.i_SK_StartDate BETWEEN SUNSAIL_SFT_RATES_NEXT.i_SK_StartDate AND SUNSAIL_SFT_RATES_NEXT.i_SK_EndDate
							AND
							SUNSAIL_SFT_RATES_NEXT.EffNum = @EffNumSecond
					LEFT JOIN
						AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_YESTERDAY
						ON
							SUNSAIL_SFT_RATES_NEXT.i_SK_EffFrom = CONF_DT_CALENDAR_YESTERDAY.i_SK_Calendar 
					LEFT JOIN
						AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_END
						ON
							CONF_DT_CALENDAR_YESTERDAY.a_Yesterday = CONF_DT_CALENDAR_END.a_Date
					WHERE 
						SUNSAIL_SFT_RATES.i_BK_LOCT = @LOCT
						AND
						SUNSAIL_SFT_RATES.i_BK_FLTY = @FLTY
						AND
						SUNSAIL_SFT_RATES.a_Currency =@Currency
						AND
						SUNSAIL_SFT_RATES.EffNum = @EffNumFirst
						AND
						SUNSAIL_SFT_RATES.i_SK_EffFrom >= @CutOffDate

					-- Update the dates with the dates that exist in the following effective dates
					UPDATE
						SUNSAIL_SFT_RATES
					SET
						i_SK_EffTo = CONF_DT_CALENDAR_END.i_SK_Calendar
					FROM 
						SUNSAIL_SFT_RATES
					LEFT  JOIN
						(
							SELECT 
								i_BK_LOCT, 
								i_BK_FLTY, 
								a_Currency,
								i_SK_EffFrom,
								EffNum
							FROM 
								SUNSAIL_SFT_RATES 
							GROUP BY 
								i_BK_LOCT, 
								i_BK_FLTY, 
								a_Currency,
								i_SK_EffFrom,
								EffNum
						)VW_EffDate
							ON
							SUNSAIL_SFT_RATES.i_BK_LOCT = VW_EffDate.i_BK_LOCT
							AND
							SUNSAIL_SFT_RATES.i_BK_FLTY = VW_EffDate.i_BK_FLTY
							AND
							SUNSAIL_SFT_RATES.a_Currency = VW_EffDate.a_Currency
							AND
							VW_EffDate.EffNum =  @EffNumSecond
					LEFT JOIN
						AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_YESTERDAY
						ON
							VW_EffDate.i_SK_EffFrom = CONF_DT_CALENDAR_YESTERDAY.i_SK_Calendar 
					LEFT JOIN
						AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_END
						ON
							CONF_DT_CALENDAR_YESTERDAY.a_Yesterday = CONF_DT_CALENDAR_END.a_Date
					WHERE 
						SUNSAIL_SFT_RATES.i_BK_LOCT = @LOCT
						AND
						SUNSAIL_SFT_RATES.i_BK_FLTY = @FLTY
						AND
						SUNSAIL_SFT_RATES.a_Currency =@Currency
						AND
						SUNSAIL_SFT_RATES.EffNum = @EffNumFirst
						AND
						SUNSAIL_SFT_RATES.i_SK_StartDate < VW_EffDate.i_SK_EffFrom
						AND
						SUNSAIL_SFT_RATES.i_SK_EffFrom >= @CutOffDate

					SET @EffNumFirst= @EffNumFirst - 1 
				END

				SET @EffNumSecond= @EffNumSecond - 1
			END

			UPDATE 
				SUNSAIL_SFT_RATES
			SET
				i_SK_EffTo  = @MaxDate
			FROM 
				SUNSAIL_SFT_RATES
			WHERE 
				SUNSAIL_SFT_RATES.i_BK_LOCT = @LOCT
				AND
				SUNSAIL_SFT_RATES.i_BK_FLTY = @FLTY
				AND
				SUNSAIL_SFT_RATES.a_Currency =@Currency
				AND
				SUNSAIL_SFT_RATES.EffNum = @MaxEffNum
				AND
				SUNSAIL_SFT_RATES.i_SK_EffFrom >= @CutOffDate

		FETCH NEXT FROM FleetRate_cursor
		INTO @LOCT, @FLTY, @Currency, @MaxEffNum
	END

	CLOSE FleetRate_cursor
	DEALLOCATE FleetRate_cursor


	EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'TRTN','SUNRATES'







GO
/****** Object:  StoredProcedure [dbo].[BUILD_SUNSAIL_ST_CLMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[BUILD_SUNSAIL_ST_CLMST]
AS

	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'TRTN','SUN_CLMST','BUILD_SUNSAIL_ST_CLMST'

	DECLARE @intErrorCode INT

	BEGIN TRAN
		DELETE FROM  SUNSAIL_ST_CLMST WHERE CLNUMB IN  (SELECT  CLNUMB  FROM SUNSAIL_ST_CLMST_SUNDLIB )

		SELECT @intErrorCode = @@ERROR
		IF (@intErrorCode <> 0) GOTO PROBLEM

		INSERT INTO SUNSAIL_ST_CLMST  SELECT * FROM SUNSAIL_ST_CLMST_SUNDLIB  

		SELECT @intErrorCode = @@ERROR
		IF (@intErrorCode <> 0) GOTO PROBLEM
	COMMIT TRAN

	PROBLEM:
	IF (@intErrorCode <> 0) BEGIN
		ROLLBACK TRAN
	END
	
	EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'TRTN','SUN_CLMST' ,@intErrorCode
GO
/****** Object:  StoredProcedure [dbo].[BUILD_TRITON_SFT_ALLOCATION]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[BUILD_TRITON_SFT_ALLOCATION]
AS

	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'TRTN','SFT_ALLOC','BUILD_TRITON_SFT_ALLOCATION'

	TRUNCATE TABLE TRITON_SFT_ALLOCATION

	-- Triton inventory
	INSERT INTO
		TRITON_SFT_ALLOCATION
	SELECT
		CONF_DT_CALENDAR.i_SK_Calendar,
		TRITON_INVENTORY.i_SK_InventoryDate,
		0 AS i_SK_SaleDate,
		0 AS i_SK_BookedDate,
		0 AS i_SK_CancelDate,
		NULL AS i_BK_BookingStatus,
		TRITON_ST_FLMST.FLNUMB AS i_BK_FLNUMB,
		TRITON_INVENTORY.i_BK_FLTY AS i_BK_FLTY,
		0 AS i_BK_CNNB,
		0 AS i_BK_CLNB,
		TRITON_INVENTORY.i_BK_AUTO,
		TRITON_INVENTORY.i_BK_LOCT AS i_BK_LOCT,
		0 AS i_BK_FRLOCT,
		0 AS i_BK_TOLOCT,
		0 AS i_BK_DEST,
		102 AS i_BK_SourceSysID,
		'Triton',
		'M' AS	i_BK_DivisionCode,
		CASE WHEN SB_MARINE_BASE.a_ProductCode ='FOOTLOOSE' THEN 'FTL' ELSE 'MRG'END AS i_BK_BrandCode,
		0 AS i_BK_CompanyCode,
		'' AS i_BK_BkgSrcCd,
		'Y' AS i_BK_OpenBase
	FROM
		AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR
	CROSS JOIN
		TRITON_Stage.dbo.TRITON_ST_FLMST TRITON_ST_FLMST
	LEFT JOIN
		(
			SELECT
				CONF_DT_CALENDAR.i_SK_Calendar AS i_SK_InventoryDate,
				VW_TRITON_ST_FPMST_ADJUSTED.FPFLNB AS i_BK_FLNB,
				VW_TRITON_ST_FPMST_ADJUSTED.FPFLTY AS i_BK_FLTY,
				VW_TRITON_ST_FPMST_ADJUSTED.FPAUTO AS i_BK_AUTO,
				VW_TRITON_ST_FPMST_ADJUSTED.FPLOCT AS i_BK_LOCT

			FROM
			(
				SELECT 
					TRITON_ST_FPMST.FPFLNB,
					TRITON_ST_FPMST.FPSTDT,
					TRITON_ST_FPMST_ADJUSTED.FPENDT_ADJUSTED AS FPENDT,
					TRITON_ST_FPMST.FPFLTY,
					TRITON_ST_FPMST.FPAUTO,
					TRITON_ST_FPMST.FPLOCT
				FROM 
					(
					SELECT 
						TRITON_ST_FPMST_START.FPFLNB,
						TRITON_ST_FPMST_START.FPSTDT, 
						TRITON_ST_FPMST_START.FPENDT, 
						CASE WHEN TRITON_ST_FPMST_END.FPSTDT IS NULL THEN  CONVERT(NUMERIC(8,0),CONVERT(VARCHAR(8),(CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_ST_FPMST_START.FPENDT),112)),112))
						ELSE  CONVERT(NUMERIC(8,0),CONVERT(VARCHAR(8),DATEADD(d,-1,CONVERT(DATETIME,CONVERT(VARCHAR(8),TRITON_ST_FPMST_START.FPENDT),112)),112)) END AS FPENDT_ADJUSTED
					FROM 
						TRITON_Stage.dbo.TRITON_ST_FPMST TRITON_ST_FPMST_START
					LEFT JOIN 
						TRITON_Stage.dbo.TRITON_ST_FPMST TRITON_ST_FPMST_END
						ON
							TRITON_ST_FPMST_START.FPFLNB = TRITON_ST_FPMST_END.FPFLNB
							AND
							TRITON_ST_FPMST_START.FPUTCD = TRITON_ST_FPMST_END.FPUTCD
							AND
							TRITON_ST_FPMST_START.FPENDT= TRITON_ST_FPMST_END.FPSTDT
					GROUP BY 
						TRITON_ST_FPMST_START.FPFLNB,
						TRITON_ST_FPMST_START.FPSTDT, 
						TRITON_ST_FPMST_START.FPENDT,
						TRITON_ST_FPMST_END.FPSTDT
				) TRITON_ST_FPMST_ADJUSTED
				LEFT JOIN 
					TRITON_Stage.dbo.TRITON_ST_FPMST TRITON_ST_FPMST
					ON
						TRITON_ST_FPMST.FPFLNB = TRITON_ST_FPMST_ADJUSTED.FPFLNB
						AND
						TRITON_ST_FPMST.FPSTDT = TRITON_ST_FPMST_ADJUSTED.FPSTDT
						AND
						TRITON_ST_FPMST.FPENDT = TRITON_ST_FPMST_ADJUSTED.FPENDT
			) VW_TRITON_ST_FPMST_ADJUSTED
			INNER JOIN
				AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR
				ON
					CONF_DT_CALENDAR.i_SK_Calendar BETWEEN VW_TRITON_ST_FPMST_ADJUSTED.FPSTDT AND VW_TRITON_ST_FPMST_ADJUSTED.FPENDT
		) TRITON_INVENTORY
		ON
			TRITON_INVENTORY.i_SK_InventoryDate=CONF_DT_CALENDAR.i_SK_Calendar
			AND
			TRITON_INVENTORY.i_BK_FLNB=TRITON_ST_FLMST.FLNUMB
	LEFT JOIN 
		 AMI_Static.dbo.SB_MARINE_BASE SB_MARINE_BASE
		 ON
			SB_MARINE_BASE.a_BaseCode = TRITON_ST_FLMST.FLHOME
			AND 
			SB_MARINE_BASE.a_SourceSystemID = 102
	WHERE
		TRITON_INVENTORY.i_SK_InventoryDate IS NOT NULL
	
	INSERT INTO
		TRITON_SFT_ALLOCATION
	SELECT
		CONF_DT_CALENDAR.i_SK_Calendar,
		0 AS i_SK_InventoryDate,
		TRITON_SALES.i_SK_SaleDate,
		TRITON_SALES.i_SK_BookedDate,
		TRITON_SALES.i_SK_CancelDate,
		TRITON_SALES.i_BK_BookingStatus,
		TRITON_SALES.i_BK_FLNB AS i_BK_FLNUMB,
		TRITON_SALES.i_BK_FLTY AS i_BK_FLTY,
		TRITON_SALES.i_BK_CNNB,
		TRITON_SALES.i_BK_CLNB,
		'' AS i_BK_AUTO,
		TRITON_SALES.i_BK_LOCT AS i_BK_LOCT,
		TRITON_SALES.i_BK_LOCT AS i_BK_FRLOCT,
		TRITON_SALES.i_BK_TOLOCT AS i_BK_TOLOCT,
		TRITON_SALES.i_BK_DEST AS i_BK_DEST,
		102 AS i_BK_SourceSysID,
		'Triton',
		'M' AS	i_BK_DivisionCode,
		CASE WHEN SB_MARINE_BASE.a_ProductCode ='FOOTLOOSE' THEN 'FTL' ELSE 'MRG'END AS i_BK_BrandCode,
		0 AS i_BK_CompanyCode,
		TRITON_SALES.i_BK_BkgSrcCd AS i_BK_BkgSrcCd,
		'Y' AS i_BK_OpenBase
	FROM
		AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR
	LEFT JOIN
		(
			SELECT
				CONF_DT_CALENDAR.i_SK_Calendar AS i_SK_SaleDate,
				CONF_DT_CALENDAR_BOOKED.i_SK_Calendar AS i_SK_BookedDate,
				CONF_DT_CALENDAR_CANCEL.i_SK_Calendar AS i_SK_CancelDate,
				CASE
					WHEN TRITON_ST_CHMST.CHDPDT=0 AND TRITON_ST_CHMST.CHCNDT<>0 THEN 9
					WHEN TRITON_ST_CHMST.CHCNDT<>0 THEN 8
					WHEN TRITON_ST_CHMST.CHDPDT<>0 THEN 3
					WHEN TRITON_ST_CHMST.CHDPDT=0 AND TRITON_ST_CNMST.CNSRCD IN ('OWNER','OPS','TAAC') AND TRITON_ST_CNMST.CNOPTN = 'C' THEN 3
					ELSE 1
				END AS i_BK_BookingStatus,
				TRITON_ST_CNMST.CNNUMB AS i_BK_CNNB,
				TRITON_ST_CNMST.CNCLNB AS i_BK_CLNB,
				TRITON_ST_CNMST.CNOFID AS i_BK_FLNB,
				TRITON_ST_CNMST.CNLOC2 AS i_BK_LOCT,
				TRITON_ST_CNMST.CNLOC3 AS i_BK_TOLOCT,
				TRITON_ST_CNMST.CNDES6 AS i_BK_DEST,
				TRITON_ST_CNMST.CNFLTY AS i_BK_FLTY,
				RTRIM(LTRIM(TRITON_ST_CNMST.CNSRCD)) AS i_BK_BkgSrcCd
			FROM 
				TRITON_Stage.dbo.TRITON_ST_CNMST TRITON_ST_CNMST 
			LEFT JOIN 
				TRITON_Stage.dbo.TRITON_ST_CHMST TRITON_ST_CHMST
				ON 
					TRITON_ST_CNMST.CNNUMB = TRITON_ST_CHMST.CHCNNB 
			INNER JOIN
				AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR
				ON
					CONF_DT_CALENDAR.i_SK_Calendar BETWEEN TRITON_ST_CNMST.CNSTDT AND
													CASE 
													WHEN TRITON_ST_CNMST.CNSTDT  = TRITON_ST_CNMST.CNENDT 
													THEN TRITON_ST_CNMST.CNENDT  ELSE 
														CONVERT(INT,CONVERT(VARCHAR(8),DATEADD(d,-1,CONVERT(DATETIME,CONVERT(VARCHAR(8),BRAINII.dbo.fn_CheckDate(TRITON_ST_CNMST.CNENDT),112))),112))
													END
			LEFT JOIN
				AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_BOOKED
				ON
					CONF_DT_CALENDAR_BOOKED.i_SK_Calendar =  CASE
																WHEN TRITON_ST_CHMST.CHDPDT <> 0 THEN TRITON_ST_CHMST.CHDPDT
																--WHEN TRITON_ST_CHMST.CHDPDT = 0 AND TRITON_ST_CHMST.CHCNDT <> 0 THEN TRITON_ST_CHMST.CHETDT 
																ELSE 0
															END
			LEFT JOIN
				AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_CANCEL
				ON
					CONF_DT_CALENDAR_CANCEL.i_SK_Calendar = TRITON_ST_CHMST.CHCNDT
			WHERE
				TRITON_ST_CNMST.CNOFID<> ''
		) TRITON_SALES
		ON
			TRITON_SALES.i_SK_SaleDate=CONF_DT_CALENDAR.i_SK_Calendar
	LEFT JOIN 
		 AMI_Static.dbo.SB_MARINE_BASE SB_MARINE_BASE
		 ON
			SB_MARINE_BASE.a_BaseCode = TRITON_SALES.i_BK_LOCT
			AND 
			SB_MARINE_BASE.a_SourceSystemID = 102
	WHERE
		TRITON_SALES.i_SK_SaleDate IS NOT NULL
		
	INSERT INTO
		TRITON_SFT_ALLOCATION
	SELECT
		CONF_DT_CALENDAR.i_SK_Calendar,
		0 AS i_SK_InventoryDate,
		TRITON_SALES.i_SK_SaleDate,
		TRITON_SALES.i_SK_BookedDate,
		TRITON_SALES.i_SK_CancelDate,
		TRITON_SALES.i_BK_BookingStatus,
		TRITON_SALES.i_BK_FLNB AS i_BK_FLNUMB,
		TRITON_SALES.i_BK_FLTY AS i_BK_FLTY,
		TRITON_SALES.i_BK_CNNB,
		TRITON_SALES.i_BK_CLNB,
		'' AS i_BK_AUTO,
		TRITON_SALES.i_BK_LOCT AS i_BK_LOCT,
		TRITON_SALES.i_BK_LOCT AS i_BK_FRLOCT,
		TRITON_SALES.i_BK_TOLOCT AS i_BK_TOLOCT,
		TRITON_SALES.i_BK_DEST AS i_BK_DEST,
		102 AS i_BK_SourceSysID,
		'Triton',
		'M' AS	i_BK_DivisionCode,
		CASE WHEN SB_MARINE_BASE.a_ProductCode ='FOOTLOOSE' THEN 'FTL' ELSE 'MRG'END AS i_BK_BrandCode,
		0 AS i_BK_CompanyCode,
		TRITON_SALES.i_BK_BkgSrcCd AS i_BK_BkgSrcCd,
		'Y' AS i_BK_OpenBase
	FROM
		AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR
	LEFT JOIN
		(
			SELECT
				CONF_DT_CALENDAR.i_SK_Calendar AS i_SK_SaleDate,
				CONF_DT_CALENDAR_BOOKED.i_SK_Calendar AS i_SK_BookedDate,
				CONF_DT_CALENDAR_CANCEL.i_SK_Calendar AS i_SK_CancelDate,
				CASE
					WHEN TRITON_ST_CHMST.CHDPDT=0 AND TRITON_ST_CHMST.CHCNDT<>0 THEN 9
					WHEN TRITON_ST_CHMST.CHCNDT<>0 THEN 8
					WHEN TRITON_ST_CHMST.CHDPDT<>0 THEN 3
					WHEN TRITON_ST_CHMST.CHDPDT=0 AND TRITON_ST_CNMST.CNSRCD IN ('OWNER','OPS','TAAC') AND TRITON_ST_CNMST.CNOPTN = 'C' THEN 3
					ELSE 1
				END AS i_BK_BookingStatus,
				TRITON_ST_ZNMST.CNNUMB AS i_BK_CNNB,
				TRITON_ST_ZNMST.CNCLNB AS i_BK_CLNB,
				TRITON_ST_ZNMST.CNOFID AS i_BK_FLNB,
				TRITON_ST_ZNMST.CNLOC2 AS i_BK_LOCT,
				TRITON_ST_ZNMST.CNLOC3 AS i_BK_TOLOCT,
				TRITON_ST_ZNMST.CNDES6 AS i_BK_DEST,
				TRITON_ST_ZNMST.CNFLTY AS i_BK_FLTY,
				RTRIM(LTRIM(TRITON_ST_ZNMST.CNSRCD)) AS i_BK_BkgSrcCd
			FROM 
				TRITON_Stage.dbo.TRITON_ST_ZNMST TRITON_ST_ZNMST
			LEFT JOIN 
				TRITON_Stage.dbo.TRITON_ST_CNMST TRITON_ST_CNMST
				ON 
					TRITON_ST_CNMST.CNNUMB = TRITON_ST_ZNMST.CNNUMB
			LEFT JOIN 
				TRITON_Stage.dbo.TRITON_ST_CHMST TRITON_ST_CHMST
				ON 
					TRITON_ST_ZNMST.CNNUMB = TRITON_ST_CHMST.CHCNNB 
			INNER JOIN
				AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR
				ON
					CONF_DT_CALENDAR.i_SK_Calendar BETWEEN TRITON_ST_ZNMST.CNSTDT AND
													CASE 
													WHEN TRITON_ST_ZNMST.CNSTDT  = TRITON_ST_ZNMST.CNENDT 
													THEN TRITON_ST_ZNMST.CNENDT  ELSE 
														CONVERT(INT,CONVERT(VARCHAR(8),DATEADD(d,-1,CONVERT(DATETIME,CONVERT(VARCHAR(8),BRAINII.dbo.fn_CheckDate(TRITON_ST_ZNMST.CNENDT),112))),112))
													END
			LEFT JOIN
				AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_BOOKED
				ON
					CONF_DT_CALENDAR_BOOKED.i_SK_Calendar =  CASE
																WHEN TRITON_ST_CHMST.CHDPDT <> 0 THEN TRITON_ST_CHMST.CHDPDT
																--WHEN TRITON_ST_CHMST.CHDPDT = 0 AND TRITON_ST_CHMST.CHCNDT <> 0 THEN TRITON_ST_CHMST.CHETDT 
																ELSE 0
															END
			LEFT JOIN
				AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_CANCEL
				ON
					CONF_DT_CALENDAR_CANCEL.i_SK_Calendar = TRITON_ST_CHMST.CHCNDT
			WHERE
				TRITON_ST_ZNMST.CNOFID<> ''
			AND
				TRITON_ST_CNMST.CNNUMB IS NULL
		) TRITON_SALES
		ON
			TRITON_SALES.i_SK_SaleDate=CONF_DT_CALENDAR.i_SK_Calendar
	LEFT JOIN 
		 AMI_Static.dbo.SB_MARINE_BASE SB_MARINE_BASE
		 ON
			SB_MARINE_BASE.a_BaseCode = TRITON_SALES.i_BK_LOCT
			AND 
			SB_MARINE_BASE.a_SourceSystemID = 102
	WHERE
		TRITON_SALES.i_SK_SaleDate IS NOT NULL

	-- Triton Sales with no inventory specified
	-- Sales more than 2 weeks in advance do not have a specified fleet number, they are just booked by fleet type.
	INSERT INTO
		TRITON_SFT_ALLOCATION
	SELECT
		CONF_DT_CALENDAR.i_SK_Calendar,
		0 AS i_SK_InventoryDate,
		TRITON_SALES.i_SK_SaleDate,
		TRITON_SALES.i_SK_BookedDate,
		TRITON_SALES.i_SK_CancelDate,
		TRITON_SALES.i_BK_BookingStatus,
		0 AS i_BK_FLNUMB,
		TRITON_SALES.i_BK_FLTY AS i_BK_FLTY,
		TRITON_SALES.i_BK_CNNB,
		TRITON_SALES.i_BK_CLNB,
		'' AS i_BK_AUTO,
		TRITON_SALES.i_BK_LOCT AS i_BK_LOCT,
		TRITON_SALES.i_BK_LOCT AS i_BK_FRLOCT,
		TRITON_SALES.i_BK_TOLOCT AS i_BK_TOLOCT,
		TRITON_SALES.i_BK_DEST AS i_BK_DEST,
		102 AS i_BK_SourceSysID,
		'Triton',
		'M' AS	i_BK_DivisionCode,
		CASE WHEN SB_MARINE_BASE.a_ProductCode ='FOOTLOOSE' THEN 'FTL' ELSE 'MRG'END AS i_BK_BrandCode,
		0 AS i_BK_CompanyCode,
		TRITON_SALES.i_BK_BkgSrcCd AS i_BK_BkgSrcCd,
		'Y' AS i_BK_OpenBase
	FROM
		AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR
	INNER JOIN
		(
			SELECT
				CONF_DT_CALENDAR.i_SK_Calendar AS i_SK_SaleDate,
				CONF_DT_CALENDAR_BOOKED.i_SK_Calendar AS i_SK_BookedDate,
				CONF_DT_CALENDAR_CANCEL.i_SK_Calendar AS i_SK_CancelDate,
				CASE
					WHEN TRITON_ST_CHMST.CHDPDT=0 AND TRITON_ST_CHMST.CHCNDT<>0 THEN 9
					WHEN TRITON_ST_CHMST.CHCNDT<>0 THEN 8
					WHEN TRITON_ST_CHMST.CHDPDT<>0 THEN 3
					WHEN TRITON_ST_CHMST.CHDPDT=0 AND TRITON_ST_CNMST.CNSRCD IN ('OWNER','OPS','TAAC') AND TRITON_ST_CNMST.CNOPTN = 'C' THEN 3
					ELSE 1
				END AS i_BK_BookingStatus,
				TRITON_ST_CNMST.CNNUMB AS i_BK_CNNB,
				TRITON_ST_CNMST.CNCLNB AS i_BK_CLNB,
				TRITON_ST_CNMST.CNOFID AS i_BK_FLNB,
				TRITON_ST_CNMST.CNLOC2 AS i_BK_LOCT,
				TRITON_ST_CNMST.CNLOC3 AS i_BK_TOLOCT,
				TRITON_ST_CNMST.CNDES6 AS i_BK_DEST,
				TRITON_ST_CNMST.CNFLTY AS i_BK_FLTY, 
				RTRIM(LTRIM(TRITON_ST_CNMST.CNSRCD)) AS i_BK_BkgSrcCd
			FROM 
				TRITON_Stage.dbo.TRITON_ST_CNMST TRITON_ST_CNMST 
			LEFT JOIN 
				TRITON_Stage.dbo.TRITON_ST_CHMST TRITON_ST_CHMST
				ON 
					TRITON_ST_CNMST.CNNUMB = TRITON_ST_CHMST.CHCNNB 
			INNER JOIN
				AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR
				ON
					CONF_DT_CALENDAR.i_SK_Calendar BETWEEN TRITON_ST_CNMST.CNSTDT AND
													CASE 
													WHEN TRITON_ST_CNMST.CNSTDT  = TRITON_ST_CNMST.CNENDT 
													THEN TRITON_ST_CNMST.CNENDT  ELSE 
														CONVERT(INT,CONVERT(VARCHAR(8),DATEADD(d,-1,CONVERT(DATETIME,CONVERT(VARCHAR(8),BRAINII.dbo.fn_CheckDate(TRITON_ST_CNMST.CNENDT),112))),112))
													END
			LEFT JOIN
				AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_BOOKED
				ON
					CONF_DT_CALENDAR_BOOKED.i_SK_Calendar = CASE
																WHEN TRITON_ST_CHMST.CHDPDT <> 0 THEN TRITON_ST_CHMST.CHDPDT
																--WHEN TRITON_ST_CHMST.CHDPDT = 0 AND TRITON_ST_CHMST.CHCNDT <> 0 THEN TRITON_ST_CHMST.CHETDT 
																ELSE 0
															END
			LEFT JOIN
				AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_CANCEL
				ON
					CONF_DT_CALENDAR_CANCEL.i_SK_Calendar = TRITON_ST_CHMST.CHCNDT
			WHERE
				TRITON_ST_CNMST.CNOFID = ''
		) TRITON_SALES
		ON
			CONF_DT_CALENDAR.i_SK_Calendar = TRITON_SALES.i_SK_SaleDate
			AND
			TRITON_SALES.i_BK_FLTY<> ''
		LEFT JOIN 
		 AMI_Static.dbo.SB_MARINE_BASE SB_MARINE_BASE
		 ON
			SB_MARINE_BASE.a_BaseCode = TRITON_SALES.i_BK_LOCT
			AND 
			SB_MARINE_BASE.a_SourceSystemID = 102
			
	--If they have been archived not need to calculate for the last two weeks....
	INSERT INTO
		TRITON_SFT_ALLOCATION
	SELECT
		CONF_DT_CALENDAR.i_SK_Calendar,
		0 AS i_SK_InventoryDate,
		TRITON_SALES.i_SK_SaleDate,
		TRITON_SALES.i_SK_BookedDate,
		TRITON_SALES.i_SK_CancelDate,
		TRITON_SALES.i_BK_BookingStatus,
		0 AS i_BK_FLNUMB,
		TRITON_SALES.i_BK_FLTY AS i_BK_FLTY,
		TRITON_SALES.i_BK_CNNB,
		TRITON_SALES.i_BK_CLNB,
		'' AS i_BK_AUTO,
		TRITON_SALES.i_BK_LOCT AS i_BK_LOCT,
		TRITON_SALES.i_BK_LOCT AS i_BK_FRLOCT,
		TRITON_SALES.i_BK_TOLOCT AS i_BK_TOLOCT,
		TRITON_SALES.i_BK_DEST AS i_BK_DEST,
		102 AS i_BK_SourceSysID,
		'Triton',
		'M' AS	i_BK_DivisionCode,
		CASE WHEN SB_MARINE_BASE.a_ProductCode ='FOOTLOOSE' THEN 'FTL' ELSE 'MRG'END AS i_BK_BrandCode,
		0 AS i_BK_CompanyCode,
		TRITON_SALES.i_BK_BkgSrcCd AS i_BK_BkgSrcCd,
		'Y' AS i_BK_OpenBase
	FROM
		AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR
	INNER JOIN
		(
			SELECT
				CONF_DT_CALENDAR.i_SK_Calendar AS i_SK_SaleDate,
				CONF_DT_CALENDAR_BOOKED.i_SK_Calendar AS i_SK_BookedDate,
				CONF_DT_CALENDAR_CANCEL.i_SK_Calendar AS i_SK_CancelDate,
				CASE
					WHEN TRITON_ST_CHMST.CHDPDT=0 AND TRITON_ST_CHMST.CHCNDT<>0 THEN 9
					WHEN TRITON_ST_CHMST.CHCNDT<>0 THEN 8
					WHEN TRITON_ST_CHMST.CHDPDT<>0 THEN 3
					WHEN TRITON_ST_CHMST.CHDPDT=0 AND TRITON_ST_CNMST.CNSRCD IN ('OWNER','OPS','TAAC') AND TRITON_ST_CNMST.CNOPTN = 'C' THEN 3
					ELSE 1
				END AS i_BK_BookingStatus,
				TRITON_ST_ZNMST.CNNUMB AS i_BK_CNNB,
				TRITON_ST_ZNMST.CNCLNB AS i_BK_CLNB,
				TRITON_ST_ZNMST.CNOFID AS i_BK_FLNB,
				TRITON_ST_ZNMST.CNLOC2 AS i_BK_LOCT,
				TRITON_ST_ZNMST.CNLOC3 AS i_BK_TOLOCT,
				TRITON_ST_ZNMST.CNDES6 AS i_BK_DEST,
				TRITON_ST_ZNMST.CNFLTY AS i_BK_FLTY,
				RTRIM(LTRIM(TRITON_ST_ZNMST.CNSRCD)) AS i_BK_BkgSrcCd
			FROM 
				TRITON_Stage.dbo.TRITON_ST_ZNMST TRITON_ST_ZNMST
			LEFT JOIN 
				TRITON_Stage.dbo.TRITON_ST_CNMST TRITON_ST_CNMST
				ON 
					TRITON_ST_CNMST.CNNUMB = TRITON_ST_ZNMST.CNNUMB
			LEFT JOIN 
				TRITON_Stage.dbo.TRITON_ST_CHMST TRITON_ST_CHMST
				ON 
					TRITON_ST_CNMST.CNNUMB = TRITON_ST_CHMST.CHCNNB 
			INNER JOIN
				AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR
				ON
					CONF_DT_CALENDAR.i_SK_Calendar BETWEEN TRITON_ST_ZNMST.CNSTDT AND
													CASE 
													WHEN TRITON_ST_ZNMST.CNSTDT  = TRITON_ST_ZNMST.CNENDT 
													THEN TRITON_ST_ZNMST.CNENDT  ELSE 
														CONVERT(INT,CONVERT(VARCHAR(8),DATEADD(d,-1,CONVERT(DATETIME,CONVERT(VARCHAR(8),BRAINII.dbo.fn_CheckDate(TRITON_ST_ZNMST.CNENDT),112))),112))
													END
			LEFT JOIN
				AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_BOOKED
				ON
					CONF_DT_CALENDAR_BOOKED.i_SK_Calendar = CASE
																WHEN TRITON_ST_CHMST.CHDPDT <> 0 THEN TRITON_ST_CHMST.CHDPDT
																--WHEN TRITON_ST_CHMST.CHDPDT = 0 AND TRITON_ST_CHMST.CHCNDT <> 0 THEN TRITON_ST_CHMST.CHETDT 
																ELSE 0
															END
			LEFT JOIN
				AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_CANCEL
				ON
					CONF_DT_CALENDAR_CANCEL.i_SK_Calendar = TRITON_ST_CHMST.CHCNDT
			WHERE
				TRITON_ST_ZNMST.CNOFID = ''
				AND
				TRITON_ST_CNMST.CNNUMB IS NULL
		) TRITON_SALES
		ON
			CONF_DT_CALENDAR.i_SK_Calendar = TRITON_SALES.i_SK_SaleDate
			AND
			TRITON_SALES.i_BK_FLTY<> ''
		LEFT JOIN 
		 AMI_Static.dbo.SB_MARINE_BASE SB_MARINE_BASE
		 ON
			SB_MARINE_BASE.a_BaseCode = TRITON_SALES.i_BK_LOCT
			AND 
			SB_MARINE_BASE.a_SourceSystemID = 102
	

	-- Neptune inventory
	INSERT INTO
		TRITON_SFT_ALLOCATION
	SELECT
		CONF_DT_CALENDAR.i_SK_Calendar,
		NEPTUNE_INVENTORY.i_SK_InventoryDate,
		0 AS i_SK_SaleDate,
		0 AS i_SK_BookedDate,
		0 AS i_SK_CancelDate,
		NULL AS i_BK_BookingStatus,
		SUNSAIL_ST_FLMST.FLNUMB AS i_BK_FLNUMB,
		NEPTUNE_INVENTORY.i_BK_FLTY AS i_BK_FLTY,
		0 AS i_BK_CNNB,
		0 AS i_BK_CLNB,
		NEPTUNE_INVENTORY.i_BK_AUTO,
		NEPTUNE_INVENTORY.i_BK_LOCT AS i_BK_LOCT,
		0 AS i_BK_FRLOCT,
		0 AS i_BK_TOLOCT,
		0 AS i_BK_DEST,
		101 AS i_BK_SourceSysID,
		'Neptune',
		'M' AS	i_BK_DivisionCode,
		'SUN' AS i_BK_BrandCode,
		1 AS i_BK_CompanyCode,
		'' AS i_BK_BkgSrcCd,
		'Y' AS i_BK_OpenBase
	FROM
		AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR
	CROSS JOIN
		TRITON_Stage.dbo.SUNSAIL_ST_FLMST SUNSAIL_ST_FLMST
	LEFT JOIN
		(
			SELECT
				CONF_DT_CALENDAR.i_SK_Calendar AS i_SK_InventoryDate,
				VW_NEPTUNE_ST_FPMST_ADJUSTED.FPFLNB AS i_BK_FLNB,
				VW_NEPTUNE_ST_FPMST_ADJUSTED.FPFLTY AS i_BK_FLTY,
				VW_NEPTUNE_ST_FPMST_ADJUSTED.FPAUTO AS i_BK_AUTO,
				VW_NEPTUNE_ST_FPMST_ADJUSTED.FPLOCT AS i_BK_LOCT
			FROM
			(
				SELECT 
					SUNSAIL_ST_FPMST.FPFLNB,
					SUNSAIL_ST_FPMST.FPSTDT,
					NEPTUNE_ST_FPMST_ADJUSTED.FPENDT_ADJUSTED AS FPENDT,
					SUNSAIL_ST_FPMST.FPFLTY,
					SUNSAIL_ST_FPMST.FPAUTO,
					SUNSAIL_ST_FPMST.FPLOCT
				FROM 
					(
					SELECT 
						SUNSAIL_ST_FPMST_START.FPFLNB,
						SUNSAIL_ST_FPMST_START.FPSTDT, 
						SUNSAIL_ST_FPMST_START.FPENDT, 
						CASE WHEN SUNSAIL_ST_FPMST_END.FPSTDT IS NULL THEN  CONVERT(NUMERIC(8,0),CONVERT(VARCHAR(8),(CONVERT(DATETIME,CONVERT(VARCHAR(8),SUNSAIL_ST_FPMST_START.FPENDT),112)),112))
						ELSE  CONVERT(NUMERIC(8,0),CONVERT(VARCHAR(8),DATEADD(d,-1,CONVERT(DATETIME,CONVERT(VARCHAR(8),SUNSAIL_ST_FPMST_START.FPENDT),112)),112)) END AS FPENDT_ADJUSTED
					FROM 
						TRITON_Stage.dbo.SUNSAIL_ST_FPMST SUNSAIL_ST_FPMST_START
					LEFT JOIN 
						TRITON_Stage.dbo.SUNSAIL_ST_FPMST SUNSAIL_ST_FPMST_END
						ON
							SUNSAIL_ST_FPMST_START.FPFLNB = SUNSAIL_ST_FPMST_END.FPFLNB
							AND
							SUNSAIL_ST_FPMST_START.FPUTCD = SUNSAIL_ST_FPMST_END.FPUTCD
							AND
							SUNSAIL_ST_FPMST_START.FPENDT= SUNSAIL_ST_FPMST_END.FPSTDT
					GROUP BY 
						SUNSAIL_ST_FPMST_START.FPFLNB,
						SUNSAIL_ST_FPMST_START.FPSTDT, 
						SUNSAIL_ST_FPMST_START.FPENDT,
						SUNSAIL_ST_FPMST_END.FPSTDT
				) NEPTUNE_ST_FPMST_ADJUSTED
				LEFT JOIN 
					TRITON_Stage.dbo.SUNSAIL_ST_FPMST SUNSAIL_ST_FPMST
					ON
						SUNSAIL_ST_FPMST.FPFLNB = NEPTUNE_ST_FPMST_ADJUSTED.FPFLNB
						AND
						SUNSAIL_ST_FPMST.FPSTDT = NEPTUNE_ST_FPMST_ADJUSTED.FPSTDT
						AND
						SUNSAIL_ST_FPMST.FPENDT = NEPTUNE_ST_FPMST_ADJUSTED.FPENDT
			) VW_NEPTUNE_ST_FPMST_ADJUSTED
			INNER JOIN
				AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR
				ON
					CONF_DT_CALENDAR.i_SK_Calendar BETWEEN VW_NEPTUNE_ST_FPMST_ADJUSTED.FPSTDT AND VW_NEPTUNE_ST_FPMST_ADJUSTED.FPENDT
		) NEPTUNE_INVENTORY
		ON
			NEPTUNE_INVENTORY.i_SK_InventoryDate=CONF_DT_CALENDAR.i_SK_Calendar
			AND
			NEPTUNE_INVENTORY.i_BK_FLNB=SUNSAIL_ST_FLMST.FLNUMB
		LEFT JOIN 
			AMI_Static.dbo.SB_MARINE_BASE SB_MARINE_BASE
			ON
				SB_MARINE_BASE.a_BaseCode = SUNSAIL_ST_FLMST.FLHOME
				AND 
				SB_MARINE_BASE.a_SourceSystemID = 101
		WHERE
			NEPTUNE_INVENTORY.i_SK_InventoryDate IS NOT NULL


	INSERT INTO
		TRITON_SFT_ALLOCATION
	SELECT
		CONF_DT_CALENDAR.i_SK_Calendar,
		0 AS i_SK_InventoryDate,
		NEPTUNE_SALES.i_SK_SaleDate,
		NEPTUNE_SALES.i_SK_BookedDate,
		NEPTUNE_SALES.i_SK_CancelDate,
		NEPTUNE_SALES.i_BK_BookingStatus,
		NEPTUNE_SALES.i_BK_FLNB AS i_BK_FLNUMB,
		NEPTUNE_SALES.i_BK_FLTY AS i_BK_FLTY,
		NEPTUNE_SALES.i_BK_CNNB,
		NEPTUNE_SALES.i_BK_CLNB,
		'' AS i_BK_AUTO,
		NEPTUNE_SALES.i_BK_LOCT AS i_BK_LOCT,
		NEPTUNE_SALES.i_BK_LOCT AS i_BK_FRLOCT,
		NEPTUNE_SALES.i_BK_TOLOCT AS i_BK_TOLOCT,
		NEPTUNE_SALES.i_BK_DEST AS i_BK_DEST,
		101 AS i_BK_SourceSysID,
		'Neptune',
		'M' AS	i_BK_DivisionCode,
		'SUN' AS i_BK_BrandCode,
		1 AS i_BK_CompanyCode,
		NEPTUNE_SALES.i_BK_BkgSrcCd AS i_BK_BkgSrcCd,
		'Y' AS i_BK_OpenBase
	FROM
		AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR
	INNER JOIN
		(
			SELECT
				CONF_DT_CALENDAR.i_SK_Calendar AS i_SK_SaleDate,
				CONF_DT_CALENDAR_BOOKED.i_SK_Calendar AS i_SK_BookedDate,
				CONF_DT_CALENDAR_CANCEL.i_SK_Calendar AS i_SK_CancelDate,
				CASE	
					WHEN SUNSAIL_ST_INTXRCNM.RCSTAT = '2' THEN 20
					WHEN SUNSAIL_ST_CHMST.CHDPDT=0 AND SUNSAIL_ST_CHMST.CHCNDT<>0 THEN 9
					WHEN SUNSAIL_ST_CHMST.CHCNDT<>0 THEN 8
					WHEN SUNSAIL_ST_CHMST.CHDPDT<>0 THEN 3
					WHEN SUNSAIL_ST_CHMST.CHDPDT=0 AND SUNSAIL_ST_CNMST.CNSRCD IN ('OWNER','OPS','TAAC') AND SUNSAIL_ST_CNMST.CNOPTN = 'C' THEN 3
					ELSE 1
				END AS i_BK_BookingStatus,
				SUNSAIL_ST_CNMST.CNNUMB AS i_BK_CNNB,
				SUNSAIL_ST_CNMST.CNCLNB AS i_BK_CLNB,
				SUNSAIL_ST_CNMST.CNOFID AS i_BK_FLNB,
				SUNSAIL_ST_CNMST.CNLOC2 AS i_BK_LOCT,
				SUNSAIL_ST_CNMST.CNLOC3 AS i_BK_TOLOCT,
				SUNSAIL_ST_CNMST.CNDES6 AS i_BK_DEST,
				SUNSAIL_ST_CNMST.CNFLTY AS i_BK_FLTY,
				RTRIM(LTRIM(SUNSAIL_ST_CNMST.CNSRCD)) AS i_BK_BkgSrcCd
			FROM 
				TRITON_Stage.dbo.SUNSAIL_ST_CNMST SUNSAIL_ST_CNMST 
			LEFT JOIN 
				TRITON_Stage.dbo.SUNSAIL_ST_CHMST SUNSAIL_ST_CHMST
				ON 
					SUNSAIL_ST_CNMST.CNNUMB = SUNSAIL_ST_CHMST.CHCNNB 
			INNER JOIN
				AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR
				ON
					CONF_DT_CALENDAR.i_SK_Calendar BETWEEN SUNSAIL_ST_CHMST.CHSTDT AND
													CASE 
													WHEN SUNSAIL_ST_CNMST.CNSTDT  = SUNSAIL_ST_CNMST.CNENDT 
													THEN SUNSAIL_ST_CHMST.CHENDT  
													ELSE 
														CONVERT(INT,CONVERT(VARCHAR(8),DATEADD(d,-1,CONVERT(DATETIME,CONVERT(VARCHAR(8),BRAINII.dbo.fn_CheckDate(SUNSAIL_ST_CNMST.CNENDT),112))),112))
													END
			LEFT JOIN
				AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_BOOKED
				ON
					CONF_DT_CALENDAR_BOOKED.i_SK_Calendar = CASE 
																WHEN SUNSAIL_ST_CHMST.CHDPDT <> 0 THEN SUNSAIL_ST_CHMST.CHDPDT
																--WHEN SUNSAIL_ST_CHMST.CHDPDT = 0 AND SUNSAIL_ST_CHMST.CHCNDT <> 0 THEN SUNSAIL_ST_CHMST.CHETDT 
																ELSE 0
															END
			LEFT JOIN
				AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_CANCEL
				ON
					CONF_DT_CALENDAR_CANCEL.i_SK_Calendar = SUNSAIL_ST_CHMST.CHCNDT
			LEFT JOIN 
				TRITON_Stage.dbo.SUNSAIL_ST_INTXRCNM SUNSAIL_ST_INTXRCNM
				ON
					SUNSAIL_ST_INTXRCNM.RCNUMB  = SUNSAIL_ST_CNMST.CNNUMB
			WHERE
				SUNSAIL_ST_CHMST.CHFLNB <> ''
		) NEPTUNE_SALES
		ON
			NEPTUNE_SALES.i_SK_SaleDate=CONF_DT_CALENDAR.i_SK_Calendar
	WHERE
		NEPTUNE_SALES.i_SK_SaleDate IS NOT NULL


	INSERT INTO
		TRITON_SFT_ALLOCATION
	SELECT
		CONF_DT_CALENDAR.i_SK_Calendar,
		0 AS i_SK_InventoryDate,
		NEPTUNE_SALES.i_SK_SaleDate,
		NEPTUNE_SALES.i_SK_BookedDate,
		NEPTUNE_SALES.i_SK_CancelDate,
		NEPTUNE_SALES.i_BK_BookingStatus,
		NEPTUNE_SALES.i_BK_FLNB AS i_BK_FLNUMB,
		NEPTUNE_SALES.i_BK_FLTY AS i_BK_FLTY,
		NEPTUNE_SALES.i_BK_CNNB,
		NEPTUNE_SALES.i_BK_CLNB,
		'' AS i_BK_AUTO,
		NEPTUNE_SALES.i_BK_LOCT AS i_BK_LOCT,
		NEPTUNE_SALES.i_BK_LOCT AS i_BK_FRLOCT,
		NEPTUNE_SALES.i_BK_TOLOCT AS i_BK_TOLOCT,
		NEPTUNE_SALES.i_BK_DEST AS i_BK_DEST,
		101 AS i_BK_SourceSysID,
		'Neptune',
		'M' AS	i_BK_DivisionCode,
		'SUN' AS i_BK_BrandCode,
		1 AS i_BK_CompanyCode,
		NEPTUNE_SALES.i_BK_BkgSrcCd AS i_BK_BkgSrcCd,
		'Y' AS i_BK_OpenBase
	FROM
		AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR
	LEFT JOIN
		(
			SELECT
				CONF_DT_CALENDAR.i_SK_Calendar AS i_SK_SaleDate,
				CONF_DT_CALENDAR_BOOKED.i_SK_Calendar AS i_SK_BookedDate,
				CONF_DT_CALENDAR_CANCEL.i_SK_Calendar AS i_SK_CancelDate,
				CASE
					WHEN SUNSAIL_ST_CHMST.CHDPDT=0 AND SUNSAIL_ST_CHMST.CHCNDT<>0 THEN 9
					WHEN SUNSAIL_ST_CHMST.CHCNDT<>0 THEN 8
					WHEN SUNSAIL_ST_CHMST.CHDPDT<>0 THEN 3
					WHEN SUNSAIL_ST_CHMST.CHDPDT=0 AND SUNSAIL_ST_CNMST.CNSRCD IN ('OWNER','OPS','TAAC') AND SUNSAIL_ST_CNMST.CNOPTN = 'C' THEN 3
					ELSE 1
				END AS i_BK_BookingStatus,
				SUNSAIL_ST_ZNMST.CNNUMB AS i_BK_CNNB,
				SUNSAIL_ST_ZNMST.CNCLNB AS i_BK_CLNB,
				SUNSAIL_ST_ZNMST.CNOFID AS i_BK_FLNB,
				SUNSAIL_ST_ZNMST.CNLOC2 AS i_BK_LOCT,
				SUNSAIL_ST_ZNMST.CNLOC3 AS i_BK_TOLOCT,
				SUNSAIL_ST_ZNMST.CNDES6 AS i_BK_DEST,
				SUNSAIL_ST_ZNMST.CNFLTY AS i_BK_FLTY,
				RTRIM(LTRIM(SUNSAIL_ST_ZNMST.CNSRCD)) AS i_BK_BkgSrcCd
			FROM 
				TRITON_Stage.dbo.SUNSAIL_ST_ZNMST SUNSAIL_ST_ZNMST
			LEFT JOIN 
				TRITON_Stage.dbo.SUNSAIL_ST_CNMST SUNSAIL_ST_CNMST
				ON 
					SUNSAIL_ST_CNMST.CNNUMB = SUNSAIL_ST_ZNMST.CNNUMB
			LEFT JOIN 
				TRITON_Stage.dbo.SUNSAIL_ST_CHMST SUNSAIL_ST_CHMST
				ON 
					SUNSAIL_ST_ZNMST.CNNUMB = SUNSAIL_ST_CHMST.CHCNNB 
			INNER JOIN
				AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR
				ON
					CONF_DT_CALENDAR.i_SK_Calendar BETWEEN SUNSAIL_ST_ZNMST.CNSTDT AND
													CASE 
													WHEN SUNSAIL_ST_ZNMST.CNSTDT  = SUNSAIL_ST_ZNMST.CNENDT 
													THEN SUNSAIL_ST_ZNMST.CNENDT  ELSE 
														CONVERT(INT,CONVERT(VARCHAR(8),DATEADD(d,-1,CONVERT(DATETIME,CONVERT(VARCHAR(8),BRAINII.dbo.fn_CheckDate(SUNSAIL_ST_ZNMST.CNENDT),112))),112))
													END
			LEFT JOIN
				AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_BOOKED
				ON
					CONF_DT_CALENDAR_BOOKED.i_SK_Calendar =  CASE
																WHEN SUNSAIL_ST_CHMST.CHDPDT <> 0 THEN SUNSAIL_ST_CHMST.CHDPDT
																--WHEN TRITON_ST_CHMST.CHDPDT = 0 AND TRITON_ST_CHMST.CHCNDT <> 0 THEN TRITON_ST_CHMST.CHETDT 
																ELSE 0
															END
			LEFT JOIN
				AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_CANCEL
				ON
					CONF_DT_CALENDAR_CANCEL.i_SK_Calendar = SUNSAIL_ST_CHMST.CHCNDT
			WHERE
				SUNSAIL_ST_ZNMST.CNOFID<> ''
			AND
				SUNSAIL_ST_CNMST.CNNUMB IS NULL
		) NEPTUNE_SALES
		ON
			NEPTUNE_SALES.i_SK_SaleDate=CONF_DT_CALENDAR.i_SK_Calendar
	LEFT JOIN 
		 AMI_Static.dbo.SB_MARINE_BASE SB_MARINE_BASE
		 ON
			SB_MARINE_BASE.a_BaseCode = NEPTUNE_SALES.i_BK_LOCT
			AND 
			SB_MARINE_BASE.a_SourceSystemID = 101
	WHERE
		NEPTUNE_SALES.i_SK_SaleDate IS NOT NULL

	-- Neptune Sales with no inventory specified
	-- Sales more than 2 weeks in advance do not have a specified fleet number, they are just booked by fleet type.
	INSERT INTO
		TRITON_SFT_ALLOCATION
	SELECT
		CONF_DT_CALENDAR.i_SK_Calendar,
		0 AS i_SK_InventoryDate,
		NEPTUNE_SALES.i_SK_SaleDate,
		NEPTUNE_SALES.i_SK_BookedDate,
		NEPTUNE_SALES.i_SK_CancelDate,
		NEPTUNE_SALES.i_BK_BookingStatus,
		0 AS i_BK_FLNUMB,
		NEPTUNE_SALES.i_BK_FLTY AS i_BK_FLTY,
		NEPTUNE_SALES.i_BK_CNNB,
		NEPTUNE_SALES.i_BK_CLNB,
		'' AS i_BK_AUTO,
		NEPTUNE_SALES.i_BK_LOCT AS i_BK_LOCT,
		NEPTUNE_SALES.i_BK_LOCT AS i_BK_FRLOCT,
		NEPTUNE_SALES.i_BK_TOLOCT AS i_BK_TOLOCT,
		NEPTUNE_SALES.i_BK_DEST AS i_BK_DEST,
		101 AS i_BK_SourceSysID,
		'Neptune',
		'M' AS	i_BK_DivisionCode,
		'SUN' AS i_BK_BrandCode,
		1 AS i_BK_CompanyCode,
		NEPTUNE_SALES.i_BK_BkgSrcCd AS i_BK_BkgSrcCd,
		'Y' AS i_BK_OpenBase
	FROM
		AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR
	INNER JOIN
		(
			SELECT
				CONF_DT_CALENDAR.i_SK_Calendar AS i_SK_SaleDate,
				CONF_DT_CALENDAR_BOOKED.i_SK_Calendar AS i_SK_BookedDate,
				CONF_DT_CALENDAR_CANCEL.i_SK_Calendar AS i_SK_CancelDate,
				CASE	
					WHEN SUNSAIL_ST_INTXRCNM.RCSTAT = '2' THEN 20
					WHEN SUNSAIL_ST_CHMST.CHDPDT=0 AND SUNSAIL_ST_CHMST.CHCNDT<>0 THEN 9
					WHEN SUNSAIL_ST_CHMST.CHCNDT<>0 THEN 8
					WHEN SUNSAIL_ST_CHMST.CHDPDT<>0 THEN 3
					WHEN SUNSAIL_ST_CHMST.CHDPDT=0 AND SUNSAIL_ST_CNMST.CNSRCD IN ('OWNER','OPS','TAAC') AND SUNSAIL_ST_CNMST.CNOPTN = 'C' THEN 3
					ELSE 1
				END AS i_BK_BookingStatus,
				SUNSAIL_ST_CNMST.CNNUMB AS i_BK_CNNB,
				SUNSAIL_ST_CNMST.CNCLNB AS i_BK_CLNB,
				SUNSAIL_ST_CNMST.CNOFID AS i_BK_FLNB,
				SUNSAIL_ST_CNMST.CNLOC2 AS i_BK_LOCT,
				SUNSAIL_ST_CNMST.CNLOC3 AS i_BK_TOLOCT,
				SUNSAIL_ST_CNMST.CNDES6 AS i_BK_DEST,
				SUNSAIL_ST_CNMST.CNFLTY AS i_BK_FLTY,
				RTRIM(LTRIM(SUNSAIL_ST_CNMST.CNSRCD)) AS i_BK_BkgSrcCd
			FROM 
				TRITON_Stage.dbo.SUNSAIL_ST_CNMST SUNSAIL_ST_CNMST 
			LEFT JOIN 
				TRITON_Stage.dbo.SUNSAIL_ST_CHMST SUNSAIL_ST_CHMST
				ON 
					SUNSAIL_ST_CNMST.CNNUMB = SUNSAIL_ST_CHMST.CHCNNB 
			INNER JOIN
				AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR
				ON
					CONF_DT_CALENDAR.i_SK_Calendar BETWEEN SUNSAIL_ST_CNMST.CNSTDT AND
													CASE 
													WHEN SUNSAIL_ST_CNMST.CNSTDT  = SUNSAIL_ST_CNMST.CNENDT 
													THEN SUNSAIL_ST_CNMST.CNENDT  
													ELSE 
														CONVERT(INT,CONVERT(VARCHAR(8),DATEADD(d,-1,CONVERT(DATETIME,CONVERT(VARCHAR(8),BRAINII.dbo.fn_CheckDate(SUNSAIL_ST_CNMST.CNENDT),112))),112))
													END
			LEFT JOIN
				AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_BOOKED
				ON
					CONF_DT_CALENDAR_BOOKED.i_SK_Calendar = CASE 
																WHEN SUNSAIL_ST_CHMST.CHDPDT <> 0 THEN SUNSAIL_ST_CHMST.CHDPDT
																--WHEN SUNSAIL_ST_CHMST.CHDPDT = 0 AND SUNSAIL_ST_CHMST.CHCNDT <> 0 THEN SUNSAIL_ST_CHMST.CHETDT 
																ELSE 0
															END
			LEFT JOIN
				AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_CANCEL
				ON
					CONF_DT_CALENDAR_CANCEL.i_SK_Calendar = SUNSAIL_ST_CHMST.CHCNDT
			LEFT JOIN 
				TRITON_Stage.dbo.SUNSAIL_ST_INTXRCNM SUNSAIL_ST_INTXRCNM
				ON
					SUNSAIL_ST_INTXRCNM.RCNUMB  = SUNSAIL_ST_CNMST.CNNUMB
			WHERE
				SUNSAIL_ST_CNMST.CNOFID = ''
		) NEPTUNE_SALES
		ON
			CONF_DT_CALENDAR.i_SK_Calendar = NEPTUNE_SALES.i_SK_SaleDate
			AND
			NEPTUNE_SALES.i_BK_FLTY<> ''

	--If they have been archived not need to calculate for the last two weeks....
	INSERT INTO
		TRITON_SFT_ALLOCATION
	SELECT
		CONF_DT_CALENDAR.i_SK_Calendar,
		0 AS i_SK_InventoryDate,
		NEPTUNE_SALES.i_SK_SaleDate,
		NEPTUNE_SALES.i_SK_BookedDate,
		NEPTUNE_SALES.i_SK_CancelDate,
		NEPTUNE_SALES.i_BK_BookingStatus,
		0 AS i_BK_FLNUMB,
		NEPTUNE_SALES.i_BK_FLTY AS i_BK_FLTY,
		NEPTUNE_SALES.i_BK_CNNB,
		NEPTUNE_SALES.i_BK_CLNB,
		'' AS i_BK_AUTO,
		NEPTUNE_SALES.i_BK_LOCT AS i_BK_LOCT,
		NEPTUNE_SALES.i_BK_LOCT AS i_BK_FRLOCT,
		NEPTUNE_SALES.i_BK_TOLOCT AS i_BK_TOLOCT,
		NEPTUNE_SALES.i_BK_DEST AS i_BK_DEST,
		101 AS i_BK_SourceSysID,
		'Neptune',
		'M' AS	i_BK_DivisionCode,
		'SUN' AS i_BK_BrandCode,
		1 AS i_BK_CompanyCode,
		NEPTUNE_SALES.i_BK_BkgSrcCd AS i_BK_BkgSrcCd,
		'Y' AS i_BK_OpenBase
	FROM
		AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR
	INNER JOIN
		(
			SELECT
				CONF_DT_CALENDAR.i_SK_Calendar AS i_SK_SaleDate,
				CONF_DT_CALENDAR_BOOKED.i_SK_Calendar AS i_SK_BookedDate,
				CONF_DT_CALENDAR_CANCEL.i_SK_Calendar AS i_SK_CancelDate,
				CASE
					WHEN SUNSAIL_ST_CHMST.CHDPDT=0 AND SUNSAIL_ST_CHMST.CHCNDT<>0 THEN 9
					WHEN SUNSAIL_ST_CHMST.CHCNDT<>0 THEN 8
					WHEN SUNSAIL_ST_CHMST.CHDPDT<>0 THEN 3
					WHEN SUNSAIL_ST_CHMST.CHDPDT=0 AND SUNSAIL_ST_CNMST.CNSRCD IN ('OWNER','OPS','TAAC') AND SUNSAIL_ST_CNMST.CNOPTN = 'C' THEN 3
					ELSE 1
				END AS i_BK_BookingStatus,
				SUNSAIL_ST_ZNMST.CNNUMB AS i_BK_CNNB,
				SUNSAIL_ST_ZNMST.CNCLNB AS i_BK_CLNB,
				SUNSAIL_ST_ZNMST.CNOFID AS i_BK_FLNB,
				SUNSAIL_ST_ZNMST.CNLOC2 AS i_BK_LOCT,
				SUNSAIL_ST_ZNMST.CNLOC3 AS i_BK_TOLOCT,
				SUNSAIL_ST_ZNMST.CNDES6 AS i_BK_DEST,
				SUNSAIL_ST_ZNMST.CNFLTY AS i_BK_FLTY,
				RTRIM(LTRIM(SUNSAIL_ST_ZNMST.CNSRCD)) AS i_BK_BkgSrcCd
			FROM 
				TRITON_Stage.dbo.SUNSAIL_ST_ZNMST SUNSAIL_ST_ZNMST
			LEFT JOIN 
				TRITON_Stage.dbo.SUNSAIL_ST_CNMST SUNSAIL_ST_CNMST
				ON 
					SUNSAIL_ST_CNMST.CNNUMB = SUNSAIL_ST_ZNMST.CNNUMB
			LEFT JOIN 
				TRITON_Stage.dbo.SUNSAIL_ST_CHMST SUNSAIL_ST_CHMST
				ON 
					SUNSAIL_ST_CNMST.CNNUMB = SUNSAIL_ST_CHMST.CHCNNB 
			INNER JOIN
				AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR
				ON
					CONF_DT_CALENDAR.i_SK_Calendar BETWEEN SUNSAIL_ST_ZNMST.CNSTDT AND
													CASE 
													WHEN SUNSAIL_ST_ZNMST.CNSTDT  = SUNSAIL_ST_ZNMST.CNENDT 
													THEN SUNSAIL_ST_ZNMST.CNENDT  ELSE 
														CONVERT(INT,CONVERT(VARCHAR(8),DATEADD(d,-1,CONVERT(DATETIME,CONVERT(VARCHAR(8),BRAINII.dbo.fn_CheckDate(SUNSAIL_ST_ZNMST.CNENDT),112))),112))
													END
			LEFT JOIN
				AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_BOOKED
				ON
					CONF_DT_CALENDAR_BOOKED.i_SK_Calendar = CASE
																WHEN SUNSAIL_ST_CHMST.CHDPDT <> 0 THEN SUNSAIL_ST_CHMST.CHDPDT
																--WHEN TRITON_ST_CHMST.CHDPDT = 0 AND TRITON_ST_CHMST.CHCNDT <> 0 THEN TRITON_ST_CHMST.CHETDT 
																ELSE 0
															END
			LEFT JOIN
				AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_CANCEL
				ON
					CONF_DT_CALENDAR_CANCEL.i_SK_Calendar = SUNSAIL_ST_CHMST.CHCNDT
			WHERE
				SUNSAIL_ST_ZNMST.CNOFID = ''
				AND
				SUNSAIL_ST_CNMST.CNNUMB IS NULL
		) NEPTUNE_SALES
		ON
			CONF_DT_CALENDAR.i_SK_Calendar = NEPTUNE_SALES.i_SK_SaleDate
			AND
			NEPTUNE_SALES.i_BK_FLTY<> ''
		LEFT JOIN 
		 AMI_Static.dbo.SB_MARINE_BASE SB_MARINE_BASE
		 ON
			SB_MARINE_BASE.a_BaseCode = NEPTUNE_SALES.i_BK_LOCT
			AND 
			SB_MARINE_BASE.a_SourceSystemID = 102

	EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'TRTN','SFT_ALLOC'
	
	










GO
/****** Object:  StoredProcedure [dbo].[BUILD_TRITON_SFT_RATES]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[BUILD_TRITON_SFT_RATES]
AS

	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'TRITON','SFT_RATES','BUILD_TRITON_SFT_RATES'

	DECLARE @MaxDate INT

	SET @MaxDate = 
		(
			SELECT 
				CONVERT(INT,CONVERT(VARCHAR(4),a_Year +1) + '0101')
			FROM 
				(
				SELECT 
					MAX(FRSTDT) AS MAXDate 
				FROM 
					TRITON_ST_FRMST
				) VWMaxDate
			LEFT JOIN 
				AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR
				ON
					VWMaxDate.MAXDate  = CONF_DT_CALENDAR.i_SK_Calendar
		)

	TRUNCATE TABLE TRITON_SFT_RATES

	--CREATE INDEXES
	EXEC IX_CREATE_TRITON_ST_FRMST

	-- Triton inventory
	INSERT INTO
		TRITON_SFT_RATES

	SELECT
		VWEndDate.FRLOCT, 
		VWEndDate.FRYCTY, 
		TRITON_ST_FRMST_RATE.FRCREW, 
		CONF_DT_CALENDAR_FREFDT.i_SK_Calendar,
		NULL AS i_SK_EffTo,
		DENSE_RANK() OVER (PARTITION BY VWEndDate.FRLOCT,VWEndDate.FRYCTY,VWEndDate.FRDESG ORDER BY CONF_DT_CALENDAR_FREFDT.i_SK_Calendar) AS EffNum,
		CONF_DT_CALENDAR_START.i_SK_Calendar As StartDate,
		CONF_DT_CALENDAR_END.i_SK_Calendar As EndDate,
		TRITON_ST_FRMST_RATE.FRFRAT,
		TRITON_ST_FRMST_RATE.FREACH,
		VWEndDate.FRDESG,
		102,
		'Triton'
	FROM
		(
			SELECT 
				TRITON_ST_FRMST_START.FRLOCT, 
				TRITON_ST_FRMST_START.FRYCTY, 
				TRITON_ST_FRMST_START.FREFDT,
				TRITON_ST_FRMST_START.FRSTDT As StartDate,
				ISNULL(MIN(TRITON_ST_FRMST_END.FRSTDT),@MaxDate) AS EndDate,
				TRITON_ST_FRMST_START.FRDESG 
			FROM 
				TRITON_Stage.dbo.TRITON_ST_FRMST TRITON_ST_FRMST_START
			LEFT JOIN 
				TRITON_Stage.dbo.TRITON_ST_FRMST TRITON_ST_FRMST_END
				ON
					TRITON_ST_FRMST_START.FRLOCT = TRITON_ST_FRMST_END.FRLOCT
					AND
					TRITON_ST_FRMST_START.FRYCTY = TRITON_ST_FRMST_END.FRYCTY
					AND
					TRITON_ST_FRMST_START.FRDESG = TRITON_ST_FRMST_END.FRDESG
					AND
					TRITON_ST_FRMST_START.FREFDT = TRITON_ST_FRMST_END.FREFDT
					AND
					TRITON_ST_FRMST_START.FRSTDT < ISNULL(TRITON_ST_FRMST_END.FRSTDT,@MaxDate)
			GROUP BY
				TRITON_ST_FRMST_START.FRLOCT, 
				TRITON_ST_FRMST_START.FRYCTY, 
				TRITON_ST_FRMST_START.FREFDT,
				TRITON_ST_FRMST_START.FRSTDT,
				TRITON_ST_FRMST_START.FRDESG
			)VWEndDate
		LEFT JOIN
			AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_FREFDT
			ON
				VWEndDate.FREFDT = CONF_DT_CALENDAR_FREFDT.i_SK_Calendar 
		LEFT JOIN
			AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_START
			ON
				VWEndDate.StartDate = CONF_DT_CALENDAR_START.i_SK_Calendar 
		LEFT JOIN
			AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_YESTERDAY
			ON
				VWEndDate.EndDate = CONF_DT_CALENDAR_YESTERDAY.i_SK_Calendar 
		LEFT JOIN
			AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_END
			ON
				CONF_DT_CALENDAR_YESTERDAY.a_Yesterday = CONF_DT_CALENDAR_END.a_Date 
		LEFT JOIN 
			TRITON_Stage.dbo.TRITON_ST_FRMST TRITON_ST_FRMST_RATE
			ON
				VWEndDate.FRLOCT = TRITON_ST_FRMST_RATE.FRLOCT
				AND
				VWEndDate.FRYCTY = TRITON_ST_FRMST_RATE.FRYCTY
				AND
				VWEndDate.FRDESG = TRITON_ST_FRMST_RATE.FRDESG
				AND
				VWEndDate.FREFDT = TRITON_ST_FRMST_RATE.FREFDT
				AND
				VWEndDate.Startdate = TRITON_ST_FRMST_RATE.FRSTDT
		WHERE 
			VWEndDate.FREFDT >'20100101'
	--DROP INDEXES
	EXEC IX_DROP_TRITON_ST_FRMST

	--- Populate TRITON_SFT_RATESSTAGE with the start date that don't exist in the new effective from list dates
	SET NOCOUNT ON;

	DECLARE @EffNumFirst INT
	DECLARE @EffNumSecond INT
	DECLARE @MaxEffNum INT
	DECLARE @LOCT VARCHAR(3)
	DECLARE @FLTY VARCHAR(10)
	DECLARE @Currency VARCHAR(3)

	TRUNCATE TABLE TRITON_SFT_RATESSTAGE


	DECLARE FleetRate_cursor CURSOR FOR
		SELECT
			i_BK_LOCT,
			i_BK_FLTY,
			a_Currency,
			MAX(EffNum) AS MaxEffNum
		FROM
			TRITON_SFT_RATES
		GROUP BY
			i_BK_LOCT,
			i_BK_FLTY,
			a_Currency

	OPEN FleetRate_cursor

	FETCH NEXT FROM FleetRate_cursor
	INTO @LOCT, @FLTY, @Currency, @MaxEffNum
	
	WHILE @@FETCH_STATUS = 0
	BEGIN
		--PRINT @LOCT + ' ' +  @FLTY +' ' + @Currency
	
		SET @EffNumFirst = 1

		WHILE @EffNumFirst < @MaxEffNum 
			BEGIN

				SET @EffNumSecond = @EffNumFirst + 1

				WHILE @EffNumSecond <= @MaxEffNum 	  
				BEGIN

					INSERT INTO 
						TRITON_SFT_RATESSTAGE
					SELECT 
						TRITON_SFT_RATES.i_BK_LOCT, 
						TRITON_SFT_RATES.i_BK_FLTY, 
						TRITON_SFT_RATES.a_Currency,
						TRITON_SFT_RATES.i_BK_CREW,
						TRITON_SFT_RATES.i_SK_EffFrom,
						TRITON_SFT_RATES.EffNum,
						TRITON_SFT_RATES.i_SK_StartDate,
						TRITON_SFT_RATES.a_Rate,
						TRITON_SFT_RATES.a_RatePerPerson,
						TRITON_SFT_RATES_NEXT.i_SK_EffFrom,
						TRITON_SFT_RATES_NEXT.EffNum,
						TRITON_SFT_RATES_NEXT.i_SK_StartDate,
						TRITON_SFT_RATES_NEXT.i_SK_EndDate,
						TRITON_SFT_RATES_NEXT.a_Rate,
						TRITON_SFT_RATES_NEXT.a_RatePerPerson
					FROM 
						TRITON_SFT_RATES
					LEFT  JOIN
							TRITON_SFT_RATES TRITON_SFT_RATES_NEXT
							ON
							TRITON_SFT_RATES.i_BK_LOCT = TRITON_SFT_RATES_NEXT.i_BK_LOCT
							AND
							TRITON_SFT_RATES.i_BK_FLTY = TRITON_SFT_RATES_NEXT.i_BK_FLTY
							AND
							TRITON_SFT_RATES.a_Currency = TRITON_SFT_RATES_NEXT.a_Currency
							AND
							TRITON_SFT_RATES.i_SK_StartDate BETWEEN TRITON_SFT_RATES_NEXT.i_SK_StartDate AND TRITON_SFT_RATES_NEXT.i_SK_EndDate
							AND
							TRITON_SFT_RATES_NEXT.EffNum = @EffNumSecond
					WHERE 
						TRITON_SFT_RATES.i_BK_LOCT = @LOCT
						AND
						TRITON_SFT_RATES.i_BK_FLTY = @FLTY
						AND
						TRITON_SFT_RATES.a_Currency =@Currency
						AND
						TRITON_SFT_RATES.EffNum = @EffNumFirst
						AND
						TRITON_SFT_RATES.i_SK_StartDate > TRITON_SFT_RATES_NEXT.i_SK_EffFrom
						AND
						TRITON_SFT_RATES.i_SK_StartDate <> TRITON_SFT_RATES_NEXT.i_SK_StartDate
					
					INSERT INTO 
						TRITON_SFT_RATESSTAGE
					SELECT 
						TRITON_SFT_RATES.i_BK_LOCT, 
						TRITON_SFT_RATES.i_BK_FLTY, 
						TRITON_SFT_RATES.a_Currency,
						TRITON_SFT_RATES.i_BK_CREW,
						TRITON_SFT_RATES.i_SK_EffFrom,
						TRITON_SFT_RATES.EffNum,
						TRITON_SFT_RATES.i_SK_StartDate,
						TRITON_SFT_RATES.a_Rate,
						TRITON_SFT_RATES.a_RatePerPerson,
						TRITON_SFT_RATES_NEXT.i_SK_EffFrom,
						TRITON_SFT_RATES_NEXT.EffNum,
						TRITON_SFT_RATES.i_SK_StartDate,
						TRITON_SFT_RATES.i_SK_EndDate,
						TRITON_SFT_RATES.a_Rate,
						TRITON_SFT_RATES.a_RatePerPerson
					FROM 
						TRITON_SFT_RATES
					LEFT  JOIN
						(
						SELECT 
							i_BK_LOCT,
							i_BK_FLTY,
							a_Currency,
							EffNum,
							i_SK_EffFrom,
							MIN( i_SK_StartDate) AS i_SK_StartDate
						FROM
							TRITON_SFT_RATES 
						GROUP BY
							i_BK_LOCT,
							i_BK_FLTY,
							a_Currency,
							i_SK_EffFrom,
							EffNum
						) TRITON_SFT_RATES_NEXT
							ON
							TRITON_SFT_RATES.i_BK_LOCT = TRITON_SFT_RATES_NEXT.i_BK_LOCT
							AND
							TRITON_SFT_RATES.i_BK_FLTY = TRITON_SFT_RATES_NEXT.i_BK_FLTY
							AND
							TRITON_SFT_RATES.a_Currency = TRITON_SFT_RATES_NEXT.a_Currency
							AND
							TRITON_SFT_RATES.i_SK_StartDate < TRITON_SFT_RATES_NEXT.i_SK_StartDate
							AND
							TRITON_SFT_RATES_NEXT.EffNum = @EffNumSecond
					WHERE 
						TRITON_SFT_RATES.i_BK_LOCT = @LOCT
						AND
						TRITON_SFT_RATES.i_BK_FLTY = @FLTY
						AND
						TRITON_SFT_RATES.a_Currency =@Currency
						AND
						TRITON_SFT_RATES.EffNum = @EffNumFirst
						AND
						TRITON_SFT_RATES.i_SK_StartDate > TRITON_SFT_RATES_NEXT.i_SK_EffFrom

					SET @EffNumSecond= @EffNumSecond + 1
				END

				SET @EffNumFirst= @EffNumFirst + 1
			END
		FETCH NEXT FROM FleetRate_cursor
		INTO @LOCT, @FLTY, @Currency, @MaxEffNum
	END

	CLOSE FleetRate_cursor
	DEALLOCATE FleetRate_cursor

	-- Add the dates from the TRITON_SFT_RATESSTAGE table
	INSERT INTO
		TRITON_SFT_RATES
			(
				i_BK_LOCT,
				i_BK_FLTY,
				i_BK_CREW,
				i_SK_EffFrom,
				i_SK_EffTo,
				EffNum,
				i_SK_StartDate,
				i_SK_EndDate,
				a_Rate,
				a_RatePerPerson,
				a_Currency,
				i_BK_SourceSysID,
				i_BK_SourceSys
			)
			SELECT
				TRITON_SFT_RATESSTAGE.i_BK_LOCT,
				TRITON_SFT_RATESSTAGE.i_BK_FLTY,
				TRITON_SFT_RATESSTAGE.i_BK_CREW,
				i_SK_EffFromSecond,
				NULL AS i_SK_EffTo,
				MAXEffectiveDate.EffNumSecond,
				MAXEffectiveDate.i_SK_StartDateFirst,
				i_SK_EndDateSecond,
				a_RateSecond,
				a_RatePerPersonSecond,
				TRITON_SFT_RATESSTAGE.a_Currency,
				102 AS i_BK_SourceSysID,
				'Triton' AS i_BK_SourceSys
			FROM
			(
				SELECT 
						TRITON_SFT_RATESSTAGE.i_BK_LOCT,
						TRITON_SFT_RATESSTAGE.i_BK_FLTY,
						--TRITON_SFT_RATESSTAGE.i_BK_CREW,
						--NULL AS i_SK_EffTo,
						MAX(EffNumFirst) AS EffNUM,
						EffNumSecond,
						i_SK_StartDateFirst,
						TRITON_SFT_RATESSTAGE.a_Currency,
						102 AS i_BK_SourceSysID,
						'Triton' AS i_BK_SourceSys	
				FROM 
					TRITON_SFT_RATESSTAGE
				GROUP BY 
					TRITON_SFT_RATESSTAGE.i_BK_LOCT,
					TRITON_SFT_RATESSTAGE.i_BK_FLTY,
					--TRITON_SFT_RATESSTAGE.i_BK_CREW,
					EffNumSecond,
					i_SK_StartDateFirst,
					TRITON_SFT_RATESSTAGE.a_Currency
			) MAXEffectiveDate
			LEFT JOIN 
				TRITON_SFT_RATESSTAGE
				ON
					TRITON_SFT_RATESSTAGE.i_BK_LOCT = MAXEffectiveDate.i_BK_LOCT
					AND
					TRITON_SFT_RATESSTAGE.i_BK_FLTY = MAXEffectiveDate.i_BK_FLTY
					AND
					TRITON_SFT_RATESSTAGE.a_Currency = MAXEffectiveDate.a_Currency 
					AND
					TRITON_SFT_RATESSTAGE.EffNumFirst = MAXEffectiveDate.EffNum
					AND
					TRITON_SFT_RATESSTAGE.EffNumSecond = MAXEffectiveDate.EffNumSecond
					AND
					TRITON_SFT_RATESSTAGE.i_SK_StartDateFirst = MAXEffectiveDate.i_SK_StartDateFirst
				

	-- Update i_SK_EndDate
	UPDATE 
		TRITON_Stage.dbo.TRITON_SFT_RATES
	SET
		i_SK_EndDate = CONF_DT_CALENDAR_END.i_SK_Calendar	
	FROM
		TRITON_Stage.dbo.TRITON_SFT_RATES TRITON_SFT_RATES
	LEFT JOIN
		(
			SELECT 
				TRITON_SFT_RATES_START.i_BK_LOCT, 
				TRITON_SFT_RATES_START.i_BK_FLTY, 
				TRITON_SFT_RATES_START.i_SK_EffFrom,
				TRITON_SFT_RATES_START.i_SK_StartDate As StartDate,
				ISNULL(MIN(TRITON_SFT_RATES_END.i_SK_StartDate),@MaxDate) AS EndDate,
				TRITON_SFT_RATES_START.a_Currency 
			FROM 
				TRITON_Stage.dbo.TRITON_SFT_RATES TRITON_SFT_RATES_START
			LEFT JOIN 
				TRITON_Stage.dbo.TRITON_SFT_RATES TRITON_SFT_RATES_END
				ON
					TRITON_SFT_RATES_START.i_BK_LOCT = TRITON_SFT_RATES_END.i_BK_LOCT
					AND
					TRITON_SFT_RATES_START.i_BK_FLTY = TRITON_SFT_RATES_END.i_BK_FLTY
					AND
					TRITON_SFT_RATES_START.a_Currency = TRITON_SFT_RATES_END.a_Currency
					AND
					TRITON_SFT_RATES_START.i_SK_EffFrom = TRITON_SFT_RATES_END.i_SK_EffFrom
					AND
					TRITON_SFT_RATES_START.i_SK_StartDate < ISNULL(TRITON_SFT_RATES_END.i_SK_StartDate,@MaxDate)
			GROUP BY
				TRITON_SFT_RATES_START.i_BK_LOCT, 
				TRITON_SFT_RATES_START.i_BK_FLTY, 
				TRITON_SFT_RATES_START.i_SK_EffFrom,
				TRITON_SFT_RATES_START.i_SK_StartDate,
				TRITON_SFT_RATES_START.a_Currency
			)VWEndDate
		ON
			VWEndDate.i_BK_LOCT = TRITON_SFT_RATES.i_BK_LOCT
			AND
			VWEndDate.i_BK_FLTY = TRITON_SFT_RATES.i_BK_FLTY
			AND
			VWEndDate.a_Currency = TRITON_SFT_RATES.a_Currency
			AND
			VWEndDate.i_SK_EffFrom = TRITON_SFT_RATES.i_SK_EffFrom
			AND
			VWEndDate.Startdate = TRITON_SFT_RATES.i_SK_StartDate
		LEFT JOIN
			AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_YESTERDAY
			ON
				VWEndDate.EndDate = CONF_DT_CALENDAR_YESTERDAY.i_SK_Calendar 
		LEFT JOIN
			AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_END
			ON
				CONF_DT_CALENDAR_YESTERDAY.a_Yesterday = CONF_DT_CALENDAR_END.a_Date

	-- Update EffectiveTo dates
	DECLARE FleetRate_cursor CURSOR FOR
		SELECT
			i_BK_LOCT,
			i_BK_FLTY,
			a_Currency,
			MAX(EffNum) AS MaxEffNum
		FROM
			TRITON_SFT_RATES
		GROUP BY
			i_BK_LOCT,
			i_BK_FLTY,
			a_Currency

	OPEN FleetRate_cursor

	FETCH NEXT FROM FleetRate_cursor
	INTO @LOCT, @FLTY, @Currency, @MaxEffNum
	
	WHILE @@FETCH_STATUS = 0
	BEGIN
		--PRINT @LOCT + ' ' +  @FLTY +' ' + @Currency
	
		SET @EffNumSecond = @MaxEffNum

		WHILE @EffNumSecond > 1	 
			BEGIN
	
				SET @EffNumFirst = @EffNumSecond - 1

				WHILE @EffNumFirst >= 1	  
				BEGIN
					
					-- Update the dates with the dates that are between start booking date and end regadles if
					-- they are cover by effective date
					UPDATE 
						TRITON_SFT_RATES
					SET 
						i_SK_EffTo = ISNULL(CONF_DT_CALENDAR_END.i_SK_Calendar , @MaxDate)
					FROM 
						TRITON_SFT_RATES
					LEFT  JOIN
						 TRITON_SFT_RATES TRITON_SFT_RATES_NEXT
						 ON
							TRITON_SFT_RATES.i_BK_LOCT = TRITON_SFT_RATES_NEXT.i_BK_LOCT
							AND
							TRITON_SFT_RATES.i_BK_FLTY = TRITON_SFT_RATES_NEXT.i_BK_FLTY
							AND
							TRITON_SFT_RATES.a_Currency = TRITON_SFT_RATES_NEXT.a_Currency
							AND
							TRITON_SFT_RATES.i_SK_StartDate BETWEEN TRITON_SFT_RATES_NEXT.i_SK_StartDate AND TRITON_SFT_RATES_NEXT.i_SK_EndDate
							AND
							TRITON_SFT_RATES_NEXT.EffNum = @EffNumSecond
					LEFT JOIN
						AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_YESTERDAY
						ON
							TRITON_SFT_RATES_NEXT.i_SK_EffFrom = CONF_DT_CALENDAR_YESTERDAY.i_SK_Calendar 
					LEFT JOIN
						AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_END
						ON
							CONF_DT_CALENDAR_YESTERDAY.a_Yesterday = CONF_DT_CALENDAR_END.a_Date
					WHERE 
						TRITON_SFT_RATES.i_BK_LOCT = @LOCT
						AND
						TRITON_SFT_RATES.i_BK_FLTY = @FLTY
						AND
						TRITON_SFT_RATES.a_Currency =@Currency
						AND
						TRITON_SFT_RATES.EffNum = @EffNumFirst

					-- Update the dates with the dates that exist in the following effective dates
					UPDATE
						TRITON_SFT_RATES
					SET
						i_SK_EffTo = CONF_DT_CALENDAR_END.i_SK_Calendar
					FROM 
						TRITON_SFT_RATES
					LEFT  JOIN
						(
							SELECT 
								i_BK_LOCT, 
								i_BK_FLTY, 
								a_Currency,
								i_SK_EffFrom,
								EffNum
							FROM 
								TRITON_SFT_RATES 
							GROUP BY 
								i_BK_LOCT, 
								i_BK_FLTY, 
								a_Currency,
								i_SK_EffFrom,
								EffNum
						)VW_EffDate
							ON
							TRITON_SFT_RATES.i_BK_LOCT = VW_EffDate.i_BK_LOCT
							AND
							TRITON_SFT_RATES.i_BK_FLTY = VW_EffDate.i_BK_FLTY
							AND
							TRITON_SFT_RATES.a_Currency = VW_EffDate.a_Currency
							AND
							VW_EffDate.EffNum =  @EffNumSecond
					LEFT JOIN
						AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_YESTERDAY
						ON
							VW_EffDate.i_SK_EffFrom = CONF_DT_CALENDAR_YESTERDAY.i_SK_Calendar 
					LEFT JOIN
						AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_END
						ON
							CONF_DT_CALENDAR_YESTERDAY.a_Yesterday = CONF_DT_CALENDAR_END.a_Date
					WHERE 
						TRITON_SFT_RATES.i_BK_LOCT = @LOCT
						AND
						TRITON_SFT_RATES.i_BK_FLTY = @FLTY
						AND
						TRITON_SFT_RATES.a_Currency =@Currency
						AND
						TRITON_SFT_RATES.EffNum = @EffNumFirst
						AND
						TRITON_SFT_RATES.i_SK_StartDate < VW_EffDate.i_SK_EffFrom

					SET @EffNumFirst= @EffNumFirst - 1 
				END

				SET @EffNumSecond= @EffNumSecond - 1
			END

			UPDATE 
				TRITON_SFT_RATES
			SET
				i_SK_EffTo  = @MaxDate
			FROM 
				TRITON_SFT_RATES
			WHERE 
				TRITON_SFT_RATES.i_BK_LOCT = @LOCT
				AND
				TRITON_SFT_RATES.i_BK_FLTY = @FLTY
				AND
				TRITON_SFT_RATES.a_Currency =@Currency
				AND
				TRITON_SFT_RATES.EffNum = @MaxEffNum

		FETCH NEXT FROM FleetRate_cursor
		INTO @LOCT, @FLTY, @Currency, @MaxEffNum
	END

	CLOSE FleetRate_cursor
	DEALLOCATE FleetRate_cursor


	EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'TRITON','SFT_RATES'






GO
/****** Object:  StoredProcedure [dbo].[BUILD_TRITON_SFT_RATES_MONTHLY]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[BUILD_TRITON_SFT_RATES_MONTHLY]
AS

	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'TRITON','SFT_RATES','BUILD_TRITON_SFT_RATES_MONTHLY'

	DECLARE @MaxDate INT
	DECLARE @CutOffDate INT

	SET @MaxDate = 
		(
			SELECT 
				CONVERT(INT,CONVERT(VARCHAR(4),a_Year +1) + '0101')
			FROM 
				(
				SELECT 
					MAX(FRSTDT) AS MAXDate 
				FROM 
					TRITON_ST_FRMST
				) VWMaxDate
			LEFT JOIN 
				AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR
				ON
					VWMaxDate.MAXDate  = CONF_DT_CALENDAR.i_SK_Calendar
		)

	
	SET @CutOffDate = 
		(
			SELECT
				i_SK_Calendar
			FROM 
				(
					SELECT 
						DATEADD(day, -500, a_Date) As CutOffDate
					FROM
					(
						SELECT 
							CASE WHEN MAX(i_SK_EffFrom)> CONVERT(INT,( CONVERT(VARCHAR(8),GETDATE(),112))) THEN CONVERT(INT,( CONVERT(VARCHAR(8),GETDATE(),112))) ELSE MAX(i_SK_EffFrom) END AS MAXEffFrom
						FROM 
							TRITON_SFT_RATES
						)VWMAXEffFrom
						LEFT JOIN 
							AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR
							ON
								VWMAXEffFrom.MAXEffFrom= CONF_DT_CALENDAR.i_SK_Calendar
					)VWCutOffDate
					LEFT JOIN 
						AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR
						ON
							VWCutOffDate.CutOffDate = CONF_DT_CALENDAR.a_Date
		)

	--CREATE INDEXES
	EXEC IX_CREATE_TRITON_ST_FRMST

	-- Triton inventory
	DELETE FROM 
		TRITON_SFT_RATES
	WHERE 
		i_SK_EffFrom > @CutOffDate

	INSERT INTO
		TRITON_SFT_RATES
	SELECT
		VWEndDate.FRLOCT, 
		VWEndDate.FRYCTY, 
		TRITON_ST_FRMST_RATE.FRCREW, 
		CONF_DT_CALENDAR_FREFDT.i_SK_Calendar,
		NULL AS i_SK_EffTo,
		(iSNULL(MaxEffNum,0)+ DENSE_RANK() OVER (PARTITION BY VWEndDate.FRLOCT,VWEndDate.FRYCTY,VWEndDate.FRDESG ORDER BY CONF_DT_CALENDAR_FREFDT.i_SK_Calendar)) AS EffNum,
		CONF_DT_CALENDAR_START.i_SK_Calendar As StartDate,
		CONF_DT_CALENDAR_END.i_SK_Calendar As EndDate,
		TRITON_ST_FRMST_RATE.FRFRAT,
		TRITON_ST_FRMST_RATE.FREACH,
		VWEndDate.FRDESG,
		'102',
		'Triton'
	FROM
		(
			SELECT 
				TRITON_ST_FRMST_START.FRLOCT, 
				TRITON_ST_FRMST_START.FRYCTY, 
				TRITON_ST_FRMST_START.FREFDT,
				TRITON_ST_FRMST_START.FRSTDT As StartDate,
				ISNULL(MIN(TRITON_ST_FRMST_END.FRSTDT), @MaxDate) AS EndDate,
				TRITON_ST_FRMST_START.FRDESG 
			FROM 
				TRITON_Stage.dbo.TRITON_ST_FRMST TRITON_ST_FRMST_START
			LEFT JOIN 
				TRITON_Stage.dbo.TRITON_ST_FRMST TRITON_ST_FRMST_END
				ON
					TRITON_ST_FRMST_START.FRLOCT = TRITON_ST_FRMST_END.FRLOCT
					AND
					TRITON_ST_FRMST_START.FRYCTY = TRITON_ST_FRMST_END.FRYCTY
					AND
					TRITON_ST_FRMST_START.FRDESG = TRITON_ST_FRMST_END.FRDESG
					AND
					TRITON_ST_FRMST_START.FREFDT = TRITON_ST_FRMST_END.FREFDT
					AND
					TRITON_ST_FRMST_START.FRSTDT < ISNULL(TRITON_ST_FRMST_END.FRSTDT,@MaxDate)
			GROUP BY
				TRITON_ST_FRMST_START.FRLOCT, 
				TRITON_ST_FRMST_START.FRYCTY, 
				TRITON_ST_FRMST_START.FREFDT,
				TRITON_ST_FRMST_START.FRSTDT,
				TRITON_ST_FRMST_START.FRDESG
			)VWEndDate
		LEFT JOIN
			AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_FREFDT
			ON
				VWEndDate.FREFDT = CONF_DT_CALENDAR_FREFDT.i_SK_Calendar 
		LEFT JOIN
			AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_START
			ON
				VWEndDate.StartDate = CONF_DT_CALENDAR_START.i_SK_Calendar 
		LEFT JOIN
			AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_YESTERDAY
			ON
				VWEndDate.EndDate = CONF_DT_CALENDAR_YESTERDAY.i_SK_Calendar 
		LEFT JOIN
			AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_END
			ON
				CONF_DT_CALENDAR_YESTERDAY.a_Yesterday = CONF_DT_CALENDAR_END.a_Date 
		LEFT JOIN 
			TRITON_Stage.dbo.TRITON_ST_FRMST TRITON_ST_FRMST_RATE
			ON
				VWEndDate.FRLOCT = TRITON_ST_FRMST_RATE.FRLOCT
				AND
				VWEndDate.FRYCTY = TRITON_ST_FRMST_RATE.FRYCTY
				AND
				VWEndDate.FRDESG = TRITON_ST_FRMST_RATE.FRDESG
				AND
				VWEndDate.FREFDT = TRITON_ST_FRMST_RATE.FREFDT
				AND
				VWEndDate.Startdate = TRITON_ST_FRMST_RATE.FRSTDT
		LEFT JOIN 
			(
			SELECT
				i_BK_LOCT,
				i_BK_FLTY,
				a_Currency,
				MAX(EffNum) AS MaxEffNum
			FROM
				TRITON_SFT_RATES
			WHERE
				i_SK_EffFrom < = @CutOffDate
			GROUP BY 
				i_BK_LOCT,
				i_BK_FLTY,
				a_Currency
			)VWMaxEffDate
			ON
				VWEndDate.FRLOCT = VWMaxEffDate.i_BK_LOCT
				AND
				VWEndDate.FRYCTY = VWMaxEffDate.i_BK_FLTY
				AND
				VWEndDate.FRDESG = VWMaxEffDate.a_Currency
		WHERE 
			VWEndDate.FREFDT > @CutOffDate

	--DROP INDEXES
	EXEC IX_DROP_TRITON_ST_FRMST

	--- Populate TRITON_SFT_RATESSTAGE with the start date that don't exist in the new effective from list dates
	SET NOCOUNT ON;

	DECLARE @EffNumFirst INT
	DECLARE @EffNumSecond INT
	DECLARE @MaxEffNum INT
	DECLARE @LOCT VARCHAR(3)
	DECLARE @FLTY VARCHAR(10)
	DECLARE @Currency VARCHAR(3)

	TRUNCATE TABLE TRITON_SFT_RATESSTAGE

	DECLARE FleetRate_cursor CURSOR FOR
		SELECT
			i_BK_LOCT,
			i_BK_FLTY,
			a_Currency,
			MAX(EffNum) AS MaxEffNum
		FROM
			TRITON_SFT_RATES
		GROUP BY
			i_BK_LOCT,
			i_BK_FLTY,
			a_Currency

	OPEN FleetRate_cursor

	FETCH NEXT FROM FleetRate_cursor
	INTO @LOCT, @FLTY, @Currency, @MaxEffNum
	
	WHILE @@FETCH_STATUS = 0
	BEGIN
		--PRINT @LOCT + ' ' +  @FLTY +' ' + @Currency

		--SET @EffNumFirst = 1
		SET @EffNumFirst = ISNULL(
			(
			SELECT 
				MAX(EffNum) 
			FROM
				TRITON_SFT_RATES
			WHERE
				TRITON_SFT_RATES.i_BK_LOCT = @LOCT
				AND
				TRITON_SFT_RATES.i_BK_FLTY = @FLTY
				AND
				TRITON_SFT_RATES.a_Currency =@Currency
				AND
				i_SK_EffFrom < = @CutOffDate
			GROUP BY 
				i_BK_LOCT,
				i_BK_FLTY,
				a_Currency
			) 
				,1)

		WHILE @EffNumFirst < @MaxEffNum 
			BEGIN

				SET @EffNumSecond = @EffNumFirst + 1

				WHILE @EffNumSecond < = @MaxEffNum 	  
				BEGIN

					INSERT INTO 
						TRITON_SFT_RATESSTAGE
					SELECT 
						TRITON_SFT_RATES.i_BK_LOCT, 
						TRITON_SFT_RATES.i_BK_FLTY, 
						TRITON_SFT_RATES.a_Currency,
						TRITON_SFT_RATES.i_BK_CREW,
						TRITON_SFT_RATES.i_SK_EffFrom,
						TRITON_SFT_RATES.EffNum,
						TRITON_SFT_RATES.i_SK_StartDate,
						TRITON_SFT_RATES.a_Rate,
						TRITON_SFT_RATES.a_RatePerPerson,
						TRITON_SFT_RATES_NEXT.i_SK_EffFrom,
						TRITON_SFT_RATES_NEXT.EffNum,
						TRITON_SFT_RATES_NEXT.i_SK_StartDate,
						TRITON_SFT_RATES_NEXT.i_SK_EndDate,
						TRITON_SFT_RATES_NEXT.a_Rate,
						TRITON_SFT_RATES_NEXT.a_RatePerPerson
					FROM 
						TRITON_SFT_RATES
					LEFT  JOIN
							TRITON_SFT_RATES TRITON_SFT_RATES_NEXT
							ON
							TRITON_SFT_RATES.i_BK_LOCT = TRITON_SFT_RATES_NEXT.i_BK_LOCT
							AND
							TRITON_SFT_RATES.i_BK_FLTY = TRITON_SFT_RATES_NEXT.i_BK_FLTY
							AND
							TRITON_SFT_RATES.a_Currency = TRITON_SFT_RATES_NEXT.a_Currency
							AND
							TRITON_SFT_RATES.i_SK_StartDate BETWEEN TRITON_SFT_RATES_NEXT.i_SK_StartDate AND TRITON_SFT_RATES_NEXT.i_SK_EndDate
							AND
							TRITON_SFT_RATES_NEXT.EffNum = @EffNumSecond
					WHERE 
						TRITON_SFT_RATES.i_BK_LOCT = @LOCT
						AND
						TRITON_SFT_RATES.i_BK_FLTY = @FLTY
						AND
						TRITON_SFT_RATES.a_Currency =@Currency
						AND
						TRITON_SFT_RATES.EffNum = @EffNumFirst
						AND
						TRITON_SFT_RATES.i_SK_StartDate > TRITON_SFT_RATES_NEXT.i_SK_EffFrom
						AND
						TRITON_SFT_RATES.i_SK_StartDate <> TRITON_SFT_RATES_NEXT.i_SK_StartDate

						--- dates less than the min next date

					INSERT INTO 
						TRITON_SFT_RATESSTAGE
					SELECT 
						TRITON_SFT_RATES.i_BK_LOCT, 
						TRITON_SFT_RATES.i_BK_FLTY, 
						TRITON_SFT_RATES.a_Currency,
						TRITON_SFT_RATES.i_BK_CREW,
						TRITON_SFT_RATES.i_SK_EffFrom,
						TRITON_SFT_RATES.EffNum,
						TRITON_SFT_RATES.i_SK_StartDate,
						TRITON_SFT_RATES.a_Rate,
						TRITON_SFT_RATES.a_RatePerPerson,
						TRITON_SFT_RATES_NEXT.i_SK_EffFrom,
						TRITON_SFT_RATES_NEXT.EffNum,
						TRITON_SFT_RATES.i_SK_StartDate,
						TRITON_SFT_RATES.i_SK_EndDate,
						TRITON_SFT_RATES.a_Rate,
						TRITON_SFT_RATES.a_RatePerPerson
					FROM 
						TRITON_SFT_RATES
					LEFT  JOIN
						(
						SELECT 
							i_BK_LOCT,
							i_BK_FLTY,
							a_Currency,
							EffNum,
							i_SK_EffFrom,
							MIN( i_SK_StartDate) AS i_SK_StartDate
						FROM
							TRITON_SFT_RATES 
						GROUP BY
							i_BK_LOCT,
							i_BK_FLTY,
							a_Currency,
							i_SK_EffFrom,
							EffNum
						) TRITON_SFT_RATES_NEXT
							ON
							TRITON_SFT_RATES.i_BK_LOCT = TRITON_SFT_RATES_NEXT.i_BK_LOCT
							AND
							TRITON_SFT_RATES.i_BK_FLTY = TRITON_SFT_RATES_NEXT.i_BK_FLTY
							AND
							TRITON_SFT_RATES.a_Currency = TRITON_SFT_RATES_NEXT.a_Currency
							AND
							TRITON_SFT_RATES.i_SK_StartDate < TRITON_SFT_RATES_NEXT.i_SK_StartDate
							AND
							TRITON_SFT_RATES_NEXT.EffNum = @EffNumSecond
					WHERE 
						TRITON_SFT_RATES.i_BK_LOCT = @LOCT
						AND
						TRITON_SFT_RATES.i_BK_FLTY = @FLTY
						AND
						TRITON_SFT_RATES.a_Currency =@Currency
						AND
						TRITON_SFT_RATES.EffNum = @EffNumFirst
						AND
						TRITON_SFT_RATES.i_SK_StartDate > TRITON_SFT_RATES_NEXT.i_SK_EffFrom

					SET @EffNumSecond= @EffNumSecond + 1
				END

				SET @EffNumFirst= @EffNumFirst + 1
			END
		FETCH NEXT FROM FleetRate_cursor
		INTO @LOCT, @FLTY, @Currency, @MaxEffNum
	END

	CLOSE FleetRate_cursor
	DEALLOCATE FleetRate_cursor

	-- Add the dates from the TRITON_SFT_RATESSTAGE table
	INSERT INTO
		TRITON_SFT_RATES
			(
				i_BK_LOCT,
				i_BK_FLTY,
				i_BK_CREW,
				i_SK_EffFrom,
				i_SK_EffTo,
				EffNum,
				i_SK_StartDate,
				i_SK_EndDate,
				a_Rate,
				a_RatePerPerson,
				a_Currency,
				i_BK_SourceSysID,
				i_BK_SourceSys
			)
			SELECT 
				TRITON_SFT_RATESSTAGE.i_BK_LOCT,
				TRITON_SFT_RATESSTAGE.i_BK_FLTY,
				TRITON_SFT_RATESSTAGE.i_BK_CREW,
				i_SK_EffFromSecond,
				NULL AS i_SK_EffTo,
				MAXEffectiveDate.EffNumSecond,
				MAXEffectiveDate.i_SK_StartDateFirst,
				i_SK_EndDateSecond,
				a_RateSecond,
				a_RatePerPersonSecond,
				TRITON_SFT_RATESSTAGE.a_Currency,
				102 AS i_BK_SourceSysID,
				'Triton' AS i_BK_SourceSys
			FROM
			(
				SELECT 
						TRITON_SFT_RATESSTAGE.i_BK_LOCT,
						TRITON_SFT_RATESSTAGE.i_BK_FLTY,
						--TRITON_SFT_RATESSTAGE.i_BK_CREW,
						--NULL AS i_SK_EffTo,
						MAX(EffNumFirst) AS EffNUM,
						EffNumSecond,
						i_SK_StartDateFirst,
						TRITON_SFT_RATESSTAGE.a_Currency,
						102 AS i_BK_SourceSysID, 
						'Triton' AS i_BK_SourceSys	
				FROM 
					TRITON_SFT_RATESSTAGE
				GROUP BY 
					TRITON_SFT_RATESSTAGE.i_BK_LOCT,
					TRITON_SFT_RATESSTAGE.i_BK_FLTY,
					--TRITON_SFT_RATESSTAGE.i_BK_CREW,
					EffNumSecond,
					i_SK_StartDateFirst,
					TRITON_SFT_RATESSTAGE.a_Currency
			) MAXEffectiveDate
			LEFT JOIN 
				TRITON_SFT_RATESSTAGE
				ON
					TRITON_SFT_RATESSTAGE.i_BK_LOCT = MAXEffectiveDate.i_BK_LOCT
					AND
					TRITON_SFT_RATESSTAGE.i_BK_FLTY = MAXEffectiveDate.i_BK_FLTY
					AND
					TRITON_SFT_RATESSTAGE.a_Currency = MAXEffectiveDate.a_Currency 
					AND
					TRITON_SFT_RATESSTAGE.EffNumFirst = MAXEffectiveDate.EffNum
					AND
					TRITON_SFT_RATESSTAGE.EffNumSecond = MAXEffectiveDate.EffNumSecond
					AND
					TRITON_SFT_RATESSTAGE.i_SK_StartDateFirst = MAXEffectiveDate.i_SK_StartDateFirst
				

	-- Update i_SK_EndDate
	UPDATE 
		TRITON_Stage.dbo.TRITON_SFT_RATES
	SET
		i_SK_EndDate = CONF_DT_CALENDAR_END.i_SK_Calendar	
	FROM
		TRITON_Stage.dbo.TRITON_SFT_RATES TRITON_SFT_RATES
	LEFT JOIN
		(
			SELECT 
				TRITON_SFT_RATES_START.i_BK_LOCT, 
				TRITON_SFT_RATES_START.i_BK_FLTY, 
				TRITON_SFT_RATES_START.i_SK_EffFrom,
				TRITON_SFT_RATES_START.i_SK_StartDate As StartDate,
				ISNULL(MIN(TRITON_SFT_RATES_END.i_SK_StartDate), @MaxDate) AS EndDate,
				TRITON_SFT_RATES_START.a_Currency 
			FROM 
				TRITON_Stage.dbo.TRITON_SFT_RATES TRITON_SFT_RATES_START
			LEFT JOIN 
				TRITON_Stage.dbo.TRITON_SFT_RATES TRITON_SFT_RATES_END
				ON
					TRITON_SFT_RATES_START.i_BK_LOCT = TRITON_SFT_RATES_END.i_BK_LOCT
					AND
					TRITON_SFT_RATES_START.i_BK_FLTY = TRITON_SFT_RATES_END.i_BK_FLTY
					AND
					TRITON_SFT_RATES_START.a_Currency = TRITON_SFT_RATES_END.a_Currency
					AND
					TRITON_SFT_RATES_START.i_SK_EffFrom = TRITON_SFT_RATES_END.i_SK_EffFrom
					AND
					TRITON_SFT_RATES_START.i_SK_StartDate < ISNULL(TRITON_SFT_RATES_END.i_SK_StartDate, @MaxDate)
			GROUP BY
				TRITON_SFT_RATES_START.i_BK_LOCT, 
				TRITON_SFT_RATES_START.i_BK_FLTY, 
				TRITON_SFT_RATES_START.i_SK_EffFrom,
				TRITON_SFT_RATES_START.i_SK_StartDate,
				TRITON_SFT_RATES_START.a_Currency
			)VWEndDate
		ON
			VWEndDate.i_BK_LOCT = TRITON_SFT_RATES.i_BK_LOCT
			AND
			VWEndDate.i_BK_FLTY = TRITON_SFT_RATES.i_BK_FLTY
			AND
			VWEndDate.a_Currency = TRITON_SFT_RATES.a_Currency
			AND
			VWEndDate.i_SK_EffFrom = TRITON_SFT_RATES.i_SK_EffFrom
			AND
			VWEndDate.Startdate = TRITON_SFT_RATES.i_SK_StartDate
		LEFT JOIN
			AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_YESTERDAY
			ON
				VWEndDate.EndDate = CONF_DT_CALENDAR_YESTERDAY.i_SK_Calendar 
		LEFT JOIN
			AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_END
			ON
				CONF_DT_CALENDAR_YESTERDAY.a_Yesterday = CONF_DT_CALENDAR_END.a_Date
		WHERE 
			VWEndDate.i_SK_EffFrom > @CutOffDate

	-- Update EffectiveTo dates
	DECLARE FleetRate_cursor CURSOR FOR
		SELECT
			i_BK_LOCT,
			i_BK_FLTY,
			a_Currency,
			MAX(EffNum) AS MaxEffNum
		FROM
			TRITON_SFT_RATES
		GROUP BY
			i_BK_LOCT,
			i_BK_FLTY,
			a_Currency

	OPEN FleetRate_cursor

	FETCH NEXT FROM FleetRate_cursor
	INTO @LOCT, @FLTY, @Currency, @MaxEffNum
	
	WHILE @@FETCH_STATUS = 0
	BEGIN
		--PRINT @LOCT + ' ' +  @FLTY +' ' + @Currency
	
		SET @EffNumSecond = @MaxEffNum

		WHILE @EffNumSecond > 1	 
			BEGIN
	
				SET @EffNumFirst = @EffNumSecond - 1

				WHILE @EffNumFirst >= 1	  
				BEGIN
					
					-- Update the dates with the dates that are between start booking date and end regadles if
					-- they are cover by effective date
					UPDATE 
						TRITON_SFT_RATES
					SET 
						i_SK_EffTo = ISNULL(CONF_DT_CALENDAR_END.i_SK_Calendar , @MaxDate)
					FROM 
						TRITON_SFT_RATES
					LEFT  JOIN
						 TRITON_SFT_RATES TRITON_SFT_RATES_NEXT
						 ON
							TRITON_SFT_RATES.i_BK_LOCT = TRITON_SFT_RATES_NEXT.i_BK_LOCT
							AND
							TRITON_SFT_RATES.i_BK_FLTY = TRITON_SFT_RATES_NEXT.i_BK_FLTY
							AND
							TRITON_SFT_RATES.a_Currency = TRITON_SFT_RATES_NEXT.a_Currency
							AND
							TRITON_SFT_RATES.i_SK_StartDate BETWEEN TRITON_SFT_RATES_NEXT.i_SK_StartDate AND TRITON_SFT_RATES_NEXT.i_SK_EndDate
							AND
							TRITON_SFT_RATES_NEXT.EffNum = @EffNumSecond
					LEFT JOIN
						AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_YESTERDAY
						ON
							TRITON_SFT_RATES_NEXT.i_SK_EffFrom = CONF_DT_CALENDAR_YESTERDAY.i_SK_Calendar 
					LEFT JOIN
						AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_END
						ON
							CONF_DT_CALENDAR_YESTERDAY.a_Yesterday = CONF_DT_CALENDAR_END.a_Date
					WHERE 
						TRITON_SFT_RATES.i_BK_LOCT = @LOCT
						AND
						TRITON_SFT_RATES.i_BK_FLTY = @FLTY
						AND
						TRITON_SFT_RATES.a_Currency =@Currency
						AND
						TRITON_SFT_RATES.EffNum = @EffNumFirst
						AND
						TRITON_SFT_RATES.i_SK_EffFrom >= @CutOffDate

					-- Update the dates with the dates that exist in the following effective dates
					UPDATE
						TRITON_SFT_RATES
					SET
						i_SK_EffTo = CONF_DT_CALENDAR_END.i_SK_Calendar
					FROM 
						TRITON_SFT_RATES
					LEFT  JOIN
						(
							SELECT 
								i_BK_LOCT, 
								i_BK_FLTY, 
								a_Currency,
								i_SK_EffFrom,
								EffNum
							FROM 
								TRITON_SFT_RATES 
							GROUP BY 
								i_BK_LOCT, 
								i_BK_FLTY, 
								a_Currency,
								i_SK_EffFrom,
								EffNum
						)VW_EffDate
							ON
							TRITON_SFT_RATES.i_BK_LOCT = VW_EffDate.i_BK_LOCT
							AND
							TRITON_SFT_RATES.i_BK_FLTY = VW_EffDate.i_BK_FLTY
							AND
							TRITON_SFT_RATES.a_Currency = VW_EffDate.a_Currency
							AND
							VW_EffDate.EffNum =  @EffNumSecond
					LEFT JOIN
						AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_YESTERDAY
						ON
							VW_EffDate.i_SK_EffFrom = CONF_DT_CALENDAR_YESTERDAY.i_SK_Calendar 
					LEFT JOIN
						AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_END
						ON
							CONF_DT_CALENDAR_YESTERDAY.a_Yesterday = CONF_DT_CALENDAR_END.a_Date
					WHERE 
						TRITON_SFT_RATES.i_BK_LOCT = @LOCT
						AND
						TRITON_SFT_RATES.i_BK_FLTY = @FLTY
						AND
						TRITON_SFT_RATES.a_Currency =@Currency
						AND
						TRITON_SFT_RATES.EffNum = @EffNumFirst
						AND
						TRITON_SFT_RATES.i_SK_StartDate < VW_EffDate.i_SK_EffFrom
						AND
						TRITON_SFT_RATES.i_SK_EffFrom >= @CutOffDate

					SET @EffNumFirst= @EffNumFirst - 1 
				END

				SET @EffNumSecond= @EffNumSecond - 1
			END

			UPDATE 
				TRITON_SFT_RATES
			SET
				i_SK_EffTo  = @MaxDate
			FROM 
				TRITON_SFT_RATES
			WHERE 
				TRITON_SFT_RATES.i_BK_LOCT = @LOCT
				AND
				TRITON_SFT_RATES.i_BK_FLTY = @FLTY
				AND
				TRITON_SFT_RATES.a_Currency =@Currency
				AND
				TRITON_SFT_RATES.EffNum = @MaxEffNum
				AND
				TRITON_SFT_RATES.i_SK_EffFrom >= @CutOffDate

		FETCH NEXT FROM FleetRate_cursor
		INTO @LOCT, @FLTY, @Currency, @MaxEffNum
	END

	CLOSE FleetRate_cursor
	DEALLOCATE FleetRate_cursor


	EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'TRITON','SFT_RATES'








GO
/****** Object:  StoredProcedure [dbo].[BUILD_TRITON_ST_CLMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[BUILD_TRITON_ST_CLMST]
AS

	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'TRITON','ST_CLMST','BUILD_TRITON_ST_CLMST'

	DECLARE @intErrorCode INT

	BEGIN TRAN
		DELETE FROM  TRITON_ST_CLMST WHERE CLNUMB IN  (SELECT  CLNUMB  FROM TRITON_ST_CLMST_YASDLIB )

		SELECT @intErrorCode = @@ERROR
		IF (@intErrorCode <> 0) GOTO PROBLEM

		INSERT INTO TRITON_ST_CLMST  SELECT * FROM TRITON_ST_CLMST_YASDLIB 

		SELECT @intErrorCode = @@ERROR
		IF (@intErrorCode <> 0) GOTO PROBLEM
	COMMIT TRAN

	PROBLEM:
	IF (@intErrorCode <> 0) BEGIN
		ROLLBACK TRAN
	END
	
	EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'TRITON','ST_CLMST' ,@intErrorCode
GO
/****** Object:  StoredProcedure [dbo].[IX_CREATE_SUNSAIL_ST_FRMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[IX_CREATE_SUNSAIL_ST_FRMST]
AS
BEGIN
/******ENSURE INDEXES ARE DROPPED************/
/****** Object:  Index [IX_BK_TRITON_ST_FRMST]    Script Date: 02/09/2010 15:14:19 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[SUNSAIL_ST_FRMST]') AND name = N'IX_BK_SUNSAIL_ST_FRMST')
DROP INDEX [IX_BK_SUNSAIL_ST_FRMST] ON [dbo].[SUNSAIL_ST_FRMST] WITH ( ONLINE = OFF )


CREATE NONCLUSTERED INDEX [IX_BK_SUNSAIL_ST_FRMST] ON [dbo].[SUNSAIL_ST_FRMST]
(
	[FRLOCT] ASC,
	[FRYCTY] ASC,
	[FREFDT] ASC,
	[FRSTDT] ASC,
	[FRDESG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]



END



GO
/****** Object:  StoredProcedure [dbo].[IX_CREATE_TRITON_ST_FRMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[IX_CREATE_TRITON_ST_FRMST]
AS
BEGIN
/******ENSURE INDEXES ARE DROPPED************/
/****** Object:  Index [IX_BK_TRITON_ST_FRMST]    Script Date: 02/09/2010 15:14:19 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[TRITON_ST_FRMST]') AND name = N'IX_BK_TRITON_ST_FRMST')
DROP INDEX [IX_BK_TRITON_ST_FRMST] ON [dbo].[TRITON_ST_FRMST] WITH ( ONLINE = OFF )


/****** Object:  Index [IX_EXT_FT_EXTRA_CK]    Script Date: 02/11/2010 16:54:02 ******/
CREATE NONCLUSTERED INDEX [IX_BK_TRITON_ST_FRMST] ON [dbo].[TRITON_ST_FRMST]
(
	[FRLOCT] ASC,
	[FRYCTY] ASC,
	[FREFDT] ASC,
	[FRSTDT] ASC,
	[FRDESG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]



END


GO
/****** Object:  StoredProcedure [dbo].[IX_DROP_SUNSAIL_ST_FRMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[IX_DROP_SUNSAIL_ST_FRMST]
AS
BEGIN
/****** Object:  Index [IX_BK_SUNSAIL_ST_FRMST]    Script Date: 02/09/2010 15:14:19 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[SUNSAIL_ST_FRMST]') AND name = N'IX_BK_SUNSAIL_ST_FRMST')
DROP INDEX [IX_BK_SUNSAIL_ST_FRMST] ON [dbo].[SUNSAIL_ST_FRMST] WITH ( ONLINE = OFF )



END



GO
/****** Object:  StoredProcedure [dbo].[IX_DROP_TRITON_ST_FRMST]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[IX_DROP_TRITON_ST_FRMST]
AS
BEGIN
/****** Object:  Index [IX_BK_TRITON_ST_FRMST]    Script Date: 02/09/2010 15:14:19 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[TRITON_ST_FRMST]') AND name = N'IX_BK_TRITON_ST_FRMST')
DROP INDEX [IX_BK_TRITON_ST_FRMST] ON [dbo].[TRITON_ST_FRMST] WITH ( ONLINE = OFF )



END



GO
/****** Object:  StoredProcedure [dbo].[SEND_MOORINGS_LOG_MAIL]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[SEND_MOORINGS_LOG_MAIL]
AS
	BEGIN


	DECLARE @NumRows AS INT
	DECLARE @CurrentNumRows AS INT
	DECLARE @LogFileName AS VARCHAR(250)
	DECLARE @SubjectText AS VARCHAR(250)
	DECLARE @BodyText AS VARCHAR(250)

	SELECT 
		@NumRows = COUNT(*)
	FROM 
		TRITON_LOG
	WHERE 
		[Schema] ='TRTN-Moorings'
		AND 
		CONVERT(VARCHAR(8),LogDate,112) = CONVERT(VARCHAR(8),GETDATE(),112)
		AND 
		PassFail = 'FAIL'

	SET @CurrentNumRows = 1
	SET @LogFileName  =''
		
	IF @NumRows >0 
		BEGIN
			WHILE @NumRows >= @CurrentNumRows
				BEGIN
					SELECT @LogFileName = @LogFileName + COALESCE ( LogFileName ,' ,' ) + CASE WHEN @NumRows=@CurrentNumRows THEN '' ELSE ',' END
				FROM (
					SELECT
						LogFileName
					FROM
						(
							SELECT  
								LogFileName , ROW_NUMBER() OVER(ORDER BY LogFileName DESC) AS CurrentRow 
							FROM 
								TRITON_LOG
							WHERE [Schema] ='TRTN-Moorings'
							AND CONVERT(VARCHAR(8),LogDate,112) = CONVERT(VARCHAR(8),GETDATE(),112)
							AND PassFail = 'FAIL'
						) RowFailedFiles
						WHERE CurrentRow=@CurrentNumRows
				)GetFailedFiles
				SET @CurrentNumRows = @CurrentNumRows +1
			END
		SET @SubjectText = 'Triton Moorings Extract fail'
		SET @BodyText = 'The following files failed: ' + @LogFileName
		END
	ELSE
		SET @SubjectText = 'Triton Moorings Extract run successfully'
	

	--PRINT @SubjectText
	exec msdb.dbo.sp_send_dbmail
	@profile_name = 'SQLAdmin',
	@from_address = 'SQLAdmin@TUISKIMIUAT01.SpecialistHolidays.com',
	@recipients = 'amiprojectteam@tuiski.com;robert.richards@tuiski.com',
	@subject = @SubjectText,
	@body = @BodyText

END








GO
/****** Object:  StoredProcedure [dbo].[SEND_SUNSAIL_LOG_MAIL]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[SEND_SUNSAIL_LOG_MAIL]
AS
	BEGIN


	DECLARE @NumRows AS INT
	DECLARE @CurrentNumRows AS INT
	DECLARE @LogFileName AS VARCHAR(250)
	DECLARE @SubjectText AS VARCHAR(250)
	DECLARE @BodyText AS VARCHAR(250)

	SELECT 
		@NumRows = COUNT(*)
	FROM 
		TRITON_LOG
	WHERE 
		[Schema] ='TRTN-Sunsail'
		AND 
		CONVERT(VARCHAR(8),LogDate,112) = CONVERT(VARCHAR(8),GETDATE(),112)
		AND 
		PassFail = 'FAIL'

	SET @CurrentNumRows = 1
	SET @LogFileName  =''
		
	IF @NumRows >0 
		BEGIN
			WHILE @NumRows >= @CurrentNumRows
				BEGIN
					SELECT @LogFileName = @LogFileName + COALESCE ( LogFileName ,' ,' ) + CASE WHEN @NumRows=@CurrentNumRows THEN '' ELSE ',' END
				FROM (
					SELECT
						LogFileName
					FROM
						(
							SELECT  
								LogFileName , ROW_NUMBER() OVER(ORDER BY LogFileName DESC) AS CurrentRow 
							FROM 
								TRITON_LOG
							WHERE [Schema] ='TRTN-Sunsail'
							AND CONVERT(VARCHAR(8),LogDate,112) = CONVERT(VARCHAR(8),GETDATE(),112)
							AND PassFail = 'FAIL'
						) RowFailedFiles
						WHERE CurrentRow=@CurrentNumRows
				)GetFailedFiles
				SET @CurrentNumRows = @CurrentNumRows +1
			END
		SET @SubjectText = 'Triton Sunsail Extract fail'
		SET @BodyText = 'The following files failed: ' + @LogFileName
		END
	ELSE
		SET @SubjectText = 'Triton Sunsail Extract run successfully'
	

	--PRINT @SubjectText
	exec msdb.dbo.sp_send_dbmail
	@profile_name = 'SQLAdmin',
	@from_address = 'SQLAdmin@TUISKIMIUAT01.SpecialistHolidays.com',
	@recipients = 'amiprojectteam@tuiski.com;robert.richards@tuiski.com',
	@subject = @SubjectText,
	@body = @BodyText

END







GO
/****** Object:  StoredProcedure [dbo].[TRITON_EMAIL_FORMAT]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[TRITON_EMAIL_FORMAT]
	@EmailBody VARCHAR (MAX) = '' OUTPUT,
	@EmailTitle VARCHAR(100) = '',
	@QueryCode VARCHAR (MAX) = '',
	@Fail VARCHAR(100) = '' 
AS
BEGIN 

IF @Fail = 'YES'
BEGIN 
SET @QueryCode = N'<style type = ''text/css''> table{border-collapse:collapse;border:1px solid #B2B2B2; margin-right:200px; width:800px; font:10pt verdana; color:#343434} table td, table th, table caption { border:1px solid #B2B2B2;} table caption{baclground-color:white} table th{background-color:#33999FF;font-weight:bold;}  </style>' + N'<table>' + N'<Caption><h3>Triton Row Counts</h3></caption>' + N'<tr><th>Database</th><th>File Name</th><th>FileRow</th><th>Database Rows</th><th>Rows Match</th></tr>' + CAST((SELECT
	td = a_DataBase,
	'',
	td = a_name,
	'',
	td = a_Row_Count,
	'',
	td = ErrorText,
	'',
	td = CASE WHEN a_Row_Count != ErrorText 
			THEN 'NO' 
			ELSE 'YES' 
			END,	''
FROM 
	TRITON_Stage.dbo.TRITON_ROW_COUNTS
	LEFT JOIN 
		TRITON_STAGE.Dbo.TRITON_ROW_COUNT_MAP
			ON a_FileName = a_Name
	AND 
		a_DataBase = DB
	LEFT JOIN 
		AMI_Galaxy.dbo.AMI_LOG
		ON StepID = a_LogFileName
	WHERE 
		a_LogFileName IS NOT NULL
	AND 
		CAST(EndDate AS DATE) = CAST(GETDATE() AS DATE)
	ORDER BY 
		CASE WHEN 
			a_Row_Count != ErrorText 
			THEN 'NO' 
			ELSE 'YES'
		END
		,a_DataBase
			
	FOR XML PATH ('tr'), TYPE)
	AS NVARCHAR(MAX)) + N'</table>'

	SET @EmailBody = @QueryCode
END



ELSE
BEGIN
set @QueryCode =  N'<style type = ''text/css''> table{border-collapse:collapse;border:1px solid #B2B2B2; margin-right:200px; width:800px; font:10pt verdana; color:#343434} table td, table th, table caption { border:1px solid #B2B2B2;} table caption{baclground-color:white} table th{background-color:#33999FF;font-weight:bold;}  </style>'+N'<table>' + N'<Caption><h3>Triton Row Counts</h3></caption>' + N'<tr><th>Database</th><th>File Name</th><th>FileRow</th><th>Database Rows</th></tr>' + CAST((
SELECT
	td = a_DataBase, '',
	td = a_name , '',
	td = a_Row_Count , '',
	td = ErrorText , ''
FROM 
	TRITON_Stage.dbo.TRITON_ROW_COUNTS
LEFT JOIN 
	TRITON_STAGE.Dbo.TRITON_ROW_COUNT_MAP
		ON a_FileName = a_Name
AND 
	a_DataBase = DB
LEFT JOIN 
	AMI_Galaxy.dbo.AMI_LOG
		ON StepID = a_LogFileName
WHERE 
	a_LogFileName IS NOT NULL
AND 
	CAST(EndDate AS DATE) = CAST(GETDATE() AS DATE)
ORDER BY 
	a_Database
FOR XML PATH ('tr'), TYPE)
AS NVARCHAR(MAX)) + N'</table>'

SET @EmailBody=@QueryCode
END	
END


GO
/****** Object:  StoredProcedure [dbo].[TRITON_IMPORT_ROW_COUNT]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
History
	DT 15 Nov 2016	DB mail profile updated along with recipients (MI group added as well) --MI 929

*/

CREATE PROCEDURE [dbo].[TRITON_IMPORT_ROW_COUNT]
	@i_Flat_File_Row VARCHAR (500)=0,
	@i_Database_Row VARCHAR(500) = 0,
	@EmailBody VARCHAR (MAX) = '',
	@EmailTitle VARCHAR(100) = '',
	@QueryCode VARCHAR (MAX) = '',
    @FullEmail VARCHAR (MAX) = ''
AS

set @i_Flat_File_Row = (
						SELECT
							count(*)
						FROM 
							TRITON_ROW_COUNTS
						INNER JOIN 
							TRITON_ROW_COUNT_MAP
						ON 
							a_FileName = a_Name
							AND 
							a_DataBase = DB
						INNER JOIN 
							AMI_Galaxy.dbo.AMI_LOG
							ON 
								StepID = a_LogFileName
						WHERE 
							a_LogFileName IS NOT NULL
							AND 
							cast(EndDate as DATE) = Cast(GETDATE() as DATE)
						)
SET @i_Database_Row = (
						SELECT 
							COUNT(*)
						FROM 
							TRITON_ROW_COUNTS
						INNER JOIN 
							TRITON_ROW_COUNT_MAP 
						ON 
							a_Name = a_FileName 
							AND 
							DB = a_DataBase
						WHERE
							a_LogFileName IS NOT NULL
						)
				IF @i_Database_Row = @i_Flat_File_Row 
					BEGIN
					
						SET @EmailTitle = 'TRITON Datawarehouse load ' + CAST(CAST(GETDATE() AS DATE) AS VARCHAR) + ' SUCCESS'

						EXEC TRITON_STAGE.dbo.TRITON_EMAIL_FORMAT  @EmailBody = @EmailBody OUTPUT
						set @FullEmail = '<br /> File Rows:'+ @i_Flat_File_Row + '<br /> Database Rows:'+@i_Database_Row + @EmailBody

						EXEC msdb.dbo.sp_send_dbmail	@profile_name = SHG,--MI 929
														@recipients = 'amiprojectteam@tuiski.com;SHGDLMIDevelopmentTeam@SpecialistHolidays.com', --MI 929
														@subject = @EmailTitle,
														@body = @FullEmail,
														@body_format = 'html'
						END
					
					ELSE
					BEGIN		
						SET @EmailTitle = 'TRITON Datawarehouse load '+ cast(cast(getdate() as date) as VARCHAR) + ' FAIL'

						EXEC TRITON_STAGE.dbo.TRITON_EMAIL_FORMAT @Fail='YES', @EmailBody = @EmailBody OUTPUT
						SET @FullEmail = '<br /> File Rows:' + @i_Flat_File_Row + '<br /> Database Rows:' + @i_Database_Row + @EmailBody
	
						EXEC msdb.dbo.sp_send_dbmail	@profile_name = SHG, --MI 929
										@recipients = 'amiprojectteam@tuiski.com;SHGDLMIDevelopmentTeam@SpecialistHolidays.com', --MI 929
										@subject = @EmailTitle,
										@body = @FullEmail,
										@body_format = 'html'
					END



GO
/****** Object:  StoredProcedure [dbo].[UPDATE_ST_MARINE_FBKG]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[UPDATE_ST_MARINE_FBKG]
AS

	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'TRTN','UP_FBKG','UPDATE_ST_MARINE_FBKG'

	UPDATE ST_MARINE_FBKG
	SET BookingType = Booking.BookingType
	FROM
	(
		SELECT 
			i_SK_Bkg,
			CASE 
				WHEN Yacht >0 AND ProductCode = 'FLOTILLA' THEN 'Flotilla'
				WHEN Yacht >0 AND ProductCode = 'CLUB' THEN 'Club/Flotilla'
				WHEN Yacht =0 AND ProductCode = 'CLUB' THEN 'Club'
				WHEN Yacht >0 THEN 'Charter'
				WHEN Accommodation >0 THEN 'Accommodation Only'
				WHEN Flight>0 THEN 'Flight Only'
				ELSE 'Others'
			END AS BookingType
		FROM 
			(
				SELECT 
					ST_MARINE_FBKG.i_SK_Bkg AS i_SK_Bkg,
					ST_MARINE_FBKG.ProductCode,
					COUNT(CASE WHEN ClassCode = 'F' THEN 1
						WHEN ClassCode = '*' AND OriginalClassCode ='F' THEN 1 END) AS Yacht,
					COUNT(CASE WHEN ClassCode = 'A' THEN 1 
						WHEN  ClassCode = '*' AND OriginalClassCode ='A' THEN 1 END) AS Accommodation,
					COUNT(CASE WHEN ClassCode = 'R' THEN 1 
						WHEN  ClassCode = '*' AND OriginalClassCode ='R' THEN 1 END) AS Flight
				FROM 
					ST_MARINE_FBKG
				LEFT JOIN
					ST_MARINE_FITN
					ON 
						ST_MARINE_FITN.i_SK_Bkg = ST_MARINE_FBKG.i_SK_Bkg 
				GROUP BY 
					ST_MARINE_FBKG.i_SK_Bkg,
					ST_MARINE_FBKG.ProductCode
			)BookingType
		)Booking
		WHERE ST_MARINE_FBKG.i_SK_Bkg = Booking.i_SK_Bkg

	EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'TRTN','UP_FBKG'

			
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_ST_MARINE_FBKG_CAA]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UPDATE_ST_MARINE_FBKG_CAA]
AS


	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'TRTN','FBKG_CAA','UPDATE_ST_MARINE_FBKG_CAA'
	UPDATE 
		ST_MARINE_FBKG
	SET 
		CAA_BondingType = 
			CASE WHEN InternationalFlightFlag = 1 AND BoatFlag = 1 THEN 'CAA-FULL'
				 WHEN InternationalFlightFlag = 1 AND AccomFlag = 1 THEN 'CAA-FULL'
				 WHEN InternationalFlightFlag = 1 AND PackageFlag = 1 THEN 'CAA-FULL'
				 WHEN InternationalFlightFlag = 1 AND PackageFlag = 0 THEN 'CAA-SCHED'
				 WHEN InternationalFlightFlag = 0 AND PackageFlag = 1 THEN 'ABTA-Package'
				 WHEN ST_MARINE_FBKG.CrewedFlag = 'Y' THEN 'ABTA-Package'
				 ELSE 'ABTA-Non-Package' END 
	FROM		 
		(		 
		SELECT 
			ST_MARINE_FBKG.i_SK_Bkg,
			ST_MARINE_FBKG.SourceSysID,
			ST_MARINE_FBKG.DivisionCode,
			ST_MARINE_FBKG.BrandCode,
			ST_MARINE_FBKG.ProductCode,
			ST_MARINE_FBKG.BookingType,
			ST_MARINE_FBKG.CompanyNo,
			ST_MARINE_FBKG.BookingStatusID,
			ST_MARINE_FBKG.BkgRef,
			CASE WHEN ST_MARINE_FBKG.Boat <>'' THEN 1 ELSE 0 END AS BoatFlag,
			ISNULL(MAX(Package),0) AS AccomFlag,
			ISNULL(MAX(InternationalFlightFlag),0) AS InternationalFlightFlag,
			ISNULL(MAX(Package),0) AS PackageFlag
		FROM 
			ST_MARINE_FBKG
		LEFT JOIN 
		(
			SELECT
				i_SK_Bkg,
				ST_MARINE_FITN.ExtraCode,
				ST_MARINE_FITN.DepartAirport,
				CASE WHEN a_CountryCode IN ('UK','GB','GBR') THEN 1 ELSE 0 END AS InternationalFlightFlag	 
			FROM
				TRITON_STage.dbo.ST_MARINE_FITN ST_MARINE_FITN
			LEFT JOIN	
			  AMI_Galaxy.dbo.FAVAIL_DT_AIRPORT FAVAIL_DT_AIRPORT_DEPARTURE
				ON
					ST_MARINE_FITN.DepartAirport = FAVAIL_DT_AIRPORT_DEPARTURE.i_BK_Airport
			WHERE  
				ItineraryLineType =  'FLT' 
			)VW_ST_MARINE_FLIGHT
			ON
				VW_ST_MARINE_FLIGHT.i_SK_Bkg = ST_MARINE_FBKG.i_SK_Bkg
		LEFT JOIN 
			(
			SELECT
				i_SK_Bkg,
				ST_MARINE_FITN.ExtraCode,
				CASE WHEN Package ='Yes' THEN 1 ELSE 0  END AS Package,
				CASE WHEN ClassCode = 'A' THEN 1 ELSE 0 END AS AccomFlag	 
			FROM
				TRITON_STage.dbo.ST_MARINE_FITN ST_MARINE_FITN
			LEFT JOIN
				AMI_static.dbo.SB_MARINE_REVENUE SB_MARINE_REVENUE
			ON
				ST_MARINE_FITN.ExtraCode = SB_MARINE_REVENUE.PriceCode
				AND 
				ST_MARINE_FITN.SourceSysID= SB_MARINE_REVENUE.SourceSystemID
			)VW_SB_MARINE_PACKAGE
			ON
				VW_SB_MARINE_PACKAGE.i_SK_Bkg = ST_MARINE_FBKG.i_SK_Bkg	
		GROUP BY 
			ST_MARINE_FBKG.i_SK_Bkg,
			ST_MARINE_FBKG.SourceSysID,
			ST_MARINE_FBKG.DivisionCode,
			ST_MARINE_FBKG.BrandCode,
			ST_MARINE_FBKG.ProductCode,
			ST_MARINE_FBKG.BookingType,
			ST_MARINE_FBKG.CompanyNo,
			ST_MARINE_FBKG.BookingStatusID,
			ST_MARINE_FBKG.BkgRef,
			ST_MARINE_FBKG.CrewedFlag,
			CASE WHEN ST_MARINE_FBKG.Boat <>'' THEN 1 ELSE 0 END
	)Booking
		WHERE ST_MARINE_FBKG.i_SK_Bkg = Booking.i_SK_Bkg
			
	EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE  'TRTN','FBKG_CAA'

GO
/****** Object:  StoredProcedure [dbo].[UPDATE_ST_MARINE_FBKG_CLUB]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[UPDATE_ST_MARINE_FBKG_CLUB]
AS

	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'TRTN','UP_FBKG_CL','UPDATE_ST_MARINE_FBKG_CLUB'

	UPDATE ST_MARINE_FBKG
	SET BookingStatusID = 21
	FROM
	(
		SELECT
			CrossRef,
			ST_MARINE_FBKG_TRITON.BkgRef,
			ST_MARINE_FBKG_TRITON.i_SK_Bkg
		FROM 
			NEPTUNE_Stage.dbo.ST_MARINE_FBKG ST_MARINE_FBKG_NEPTUNE
		LEFT JOIN	
			TRITON_Stage.dbo.ST_MARINE_FBKG ST_MARINE_FBKG_TRITON
			ON
				ST_MARINE_FBKG_NEPTUNE.CrossRef = ST_MARINE_FBKG_TRITON.BkgRef
		WHERE
			ST_MARINE_FBKG_NEPTUNE.BookingType IN ('Club Flotilla' ,'Sailing Schools ')
		)Booking
		WHERE ST_MARINE_FBKG.i_SK_Bkg = Booking.i_SK_Bkg

	EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'TRTN','UP_FBKG_CL'

			
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_ST_MARINE_FITN]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[UPDATE_ST_MARINE_FITN]
AS

	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'TRTN','UP_FITN','UPDATE_ST_MARINE_FITN'

	UPDATE ST_MARINE_FITN
	SET 
		BrandCode = FBKG.BrandCode,
		ProductCode = FBKG.Productcode,
		BookingType = FBKG.BookingType
	FROM
		ST_MARINE_FITN
	LEFT JOIN 
	(
		SELECT 
			i_SK_Bkg,
			BrandCode,
			ProductCode,
			BookingType
		FROM 
			ST_MARINE_FBKG
	)FBKG
	ON
	ST_MARINE_FITN.i_SK_Bkg = FBKG.i_SK_Bkg
				

	EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'TRTN','UP_FITN'

			
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_ST_MARINE_FITN_INTRADAY]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[UPDATE_ST_MARINE_FITN_INTRADAY]
AS

	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'TRTN','UP_FITNINT','UPDATE_ST_MARINE_FITN_INTRADAY'

	UPDATE ST_MARINE_FITN_INTRADAY
	SET 
		BrandCode = FBKG.BrandCode,
		ProductCode = FBKG.Productcode,
		BookingType = FBKG.BookingType
	FROM
		ST_MARINE_FITN_INTRADAY
	LEFT JOIN 
	(
		SELECT 
			i_SK_Bkg,
			BrandCode,
			ProductCode,
			BookingType
		FROM 
			ST_MARINE_FBKG_INTRADAY
	)FBKG
	ON
	ST_MARINE_FITN_INTRADAY.i_SK_Bkg = FBKG.i_SK_Bkg
				

	EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'TRTN','UP_FITNINT'

			

GO
/****** Object:  StoredProcedure [dbo].[UPDATE_TRITON_SFT_ALLOCATION_CLUB]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[UPDATE_TRITON_SFT_ALLOCATION_CLUB]
AS

	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'TRTN','UP_ALLOC_CL','UPDATE_TRITON_SFT_ALLOCATION_CLUB'

	UPDATE TRITON_SFT_ALLOCATION
	SET i_BK_BookingStatus = 21
	FROM
	(
		SELECT
			CrossRef,
			TRITON_SFT_ALLOCATION.i_BK_CNNB
		FROM 
			NEPTUNE_Stage.dbo.ST_MARINE_FBKG ST_MARINE_FBKG_NEPTUNE
		LEFT JOIN	
			TRITON_Stage.dbo.TRITON_SFT_ALLOCATION TRITON_SFT_ALLOCATION 
			ON
				ST_MARINE_FBKG_NEPTUNE.CrossRef = TRITON_SFT_ALLOCATION.i_BK_CNNB
		WHERE
			ST_MARINE_FBKG_NEPTUNE.BookingType IN ('Club Flotilla' ,'Sailing Schools ')
		)Booking
		WHERE TRITON_SFT_ALLOCATION.i_BK_CNNB = Booking.i_BK_CNNB

	EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'TRTN','UP_ALLOC_CL'

			
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_TRITON_SFT_ALLOCATION_OPENBASE]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[UPDATE_TRITON_SFT_ALLOCATION_OPENBASE]
AS

	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'TRTN','UP_ALLC_OB','BUILD_TRITON_SFT_ALLOCATION_OPENBASE'
	
	UPDATE 
		TRITON_SFT_ALLOCATION
	SET i_BK_OpenBase = 'N' 
	FROM 
		TRITON_SFT_ALLOCATION 
	LEFT JOIN
		AMI_Static.dbo.SB_MARINE_BASE SB_MARINE_BASE
		ON
			TRITON_SFT_ALLOCATION.i_BK_LOCT = SB_MARINE_BASE.a_BaseCode
			AND
			TRITON_SFT_ALLOCATION.i_BK_SourceSysID =  SB_MARINE_BASE.a_SourceSystemID
	LEFT JOIN 
		(
			SELECT
				a_MasterBaseGrouping,
				CONF_DT_CALENDAR_FROM.i_SK_Calendar AS i_SK_EffectiveFrom,
				CONF_DT_CALENDAR_TO.i_SK_Calendar AS i_SK_a_EffectiveTo
			FROM	
				AMI_Static.dbo.SB_MARINE_BASEOPEN SB_MARINE_BASEOPEN 
			LEFT JOIN
				AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_FROM
				ON
					CONF_DT_CALENDAR_FROM.a_Date = SB_MARINE_BASEOPEN.a_EffectiveFromDate
			LEFT JOIN
				AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_TO 
				ON
					CONF_DT_CALENDAR_TO.a_Date = SB_MARINE_BASEOPEN.a_EffectiveToDate
		)BASEOPEN
		ON
			BASEOPEN.a_MasterBaseGrouping = SB_MARINE_BASE.a_MasterBaseGrouping
			AND
			TRITON_SFT_ALLOCATION.i_SK_Calendar BETWEEN BASEOPEN.i_SK_EffectiveFrom AND BASEOPEN.i_SK_a_EffectiveTo
	LEFT JOIN
		(
			SELECT DISTINCT 
				a_MasterBaseGrouping
			FROM 
				AMI_Static.dbo.SB_MARINE_BASEOPEN 
		)BASES_IN_BASESOPEN
		ON
			BASES_IN_BASESOPEN.a_MasterBaseGrouping = SB_MARINE_BASE.a_MasterBaseGrouping
	WHERE 
		BASES_IN_BASESOPEN.a_MasterBaseGrouping IS NOT NULL 
		AND 
		BASEOPEN.a_MasterBaseGrouping IS NULL 
	
	
	EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'TRTN','UP_ALLC_OB'

GO
/****** Object:  StoredProcedure [dbo].[UPDATE_TRITON_SFT_ALLOCATION_SOURCE]    Script Date: 24/08/2018 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[UPDATE_TRITON_SFT_ALLOCATION_SOURCE]
AS

	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'TRTN','UP_ALLC_SR','BUILD_TRITON_SFT_ALLOCATION_SOURCE'
	
	UPDATE 
		TRITON_SFT_ALLOCATION_INVENTORY
	SET 
		TRITON_SFT_ALLOCATION_INVENTORY.i_BK_BkgSrcCd = TRITON_SFT_ALLOCATION_SALES.i_BK_BkgSrcCd
	FROM 
		TRITON_SFT_ALLOCATION TRITON_SFT_ALLOCATION_INVENTORY
	INNER JOIN
		(
		SELECT 
			i_SK_Calendar,
			i_BK_FLNUMB,
			i_BK_BkgSrcCd,
			i_BK_SourceSys,
			MIN(i_BK_CNNB) AS i_BK_CNNB
		FROM 
			TRITON_SFT_ALLOCATION 
		WHERE 
			i_BK_BookingStatus IN (3,21)
			AND
			i_SK_SaleDate <> 0	
			AND
			i_SK_CancelDate IS NULL	
			AND
			i_BK_FLNUMB <> '0'
		GROUP BY 
			i_SK_Calendar,
			i_BK_FLNUMB,
			i_BK_BkgSrcCd,
			i_BK_SourceSys	
		) TRITON_SFT_ALLOCATION_SALES
		ON
			TRITON_SFT_ALLOCATION_INVENTORY.i_SK_Calendar = TRITON_SFT_ALLOCATION_SALES.i_SK_Calendar 
			AND
			TRITON_SFT_ALLOCATION_INVENTORY.i_BK_FLNUMB = TRITON_SFT_ALLOCATION_SALES.i_BK_FLNUMB
			AND
			TRITON_SFT_ALLOCATION_INVENTORY.i_BK_SourceSys = TRITON_SFT_ALLOCATION_SALES.i_BK_SourceSys	
	WHERE	
		TRITON_SFT_ALLOCATION_INVENTORY.i_SK_InventoryDate <>0

	
	EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'TRTN','UP_ALLC_SR'

GO
EXEC [TRITON_Stage].sys.sp_addextendedproperty @name=N'SQLSourceControl Scripts Location', @value=N'<?xml version="1.0" encoding="utf-16" standalone="yes"?>
<ISOCCompareLocation version="1" type="TfsLocation">
  <ServerUrl>http://v-jsh-tfs-01:8080/tfs/ami</ServerUrl>
  <SourceControlFolder>$/AMI/Live_Dublin/TRITON_Stage</SourceControlFolder>
</ISOCCompareLocation>' 
GO
EXEC [TRITON_Stage].sys.sp_addextendedproperty @name=N'SQLSourceControl Database Revision', @value=253 
GO
USE [master]
GO
ALTER DATABASE [TRITON_Stage] SET  READ_WRITE 
GO
