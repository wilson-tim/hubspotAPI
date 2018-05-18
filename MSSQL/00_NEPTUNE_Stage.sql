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
/****** Object:  Database [NEPTUNE_Stage]    Script Date: 18/05/2018 09:45:16 ******/
CREATE DATABASE [NEPTUNE_Stage]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NEPTUNE_Stage', FILENAME = N'E:\SQLFiles\MSSQL.MSSQLSERVER.Data\NEPTUNE_Stage.mdf' , SIZE = 6291456KB , MAXSIZE = UNLIMITED, FILEGROWTH = 524288KB )
 LOG ON 
( NAME = N'NEPTUNE_Stage_log', FILENAME = N'M:\SQLFiles\MSSQL.MSSQLSERVER.Log\NEPTUNE_Stage_1.ldf' , SIZE = 4225024KB , MAXSIZE = 2048GB , FILEGROWTH = 1024000KB )
GO
ALTER DATABASE [NEPTUNE_Stage] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NEPTUNE_Stage].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NEPTUNE_Stage] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NEPTUNE_Stage] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NEPTUNE_Stage] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NEPTUNE_Stage] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NEPTUNE_Stage] SET ARITHABORT OFF 
GO
ALTER DATABASE [NEPTUNE_Stage] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NEPTUNE_Stage] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NEPTUNE_Stage] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NEPTUNE_Stage] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NEPTUNE_Stage] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NEPTUNE_Stage] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NEPTUNE_Stage] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NEPTUNE_Stage] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NEPTUNE_Stage] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NEPTUNE_Stage] SET  DISABLE_BROKER 
GO
ALTER DATABASE [NEPTUNE_Stage] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NEPTUNE_Stage] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NEPTUNE_Stage] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NEPTUNE_Stage] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NEPTUNE_Stage] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NEPTUNE_Stage] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NEPTUNE_Stage] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NEPTUNE_Stage] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [NEPTUNE_Stage] SET  MULTI_USER 
GO
ALTER DATABASE [NEPTUNE_Stage] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NEPTUNE_Stage] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NEPTUNE_Stage] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NEPTUNE_Stage] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [NEPTUNE_Stage] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'NEPTUNE_Stage', N'ON'
GO
USE [NEPTUNE_Stage]
GO
/****** Object:  User [ServerLink]    Script Date: 18/05/2018 09:45:16 ******/
CREATE USER [ServerLink] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [NEXUS\KKumar]    Script Date: 18/05/2018 09:45:16 ******/
CREATE USER [NEXUS\KKumar] FOR LOGIN [NEXUS\KKumar] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [NEXUS\IMitrovic]    Script Date: 18/05/2018 09:45:16 ******/
CREATE USER [NEXUS\IMitrovic] FOR LOGIN [NEXUS\IMitrovic] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [NeptuneCRM]    Script Date: 18/05/2018 09:45:17 ******/
CREATE USER [NeptuneCRM] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [BOXIUser]    Script Date: 18/05/2018 09:45:17 ******/
CREATE USER [BOXIUser] FOR LOGIN [BOXIUser] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [BOXI_DEV]    Script Date: 18/05/2018 09:45:17 ******/
CREATE USER [BOXI_DEV] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [boxi]    Script Date: 18/05/2018 09:45:17 ******/
CREATE USER [boxi] FOR LOGIN [boxi] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [NEXUS\KKumar]
GO
ALTER ROLE [db_datareader] ADD MEMBER [NEXUS\IMitrovic]
GO
ALTER ROLE [db_owner] ADD MEMBER [BOXI_DEV]
GO
ALTER ROLE [db_datareader] ADD MEMBER [BOXI_DEV]
GO
ALTER ROLE [db_owner] ADD MEMBER [boxi]
GO
ALTER ROLE [db_datareader] ADD MEMBER [boxi]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_CheckDate]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE FUNCTION [dbo].[fn_CheckDate] (@isvalid varchar(20))
RETURNS datetime 
AS
BEGIN
   DECLARE @output as datetime, @temp as char(20), @OnError as varchar(8)
			SET @OnError = '19000101'
			SET @temp = LEFT(ltrim(rtrim(@isvalid)),8)
			IF @isvalid <>'' 
			BEGIN
			IF @isvalid IS NOT NULL
				BEGIN
					IF ISDATE(@temp) = 0  set @temp = @OnError 
					SET @output=CAST(@temp as datetime)
				END
			END
		
     RETURN (@output)
END	

/*
select 
	NEPTUNE_stage.dbo.fn_CheckDate(' 20100220'),
	NEPTUNE_stage.dbo.fn_CheckDate(' '),
	(LEFT(ltrim(rtrim(' 20100220 ')),8))
*/





































GO
/****** Object:  UserDefinedFunction [dbo].[fn_NeptuneDate]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE FUNCTION [dbo].[fn_NeptuneDate] (@isvalid varchar(20))
RETURNS datetime 
AS
BEGIN
   DECLARE @output as datetime, @temp as char(20), @OnError as varchar(8)
			SET @OnError = '19000101'
			SET @temp = SUBSTRING(@isvalid,7,4)+SUBSTRING(@isvalid,4,2)+SUBSTRING(@isvalid,1,2) -- LEFT(ltrim(rtrim(@isvalid)),8)
			IF @isvalid <>'' 
			BEGIN
			IF @isvalid IS NOT NULL
				BEGIN
					IF ISDATE(@temp) = 0  set @temp = @OnError 
					SET @output=CAST(@temp as datetime)
				END
			END
		
     RETURN (@output)
END	

/*
select 
	NEPTUNE_stage.dbo.fn_CheckDate(' 20100220'),
	NEPTUNE_stage.dbo.fn_CheckDate(' '),
	(LEFT(ltrim(rtrim(' 20100220 ')),8))
*/






































GO
/****** Object:  Table [dbo].[NEPTUNE_ACC_TYPE]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEPTUNE_ACC_TYPE](
	[ACCOMMODATION_TYPE] [nvarchar](25) NULL,
	[YACHT_ROOM] [nvarchar](5) NULL,
	[ACC_TYPE_DESC] [nvarchar](50) NULL,
	[ACC_TYPE_DESC_ID] [int] NULL,
	[AVAIL_DESC] [nvarchar](50) NULL,
	[EXTRA_TYPE] [nvarchar](5) NULL,
	[YEARS] [int] NULL,
	[LOA_FEET] [nvarchar](20) NULL,
	[LOA_METRES] [nvarchar](20) NULL,
	[BEAM] [nvarchar](20) NULL,
	[BEAM_IMP] [nvarchar](20) NULL,
	[DRAFT] [nvarchar](40) NULL,
	[DRAFT_IMP] [nvarchar](40) NULL,
	[HOLDING_TANK] [nvarchar](5) NULL,
	[HOLDING_TANK_ID] [int] NULL,
	[KEEL_TYPE] [nvarchar](20) NULL,
	[KEEL_TYPE_ID] [int] NULL,
	[RIG_COCKPIT] [nvarchar](40) NULL,
	[RIG_COCKPIT_ID] [int] NULL,
	[STEERING] [nvarchar](40) NULL,
	[STEERING_ID] [int] NULL,
	[MAIN_REEF] [nvarchar](45) NULL,
	[MAIN_REEF_ID] [int] NULL,
	[HEADROOM] [nvarchar](25) NULL,
	[HEADROOM_IMP] [nvarchar](25) NULL,
	[CABINS] [int] NULL,
	[CR_CABINS] [int] NULL,
	[CR_BERTHS] [nvarchar](60) NULL,
	[CR_DIM] [nvarchar](65) NULL,
	[FW_CABINS] [int] NULL,
	[FW_BERTHS] [nvarchar](60) NULL,
	[FW_DIM] [nvarchar](70) NULL,
	[FS_CABINS] [int] NULL,
	[FS_BERTHS] [nvarchar](60) NULL,
	[FS_DIM] [nvarchar](70) NULL,
	[SA_CABINS] [int] NULL,
	[SA_BERTHS] [nvarchar](60) NULL,
	[SA_DIM] [nvarchar](70) NULL,
	[AF_CABINS] [int] NULL,
	[AF_BERTHS] [nvarchar](60) NULL,
	[AF_DIM] [nvarchar](70) NULL,
	[OT_CABINS] [int] NULL,
	[OT_BERTHS] [nvarchar](60) NULL,
	[OT_DIM] [nvarchar](70) NULL,
	[WINDLASS] [nvarchar](35) NULL,
	[WINDLASS_ID] [int] NULL,
	[WINDLASS_TYPE] [nvarchar](40) NULL,
	[ECHO_SOUNDER] [nvarchar](5) NULL,
	[WINDSPEED] [nvarchar](5) NULL,
	[GPS] [nvarchar](5) NULL,
	[GPS_TYPE] [nvarchar](30) NULL,
	[LOG] [nvarchar](5) NULL,
	[WINCHES] [nvarchar](5) NULL,
	[MODEL_NOTE1] [nvarchar](500) NULL,
	[PAX_CAT] [nvarchar](5) NULL,
	[BIMINI] [nvarchar](5) NULL,
	[BIMINI_ID] [int] NULL,
	[MANF] [nvarchar](40) NULL,
	[TYPE_INT] [int] NULL,
	[ECHO_SOUNDER_TYPE] [nvarchar](40) NULL,
	[LOG_TYPE] [nvarchar](40) NULL,
	[AUTOPILOT] [nvarchar](5) NULL,
	[AUTOPILOT_TYPE] [nvarchar](40) NULL,
	[WINDSPEED_TYPE] [nvarchar](40) NULL,
	[DIMENSIONS] [nvarchar](40) NULL,
	[COCKPIT_LIGHT] [nvarchar](5) NULL,
	[COCKPIT_TABLE] [nvarchar](30) NULL,
	[COCKPIT_SPEAKERS] [nvarchar](5) NULL,
	[DISPLACEMENT] [nvarchar](30) NULL,
	[GROSS_TONNAGE] [nvarchar](30) NULL,
	[STEERING_MAKE] [nvarchar](30) NULL,
	[LTR_TANK_NO] [nvarchar](30) NULL,
	[LTR_TANK_POS] [nvarchar](30) NULL,
	[GAL_TANK_NO] [nvarchar](30) NULL,
	[GAL_TANK_POS] [nvarchar](30) NULL,
	[ENGINE_TYPE] [nvarchar](60) NULL,
	[ENGINE_TYPE_ID] [int] NULL,
	[GEAR_BOX_TYPE] [nvarchar](40) NULL,
	[OPEN_PORTS] [int] NULL,
	[OPEN_PORTS_TYPE] [nvarchar](30) NULL,
	[OPEN_HATCHES] [int] NULL,
	[OPEN_HATCHES_TYPE] [nvarchar](30) NULL,
	[NO_WINCHES] [int] NULL,
	[NO_WINCHES_TYPE] [nvarchar](30) NULL,
	[NO_WINCHES_SIZE] [nvarchar](30) NULL,
	[SAIL_AREA] [nvarchar](30) NULL,
	[GENOA_SIZE] [nvarchar](30) NULL,
	[GENOA_STYLE] [nvarchar](30) NULL,
	[GENOA_NO] [nvarchar](30) NULL,
	[GENOA_PERCENT] [numeric](10, 2) NULL,
	[RIG_MAKE] [nvarchar](30) NULL,
	[INT_BTYPE] [nvarchar](30) NULL,
	[STARDUST] [nvarchar](50) NULL,
	[CUSTOM] [nvarchar](50) NULL,
	[INTERNET_USE] [nvarchar](5) NULL,
	[COLOR_NO] [int] NULL,
	[DEMISTERS] [nvarchar](10) NULL,
	[HEATING] [nvarchar](30) NULL,
	[BOW_THRUST] [nvarchar](10) NULL,
	[FUEL_CONS] [nvarchar](30) NULL,
	[AIRDRAFTS] [nvarchar](30) NULL,
	[I5_IMPORT] [nvarchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEPTUNE_ACCNOTE]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEPTUNE_ACCNOTE](
	[ACCOM_NO] [int] NULL,
	[ALLOW_AGENT] [nvarchar](5) NULL,
	[TEXT] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEPTUNE_ACCOMMODATION]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEPTUNE_ACCOMMODATION](
	[ACCOMMODATION_NO] [int] NULL,
	[ACCOMMODATION_TYPE_CODE] [nvarchar](10) NULL,
	[ACCOMMODATION_TYPE_DESC] [nvarchar](50) NULL,
	[AVAIL_DESC] [nvarchar](50) NULL,
	[ACCOMODATION_NAME] [nvarchar](50) NULL,
	[OWNERSHIP] [nvarchar](100) NULL,
	[COLOUR_NO] [int] NULL,
	[SUNSAIL_NO] [int] NULL,
	[YACHT_ROOM_IND] [nvarchar](5) NULL,
	[AS_STD_FLAG] [nvarchar](5) NULL,
	[DBL_BEDS] [int] NULL,
	[SNG_BEDS] [int] NULL,
	[DBL_ZBEDS] [int] NULL,
	[SNG_ZBEDS] [int] NULL,
	[OK_CHILD] [nvarchar](50) NULL,
	[COTS] [int] NULL,
	[TOT_XTRA_BEDS] [int] NULL,
	[OK_SINGLES_FLAG] [nvarchar](5) NULL,
	[MIN_SALE] [int] NULL,
	[MAX_SALE] [int] NULL,
	[MAX_SINGLES] [int] NULL,
	[EXPECTED_PAX] [int] NULL,
	[ROOMS] [int] NULL,
	[BALCONY_IND] [nvarchar](5) NULL,
	[SEA_VIEW_IND] [nvarchar](5) NULL,
	[FRIDGE_IND] [nvarchar](5) NULL,
	[FREEZER_IND] [nvarchar](5) NULL,
	[KITCHEN_IND] [nvarchar](5) NULL,
	[FANS_IND] [nvarchar](5) NULL,
	[AIR_CON_IND] [nvarchar](5) NULL,
	[PLATINUM] [nvarchar](10) NULL,
	[MANUFACTURE_DATE] [nvarchar](10) NULL,
	[FLEET] [nvarchar](10) NULL,
	[ALTREF] [nvarchar](10) NULL,
	[HULL_NO] [nvarchar](50) NULL,
	[SERIES_NO] [nvarchar](50) NULL,
	[MANUFACTURER_NAME] [nvarchar](50) NULL,
	[NOTABLE] [nvarchar](5) NULL,
	[FCHARTER] [nvarchar](10) NULL,
	[YEARS] [int] NULL,
	[TYPE_INT] [int] NULL,
	[FLAG] [nvarchar](50) NULL,
	[REGTYPE] [nvarchar](50) NULL,
	[PORTREG] [nvarchar](50) NULL,
	[REGEXP] [nvarchar](10) NULL,
	[REGNO] [nvarchar](50) NULL,
	[REGOWN] [nvarchar](100) NULL,
	[DOCS_HELD] [nvarchar](50) NULL,
	[REGDATE] [nvarchar](10) NULL,
	[SCHEME] [nvarchar](10) NULL,
	[FORSALE] [nvarchar](5) NULL,
	[CE_CERT] [nvarchar](5) NULL,
	[ON_SUNLINES] [nvarchar](5) NULL,
	[ZAPPED] [nvarchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Index [IX_NEPTUNE_ACCOMMODATION_PK]    Script Date: 18/05/2018 09:45:17 ******/
CREATE UNIQUE CLUSTERED INDEX [IX_NEPTUNE_ACCOMMODATION_PK] ON [dbo].[NEPTUNE_ACCOMMODATION]
(
	[ACCOMMODATION_NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEPTUNE_ACCOMMODATION_REF]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEPTUNE_ACCOMMODATION_REF](
	[CLIENT_NO] [int] NULL,
	[ACCOMRENO] [int] NULL,
	[BASE_CODE] [nvarchar](10) NULL,
	[END_BASE] [nvarchar](10) NULL,
	[REG_BASE] [nvarchar](10) NULL,
	[ACCOMMODATION_NO] [int] NULL,
	[START_DATE] [nvarchar](10) NULL,
	[START_TIME] [nvarchar](10) NULL,
	[ARR_DETAILS] [nvarchar](100) NULL,
	[DEP_DETAILS] [nvarchar](50) NULL,
	[DURATION] [int] NULL,
	[END_DATE] [nvarchar](10) NULL,
	[END_TIME] [nvarchar](10) NULL,
	[AVAIL_FIRST] [nvarchar](5) NULL,
	[AVAIL_LAST] [nvarchar](5) NULL,
	[CHARTER] [nvarchar](5) NULL,
	[SINGLES] [nvarchar](5) NULL,
	[TURN_FLAG] [nvarchar](5) NULL,
	[TURN_DAYS] [int] NULL,
	[PAX] [int] NULL,
	[PAX_CAT_B] [int] NULL,
	[PAX_CAT_C] [int] NULL,
	[PAX_CAT_D] [int] NULL,
	[PAX_CAT_E] [int] NULL,
	[ADDED_BY] [nvarchar](10) NULL,
	[ADDED_DATE] [nvarchar](10) NULL,
	[ADDED_TIME] [nvarchar](10) NULL,
	[AV_START_COL] [int] NULL,
	[AV_END_COL] [int] NULL,
	[AV_FLAG] [nvarchar](5) NULL,
	[ACC_TYPE] [nvarchar](10) NULL,
	[MANDATE] [nvarchar](10) NULL,
	[START_POINT] [nvarchar](20) NULL,
	[END_POINT] [nvarchar](20) NULL,
	[ADULTS] [int] NULL,
	[BEACH_TEAM] [int] NULL,
	[GYBERS] [int] NULL,
	[SEA_URCHINS] [int] NULL,
	[SNAPPERS] [int] NULL,
	[MINNOWS] [int] NULL,
	[s_ADULTS] [int] NULL,
	[s_BEACH_TEAM] [int] NULL,
	[s_GYBERS] [int] NULL,
	[s_SEA_URCHINS] [int] NULL,
	[s_SNAPPERS] [int] NULL,
	[s_COTS] [int] NULL,
	[SYS_TYPE] [nvarchar](5) NULL,
	[START_REST] [nvarchar](10) NULL,
	[END_REST] [nvarchar](10) NULL,
	[PARENT_ACCOMREF_NO] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Index [IX_NEPTUNE_ACCOMMODATION_REF_CL]    Script Date: 18/05/2018 09:45:17 ******/
CREATE CLUSTERED INDEX [IX_NEPTUNE_ACCOMMODATION_REF_CL] ON [dbo].[NEPTUNE_ACCOMMODATION_REF]
(
	[CLIENT_NO] ASC,
	[ACCOMRENO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEPTUNE_AGENT]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEPTUNE_AGENT](
	[AGENT_NO] [int] NULL,
	[INTRAV_AGENT_NO] [int] NULL,
	[ABTA_NO] [nvarchar](15) NULL,
	[ATOL_NO] [nvarchar](15) NULL,
	[BONDED] [nvarchar](5) NULL,
	[CONTACT_NAME] [nvarchar](50) NULL,
	[SECURITY] [nvarchar](5) NULL,
	[ORIGIN] [nvarchar](5) NULL,
	[LANG] [nvarchar](5) NULL,
	[AGENT_NAME] [nvarchar](50) NULL,
	[ADDR1] [nvarchar](100) NULL,
	[ADDR2] [nvarchar](100) NULL,
	[ADDR3] [nvarchar](100) NULL,
	[CITY] [nvarchar](50) NULL,
	[STATE] [nvarchar](50) NULL,
	[ZIP_CODE] [nvarchar](25) NULL,
	[COUNTRY] [nvarchar](50) NULL,
	[NATIONALITY] [nvarchar](5) NULL,
	[DAY_TEL_NO] [nvarchar](25) NULL,
	[FAX_TEL_NO] [nvarchar](25) NULL,
	[TEL1_DESC] [nvarchar](50) NULL,
	[TEL1_NO] [nvarchar](25) NULL,
	[TEL2_DESC] [nvarchar](50) NULL,
	[TEL2_NO] [nvarchar](25) NULL,
	[TEL3_DESC] [nvarchar](50) NULL,
	[TEL3_NO] [nvarchar](25) NULL,
	[FAX1_DESC] [nvarchar](50) NULL,
	[FAX1_NO] [nvarchar](25) NULL,
	[FAX2_DESC] [nvarchar](50) NULL,
	[FAX2_NO] [nvarchar](25) NULL,
	[EMAIL1] [nvarchar](100) NULL,
	[EMAIL2] [nvarchar](100) NULL,
	[ACCOUNTS_EMAIL] [nvarchar](70) NULL,
	[EXPIRY_DAYS] [int] NULL,
	[VAT_ON_COMM] [nvarchar](5) NULL,
	[TAX_REG_NO] [nvarchar](25) NULL,
	[MAX_SEATS] [int] NULL,
	[CANX_TERMS] [nvarchar](70) NULL,
	[DEP_DAYS] [int] NULL,
	[ONLINE_TYPE] [nvarchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEPTUNE_AIRCRAFT]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEPTUNE_AIRCRAFT](
	[CODE] [nvarchar](10) NULL,
	[DESCRIPTION] [nvarchar](50) NULL,
	[i5_managed] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEPTUNE_AIRLINE]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEPTUNE_AIRLINE](
	[CODE] [nvarchar](10) NULL,
	[DESCRIPTION] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEPTUNE_AIRPORT]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEPTUNE_AIRPORT](
	[CODE] [nvarchar](10) NULL,
	[DESCRIPTION] [nvarchar](50) NULL,
	[DESC_ID] [int] NULL,
	[MSOFT_DEPT] [nvarchar](50) NULL,
	[DEST_ADDR_REQD] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEPTUNE_APEX_ACCOM_TYPE]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEPTUNE_APEX_ACCOM_TYPE](
	[ACCOMMODATION_TYPE_DESC] [nvarchar](50) NULL,
	[ACCOM_TYPE_GROUP_CODE] [nvarchar](5) NULL,
	[USR_CHANGED] [nvarchar](20) NULL,
	[DATE_CHANGED] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEPTUNE_APEX_ACCOM_TYPE_GROUP]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEPTUNE_APEX_ACCOM_TYPE_GROUP](
	[ACCOM_TYPE_GROUP_CODE] [nvarchar](5) NULL,
	[ACCOM_TYPE_GROUP_DESC] [nvarchar](50) NULL,
	[SORT_ORDER] [int] NULL,
	[ACCOM_CLASS] [nvarchar](10) NULL,
	[USR_CREATED] [nvarchar](20) NULL,
	[DATE_CREATED] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEPTUNE_APEX_REVENUE_LINE]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEPTUNE_APEX_REVENUE_LINE](
	[REVENUE_LINE_CODE] [numeric](6, 0) NOT NULL,
	[REVENUE_LINE_DESC] [nvarchar](40) NOT NULL,
	[REVENUE_GROUP_CODE_1] [nvarchar](5) NOT NULL,
	[REVENUE_GROUP_CODE_2] [nvarchar](5) NOT NULL,
	[REVENUE_GROUP_CODE_3] [nvarchar](5) NOT NULL,
	[REVENUE_GROUP_CODE_4] [nvarchar](5) NOT NULL,
	[SORT_ORDER] [int] NULL,
	[REVENUE_GROUP_CLUB] [nvarchar](5) NOT NULL,
	[USER_CREATED] [nvarchar](20) NULL,
	[DATE_CREATED] [nvarchar](10) NULL,
	[USER_CHANGED] [nvarchar](20) NULL,
	[DATE_CHANGED] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEPTUNE_APEX_REVENUE_LINE_GROUP]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEPTUNE_APEX_REVENUE_LINE_GROUP](
	[REVENUE_GROUP_CODE] [nvarchar](5) NOT NULL,
	[REVENUE_GROUP_DESC] [nvarchar](40) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEPTUNE_APEX_YIELD_GROUP]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEPTUNE_APEX_YIELD_GROUP](
	[BASE_CODE] [nvarchar](10) NULL,
	[COMPANY_CODE] [nvarchar](1) NULL,
	[REPORTING_YEAR] [nvarchar](4) NULL,
	[BASE_GROUP_LEVEL_1] [nvarchar](50) NULL,
	[BASE_GROUP_LEVEL_2] [nvarchar](50) NULL,
	[BASE_GROUP_LEVEL_3] [nvarchar](50) NULL,
	[YIELD_REPORT_GROUP] [nvarchar](50) NULL,
	[REPORT_GROUP_ORDER] [int] NULL,
	[CORE_OR_MARGINAL] [nvarchar](50) NULL,
	[REGION] [nvarchar](50) NULL,
	[USR_CREATED] [nvarchar](20) NULL,
	[DATE_CREATED] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEPTUNE_AREA]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEPTUNE_AREA](
	[COMPANY_CODE] [nvarchar](25) NULL,
	[AREA_CODE] [nvarchar](25) NULL,
	[AREA_DESCRIPTION] [nvarchar](50) NULL,
	[AREA_DESCRIPTION_ID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEPTUNE_AVAIL]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEPTUNE_AVAIL](
	[COMPANY_NO] [nvarchar](25) NULL,
	[ACCOMMODATION_NO] [int] NULL,
	[BASE] [nvarchar](10) NULL,
	[STARTDATE] [nvarchar](10) NULL,
	[ENDDATE] [nvarchar](10) NULL,
	[MATCH_RQD] [nvarchar](5) NULL,
	[MON] [nvarchar](5) NULL,
	[TUE] [nvarchar](5) NULL,
	[WED] [nvarchar](5) NULL,
	[THU] [nvarchar](5) NULL,
	[FRI] [nvarchar](5) NULL,
	[SAT] [nvarchar](5) NULL,
	[SUN] [nvarchar](5) NULL,
	[FREQ] [int] NULL,
	[DISPLAY] [nvarchar](5) NULL,
	[ACCESS] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEPTUNE_AVBK]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEPTUNE_AVBK](
	[ACCOM NUMBER] [int] NULL,
	[FULLAVAIL] [nvarchar](10) NULL,
	[PARTAVAIL] [nvarchar](10) NULL,
	[SINGLESPAX] [int] NULL,
	[STARTBASE] [nvarchar](10) NULL,
	[ENDBASE] [nvarchar](10) NULL,
	[DELDATETIME] [nvarchar](10) NULL,
	[BFRBASE] [nvarchar](10) NULL,
	[AFRBASE] [nvarchar](10) NULL,
	[STARTDATETIME] [nvarchar](15) NULL,
	[ENDDATETIME] [nvarchar](15) NULL,
	[DURATION] [nvarchar](15) NULL,
	[ACCOMREF] [int] NULL,
	[CLIENT_NO] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEPTUNE_BASE]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEPTUNE_BASE](
	[COMPANY_NO] [nvarchar](25) NULL,
	[BASE_CODE] [nvarchar](10) NULL,
	[DESC] [nvarchar](50) NULL,
	[DESC_ID] [int] NULL,
	[ROUTE_DESC] [nvarchar](50) NULL,
	[SALES_GROUP] [nvarchar](25) NULL,
	[SALES_COUNTRY] [nvarchar](50) NULL,
	[AREA] [nvarchar](10) NULL,
	[COLOR] [int] NULL,
	[PRODUCT] [nvarchar](5) NULL,
	[MSOFT_DEPT] [nvarchar](10) NULL,
	[AIRPORT] [nvarchar](5) NULL,
	[EMBARK_TIME] [numeric](10, 2) NULL,
	[DISEMBARK_TIME] [numeric](10, 2) NULL,
	[TRANS_TIME] [numeric](10, 2) NULL,
	[EXTRA_BASE] [nvarchar](10) NULL,
	[EXTRA_CO] [nvarchar](5) NULL,
	[CHAR_TYPE] [nvarchar](25) NULL,
	[OPT_BLINK] [nvarchar](25) NULL,
	[ADDR1] [nvarchar](100) NULL,
	[ADDR2] [nvarchar](100) NULL,
	[ADDR3] [nvarchar](100) NULL,
	[ADDR4] [nvarchar](100) NULL,
	[DAY_TEL_NO] [nvarchar](25) NULL,
	[FAX_TEL_NO] [nvarchar](25) NULL,
	[EMAIL] [nvarchar](100) NULL,
	[MANAGER] [nvarchar](25) NULL,
	[ALLOW_UK_EX_FLTS] [nvarchar](5) NULL,
	[TURN_DAYS] [int] NULL,
	[NO_OTURNS] [int] NULL,
	[DELIV_REQD] [nvarchar](10) NULL,
	[FUEL_OPTION] [nvarchar](10) NULL,
	[TRANS_SUPPORTED] [nvarchar](10) NULL,
	[CAR_PARKING] [nvarchar](10) NULL,
	[ONEWAY_CAR_DEL] [nvarchar](10) NULL,
	[ONEWAY_TRANS] [nvarchar](10) NULL,
	[MIN_DUR] [int] NULL,
	[CONTROL_GAP] [nvarchar](10) NULL,
	[PREMIER_BASE] [nvarchar](10) NULL,
	[PB_INTERNET_USE] [nvarchar](5) NULL,
	[MAX_DUR] [int] NULL,
	[OLD_BASE] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEPTUNE_BKPRICE]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEPTUNE_BKPRICE](
	[CLIENT_NO] [int] NULL,
	[TAG] [int] NULL,
	[PRICE_CODE] [nvarchar](5) NULL,
	[PRICE_DESC] [nvarchar](50) NULL,
	[ORIGIN] [nvarchar](5) NULL,
	[QTY] [int] NULL,
	[UNIT_PRICE] [numeric](10, 2) NULL,
	[PRICE_CAT] [nvarchar](5) NULL,
	[VAL_OR_PERC] [nvarchar](5) NULL,
	[PERC] [numeric](10, 2) NULL,
	[VAT_CODE] [nvarchar](5) NULL,
	[VAT_RATE] [numeric](10, 2) NULL,
	[EX_VAT] [numeric](10, 2) NULL,
	[AUTO] [nvarchar](5) NULL,
	[COMMISSION] [numeric](10, 2) NULL,
	[SALES_CAT] [nvarchar](5) NULL,
	[RATE_CAT] [nvarchar](5) NULL,
	[APPLY_PERC] [nvarchar](5) NULL,
	[TXN_NO] [int] NULL,
	[TXN_DATE] [nvarchar](10) NULL,
	[INV_OR_CR] [nvarchar](5) NULL,
	[PRINTED] [nvarchar](5) NULL,
	[BATCH_NO] [int] NULL,
	[BASE_CODE] [nvarchar](10) NULL,
	[ADDED_BY] [nvarchar](50) NULL,
	[START_DATE] [nvarchar](10) NULL,
	[DEP_MONTH] [int] NULL,
	[DEP_YEAR] [int] NULL,
	[CAPPED] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEPTUNE_BOOK]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEPTUNE_BOOK](
	[COMPANY_CODE] [nvarchar](25) NULL,
	[INV_COMPANY] [nvarchar](25) NULL,
	[CLIENT_NO] [int] NULL,
	[IMPORT_NO] [nvarchar](25) NULL,
	[OPT_BOOK] [nvarchar](10) NULL,
	[MAIL_NO] [int] NULL,
	[FAM_NO] [int] NULL,
	[ORIGIN] [nvarchar](10) NULL,
	[LANGUAGE] [nvarchar](10) NULL,
	[LOCATION] [nvarchar](10) NULL,
	[DEP_MONTH] [int] NULL,
	[DEP_YEAR] [int] NULL,
	[START_DATE] [nvarchar](10) NULL,
	[BASE_CODE] [nvarchar](10) NULL,
	[REG_BASE] [nvarchar](10) NULL,
	[TITLE] [nvarchar](25) NULL,
	[FORENAME] [nvarchar](50) NULL,
	[AGENT_NAME] [nvarchar](50) NULL,
	[SURNAME] [nvarchar](50) NULL,
	[COMPANY] [nvarchar](50) NULL,
	[ADDR1] [nvarchar](100) NULL,
	[ADDR2] [nvarchar](100) NULL,
	[ADDR3] [nvarchar](100) NULL,
	[CITY] [nvarchar](50) NULL,
	[STATE] [nvarchar](50) NULL,
	[ZIP_CODE] [nvarchar](25) NULL,
	[COUNTRY] [nvarchar](50) NULL,
	[NATIONALITY] [nvarchar](25) NULL,
	[DAY_TEL_NO] [nvarchar](25) NULL,
	[EVE_TEL_NO] [nvarchar](25) NULL,
	[OLD_DAY_TEL] [nvarchar](25) NULL,
	[OLD_EVE_TEL] [nvarchar](25) NULL,
	[TEL_NO_CHANGED] [nvarchar](25) NULL,
	[TEL1_DESC] [nvarchar](50) NULL,
	[TEL1_NO] [nvarchar](25) NULL,
	[TEL2_DESC] [nvarchar](50) NULL,
	[TEL2_NO] [nvarchar](25) NULL,
	[TEL3_DESC] [nvarchar](50) NULL,
	[TEL3_NO] [nvarchar](25) NULL,
	[FAX1_DESC] [nvarchar](25) NULL,
	[FAX1_NO] [nvarchar](25) NULL,
	[EMAIL] [nvarchar](100) NULL,
	[CL_COMPANY] [nvarchar](50) NULL,
	[CL_ADDR1] [nvarchar](50) NULL,
	[CL_ADDR2] [nvarchar](50) NULL,
	[CL_ADDR3] [nvarchar](50) NULL,
	[CL_CITY] [nvarchar](50) NULL,
	[CL_STATE] [nvarchar](50) NULL,
	[CL_ZIP_CODE] [nvarchar](15) NULL,
	[CL_COUNTRY] [nvarchar](50) NULL,
	[CL_NATIONALITY] [nvarchar](10) NULL,
	[CL_TEL1_DESC] [nvarchar](50) NULL,
	[CL_TEL1_NO] [nvarchar](25) NULL,
	[CL_TEL2_DESC] [nvarchar](50) NULL,
	[CL_TEL2_NO] [nvarchar](25) NULL,
	[CL_TEL3_DESC] [nvarchar](50) NULL,
	[CL_TEL3_NO] [nvarchar](25) NULL,
	[CL_FAX1_DESC] [nvarchar](50) NULL,
	[CL_FAX1] [nvarchar](25) NULL,
	[CL_EMAIL] [nvarchar](60) NULL,
	[REF_AGENT_NO] [int] NULL,
	[REF_COMM] [numeric](18, 0) NULL,
	[YEARS] [int] NULL,
	[YOB] [int] NULL,
	[OCCUPATION] [nvarchar](50) NULL,
	[PUB1] [nvarchar](10) NULL,
	[PUB2] [nvarchar](10) NULL,
	[PUB3] [nvarchar](10) NULL,
	[HOL1] [nvarchar](10) NULL,
	[HOL2] [nvarchar](10) NULL,
	[HOL3] [nvarchar](10) NULL,
	[ADDED_BY] [nvarchar](25) NULL,
	[ADDED_DATE] [nvarchar](10) NULL,
	[ADDED_TIME] [nvarchar](10) NULL,
	[CONF_BY] [nvarchar](50) NULL,
	[CONF_DATE] [nvarchar](10) NULL,
	[CANX_BY] [nvarchar](50) NULL,
	[CANX_DATE] [nvarchar](10) NULL,
	[PRICED] [nvarchar](10) NULL,
	[AG_DIR_BOOK] [nvarchar](10) NULL,
	[AG_DIR_TERM] [nvarchar](10) NULL,
	[AGENT_NO] [int] NULL,
	[LAST_PRICE_TAG] [int] NULL,
	[LAST_PAY_TAG] [int] NULL,
	[LAST_STAT_TAG] [int] NULL,
	[LAST_PASS_NO] [int] NULL,
	[LAST_INV_NO] [int] NULL,
	[PAY_TERMS] [nvarchar](10) NULL,
	[AGENT_COMM] [numeric](18, 2) NULL,
	[VAT_ON_COMM] [numeric](18, 3) NULL,
	[SOURCE] [nvarchar](10) NULL,
	[SEC_SOURCE] [nvarchar](10) NULL,
	[EXPIRY_DATE] [nvarchar](10) NULL,
	[DEP_DATE] [nvarchar](10) NULL,
	[MID_DATE] [nvarchar](10) NULL,
	[FIN_DATE] [nvarchar](10) NULL,
	[DEP_PERC] [numeric](18, 0) NULL,
	[MID_PERC] [numeric](18, 0) NULL,
	[CHART_INV] [nvarchar](5) NULL,
	[DEP_FINAL] [nvarchar](5) NULL,
	[MAX_VAL] [numeric](18, 0) NULL,
	[PTERM_CHANGED] [nvarchar](10) NULL,
	[BATCH_NO] [int] NULL,
	[PACKAGE] [nvarchar](10) NULL,
	[FLIGHT_ONLY] [nvarchar](5) NULL,
	[OPT_CHECKED] [nvarchar](5) NULL,
	[ADM_CHECKED] [nvarchar](5) NULL,
	[PRICE_CHECKED] [nvarchar](5) NULL,
	[TRAN_SHEET_SENT] [nvarchar](10) NULL,
	[TRAN_SHEET_RECVD] [nvarchar](10) NULL,
	[TIX_PRINTED] [nvarchar](5) NULL,
	[CONTACT_MEDIUM] [nvarchar](5) NULL,
	[GROUP_REF] [nvarchar](100) NULL,
	[PAX_QTY] [int] NULL,
	[LOCK] [nvarchar](5) NULL,
	[SUPP_CODE] [nvarchar](10) NULL,
	[MEDAL] [nvarchar](5) NULL,
	[TANDC_CHECK] [nvarchar](5) NULL,
	[BOOK_FORM_RECD] [nvarchar](5) NULL,
	[OLD_ARRIVALS] [nvarchar](10) NULL,
	[HOLIDAY_TYPE] [int] NULL,
	[DISC_TYPE] [numeric](18, 0) NULL,
	[DISC_VALUE] [numeric](18, 0) NULL,
	[INS_TANDC] [nvarchar](10) NULL,
	[INS_MED] [nvarchar](10) NULL,
	[I5_CONTRACT_NO] [nvarchar](10) NULL,
	[F_CONTACT_URN] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Index [IX_NEPTUNE_BOOK_PK]    Script Date: 18/05/2018 09:45:17 ******/
CREATE UNIQUE CLUSTERED INDEX [IX_NEPTUNE_BOOK_PK] ON [dbo].[NEPTUNE_BOOK]
(
	[CLIENT_NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEPTUNE_CHARTYPE]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEPTUNE_CHARTYPE](
	[COMPANY_CODE] [nvarchar](10) NULL,
	[PRODUCT] [nvarchar](10) NULL,
	[CHAR_TYPE] [nvarchar](5) NULL,
	[CHAR_DISP] [nvarchar](5) NULL,
	[SINGLES] [nvarchar](5) NULL,
	[COLOUR] [int] NULL,
	[MAX_PAX] [int] NULL,
	[EMBARK_TIME] [numeric](10, 2) NULL,
	[DISEMBARK_TIME] [numeric](10, 2) NULL,
	[DESCRIPTION] [nvarchar](25) NULL,
	[MAILLIST] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEPTUNE_CLIENT_PREFERENCE]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEPTUNE_CLIENT_PREFERENCE](
	[Source_Key] [varchar](50) NULL,
	[ClientCode] [varchar](50) NULL,
	[Brand] [varchar](50) NULL,
	[CancelFromBrochure] [varchar](50) NULL,
	[CancelFromMailing] [varchar](50) NULL,
	[CancelFromEmail] [varchar](50) NULL,
	[CancelFromTelephone] [varchar](50) NULL,
	[CancelFromEnews] [varchar](50) NULL,
	[CancelFromSMS] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEPTUNE_COMPANY]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEPTUNE_COMPANY](
	[COMPANY_CODE] [nvarchar](1) NULL,
	[COMPANY_DESCRIPTION] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEPTUNE_EBROC_NEWLETTERS]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEPTUNE_EBROC_NEWLETTERS](
	[MailNo] [varchar](50) NULL,
	[F_TITLE] [varchar](50) NULL,
	[F_FORENAME] [varchar](50) NULL,
	[F_SURNAME] [varchar](50) NULL,
	[F_ADDRESS_LINE_1] [varchar](150) NULL,
	[F_ADDRESS_LINE_2] [varchar](150) NULL,
	[F_ADDRESS_LINE_3] [varchar](150) NULL,
	[F_CITY] [varchar](50) NULL,
	[F_STATE] [varchar](50) NULL,
	[F_POSTCODE] [varchar](50) NULL,
	[F_COUNTRY] [varchar](50) NULL,
	[F_NATIONALITY] [varchar](50) NULL,
	[F_EMAIL] [varchar](150) NULL,
	[F_PHONE] [varchar](50) NULL,
	[F_SOURCE] [varchar](50) NULL,
	[F_LOCATION] [varchar](50) NULL,
	[F_LANGUAGE] [varchar](50) NULL,
	[F_COMPANY_NO] [varchar](50) NULL,
	[F_BROCHURE_CODE] [varchar](50) NULL,
	[Brochure_name] [varchar](50) NULL,
	[F_ADDED_BY] [varchar](50) NULL,
	[Enquiry Date] [varchar](50) NULL,
	[F_CONTACT_URN] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEPTUNE_EMPL_AVAIL]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEPTUNE_EMPL_AVAIL](
	[EMPL_NO] [int] NULL,
	[BASE] [nvarchar](10) NULL,
	[START_DATE] [nvarchar](10) NULL,
	[END_DATE] [nvarchar](10) NULL,
	[DAY_OFF] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEPTUNE_EMPL_UNAVAIL]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEPTUNE_EMPL_UNAVAIL](
	[EMPL_NO] [int] NULL,
	[START_DATE] [nvarchar](10) NULL,
	[END_DATE] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEPTUNE_EMPLREF]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEPTUNE_EMPLREF](
	[EMPLREF_NO] [int] NULL,
	[EMPL_NO] [int] NULL,
	[EXTRA_NO] [int] NULL,
	[COMPANY_NO] [nvarchar](5) NULL,
	[BASE] [nvarchar](10) NULL,
	[START_DATE] [nvarchar](10) NULL,
	[END_DATE] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEPTUNE_EXRATE]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEPTUNE_EXRATE](
	[CONVERT_TO] [nvarchar](10) NULL,
	[ORIGIN] [nvarchar](5) NULL,
	[START_DATE] [nvarchar](10) NULL,
	[EX_RATE] [numeric](10, 3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEPTUNE_EXTRA]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEPTUNE_EXTRA](
	[COMPANY_CODE] [nvarchar](25) NULL,
	[EXTRA_NO] [int] NULL,
	[BASE] [nvarchar](10) NULL,
	[DATE] [nvarchar](10) NULL,
	[DUR] [int] NULL,
	[OFFSET] [int] NULL,
	[DOW] [int] NULL,
	[TYPE] [nvarchar](10) NULL,
	[ORIG_TYPE] [nvarchar](10) NULL,
	[NAME] [nvarchar](50) NULL,
	[ORIG_NAME] [nvarchar](50) NULL,
	[TOTAL_SEATS] [int] NULL,
	[CONFD] [int] NULL,
	[OPTIONS] [int] NULL,
	[FREE] [int] NULL,
	[FREE_LIMIT] [int] NULL,
	[EXTEMPREF_NO] [int] NULL,
	[END_DATE] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEPTUNE_EXTRA_AVAIL]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEPTUNE_EXTRA_AVAIL](
	[COMPANY_NO] [nvarchar](5) NULL,
	[EXTRA_TYPE] [nvarchar](10) NULL,
	[BASE] [nvarchar](10) NULL,
	[START_DATE] [nvarchar](10) NULL,
	[END_DATE] [nvarchar](10) NULL,
	[MON] [nvarchar](5) NULL,
	[TUE] [nvarchar](5) NULL,
	[WED] [nvarchar](5) NULL,
	[THU] [nvarchar](5) NULL,
	[FRI] [nvarchar](5) NULL,
	[SAT] [nvarchar](5) NULL,
	[SUN] [nvarchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEPTUNE_EXTRAREF]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEPTUNE_EXTRAREF](
	[CLIENT_NO] [int] NULL,
	[EXTRAREF_NO] [int] NULL,
	[EXTRA_NO] [int] NULL,
	[SEATS_REQD] [int] NULL,
	[ADDED_BY] [nvarchar](50) NULL,
	[ADDED_DATE] [nvarchar](10) NULL,
	[ADDED_TIME] [nvarchar](10) NULL,
	[ACCOMREF_NO] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEPTUNE_FAMILY]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEPTUNE_FAMILY](
	[F_mail_no] [varchar](50) NULL,
	[F_fam_no] [varchar](50) NULL,
	[F_leader] [varchar](50) NULL,
	[F_title] [varchar](50) NULL,
	[F_forename] [varchar](50) NULL,
	[F_surname] [varchar](50) NULL,
	[F_email] [varchar](255) NULL,
	[F_contact_medium] [varchar](50) NULL,
	[F_ex_cl_bro] [varchar](50) NULL,
	[F_ex_yt_bro] [varchar](50) NULL,
	[F_ex_fl_bro] [varchar](50) NULL,
	[F_ex_ev_bro] [varchar](50) NULL,
	[F_ex_sc_bro] [varchar](50) NULL,
	[F_ex_cb_bro] [varchar](50) NULL,
	[F_ex_es_bro] [varchar](50) NULL,
	[F_ex_cn_bro] [varchar](50) NULL,
	[F_ex_lb_bro] [varchar](50) NULL,
	[F_ex_cv_bro] [varchar](50) NULL,
	[F_ex_aa_bro] [varchar](50) NULL,
	[F_ex_cl_dm] [varchar](50) NULL,
	[F_ex_yt_dm] [varchar](50) NULL,
	[F_ex_fl_dm] [varchar](50) NULL,
	[F_ex_ev_dm] [varchar](50) NULL,
	[F_ex_sc_dm] [varchar](50) NULL,
	[F_ex_cb_dm] [varchar](50) NULL,
	[F_ex_es_dm] [varchar](50) NULL,
	[F_ex_cn_dm] [varchar](50) NULL,
	[F_ex_lb_dm] [varchar](50) NULL,
	[F_ex_cv_dm] [varchar](50) NULL,
	[F_ex_aa_dm] [varchar](50) NULL,
	[F_ex_cl_em] [varchar](50) NULL,
	[F_ex_yt_em] [varchar](50) NULL,
	[F_ex_fl_em] [varchar](50) NULL,
	[F_ex_ev_em] [varchar](50) NULL,
	[F_ex_sc_em] [varchar](50) NULL,
	[F_ex_cb_em] [varchar](50) NULL,
	[F_ex_es_em] [varchar](50) NULL,
	[F_ex_cn_em] [varchar](50) NULL,
	[F_ex_lb_em] [varchar](50) NULL,
	[F_ex_cv_em] [varchar](50) NULL,
	[F_ex_aa_em] [varchar](50) NULL,
	[F_ex_cl_tel] [varchar](50) NULL,
	[F_ex_yt_tel] [varchar](50) NULL,
	[F_ex_fl_tel] [varchar](50) NULL,
	[F_ex_ev_tel] [varchar](50) NULL,
	[F_ex_sc_tel] [varchar](50) NULL,
	[F_ex_cb_tel] [varchar](50) NULL,
	[F_ex_es_tel] [varchar](50) NULL,
	[F_ex_cn_tel] [varchar](50) NULL,
	[F_ex_lb_tel] [varchar](50) NULL,
	[F_ex_cv_tel] [varchar](50) NULL,
	[F_ex_aa_tel] [varchar](50) NULL,
	[F_ex_ec_bro] [varchar](50) NULL,
	[F_ex_ec_dm] [varchar](50) NULL,
	[F_ex_ec_em] [varchar](50) NULL,
	[F_exc_1] [varchar](50) NULL,
	[F_exc_2] [varchar](50) NULL,
	[F_exc_3] [varchar](50) NULL,
	[F_exc_4] [varchar](50) NULL,
	[F_exc_5] [varchar](50) NULL,
	[F_exc_6] [varchar](50) NULL,
	[F_exc_7] [varchar](50) NULL,
	[F_exc_8] [varchar](50) NULL,
	[F_exc_9] [varchar](50) NULL,
	[F_fi_1] [varchar](50) NULL,
	[F_fi_2] [varchar](50) NULL,
	[F_fi_3] [varchar](50) NULL,
	[F_fi_4] [varchar](50) NULL,
	[F_fi_5] [varchar](50) NULL,
	[F_fi_6] [varchar](50) NULL,
	[F_fi_7] [varchar](50) NULL,
	[F_fi_8] [varchar](50) NULL,
	[F_fi_9] [varchar](50) NULL,
	[F_dob] [varchar](50) NULL,
	[F_last_corr_date] [varchar](50) NULL,
	[F_citizen] [varchar](50) NULL,
	[F_language] [varchar](50) NULL,
	[F_passport] [varchar](50) NULL,
	[F_admin_user] [varchar](50) NULL,
	[F_dup_weight] [varchar](50) NULL,
	[F_fam_dup_no] [varchar](50) NULL,
	[F_dup_type] [varchar](50) NULL,
	[F_URN] [bigint] NULL,
	[F_email2] [varchar](60) NULL,
	[F_no_email] [bit] NULL,
	[F_mobile] [varchar](20) NULL,
	[F_mobile_dialcode] [varchar](3) NULL,
	[F_home_tel] [varchar](20) NULL,
	[F_home_tel_dialcode] [varchar](3) NULL,
	[F_office_tel] [varchar](20) NULL,
	[F_office_tel_dialcode] [varchar](3) NULL,
	[F_fax] [varchar](20) NULL,
	[F_fax_tel_dialcode] [varchar](3) NULL,
	[F_ID_type] [numeric](18, 0) NULL,
	[F_ID_number] [varchar](20) NULL,
	[F_ID_expires] [date] NULL,
	[F_client_type] [varchar](2) NULL,
	[F_client_category] [varchar](4) NULL,
	[F_ex_ev_ene] [bit] NULL,
	[F_ex_sc_ene] [bit] NULL,
	[F_ex_cb_ene] [bit] NULL,
	[F_ex_es_ene] [bit] NULL,
	[F_ex_cn_ene] [bit] NULL,
	[F_ex_lb_ene] [bit] NULL,
	[F_ex_ev_sms] [bit] NULL,
	[F_ex_sc_sms] [bit] NULL,
	[F_ex_cb_sms] [bit] NULL,
	[F_ex_es_sms] [bit] NULL,
	[F_ex_cn_sms] [bit] NULL,
	[F_ex_lb_sms] [bit] NULL,
	[F_optin_ev_em] [bit] NULL,
	[F_optin_date_ev_em] [varchar](50) NULL,
	[F_optoutdate_ev_em] [varchar](50) NULL,
	[F_optin_sc_em] [bit] NULL,
	[F_optindate_sc_em] [varchar](50) NULL,
	[F_optoutdate_sc_em] [varchar](50) NULL,
	[F_optin_cb_em] [bit] NULL,
	[F_optindate_cb_em] [varchar](50) NULL,
	[F_optoutdate_cb_em] [varchar](50) NULL,
	[F_optin_es_em] [bit] NULL,
	[F_optindate_es_em] [varchar](50) NULL,
	[F_optoutdate_es_em] [varchar](50) NULL,
	[F_optin_cn_em] [bit] NULL,
	[F_optindate_cn_em] [varchar](50) NULL,
	[F_optoutdate_cn_em] [varchar](50) NULL,
	[F_optin_lb_em] [bit] NULL,
	[F_optindate_lb_em] [varchar](50) NULL,
	[F_optoutdate_lb_em] [varchar](50) NULL,
	[F_added_date] [date] NULL,
	[F_added_by] [varchar](10) NULL,
	[F_updated_date] [date] NULL,
	[F_updated_time] [varchar](50) NULL,
	[F_updated_by] [varchar](10) NULL,
	[F_citizen2] [varchar](3) NULL,
	[F_myaccount] [bit] NULL,
	[F_update_hubspot] [bit] NULL,
	[F_consent_stmnt_opt1] [varchar](50) NULL,
	[F_date_consent_opt1] [varchar](50) NULL,
	[F_time_consent_opt1] [varchar](50) NULL,
	[F_meth_consent_opt1] [varchar](50) NULL,
	[F_consent_stmnt_opt2] [varchar](50) NULL,
	[F_date_consent_opt2] [varchar](50) NULL,
	[F_time_consent_opt2] [varchar](50) NULL,
	[F_meth_consent_opt2] [varchar](50) NULL,
	[F_consent_withdrawn] [varchar](50) NULL,
	[F_date_consent_withdrawn] [varchar](50) NULL,
	[F_time_consent_withdrawn] [varchar](50) NULL,
	[F_why_consent_withdrawn] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEPTUNE_FLIGHT]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEPTUNE_FLIGHT](
	[FLIGHT_NO] [int] NULL,
	[TYPE] [nvarchar](10) NULL,
	[DEP_AIRPORT] [nvarchar](5) NULL,
	[DEP_DATE] [nvarchar](10) NULL,
	[DEP_TIME] [numeric](10, 2) NULL,
	[DEP_NO] [int] NULL,
	[ARR_AIRPORT] [nvarchar](10) NULL,
	[ARR_DATE] [nvarchar](10) NULL,
	[ARR_TIME] [numeric](10, 2) NULL,
	[CARRIER] [nvarchar](10) NULL,
	[REF] [nvarchar](10) NULL,
	[OUT_OR_IN] [nvarchar](5) NULL,
	[SEAT_PRICE] [numeric](10, 2) NULL,
	[SC_SEAT_PRICE] [numeric](10, 2) NULL,
	[ORIGIN] [nvarchar](5) NULL,
	[TOTAL_SEATS] [int] NULL,
	[OPTION] [int] NULL,
	[CONFD] [int] NULL,
	[WAIT] [int] NULL,
	[FREE] [int] NULL,
	[FO_TOTAL_SEATS] [int] NULL,
	[FO_OPTION] [int] NULL,
	[FO_CONFD] [int] NULL,
	[FO_WAIT] [int] NULL,
	[FO_FREE] [int] NULL,
	[TICKETS] [nvarchar](5) NULL,
	[MAINIFEST] [nvarchar](5) NULL,
	[BAGGAGE] [nvarchar](10) NULL,
	[CHECK_IN_TIME] [numeric](10, 2) NULL,
	[CHECK_IN_TERM] [nvarchar](15) NULL,
	[ROUTE] [nvarchar](5) NULL,
	[MAX_7_DAY] [int] NULL,
	[7_DAY] [int] NULL,
	[7_DAY_STOP] [nvarchar](10) NULL,
	[FO_MAX_7_DAY] [int] NULL,
	[FO_7_DAY_REMAIN] [int] NULL,
	[FO_7_DAY_STOP] [nvarchar](10) NULL,
	[COLOR] [int] NULL,
	[CLASS] [nvarchar](5) NULL,
	[INTERNET_USE] [nvarchar](5) NULL,
	[IN_USE] [nvarchar](5) NULL,
	[LAST_ALLOC_NO] [int] NULL,
	[TOTAL_ONFLT] [int] NULL,
	[OPT_ONFLT] [int] NULL,
	[CONFD_ONFLT] [int] NULL,
	[WAIT_ONFLT] [int] NULL,
	[FREE_ONFLT] [int] NULL,
	[HAS_ALTERNATIVES] [nvarchar](10) NULL,
	[ON_REQUEST] [nvarchar](10) NULL,
	[I5_MANAGED] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEPTUNE_FLIGHT_ALLOC]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEPTUNE_FLIGHT_ALLOC](
	[FLIGHT_NO] [int] NULL,
	[PARENT_ALLOC] [int] NULL,
	[ALLOC_NO] [int] NULL,
	[ALLOC_CODE] [nvarchar](10) NULL,
	[ALLOC_VALUE] [nvarchar](10) NULL,
	[TOTAL_SEATS] [int] NULL,
	[OPT_SEATS] [int] NULL,
	[CONFD_SEATS] [int] NULL,
	[WAIT_SEATS] [int] NULL,
	[FREE_SEATS] [int] NULL,
	[ALLOW_NEGATIVE] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEPTUNE_FLIGHT_REF]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEPTUNE_FLIGHT_REF](
	[CLIENT_NO] [int] NULL,
	[FLIGHTRENO] [int] NULL,
	[FLIGHT_NO] [int] NULL,
	[SEATS_REQD] [int] NULL,
	[SEATS_ON_WAIT] [int] NULL,
	[FLIGHT_ONLY] [nvarchar](5) NULL,
	[7_DAY] [nvarchar](5) NULL,
	[ALLOC_FROM_FLT_ONLY] [nvarchar](5) NULL,
	[ALLOC_FROM_7_DAY] [nvarchar](5) NULL,
	[ALLOC_SEATS] [int] NULL,
	[ADDED_BY] [nvarchar](50) NULL,
	[ADDED_DATE] [nvarchar](10) NULL,
	[ADDED_TIME] [nvarchar](10) NULL,
	[ALLOC_NO] [int] NULL,
	[ROUTE_NO] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEPTUNE_FLTNOTE]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEPTUNE_FLTNOTE](
	[FLIGHT_NO] [int] NULL,
	[TEXT] [nvarchar](2000) NULL,
	[TYPE] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEPTUNE_INSTRUCT]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEPTUNE_INSTRUCT](
	[COMPANY_NO] [nvarchar](25) NULL,
	[PTYPE] [nvarchar](10) NULL,
	[ITYPE] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEPTUNE_INVOICE_COMPANY]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEPTUNE_INVOICE_COMPANY](
	[COMPANY_NO] [nvarchar](25) NULL,
	[INV_COMPANY] [nvarchar](5) NULL,
	[NAME] [nvarchar](50) NULL,
	[ADDR1] [nvarchar](50) NULL,
	[ADDR2] [nvarchar](50) NULL,
	[ADDR3] [nvarchar](50) NULL,
	[CITY] [nvarchar](50) NULL,
	[STATE] [nvarchar](50) NULL,
	[ZIP_CODE] [nvarchar](20) NULL,
	[COUNTRY] [nvarchar](50) NULL,
	[TEL_NO] [nvarchar](30) NULL,
	[FAX_NO] [nvarchar](30) NULL,
	[TAX_REG_NUMBER] [nvarchar](30) NULL,
	[ABTA_NUMBER] [nvarchar](30) NULL,
	[ATOL_NUMBER] [nvarchar](30) NULL,
	[VAT_DESC] [nvarchar](30) NULL,
	[VAT_ACC] [nvarchar](10) NULL,
	[BANK_ACC] [nvarchar](10) NULL,
	[DEBT_ACC] [nvarchar](10) NULL,
	[SUSP_ACC] [nvarchar](10) NULL,
	[COMM] [nvarchar](10) NULL,
	[VATCOMM] [nvarchar](10) NULL,
	[MSOFT_CO] [nvarchar](5) NULL,
	[SALES_BATCH] [nvarchar](10) NULL,
	[CC_AUTH] [nvarchar](5) NULL,
	[USE_PORTRAIT] [nvarchar](10) NULL,
	[FIX_HOL_COST] [nvarchar](5) NULL,
	[CC_MERC_NO] [nvarchar](20) NULL,
	[CUT_OFF_DAYS] [int] NULL,
	[EXPIRY_DAYSUNDER] [int] NULL,
	[EXPIRY_DAYS] [int] NULL,
	[DEP_DAYS] [int] NULL,
	[DEPOSIT_CONF] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEPTUNE_MAIL_CONTACT]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEPTUNE_MAIL_CONTACT](
	[F_mail_no] [varchar](50) NULL,
	[F_rec_type] [varchar](50) NULL,
	[F_client_type] [varchar](50) NULL,
	[F_client_category] [varchar](50) NULL,
	[F_active_member] [varchar](50) NULL,
	[F_override_date] [varchar](50) NULL,
	[F_medal] [varchar](50) NULL,
	[F_medal_date] [varchar](50) NULL,
	[F_medal_user] [varchar](50) NULL,
	[F_title] [varchar](50) NULL,
	[F_forename] [varchar](50) NULL,
	[F_surname] [varchar](50) NULL,
	[F_addr_supplied] [varchar](50) NULL,
	[F_company] [varchar](50) NULL,
	[F_addr1] [varchar](50) NULL,
	[F_addr2] [varchar](50) NULL,
	[F_addr3] [varchar](50) NULL,
	[F_town] [varchar](50) NULL,
	[F_county] [varchar](50) NULL,
	[F_nationality] [varchar](50) NULL,
	[F_country] [varchar](50) NULL,
	[F_post_code] [varchar](50) NULL,
	[F_qas_flag] [varchar](50) NULL,
	[F_soundex] [varchar](50) NULL,
	[F_tel1_desc] [varchar](50) NULL,
	[F_tel1_no] [varchar](50) NULL,
	[F_tel2_desc] [varchar](50) NULL,
	[F_tel2_no] [varchar](50) NULL,
	[F_tel3_desc] [varchar](50) NULL,
	[F_tel3_no] [varchar](50) NULL,
	[F_fax1_desc] [varchar](50) NULL,
	[F_fax1_no] [varchar](50) NULL,
	[F_email] [varchar](255) NULL,
	[F_bulk_mail] [varchar](50) NULL,
	[F_contact_medium] [varchar](50) NULL,
	[F_orig_loc] [varchar](50) NULL,
	[F_import_mail_no] [varchar](50) NULL,
	[F_import_ref] [varchar](50) NULL,
	[F_export_ref] [varchar](50) NULL,
	[F_export_point] [varchar](50) NULL,
	[F_added_date] [varchar](50) NULL,
	[F_added_by] [varchar](50) NULL,
	[F_update_date] [varchar](50) NULL,
	[F_update_by] [varchar](50) NULL,
	[F_dupe_key] [varchar](50) NULL,
	[F_last_fam_no] [varchar](50) NULL,
	[F_add_dup_no] [varchar](50) NULL,
	[F_agent_no] [varchar](50) NULL,
	[F_demog_code] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_NEPTUNE_MAIL_CONTACT_PK]    Script Date: 18/05/2018 09:45:17 ******/
CREATE UNIQUE CLUSTERED INDEX [IX_NEPTUNE_MAIL_CONTACT_PK] ON [dbo].[NEPTUNE_MAIL_CONTACT]
(
	[F_mail_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEPTUNE_MYUSER]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEPTUNE_MYUSER](
	[USER_ID] [nvarchar](15) NULL,
	[NAME] [nvarchar](30) NULL,
	[SECURITY] [nvarchar](5) NULL,
	[DEFAULT_PRINTER] [nvarchar](15) NULL,
	[ORIGIN] [nvarchar](5) NULL,
	[LOC] [nvarchar](5) NULL,
	[INV_CO] [nvarchar](5) NULL,
	[PAY_TERMS] [nvarchar](5) NULL,
	[USE_USERPTERMS] [nvarchar](10) NULL,
	[OPT_BLINK] [nvarchar](5) NULL,
	[BROCH_SIGNATURE] [nvarchar](10) NULL,
	[BROCH_POSITION] [nvarchar](30) NULL,
	[CHANGE_COST] [nvarchar](5) NULL,
	[DEPARTMENT] [nvarchar](10) NULL,
	[ADMIN_GROUP] [nvarchar](5) NULL,
	[guiNoRows] [int] NULL,
	[guiNoCols] [int] NULL,
	[NAV_MENU] [nvarchar](10) NULL,
	[NAV] [nvarchar](10) NULL,
	[EMAIL] [nvarchar](60) NULL,
	[NEW_SYS_USR] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEPTUNE_ORIGIN]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEPTUNE_ORIGIN](
	[ORIGIN] [nvarchar](25) NULL,
	[DESCRIPTION] [nvarchar](50) NULL,
	[LANG] [nvarchar](50) NULL,
	[LANG_ISO] [nvarchar](5) NULL,
	[LOC] [nvarchar](50) NULL,
	[GLOC] [nvarchar](10) NULL,
	[EFT_CODE] [nvarchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEPTUNE_PACKAGE]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEPTUNE_PACKAGE](
	[PACKAGE_CODE] [nvarchar](4) NULL,
	[COMPANY_CODE] [nvarchar](1) NULL,
	[PACKAGE_DESC] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEPTUNE_PASS]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEPTUNE_PASS](
	[CLIENT_NO] [int] NULL,
	[MAIL_NO] [int] NULL,
	[FAM_NO] [int] NULL,
	[PASS_NO] [int] NULL,
	[TITLE] [nvarchar](25) NULL,
	[FORENAME] [nvarchar](50) NULL,
	[MIDDLENAME] [nvarchar](50) NULL,
	[SURNAME] [nvarchar](50) NULL,
	[COMPANY] [nvarchar](50) NULL,
	[ADDR1] [nvarchar](100) NULL,
	[ADDR2] [nvarchar](100) NULL,
	[ADDR3] [nvarchar](100) NULL,
	[CITY] [nvarchar](50) NULL,
	[STATE] [nvarchar](50) NULL,
	[ZIP_CODE] [nvarchar](25) NULL,
	[COUNTRY] [nvarchar](50) NULL,
	[NATIONALITY] [nvarchar](25) NULL,
	[DAY_TEL_NO] [nvarchar](25) NULL,
	[EVE_TEL_NO] [nvarchar](25) NULL,
	[TEL1_DESC] [nvarchar](50) NULL,
	[TEL1_NO] [nvarchar](25) NULL,
	[TEL2_DESC] [nvarchar](50) NULL,
	[TEL2_NO] [nvarchar](25) NULL,
	[TEL3_DESC] [nvarchar](50) NULL,
	[TEL3_NO] [nvarchar](25) NULL,
	[FAX1_DESC] [nvarchar](50) NULL,
	[FAX1_NO] [nvarchar](25) NULL,
	[EMAIL] [nvarchar](100) NULL,
	[SEX] [nvarchar](10) NULL,
	[DOB] [nvarchar](10) NULL,
	[ADULT] [nvarchar](50) NULL,
	[YEARS] [int] NULL,
	[MONTHS] [int] NULL,
	[YOB] [int] NULL,
	[OCCUPATION] [nvarchar](50) NULL,
	[PASSPORT] [nvarchar](25) NULL,
	[PASSPORT_ISSUE_DATE] [nvarchar](10) NULL,
	[PASSPORT_EXPIRTY_DATE] [nvarchar](10) NULL,
	[PASSPORT_ISSUE_PLACE] [nvarchar](100) NULL,
	[PASS_NATION] [nvarchar](25) NULL,
	[SMOKER] [nvarchar](50) NULL,
	[VEG] [nvarchar](5) NULL,
	[TOD] [nvarchar](5) NULL,
	[INS_REQD] [nvarchar](5) NULL,
	[INS_POLICY] [nvarchar](50) NULL,
	[INS_START_DATE] [nvarchar](10) NULL,
	[INS_END_DATE] [nvarchar](10) NULL,
	[TRANSFER] [nvarchar](5) NULL,
	[MSOFT_DEPT] [nvarchar](10) NULL,
	[LOGBOOK] [nvarchar](5) NULL,
	[WATERPROOF] [nvarchar](5) NULL,
	[ADDTO_MAILLIST] [nvarchar](10) NULL,
	[BIRTH_PLACE] [nvarchar](75) NULL,
	[SAIL_EXP] [int] NULL,
	[SKIPPER_CREW_IND] [nvarchar](5) NULL,
	[REDRESS_NO] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Index [IX_NEPTUNE_PASS]    Script Date: 18/05/2018 09:45:17 ******/
CREATE CLUSTERED INDEX [IX_NEPTUNE_PASS] ON [dbo].[NEPTUNE_PASS]
(
	[CLIENT_NO] ASC,
	[PASS_NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEPTUNE_PASSLINK]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEPTUNE_PASSLINK](
	[CLIENT_NO] [int] NULL,
	[PASS_NO] [int] NULL,
	[REF_NO] [int] NULL,
	[TYPE] [nvarchar](5) NULL,
	[STATUS] [nvarchar](5) NULL,
	[AGE_CAT] [nvarchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEPTUNE_PAYMENT_DETAIL]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEPTUNE_PAYMENT_DETAIL](
	[BOOKING_REFERENCE_NO] [nvarchar](10) NOT NULL,
	[PAYMENT_TAG_NO] [numeric](4, 0) NOT NULL,
	[PAYMENT_DATE] [nvarchar](10) NOT NULL,
	[PAYMENT_METHOD_CODE] [nvarchar](2) NOT NULL,
	[PAYMENT_VALUE] [numeric](15, 4) NOT NULL,
	[PAYMENT_REFUND_IND] [nvarchar](1) NOT NULL,
	[PAYMENT_DESCRIPTION] [nvarchar](25) NULL,
	[CARDHOLDER_NAME] [nvarchar](25) NULL,
	[LANGUAGE_CODE] [nvarchar](1) NOT NULL,
	[ADDED_BY] [nvarchar](15) NOT NULL,
	[ADDED_DATETIME] [nvarchar](10) NOT NULL,
	[CREDIT_CARD_NO] [nvarchar](19) NULL,
	[CARD_START_DATE] [nvarchar](5) NULL,
	[CARD_EXPIRY_DATE] [nvarchar](5) NULL,
	[CARD_ISSUE_NO] [nvarchar](10) NULL,
	[COMPANY_CODE] [nvarchar](1) NULL,
	[INVOICE_COMPANY_CODE] [nvarchar](1) NULL,
	[LOCATION_CODE] [nvarchar](1) NULL,
	[AGENT_CODE] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEPTUNE_PAYMENT_METHOD]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEPTUNE_PAYMENT_METHOD](
	[PAY_METHOD] [nvarchar](2) NULL,
	[PAY_METHOD_DESC] [nvarchar](25) NULL,
	[CARD_NO_REQD] [nvarchar](1) NULL,
	[ISSUE_NO_REQD] [nvarchar](1) NULL,
	[START_DATE_REQD] [nvarchar](1) NULL,
	[END_DATE_REQD] [nvarchar](1) NULL,
	[AUTH_NO_REQD] [nvarchar](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEPTUNE_PAYMENT_TERMS]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEPTUNE_PAYMENT_TERMS](
	[COMPANY_CODE] [nvarchar](1) NULL,
	[PAY_CATEGORY] [nvarchar](1) NULL,
	[PAY_DESCRIPTION] [nvarchar](25) NULL,
	[DEP_PERCENT] [numeric](5, 0) NULL,
	[MID_PERCENT] [numeric](5, 0) NULL,
	[MID_DAYS] [numeric](5, 0) NULL,
	[FINAL_DAYS] [numeric](5, 0) NULL,
	[CHART_INV] [nvarchar](1) NULL,
	[DEP_FINAL] [nvarchar](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEPTUNE_PRICE_DESC]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEPTUNE_PRICE_DESC](
	[COMPANY_NO] [nvarchar](25) NULL,
	[PRICE_CODE] [nvarchar](25) NULL,
	[ORIGIN_CODE] [nvarchar](5) NULL,
	[PRICE_DESC] [nvarchar](50) NULL,
	[REVENUE_LINE_CODE_CONF] [int] NULL,
	[REVENUE_LINE_CODE_CNX] [int] NULL,
	[ENGLISH_PRICE_DESC] [nvarchar](50) NULL,
	[PRICE_TYPE_CODE] [nvarchar](50) NULL,
	[PRICE_SUBTYPE_CODE] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEPTUNE_PRICE_OPT]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEPTUNE_PRICE_OPT](
	[COMPANY_CODE] [nvarchar](25) NULL,
	[PRICE_CODE] [nvarchar](5) NULL,
	[NL_ACCOUNT] [nvarchar](10) NULL,
	[PRICE_CAT] [nvarchar](5) NULL,
	[RATE_CAT] [nvarchar](5) NULL,
	[AUTO_CAT] [nvarchar](5) NULL,
	[QUESTION] [nvarchar](5) NULL,
	[VAT_CODE] [nvarchar](5) NULL,
	[COMMISSION] [nvarchar](5) NULL,
	[SALES_CAT] [nvarchar](5) NULL,
	[APPLY_PERC] [nvarchar](5) NULL,
	[CAA_ABTA] [nvarchar](5) NULL,
	[MATCH_HOL_COST] [nvarchar](5) NULL,
	[INTERNET_OPTION] [nvarchar](5) NULL,
	[IN_USE] [nvarchar](10) NULL,
	[RANKING] [int] NULL,
	[EXCLUDE] [nvarchar](10) NULL,
	[FROM_i5] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEPTUNE_PRODUCT]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEPTUNE_PRODUCT](
	[COMPANY_CODE] [nvarchar](25) NULL,
	[PROD_CODE] [nvarchar](5) NULL,
	[PROD_DESC] [nvarchar](50) NULL,
	[PROD_DESC_ID] [int] NULL,
	[AVAIL] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEPTUNE_REG_BASE]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEPTUNE_REG_BASE](
	[COMPANY_CODE] [nvarchar](25) NULL,
	[ACCOMMODATION_NO] [int] NULL,
	[BOAT_FUNC] [nvarchar](5) NULL,
	[BASE] [nvarchar](10) NULL,
	[START_DATE] [nvarchar](10) NULL,
	[END_DATE] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEPTUNE_REMBOOK]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEPTUNE_REMBOOK](
	[F_company_no] [varchar](50) NULL,
	[F_inv_co] [varchar](50) NULL,
	[F_loc] [varchar](50) NULL,
	[F_client_no] [varchar](50) NULL,
	[F_opt_book] [varchar](50) NULL,
	[F_start_date] [datetime] NULL,
	[F_base_code] [varchar](50) NULL,
	[F_charter] [varchar](50) NULL,
	[F_removed_date] [datetime] NULL,
	[F_agent_name] [varchar](50) NULL,
	[F_surname] [varchar](50) NULL,
	[F_company] [varchar](50) NULL,
	[F_addr1] [varchar](50) NULL,
	[F_addr2] [varchar](50) NULL,
	[F_addr3] [varchar](50) NULL,
	[F_city] [varchar](50) NULL,
	[F_state] [varchar](50) NULL,
	[F_zip_code] [varchar](50) NULL,
	[F_country] [varchar](50) NULL,
	[F_nationality] [varchar](50) NULL,
	[F_reason] [varchar](50) NULL,
	[F_nett_total] [varchar](50) NULL,
	[F_vat] [varchar](50) NULL,
	[F_agent_comm] [varchar](50) NULL,
	[F_payments] [varchar](50) NULL,
	[F_expiry_date] [datetime] NULL,
	[F_added_by] [varchar](50) NULL,
	[F_title] [varchar](50) NULL,
	[F_forename] [varchar](50) NULL,
	[F_tel1_no] [varchar](50) NULL,
	[F_tel2_no] [varchar](50) NULL,
	[F_tel3_no] [varchar](50) NULL,
	[F_email] [varchar](150) NULL,
	[F_boat_type] [varchar](50) NULL,
	[F_end_base] [varchar](50) NULL,
	[F_duration] [varchar](50) NULL,
	[F_enq_lang] [varchar](50) NULL,
	[F_lang] [varchar](50) NULL,
	[F_booking_date] [datetime] NULL,
	[F_mailID] [varchar](10) NULL,
	[F_agent_or_directbooking] [varchar](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEPTUNE_ROUTE]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEPTUNE_ROUTE](
	[CODE] [nvarchar](15) NULL,
	[DESC] [nvarchar](30) NULL,
	[i5_MANAGED] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEPTUNE_ROUTE_FLIGHT]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEPTUNE_ROUTE_FLIGHT](
	[ROUTE_NO] [int] NULL,
	[FLIGHT_NO] [int] NULL,
	[DATE] [nvarchar](10) NULL,
	[TIME] [numeric](10, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEPTUNE_ROUTE_LINK]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEPTUNE_ROUTE_LINK](
	[ROUTE_NO] [int] NULL,
	[ROUTE] [nvarchar](15) NULL,
	[DATE] [nvarchar](10) NULL,
	[TIME] [numeric](10, 2) NULL,
	[DEP_NO] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEPTUNE_SALES_CATEGORY]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEPTUNE_SALES_CATEGORY](
	[SALES_CATEGORY_CODE] [nvarchar](5) NULL,
	[SALES_CATEGORY] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEPTUNE_SFT_ALLOCATION]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEPTUNE_SFT_ALLOCATION](
	[i_SK_Calendar] [bigint] NOT NULL,
	[i_SK_InventoryDate] [bigint] NULL,
	[i_SK_SaleDate] [bigint] NULL,
	[i_SK_BookedDate] [bigint] NULL,
	[i_SK_CancelDate] [bigint] NULL,
	[i_BK_BookingStatus] [smallint] NULL,
	[i_BK_FLNUMB] [nvarchar](50) NULL,
	[i_BK_FLTY] [nvarchar](50) NULL,
	[i_BK_CNNB] [nvarchar](10) NULL,
	[i_BK_CLNB] [nvarchar](10) NULL,
	[i_BK_AUTO] [nvarchar](1) NULL,
	[i_BK_LOCT] [nvarchar](10) NULL,
	[i_BK_FRLOCT] [nvarchar](10) NULL,
	[i_BK_TOLOCT] [nvarchar](10) NULL,
	[i_BK_SourceSysID] [int] NULL,
	[i_BK_SourceSys] [nvarchar](10) NULL,
	[i_BK_DivisionCode] [nvarchar](1) NULL,
	[i_BK_BrandCode] [nvarchar](3) NULL,
	[i_BK_CompanyCode] [nvarchar](25) NULL,
	[AvailableAny] [int] NULL,
	[AvailableInHouse] [int] NULL,
	[AvailableAgentAndWeb] [int] NULL,
	[PickUpDay] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEPTUNE_SOURCE]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEPTUNE_SOURCE](
	[UK_OR_USE] [nvarchar](5) NULL,
	[SOURCE_CODE] [nvarchar](10) NULL,
	[SORT_KEY] [int] NULL,
	[DESCRIPTION] [nvarchar](50) NULL,
	[IN_USE] [nvarchar](10) NULL,
	[INTERNET] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEPTUNE_XREF]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEPTUNE_XREF](
	[BOOK_CLIENT_NO] [float] NULL,
	[ACCOMREF_NO] [float] NULL,
	[CONTRACT_NO] [nvarchar](20) NULL,
	[I5_CONTRACT] [bit] NULL,
	[COMPANY_NO] [float] NULL,
	[CLIENT_NO] [float] NULL,
	[OPT_BOOK] [nvarchar](255) NULL,
	[ORIGIN] [nvarchar](255) NULL,
	[START_DATE] [datetime] NULL,
	[BASE_CODE] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SB_NEPTUNE_REVENUE_CATEGORY]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SB_NEPTUNE_REVENUE_CATEGORY](
	[PRICE_CODE] [nvarchar](255) NULL,
	[PRICE_DESC] [nvarchar](255) NULL,
	[COMPANY_CODE] [float] NULL,
	[ORIGIN] [nvarchar](255) NULL,
	[ORIGIN_CODE] [nvarchar](255) NULL,
	[LANG] [nvarchar](255) NULL,
	[SALES_CAT] [nvarchar](255) NULL,
	[SALES_CATEGORY] [nvarchar](255) NULL,
	[REVENUE_LINE_CODE] [float] NULL,
	[REVENUE_LINE_DESC] [nvarchar](255) NULL,
	[REVENUE_GROUP_CLUB] [nvarchar](255) NULL,
	[REVENUE_GROUP_DESC] [nvarchar](255) NULL,
	[RevenueTypeCode] [nvarchar](10) NULL,
	[RevenueType] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SL_BrochureName]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SL_BrochureName](
	[BrochureName] [varchar](50) NULL,
	[Source] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ST_MARINE_ACCOMBOAT]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ST_MARINE_ACCOMBOAT](
	[CLIENT_NO] [int] NOT NULL,
	[PASS_NO] [int] NOT NULL,
	[Boat] [nvarchar](50) NULL,
	[BoatType] [nvarchar](50) NULL,
	[CharterStartDate] [datetime] NULL,
	[CharterStartTime] [nvarchar](10) NULL,
	[CharterEndDate] [datetime] NULL,
	[CharterEndTime] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Index [ST_MARINE_ACCOMBOAT_CL]    Script Date: 18/05/2018 09:45:17 ******/
CREATE CLUSTERED INDEX [ST_MARINE_ACCOMBOAT_CL] ON [dbo].[ST_MARINE_ACCOMBOAT]
(
	[CLIENT_NO] ASC,
	[PASS_NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ST_MARINE_AVAILABLEPORTS]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ST_MARINE_AVAILABLEPORTS](
	[ArrDate] [int] NULL,
	[ArrAirport] [nvarchar](9) NULL,
	[a_BaseCode] [nvarchar](25) NULL,
	[NoDays] [int] NULL,
	[SourceSysID] [int] NULL,
	[BrandCode] [nvarchar](3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ST_MARINE_AVAILPERWEEK]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ST_MARINE_AVAILPERWEEK](
	[i_BK_FLNUMB] [nvarchar](50) NULL,
	[i_BK_FLTY] [nvarchar](50) NULL,
	[ArrDate] [int] NULL,
	[ArrAirport] [nvarchar](9) NULL,
	[i_BK_LOCT] [nvarchar](25) NULL,
	[NoDays] [int] NULL,
	[SourceSysID] [int] NULL,
	[BrandCode] [nvarchar](3) NULL,
	[Available] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ST_MARINE_BEDSTOSEATS]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ST_MARINE_BEDSTOSEATS](
	[i_BK_FLNUMB] [nvarchar](50) NULL,
	[i_BK_FLTY] [nvarchar](50) NULL,
	[ArrDate] [int] NULL,
	[ArrAirport] [nvarchar](9) NULL,
	[i_BK_LOCT] [nvarchar](25) NULL,
	[NoDays] [int] NULL,
	[SourceSysID] [int] NULL,
	[BrandCode] [nvarchar](3) NULL,
	[Sold] [int] NULL,
	[Available] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ST_MARINE_BOATAVAILABILITY]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ST_MARINE_BOATAVAILABILITY](
	[i_BK_FLNUMB] [nvarchar](50) NULL,
	[i_BK_FLTY] [nvarchar](50) NULL,
	[i_BK_LOCT] [nvarchar](25) NULL,
	[i_SK_FirstContiguousInventoryDate] [int] NULL,
	[i_SK_LastContiguousInventoryDate] [int] NULL,
	[SourceSysID] [int] NULL,
	[BrandCode] [nvarchar](3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ST_MARINE_BOOKING_LEAD]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ST_MARINE_BOOKING_LEAD](
	[Source_Key] [varchar](50) NULL,
	[BookRef] [varchar](50) NULL,
	[ClientCode] [varchar](50) NULL,
	[BookingType] [varchar](30) NULL,
	[BookedBy] [varchar](50) NULL,
	[BookingSourcePrimary] [varchar](50) NULL,
	[BookingDate] [datetime] NULL,
	[CancelledDate] [datetime] NULL,
	[DepartureDate] [datetime] NULL,
	[ConfirmDate] [datetime] NULL,
	[Status] [varchar](30) NULL,
	[TotalPax] [int] NULL,
	[Duration] [int] NULL,
	[CurrencyCode] [varchar](30) NULL,
	[BookingOfficeLocation] [varchar](50) NULL,
	[BookingLanguage] [varchar](10) NULL,
	[CharterTypeName] [varchar](50) NULL,
	[CharterTypeCode] [varchar](10) NULL,
	[BrandName] [varchar](50) NULL,
	[BrandCode] [varchar](10) NULL,
	[ProductName] [varchar](50) NULL,
	[ProductCode] [varchar](25) NULL,
	[F_CONTACT_URN] [bigint] NULL,
	[Title] [nvarchar](50) NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[DateOfBirth] [datetime] NULL,
	[Nationality] [nvarchar](50) NULL,
	[Language] [nvarchar](50) NULL,
	[Add1] [nvarchar](50) NULL,
	[Add2] [nvarchar](50) NULL,
	[Add3] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[County] [nvarchar](50) NULL,
	[Postcode] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[ClientType] [varchar](10) NULL,
	[Phone1] [nvarchar](50) NULL,
	[Phone2] [nvarchar](50) NULL,
	[MobilePhone] [nvarchar](50) NULL,
	[MailNo] [varchar](50) NULL,
	[Email1] [nvarchar](200) NULL,
	[Blacklisted] [char](1) NULL,
	[Deceased] [char](1) NULL,
	[GoneAway] [char](1) NULL,
	[Lead] [nvarchar](3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ST_MARINE_BOOKINGITEMS]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ST_MARINE_BOOKINGITEMS](
	[i_SK_Calendar] [bigint] NOT NULL,
	[i_SK_Bkg] [bigint] NOT NULL,
	[Status] [int] NULL,
	[SourceSysID] [int] NULL,
	[BrandCode] [nvarchar](3) NULL,
	[CompanyNo] [nvarchar](25) NULL,
	[BoatFlag] [nvarchar](1) NULL,
	[FlightFlag] [nvarchar](1) NULL,
	[AccomFlag] [nvarchar](1) NULL,
	[TransferFlag] [nvarchar](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ST_MARINE_BOOKINGS]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ST_MARINE_BOOKINGS](
	[Source_Key] [varchar](50) NULL,
	[BookRef] [varchar](50) NULL,
	[ClientCode] [varchar](50) NULL,
	[BookingType] [varchar](30) NULL,
	[BookedBy] [varchar](50) NULL,
	[BookingSourcePrimary] [varchar](50) NULL,
	[BookingDate] [datetime] NULL,
	[CancelledDate] [datetime] NULL,
	[DepartureDate] [datetime] NULL,
	[ConfirmDate] [datetime] NULL,
	[Status] [varchar](30) NULL,
	[TotalPax] [int] NULL,
	[Duration] [int] NULL,
	[CurrencyCode] [varchar](30) NULL,
	[BookingOfficeLocation] [varchar](50) NULL,
	[BookingLanguage] [varchar](10) NULL,
	[CharterTypeName] [varchar](50) NULL,
	[CharterTypeCode] [varchar](10) NULL,
	[BrandName] [varchar](50) NULL,
	[BrandCode] [varchar](10) NULL,
	[ProductName] [varchar](50) NULL,
	[ProductCode] [varchar](25) NULL,
	[F_CONTACT_URN] [bigint] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_MARINE_BOOKINGS_PK]    Script Date: 18/05/2018 09:45:17 ******/
CREATE UNIQUE CLUSTERED INDEX [IX_MARINE_BOOKINGS_PK] ON [dbo].[ST_MARINE_BOOKINGS]
(
	[BookRef] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ST_MARINE_BROCHURE_REQUEST]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ST_MARINE_BROCHURE_REQUEST](
	[Source_Key] [varchar](50) NULL,
	[ClientCode] [int] NULL,
	[Type] [varchar](10) NULL,
	[BrochureName] [varchar](50) NULL,
	[DateRequested] [datetime] NULL,
	[Quantity] [int] NULL,
	[Language] [varchar](25) NULL,
	[Location] [varchar](50) NULL,
	[SourceDescription] [varchar](100) NULL,
	[Source] [varchar](50) NULL,
	[F_CONTACT_URN] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ST_MARINE_CLIENT_PREFERENCE]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ST_MARINE_CLIENT_PREFERENCE](
	[Source_Key] [varchar](50) NULL,
	[Source_Key_full] [varchar](50) NULL,
	[ClientCode] [varchar](50) NULL,
	[Brand] [varchar](50) NULL,
	[CancelFromBrochure] [varchar](50) NULL,
	[CancelFromMailing] [varchar](50) NULL,
	[CancelFromEmail] [varchar](50) NULL,
	[CancelFromTelephone] [varchar](50) NULL,
	[CancelFromEnews] [varchar](50) NULL,
	[CancelFromSMS] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ST_MARINE_CLIENTS]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ST_MARINE_CLIENTS](
	[Source_Key] [varchar](50) NULL,
	[ClientCode] [varchar](50) NULL,
	[Title] [nvarchar](50) NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[DateOfBirth] [datetime] NULL,
	[Nationality] [nvarchar](50) NULL,
	[Language] [nvarchar](50) NULL,
	[Add1] [nvarchar](50) NULL,
	[Add2] [nvarchar](50) NULL,
	[Add3] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[County] [nvarchar](50) NULL,
	[Postcode] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[ClientType] [varchar](10) NULL,
	[Phone1] [nvarchar](50) NULL,
	[Phone2] [nvarchar](50) NULL,
	[MobilePhone] [nvarchar](50) NULL,
	[MailNo] [varchar](50) NULL,
	[Email1] [nvarchar](200) NULL,
	[Blacklisted] [char](1) NULL,
	[Deceased] [char](1) NULL,
	[GoneAway] [char](1) NULL,
	[Lead] [nvarchar](3) NULL,
	[F_URN] [bigint] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_MARINE_CLIENTS]    Script Date: 18/05/2018 09:45:17 ******/
CREATE CLUSTERED INDEX [IX_MARINE_CLIENTS] ON [dbo].[ST_MARINE_CLIENTS]
(
	[ClientCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ST_MARINE_FBKG]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ST_MARINE_FBKG](
	[i_SK_Bkg] [bigint] NOT NULL,
	[SourceSysID] [int] NULL,
	[SystemName] [nvarchar](20) NULL,
	[DivisionCode] [nvarchar](1) NULL,
	[BrandCode] [nvarchar](10) NULL,
	[ProductCode] [nvarchar](25) NULL,
	[BookingType] [nvarchar](25) NULL,
	[SeasonCode] [nvarchar](3) NULL,
	[BookingStatusID] [int] NULL,
	[BkgRef] [nvarchar](10) NULL,
	[ClientNo] [nvarchar](10) NULL,
	[CompanyNo] [nvarchar](25) NULL,
	[InvCompany] [nvarchar](25) NULL,
	[PaxNo] [int] NULL,
	[Package] [nvarchar](20) NULL,
	[PackageDesc] [nvarchar](40) NULL,
	[Boat] [nvarchar](50) NULL,
	[BoatType] [nvarchar](50) NULL,
	[HotelName] [nvarchar](50) NULL,
	[BaseLocation] [nvarchar](25) NULL,
	[OptionDate] [datetime] NULL,
	[OptionExpiryDate] [datetime] NULL,
	[ConfirmDate] [datetime] NULL,
	[CancelDate] [datetime] NULL,
	[DepartureDate] [datetime] NULL,
	[ReturnDate] [datetime] NULL,
	[HolidayDuration] [int] NULL,
	[FlightHolidayDuration] [int] NULL,
	[CharterStartDate] [datetime] NULL,
	[CharterStartTime] [nvarchar](10) NULL,
	[CharterEndDate] [datetime] NULL,
	[CharterEndTime] [nvarchar](10) NULL,
	[CharterDuration] [int] NULL,
	[OptionUser] [nvarchar](25) NULL,
	[ConfirmUser] [nvarchar](25) NULL,
	[CancelUser] [nvarchar](25) NULL,
	[BkgLocation] [nvarchar](25) NULL,
	[BkgSrcCd] [nvarchar](12) NULL,
	[BkgSourceDesc] [nvarchar](50) NULL,
	[AgentContact] [nvarchar](50) NULL,
	[DirectAgentFlg] [nvarchar](1) NULL,
	[DirectAgent] [nvarchar](10) NULL,
	[LeadPaxSurname] [nvarchar](64) NULL,
	[LeadPaxForename] [nvarchar](50) NULL,
	[LeadPaxTitle] [nvarchar](12) NULL,
	[LeadPaxInitials] [nvarchar](4) NULL,
	[LeadPaxFullName] [nvarchar](75) NULL,
	[Address1] [nvarchar](255) NULL,
	[Address2] [nvarchar](255) NULL,
	[Address3] [nvarchar](255) NULL,
	[Town] [nvarchar](255) NULL,
	[County] [nvarchar](255) NULL,
	[PostCode] [nvarchar](80) NULL,
	[Country] [nvarchar](50) NULL,
	[OriginNationality] [nvarchar](80) NULL,
	[TelephoneNo] [nvarchar](75) NULL,
	[TelephoneNo2] [nvarchar](75) NULL,
	[Email] [nvarchar](100) NULL,
	[CurrencyOrigin] [nvarchar](25) NULL,
	[Currency] [nvarchar](25) NULL,
	[VatOnCommission] [int] NULL,
	[CrossRef] [nvarchar](10) NULL,
	[CAA_BondingType] [nvarchar](20) NULL,
	[BookingChannel] [nvarchar](50) NULL,
	[ExpandedBookingChannel] [nvarchar](50) NULL,
 CONSTRAINT [ST_MARINE_FBKG_PK] PRIMARY KEY CLUSTERED 
(
	[i_SK_Bkg] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ST_MARINE_FITN]    Script Date: 18/05/2018 09:45:17 ******/
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
	[BrandCode] [nvarchar](10) NULL,
	[BkgRef] [nvarchar](10) NULL,
	[ItinRef] [int] NOT NULL,
	[Status] [int] NULL,
	[CompanyNo] [nvarchar](25) NULL,
	[Package] [nvarchar](6) NULL,
	[Charter] [nvarchar](6) NULL,
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
	[ItemAmountLocal] [numeric](9, 2) NULL,
	[TotalAmountLocal] [numeric](15, 2) NULL,
	[TotalAmountLocalForCancel] [numeric](15, 2) NULL,
	[DiscountLocal] [numeric](9, 2) NULL,
	[VatLocal] [numeric](9, 2) NULL,
	[TApercent] [numeric](9, 2) NULL,
	[UK_Vat] [numeric](9, 2) NULL,
	[CommissionLocal] [numeric](9, 2) NULL,
	[LastAmendUser] [nvarchar](50) NULL,
	[BaseLocation] [nvarchar](10) NULL,
	[Currency] [nvarchar](10) NULL,
	[ExtraCode] [nvarchar](50) NULL,
	[ExtraCodeDesc] [nvarchar](50) NULL,
	[RevenueTypeCode] [nvarchar](50) NULL,
	[RevenueType] [nvarchar](50) NULL,
	[RevenueSubTypeCode] [nvarchar](50) NULL,
	[RevenueSubType] [nvarchar](50) NULL,
	[RevenueLine] [int] NULL,
	[RevenueLineDesc] [nvarchar](50) NULL,
	[RevenueGroupClub] [nvarchar](50) NULL,
	[RevenueGroupDesc] [nvarchar](50) NULL,
	[ClassCode] [nvarchar](10) NULL,
	[Class] [nvarchar](50) NULL,
	[ExtraNotes] [nvarchar](1000) NULL,
	[Origin] [nvarchar](10) NULL,
	[SalesCategoryCode] [nvarchar](10) NULL,
	[DepartAirport] [nvarchar](9) NULL,
	[ArrivalAirport] [nvarchar](9) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ST_MARINE_FLIGHTINVENTORY]    Script Date: 18/05/2018 09:45:17 ******/
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
	[BkgRef] [nvarchar](10) NULL,
	[i_SK_Pax] [bigint] NULL,
	[OptionDate] [smalldatetime] NULL,
	[ConfirmDate] [smalldatetime] NULL,
	[NoDays] [int] NULL,
	[FltType] [nvarchar](10) NULL,
	[FlightRef] [nvarchar](20) NULL,
	[FlightCd] [nvarchar](30) NULL,
	[Carrier] [nvarchar](6) NULL,
	[InOutFlag] [nvarchar](15) NULL,
	[SeatPrice] [numeric](16, 2) NULL,
	[ChildSeatPrice] [numeric](16, 2) NULL,
	[DepAirport] [nvarchar](9) NULL,
	[DepDate] [int] NULL,
	[DepTime] [int] NULL,
	[ArrAirport] [nvarchar](9) NULL,
	[ArrDate] [int] NULL,
	[ArrTime] [int] NULL,
	[Depno] [int] NULL,
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
	[HasAlternative] [nvarchar](6) NULL,
	[OnRequest] [nvarchar](15) NULL,
	[NeptuneManaged] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ST_MARINE_HOTEL]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ST_MARINE_HOTEL](
	[CLIENT_NO] [int] NOT NULL,
	[PASS_NO] [int] NOT NULL,
	[RefNo] [int] NULL,
	[HotelName] [nvarchar](50) NULL,
	[BaseCode] [nvarchar](25) NULL,
	[RoomNo] [nvarchar](50) NULL,
	[RoomTypeCode] [nvarchar](50) NULL,
	[HotelStartDate] [datetime] NULL,
	[HotelStartTime] [nvarchar](10) NULL,
	[HotelEndDate] [datetime] NULL,
	[HotelEndTime] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ST_MARINE_INSURANCE]    Script Date: 18/05/2018 09:45:17 ******/
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
	[CompanyNo] [nvarchar](25) NULL,
	[BkgRef] [nvarchar](10) NULL,
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
	[ItemAmountLocal] [numeric](9, 2) NULL,
	[TotalAmountLocal] [numeric](15, 2) NULL,
	[TotalAmountLocalForCancel] [numeric](15, 2) NULL,
	[LastAmendUser] [nvarchar](50) NULL,
	[BaseLocation] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ST_MARINE_PAX]    Script Date: 18/05/2018 09:45:17 ******/
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
	[PaxNo] [smallint] NULL,
	[PaxType] [varchar](3) NULL,
	[Surname] [nvarchar](50) NULL,
	[Title] [varchar](12) NULL,
	[Initials] [varchar](4) NULL,
	[Forename] [nvarchar](50) NULL,
	[MiddleName] [nvarchar](50) NULL,
	[Fullname] [nvarchar](100) NULL,
	[LeadNameFlag] [bit] NULL,
	[PaxSex] [varchar](1) NULL,
	[PaxAge] [varchar](3) NULL,
	[PaxDOB] [datetime] NULL,
	[PassportNumber] [nvarchar](40) NULL,
	[PassportExpiryDate] [datetime] NULL,
	[PassportIssuedCountry] [nvarchar](100) NULL,
	[Nationality] [nvarchar](25) NULL,
	[SailExperience] [nvarchar](20) NULL,
	[SkipperCrewIndicator] [nvarchar](20) NULL,
	[InsurancePolicy] [nvarchar](50) NULL,
	[InsurancePolicyStartDate] [datetime] NULL,
	[InsurancePolicyEndDate] [datetime] NULL,
	[Transfer] [nvarchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ST_MARINE_PAXACC]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ST_MARINE_PAXACC](
	[i_SK_Bkg] [bigint] NOT NULL,
	[i_SK_Pax] [bigint] NULL,
	[SourceSysID] [int] NULL,
	[BrandCode] [nvarchar](3) NULL,
	[HotelName] [nvarchar](50) NULL,
	[BaseCode] [nvarchar](25) NULL,
	[RoomNo] [nvarchar](50) NULL,
	[RoomTypeCode] [nvarchar](50) NULL,
	[HotelStartDate] [datetime] NULL,
	[HotelStartTime] [nvarchar](10) NULL,
	[HotelEndDate] [datetime] NULL,
	[HotelEndTime] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ST_MARINE_PAXBOAT]    Script Date: 18/05/2018 09:45:17 ******/
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
	[BaseLocation] [nvarchar](25) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ST_MARINE_PAXFLIGHT]    Script Date: 18/05/2018 09:45:17 ******/
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
/****** Object:  Table [dbo].[ST_MARINE_PAXFLIGHTDURATION]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ST_MARINE_PAXFLIGHTDURATION](
	[i_SK_Bkg] [bigint] NULL,
	[i_SK_Pax] [bigint] NOT NULL,
	[BkgRef] [nvarchar](10) NULL,
	[SourceSysID] [int] NULL,
	[FlightHolidayDuration] [int] NULL,
	[FlightNumber] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ST_MARINE_PAYMENT]    Script Date: 18/05/2018 09:45:17 ******/
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
	[SeasonCode] [nvarchar](3) NULL,
	[BkgRef] [nvarchar](10) NULL,
	[TagNo] [int] NULL,
	[EntryDate] [datetime] NULL,
	[PaymentMethodCode] [nvarchar](2) NULL,
	[PaymentMethod] [nvarchar](20) NULL,
	[PaymentDesc] [nvarchar](25) NULL,
	[PaymentRefundIndicator] [nvarchar](2) NULL,
	[BaseLocation] [nvarchar](20) NULL,
	[Language] [nvarchar](20) NULL,
	[User] [nvarchar](20) NULL,
	[BaseAmount] [numeric](15, 4) NULL,
	[AddedTime] [nvarchar](8) NULL,
	[CharterStartDate] [datetime] NULL,
	[Currency] [nvarchar](20) NULL,
	[CompanyNo] [nvarchar](25) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ST_MARINE_REMBOOK]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ST_MARINE_REMBOOK](
	[CompanyNo] [varchar](50) NULL,
	[InvoiceCo] [varchar](50) NULL,
	[Location] [varchar](20) NULL,
	[BookRef] [bigint] NULL,
	[MailNo] [varchar](10) NULL,
	[OptBook] [char](1) NULL,
	[DepartureDate] [datetime] NULL,
	[Fromcharterlocation] [varchar](50) NULL,
	[CharterTypeName] [varchar](25) NULL,
	[RemovedDate] [datetime] NULL,
	[AgencyKeyContactName] [varchar](40) NULL,
	[LastName] [varchar](40) NULL,
	[CompanyName] [varchar](40) NULL,
	[Add1] [varchar](40) NULL,
	[Add2] [varchar](40) NULL,
	[Add3] [varchar](40) NULL,
	[City] [varchar](40) NULL,
	[County] [varchar](40) NULL,
	[Postcode] [varchar](25) NULL,
	[Country] [varchar](40) NULL,
	[Nationality] [varchar](20) NULL,
	[SourceCode] [varchar](20) NULL,
	[NettTotal] [varchar](50) NULL,
	[VAT] [varchar](50) NULL,
	[AgentComm] [varchar](50) NULL,
	[Payments] [varchar](50) NULL,
	[QuoteExpiryDate] [datetime] NULL,
	[BookedBy] [varchar](10) NULL,
	[Title] [varchar](10) NULL,
	[FirstName] [varchar](40) NULL,
	[Surname] [varchar](40) NULL,
	[Phone1] [varchar](40) NULL,
	[Phone2] [varchar](40) NULL,
	[Phone3] [varchar](40) NULL,
	[Email1] [varchar](60) NULL,
	[BoatType] [varchar](50) NULL,
	[Tocharterlocation] [varchar](15) NULL,
	[Duration] [int] NULL,
	[EnquiryLanguage] [varchar](20) NULL,
	[Language] [varchar](20) NULL,
	[BookingDate] [datetime] NULL,
	[AgentOrDirectBooking] [varchar](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Index [IX_MARINE_REMBOOK_PK]    Script Date: 18/05/2018 09:45:17 ******/
CREATE UNIQUE CLUSTERED INDEX [IX_MARINE_REMBOOK_PK] ON [dbo].[ST_MARINE_REMBOOK]
(
	[BookRef] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ST_MARINE_SOLDPERWEEK]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ST_MARINE_SOLDPERWEEK](
	[i_BK_FLNUMB] [nvarchar](50) NULL,
	[i_BK_FLTY] [nvarchar](50) NULL,
	[ArrDate] [int] NULL,
	[ArrAirport] [nvarchar](9) NULL,
	[i_BK_LOCT] [nvarchar](25) NULL,
	[NoDays] [int] NULL,
	[Sold] [int] NULL,
	[SourceSysID] [int] NULL,
	[BrandCode] [nvarchar](3) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_NEPTUNE_ACCOMMODATION_NC]    Script Date: 18/05/2018 09:45:17 ******/
CREATE NONCLUSTERED INDEX [IX_NEPTUNE_ACCOMMODATION_NC] ON [dbo].[NEPTUNE_ACCOMMODATION]
(
	[ACCOMMODATION_NO] ASC,
	[ACCOMMODATION_TYPE_CODE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_NEPTUNE_AVAIL_NC]    Script Date: 18/05/2018 09:45:17 ******/
CREATE NONCLUSTERED INDEX [IX_NEPTUNE_AVAIL_NC] ON [dbo].[NEPTUNE_AVAIL]
(
	[COMPANY_NO] ASC,
	[ACCOMMODATION_NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [PRIMARY]
GO
/****** Object:  Index [IX_NEPTUNE_BOOK_2]    Script Date: 18/05/2018 09:45:17 ******/
CREATE NONCLUSTERED INDEX [IX_NEPTUNE_BOOK_2] ON [dbo].[NEPTUNE_BOOK]
(
	[MAIL_NO] ASC,
	[FAM_NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_NEPTUNE_FAMILY_2]    Script Date: 18/05/2018 09:45:17 ******/
CREATE NONCLUSTERED INDEX [IX_NEPTUNE_FAMILY_2] ON [dbo].[NEPTUNE_FAMILY]
(
	[F_mail_no] ASC,
	[F_leader] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_NEPTUNE_FLIGHT_REF_NC]    Script Date: 18/05/2018 09:45:17 ******/
CREATE NONCLUSTERED INDEX [IX_NEPTUNE_FLIGHT_REF_NC] ON [dbo].[NEPTUNE_FLIGHT_REF]
(
	[CLIENT_NO] ASC,
	[FLIGHTRENO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [PRIMARY]
GO
/****** Object:  Index [IX_NEPTUNE_PASS_2]    Script Date: 18/05/2018 09:45:17 ******/
CREATE NONCLUSTERED INDEX [IX_NEPTUNE_PASS_2] ON [dbo].[NEPTUNE_PASS]
(
	[MAIL_NO] ASC,
	[FAM_NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [PRIMARY]
GO
/****** Object:  Index [IX_NEPTUNE_PASSLINK_NC]    Script Date: 18/05/2018 09:45:17 ******/
CREATE NONCLUSTERED INDEX [IX_NEPTUNE_PASSLINK_NC] ON [dbo].[NEPTUNE_PASSLINK]
(
	[CLIENT_NO] ASC,
	[PASS_NO] ASC,
	[REF_NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_BK_NEPTUNE_SFT_ALLOCATION]    Script Date: 18/05/2018 09:45:17 ******/
CREATE NONCLUSTERED INDEX [IX_BK_NEPTUNE_SFT_ALLOCATION] ON [dbo].[NEPTUNE_SFT_ALLOCATION]
(
	[i_SK_InventoryDate] ASC,
	[i_BK_FLNUMB] ASC,
	[i_BK_FLTY] ASC,
	[i_BK_CNNB] ASC,
	[i_BK_CLNB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_MARINE_BOOKINGS_2]    Script Date: 18/05/2018 09:45:17 ******/
CREATE NONCLUSTERED INDEX [IX_MARINE_BOOKINGS_2] ON [dbo].[ST_MARINE_BOOKINGS]
(
	[BrandCode] ASC,
	[Status] ASC
)
INCLUDE ( 	[BookRef],
	[CancelledDate],
	[ConfirmDate],
	[TotalPax]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [NonClusteredIndex-ClientCode]    Script Date: 18/05/2018 09:45:17 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-ClientCode] ON [dbo].[ST_MARINE_CLIENT_PREFERENCE]
(
	[ClientCode] ASC
)
INCLUDE ( 	[CancelFromBrochure],
	[CancelFromMailing],
	[CancelFromEmail]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_MARINE_CLIENTS_2]    Script Date: 18/05/2018 09:45:17 ******/
CREATE NONCLUSTERED INDEX [IX_MARINE_CLIENTS_2] ON [dbo].[ST_MARINE_CLIENTS]
(
	[MailNo] ASC,
	[Deceased] ASC,
	[Lead] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_MARINE_FBKG_2]    Script Date: 18/05/2018 09:45:17 ******/
CREATE NONCLUSTERED INDEX [IX_MARINE_FBKG_2] ON [dbo].[ST_MARINE_FBKG]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ST_MARINE_PAX_NC_BKG_PAX]    Script Date: 18/05/2018 09:45:17 ******/
CREATE NONCLUSTERED INDEX [IX_ST_MARINE_PAX_NC_BKG_PAX] ON [dbo].[ST_MARINE_PAX]
(
	[BkgRef] ASC,
	[PaxNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ST_MARINE_PAXFLIGHT_CK]    Script Date: 18/05/2018 09:45:17 ******/
CREATE NONCLUSTERED INDEX [IX_ST_MARINE_PAXFLIGHT_CK] ON [dbo].[ST_MARINE_PAXFLIGHT]
(
	[i_SK_Bkg] ASC,
	[i_SK_Pax] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ST_MARINE_PAXFLIGHTDURATION]    Script Date: 18/05/2018 09:45:17 ******/
CREATE NONCLUSTERED INDEX [IX_ST_MARINE_PAXFLIGHTDURATION] ON [dbo].[ST_MARINE_PAXFLIGHTDURATION]
(
	[BkgRef] ASC,
	[FlightHolidayDuration] ASC,
	[FlightNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_MARINE_REMBOOK_2]    Script Date: 18/05/2018 09:45:17 ******/
CREATE NONCLUSTERED INDEX [IX_MARINE_REMBOOK_2] ON [dbo].[ST_MARINE_REMBOOK]
(
	[Email1] ASC
)
INCLUDE ( 	[CompanyNo],
	[RemovedDate]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[NEPTUNE_APEX_REVENUE_LINE] ADD  DEFAULT (NULL) FOR [SORT_ORDER]
GO
/****** Object:  StoredProcedure [dbo].[BUILD_NEPTUNE_SFT_ALLOCATION]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[BUILD_NEPTUNE_SFT_ALLOCATION]
AS

	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'NPTN','SFT_ALLOC','BUILD_NEPTUNE_SFT_ALLOCATION'

	TRUNCATE TABLE NEPTUNE_SFT_ALLOCATION

	-- Neptune inventory
	INSERT INTO
		NEPTUNE_SFT_ALLOCATION
	SELECT
		CONF_DT_CALENDAR.i_SK_Calendar,
		NEPTUNE_INVENTORY.i_SK_InventoryDate,
		0 AS i_SK_SaleDate,
		0 AS i_SK_BookedDate,
		0 AS i_SK_CancelDate,
		NULL AS i_BK_BookingStatus,
		NEPTUNE_ACCOMMODATION.ACCOMMODATION_NO AS i_BK_FLNUMB,
		NEPTUNE_ACCOMMODATION.ACCOMMODATION_TYPE_CODE AS i_BK_FLTY,
		0 AS i_BK_CNNB,
		0 AS i_BK_CLNB,
		NULL AS i_BK_AUTO,
		NEPTUNE_INVENTORY.i_BK_LOCT AS i_BK_LOCT,
		0 AS i_BK_FRLOCT,
		0 AS i_BK_TOLOCT,
		103 AS i_BK_SourceSysID,
		'Neptune',
		'M' AS	i_BK_DivisionCode,
		CASE WHEN NEPTUNE_INVENTORY.COMPANY_NO IN ('1','2') THEN 'SUN'
			 WHEN NEPTUNE_INVENTORY.COMPANY_NO = '5' THEN 'LBT' 
			 ELSE 'XXX' END AS i_BK_BrandCode,
		NEPTUNE_INVENTORY.COMPANY_NO AS i_BK_CompanyCode,
		CASE WHEN ACCESS = 0 THEN 1 ELSE 0 END AS AvailableAny,
		CASE WHEN ACCESS = 1 THEN 1 ELSE 0 END AS AvailableInHouse,
		CASE WHEN ACCESS = 4 THEN 1 ELSE 0 END AS AvailableAgentAndWeb,
		CASE 
			WHEN MON <> '' AND  CONF_DT_CALENDAR.a_DayOfWeek = 1 THEN 1
			WHEN TUE <> '' AND  CONF_DT_CALENDAR.a_DayOfWeek = 2 THEN 1 
			WHEN WED <> '' AND  CONF_DT_CALENDAR.a_DayOfWeek = 3 THEN 1 
			WHEN THU <> '' AND  CONF_DT_CALENDAR.a_DayOfWeek = 4 THEN 1 
			WHEN FRI <> '' AND  CONF_DT_CALENDAR.a_DayOfWeek = 5 THEN 1 
			WHEN SAT <> '' AND  CONF_DT_CALENDAR.a_DayOfWeek = 6 THEN 1 
			WHEN SUN <> '' AND  CONF_DT_CALENDAR.a_DayOfWeek = 7 THEN 1 
			ELSE 0 END AS PickUpDay 	 
	FROM
		AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR
	CROSS JOIN
		(
		SELECT 
			ACCOMMODATION_NO,
			ACCOMMODATION_TYPE_CODE 
		FROM 
			NEPTUNE_Stage.dbo.NEPTUNE_ACCOMMODATION NEPTUNE_ACCOMMODATION
		WHERE 
			NEPTUNE_ACCOMMODATION.YACHT_ROOM_IND = 'R'
		)NEPTUNE_ACCOMMODATION
	INNER JOIN
		(					
		SELECT
			CONF_DT_CALENDAR.i_SK_Calendar AS i_SK_InventoryDate,
			ACCOMMODATION_NO,
			COMPANY_NO,
			CONVERT(INT,CONVERT(VARCHAR(8),CONVERT(DATETIME,NEPTUNE_Stage.dbo.fn_Checkdate(CONVERT(INT,SUBSTRING(STARTDATE,7,4)+SUBSTRING(STARTDATE,4,2)+SUBSTRING(STARTDATE,1,2)))),112)) AS StartDate,
			CONVERT(INT,CONVERT(VARCHAR(8),DATEADD(d,-1,CONVERT(DATETIME,NEPTUNE_Stage.dbo.fn_Checkdate(CONVERT(INT,SUBSTRING(ENDDATE,7,4)+SUBSTRING(ENDDATE,4,2)+SUBSTRING(ENDDATE,1,2))))),112)) AS EndDate,
			BASE AS i_BK_LOCT,
			ACCESS,
			MON,
			TUE,
			WED,
			THU,
			FRI,
			SAT,
			SUN
		FROM
			NEPTUNE_Stage.dbo.NEPTUNE_AVAIL NEPTUNE_AVAIL
		INNER JOIN
				AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR
				ON
					CONF_DT_CALENDAR.i_SK_Calendar BETWEEN 
													CONVERT(INT,CONVERT(VARCHAR(8),CONVERT(DATETIME,NEPTUNE_Stage.dbo.fn_Checkdate(CONVERT(INT,SUBSTRING(STARTDATE,7,4)+SUBSTRING(STARTDATE,4,2)+SUBSTRING(STARTDATE,1,2)))),112))
													AND 
													CONVERT(INT,CONVERT(VARCHAR(8),DATEADD(d,-1,CONVERT(DATETIME,NEPTUNE_Stage.dbo.fn_Checkdate(CONVERT(INT,SUBSTRING(ENDDATE,7,4)+SUBSTRING(ENDDATE,4,2)+SUBSTRING(ENDDATE,1,2))))),112))
	) NEPTUNE_INVENTORY
		ON
			NEPTUNE_INVENTORY.i_SK_InventoryDate=CONF_DT_CALENDAR.i_SK_Calendar
			AND
			NEPTUNE_INVENTORY.ACCOMMODATION_NO=NEPTUNE_ACCOMMODATION.ACCOMMODATION_NO
	WHERE
		NEPTUNE_INVENTORY.i_SK_InventoryDate IS NOT NULL
		AND
		NEPTUNE_INVENTORY.COMPANY_NO IN ('1','2','5')
		AND
		NEPTUNE_INVENTORY.i_SK_InventoryDate>20100101
	

	 INSERT INTO
		NEPTUNE_SFT_ALLOCATION		 			
	 SELECT
		CONF_DT_CALENDAR.i_SK_Calendar,
		0 AS i_SK_InventoryDate,
		NEPTUNE_SALES.i_SK_SaleDate,
		NEPTUNE_SALES.i_SK_BookedDate,
		NEPTUNE_SALES.i_SK_CancelDate,
		NEPTUNE_SALES.i_BK_BookingStatus,
		NEPTUNE_SALES.i_BK_FLNUMB AS i_BK_FLNUMB,
		NEPTUNE_SALES.i_BK_FLTY AS i_BK_FLTY,
		NEPTUNE_SALES.CLIENT_NO AS i_BK_CNNB,
		NEPTUNE_SALES.MAIL_NO AS i_BK_CLNB,
		NULL AS i_BK_AUTO,
		NEPTUNE_SALES.i_BK_LOCT AS i_BK_LOCT,
		NEPTUNE_SALES.i_BK_LOCT AS i_BK_FRLOCT,
		NEPTUNE_SALES.i_BK_TOLOCT AS i_BK_TOLOCT,
		103 AS i_BK_SourceSysID,
		'Neptune',
		'M' AS	i_BK_DivisionCode,
		i_BK_BrandCode AS i_BK_BrandCode,
		i_BK_CompanyCode,
		0 AS AvailableAny,
		0 AS AvailableInHouse,
		0 AS AvailableAgentAndWeb,
		0 AS PickUpDay 
	FROM
		AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR
	LEFT JOIN
		(
			SELECT 
				CONF_DT_CALENDAR.i_SK_Calendar AS i_SK_SaleDate,
				CONF_DT_CALENDAR_BOOKED.i_SK_Calendar AS i_SK_BookedDate,
				CONF_DT_CALENDAR_CANCEL.i_SK_Calendar AS i_SK_CancelDate,
				CASE
				WHEN NEPTUNE_BOOK.I5_CONTRACT_NO = '' THEN
					CASE
						WHEN NEPTUNE_BOOK.OPT_BOOK = 'C' THEN 3
						WHEN NEPTUNE_BOOK.OPT_BOOK = 'X' THEN 8
						ELSE 1 
					END	
				WHEN SUNSAIL_ST_CNMST.CNNUMB IS NOT NULL AND NEPTUNE_BOOK.COMPANY_CODE IN ('2','5')THEN
					CASE
						WHEN NEPTUNE_BOOK.OPT_BOOK = 'C' THEN 3
						WHEN NEPTUNE_BOOK.OPT_BOOK = 'X' THEN 8
						ELSE 1 
					END
				WHEN  NEPTUNE_XREF.I5_CONTRACT = 0 THEN
					CASE
						WHEN NEPTUNE_BOOK.OPT_BOOK = 'C' THEN 3
						WHEN NEPTUNE_BOOK.OPT_BOOK = 'X' THEN 8
						ELSE 1 
					END
				ELSE
					CASE
						WHEN NEPTUNE_BOOK.OPT_BOOK = 'C' THEN 18
						WHEN NEPTUNE_BOOK.OPT_BOOK = 'X' THEN 19
						ELSE 17
					END
			END AS i_BK_BookingStatus,
			CASE WHEN NEPTUNE_BOOK.COMPANY_CODE IN ('1','2') THEN 'SUN'
				WHEN NEPTUNE_BOOK.COMPANY_CODE = '5' THEN 'LBT' 
				ELSE 'XXX' END AS i_BK_BrandCode,
			NEPTUNE_BOOK.COMPANY_CODE AS i_BK_CompanyCode,
			NEPTUNE_BOOK.CLIENT_NO,
			NEPTUNE_BOOK.MAIL_NO,
			NEPTUNE_ACCOMMODATION.ACCOMMODATION_NO AS i_BK_FLNUMB,
			NEPTUNE_ACCOMMODATION.ACCOMMODATION_TYPE_CODE AS i_BK_FLTY,
			NEPTUNE_BOOK.BASE_CODE AS i_BK_LOCT,
			NEPTUNE_BOOK.BASE_CODE AS i_BK_FRLOCT,
			NEPTUNE_BOOK.BASE_CODE AS i_BK_TOLOCT
		FROM
			NEPTUNE_Stage.dbo.NEPTUNE_BOOK NEPTUNE_BOOK 
		INNER JOIN
			NEPTUNE_Stage.dbo.NEPTUNE_ACCOMMODATION_REF NEPTUNE_ACCOMMODATION_REF
			ON
				NEPTUNE_BOOK.CLIENT_NO = NEPTUNE_ACCOMMODATION_REF.CLIENT_NO
		INNER JOIN
			NEPTUNE_Stage.dbo.NEPTUNE_ACCOMMODATION NEPTUNE_ACCOMMODATION
			ON
				NEPTUNE_ACCOMMODATION.ACCOMMODATION_NO=NEPTUNE_ACCOMMODATION_REF.ACCOMMODATION_NO		
		INNER JOIN
			AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR
			ON
				CONF_DT_CALENDAR.i_SK_Calendar BETWEEN
												CONVERT(INT,CONVERT(VARCHAR(8),CONVERT(DATETIME,NEPTUNE_Stage.dbo.fn_Checkdate(CONVERT(INT,SUBSTRING(NEPTUNE_ACCOMMODATION_REF.START_DATE,7,4)+SUBSTRING(NEPTUNE_ACCOMMODATION_REF.START_DATE,4,2)+SUBSTRING(NEPTUNE_ACCOMMODATION_REF.START_DATE,1,2)))),112))
												AND
												CONVERT(INT,CONVERT(VARCHAR(8),DATEADD(d,-1,CONVERT(DATETIME,NEPTUNE_Stage.dbo.fn_Checkdate(CONVERT(INT,SUBSTRING(NEPTUNE_ACCOMMODATION_REF.END_DATE,7,4)+SUBSTRING(NEPTUNE_ACCOMMODATION_REF.END_DATE,4,2)+SUBSTRING(NEPTUNE_ACCOMMODATION_REF.END_DATE,1,2))))),112))
		LEFT JOIN
				AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_BOOKED
				ON
					CONF_DT_CALENDAR_BOOKED.i_SK_Calendar = CONVERT(INT,CONVERT(VARCHAR(8),CONVERT(DATETIME,NEPTUNE_Stage.dbo.fn_Checkdate(CONVERT(INT,SUBSTRING(CONF_DATE,7,4)+SUBSTRING(CONF_DATE,4,2)+SUBSTRING(CONF_DATE,1,2)))),112))
		LEFT JOIN
			AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR_CANCEL
			ON
				CONF_DT_CALENDAR_CANCEL.i_SK_Calendar = 
					CASE WHEN NEPTUNE_BOOK.OPT_BOOK = 'X' THEN 
						CASE WHEN CANX_DATE <> '' THEN 
							CONVERT(INT,CONVERT(VARCHAR(8),CONVERT(DATETIME,NEPTUNE_Stage.dbo.fn_Checkdate(CONVERT(INT,SUBSTRING(CANX_DATE,7,4)+SUBSTRING(CANX_DATE,4,2)+SUBSTRING(CANX_DATE,1,2)))),112)) 
						ELSE
							CONVERT(INT,CONVERT(VARCHAR(8),CONVERT(DATETIME,NEPTUNE_Stage.dbo.fn_Checkdate(CONVERT(INT,SUBSTRING(CONF_DATE,7,4)+SUBSTRING(CONF_DATE,4,2)+SUBSTRING(CONF_DATE,1,2)))),112))
						END
					END 
		LEFT JOIN 
			TRITON_Stage.dbo.SUNSAIL_ST_CNMST SUNSAIL_ST_CNMST
			ON
				SUNSAIL_ST_CNMST.CNNUMB = NEPTUNE_BOOK.I5_CONTRACT_NO
		LEFT JOIN 
			NEPTUNE_Stage.dbo.NEPTUNE_XREF NEPTUNE_XREF
			ON
				NEPTUNE_BOOK.CLIENT_NO = NEPTUNE_XREF.BOOK_CLIENT_NO 
		WHERE 
				NEPTUNE_ACCOMMODATION.YACHT_ROOM_IND = 'R'
				AND
				CONVERT(DATETIME,NEPTUNE_Stage.dbo.fn_Checkdate(CONVERT(INT,SUBSTRING(NEPTUNE_BOOK.START_DATE,7,4)+SUBSTRING(NEPTUNE_BOOK.START_DATE,4,2)+SUBSTRING(NEPTUNE_BOOK.START_DATE,1,2)))) >= '2010-01-01'	
		)NEPTUNE_SALES
		ON
			NEPTUNE_SALES.i_SK_SaleDate=CONF_DT_CALENDAR.i_SK_Calendar
	WHERE
		NEPTUNE_SALES.i_SK_SaleDate IS NOT NULL
		AND
		i_BK_CompanyCode IN ('1','2','5')
		AND 
		NEPTUNE_SALES.i_SK_SaleDate>20100101
			
	
EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'NPTN','SFT_ALLOC'		
GO
/****** Object:  StoredProcedure [dbo].[BUILD_ST_MARINE_ACCOMBOAT]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[BUILD_ST_MARINE_ACCOMBOAT]
AS

	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'NPTN','ST_ACCBT','BUILD_ST_MARINE_ACCOMBOAT'

	TRUNCATE TABLE ST_MARINE_ACCOMBOAT
	

	INSERT INTO 
		ST_MARINE_ACCOMBOAT	
	SELECT 
		    NEPTUNE_ACCOMMODATION_REF.CLIENT_NO AS CLIENT_NO,
		    NEPTUNE_PASS.PASS_NO AS PASS_NO,
			NEPTUNE_ACCOMMODATION.ACCOMODATION_NAME AS Boat,
			NEPTUNE_ACCOMMODATION.ACCOMMODATION_TYPE_DESC AS BoatType,
			CONVERT(DATETIME,NEPTUNE_Stage.dbo.fn_Checkdate(CONVERT(INT,SUBSTRING(NEPTUNE_ACCOMMODATION_REF.START_DATE,7,4)+SUBSTRING(NEPTUNE_ACCOMMODATION_REF.START_DATE,4,2)+SUBSTRING(NEPTUNE_ACCOMMODATION_REF.START_DATE,1,2)))) AS CharterStartDate,
			NEPTUNE_ACCOMMODATION_REF.START_TIME AS CharterStartTime,
			CONVERT(DATETIME,NEPTUNE_Stage.dbo.fn_Checkdate(CONVERT(INT,SUBSTRING(NEPTUNE_ACCOMMODATION_REF.END_DATE,7,4)+SUBSTRING(NEPTUNE_ACCOMMODATION_REF.END_DATE,4,2)+SUBSTRING(NEPTUNE_ACCOMMODATION_REF.END_DATE,1,2)))) AS CharterEndDate,
			NEPTUNE_ACCOMMODATION_REF.END_TIME AS CharterEndTime
		FROM
			NEPTUNE_Stage.dbo.NEPTUNE_ACCOMMODATION_REF NEPTUNE_ACCOMMODATION_REF
		INNER JOIN
			NEPTUNE_Stage.dbo.NEPTUNE_ACCOMMODATION
			ON
				NEPTUNE_ACCOMMODATION.ACCOMMODATION_NO=NEPTUNE_ACCOMMODATION_REF.ACCOMMODATION_NO
				AND
				NEPTUNE_ACCOMMODATION.SUNSAIL_NO<>0
				AND
				NEPTUNE_ACCOMMODATION.YACHT_ROOM_IND='Y'
		INNER JOIN
			NEPTUNE_Stage.dbo.NEPTUNE_APEX_ACCOM_TYPE NEPTUNE_APEX_ACCOM_TYPE
			ON
				NEPTUNE_APEX_ACCOM_TYPE.ACCOMMODATION_TYPE_DESC = NEPTUNE_ACCOMMODATION.ACCOMMODATION_TYPE_DESC
		INNER JOIN
			NEPTUNE_Stage.dbo.NEPTUNE_APEX_ACCOM_TYPE_GROUP NEPTUNE_APEX_ACCOM_TYPE_GROUP
			ON
				NEPTUNE_APEX_ACCOM_TYPE_GROUP.ACCOM_TYPE_GROUP_CODE = NEPTUNE_APEX_ACCOM_TYPE.ACCOM_TYPE_GROUP_CODE
		LEFT JOIN 
			NEPTUNE_Stage.dbo.NEPTUNE_PASS NEPTUNE_PASS
			ON
				NEPTUNE_PASS.CLIENT_NO = NEPTUNE_ACCOMMODATION_REF.CLIENT_NO
		INNER JOIN 
			NEPTUNE_Stage.dbo.NEPTUNE_PASSLINK  NEPTUNE_PASSLINK
			ON
				NEPTUNE_PASSLINK.CLIENT_NO = NEPTUNE_ACCOMMODATION_REF.CLIENT_NO
				AND
				NEPTUNE_PASSLINK.REF_NO = NEPTUNE_ACCOMMODATION_REF.ACCOMRENO	
				AND
				NEPTUNE_PASSLINK.PASS_NO =NEPTUNE_PASS.PASS_NO
		WHERE 
			ACCOM_CLASS IN ('Boats','Catamaran','Monohull','Powercat','Sunsail 40')
			
	EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'NPTN','ST_ACCBT'
			
			
	
GO
/****** Object:  StoredProcedure [dbo].[BUILD_ST_MARINE_AVAILABLEPORTS]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[BUILD_ST_MARINE_AVAILABLEPORTS]
AS

	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'NPTN','ST_AVPORTS','BUILD_ST_MARINE_AVAILABLEPORTS'	
	
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
			
	EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'NPTN','ST_AVPORTS'

GO
/****** Object:  StoredProcedure [dbo].[BUILD_ST_MARINE_AVAILPERWEEK]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[BUILD_ST_MARINE_AVAILPERWEEK]
AS

BEGIN


	EXEC  AMI_Galaxy.dbo.AMI_LOG_OPEN 'NPTN','ST_AVWEEKLY','BUILD_ST_MARINE_AVAILPERWEEK'
	
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

     EXEC  AMI_Galaxy.dbo.AMI_LOG_CLOSE 'NPTN','ST_AVWEEKLY'
     
 END
  
GO
/****** Object:  StoredProcedure [dbo].[BUILD_ST_MARINE_BEDSTOSEATS]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[BUILD_ST_MARINE_BEDSTOSEATS]
AS

BEGIN


	EXEC  AMI_Galaxy.dbo.AMI_LOG_OPEN 'NPTN','ST_B2S','BUILD_ST_MARINE_BEDSTOSEATS'
	
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
			
	EXEC  AMI_Galaxy.dbo.AMI_LOG_CLOSE 'NPTN','ST_B2S'
	
END
	
GO
/****** Object:  StoredProcedure [dbo].[BUILD_ST_MARINE_BOATAVAILABILITY]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[BUILD_ST_MARINE_BOATAVAILABILITY]
AS

	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'NPTN','ST_AVAIL','BUILD_ST_MARINE_BOATAVAILABILITY'

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
			NEPTUNE_SFT_ALLOCATION.i_BK_FLNUMB,
			NEPTUNE_SFT_ALLOCATION.i_BK_FLTY,
			NEPTUNE_SFT_ALLOCATION.i_BK_LOCT,
			NEPTUNE_SFT_ALLOCATION.i_SK_InventoryDate,
			MIN(CONTIGUOUS_ALLOCATION.i_SK_InventoryDate) AS i_SK_LastContiguousInventoryDate,
			NEPTUNE_SFT_ALLOCATION.I_BK_SourceSysID,
			NEPTUNE_SFT_ALLOCATION.i_BK_BrandCode
		FROM
			NEPTUNE_SFT_ALLOCATION
		LEFT JOIN
			(
				SELECT
					  NEPTUNE_SFT_ALLOCATION.i_BK_FLNUMB,
					  NEPTUNE_SFT_ALLOCATION.i_BK_FLTY,
					  NEPTUNE_SFT_ALLOCATION.i_BK_LOCT,
					  NEPTUNE_SFT_ALLOCATION.i_SK_InventoryDate,
					  CASE WHEN SFT_ALLOCATION_NEXT_DAY.i_SK_InventoryDate IS NOT NULL THEN 'Y' ELSE 'N' END AS NextDayRecordAvailable,
					  NEPTUNE_SFT_ALLOCATION.I_BK_SourceSysID,
					  NEPTUNE_SFT_ALLOCATION.i_BK_BrandCode
				FROM
					  NEPTUNE_SFT_ALLOCATION
				LEFT JOIN
					  AMI_Galaxy.dbo.CONF_DT_CALENDAR TODAY_DT_CALENDAR
					  ON
							TODAY_DT_CALENDAR.i_SK_Calendar=NEPTUNE_SFT_ALLOCATION.i_SK_InventoryDate
				LEFT JOIN
					  AMI_Galaxy.dbo.CONF_DT_CALENDAR TOMORROW_DT_CALENDAR
					  ON
							TOMORROW_DT_CALENDAR.a_Date=TODAY_DT_CALENDAR.a_Date+1
				LEFT JOIN
					  NEPTUNE_SFT_ALLOCATION SFT_ALLOCATION_NEXT_DAY
					  ON
							SFT_ALLOCATION_NEXT_DAY.i_BK_FLNUMB=NEPTUNE_SFT_ALLOCATION.i_BK_FLNUMB
							AND
							SFT_ALLOCATION_NEXT_DAY.i_BK_FLTY=NEPTUNE_SFT_ALLOCATION.i_BK_FLTY
							AND
							SFT_ALLOCATION_NEXT_DAY.i_BK_LOCT=NEPTUNE_SFT_ALLOCATION.i_BK_LOCT
							AND
							SFT_ALLOCATION_NEXT_DAY.i_SK_InventoryDate=TOMORROW_DT_CALENDAR.i_SK_Calendar
							AND
							SFT_ALLOCATION_NEXT_DAY.I_BK_SourceSysID=NEPTUNE_SFT_ALLOCATION.I_BK_SourceSysID
							AND
							SFT_ALLOCATION_NEXT_DAY.i_BK_BrandCode=NEPTUNE_SFT_ALLOCATION.i_BK_BrandCode
				WHERE
					  --NEPTUNE_SFT_ALLOCATION.i_SK_InventoryDate> CONVERT(INT,CONVERT(VARCHAR(8),DATEADD(d,-60,GETDATE()),112))
					  NEPTUNE_SFT_ALLOCATION.i_SK_InventoryDate > 20131101
			) CONTIGUOUS_ALLOCATION
			ON
				CONTIGUOUS_ALLOCATION.i_BK_FLNUMB=NEPTUNE_SFT_ALLOCATION.i_BK_FLNUMB
				AND
				CONTIGUOUS_ALLOCATION.i_BK_FLTY=NEPTUNE_SFT_ALLOCATION.i_BK_FLTY
				AND
				CONTIGUOUS_ALLOCATION.i_BK_LOCT=NEPTUNE_SFT_ALLOCATION.i_BK_LOCT
				AND
				CONTIGUOUS_ALLOCATION.i_SK_InventoryDate>=NEPTUNE_SFT_ALLOCATION.i_SK_InventoryDate
				AND
				CONTIGUOUS_ALLOCATION.NextDayRecordAvailable='N'
		WHERE
			--NEPTUNE_SFT_ALLOCATION.i_SK_InventoryDate> CONVERT(INT,CONVERT(VARCHAR(8),DATEADD(d,-60,GETDATE()),112))
			 NEPTUNE_SFT_ALLOCATION.i_SK_InventoryDate > 20131101
		GROUP BY
			NEPTUNE_SFT_ALLOCATION.i_BK_FLNUMB,
			NEPTUNE_SFT_ALLOCATION.i_BK_FLTY,
			NEPTUNE_SFT_ALLOCATION.i_BK_LOCT,
			NEPTUNE_SFT_ALLOCATION.i_SK_InventoryDate,
			NEPTUNE_SFT_ALLOCATION.I_BK_SourceSysID,
			NEPTUNE_SFT_ALLOCATION.i_BK_BrandCode
      ) CONTIGUOUS_ALLOCATION
	GROUP BY
		CONTIGUOUS_ALLOCATION.i_BK_FLNUMB,
		CONTIGUOUS_ALLOCATION.i_BK_FLTY,
		CONTIGUOUS_ALLOCATION.i_BK_LOCT,
		CONTIGUOUS_ALLOCATION.i_SK_LastContiguousInventoryDate,
		CONTIGUOUS_ALLOCATION.I_BK_SourceSysID,
		CONTIGUOUS_ALLOCATION.i_BK_BrandCode
		
	EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'NPTN','ST_AVAIL'
GO
/****** Object:  StoredProcedure [dbo].[BUILD_ST_MARINE_BOOKING_LEAD]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--========================================================================================================================
-- Procedure Date - Procedure Description
-- 26-Sep-2017      BUILD_ST_MARINE_BOOKING_LEAD - Loads data into table ST_MARINE_BOOKING_LEAD
--
--========================================================================================================================
-- Change History===
--========================================================================================================================
-- Date             Version     Who                Comment
-- 26-Sep-2017      1.0         Tim Wilson         New SP
--
--========================================================================================================================

CREATE PROCEDURE [dbo].[BUILD_ST_MARINE_BOOKING_LEAD] AS
BEGIN
    EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'NPTN','ST_MAR_BKGLEAD','BUILD_ST_MARINE_BOOKING_LEAD'

    TRUNCATE TABLE 
        ST_MARINE_BOOKING_LEAD
    
    INSERT INTO 
        ST_MARINE_BOOKING_LEAD
    
    SELECT DISTINCT  
         'NPT-'+cast(ST_MARINE_FBKG.bkgref as varchar(25)) Source_Key
        ,ST_MARINE_FBKG.bkgref                             BookRef
        ,ST_MARINE_FBKG.ClientNo                           ClientCode
        ,ST_MARINE_FBKG.DirectAgent                        BookingType
        ,ST_MARINE_FBKG.optionUser                         BookedBy
        ,ST_MARINE_FBKG.BkgSrcCd                           BookingSourcePrimary
		,ST_MARINE_FBKG.ConfirmDate                        BookingDate
        ,ST_MARINE_FBKG.CancelDate                         CancelledDate
        ,ST_MARINE_FBKG.DepartureDate
        ,ST_MARINE_FBKG.ConfirmDate
        ,CASE
            WHEN ST_MARINE_FBKG.BookingStatusID IN(3,18) THEN 'Confirmed'
            WHEN ST_MARINE_FBKG.BookingStatusID IN(8,19) THEN 'Cancelled'
            WHEN ST_MARINE_FBKG.BookingStatusID IN(1,17) THEN 'N/A'
        END AS                                             [Status]
        ,ST_MARINE_FBKG.PaxNo                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          TotalPax
        ,ST_MARINE_FBKG.HolidayDuration                    Duration
        ,ST_MARINE_FBKG.Currency                           CurrencyCode
        ,ST_MARINE_FBKG.BkgLocation                        BookingOfficeLocation
        ,NEPTUNE_ORIGIN.Lang                               BookingLanguage
		
        ,ST_MARINE_FBKG.PackageDesc                        CharterTypeName
        ,ST_MARINE_FBKG.Package                            CharterTypecode
        ,CASE    
            WHEN ST_MARINE_FBKG.Brandcode='SUN' THEN 'SUNSAIL'
            WHEN ST_MARINE_FBKG.Brandcode='LBT' THEN 'LEBOAT'
            ELSE 'XXX'
        END AS                                             BrandName
        ,ST_MARINE_FBKG.BrandCode
        ,'??'                                              Productname
        ,ST_MARINE_FBKG.ProductCode
        ,NEPTUNE_BOOK.F_CONTACT_URN
        ,NEPTUNE_MAIL_CONTACT.F_title                      Title
        ,NEPTUNE_MAIL_CONTACT.F_forename                   FirstName
        ,NEPTUNE_MAIL_CONTACT.F_surname                    LastName
        -- ,NEPTUNE_FAMILY.F_DOB                              DateofBirth
        ,CASE
            WHEN ISNULL(NEPTUNE_FAMILY.F_DOB, '') = '' THEN NULL
            ELSE CONVERT(datetime,dbo.fn_CheckDate(SUBSTRING(NEPTUNE_FAMILY.F_DOB,7,4) + SUBSTRING(NEPTUNE_FAMILY.F_DOB,4,2) + SUBSTRING(NEPTUNE_FAMILY.F_DOB,1,2)),103)
         END AS DateofBirth
        ,NEPTUNE_FAMILY.F_citizen                          Nationality
        ,CASE
		    WHEN NEPTUNE_FAMILY.F_URN IS NOT NULL THEN NEPTUNE_ORIGIN.LANG
			ELSE NULL
		 END AS                                            [Language]
        ,NEPTUNE_MAIL_CONTACT.F_addr1                      Add1
        ,NEPTUNE_MAIL_CONTACT.F_addr2                      Add2
        ,NEPTUNE_MAIL_CONTACT.F_addr3                      Add3
        ,NEPTUNE_MAIL_CONTACT.F_town                       City
        ,NEPTUNE_MAIL_CONTACT.F_county                     County
        ,NEPTUNE_MAIL_CONTACT.F_post_code                  PostCode
        ,NEPTUNE_MAIL_CONTACT.F_country                    Country
        ,NEPTUNE_MAIL_CONTACT.F_client_type                ClientType
        ,NEPTUNE_MAIL_CONTACT.F_tel1_no                    Phone1
        ,NEPTUNE_MAIL_CONTACT.F_tel2_no                    Phone2
        ,NEPTUNE_MAIL_CONTACT.F_tel3_no                    MobilePhone
        ,NEPTUNE_MAIL_CONTACT.F_mail_no                    MailNo
        ,NEPTUNE_MAIL_CONTACT.F_email                      Email
        ,CASE
		    WHEN NEPTUNE_FAMILY.F_URN IS NOT NULL THEN 'N' 
			ELSE NULL
		 END AS                                            Blacklisted  -- Updated below
        ,CASE
		    WHEN NEPTUNE_FAMILY.F_URN IS NOT NULL THEN 'N' 
			ELSE NULL
		 END AS                                            Deceased  -- Updated below
        ,CASE
		    WHEN NEPTUNE_FAMILY.F_URN IS NOT NULL THEN 'N' 
			ELSE NULL
		 END AS                                            Goneaway  -- Updated below
        ,CASE
            WHEN NEPTUNE_FAMILY.F_URN IS NOT NULL AND NEPTUNE_FAMILY.F_leader='TRUE' THEN 'Yes'
            WHEN NEPTUNE_FAMILY.F_URN IS NOT NULL AND NEPTUNE_FAMILY.F_leader!='TRUE' THEN 'No'
			ELSE NULL
		 END AS                                            Lead
    FROM 
        NEPTUNE_Stage.dbo.ST_MARINE_FBKG    ST_MARINE_FBKG
    LEFT JOIN
        NEPTUNE_Stage.dbo.NEPTUNE_BOOK    NEPTUNE_BOOK
        ON
            ST_MARINE_FBKG.bkgref=NEPTUNE_BOOK.CLIENT_NO
    LEFT JOIN
        NEPTUNE_Stage.dbo.NEPTUNE_FAMILY    NEPTUNE_FAMILY
        ON
            NEPTUNE_BOOK.F_CONTACT_URN=NEPTUNE_FAMILY.F_URN
			AND
			NEPTUNE_BOOK.F_CONTACT_URN != 0
    LEFT JOIN
        NEPTUNE_Stage.dbo.NEPTUNE_ORIGIN    NEPTUNE_ORIGIN
        ON
            NEPTUNE_BOOK.LANGUAGE=NEPTUNE_ORIGIN.ORIGIN
    LEFT OUTER JOIN
        NEPTUNE_Stage.dbo.NEPTUNE_MAIL_CONTACT    NEPTUNE_MAIL_CONTACT 
        ON 
            NEPTUNE_FAMILY.F_mail_no = NEPTUNE_MAIL_CONTACT.F_mail_no
    ORDER BY 
        bkgref
		
    UPDATE ST_MARINE_BOOKING_LEAD    
        SET 
            Blacklisted='Y'
        FROM 
            ST_MARINE_BOOKING_LEAD
        INNER JOIN
            NEPTUNE_MAIL_CONTACT
            ON
                CLIENTCODE=F_mail_no
        WHERE 
            F_client_category='Z'
			AND
			Blacklisted IS NOT NULL
        
    UPDATE ST_MARINE_BOOKING_LEAD
        SET 
            Deceased='Y'
        FROM 
            ST_MARINE_BOOKING_LEAD
        INNER JOIN
            NEPTUNE_MAIL_CONTACT
            ON
                CLIENTCODE=F_mail_no
        WHERE 
            F_client_category='x'
			AND
			Deceased IS NOT NULL

    UPDATE ST_MARINE_BOOKING_LEAD
        SET 
            Goneaway='Y'
        FROM 
            ST_MARINE_BOOKING_LEAD
        INNER JOIN
            NEPTUNE_MAIL_CONTACT
            ON
                CLIENTCODE=F_mail_no
        WHERE 
            F_client_category='GAS'
  			AND
			Goneaway IS NOT NULL
  
    EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'NPTN','ST_MAR_BKGLEAD'
END
GO
/****** Object:  StoredProcedure [dbo].[BUILD_ST_MARINE_BOOKINGITEMS]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[BUILD_ST_MARINE_BOOKINGITEMS]
AS

BEGIN


	EXEC  AMI_Galaxy.dbo.AMI_LOG_OPEN 'NPTN','ST_BKGITEMS','BUILD_ST_MARINE_BOOKINGITEMS'
			
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
	
	EXEC  AMI_Galaxy.dbo.AMI_LOG_CLOSE 'NPTN','ST_BKGITEMS'	
END
	
	
		
				
				
		


GO
/****** Object:  StoredProcedure [dbo].[BUILD_ST_MARINE_BOOKINGS]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--========================================================================================================================
-- Procedure Date - Procedure Description
-- 22-Feb-2017      BUILD_ST_MARINE_BOOKINGS - Loads Bookings feed data into table ST_MARINE_BOOKINGS
--
--========================================================================================================================
-- Change History===
--========================================================================================================================
-- Date             Version     Who                Comment
--                  1.0                            Original Version    
-- 25-Sep-2017      1.1         Tim Wilson         Add new column F_CONTACT_URN (DWYT-5)
--========================================================================================================================

CREATE PROCEDURE [dbo].[BUILD_ST_MARINE_BOOKINGS] AS
BEGIN
    EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'NPTN','ST_MAR_BKG','BUILD_ST_MARINE_BOOKINGS'

    TRUNCATE TABLE 
        ST_MARINE_BOOKINGS
    
    INSERT INTO 
        ST_MARINE_BOOKINGS
    
    SELECT DISTINCT  
        'NPT-'+ cast(bkgref as varchar(25)) Source_Key,
        bkgref                  BookRef,
        ClientNo                ClientCode,
        DirectAgent             [BookingType],
        optionUser              BookedBy,
        BkgSrcCd                BookingSourcePrimary,
        ConfirmDate             BookingDate,
        CancelDate              CancelledDate,
        DepartureDate,
        ConfirmDate,
        CASE
        WHEN BookingStatusID IN(3,18)    THEN 'Confirmed'
        WHEN BookingStatusID IN(8,19)    THEN 'Cancelled'
        WHEN BookingStatusID IN(1,17)    THEN 'N/A'
        END AS                  [Status],
        PaxNo                   TotalPax,
        HolidayDuration         Duration,
        Currency                CurrencyCode,
        BkgLocation             BookingOfficeLocation,
        Lang                    BookingLanguage,
        PackageDesc             CharterTypeName,
        ST_MARINE_FBKG.[Package]CharterTypecode,
        CASE    
            WHEN Brandcode='SUN' THEN 'SUNSAIL'
            WHEN Brandcode='LBT' THEN 'LEBOAT'
        ELSE 'XXX'
        END AS                  BrandName,
                                BrandCode,
        '??'                    Productname,
        ProductCode,
        F_CONTACT_URN
    FROM 
        [NEPTUNE_Stage].[dbo].[ST_MARINE_FBKG]    ST_MARINE_FBKG
    LEFT JOIN
        [NEPTUNE_Stage].[dbo].[NEPTUNE_BOOK]    NEPTUNE_BOOK
        ON
            ST_MARINE_FBKG.bkgref=NEPTUNE_BOOK.CLIENT_NO
    LEFT JOIN
        [NEPTUNE_Stage].[dbo].[NEPTUNE_ORIGIN]    NEPTUNE_ORIGIN
        ON
            NEPTUNE_BOOK.[LANGUAGE]=NEPTUNE_ORIGIN.ORIGIN
    ORDER BY 
        bkgref
    
    EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'NPTN','ST_MAR_BKG'
END
GO
/****** Object:  StoredProcedure [dbo].[BUILD_ST_MARINE_BROCHURE_REQUEST]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--========================================================================================================================
-- Procedure Date - Procedure Description
--                  BUILD_ST_MARINE_BROCHURE_REQUEST - Selects Neptune brochure request/enews records for HubSpot staging
-- 
--========================================================================================================================
-- Change History===
--========================================================================================================================
-- Date             Version     Who                Comment
-- 26-Apr-2018      1.1         Tim Wilson         Join to SL_BrochureName is now redundant
--========================================================================================================================

CREATE PROCEDURE [dbo].[BUILD_ST_MARINE_BROCHURE_REQUEST]
    AS
    
    EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'NPTN','ST_MAR_BRO','BUILD_ST_MARINE_BROCHURE_REQUEST'
    
    TRUNCATE TABLE 
        ST_MARINE_BROCHURE_REQUEST
    
    INSERT INTO 
        ST_MARINE_BROCHURE_REQUEST
    
    SELECT DISTINCT 
        'NPT-'
        +
        CAST(MailNo as varchar(25)) Source_Key,
        Mailno    ClientCode,
        F_BROCHURE_CODE                    Type,
        Brochure_Name                    BrochureName,
        --SUBSTRING([Enquiry Date],1,10)    DateRequested,
        CASE
            WHEN [Enquiry Date] = '' THEN NULL
            ELSE CONVERT(datetime,dbo.fn_CheckDate(SUBSTRING([Enquiry Date],7,4) + SUBSTRING([Enquiry Date],4,2) + SUBSTRING([Enquiry Date],1,2)),103)
        END AS DateRequested,
        COUNT(*)                        Quantity,
        LANG                            Language,
        F_COUNTRY                       Location,
        F_SOURCE                        SourceDescription,                 
--        SL_BrochureName.Source             Source,
		NULL                            Source,
        CONVERT(bigint, F_CONTACT_URN)  F_CONTACT_URN
    FROM
        [NEPTUNE_EBROC_NEWLETTERS]    NEPTUNE_EBROC_NEWLETTERS
    LEFT JOIN
        NEPTUNE_STAGE.DBO.NEPTUNE_ORIGIN    NEPTUNE_ORIGIN
        ON
            NEPTUNE_EBROC_NEWLETTERS.F_LANGUAGE=NEPTUNE_ORIGIN.ORIGIN
--    LEFT JOIN 
--        NEPTUNE_STAGE.dbo.SL_BrochureName 
--        ON
--            SL_BrochureName.[BrochureName]=NEPTUNE_EBROC_NEWLETTERS.Brochure_Name
	WHERE TRY_PARSE(F_CONTACT_URN AS bigint) IS NOT NULL
    GROUP BY
        F_BROCHURE_CODE,
        Brochure_Name,
        [Enquiry Date],
        F_LANGUAGE,
        F_COUNTRY,                        
        F_SOURCE,
        LANG,
        MAILNO,
--        SL_BrochureName.Source,
        F_CONTACT_URN
    ORDER BY Source_Key

EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'NPTN','ST_MAR_BRO'



GO
/****** Object:  StoredProcedure [dbo].[BUILD_ST_MARINE_CLIENT_PREFERENCE]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--========================================================================================================================
-- Procedure Date - Procedure Description
-- 04-Oct-2017      BUILD_ST_MARINE_CLIENT_PREFERENCE - Loads Bookings feed data into table ST_MARINE_CLIENT_PREFERENCE
--
--========================================================================================================================
-- Change History===
--========================================================================================================================
-- Date             Version     Who                Comment
--                  1.0                            Original Version    
-- 04-Oct-2017      1.1         Tim Wilson         Add new columns CancelFromEnews, CancelFromSMS
--========================================================================================================================

CREATE PROCEDURE [dbo].[BUILD_ST_MARINE_CLIENT_PREFERENCE] AS
BEGIN	
	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'NPTN','ST_MAR_CLP','BUILD_ST_MARINE_CLIENTPREFERENCE'	
	
	TRUNCATE TABLE 
		[ST_MARINE_CLIENT_PREFERENCE]

	INSERT INTO 
		[ST_MARINE_CLIENT_PREFERENCE]

	SELECT
		SUBSTRING(source_key,1,CHARINDEX('-',source_key,5)-1)	Source_Key,
		Source_key												Source_Key_full,
		SUBSTRING(source_key,5,CHARINDEX('-',source_key,5)-5)	ClientCode,
		Brand,
		CancelFromBrochure,
		CancelFromMailing,
		CancelFromEmail,
		CancelFromTelephone,
		CancelFromEnews,
		CancelFromSMS
	FROM 
		NEPTUNE_CLIENT_PREFERENCE
	ORDER BY
		Source_Key
	
	EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'NPTN','ST_MAR_CLP'

END
GO
/****** Object:  StoredProcedure [dbo].[BUILD_ST_MARINE_CLIENTS]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--========================================================================================================================
-- Procedure Date - Procedure Description
-- 26-Sep-2017      BUILD_ST_MARINE_CLIENTS - Loads data into table ST_MARINE_CLIENTS
--
--========================================================================================================================
-- Change History===
--========================================================================================================================
-- Date             Version     Who                Comment
--                  1.0                            Original Version    
-- 26-Sep-2017      1.1         Tim Wilson         Resolve conflicting column F_client_type (DWYT-3)
-- 26-Sep-2017      1.2         Tim Wilson         Add column F_URN (DWYT-5)
--========================================================================================================================

CREATE PROCEDURE [dbo].[BUILD_ST_MARINE_CLIENTS]	AS
BEGIN
	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'NPTN','ST_MAR_CLI','BUILD_ST_MARINE_CLIENTS'
	
	TRUNCATE TABLE 
		ST_MARINE_CLIENTS

	INSERT INTO 
		ST_MARINE_CLIENTS

	SELECT  DISTINCT  
		'NPT-' 
		+ 
		cast(NEPTUNE_FAMILY.F_MAIL_NO as varchar(25)) Source_Key
		,NEPTUNE_FAMILY.F_MAIL_NO	Clientcode
		,NEPTUNE_FAMILY.F_title			Title
		,NEPTUNE_FAMILY.F_forename		FirstName
		,NEPTUNE_FAMILY.F_surname		LastName
		--,NEPTUNE_FAMILY.F_DOB			DateofBirth
		,CASE
			WHEN NEPTUNE_FAMILY.F_DOB = '' THEN NULL
			ELSE CONVERT(datetime,dbo.fn_CheckDate(SUBSTRING(NEPTUNE_FAMILY.F_DOB,7,4) + SUBSTRING(NEPTUNE_FAMILY.F_DOB,4,2) + SUBSTRING(NEPTUNE_FAMILY.F_DOB,1,2)),103)
		END AS DateofBirth
		,NEPTUNE_FAMILY.F_citizen		Nationality
		,NEPTUNE_ORIGIN.LANG			Language
		,[F_addr1]						Add1
		,[F_addr2]						Add2
		,[F_addr3]						Add3
		,[F_town]						City
		,[F_county]						County
		,[F_post_code]					PostCode
		,[F_country]					Country
		,NEPTUNE_MAIL_CONTACT.[F_client_type]				ClientType
		,[F_tel1_no]					Phone1
		,[F_tel2_no]					Phone2
		,[F_tel3_no]					MobilePhone
		,NEPTUNE_FAMILY.F_mail_no		MailNo
		,NEPTUNE_FAMILY.[F_email]		Email
		,'N'							Blacklisted
		,'N'							Deceased
		,'N'							Goneaway
		,CASE
		WHEN NEPTUNE_FAMILY.F_leader='TRUE' THEN 'Yes'
		ELSE 'No' END AS				Lead
		,F_URN
	FROM         
		NEPTUNE_FAMILY NEPTUNE_FAMILY 
	LEFT OUTER JOIN
		NEPTUNE_MAIL_CONTACT 
		ON 
			NEPTUNE_FAMILY.F_mail_no = NEPTUNE_MAIL_CONTACT.F_mail_no
	LEFT JOIN
		NEPTUNE_STAGE.DBO.NEPTUNE_ORIGIN	NEPTUNE_ORIGIN
		ON
			NEPTUNE_FAMILY.F_Language=NEPTUNE_ORIGIN.ORIGIN

	ORDER BY
		NEPTUNE_FAMILY.f_mail_no


	UPDATE ST_MARINE_CLIENTS	
		SET 
			Blacklisted='Y'
		FROM 
			ST_MARINE_CLIENTS
		INNER JOIN
			NEPTUNE_MAIL_CONTACT
			ON
				CLIENTCODE=F_mail_no
		WHERE 
			F_client_category='Z'

		
	UPDATE ST_MARINE_CLIENTS
		SET 
			Deceased='Y'
		FROM 
			ST_MARINE_CLIENTS
		INNER JOIN
			NEPTUNE_MAIL_CONTACT
			ON
				CLIENTCODE=F_mail_no
		WHERE 
			F_client_category='x'

	UPDATE ST_MARINE_CLIENTS
		SET 
			Goneaway='Y'
		FROM 
			ST_MARINE_CLIENTS
		INNER JOIN
			NEPTUNE_MAIL_CONTACT
			ON
				CLIENTCODE=F_mail_no
		WHERE 
			F_client_category='GAS'
	
	EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'NPTN','ST_MAR_CLI'
END
GO
/****** Object:  StoredProcedure [dbo].[BUILD_ST_MARINE_FBKG]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[BUILD_ST_MARINE_FBKG]
AS

	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'NPTN','ST_FBKG','BUILD_ST_MARINE_FBKG'

	TRUNCATE TABLE ST_MARINE_FBKG

	INSERT INTO 
		ST_MARINE_FBKG
	SELECT
		CAST(CAST(103 AS VARCHAR(3)) 	
			+ RIGHT('0'+ CAST(CASE WHEN ISNUMERIC(NEPTUNE_BOOK.COMPANY_CODE) = 0 THEN '9' ELSE NEPTUNE_BOOK.COMPANY_CODE END AS VARCHAR(1)), 1)  
			+ RIGHT('0000000000'+ CAST(NEPTUNE_BOOK.CLIENT_NO AS VARCHAR(10)), 10) 
		AS BIGINT)AS i_Sk_Bkg,
		103 AS SourceSysID,
		'NEPTUNE' AS SystemName,
		'M' AS	DivisionCode,
		CASE WHEN NEPTUNE_BOOK.COMPANY_CODE IN ('1','2') THEN 'SUN'
			 WHEN NEPTUNE_BOOK.COMPANY_CODE = '5' THEN 'LBT' 
			 ELSE 'XXX' END AS BrandCode, 	
		CASE WHEN NEPTUNE_BOOK.COMPANY_CODE = 5 THEN 'LEBOAT' 
			 WHEN SB_MARINE_BASE_BOAT.a_ProductCode = 'FLOTILLA'  AND SB_MARINE_BASE_HOTEL.a_ProductCode ='CLUB' THEN 'CLUB'
			 WHEN SB_MARINE_BASE_BOAT.a_ProductCode = 'BAREBOAT'  AND SB_MARINE_BASE_HOTEL.a_ProductCode ='CLUB' THEN 'BAREBOAT'
			 WHEN SB_MARINE_BASE_BOAT.a_ProductCode = 'SAILING_SCHOOLS'  AND SB_MARINE_BASE_HOTEL.a_ProductCode ='CLUB' THEN 'CLUB'
			 ELSE SB_MARINE_BASE.a_ProductCode 
		END AS ProductCode,
		CASE WHEN SB_MARINE_BASE_BOAT.a_ProductCode IN ('FLOTILLA','BAREBOAT') AND SB_MARINE_BASE_HOTEL.a_ProductCode ='CLUB' THEN 'Club Flotilla'
			 WHEN SB_MARINE_BASE_BOAT.a_ProductCode = 'SAILING_SCHOOLS'  AND SB_MARINE_BASE_HOTEL.a_ProductCode ='CLUB' THEN 'Sailing Schools'
			 WHEN SB_MARINE_BASE.a_ProductCode ='CLUB' THEN 'Club'
			 WHEN SB_MARINE_BASE.a_ProductCode ='FLOTILLA'
				   AND 
				  NEPTUNE_ACCOMMODATION_BOAT.ACCOMODATION_NAME IS NOT NULL 
			 THEN 'Flotilla'
			 WHEN NEPTUNE_ACCOMMODATION_BOAT.ACCOMODATION_NAME IS NOT NULL THEN 'Bareboat'
			 WHEN NEPTUNE_ACCOM_HOTEL.CLIENT_NO IS NOT NULL THEN 'Accommodation Only'
			 WHEN NEPTUNE_FLIGHT_DURATION.CLIENT_NO IS NOT NULL THEN 'Flight Only'
			 ELSE 'Others'
		END AS BookingType,
		SB_SEASON.i_BK_SeasonCode AS SeasonCode,
		CASE
			WHEN NEPTUNE_BOOK.I5_CONTRACT_NO = '' THEN
				CASE
					WHEN NEPTUNE_BOOK.OPT_BOOK = 'C' THEN 3
					WHEN NEPTUNE_BOOK.OPT_BOOK = 'X' THEN 8
					ELSE 1 
				END	
			WHEN SUNSAIL_ST_CNMST.CNNUMB IS NOT NULL AND NEPTUNE_BOOK.COMPANY_CODE IN ('2','5')THEN
				CASE
					WHEN NEPTUNE_BOOK.OPT_BOOK = 'C' THEN 3
					WHEN NEPTUNE_BOOK.OPT_BOOK = 'X' THEN 8
					ELSE 1 
				END
			WHEN  NEPTUNE_XREF.I5_CONTRACT = 0 THEN
				CASE
					WHEN NEPTUNE_BOOK.OPT_BOOK = 'C' THEN 3
					WHEN NEPTUNE_BOOK.OPT_BOOK = 'X' THEN 8
					ELSE 1 
				END
			ELSE
				CASE
					WHEN NEPTUNE_BOOK.OPT_BOOK = 'C' THEN 18
					WHEN NEPTUNE_BOOK.OPT_BOOK = 'X' THEN 19
					ELSE 17
				END
		END AS BookingStatusID,
		RTRIM(LTRIM(NEPTUNE_BOOK.CLIENT_NO)) AS BkgRef,
		RTRIM(LTRIM(NEPTUNE_BOOK.MAIL_NO)) AS ClientNo,
		RTRIM(LTRIM(NEPTUNE_BOOK.COMPANY_CODE)) AS CompanyNo,
		RTRIM(LTRIM(NEPTUNE_BOOK.INV_COMPANY)) AS InvCompany,
		ISNULL(NEPTUNE_PASS_NO.PaxNo,0) AS PaxNo,
		NEPTUNE_BOOK.PACKAGE As Package,
		NEPTUNE_PACKAGE.PACKAGE_DESC AS PackageDesc,
		NEPTUNE_ACCOMMODATION_BOAT.ACCOMODATION_NAME AS Boat,
		NEPTUNE_ACCOMMODATION_BOAT.ACCOMMODATION_TYPE_DESC AS BoatType,
		SB_MARINE_BASE_HOTEL.a_BaseName AS HotelName,
		NEPTUNE_BOOK.BASE_CODE AS BaseLocation, 
		CONVERT(DATETIME,NEPTUNE_Stage.dbo.fn_Checkdate(CONVERT(INT,SUBSTRING(NEPTUNE_BOOK.ADDED_DATE,7,4)+SUBSTRING(NEPTUNE_BOOK.ADDED_DATE,4,2)+SUBSTRING(NEPTUNE_BOOK.ADDED_DATE,1,2)))) AS OptionDate,
		CONVERT(DATETIME,NEPTUNE_Stage.dbo.fn_Checkdate(CONVERT(INT,SUBSTRING(EXPIRY_DATE,7,4)+SUBSTRING(EXPIRY_DATE,4,2)+SUBSTRING(EXPIRY_DATE,1,2)))) AS OptionExpiryDate,
		CONVERT(DATETIME,NEPTUNE_Stage.dbo.fn_Checkdate(CONVERT(INT,SUBSTRING(CONF_DATE,7,4)+SUBSTRING(CONF_DATE,4,2)+SUBSTRING(CONF_DATE,1,2)))) AS ConfirmDate, -- BookedDate
		CASE WHEN NEPTUNE_BOOK.OPT_BOOK = 'X' THEN 
			CASE WHEN CANX_DATE <> '' THEN 
				CONVERT(DATETIME,NEPTUNE_Stage.dbo.fn_Checkdate(CONVERT(INT,SUBSTRING(CANX_DATE,7,4)+SUBSTRING(CANX_DATE,4,2)+SUBSTRING(CANX_DATE,1,2)))) 
			ELSE
				CONVERT(DATETIME,NEPTUNE_Stage.dbo.fn_Checkdate(CONVERT(INT,SUBSTRING(CONF_DATE,7,4)+SUBSTRING(CONF_DATE,4,2)+SUBSTRING(CONF_DATE,1,2))))
			END
		END  AS CancelDate,
		COALESCE(NEPTUNE_ACCOM_DURATION.MinStartDate,NEPTUNE_FLIGHT_DURATION.MinStartDate,CONVERT(DATETIME,NEPTUNE_Stage.dbo.fn_Checkdate(CONVERT(INT,SUBSTRING(NEPTUNE_BOOK.START_DATE,7,4)+SUBSTRING(NEPTUNE_BOOK.START_DATE,4,2)+SUBSTRING(NEPTUNE_BOOK.START_DATE,1,2)))))  AS DepartDate,
		COALESCE(NEPTUNE_ACCOM_DURATION.MaxEndDate,NEPTUNE_FLIGHT_DURATION.MaxEndDate) AS ReturnDate,
		CASE 
			WHEN 
				COALESCE(NEPTUNE_ACCOM_DURATION.MinStartDate,NEPTUNE_FLIGHT_DURATION.MinStartDate,
				CONVERT(DATETIME,NEPTUNE_Stage.dbo.fn_Checkdate(CONVERT(INT,SUBSTRING(NEPTUNE_BOOK.START_DATE,7,4)+SUBSTRING(NEPTUNE_BOOK.START_DATE,4,2)+SUBSTRING(NEPTUNE_BOOK.START_DATE,1,2)))))  
					= COALESCE(NEPTUNE_ACCOM_DURATION.MaxEndDate,NEPTUNE_FLIGHT_DURATION.MaxEndDate,
					CONVERT(DATETIME,NEPTUNE_Stage.dbo.fn_Checkdate(CONVERT(INT,SUBSTRING(NEPTUNE_BOOK.START_DATE,7,4)+SUBSTRING(NEPTUNE_BOOK.START_DATE,4,2)+SUBSTRING(NEPTUNE_BOOK.START_DATE,1,2)))))  THEN 1 
			ELSE 
				DATEDIFF(d,ISNULL(NEPTUNE_ACCOM_DURATION.MinStartDate,NEPTUNE_FLIGHT_DURATION.MinStartDate),ISNULL(NEPTUNE_ACCOM_DURATION.MaxEndDate,NEPTUNE_FLIGHT_DURATION.MaxEndDate))
		END AS HolidayDuration,
		DATEDIFF(d,NEPTUNE_FLIGHT_HOLIDAY_DURATION.HolidayFlightStartDate,NEPTUNE_FLIGHT_HOLIDAY_DURATION.HolidayFlightEndDate)AS HolidayFlightDuration,
		ISNULL(NEPTUNE_ACCOM_BOAT.StartDate,NEPTUNE_ACCOM_HOTEL.StartDate) AS CharterStartDate,
		ISNULL(NEPTUNE_ACCOMMODATION_REF_BOAT.START_TIME,NEPTUNE_ACCOMMODATION_REF_HOTEL.START_TIME) AS CharterStartTime,	
		ISNULL(CONVERT(DATETIME,NEPTUNE_Stage.dbo.fn_Checkdate(CONVERT(INT,SUBSTRING(NEPTUNE_ACCOMMODATION_REF_BOAT.END_DATE,7,4)+SUBSTRING(NEPTUNE_ACCOMMODATION_REF_BOAT.END_DATE,4,2)+SUBSTRING(NEPTUNE_ACCOMMODATION_REF_BOAT.END_DATE,1,2)))),
			CONVERT(DATETIME,NEPTUNE_Stage.dbo.fn_Checkdate(CONVERT(INT,SUBSTRING(NEPTUNE_ACCOMMODATION_REF_HOTEL.END_DATE,7,4)+SUBSTRING(NEPTUNE_ACCOMMODATION_REF_HOTEL.END_DATE,4,2)+SUBSTRING(NEPTUNE_ACCOMMODATION_REF_HOTEL.END_DATE,1,2))))) AS CharterEndDate, 
		ISNULL(NEPTUNE_ACCOMMODATION_REF_BOAT.END_TIME,NEPTUNE_ACCOMMODATION_REF_HOTEL.END_TIME) AS CharterEndTime,
		ISNULL(NEPTUNE_ACCOM_BOAT.MAXDuration,NEPTUNE_ACCOM_HOTEL.MAXDuration) AS CharterDuration,
		NEPTUNE_BOOK.ADDED_BY AS OptionUser,
		CASE WHEN NEPTUNE_BOOK.OPT_BOOK <> 'X' THEN NEPTUNE_BOOK.CONF_BY END AS ConfirmUser,
		CASE WHEN NEPTUNE_BOOK.OPT_BOOK = 'X' THEN NEPTUNE_BOOK.CONF_BY END AS CancelUser,
		NEPTUNE_ORIGIN.LOC AS BkgLocation,
		[SOURCE] AS BkgSrcCd,
		NEPTUNE_SOURCE.DESCRIPTION AS BkgSourceDesc,
		AGENT_NAME AS AgentContact,
		AG_DIR_TERM AS DirectAgentFlg,
		CASE WHEN AG_DIR_TERM = 'A'  THEN 'Agent' ELSE 'Direct' END AS DirectAgent,
		SURNAME AS LeadPaxSurname, 
		FORENAME AS LeadPaxForename,
		TITLE AS LeadPaxTitle,
		SUBSTRING(FORENAME,1,1) AS LeadPaxInitials,
		TITLE + ' ' + FORENAME + ' ' + SURNAME AS LeadPaxFullName,
		ADDR1 AS Address1,
		ADDR2 AS ddress2,
		ADDR3 AS Address3,
		CITY AS Town,
		[STATE] AS County,
		ZIP_CODE AS PostCode,
		COUNTRY AS Country,
		NATIONALITY AS OriginNationality,
		DAY_TEL_NO AS TelephoneNo,
		EVE_TEL_NO AS TelephoneNo2,
		EMAIL AS Email,
		NEPTUNE_BOOK.ORIGIN AS CurrencyOrigin,
		SB_NEPTUNE_EXCHRATES.a_EFT_CODE AS Currency,
		NEPTUNE_BOOK.VAT_ON_COMM AS VatOnCommission,
		NEPTUNE_BOOK.I5_CONTRACT_NO AS CrossRef, 
		NULL AS CAA_BondingType,
		CASE WHEN NEPTUNE_BOOK.ADDED_BY = 'INTERNET' AND [SOURCE] ='OLINE'   THEN 'Web' 
			 WHEN AG_DIR_BOOK = 'A' THEN 'Broker'
			 WHEN AG_DIR_BOOK = 'D' THEN 'Sales Centre' 
			 ELSE 'Other' 
		END AS BookingChannel,
		CASE WHEN NEPTUNE_BOOK.ADDED_BY = 'INTERNET' AND [SOURCE] ='OLINE'   THEN 'Web' 
			 WHEN AGENT_NO in (22, 18862, 19054, 24280, 24281, 24282, 24284) THEN 'Master Yachting' 
			 WHEN AG_DIR_BOOK = 'A' AND INV_COMPANY in ('1', '5') THEN 'Travel Agent' 
			 WHEN AG_DIR_BOOK = 'A' AND INV_COMPANY in ('6', '8', 'A', 'H') THEN 'European Broker' 
			 WHEN AG_DIR_BOOK = 'A' AND INV_COMPANY ='2' THEN 'US Agent'
			 WHEN AG_DIR_BOOK = 'D' THEN 'Sales Centre'
			 ELSE 'Other' 
		END AS ExpandedBookingChannel
	FROM 
		NEPTUNE_Stage.dbo.NEPTUNE_BOOK NEPTUNE_BOOK 
	LEFT JOIN
		(
			SELECT 
				CLIENT_NO,
				COUNT(*) AS PaxNo
			FROM 
				NEPTUNE_Stage.dbo.NEPTUNE_PASS
			GROUP BY 
				CLIENT_NO		
		) NEPTUNE_PASS_NO
		ON
			NEPTUNE_PASS_NO.CLIENT_NO = CAST(NEPTUNE_BOOK.CLIENT_NO	AS VARCHAR(20))
	LEFT JOIN 
		(
			SELECT 
				CLIENT_NO,
				MIN(CONVERT(DATETIME,NEPTUNE_Stage.dbo.fn_Checkdate(CONVERT(INT,SUBSTRING(START_DATE,7,4)+SUBSTRING(START_DATE,4,2)+SUBSTRING(START_DATE,1,2))))) AS MinStartDate, 
				MAX(CONVERT(DATETIME,NEPTUNE_Stage.dbo.fn_Checkdate(CASE WHEN END_DATE ='' THEN '24991231' ELSE CONVERT(INT,SUBSTRING(END_DATE,7,4)+SUBSTRING(END_DATE,4,2)+SUBSTRING(END_DATE,1,2))END ))) AS MaxEndDate
			FROM
				NEPTUNE_Stage.dbo.NEPTUNE_ACCOMMODATION_REF
			GROUP BY 
				CLIENT_NO
		) NEPTUNE_ACCOM_DURATION
	ON
		NEPTUNE_ACCOM_DURATION.CLIENT_NO = CAST(NEPTUNE_BOOK.CLIENT_NO	AS VARCHAR(20))
	LEFT JOIN 
		(
			SELECT 
				CLIENT_NO,
				MIN(CONVERT(DATETIME,NEPTUNE_Stage.dbo.fn_Checkdate(CONVERT(INT,SUBSTRING(DEP_DATE,7,4)+SUBSTRING(DEP_DATE,4,2)+SUBSTRING(DEP_DATE,1,2))))) AS MinStartDate, 
				MAX(CONVERT(DATETIME,NEPTUNE_Stage.dbo.fn_Checkdate(CASE WHEN ARR_DATE ='' THEN '29991231' ELSE CONVERT(INT,SUBSTRING(ARR_DATE,7,4)+SUBSTRING(ARR_DATE,4,2)+SUBSTRING(ARR_DATE,1,2))END ))) AS MaxEndDate
			FROM
				NEPTUNE_Stage.dbo.NEPTUNE_FLIGHT_REF NEPTUNE_FLIGHT_REF
			LEFT JOIN
				NEPTUNE_Stage.dbo.NEPTUNE_FLIGHT NEPTUNE_FLIGHT
				ON
					NEPTUNE_FLIGHT.FLIGHT_NO = NEPTUNE_FLIGHT_REF.FLIGHT_NO
			GROUP BY 
				CLIENT_NO
		) NEPTUNE_FLIGHT_DURATION
	ON
		NEPTUNE_FLIGHT_DURATION.CLIENT_NO = CAST(NEPTUNE_BOOK.CLIENT_NO	AS VARCHAR(20))
	LEFT JOIN 
		(
			SELECT 
				CLIENT_NO,
				MIN(CONVERT(DATETIME,NEPTUNE_Stage.dbo.fn_Checkdate(CONVERT(INT,SUBSTRING(DEP_DATE,7,4)+SUBSTRING(DEP_DATE,4,2)+SUBSTRING(DEP_DATE,1,2))))) AS HolidayFlightStartDate, 
				MAX(CONVERT(DATETIME,NEPTUNE_Stage.dbo.fn_Checkdate(CONVERT(INT,SUBSTRING(DEP_DATE,7,4)+SUBSTRING(DEP_DATE,4,2)+SUBSTRING(DEP_DATE,1,2))))) AS HolidayFlightEndDate
			FROM
				NEPTUNE_Stage.dbo.NEPTUNE_FLIGHT_REF NEPTUNE_FLIGHT_REF
			LEFT JOIN
				NEPTUNE_Stage.dbo.NEPTUNE_FLIGHT NEPTUNE_FLIGHT
				ON
					NEPTUNE_FLIGHT.FLIGHT_NO = NEPTUNE_FLIGHT_REF.FLIGHT_NO
			GROUP BY 
				CLIENT_NO
		) NEPTUNE_FLIGHT_HOLIDAY_DURATION
	ON
		NEPTUNE_FLIGHT_HOLIDAY_DURATION.CLIENT_NO = CAST(NEPTUNE_BOOK.CLIENT_NO	AS VARCHAR(20))
	LEFT JOIN 
		(
			SELECT 
				MinDateMaxDur.CLIENT_NO,
				MAX(MAXDuration) AS MAXDuration,
				MIN(StartDate) As StartDate,
				MIN(ACCOMRENO) AS ACCOMRENO
			FROM
				(
				SELECT 
					MaxDuration.CLIENT_NO,
					MAX(MAXDuration.MAXDuration) AS MAXDuration,
					MIN(CONVERT(DATETIME,NEPTUNE_Stage.dbo.fn_Checkdate(CONVERT(INT,SUBSTRING(StartDate.START_DATE,7,4)+SUBSTRING(StartDate.START_DATE,4,2)+SUBSTRING(StartDate.START_DATE,1,2))))) AS StartDate
				FROM
					(	
					SELECT 
						CLIENT_NO,
						MAX(DURATION) AS MAXDuration
					FROM
						NEPTUNE_Stage.dbo.NEPTUNE_ACCOMMODATION_REF
					INNER JOIN
						NEPTUNE_Stage.dbo.NEPTUNE_ACCOMMODATION
						ON
							NEPTUNE_ACCOMMODATION.ACCOMMODATION_NO=NEPTUNE_ACCOMMODATION_REF.ACCOMMODATION_NO
							AND
							NEPTUNE_ACCOMMODATION.SUNSAIL_NO<>0
							AND
							NEPTUNE_ACCOMMODATION.YACHT_ROOM_IND='Y'
					INNER JOIN
						NEPTUNE_Stage.dbo.NEPTUNE_APEX_ACCOM_TYPE NEPTUNE_APEX_ACCOM_TYPE
						ON
							NEPTUNE_APEX_ACCOM_TYPE.ACCOMMODATION_TYPE_DESC = NEPTUNE_ACCOMMODATION.ACCOMMODATION_TYPE_DESC
					INNER JOIN
						NEPTUNE_Stage.dbo.NEPTUNE_APEX_ACCOM_TYPE_GROUP NEPTUNE_APEX_ACCOM_TYPE_GROUP
						ON
							NEPTUNE_APEX_ACCOM_TYPE_GROUP.ACCOM_TYPE_GROUP_CODE = NEPTUNE_APEX_ACCOM_TYPE.ACCOM_TYPE_GROUP_CODE
					WHERE 
						ACCOM_CLASS IN ('Boats','Catamaran','Monohull','Powercat','Sunsail 40')	
					GROUP BY 
						CLIENT_NO	
					)MaxDuration
				LEFT JOIN
					(
					SELECT 
						CLIENT_NO,
						START_DATE,
						DURATION
					FROM
						NEPTUNE_Stage.dbo.NEPTUNE_ACCOMMODATION_REF
					INNER JOIN
						NEPTUNE_Stage.dbo.NEPTUNE_ACCOMMODATION
						ON
							NEPTUNE_ACCOMMODATION.ACCOMMODATION_NO=NEPTUNE_ACCOMMODATION_REF.ACCOMMODATION_NO
							AND
							NEPTUNE_ACCOMMODATION.SUNSAIL_NO<>0
							AND
							NEPTUNE_ACCOMMODATION.YACHT_ROOM_IND='Y'
					INNER JOIN
						NEPTUNE_Stage.dbo.NEPTUNE_APEX_ACCOM_TYPE NEPTUNE_APEX_ACCOM_TYPE
						ON
							NEPTUNE_APEX_ACCOM_TYPE.ACCOMMODATION_TYPE_DESC = NEPTUNE_ACCOMMODATION.ACCOMMODATION_TYPE_DESC
					INNER JOIN
						NEPTUNE_Stage.dbo.NEPTUNE_APEX_ACCOM_TYPE_GROUP NEPTUNE_APEX_ACCOM_TYPE_GROUP
						ON
							NEPTUNE_APEX_ACCOM_TYPE_GROUP.ACCOM_TYPE_GROUP_CODE = NEPTUNE_APEX_ACCOM_TYPE.ACCOM_TYPE_GROUP_CODE
					WHERE 
						ACCOM_CLASS IN ('Boats','Catamaran','Monohull','Powercat','Sunsail 40')	
					)StartDate
					ON
						MaxDuration.CLIENT_NO = StartDate.CLIENT_NO
						AND
						MaxDuration.MAXDuration = StartDate.DURATION
					GROUP BY 
						MaxDuration.CLIENT_NO
					)MinDateMaxDur
				LEFT JOIN 
					(
					SELECT 
						CLIENT_NO,
						CONVERT(DATETIME,NEPTUNE_Stage.dbo.fn_Checkdate(CONVERT(INT,SUBSTRING(START_DATE,7,4)+SUBSTRING(START_DATE,4,2)+SUBSTRING(START_DATE,1,2)))) AS START_DATE,
						DURATION,
						NEPTUNE_ACCOMMODATION_REF.ACCOMRENO AS ACCOMRENO
					FROM
						NEPTUNE_Stage.dbo.NEPTUNE_ACCOMMODATION_REF
					INNER JOIN
						NEPTUNE_Stage.dbo.NEPTUNE_ACCOMMODATION
						ON
							NEPTUNE_ACCOMMODATION.ACCOMMODATION_NO=NEPTUNE_ACCOMMODATION_REF.ACCOMMODATION_NO
							AND
							NEPTUNE_ACCOMMODATION.SUNSAIL_NO<>0
							AND
							NEPTUNE_ACCOMMODATION.YACHT_ROOM_IND='Y'
					INNER JOIN
						NEPTUNE_Stage.dbo.NEPTUNE_APEX_ACCOM_TYPE NEPTUNE_APEX_ACCOM_TYPE
						ON
							NEPTUNE_APEX_ACCOM_TYPE.ACCOMMODATION_TYPE_DESC = NEPTUNE_ACCOMMODATION.ACCOMMODATION_TYPE_DESC
					INNER JOIN
						NEPTUNE_Stage.dbo.NEPTUNE_APEX_ACCOM_TYPE_GROUP NEPTUNE_APEX_ACCOM_TYPE_GROUP
						ON
							NEPTUNE_APEX_ACCOM_TYPE_GROUP.ACCOM_TYPE_GROUP_CODE = NEPTUNE_APEX_ACCOM_TYPE.ACCOM_TYPE_GROUP_CODE
					WHERE 
						ACCOM_CLASS IN ('Boats','Catamaran','Monohull','Powercat','Sunsail 40')	
				)MinAccom
				ON
					MinAccom.CLIENT_NO = MinDateMaxDur.CLIENT_NO
					AND
					MinAccom.DURATION = MinDateMaxDur.MAXDuration
					AND
					MinAccom.START_DATE = MinDateMaxDur.StartDate
			GROUP BY 
				MinDateMaxDur.CLIENT_NO
		) NEPTUNE_ACCOM_BOAT
	ON
		NEPTUNE_ACCOM_BOAT.CLIENT_NO = CAST(NEPTUNE_BOOK.CLIENT_NO	AS VARCHAR(20))
	LEFT JOIN 
		NEPTUNE_Stage.dbo.NEPTUNE_ACCOMMODATION_REF NEPTUNE_ACCOMMODATION_REF_BOAT
		ON
			NEPTUNE_ACCOMMODATION_REF_BOAT.CLIENT_NO = NEPTUNE_ACCOM_BOAT.CLIENT_NO
			AND
			NEPTUNE_ACCOMMODATION_REF_BOAT.ACCOMRENO = NEPTUNE_ACCOM_BOAT.ACCOMRENO
			AND
			CONVERT(DATETIME,NEPTUNE_Stage.dbo.fn_Checkdate(CONVERT(INT,SUBSTRING(NEPTUNE_ACCOMMODATION_REF_BOAT.START_DATE,7,4)+SUBSTRING(NEPTUNE_ACCOMMODATION_REF_BOAT.START_DATE,4,2)+SUBSTRING(NEPTUNE_ACCOMMODATION_REF_BOAT.START_DATE,1,2))))= NEPTUNE_ACCOM_BOAT.StartDate
			AND
		    NEPTUNE_ACCOMMODATION_REF_BOAT.DURATION = NEPTUNE_ACCOM_BOAT.MAXDuration	
	LEFT JOIN
		AMI_Static.dbo.SB_MARINE_BASE	SB_MARINE_BASE_BOAT
		ON
			 SB_MARINE_BASE_BOAT.a_BaseCode = NEPTUNE_ACCOMMODATION_REF_BOAT.BASE_CODE	
			 AND
			 SB_MARINE_BASE_BOAT.a_SourceSystemID = 103
			 AND 
			 SB_MARINE_BASE_BOAT.a_CompanyNo = NEPTUNE_BOOK.COMPANY_CODE
	LEFT JOIN 
		(
			SELECT 
				MinDateMaxDur.CLIENT_NO,
				MAX(MAXDuration) AS MAXDuration,
				MIN(StartDate) As StartDate,
				MIN(ACCOMRENO) AS ACCOMRENO
			FROM
			(
				SELECT 
					MaxDuration.CLIENT_NO,
					MAX(MAXDuration.MAXDuration) AS MAXDuration,
					MIN(CONVERT(DATETIME,NEPTUNE_Stage.dbo.fn_Checkdate(CONVERT(INT,SUBSTRING(StartDate.START_DATE,7,4)+SUBSTRING(StartDate.START_DATE,4,2)+SUBSTRING(StartDate.START_DATE,1,2))))) AS StartDate
				FROM
				(	
					SELECT 
						CLIENT_NO,
						MAX(DURATION) AS MAXDuration
					FROM
						NEPTUNE_Stage.dbo.NEPTUNE_ACCOMMODATION_REF
					INNER JOIN
						NEPTUNE_Stage.dbo.NEPTUNE_ACCOMMODATION
						ON
							NEPTUNE_ACCOMMODATION.ACCOMMODATION_NO=NEPTUNE_ACCOMMODATION_REF.ACCOMMODATION_NO
							AND
							NEPTUNE_ACCOMMODATION.YACHT_ROOM_IND='R'
					GROUP BY
						CLIENT_NO
				)MaxDuration
			LEFT JOIN
				(
					SELECT 
						CLIENT_NO,
						START_DATE,
						DURATION
					FROM
						NEPTUNE_Stage.dbo.NEPTUNE_ACCOMMODATION_REF
					INNER JOIN
						NEPTUNE_Stage.dbo.NEPTUNE_ACCOMMODATION
						ON
							NEPTUNE_ACCOMMODATION.ACCOMMODATION_NO=NEPTUNE_ACCOMMODATION_REF.ACCOMMODATION_NO
							AND
							NEPTUNE_ACCOMMODATION.YACHT_ROOM_IND='R'
				)StartDate
				ON
					MaxDuration.CLIENT_NO = StartDate.CLIENT_NO
					AND
					MaxDuration.MAXDuration = StartDate.DURATION
				GROUP BY 
					MaxDuration.CLIENT_NO
			)MinDateMaxDur
				LEFT JOIN 
				(
					SELECT 
						CLIENT_NO,
						CONVERT(DATETIME,NEPTUNE_Stage.dbo.fn_Checkdate(CONVERT(INT,SUBSTRING(START_DATE,7,4)+SUBSTRING(START_DATE,4,2)+SUBSTRING(START_DATE,1,2)))) AS START_DATE,
						DURATION,
						NEPTUNE_ACCOMMODATION_REF.ACCOMRENO AS ACCOMRENO
					FROM
						NEPTUNE_Stage.dbo.NEPTUNE_ACCOMMODATION_REF
					INNER JOIN
						NEPTUNE_Stage.dbo.NEPTUNE_ACCOMMODATION
						ON
							NEPTUNE_ACCOMMODATION.ACCOMMODATION_NO=NEPTUNE_ACCOMMODATION_REF.ACCOMMODATION_NO
							AND
							NEPTUNE_ACCOMMODATION.YACHT_ROOM_IND='R'
				)MinAccom
				ON
					MinAccom.CLIENT_NO = MinDateMaxDur.CLIENT_NO
					AND
					MinAccom.DURATION = MinDateMaxDur.MAXDuration
					AND
					MinAccom.START_DATE = MinDateMaxDur.StartDate
			GROUP BY 
				MinDateMaxDur.CLIENT_NO
		) NEPTUNE_ACCOM_HOTEL
	ON
		NEPTUNE_ACCOM_HOTEL.CLIENT_NO = CAST(NEPTUNE_BOOK.CLIENT_NO	AS VARCHAR(20))
	LEFT JOIN 
		NEPTUNE_Stage.dbo.NEPTUNE_ACCOMMODATION_REF NEPTUNE_ACCOMMODATION_REF_HOTEL
		ON
			NEPTUNE_ACCOMMODATION_REF_HOTEL.CLIENT_NO = NEPTUNE_ACCOM_HOTEL.CLIENT_NO
			AND
			NEPTUNE_ACCOMMODATION_REF_HOTEL.ACCOMRENO = NEPTUNE_ACCOM_HOTEL.ACCOMRENO
			AND
			CONVERT(DATETIME,NEPTUNE_Stage.dbo.fn_Checkdate(CONVERT(INT,SUBSTRING(NEPTUNE_ACCOMMODATION_REF_HOTEL.START_DATE,7,4)+SUBSTRING(NEPTUNE_ACCOMMODATION_REF_HOTEL.START_DATE,4,2)+SUBSTRING(NEPTUNE_ACCOMMODATION_REF_HOTEL.START_DATE,1,2))))= NEPTUNE_ACCOM_HOTEL.StartDate
			AND
		    NEPTUNE_ACCOMMODATION_REF_HOTEL.DURATION = NEPTUNE_ACCOM_HOTEL.MAXDuration
	LEFT JOIN 
		AMI_Static.dbo.SB_SEASON SB_SEASON
		ON
			COALESCE(NEPTUNE_ACCOM_DURATION.MinStartDate,NEPTUNE_FLIGHT_DURATION.MinStartDate,CONVERT(DATETIME,NEPTUNE_Stage.dbo.fn_Checkdate(CONVERT(INT,SUBSTRING(NEPTUNE_BOOK.START_DATE,7,4)+SUBSTRING(NEPTUNE_BOOK.START_DATE,4,2)+SUBSTRING(NEPTUNE_BOOK.START_DATE,1,2))))) 
			BETWEEN SB_SEASON.a_StartDate AND SB_SEASON.a_EndDate
			AND
			SB_SEASON.i_BK_SeasonCode <> 'ALL'
	LEFT JOIN
		NEPTUNE_Stage.dbo.NEPTUNE_ACCOMMODATION NEPTUNE_ACCOMMODATION_BOAT
		ON
			NEPTUNE_ACCOMMODATION_REF_BOAT.ACCOMMODATION_NO = NEPTUNE_ACCOMMODATION_BOAT.ACCOMMODATION_NO
	LEFT JOIN
		AMI_Static.dbo.SB_MARINE_BASE SB_MARINE_BASE_HOTEL
		ON
			SB_MARINE_BASE_HOTEL.a_BaseCode = NEPTUNE_ACCOMMODATION_REF_HOTEL.REG_BASE
			AND
			SB_MARINE_BASE_HOTEL.a_SourceSystemID = 103
			AND 
			SB_MARINE_BASE_HOTEL.a_CompanyNo = NEPTUNE_BOOK.COMPANY_CODE
	LEFT JOIN 
		NEPTUNE_Stage.dbo.NEPTUNE_PACKAGE NEPTUNE_PACKAGE
		ON
			NEPTUNE_PACKAGE.PACKAGE_CODE = NEPTUNE_BOOK.PACKAGE
			AND
			NEPTUNE_PACKAGE.COMPANY_CODE = NEPTUNE_BOOK.COMPANY_CODE
	LEFT JOIN
		AMI_Static.dbo.SB_NEPTUNE_EXCHRATES SB_NEPTUNE_EXCHRATES
		ON
			NEPTUNE_BOOK.ORIGIN = SB_NEPTUNE_EXCHRATES.a_ORIGIN
	LEFT JOIN
		NEPTUNE_Stage.dbo.NEPTUNE_ORIGIN NEPTUNE_ORIGIN
		ON
			NEPTUNE_ORIGIN.ORIGIN = NEPTUNE_BOOK.LOCATION
	LEFT JOIN
		NEPTUNE_Stage.dbo.NEPTUNE_SOURCE NEPTUNE_SOURCE
		ON
			NEPTUNE_SOURCE.SOURCE_CODE = NEPTUNE_BOOK.[SOURCE]
			AND
			NEPTUNE_SOURCE.UK_OR_USE = NEPTUNE_BOOK.LOCATION
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_BASE
		ON
			SB_MARINE_BASE.a_BaseCode = NEPTUNE_BOOK.BASE_CODE
			AND
			SB_MARINE_BASE.a_SourceSystemID = 103
			AND 
			SB_MARINE_BASE.a_CompanyNo = NEPTUNE_BOOK.COMPANY_CODE
	LEFT JOIN 
		TRITON_Stage.dbo.SUNSAIL_ST_CNMST SUNSAIL_ST_CNMST
		ON
			SUNSAIL_ST_CNMST.CNNUMB = NEPTUNE_BOOK.I5_CONTRACT_NO
	LEFT JOIN 
		NEPTUNE_Stage.dbo.NEPTUNE_XREF NEPTUNE_XREF
		ON
			NEPTUNE_BOOK.CLIENT_NO = NEPTUNE_XREF.BOOK_CLIENT_NO 		
	WHERE 
		CONVERT(DATETIME,NEPTUNE_Stage.dbo.fn_Checkdate(CONVERT(INT,SUBSTRING(NEPTUNE_BOOK.START_DATE,7,4)+SUBSTRING(NEPTUNE_BOOK.START_DATE,4,2)+SUBSTRING(NEPTUNE_BOOK.START_DATE,1,2)))) >= '2010-01-01'
		AND
		NEPTUNE_BOOK.COMPANY_CODE IN ('1','2','5')
		AND
		NEPTUNE_BOOK.CLIENT_NO <> 0
		
	EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'NPTN','ST_FBKG'
	
	
	
	
	

	

	


GO
/****** Object:  StoredProcedure [dbo].[BUILD_ST_MARINE_FITN]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[BUILD_ST_MARINE_FITN]
AS

	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'NPTN','ST_FITN','BUILD_ST_MARINE_FITN'

	TRUNCATE TABLE ST_MARINE_FITN

	-- Accommodation
	INSERT INTO 
		ST_MARINE_FITN
	SELECT 
		CAST(CAST(103 AS VARCHAR(3)) 	
			+ RIGHT('0'+ CAST(CASE WHEN ISNUMERIC(NEPTUNE_BOOK.COMPANY_CODE) = 0 THEN '9' ELSE NEPTUNE_BOOK.COMPANY_CODE END AS VARCHAR(1)), 1)  
			+ RIGHT('0000000000'+ CAST(NEPTUNE_BOOK.CLIENT_NO AS VARCHAR(10)), 10) 
		AS BIGINT) AS i_Sk_Bkg,
		'ACC' AS ItineraryLineType,
		103 AS SourceSysID,
		'NEPTUNE' AS SystemName,
		'M' AS	DivisionCode,
		CASE WHEN NEPTUNE_BOOK.COMPANY_CODE IN ('1','2') THEN 'SUN'
			 WHEN NEPTUNE_BOOK.COMPANY_CODE = '5' THEN 'LBT' 
			 ELSE 'XXX' END AS BrandCode,
		RTRIM(LTRIM(NEPTUNE_BOOK.CLIENT_NO)) AS BkgRef,
		RANK() OVER 
			(
				PARTITION BY 
					NEPTUNE_ACCOMMODATION_REF.CLIENT_NO
				ORDER BY 
					NEPTUNE_ACCOMMODATION_REF.CLIENT_NO,
					NEPTUNE_ACCOMMODATION_REF.ACCOMRENO
			)  AS ItinRef,
		CASE
			WHEN NEPTUNE_BOOK.OPT_BOOK = 'C' THEN 3
			WHEN NEPTUNE_BOOK.OPT_BOOK = 'X' THEN 8
			ELSE 1
		END AS Status,
		RTRIM(LTRIM(NEPTUNE_BOOK.COMPANY_CODE)) AS CompanyNo,
		NEPTUNE_BOOK.PACKAGE As Package,
		NEPTUNE_ACCOMMODATION_REF.CHARTER As Charter,
		1 As Qty,
		NEPTUNE_ACCOMMODATION_REF.PAX AS NoPax,
		CONVERT(INT,SUBSTRING(NEPTUNE_ACCOMMODATION_REF.START_DATE,7,4)+SUBSTRING(NEPTUNE_ACCOMMODATION_REF.START_DATE,4,2)+SUBSTRING(NEPTUNE_ACCOMMODATION_REF.START_DATE,1,2)) AS ContractSvsStartDate,
		CONVERT(INT,SUBSTRING(NEPTUNE_ACCOMMODATION_REF.END_DATE,7,4)+SUBSTRING(NEPTUNE_ACCOMMODATION_REF.END_DATE,4,2)+SUBSTRING(NEPTUNE_ACCOMMODATION_REF.END_DATE,1,2)) AS ContractSvsEndDate,
		CONVERT(INT,SUBSTRING(NEPTUNE_ACCOMMODATION_REF.ADDED_DATE,7,4)+SUBSTRING(NEPTUNE_ACCOMMODATION_REF.ADDED_DATE,4,2)+SUBSTRING(NEPTUNE_ACCOMMODATION_REF.ADDED_DATE,1,2)) AS EntryDate,
		CONVERT(INT,SUBSTRING(NEPTUNE_ACCOMMODATION_REF.ADDED_DATE,7,4)+SUBSTRING(NEPTUNE_ACCOMMODATION_REF.ADDED_DATE,4,2)+SUBSTRING(NEPTUNE_ACCOMMODATION_REF.ADDED_DATE,1,2)) AS SvsLastAmendDate,
		NEPTUNE_ACCOMMODATION_REF.DURATION AS ContractDuration,
		CONVERT(INT,SUBSTRING(NEPTUNE_ACCOMMODATION_REF.START_DATE,7,4)+SUBSTRING(NEPTUNE_ACCOMMODATION_REF.START_DATE,4,2)+SUBSTRING(NEPTUNE_ACCOMMODATION_REF.START_DATE,1,2)) AS ItemStartDate,
		CONVERT(INT,SUBSTRING(NEPTUNE_ACCOMMODATION_REF.END_DATE,7,4)+SUBSTRING(NEPTUNE_ACCOMMODATION_REF.END_DATE,4,2)+SUBSTRING(NEPTUNE_ACCOMMODATION_REF.END_DATE,1,2)) AS ItemEndDate,
		NULL AS ItemDuration,
		NULL AS ItemAmountLocal,
		NULL AS TotalAmountLocal,
		NULL AS TotalAmountLocalForCancel,
		NULL AS Discountlocal,
		NULL AS VatLocal,
		NULL AS TApercent,
		NULL AS UK_Vat,
		NULL AS CommisionLocal,
		NEPTUNE_ACCOMMODATION_REF.ADDED_BY AS LastAmendUser,
		NEPTUNE_ACCOMMODATION_REF.BASE_CODE AS BaseLocation,
		NULL AS Currency,
		NULL AS ExtraCode,
		NULL AS ExtraCodeDesc,
		NULL AS RevenueTypeCode,
		NULL AS RevenueType, 
		NULL AS RevenueSubTypeCode,
		NULL AS RevenueSubType,
		NULL AS RevenueLine,
		NULL AS RevenueLineDesc,
		NULL AS RevenueGroupClub,
		NULL AS RevenueGroupDesc,
		ISNULL(BOAT.ClassCode,ACCOM.ClassCode) AS ClassCode,
		ISNULL(BOAT.Class,ACCOM.Class)  AS Class,
		NULL AS ExtraNotes,
		NULL AS Origin,
		NULL AS SalesCategoryCode,
		NULL AS DepartAirport,
		NULL AS ArrivalAirport
	FROM 
		NEPTUNE_Stage.dbo.NEPTUNE_BOOK NEPTUNE_BOOK
	LEFT JOIN
		NEPTUNE_Stage.dbo.NEPTUNE_ACCOMMODATION_REF NEPTUNE_ACCOMMODATION_REF
		ON
			NEPTUNE_ACCOMMODATION_REF.CLIENT_NO = CAST(NEPTUNE_BOOK.CLIENT_NO AS VARCHAR(20))
	LEFT JOIN
		(
		SELECT
			NEPTUNE_ACCOMMODATION.ACCOMMODATION_NO,
			'F' AS ClassCode,
			'Yacht               ' AS Class
		FROM
			NEPTUNE_Stage.dbo.NEPTUNE_ACCOMMODATION
		INNER JOIN
			NEPTUNE_Stage.dbo.NEPTUNE_APEX_ACCOM_TYPE NEPTUNE_APEX_ACCOM_TYPE
			ON
				NEPTUNE_APEX_ACCOM_TYPE.ACCOMMODATION_TYPE_DESC = NEPTUNE_ACCOMMODATION.ACCOMMODATION_TYPE_DESC
		INNER JOIN
			NEPTUNE_Stage.dbo.NEPTUNE_APEX_ACCOM_TYPE_GROUP NEPTUNE_APEX_ACCOM_TYPE_GROUP
			ON
				NEPTUNE_APEX_ACCOM_TYPE_GROUP.ACCOM_TYPE_GROUP_CODE = NEPTUNE_APEX_ACCOM_TYPE.ACCOM_TYPE_GROUP_CODE
			WHERE 
				ACCOM_CLASS IN ('Boats','Catamaran','Monohull','Powercat','Sunsail 40')	
				AND
				NEPTUNE_ACCOMMODATION.SUNSAIL_NO<>0
				AND
				NEPTUNE_ACCOMMODATION.YACHT_ROOM_IND='Y'
		)BOAT	
		ON
			BOAT.ACCOMMODATION_NO=NEPTUNE_ACCOMMODATION_REF.ACCOMMODATION_NO
		LEFT JOIN
		(	
		SELECT
			NEPTUNE_ACCOMMODATION.ACCOMMODATION_NO,
			'A' AS ClassCode,
			'Accommodation' AS Class
		FROM
			NEPTUNE_Stage.dbo.NEPTUNE_ACCOMMODATION
		INNER JOIN
			NEPTUNE_Stage.dbo.NEPTUNE_APEX_ACCOM_TYPE NEPTUNE_APEX_ACCOM_TYPE
			ON
				NEPTUNE_APEX_ACCOM_TYPE.ACCOMMODATION_TYPE_DESC = NEPTUNE_ACCOMMODATION.ACCOMMODATION_TYPE_DESC
			WHERE 
				NEPTUNE_ACCOMMODATION.YACHT_ROOM_IND='R'
		)ACCOM	
		ON
			ACCOM.ACCOMMODATION_NO=NEPTUNE_ACCOMMODATION_REF.ACCOMMODATION_NO
	WHERE 
		NEPTUNE_ACCOMMODATION_REF.CLIENT_NO IS NOT NULL
		AND 
		CONVERT(DATETIME,NEPTUNE_Stage.dbo.fn_Checkdate(CONVERT(INT,SUBSTRING(NEPTUNE_BOOK.START_DATE,7,4)+SUBSTRING(NEPTUNE_BOOK.START_DATE,4,2)+SUBSTRING(NEPTUNE_BOOK.START_DATE,1,2)))) >= '2010-01-01'
		AND
		NEPTUNE_BOOK.COMPANY_CODE IN ('1','2','5')
		AND
		NEPTUNE_BOOK.CLIENT_NO <> 0

	-- Extras
	INSERT INTO 
		ST_MARINE_FITN
	SELECT 
		CAST(CAST(103 AS VARCHAR(3)) 	
			+ RIGHT('0'+ CAST(CASE WHEN ISNUMERIC(NEPTUNE_BOOK.COMPANY_CODE) = 0 THEN '9' ELSE NEPTUNE_BOOK.COMPANY_CODE END AS VARCHAR(1)), 1)  
			+ RIGHT('0000000000'+ CAST(NEPTUNE_BOOK.CLIENT_NO AS VARCHAR(10)), 10) 
		AS BIGINT) AS i_Sk_Bkg,
		'EXT' AS ItineraryLineType,
		103 AS SourceSysID,
		'NEPTUNE' AS SystemName,
		'M' AS	DivisionCode,
		CASE WHEN NEPTUNE_BOOK.COMPANY_CODE IN ('1','2') THEN 'SUN'
			 WHEN NEPTUNE_BOOK.COMPANY_CODE = '5' THEN 'LBT' 
			 ELSE 'XXX' END AS BrandCode,
		RTRIM(LTRIM(NEPTUNE_BOOK.CLIENT_NO)) AS BkgRef,
		RANK() OVER 
			(
				PARTITION BY 
					NEPTUNE_EXTRAREF.CLIENT_NO
				ORDER BY 
					NEPTUNE_EXTRAREF.CLIENT_NO,
					NEPTUNE_EXTRAREF.EXTRAREF_NO
			)  AS ItinRef,
		CASE
			WHEN NEPTUNE_BOOK.OPT_BOOK = 'C' THEN 3
			WHEN NEPTUNE_BOOK.OPT_BOOK = 'X' THEN 8
			ELSE 1
		END AS Status,
		RTRIM(LTRIM(NEPTUNE_BOOK.COMPANY_CODE)) AS CompanyNo,
		NEPTUNE_BOOK.PACKAGE AS Package,
		NULL AS Charter,
		NEPTUNE_EXTRAREF.SEATS_REQD As Qty,
		NULL AS NoPax,
		CONVERT(INT,SUBSTRING(NEPTUNE_EXTRA.DATE,7,4)+SUBSTRING(NEPTUNE_EXTRA.DATE,4,2)+SUBSTRING(NEPTUNE_EXTRA.DATE,1,2)) AS ContractSvsStartDate,
		CONVERT(INT,SUBSTRING(NEPTUNE_EXTRA.END_DATE,7,4)+SUBSTRING(NEPTUNE_EXTRA.END_DATE,4,2)+SUBSTRING(NEPTUNE_EXTRA.END_DATE,1,2)) AS ContractSvsendDate,
		CONVERT(INT,SUBSTRING(NEPTUNE_EXTRAREF.ADDED_DATE,7,4)+SUBSTRING(NEPTUNE_EXTRAREF.ADDED_DATE,4,2)+SUBSTRING(NEPTUNE_EXTRAREF.ADDED_DATE,1,2)) AS EntryDate,
		NULL AS SvsLastAmendDate,
		NULL AS ContractDuration,
		NULL AS ItemStartDate,
		NULL AS ItemEndDate,
		NEPTUNE_EXTRA.DUR AS ItemDuration,
		NULL AS ItemAmountLocal,
		NULL AS TotalAmountLocal,
		NULL AS TotalAmountLocalForCancel,
		NULL AS DiscountLocal,
		NULL AS VatLocal,
		NULL AS TApercent,
		NULL AS UK_Vat,
		NULL AS CommissionLocal,
		NULL AS LastAmendUser,
		NEPTUNE_EXTRA.BASE AS BaseLocation,
		NULL AS Currency,
		NEPTUNE_EXTRA.TYPE AS ExtraCode,
		NEPTUNE_EXTRA.NAME AS ExtraCodeDesc,
		NULL AS RevenueTypeCode,
		NULL AS RevenueType, 
		NULL AS RevenueSubTypeCode,
		NULL AS RevenueSubType,
		NULL AS RevenueLine,
		NULL AS RevenueLineDesc,
		NULL AS RevenueGroupClub,
		NULL AS RevenueGroupDesc,
		NULL AS ClassCode,
		NULL AS Class,	
		NEPTUNE_EXTRAREF.ACCOMREF_NO AS ExtraNotes,
		NULL AS Origin,
		NULL AS SalesCategoryCode,
		NULL AS DepartAirport,
		NULL AS ArrivalAirport
	FROM 
		NEPTUNE_Stage.dbo.NEPTUNE_BOOK NEPTUNE_BOOK	
	LEFT JOIN
		NEPTUNE_Stage.dbo.NEPTUNE_EXTRAREF NEPTUNE_EXTRAREF
		ON
			NEPTUNE_EXTRAREF.CLIENT_NO = CAST(NEPTUNE_BOOK.CLIENT_NO AS VARCHAR(20))	
	LEFT JOIN
		NEPTUNE_Stage.dbo.NEPTUNE_EXTRA NEPTUNE_EXTRA
		ON
			NEPTUNE_EXTRA.EXTRA_NO = NEPTUNE_EXTRAREF.EXTRA_NO	
	WHERE 
		NEPTUNE_EXTRAREF.CLIENT_NO IS NOT NULL
		AND 
		CONVERT(DATETIME,NEPTUNE_Stage.dbo.fn_Checkdate(CONVERT(INT,SUBSTRING(NEPTUNE_BOOK.START_DATE,7,4)+SUBSTRING(NEPTUNE_BOOK.START_DATE,4,2)+SUBSTRING(NEPTUNE_BOOK.START_DATE,1,2)))) >= '2010-01-01'
		AND
		NEPTUNE_BOOK.COMPANY_CODE IN ('1','2','5')
		AND
		NEPTUNE_BOOK.CLIENT_NO <> 0
		
	-- Flights
	INSERT INTO 
		ST_MARINE_FITN
	SELECT 
		CAST(CAST(103 AS VARCHAR(3)) 	
			+ RIGHT('0'+ CAST(CASE WHEN ISNUMERIC(NEPTUNE_BOOK.COMPANY_CODE) = 0 THEN '9' ELSE NEPTUNE_BOOK.COMPANY_CODE END AS VARCHAR(1)), 1)  
			+ RIGHT('0000000000'+ CAST(NEPTUNE_BOOK.CLIENT_NO AS VARCHAR(10)), 10)  
		AS BIGINT) AS i_Sk_Bkg,
		'FLT' AS ItineraryLineType,
		103 AS SourceSysID,
		'NEPTUNE' AS SystemName,
		'M' AS	DivisionCode,
		CASE WHEN NEPTUNE_BOOK.COMPANY_CODE IN ('1','2') THEN 'SUN'
			 WHEN NEPTUNE_BOOK.COMPANY_CODE = '5' THEN 'LBT' 
			 ELSE 'XXX' END AS BrandCode,
		RTRIM(LTRIM(NEPTUNE_BOOK.CLIENT_NO)) AS BkgRef,
		RANK() OVER 
			(
				PARTITION BY 
					NEPTUNE_FLIGHT_REF.CLIENT_NO
				ORDER BY 
					NEPTUNE_FLIGHT_REF.CLIENT_NO,
					NEPTUNE_FLIGHT_REF.FLIGHTRENO
			)  AS ItinRef,
		CASE
			WHEN NEPTUNE_BOOK.OPT_BOOK = 'C' THEN 3
			WHEN NEPTUNE_BOOK.OPT_BOOK = 'X' THEN 8
			ELSE 1
		END AS Status,
		RTRIM(LTRIM(NEPTUNE_BOOK.COMPANY_CODE)) AS CompanyNo,
		NEPTUNE_BOOK.PACKAGE AS Package,
		NULL AS Charter,
		1 As Qty,
		NULL AS NoPax,
		NULL AS ContractSvsStartDate,
		NULL AS ContractSvsendDate,
		CONVERT(INT,CONVERT(VARCHAR(8),CONVERT(DATETIME,NEPTUNE_Stage.dbo.fn_Checkdate(CONVERT(INT,SUBSTRING(CONF_DATE,7,4)+SUBSTRING(CONF_DATE,4,2)+SUBSTRING(CONF_DATE,1,2)))),112)) AS EntryDate,
		NULL AS SvsLastAmendDate,
		NULL AS ContractDuration,
		CONVERT(INT,CONVERT(VARCHAR(8),CONVERT(DATETIME,NEPTUNE_Stage.dbo.fn_Checkdate(CONVERT(INT,SUBSTRING(NEPTUNE_FLIGHT.DEP_DATE,7,4)+SUBSTRING(NEPTUNE_FLIGHT.DEP_DATE,4,2)+SUBSTRING(NEPTUNE_FLIGHT.DEP_DATE,1,2)))),112)) AS ItemStartDate,
		CONVERT(INT,CONVERT(VARCHAR(8),CONVERT(DATETIME,NEPTUNE_Stage.dbo.fn_Checkdate(CONVERT(INT,SUBSTRING(NEPTUNE_FLIGHT.ARR_DATE,7,4)+SUBSTRING(NEPTUNE_FLIGHT.ARR_DATE,4,2)+SUBSTRING(NEPTUNE_FLIGHT.ARR_DATE,1,2)))),112)) AS ItemEndDate,
		DATEDIFF(d,CONVERT(DATETIME,NEPTUNE_Stage.dbo.fn_Checkdate(CONVERT(INT,SUBSTRING(NEPTUNE_FLIGHT.DEP_DATE,7,4)+SUBSTRING(NEPTUNE_FLIGHT.DEP_DATE,4,2)+SUBSTRING(NEPTUNE_FLIGHT.DEP_DATE,1,2)))),
		CONVERT(DATETIME,NEPTUNE_Stage.dbo.fn_Checkdate(CONVERT(INT,SUBSTRING(NEPTUNE_FLIGHT.ARR_DATE,7,4)+SUBSTRING(NEPTUNE_FLIGHT.ARR_DATE,4,2)+SUBSTRING(NEPTUNE_FLIGHT.ARR_DATE,1,2))))) AS ItemDuration,
		NULL AS ItemAmountLocal,
		NULL AS TotalAmountLocal,
		NULL AS TotalAmountLocalForCancel,
		NULL AS DiscountLocal,
		NULL AS VatLocal,
		NULL AS TApercent,
		NULL AS UK_Vat,
		NULL AS CommissionLocal,
		NULL AS LastAmendUser,
		NULL AS BaseLocation,
		NULL AS Currency,
		LTRIM(RTRIM(CARRIER))+LTRIM(RTRIM(REF)) AS ExtraCode,
		NULL AS ExtraCodeDesc,
		NULL AS RevenueTypeCode,
		NULL AS RevenueType, 
		NULL AS RevenueSubTypeCode,
		NULL AS RevenueSubType,
		NULL AS RevenueLine,
		NULL AS RevenueLineDesc,
		NULL AS RevenueGroupClub,
		NULL AS RevenueGroupDesc,
		NULL AS ClassCode,
		NULL AS Class,
		NULL AS ExtraNotes, 
		NULL AS Origin,
		NULL AS SalesCategoryCode,
		DEP_AIRPORT AS DepartAirport,
		ARR_AIRPORT AS ArrivalAirport
	FROM 
		NEPTUNE_Stage.dbo.NEPTUNE_BOOK NEPTUNE_BOOK	
	LEFT JOIN
		NEPTUNE_Stage.dbo.NEPTUNE_FLIGHT_REF NEPTUNE_FLIGHT_REF
		ON
			NEPTUNE_FLIGHT_REF.CLIENT_NO = CAST(NEPTUNE_BOOK.CLIENT_NO AS VARCHAR(20))	
	LEFT JOIN
		NEPTUNE_Stage.dbo.NEPTUNE_FLIGHT NEPTUNE_FLIGHT
		ON
			NEPTUNE_FLIGHT_REF.FLIGHT_NO = NEPTUNE_FLIGHT.FLIGHT_NO
	WHERE 
		NEPTUNE_FLIGHT_REF.CLIENT_NO IS NOT NULL	
		AND 
		CONVERT(DATETIME,NEPTUNE_Stage.dbo.fn_Checkdate(CONVERT(INT,SUBSTRING(NEPTUNE_BOOK.START_DATE,7,4)+SUBSTRING(NEPTUNE_BOOK.START_DATE,4,2)+SUBSTRING(NEPTUNE_BOOK.START_DATE,1,2)))) >= '2010-01-01'
		AND
		NEPTUNE_BOOK.COMPANY_CODE IN ('1','2','5')
		AND
		NEPTUNE_BOOK.CLIENT_NO <> 0
	
	--- Revenue
	/*
	INSERT INTO 
		ST_MARINE_FITN
	SELECT 
		CAST(CAST(103 AS VARCHAR(3)) 	
			+ RIGHT('0'+ CAST(CASE WHEN ISNUMERIC(NEPTUNE_BOOK.COMPANY_CODE) = 0 THEN '9' ELSE NEPTUNE_BOOK.COMPANY_CODE END AS VARCHAR(1)), 1)  
			+ RIGHT('0000000000'+ CAST(NEPTUNE_BOOK.CLIENT_NO AS VARCHAR(10)), 10) 
		AS BIGINT) AS i_Sk_Bkg,
		'REV' AS ItineraryLineType,
		103 AS SourceSysID,
		'NEPTUNE' AS SystemName,
		'M' AS	DivisionCode,
		CASE WHEN NEPTUNE_BOOK.COMPANY_CODE IN ('1','2') THEN 'SUN'
			 WHEN NEPTUNE_BOOK.COMPANY_CODE = '5' THEN 'LBT' 
			 ELSE 'XXX' END AS Brandcode,
		RTRIM(LTRIM(NEPTUNE_BOOK.CLIENT_NO)) AS BkgRef,
		ROW_NUMBER () OVER 
			(
				PARTITION BY 
					NEPTUNE_BKPRICE.CLIENT_NO
				ORDER BY 
					NEPTUNE_BKPRICE.CLIENT_NO,
					NEPTUNE_BKPRICE.TAG
			)  AS ItinRef,
		CASE
			WHEN NEPTUNE_BOOK.OPT_BOOK = 'C' THEN 3
			WHEN NEPTUNE_BOOK.OPT_BOOK = 'X' THEN 8
			ELSE 1
		END AS Status,
		RTRIM(LTRIM(NEPTUNE_BOOK.COMPANY_CODE)) AS CompanyNo,
		NEPTUNE_BOOK.PACKAGE As Package,
		NULL AS Charter,
		CASE WHEN INV_OR_CR ='C' THEN -NEPTUNE_BKPRICE.QTY  ELSE NEPTUNE_BKPRICE.QTY END AS Qty,
		1 AS NoPax,
		CASE WHEN NEPTUNE_BKPRICE.START_DATE <>'' 
			THEN
				CONVERT(INT,SUBSTRING(NEPTUNE_BKPRICE.START_DATE,7,4)+SUBSTRING(NEPTUNE_BKPRICE.START_DATE,4,2)+SUBSTRING(NEPTUNE_BKPRICE.START_DATE,1,2)) 
			ELSE
				CONVERT(INT,SUBSTRING(NEPTUNE_BOOK.START_DATE,7,4)+SUBSTRING(NEPTUNE_BOOK.START_DATE,4,2)+SUBSTRING(NEPTUNE_BOOK.START_DATE,1,2)) 
			END
			AS ContractSvsStartDate,
		NULL AS ContractSvsEndDate,
		CONVERT(INT,CONVERT(VARCHAR(8),CONVERT(DATETIME,NEPTUNE_Stage.dbo.fn_Checkdate(CONVERT(INT,SUBSTRING(CONF_DATE,7,4)+SUBSTRING(CONF_DATE,4,2)+SUBSTRING(CONF_DATE,1,2)))),112)) AS EntryDate,
		NULL AS SvsLastAmendDate,
		NULL AS ContractDuration,
		NULL AS ItemStartDate,
		NULL AS ItemEndDate,
		NULL AS ItemDuration,
		NEPTUNE_BKPRICE.UNIT_PRICE AS ItemAmountLocal,
		NEPTUNE_BKPRICE.UNIT_PRICE *NEPTUNE_BKPRICE.QTY AS TotalAmountLocal,
		NULL AS TotalAmountLocalForCancel,
		NEPTUNE_BKPRICE.PERC AS DiscountLocal,
		NEPTUNE_BKPRICE.EX_VAT AS VatLocal,
		NEPTUNE_BKPRICE.VAT_RATE AS TApercent,
		(NEPTUNE_BKPRICE.UNIT_PRICE *NEPTUNE_BKPRICE.QTY)*(NEPTUNE_BKPRICE.VAT_RATE)/(100.00+NEPTUNE_BKPRICE.VAT_RATE) AS UK_Vat,
		NEPTUNE_BKPRICE.COMMISSION AS CommisionLocal,
		NULL AS LastAmendUser,  
		NEPTUNE_BOOK.BASE_CODE AS BaseLocation, 
		SB_NEPTUNE_EXCHRATES.a_EFT_CODE AS Currency,
		NEPTUNE_BKPRICE.PRICE_CODE AS ExtraCode,
		NEPTUNE_BKPRICE.PRICE_DESC AS ExtraCodeDesc,
		NEPTUNE_BKPRICE.SALES_CAT AS RevenueTypeCode,
		SB_MARINE_REVENUE.SalesCategory AS RevenueType, 
		NEPTUNE_BKPRICE.PRICE_CAT AS RevenueSubTypeCode,
		NULL AS RevenueSubType,
		SB_MARINE_REVENUE.RevenueCode AS RevenueLine,
		SB_MARINE_REVENUE.RevenueDesc AS RevenueLineDesc,
		SB_MARINE_REVENUE.RevenueGroupCode AS RevenueGroupClub,
		SB_MARINE_REVENUE.RevenueGroupDesc AS RevenueGroupDesc,
		RevenueTypeCode AS ClassCode,
		RevenueType AS Class,
		NULL AS ExtraNotes,
		NEPTUNE_BKPRICE.ORIGIN AS Origin,
		SALES_CAT AS SalesCategoryCode,
		NULL AS DepartAirport,
		NULL AS ArrivalAirport
	FROM 
		NEPTUNE_Stage.dbo.NEPTUNE_BOOK NEPTUNE_BOOK
	LEFT JOIN
		NEPTUNE_Stage.dbo.NEPTUNE_BKPRICE NEPTUNE_BKPRICE
		ON
			NEPTUNE_BKPRICE.CLIENT_NO = CAST(NEPTUNE_BOOK.CLIENT_NO AS VARCHAR(20))
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_REVENUE SB_MARINE_REVENUE 
		ON
			SB_MARINE_REVENUE.PriceCode = NEPTUNE_BKPRICE.PRICE_CODE
			AND
			SB_MARINE_REVENUE.CompanyCode = NEPTUNE_BOOK.COMPANY_CODE	
			AND
			SB_MARINE_REVENUE.Origin = NEPTUNE_BKPRICE.ORIGIN	
			AND
			SB_MARINE_REVENUE.SalesCategoryCode = NEPTUNE_BKPRICE.SALES_CAT
	LEFT JOIN
		AMI_Static.dbo.SB_NEPTUNE_EXCHRATES SB_NEPTUNE_EXCHRATES
		ON
			NEPTUNE_BOOK.ORIGIN = SB_NEPTUNE_EXCHRATES.a_ORIGIN	
	WHERE 
		NEPTUNE_BKPRICE.CLIENT_NO IS NOT NULL
		AND 
		CONVERT(DATETIME,NEPTUNE_Stage.dbo.fn_Checkdate(CONVERT(INT,SUBSTRING(NEPTUNE_BOOK.START_DATE,7,4)+SUBSTRING(NEPTUNE_BOOK.START_DATE,4,2)+SUBSTRING(NEPTUNE_BOOK.START_DATE,1,2)))) >= '2010-01-01'
		AND
		NEPTUNE_BOOK.COMPANY_CODE IN ('1','2','5')
		AND
		NEPTUNE_BOOK.CLIENT_NO <> 0
		*/
	INSERT INTO 
		ST_MARINE_FITN	
	SELECT 
		CAST(CAST(103 AS VARCHAR(3)) 	
			+ RIGHT('0'+ CAST(CASE WHEN ISNUMERIC(NEPTUNE_BOOK.COMPANY_CODE) = 0 THEN '9' ELSE NEPTUNE_BOOK.COMPANY_CODE END AS VARCHAR(1)), 1)  
			+ RIGHT('0000000000'+ CAST(NEPTUNE_BOOK.CLIENT_NO AS VARCHAR(10)), 10) 
		AS BIGINT) AS i_Sk_Bkg,
		'REV' AS ItineraryLineType,
		103 AS SourceSysID,
		'NEPTUNE' AS SystemName,
		'M' AS	DivisionCode,
		CASE WHEN NEPTUNE_BOOK.COMPANY_CODE IN ('1','2') THEN 'SUN'
			 WHEN NEPTUNE_BOOK.COMPANY_CODE = '5' THEN 'LBT' 
			 ELSE 'XXX' END AS Brandcode,
		RTRIM(LTRIM(NEPTUNE_BOOK.CLIENT_NO)) AS BkgRef,
		ROW_NUMBER () OVER 
			(
				PARTITION BY 
					NEPTUNE_BKPRICE.CLIENT_NO
				ORDER BY 
					NEPTUNE_BKPRICE.CLIENT_NO,
					NEPTUNE_BKPRICE.TAG
			)  AS ItinRef,
		CASE
			WHEN NEPTUNE_BOOK.OPT_BOOK = 'C' THEN 3
			WHEN NEPTUNE_BOOK.OPT_BOOK = 'X' THEN 8
			ELSE 1
		END AS Status,
		RTRIM(LTRIM(NEPTUNE_BOOK.COMPANY_CODE)) AS CompanyNo,
		NEPTUNE_BOOK.PACKAGE As Package,
		NULL AS Charter,
		CASE WHEN INV_OR_CR ='C' THEN -NEPTUNE_BKPRICE.QTY  ELSE NEPTUNE_BKPRICE.QTY END AS Qty,
		1 AS NoPax,
		CASE WHEN NEPTUNE_BKPRICE.START_DATE <>'' 
			THEN
				CONVERT(INT,SUBSTRING(NEPTUNE_BKPRICE.START_DATE,7,4)+SUBSTRING(NEPTUNE_BKPRICE.START_DATE,4,2)+SUBSTRING(NEPTUNE_BKPRICE.START_DATE,1,2)) 
			ELSE
				CONVERT(INT,SUBSTRING(NEPTUNE_BOOK.START_DATE,7,4)+SUBSTRING(NEPTUNE_BOOK.START_DATE,4,2)+SUBSTRING(NEPTUNE_BOOK.START_DATE,1,2)) 
			END
			AS ContractSvsStartDate,
		NULL AS ContractSvsEndDate,
		CONVERT(INT,CONVERT(VARCHAR(8),CONVERT(DATETIME,NEPTUNE_Stage.dbo.fn_Checkdate(CONVERT(INT,SUBSTRING(CONF_DATE,7,4)+SUBSTRING(CONF_DATE,4,2)+SUBSTRING(CONF_DATE,1,2)))),112)) AS EntryDate,
		NULL AS SvsLastAmendDate,
		NULL AS ContractDuration,
		NULL AS ItemStartDate,
		NULL AS ItemEndDate,
		NULL AS ItemDuration,
		NEPTUNE_BKPRICE.UNIT_PRICE AS ItemAmountLocal,
		NEPTUNE_BKPRICE.UNIT_PRICE *NEPTUNE_BKPRICE.QTY AS TotalAmountLocal,
		NULL AS TotalAmountLocalForCancel,
		NEPTUNE_BKPRICE.PERC AS DiscountLocal,
		NEPTUNE_BKPRICE.EX_VAT AS VatLocal,
		NEPTUNE_BKPRICE.VAT_RATE AS TApercent,
		(NEPTUNE_BKPRICE.UNIT_PRICE *NEPTUNE_BKPRICE.QTY)*(NEPTUNE_BKPRICE.VAT_RATE)/(100.00+NEPTUNE_BKPRICE.VAT_RATE) AS UK_Vat,
		NEPTUNE_BKPRICE.COMMISSION AS CommisionLocal,
		NULL AS LastAmendUser,  
		NEPTUNE_BOOK.BASE_CODE AS BaseLocation, 
		SB_NEPTUNE_EXCHRATES.a_EFT_CODE AS Currency,
		NEPTUNE_BKPRICE.PRICE_CODE AS ExtraCode,
		NEPTUNE_BKPRICE.PRICE_DESC AS ExtraCodeDesc,
		NEPTUNE_BKPRICE.SALES_CAT AS RevenueTypeCode,
		NULL AS RevenueType, 
		NEPTUNE_BKPRICE.PRICE_CAT AS RevenueSubTypeCode,
		NULL AS RevenueSubType,
		SB_MARINE_REVENUE.RevenueCode AS RevenueLine,
		SB_MARINE_REVENUE.RevenueDesc AS RevenueLineDesc,
		SB_MARINE_REVENUE.RevenueGroupCode AS RevenueGroupClub,
		SB_MARINE_REVENUE.RevenueGroupDesc AS RevenueGroupDesc,
		SB_MARINE_REVENUE.RevenueTypeCode AS ClassCode,
		SB_MARINE_REVENUE.RevenueType AS Class,
		NULL AS ExtraNotes,
		NEPTUNE_BKPRICE.ORIGIN AS Origin,
		SALES_CAT AS SalesCategoryCode,
		NULL AS DepartAirport,
		NULL AS ArrivalAirport
	FROM 
		NEPTUNE_Stage.dbo.NEPTUNE_BOOK NEPTUNE_BOOK
	LEFT JOIN
		NEPTUNE_Stage.dbo.NEPTUNE_BKPRICE NEPTUNE_BKPRICE
		ON
			NEPTUNE_BKPRICE.CLIENT_NO = CAST(NEPTUNE_BOOK.CLIENT_NO AS VARCHAR(20))
	LEFT JOIN 
		AMI_Static.dbo.SB_MARINE_REVENUE  SB_MARINE_REVENUE 
		ON
			SB_MARINE_REVENUE.PriceCode = NEPTUNE_BKPRICE.PRICE_CODE
			AND
			SB_MARINE_REVENUE.CompanyCode = NEPTUNE_BOOK.COMPANY_CODE	
			AND
			SB_MARINE_REVENUE.SourceSystemID = 103
	LEFT JOIN
		AMI_Static.dbo.SB_NEPTUNE_EXCHRATES SB_NEPTUNE_EXCHRATES
		ON
			NEPTUNE_BOOK.ORIGIN = SB_NEPTUNE_EXCHRATES.a_ORIGIN	
	WHERE 
		NEPTUNE_BKPRICE.CLIENT_NO IS NOT NULL
		AND 
		CONVERT(DATETIME,NEPTUNE_Stage.dbo.fn_Checkdate(CONVERT(INT,SUBSTRING(NEPTUNE_BOOK.START_DATE,7,4)+SUBSTRING(NEPTUNE_BOOK.START_DATE,4,2)+SUBSTRING(NEPTUNE_BOOK.START_DATE,1,2)))) >= '2010-01-01'
		AND
		NEPTUNE_BOOK.COMPANY_CODE IN ('1','2','5')
		AND
		NEPTUNE_BOOK.CLIENT_NO <> 0

		
	EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'NPTN','ST_FITN'
		
		
	
	
	

GO
/****** Object:  StoredProcedure [dbo].[BUILD_ST_MARINE_FLIGHTINVENTORY]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[BUILD_ST_MARINE_FLIGHTINVENTORY]
AS

	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'NPTN','ST_FLINV','BUILD_ST_MARINE_FLIGHTINVENTORY'

	TRUNCATE TABLE ST_MARINE_FLIGHTINVENTORY

	INSERT INTO 
		ST_MARINE_FLIGHTINVENTORY
	SELECT 
		CONVERT(VARCHAR(10),NEPTUNE_FLIGHT.FLIGHT_NO) + ISNULL(RIGHT('00' + NEPTUNE_FLIGHT_ALLOC.ALLOC_VALUE ,2),'00') AS i_SK_FltInv,
		NEPTUNE_FLIGHT.FLIGHT_NO AS FlightNumber, 	
		103 AS SourceSyID,	
		'SUN' AS BrandCode,
		0 AS i_SK_Bkg,
		0 AS BkgRef,
		0 AS i_SK_Pax,
		NULL AS OptionDate,
		NULL AS ConfirmDate,
		ISNULL(LTRIM(RTRIM(NEPTUNE_FLIGHT_ALLOC.ALLOC_VALUE)),0) AS NoDays,
		LTRIM(RTRIM([TYPE])) AS FltType,
		LTRIM(RTRIM(REF)) AS FlightRef,
		LTRIM(RTRIM(CARRIER)) + LTRIM(RTRIM(REF)) AS FlightCd,
		LTRIM(RTRIM(CARRIER)) AS Carrier,
		--LTRIM(RTRIM(FLLOCATOR)) AS Locator,
		LTRIM(RTRIM(OUT_OR_IN)) AS InOutFlag,
		SEAT_PRICE AS SeatPrice,
		SC_SEAT_PRICE AS ChildSeatPrice,
		LTRIM(RTRIM(DEP_AIRPORT)) AS DepAirport,
		CONVERT(INT,SUBSTRING(DEP_DATE,7,4)+SUBSTRING(DEP_DATE,4,2)+SUBSTRING(DEP_DATE,1,2)) AS DepDate,
		CONVERT(INT,REPLACE(DEP_TIME,'.','')) AS DepTime,
		LTRIM(RTRIM(ARR_AIRPORT)) AS ArrAirport,
		CONVERT(INT,SUBSTRING(ARR_DATE,7,4)+SUBSTRING(ARR_DATE,4,2)+SUBSTRING(ARR_DATE,1,2)) AS ArrDate,
		CONVERT(INT,REPLACE(ARR_TIME,'.','')) AS ArrTime,
		DEP_NO AS DepNo,
		LTRIM(RTRIM(ORIGIN)) AS Origin,
		NEPTUNE_FLIGHT.TOTAL_SEATS AS SUMTotalSeats,
		[OPTION] AS SUMOptionSeats,
		CONFD AS SUMConfirmSeats,
		WAIT AS SUMWaitSeats,
		FREE AS SUMFreeSeats,
		NEPTUNE_FLIGHT_ALLOC.TOTAL_SEATS AS TotalSeats,
		NEPTUNE_FLIGHT_ALLOC.OPT_SEATS AS OptionSeats,
		NEPTUNE_FLIGHT_ALLOC.CONFD_SEATS AS ConfirmSeats,
		NEPTUNE_FLIGHT_ALLOC.WAIT_SEATS AS WaitSeats,
		NEPTUNE_FLIGHT_ALLOC.FREE_SEATS AS FreeSeats,
		NEPTUNE_FLIGHT_ALLOC_BB.TOTAL_SEATS AS BB_TotalSeats,
		NEPTUNE_FLIGHT_ALLOC_BB.OPT_SEATS AS BB_OptionSeats,
		NEPTUNE_FLIGHT_ALLOC_BB.CONFD_SEATS AS BB_ConfirmSeats,
		NEPTUNE_FLIGHT_ALLOC_BB.WAIT_SEATS AS BB_WaitSeats,
		NEPTUNE_FLIGHT_ALLOC_BB.FREE_SEATS AS BB_FreeSeats,
		NEPTUNE_FLIGHT_ALLOC_FO.TOTAL_SEATS AS FO_TotalSeats,
		NEPTUNE_FLIGHT_ALLOC_FO.OPT_SEATS AS FO_OptionSeats,
		NEPTUNE_FLIGHT_ALLOC_FO.CONFD_SEATS AS FO_ConfirmSeats,
		NEPTUNE_FLIGHT_ALLOC_FO.WAIT_SEATS AS FO_WaitSeats,
		NEPTUNE_FLIGHT_ALLOC_FO.FREE_SEATS AS FO_FreeSeats,
		NEPTUNE_FLIGHT_ALLOC_FL.TOTAL_SEATS AS FL_TotalSeats,
		NEPTUNE_FLIGHT_ALLOC_FL.OPT_SEATS AS FL_OptionSeats,
		NEPTUNE_FLIGHT_ALLOC_FL.CONFD_SEATS AS FL_ConfirmSeats,
		NEPTUNE_FLIGHT_ALLOC_FL.WAIT_SEATS AS FL_WaitSeats,
		NEPTUNE_FLIGHT_ALLOC_FL.FREE_SEATS AS FL_FreeSeats,
		NEPTUNE_FLIGHT_ALLOC_CL.TOTAL_SEATS AS CL_TotalSeats,
		NEPTUNE_FLIGHT_ALLOC_CL.OPT_SEATS AS CL_OptionSeats,
		NEPTUNE_FLIGHT_ALLOC_CL.CONFD_SEATS AS CL_ConfirmSeats,
		NEPTUNE_FLIGHT_ALLOC_CL.WAIT_SEATS AS CL_WaitSeats,
		NEPTUNE_FLIGHT_ALLOC_CL.FREE_SEATS AS CL_FreeSeats,
		FO_TOTAL_SEATS AS FOTotalSeats,
		FO_OPTION AS FOOptionSeats,
		FO_CONFD AS FOConfirmSeats,
		FO_WAIT AS FOWaitSeats, 
		FO_FREE AS FOFreeSeats,
		LTRIM(RTRIM(TICKETS)) AS Ticket,
		LTRIM(RTRIM(MAINIFEST)) AS Manifest,
		LTRIM(RTRIM(BAGGAGE)) AS Baggage,
		CHECK_IN_TIME AS CheckINTime,
		LTRIM(RTRIM(CHECK_IN_TERM)) AS CheckInTerminal,
		LTRIM(RTRIM([ROUTE])) AS FlightRoute,
		MAX_7_DAY AS Max7Day,
		[7_DAY] AS [7DayRemain],
		LTRIM(RTRIM([7_DAY_STOP])) AS [7DayStop],
		FO_MAX_7_DAY AS FO_Max7Day,
		FO_7_DAY_REMAIN AS FO_7DayRemain,
		LTRIM(RTRIM(FO_7_DAY_STOP)) AS FO_7DayStop,
		COLOR AS Colors,
		LTRIM(RTRIM(CLASS)) AS Class,
		LTRIM(RTRIM(INTERNET_USE)) AS InernetUse,
		LTRIM(RTRIM(IN_USE)) AS InUse,
		LAST_ALLOC_NO AS LastAlloc,
		TOTAL_ONFLT AS TotalOnFlight,
		OPT_ONFLT AS OptionOnFlight,
		CONFD_ONFLT AS ConfirmOnFlight,
		WAIT_ONFLT AS WaitOnFlight,
		FREE_ONFLT AS FreeOnFlight,
		HAS_ALTERNATIVES AS HasAlternative,
		ON_REQUEST As OnRequest,
		I5_MANAGED AS NeptuneManaged
	FROM 
		NEPTUNE_FLIGHT
	LEFT  JOIN
		(
		SELECT  
			FLIGHT_NO,
			MAX(ALLOC_NO) AS ALLOC_NO,
			ALLOC_VALUE
		FROM 
			NEPTUNE_FLIGHT_ALLOC
		WHERE 
			ALLOC_CODE = 'D'
		GROUP BY
			FLIGHT_NO,
			ALLOC_VALUE
		)VW_NEPTUNE_FLIGHT_ALLOC
			ON
				VW_NEPTUNE_FLIGHT_ALLOC.FLIGHT_NO = NEPTUNE_FLIGHT.FLIGHT_NO
	LEFT JOIN
		NEPTUNE_FLIGHT_ALLOC
		ON
			NEPTUNE_FLIGHT_ALLOC.FLIGHT_NO  = VW_NEPTUNE_FLIGHT_ALLOC.FLIGHT_NO 
			AND
			NEPTUNE_FLIGHT_ALLOC.ALLOC_VALUE  = VW_NEPTUNE_FLIGHT_ALLOC.ALLOC_VALUE 
			AND
			NEPTUNE_FLIGHT_ALLOC.ALLOC_NO  = VW_NEPTUNE_FLIGHT_ALLOC.ALLOC_NO 
	LEFT JOIN 
		(
		SELECT  
			FLIGHT_NO,
			MAX(ALLOC_NO) AS ALLOC_NO,
			PARENT_ALLOC,
			ALLOC_VALUE
		FROM 
			NEPTUNE_FLIGHT_ALLOC
		WHERE 
			ALLOC_VALUE = 'BB'
		GROUP BY
			FLIGHT_NO,
			PARENT_ALLOC,
			ALLOC_VALUE
		)VW_NEPTUNE_FLIGHT_ALLOC_BB
		ON
			VW_NEPTUNE_FLIGHT_ALLOC_BB.FLIGHT_NO = NEPTUNE_FLIGHT_ALLOC.FLIGHT_NO
			AND
			VW_NEPTUNE_FLIGHT_ALLOC_BB.PARENT_ALLOC = NEPTUNE_FLIGHT_ALLOC.ALLOC_NO
	LEFT JOIN
		NEPTUNE_FLIGHT_ALLOC NEPTUNE_FLIGHT_ALLOC_BB
		ON
			NEPTUNE_FLIGHT_ALLOC_BB.FLIGHT_NO = VW_NEPTUNE_FLIGHT_ALLOC_BB.FLIGHT_NO
			AND
			NEPTUNE_FLIGHT_ALLOC_BB.ALLOC_VALUE = VW_NEPTUNE_FLIGHT_ALLOC_BB.ALLOC_VALUE
			AND
			NEPTUNE_FLIGHT_ALLOC_BB.ALLOC_NO = VW_NEPTUNE_FLIGHT_ALLOC_BB.ALLOC_NO 
	LEFT JOIN 
		(
		SELECT  
			FLIGHT_NO,
			MAX(ALLOC_NO) AS ALLOC_NO,
			PARENT_ALLOC,
			ALLOC_VALUE
		FROM 
			NEPTUNE_FLIGHT_ALLOC
		WHERE 
			ALLOC_VALUE = 'FO'
		GROUP BY
			FLIGHT_NO,
			PARENT_ALLOC,
			ALLOC_VALUE
		)VW_NEPTUNE_FLIGHT_ALLOC_FO
		ON
			VW_NEPTUNE_FLIGHT_ALLOC_FO.FLIGHT_NO = NEPTUNE_FLIGHT_ALLOC.FLIGHT_NO
			AND
			VW_NEPTUNE_FLIGHT_ALLOC_FO.PARENT_ALLOC = NEPTUNE_FLIGHT_ALLOC.ALLOC_NO
	LEFT JOIN
		NEPTUNE_FLIGHT_ALLOC NEPTUNE_FLIGHT_ALLOC_FO
		ON
			NEPTUNE_FLIGHT_ALLOC_FO.FLIGHT_NO = VW_NEPTUNE_FLIGHT_ALLOC_FO.FLIGHT_NO
			AND
			NEPTUNE_FLIGHT_ALLOC_FO.ALLOC_VALUE = VW_NEPTUNE_FLIGHT_ALLOC_FO.ALLOC_VALUE
			AND
			NEPTUNE_FLIGHT_ALLOC_FO.ALLOC_NO = VW_NEPTUNE_FLIGHT_ALLOC_FO.ALLOC_NO 
	LEFT JOIN 
		(
		SELECT  
			FLIGHT_NO,
			MAX(ALLOC_NO) AS ALLOC_NO,
			PARENT_ALLOC,
			ALLOC_VALUE
		FROM 
			NEPTUNE_FLIGHT_ALLOC
		WHERE 
			ALLOC_VALUE = 'FL'
		GROUP BY
			FLIGHT_NO,
			PARENT_ALLOC,
			ALLOC_VALUE
		)VW_NEPTUNE_FLIGHT_ALLOC_FL
		ON
			VW_NEPTUNE_FLIGHT_ALLOC_FL.FLIGHT_NO = NEPTUNE_FLIGHT_ALLOC.FLIGHT_NO
			AND
			VW_NEPTUNE_FLIGHT_ALLOC_FL.PARENT_ALLOC = NEPTUNE_FLIGHT_ALLOC.ALLOC_NO
	LEFT JOIN
		NEPTUNE_FLIGHT_ALLOC NEPTUNE_FLIGHT_ALLOC_FL
		ON
			NEPTUNE_FLIGHT_ALLOC_FL.FLIGHT_NO = VW_NEPTUNE_FLIGHT_ALLOC_FL.FLIGHT_NO
			AND
			NEPTUNE_FLIGHT_ALLOC_FL.ALLOC_VALUE = VW_NEPTUNE_FLIGHT_ALLOC_FL.ALLOC_VALUE
			AND
			NEPTUNE_FLIGHT_ALLOC_FL.ALLOC_NO = VW_NEPTUNE_FLIGHT_ALLOC_FL.ALLOC_NO 
	LEFT JOIN 
		(
		SELECT  
			FLIGHT_NO,
			MAX(ALLOC_NO) AS ALLOC_NO,
			PARENT_ALLOC,
			ALLOC_VALUE
		FROM 
			NEPTUNE_FLIGHT_ALLOC
		WHERE 
			ALLOC_VALUE = 'CL'
		GROUP BY
			FLIGHT_NO,
			PARENT_ALLOC,
			ALLOC_VALUE
		)VW_NEPTUNE_FLIGHT_ALLOC_CL
		ON
			VW_NEPTUNE_FLIGHT_ALLOC_CL.FLIGHT_NO = NEPTUNE_FLIGHT_ALLOC.FLIGHT_NO
			AND
			VW_NEPTUNE_FLIGHT_ALLOC_CL.PARENT_ALLOC = NEPTUNE_FLIGHT_ALLOC.ALLOC_NO
	LEFT JOIN
		NEPTUNE_FLIGHT_ALLOC NEPTUNE_FLIGHT_ALLOC_CL
		ON
			NEPTUNE_FLIGHT_ALLOC_CL.FLIGHT_NO = VW_NEPTUNE_FLIGHT_ALLOC_CL.FLIGHT_NO
			AND
			NEPTUNE_FLIGHT_ALLOC_CL.ALLOC_VALUE = VW_NEPTUNE_FLIGHT_ALLOC_CL.ALLOC_VALUE
			AND
			NEPTUNE_FLIGHT_ALLOC_CL.ALLOC_NO = VW_NEPTUNE_FLIGHT_ALLOC_CL.ALLOC_NO 
	WHERE 
		CONVERT(INT,SUBSTRING(DEP_DATE,7,4)+SUBSTRING(DEP_DATE,4,2)+SUBSTRING(DEP_DATE,1,2)) > 20100101
		
				
	INSERT INTO 
		ST_MARINE_FLIGHTINVENTORY
	SELECT 
		CONVERT(VARCHAR(10),NEPTUNE_FLIGHT.FLIGHT_NO) + ISNULL(RIGHT('00' + NEPTUNE_FLIGHT_ALLOC_D.ALLOC_VALUE ,2),'00') AS i_SK_FltInv,
		NEPTUNE_FLIGHT.FLIGHT_NO AS FlightNumber, 	
		103 AS SourceSyID,	
		ST_MARINE_FBKG.BrandCode AS BrandCode,
		ST_MARINE_FBKG.i_SK_Bkg AS i_SK_Bkg,
		ST_MARINE_FBKG.BkgRef AS BkgRef,
		MARINE_PAXFLIGHT.i_SK_Pax AS i_SK_Pax,
		ST_MARINE_FBKG.OptionDate AS OptionDate,
		ST_MARINE_FBKG.ConfirmDate AS ConfirmDate,
		ISNULL(LTRIM(RTRIM(NEPTUNE_FLIGHT_ALLOC_D.ALLOC_VALUE)),0) AS NoDays,
		LTRIM(RTRIM([TYPE])) AS FltType,
		LTRIM(RTRIM(REF)) AS FlightRef,
		LTRIM(RTRIM(CARRIER)) + LTRIM(RTRIM(REF)) AS FlightCd,
		LTRIM(RTRIM(CARRIER)) AS Carrier,
		--LTRIM(RTRIM(FLLOCATOR)) AS Locator,
		LTRIM(RTRIM(OUT_OR_IN)) AS InOutFlag,
		SEAT_PRICE AS SeatPrice,
		SC_SEAT_PRICE AS ChildSeatPrice,
		LTRIM(RTRIM(DEP_AIRPORT)) AS DepAirport,
		CONVERT(INT,SUBSTRING(DEP_DATE,7,4)+SUBSTRING(DEP_DATE,4,2)+SUBSTRING(DEP_DATE,1,2)) AS DepDate,
		CONVERT(INT,REPLACE(DEP_TIME,'.','')) AS DepTime,
		LTRIM(RTRIM(ARR_AIRPORT)) AS ArrAirport,
		CONVERT(INT,SUBSTRING(ARR_DATE,7,4)+SUBSTRING(ARR_DATE,4,2)+SUBSTRING(ARR_DATE,1,2)) AS ArrDate,
		CONVERT(INT,REPLACE(ARR_TIME,'.','')) AS ArrTime,
		DEP_NO AS DepNo,
		LTRIM(RTRIM(ORIGIN)) AS Origin,
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
			 THEN 1 ELSE 0 END AS FL_OptionSeats,
		CASE WHEN ST_MARINE_FBKG.BookingStatusID = 3 AND BookingType IN ('Flotilla')
			 THEN 1 ELSE 0 END AS FL_ConfirmSeats,
		NULL AS FL_WaitSeats,
		NULL AS FL_FreeSeats,
		NULL AS CL_TotalSeats,
		CASE WHEN ST_MARINE_FBKG.BookingStatusID = 1 AND BookingType IN ('Club/Flotilla','Club')
			 THEN 1 ELSE 0 END AS CL_OptionSeats,
		CASE WHEN ST_MARINE_FBKG.BookingStatusID = 3 AND BookingType IN ('Club/Flotilla','Club')
			 THEN 1 ELSE 0 END AS CL_ConfirmSeats,
		NULL AS CL_WaitSeats,
		NULL AS CL_FreeSeats,
		NULL AS FOTotalSeats,
		NULL AS FOOptionSeats,
		NULL AS FOConfirmSeats,
		NULL AS FOWaitSeats, 
		NULL AS FOFreeSeats,
		NULL AS Ticket,
		NULL AS Manifest,
		LTRIM(RTRIM(BAGGAGE)) AS Baggage,
		CHECK_IN_TIME AS CheckINTime,
		LTRIM(RTRIM(CHECK_IN_TERM)) AS CheckInTerminal,
		LTRIM(RTRIM([ROUTE])) AS FlightRoute,
		NULL AS Max7Day,
		NULL AS [7DayRemain],
		NULL AS [7DayStop],
		NULL AS FO_Max7Day,
		NULL AS FO_7DayRemain,
		NULL AS FO_7DayStop,
		NULL AS Colors,
		NULL AS Class,
		NULL AS InernetUse,
		NULL AS InUse,
		NULL AS LastAlloc,
		NULL AS TotalOnFlight,
		NULL AS OptionOnFlight,
		NULL AS ConfirmOnFlight,
		NULL AS WaitOnFlight,
		NULL AS FreeOnFlight,
		NULL AS HasAlternative,
		NULL As OnRequest,
		I5_MANAGED AS NeptuneManaged
	FROM 
		NEPTUNE_FLIGHT
	LEFT JOIN
		NEPTUNE_FLIGHT_REF
			ON
				NEPTUNE_FLIGHT_REF.FLIGHT_NO = NEPTUNE_FLIGHT.FLIGHT_NO
	LEFT JOIN
		NEPTUNE_FLIGHT_ALLOC NEPTUNE_FLIGHT_ALLOC_ALL
			ON
				NEPTUNE_FLIGHT_ALLOC_ALL.FLIGHT_NO = NEPTUNE_FLIGHT_REF.FLIGHT_NO
				AND
				NEPTUNE_FLIGHT_ALLOC_ALL.ALLOC_NO = NEPTUNE_FLIGHT_REF.ALLOC_NO
	LEFT  JOIN
		NEPTUNE_FLIGHT_ALLOC NEPTUNE_FLIGHT_ALLOC_D
			ON
				NEPTUNE_FLIGHT_ALLOC_D.FLIGHT_NO = NEPTUNE_FLIGHT_ALLOC_ALL.FLIGHT_NO
				AND	
				NEPTUNE_FLIGHT_ALLOC_D.ALLOC_NO = NEPTUNE_FLIGHT_ALLOC_ALL.PARENT_ALLOC
				AND
				NEPTUNE_FLIGHT_ALLOC_D.ALLOC_CODE ='D'
	INNER JOIN
		ST_MARINE_FBKG
		ON
			ST_MARINE_FBKG.BkgRef = NEPTUNE_FLIGHT_REF.CLIENT_NO
	INNER JOIN 
			(
			SELECT 
				i_SK_Bkg,
				i_SK_Pax,
				BkgRef,
				SourceSysID,
				FlightHolidayDuration,
				FlightNumber
			FROM 
				ST_MARINE_PAXFLIGHTDURATION
			--SELECT 
			--	OUT_ST_MARINE_PAXFLIGHT.i_SK_Bkg,
			--	OUT_ST_MARINE_PAXFLIGHT.i_SK_Pax,
			--	OUT_ST_MARINE_PAXFLIGHT.BkgRef,
			--	OUT_ST_MARINE_PAXFLIGHT.SourceSysID,
			--	DATEDIFF(d,CONVERT(DATETIME,CONVERT(VARCHAR(8),BRAINII.dbo.fn_CheckDate(OUT_ST_MARINE_PAXFLIGHT.MinDepartDate),112)),
			--	CONVERT(DATETIME,CONVERT(VARCHAR(8),BRAINII.dbo.fn_CheckDate(IN_ST_MARINE_PAXFLIGHT.MinDepartDate),112))) AS FlightHolidayDuration,
			--	ST_MARINE_PAXFLIGHT.FlightNumber
			--FROM 
			--	(	
			--	SELECT 
			--		i_SK_Bkg,
			--		i_SK_Pax,
			--		BkgRef,
			--		SourceSysID,
			--		MIN(DepartDate) AS MinDepartDate
			--	FROM
			--		ST_MARINE_PAXFLIGHT
			--	WHERE 
			--		OutInFlag ='O'		
			--	GROUP BY 
			--		i_SK_Bkg,
			--		i_SK_Pax,
			--		BkgRef,
			--		SourceSysID
			--	)OUT_ST_MARINE_PAXFLIGHT
			--	LEFT JOIN
			--	(
			--	SELECT 
			--		i_SK_Bkg,
			--		i_SK_Pax,
			--		BkgRef,
			--		SourceSysID,
			--		MIN(DepartDate) AS MinDepartDate
			--	FROM
			--		ST_MARINE_PAXFLIGHT
			--	WHERE 
			--		OutInFlag ='I'		
			--	GROUP BY 
			--		i_SK_Bkg,
			--		i_SK_Pax,
			--		BkgRef,
			--		SourceSysID
			--	)IN_ST_MARINE_PAXFLIGHT
			--ON
			--	OUT_ST_MARINE_PAXFLIGHT.i_SK_Bkg = IN_ST_MARINE_PAXFLIGHT.i_SK_Bkg 
			--	AND
			--	OUT_ST_MARINE_PAXFLIGHT.i_SK_Pax = IN_ST_MARINE_PAXFLIGHT.i_SK_Pax 
			--INNER JOIN
			--	ST_MARINE_PAXFLIGHT
			--	ON
			--		OUT_ST_MARINE_PAXFLIGHT.i_SK_Bkg = ST_MARINE_PAXFLIGHT.i_SK_Bkg 
			--		AND
			--		OUT_ST_MARINE_PAXFLIGHT.i_SK_Pax = ST_MARINE_PAXFLIGHT.i_SK_Pax 
		)MARINE_PAXFLIGHT
		ON
			MARINE_PAXFLIGHT.BkgRef =  NEPTUNE_FLIGHT_REF.CLIENT_NO
			AND
			ISNULL(MARINE_PAXFLIGHT.FlightHolidayDuration,0) = ISNULL(LTRIM(RTRIM(NEPTUNE_FLIGHT_ALLOC_D.ALLOC_VALUE)),0) 
			AND
			MARINE_PAXFLIGHT.FlightNumber = NEPTUNE_FLIGHT.FLIGHT_NO
	WHERE 
		CONVERT(INT,SUBSTRING(DEP_DATE,7,4)+SUBSTRING(DEP_DATE,4,2)+SUBSTRING(DEP_DATE,1,2)) > 20100101
			
	EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'NPTN','ST_FLINV'
	
	
 
GO
/****** Object:  StoredProcedure [dbo].[BUILD_ST_MARINE_HOTEL]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[BUILD_ST_MARINE_HOTEL]
AS

	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'NPTN','ST_HOT','BUILD_ST_MARINE_HOTEL'

	TRUNCATE TABLE ST_MARINE_HOTEL
	

	INSERT INTO 
		ST_MARINE_HOTEL	
	SELECT
		NEPTUNE_ACCOMMODATION_REF.CLIENT_NO AS CLIENT_NO,
		NEPTUNE_PASS.PASS_NO AS PASS_NO,
		NEPTUNE_ACCOMMODATION_REF.ACCOMRENO AS RefNo,
		MARINE_BASE.a_BaseName AS HotelName,
		MARINE_BASE.a_BaseCode AS BaseCode,
		NEPTUNE_ACCOMMODATION.ACCOMODATION_NAME AS RoomNo,
		NEPTUNE_ACCOMMODATION.ACCOMMODATION_TYPE_CODE AS RoomTypeCode,
		CONVERT(DATETIME,NEPTUNE_Stage.dbo.fn_Checkdate(CONVERT(INT,SUBSTRING(NEPTUNE_ACCOMMODATION_REF.START_DATE,7,4)+SUBSTRING(NEPTUNE_ACCOMMODATION_REF.START_DATE,4,2)+SUBSTRING(NEPTUNE_ACCOMMODATION_REF.START_DATE,1,2)))) AS HotelStartDate,
		NEPTUNE_ACCOMMODATION_REF.START_TIME AS HotelStartTime,
		CONVERT(DATETIME,NEPTUNE_Stage.dbo.fn_Checkdate(CONVERT(INT,SUBSTRING(NEPTUNE_ACCOMMODATION_REF.END_DATE,7,4)+SUBSTRING(NEPTUNE_ACCOMMODATION_REF.END_DATE,4,2)+SUBSTRING(NEPTUNE_ACCOMMODATION_REF.END_DATE,1,2)))) AS HotelEndDate,
		NEPTUNE_ACCOMMODATION_REF.END_TIME AS HotelEndTime
	FROM
		NEPTUNE_Stage.dbo.NEPTUNE_ACCOMMODATION_REF NEPTUNE_ACCOMMODATION_REF
	INNER JOIN
		NEPTUNE_Stage.dbo.NEPTUNE_ACCOMMODATION
		ON
			NEPTUNE_ACCOMMODATION.ACCOMMODATION_NO=NEPTUNE_ACCOMMODATION_REF.ACCOMMODATION_NO
			AND
			NEPTUNE_ACCOMMODATION.YACHT_ROOM_IND='R'
	LEFT JOIN 
		NEPTUNE_Stage.dbo.NEPTUNE_PASS NEPTUNE_PASS
		ON
			NEPTUNE_PASS.CLIENT_NO = NEPTUNE_ACCOMMODATION_REF.CLIENT_NO
	INNER JOIN 
		NEPTUNE_Stage.dbo.NEPTUNE_PASSLINK  NEPTUNE_PASSLINK
		ON
			NEPTUNE_PASSLINK.CLIENT_NO = NEPTUNE_ACCOMMODATION_REF.CLIENT_NO
			AND
			NEPTUNE_PASSLINK.REF_NO = NEPTUNE_ACCOMMODATION_REF.ACCOMRENO	
			AND
			NEPTUNE_PASSLINK.PASS_NO =NEPTUNE_PASS.PASS_NO
	LEFT JOIN
		AMI_Static.dbo.SB_MARINE_BASE MARINE_BASE
		ON
			MARINE_BASE.a_BaseCode = NEPTUNE_ACCOMMODATION_REF.REG_BASE
			AND
			MARINE_BASE.a_SourceSystemID = 103
			
	EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'NPTN','ST_HOT'
			
			
	
GO
/****** Object:  StoredProcedure [dbo].[BUILD_ST_MARINE_INSURANCE]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[BUILD_ST_MARINE_INSURANCE]
AS

BEGIN


	EXEC  AMI_Galaxy.dbo.AMI_LOG_OPEN 'NPTN','ST_INS','BUILD_ST_MARINE_INSURANCE'

	TRUNCATE TABLE ST_MARINE_INSURANCE

	INSERT INTO
		ST_MARINE_INSURANCE
	SELECT 
		i_SK_Bkg,
		i_SK_Pax,
		ST_MARINE_FITN.SourceSysID,
		SystemName,
		DivisionCode,
		ST_MARINE_FITN.BrandCode,
		CompanyNo,
		ST_MARINE_FITN.BkgRef,
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
		ItemAmountLocal,
		TotalAmountLocal,
		TotalAmountLocalForCancel,
		LastAmendUser,
		BaseLocation
	FROM 
		ST_MARINE_FITN
	INNER JOIN 
		ST_MARINE_PAX
		ON 
			ST_MARINE_PAX.i_BK_BkgConcat = ST_MARINE_FITN.i_SK_Bkg
			AND
			ST_MARINE_PAX.InsurancePolicy= ST_MARINE_FITN.ExtraCode
	WHERE 
		ST_MARINE_PAX.InsurancePolicy <>''

	EXEC  AMI_Galaxy.dbo.AMI_LOG_CLOSE 'NPTN','ST_INS'

END
GO
/****** Object:  StoredProcedure [dbo].[BUILD_ST_MARINE_PAX]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[BUILD_ST_MARINE_PAX]
AS

BEGIN


	EXEC  AMI_Galaxy.dbo.AMI_LOG_OPEN 'NPTN','ST_PAX','BUILD_ST_MARINE_PAX'

	TRUNCATE TABLE ST_MARINE_PAX

	INSERT INTO
		ST_MARINE_PAX
	SELECT
		CONVERT(BIGINT,(CONVERT(VARCHAR(14), ST_MARINE_FBKG.i_SK_Bkg) + CONVERT(VARCHAR(3),NEPTUNE_PASS.PASS_NO))) AS i_SK_Pax,
		ST_MARINE_FBKG.i_SK_Bkg AS i_BK_BkgConcat,
		CONVERT(BIGINT,(CONVERT(VARCHAR(14), ST_MARINE_FBKG.i_SK_Bkg) + CONVERT(VARCHAR(3),NEPTUNE_PASS.PASS_NO))) AS i_BK_PaxConcat,
		ST_MARINE_FBKG.SourceSysID AS SourceSysID,
		ST_MARINE_FBKG.BrandCode AS BrandCode,
		NEPTUNE_PASS.CLIENT_NO AS BkgRef,
		NEPTUNE_PASS.MAIL_NO AS ClientNo,
		NEPTUNE_PASS.PASS_NO AS PaxNo,
		CASE 
			WHEN ADULT = 'Y' THEN 'A' 
			WHEN ADULT = 'N' THEN 'C' 
			WHEN ADULT ='' THEN CASE WHEN DOB <> '' THEN 
					CASE WHEN DATEDIFF(year,CONVERT(DATETIME,NEPTUNE_Stage.dbo.fn_Checkdate(CONVERT(INT,SUBSTRING(DOB,7,4)+SUBSTRING(DOB,4,2)+SUBSTRING(DOB,1,2)))),DepartureDate) >12 THEN 'A' ELSE 'C' END 
				ELSE 'A' END
			ELSE 'A' END 
		AS PaxType,
		SURNAME AS Surname,
		TITLE AS Title,
		SUBSTRING(FORENAME,1,1) AS Initials,
		FORENAME AS Forename,
		MIDDLENAME AS MiddleName,  --new
		LTRIM(RTRIM(TITLE)) + ' ' 
			+ LTRIM(RTRIM(FORENAME)) + ' ' 
			+ LTRIM(RTRIM(SURNAME)) As Fullname,
		CASE WHEN PASS_NO = 1 THEN 1 ELSE 0 END AS LeadNameFlag,
		SEX AS PaxSex,
		CASE WHEN DOB <> '' THEN DATEDIFF(year,CONVERT(DATETIME,NEPTUNE_Stage.dbo.fn_Checkdate(CONVERT(INT,SUBSTRING(DOB,7,4)+SUBSTRING(DOB,4,2)+SUBSTRING(DOB,1,2)))),DepartureDate) ELSE 0 END AS PaxAge, 
		CONVERT(DATETIME,NEPTUNE_Stage.dbo.fn_Checkdate(CONVERT(INT,SUBSTRING(DOB,7,4)+SUBSTRING(DOB,4,2)+SUBSTRING(DOB,1,2))))AS PaxDOB,
		PASSPORT AS PassportNumber,
		CONVERT(DATETIME,NEPTUNE_Stage.dbo.fn_Checkdate(CONVERT(INT,SUBSTRING(PASSPORT_EXPIRTY_DATE,7,4)+SUBSTRING(PASSPORT_EXPIRTY_DATE,4,2)+SUBSTRING(PASSPORT_EXPIRTY_DATE,1,2)))) AS PassportExpiryDate,
		PASSPORT_ISSUE_PLACE AS PassportIssuedCountry,
		PASS_NATION AS Nationality,
		SAIL_EXP AS SailExperience,
		SKIPPER_CREW_IND AS SkipperCrewIndicator,
		LTRIM(RTRIM(INS_POLICY)) AS  InsurancePolicy,
		CONVERT(DATETIME,NEPTUNE_Stage.dbo.fn_Checkdate(CONVERT(INT,SUBSTRING(INS_START_DATE,7,4)+SUBSTRING(INS_START_DATE,4,2)+SUBSTRING(INS_START_DATE,1,2)))) AS InsurancePolicyStartDate,
		CONVERT(DATETIME,NEPTUNE_Stage.dbo.fn_Checkdate(CONVERT(INT,SUBSTRING(INS_END_DATE,7,4)+SUBSTRING(INS_END_DATE,4,2)+SUBSTRING(INS_END_DATE,1,2)))) AS InsurancePolicyEndDate,
		[TRANSFER] AS [Transfer]
	FROM
		ST_MARINE_FBKG
	INNER JOIN
		NEPTUNE_PASS
		ON
			ST_MARINE_FBKG.BkgRef=NEPTUNE_PASS.CLIENT_NO		
			

	EXEC  AMI_Galaxy.dbo.AMI_LOG_CLOSE  'NPTN','ST_PAX' --, @row_count=@rowcount
	
END

GO
/****** Object:  StoredProcedure [dbo].[BUILD_ST_MARINE_PAXACC]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[BUILD_ST_MARINE_PAXACC]
AS

	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'NPTN','ST_ACC','BUILD_ST_MARINE_PAXACC'
	
	EXEC BUILD_ST_MARINE_HOTEL

	TRUNCATE TABLE ST_MARINE_PAXACC

	INSERT INTO 
		ST_MARINE_PAXACC	
	SELECT 
		i_Sk_Bkg AS i_Sk_Bkg,
		CONVERT(BIGINT,(CONVERT(VARCHAR(14),i_SK_Bkg) + CONVERT(VARCHAR(3),NEPTUNE_PASS.PASS_NO))) AS i_SK_Pax,
		SourceSysID,
		BrandCode,
		NEPTUNE_ACCOM_HOTEL.HotelName AS HotelName,
		NEPTUNE_ACCOM_HOTEL.BaseCode AS BaseCode,
		NEPTUNE_ACCOM_HOTEL.RoomNo AS RoomNo,
		NEPTUNE_ACCOM_HOTEL.RoomTypeCode AS RoomTypeCode,
		NEPTUNE_ACCOM_HOTEL.HotelStartDate AS HotelStartDate,
		NEPTUNE_ACCOM_HOTEL.HotelStartTime AS HotelStartTime,
		NEPTUNE_ACCOM_HOTEL.HotelEndDate AS HotelEndDate,
		NEPTUNE_ACCOM_HOTEL.HotelEndTime AS HotelEndTime	
	FROM 
		NEPTUNE_Stage.dbo.ST_MARINE_FBKG ST_MARINE_FBKG
	INNER JOIN 
		NEPTUNE_Stage.dbo.NEPTUNE_PASS NEPTUNE_PASS
		ON
			ST_MARINE_FBKG.BkgRef = NEPTUNE_PASS.CLIENT_NO
	INNER JOIN
		(
		SELECT
			CLIENT_NO,
			PASS_NO,
			RefNo,
			HotelName,
			BaseCode,
			RoomNo,
			RoomTypeCode,
			HotelStartDate,
			HotelStartTime,
			HotelEndDate,
			HotelEndTime
		FROM
			NEPTUNE_Stage.dbo.ST_MARINE_HOTEL ST_MARINE_HOTEL
		) NEPTUNE_ACCOM_HOTEL
		ON
			NEPTUNE_ACCOM_HOTEL.CLIENT_NO = ST_MARINE_FBKG.BkgRef
			AND
			NEPTUNE_ACCOM_HOTEL.PASS_NO = NEPTUNE_PASS.PASS_NO
			
	EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'NPTN','ST_ACC'
			
			
	
GO
/****** Object:  StoredProcedure [dbo].[BUILD_ST_MARINE_PAXBOAT]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[BUILD_ST_MARINE_PAXBOAT]
AS

	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'NPTN','ST_BOAT','BUILD_ST_MARINE_PAXBOAT'
	
	EXEC BUILD_ST_MARINE_ACCOMBOAT

	TRUNCATE TABLE ST_MARINE_PAXBOAT

	INSERT INTO 
		ST_MARINE_PAXBOAT	
	SELECT 
		i_Sk_Bkg AS i_Sk_Bkg,
		CONVERT(BIGINT,(CONVERT(VARCHAR(14),i_SK_Bkg) + CONVERT(VARCHAR(3),NEPTUNE_PASS.PASS_NO))) AS i_SK_Pax,
		ST_MARINE_FBKG.SourceSysID AS SourceSysID,
		ST_MARINE_FBKG.BrandCode AS BrandCode,
		NEPTUNE_ACCOM_BOAT.Boat AS Boat,
		NEPTUNE_ACCOM_BOAT.BoatType AS BoatType,
		NEPTUNE_ACCOM_BOAT.CharterStartDate AS CharterStartDate,
		NEPTUNE_ACCOM_BOAT.CharterStartTime AS CharterStartTime,
		NEPTUNE_ACCOM_BOAT.CharterEndDate AS CharterEndDate,
		NEPTUNE_ACCOM_BOAT.CharterEndTime AS CharterEndTime,
		ST_MARINE_FBKG.BaseLocation AS BaseLocation
	FROM 
		NEPTUNE_Stage.dbo.ST_MARINE_FBKG ST_MARINE_FBKG
	INNER JOIN 
		NEPTUNE_Stage.dbo.NEPTUNE_PASS NEPTUNE_PASS
		ON
			ST_MARINE_FBKG.BkgRef = NEPTUNE_PASS.CLIENT_NO
	INNER JOIN
		(
		SELECT 
		    CLIENT_NO,
		    PASS_NO,
			Boat,
			BoatType,
			CharterStartDate,
			CharterStartTime,
			CharterEndDate,
			CharterEndTime
		FROM
			NEPTUNE_Stage.dbo.ST_MARINE_ACCOMBOAT 
		) NEPTUNE_ACCOM_BOAT
		ON 
			NEPTUNE_ACCOM_BOAT.CLIENT_NO = ST_MARINE_FBKG.BkgRef
			AND
			NEPTUNE_ACCOM_BOAT.PASS_NO = NEPTUNE_PASS.PASS_NO
	
	EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'NPTN','ST_BOAT'
			
			
	
GO
/****** Object:  StoredProcedure [dbo].[BUILD_ST_MARINE_PAXFLIGHT]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[BUILD_ST_MARINE_PAXFLIGHT]
AS

BEGIN


	EXEC  AMI_Galaxy.dbo.AMI_LOG_OPEN 'NPTN','ST_PAXFLT','BUILD_ST_MARINE_PAXFLIGHT'

	TRUNCATE TABLE ST_MARINE_PAXFLIGHT

	INSERT INTO
		ST_MARINE_PAXFLIGHT			
	SELECT 
		ST_MARINE_PAX.i_BK_BkgConcat AS i_SK_Bkg,
		ST_MARINE_PAX.i_SK_Pax,
		CONVERT(BIGINT,((CONVERT(VARCHAR(16),ST_MARINE_PAX.i_BK_BkgConcat)  + CONVERT(VARCHAR(3),DENSE_RANK() OVER (PARTITION BY NEPTUNE_FLIGHT_REF.CLIENT_NO ORDER BY  NEPTUNE_FLIGHT_REF.FLIGHTRENO))))) AS i_SK_Flt,
		NEPTUNE_FLIGHT.FLIGHT_NO AS FlightNumber,
		OUT_OR_IN AS OutInFlag,	
		ST_MARINE_PAX.SourceSysID,
		ST_MARINE_PAX.BrandCode,
		ST_MARINE_PAX.BkgRef,
		NEPTUNE_FLIGHT.DEP_AIRPORT AS DepartAirport,
		NEPTUNE_FLIGHT.ARR_AIRPORT As ArrivalAirport,
		CONVERT(INT,SUBSTRING(NEPTUNE_FLIGHT.DEP_DATE,7,4)+SUBSTRING(NEPTUNE_FLIGHT.DEP_DATE,4,2)+SUBSTRING(NEPTUNE_FLIGHT.DEP_DATE,1,2)) AS DepartDate,
		CONVERT(INT,SUBSTRING(NEPTUNE_FLIGHT.ARR_DATE,7,4)+SUBSTRING(NEPTUNE_FLIGHT.ARR_DATE,4,2)+SUBSTRING(NEPTUNE_FLIGHT.ARR_DATE,1,2)) AS ArrivalDate
	FROM 
		NEPTUNE_Stage.dbo.ST_MARINE_PAX ST_MARINE_PAX
	INNER JOIN	
		NEPTUNE_Stage.dbo.NEPTUNE_FLIGHT_REF NEPTUNE_FLIGHT_REF
		ON
			ST_MARINE_PAX.BkgRef = NEPTUNE_FLIGHT_REF.CLIENT_NO 	
	INNER JOIN 
		NEPTUNE_Stage.dbo.NEPTUNE_FLIGHT NEPTUNE_FLIGHT
		ON
			NEPTUNE_FLIGHT.FLIGHT_NO = NEPTUNE_FLIGHT_REF.FLIGHT_NO
	INNER JOIN 
		NEPTUNE_Stage.dbo.NEPTUNE_PASSLINK  NEPTUNE_PASSLINK
		ON
			NEPTUNE_PASSLINK.CLIENT_NO = NEPTUNE_FLIGHT_REF.CLIENT_NO
			AND
			NEPTUNE_PASSLINK.REF_NO = NEPTUNE_FLIGHT_REF.FLIGHTRENO
			AND
			NEPTUNE_PASSLINK.PASS_NO = ST_MARINE_PAX.PaxNo
	
				
	EXEC  AMI_Galaxy.dbo.AMI_LOG_CLOSE 'NPTN','ST_PAXFLT'
END
	
GO
/****** Object:  StoredProcedure [dbo].[BUILD_ST_MARINE_PAXFLIGHTDURATION]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[BUILD_ST_MARINE_PAXFLIGHTDURATION]
AS

BEGIN


	EXEC  AMI_Galaxy.dbo.AMI_LOG_OPEN 'NPTN','ST_PAXDUR','BUILD_ST_MARINE_PAXFLIGHTDURATION'

	TRUNCATE TABLE ST_MARINE_PAXFLIGHTDURATION

	INSERT INTO
		ST_MARINE_PAXFLIGHTDURATION					
	SELECT 
		OUT_ST_MARINE_PAXFLIGHT.i_SK_Bkg,
		OUT_ST_MARINE_PAXFLIGHT.i_SK_Pax,
		OUT_ST_MARINE_PAXFLIGHT.BkgRef,
		OUT_ST_MARINE_PAXFLIGHT.SourceSysID,
		DATEDIFF(d,CONVERT(DATETIME,CONVERT(VARCHAR(8),BRAINII.dbo.fn_CheckDate(OUT_ST_MARINE_PAXFLIGHT.MinDepartDate),112)),
		CONVERT(DATETIME,CONVERT(VARCHAR(8),BRAINII.dbo.fn_CheckDate(IN_ST_MARINE_PAXFLIGHT.MinDepartDate),112))) AS FlightHolidayDuration,
		ST_MARINE_PAXFLIGHT.FlightNumber
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
	INNER JOIN
		ST_MARINE_PAXFLIGHT
		ON
			OUT_ST_MARINE_PAXFLIGHT.i_SK_Bkg = ST_MARINE_PAXFLIGHT.i_SK_Bkg 
			AND
			OUT_ST_MARINE_PAXFLIGHT.i_SK_Pax = ST_MARINE_PAXFLIGHT.i_SK_Pax 
			
	EXEC  AMI_Galaxy.dbo.AMI_LOG_CLOSE 'NPTN','ST_PAXDUR'

END
GO
/****** Object:  StoredProcedure [dbo].[BUILD_ST_MARINE_PAYMENT]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[BUILD_ST_MARINE_PAYMENT]


AS

	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'NPTN','ST_PAY','BUILD_ST_MARINE_PAYMENT'

	TRUNCATE TABLE ST_MARINE_PAYMENT

	INSERT INTO 
		ST_MARINE_PAYMENT
	SELECT 
		i_Sk_Bkg,
		103 AS SourceSysID,
		'NEPTUNE' AS SystemName,
		'M' AS	DivisionCode,
		BrandCode AS BrandCode,
		ProductCode AS ProductCode,
		SeasonCode AS SeasonCode,
		LTRIM(RTRIM(BOOKING_REFERENCE_NO)) AS BkgRef,	
		LTRIM(RTRIM(PAYMENT_TAG_NO)) AS TagNo,
		CONVERT(DATETIME,NEPTUNE_Stage.dbo.fn_Checkdate(CONVERT(INT,SUBSTRING(PAYMENT_DATE,7,4)+SUBSTRING(PAYMENT_DATE,4,2)+SUBSTRING(PAYMENT_DATE,1,2)))) AS PaymentDate,
		NEPTUNE_PAYMENT_DETAIL.PAYMENT_METHOD_CODE AS PaymentMethodCode,
		NEPTUNE_PAYMENT_METHOD.PAY_METHOD_DESC AS PaymentMethod,
		NEPTUNE_PAYMENT_DETAIL.PAYMENT_DESCRIPTION As PaymentDesc,
		NEPTUNE_PAYMENT_DETAIL.PAYMENT_REFUND_IND As PaymentRefundIndicator,
		NEPTUNE_ORIGIN.[DESCRIPTION] As BaseLocation,
		NEPTUNE_ORIGIN_LANG.LANG AS [Language],
		NEPTUNE_PAYMENT_DETAIL.ADDED_BY AS [User],
		NEPTUNE_PAYMENT_DETAIL.PAYMENT_VALUE As BaseAmount,
		NEPTUNE_PAYMENT_DETAIL.ADDED_DATETIME As AddedTime,
		ST_MARINE_FBKG.CharterStartDate,
		ST_MARINE_FBKG.Currency AS Currency,
		NEPTUNE_PAYMENT_DETAIL.COMPANY_CODE AS CompanyNo 
	FROM
		NEPTUNE_PAYMENT_DETAIL
	INNER  JOIN 
		ST_MARINE_FBKG
		ON 
			NEPTUNE_PAYMENT_DETAIL.BOOKING_REFERENCE_NO = ST_MARINE_FBKG.BkgRef
	LEFT JOIN 
		NEPTUNE_PAYMENT_METHOD
		ON
			NEPTUNE_PAYMENT_METHOD.PAY_METHOD = NEPTUNE_PAYMENT_DETAIL.PAYMENT_METHOD_CODE
	LEFT JOIN
		NEPTUNE_Stage.dbo.NEPTUNE_ORIGIN NEPTUNE_ORIGIN
		ON
			NEPTUNE_ORIGIN.ORIGIN = NEPTUNE_PAYMENT_DETAIL.LOCATION_CODE
	LEFT JOIN
		NEPTUNE_Stage.dbo.NEPTUNE_ORIGIN NEPTUNE_ORIGIN_LANG
		ON
			NEPTUNE_ORIGIN_LANG.ORIGIN = NEPTUNE_PAYMENT_DETAIL.LOCATION_CODE 		
		
			


	EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'NPTN','ST_PAY'
	




GO
/****** Object:  StoredProcedure [dbo].[BUILD_ST_MARINE_REMBOOK]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BUILD_ST_MARINE_REMBOOK]  
AS  
  
 EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'NPTN','ST_MAR_REM','BUILD_ST_MARINE_REMBOOK'  
   
 TRUNCATE TABLE   
  ST_MARINE_REMBOOK   
  
 INSERT INTO   
  ST_MARINE_REMBOOK   
  (  
  [CompanyNo]  
  ,[InvoiceCo]  
  ,[Location]  
  ,[BookRef]  
  ,[MailNo]  
  ,[OptBook]  
  ,[DepartureDate]  
  ,[Fromcharterlocation]  
  ,[CharterTypeName]  
  ,[RemovedDate]  
  ,[AgencyKeyContactName]  
  ,[LastName]  
  ,[CompanyName]  
  ,[Add1]  
  ,[Add2]  
  ,[Add3]  
  ,[City]  
  ,[County]  
  ,[Postcode]  
  ,[Country]  
  ,[Nationality]  
  ,[SourceCode]  
  ,[NettTotal]  
  ,[VAT]  
  ,[AgentComm]  
  ,[Payments]  
  ,[QuoteExpiryDate]  
  ,[BookedBy]  
  ,[Title]  
  ,[FirstName]  
  ,[Surname]  
  ,[Phone1]  
  ,[Phone2]  
  ,[Phone3]  
  ,[Email1]  
  ,[BoatType]  
  ,[Tocharterlocation]  
  ,[Duration]  
  ,[EnquiryLanguage]  
  ,[Language]  
  ,[BookingDate]
  ,[AgentOrDirectBooking]
  )  
 SELECT   
   [F_company_no]   
  ,[F_inv_co]  
  ,[F_loc]     
  ,[F_client_no]   
  ,[F_mailID]  
  ,[F_opt_book]  
  ,[F_start_date]   
  ,[F_base_code]   
  ,[F_charter]    
  ,[F_removed_date]  
  ,[F_agent_name]  
  ,[F_surname]    
  ,[F_company]    
  ,[F_addr1]      
  ,[F_addr2]  
  ,[F_addr3]  
  ,[F_city]  
  ,[F_state]  
  ,[F_zip_code]  
  ,[F_country]  
  ,[F_nationality]  
  ,[F_reason]  
  ,[F_nett_total]  
  ,[F_vat]  
  ,[F_agent_comm]  
  ,[F_payments]  
  ,[F_expiry_date]  
  ,[F_added_by]  
  ,[F_title]  
  ,[F_forename]  
  ,[F_surname]  
  ,[F_tel1_no]  
  ,[F_tel2_no]  
  ,[F_tel3_no]  
  ,[F_email]  
  ,[F_boat_type]  
  ,[F_end_base]  
  ,[F_duration]  
  ,F_enq_lang   
  ,NEPTUNE_ORIGIN.lang  
  ,F_booking_date
  ,F_agent_or_directbooking
 FROM   
  [NEPTUNE_REMBOOK]  
 LEFT JOIN  
  NEPTUNE_Stage.dbo.NEPTUNE_ORIGIN  
  ON  
   f_lang=NEPTUNE_Stage.dbo.NEPTUNE_ORIGIN.ORIGIN  
 ORDER BY  
   f_client_no  
     
   
 EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'NPTN','ST_MAR_REM'  
  
  
GO
/****** Object:  StoredProcedure [dbo].[BUILD_ST_MARINE_SOLDPERWEEK]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[BUILD_ST_MARINE_SOLDPERWEEK]
AS

BEGIN


	EXEC  AMI_Galaxy.dbo.AMI_LOG_OPEN 'NPTN','ST_SOLD','BUILD_ST_MARINE_SOLDPERWEEK'
	
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
		NEPTUNE_SFT_ALLOCATION
		ON
			NEPTUNE_SFT_ALLOCATION.i_BK_LOCT = SB_MARINE_BASEAIRPORTLINK.a_BaseCode
			AND
			NEPTUNE_SFT_ALLOCATION.i_SK_SaleDate BETWEEN 
												ST_MARINE_FLIGHTINVENTORY.ArrDate 
												AND 
												CONVERT(INT,(CONVERT(VARCHAR(8),DATEADD(d,ST_MARINE_FLIGHTINVENTORY.NoDays-1,
												CONVERT(DATETIME,CONVERT(VARCHAR(8),BRAINII.dbo.fn_CheckDate(ST_MARINE_FLIGHTINVENTORY.ArrDate),112))),112)))
												
	
			AND
			NEPTUNE_SFT_ALLOCATION.i_BK_SourceSysID = ST_MARINE_FLIGHTINVENTORY.SourceSysID 
			AND 
			i_BK_BookingStatus IN  (1,3)
	WHERE 
		ST_MARINE_FLIGHTINVENTORY.i_SK_Bkg = 0 
		AND
		CONVERT(DATETIME,CONVERT(VARCHAR(8),BRAINII.dbo.fn_CheckDate(ST_MARINE_FLIGHTINVENTORY.ArrDate),112)) > DATEADD(d,-60,GETDATE())
		AND 
		i_SK_Calendar IS NOT NULL
	GROUP BY
		i_BK_FLNUMB,
		i_BK_FLTY,
		ST_MARINE_FLIGHTINVENTORY.ArrDate,
		ST_MARINE_FLIGHTINVENTORY.ArrAirport,
		i_BK_LOCT,
		NoDays,
		SourceSysID,
		BrandCode

		
	EXEC  AMI_Galaxy.dbo.AMI_LOG_CLOSE 'NPTN','ST_SOLD'
END
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_ST_MARINE_FBKG_CAA]    Script Date: 18/05/2018 09:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UPDATE_ST_MARINE_FBKG_CAA]
AS


	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'NPTN','FBKG_CAA','UPDATE_ST_MARINE_FBKG_CAA'
	UPDATE 
		ST_MARINE_FBKG
	SET 
		CAA_BondingType = 
			CASE WHEN InternationalFlightFlag = 1 AND BoatFlag = 1 THEN 'CAA-FULL'
				 WHEN InternationalFlightFlag = 1 AND AccomFlag = 1 THEN 'CAA-FULL'
				 WHEN InternationalFlightFlag = 1 AND PackageFlag = 1 THEN 'CAA-FULL'
				 WHEN InternationalFlightFlag = 1 AND PackageFlag = 0 THEN 'CAA-SCHED'
				 WHEN InternationalFlightFlag = 0 AND PackageFlag = 1 THEN 'ABTA-Package'
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
			CASE WHEN ST_MARINE_FBKG.HotelName <>'' THEN 1 ELSE 0 END AS AccomFlag,
			ISNULL(MAX(InternationalFlightFlag),0) AS InternationalFlightFlag,
			ISNULL(MAX(VW_SB_MARINE_PACKAGE.Package),0) AS PackageFlag
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
				NEPTUNE_STage.dbo.ST_MARINE_FITN ST_MARINE_FITN
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
				CASE WHEN SB_MARINE_REVENUE.Package ='Yes' THEN 1 ELSE 0  END AS Package	 
			FROM
				NEPTUNE_STage.dbo.ST_MARINE_FITN ST_MARINE_FITN
			LEFT JOIN
				AMI_Static.dbo.SB_MARINE_REVENUE  SB_MARINE_REVENUE 
				ON
					ST_MARINE_FITN.ExtraCode= SB_MARINE_REVENUE.PriceCode 
					AND
					ST_MARINE_FITN.CompanyNo = SB_MARINE_REVENUE.CompanyCode 
					AND
					SB_MARINE_REVENUE.SourceSystemID = 103	
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
			CASE WHEN ST_MARINE_FBKG.Boat <>'' THEN 1 ELSE 0 END,
			CASE WHEN ST_MARINE_FBKG.HotelName <>'' THEN 1 ELSE 0 END
	)Booking
		WHERE ST_MARINE_FBKG.i_SK_Bkg = Booking.i_SK_Bkg
			
	EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE  'NPTN','FBKG_CAA'

GO
USE [master]
GO
ALTER DATABASE [NEPTUNE_Stage] SET  READ_WRITE 
GO
