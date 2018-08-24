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
/****** Object:  Database [CelerityMarine_Stage]    Script Date: 24/08/2018 12:11:06 ******/
CREATE DATABASE [CelerityMarine_Stage]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CelerityMarine_Stage', FILENAME = N'D:\SQLFiles\MSSQL.MSSQLSERVER.Data\CelerityMarine_Stage.mdf' , SIZE = 9123264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 51200KB )
 LOG ON 
( NAME = N'CelerityMarine_Stage_log', FILENAME = N'L:\SQLFiles\MSSQL.MSSQLSERVER.Log\CelerityMarine_Stage_log.ldf' , SIZE = 8319936KB , MAXSIZE = 2048GB , FILEGROWTH = 8192000KB )
GO
ALTER DATABASE [CelerityMarine_Stage] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CelerityMarine_Stage].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CelerityMarine_Stage] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CelerityMarine_Stage] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CelerityMarine_Stage] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CelerityMarine_Stage] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CelerityMarine_Stage] SET ARITHABORT OFF 
GO
ALTER DATABASE [CelerityMarine_Stage] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CelerityMarine_Stage] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CelerityMarine_Stage] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CelerityMarine_Stage] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CelerityMarine_Stage] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CelerityMarine_Stage] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CelerityMarine_Stage] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CelerityMarine_Stage] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CelerityMarine_Stage] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CelerityMarine_Stage] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CelerityMarine_Stage] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CelerityMarine_Stage] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CelerityMarine_Stage] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CelerityMarine_Stage] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CelerityMarine_Stage] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CelerityMarine_Stage] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CelerityMarine_Stage] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CelerityMarine_Stage] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CelerityMarine_Stage] SET  MULTI_USER 
GO
ALTER DATABASE [CelerityMarine_Stage] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CelerityMarine_Stage] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CelerityMarine_Stage] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CelerityMarine_Stage] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CelerityMarine_Stage] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CelerityMarine_Stage', N'ON'
GO
USE [CelerityMarine_Stage]
GO
/****** Object:  User [NEXUS\IMitrovic]    Script Date: 24/08/2018 12:11:06 ******/
CREATE USER [NEXUS\IMitrovic] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [BOXIUser]    Script Date: 24/08/2018 12:11:06 ******/
CREATE USER [BOXIUser] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [BOXI_UAT]    Script Date: 24/08/2018 12:11:06 ******/
CREATE USER [BOXI_UAT] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [boxi]    Script Date: 24/08/2018 12:11:06 ******/
CREATE USER [boxi] FOR LOGIN [boxi] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [NEXUS\IMitrovic]
GO
ALTER ROLE [db_datareader] ADD MEMBER [BOXIUser]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [BOXIUser]
GO
ALTER ROLE [db_owner] ADD MEMBER [BOXI_UAT]
GO
ALTER ROLE [db_owner] ADD MEMBER [boxi]
GO
ALTER ROLE [db_datareader] ADD MEMBER [boxi]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_CheckDate]    Script Date: 24/08/2018 12:11:06 ******/
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
/****** Object:  UserDefinedFunction [dbo].[fnProperCase2]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fnProperCase2] 
( 
    @strIn VARCHAR(255) 
) 
RETURNS VARCHAR(255) 
AS 
BEGIN 
    IF @strIn IS NULL 
        RETURN NULL 
 
    DECLARE 
        @strOut VARCHAR(255), 
        @i INT, 
        @Up BIT, 
        @c VARCHAR(2) 
 
    SELECT 
        @strOut = '', 
        @i = 0,  
        @Up = 1 
 
    WHILE @i <= DATALENGTH(@strIn) 
    BEGIN 
        SET @c = SUBSTRING(@strIn,@i,1) 
        IF @c IN ('(',')',' ','-','''') 
        BEGIN 
            SET @strOut = @strOut + @c 
            SET @Up = 1 
        END 
        ELSE 
        BEGIN 
            IF @up = 1 
                SET @c = UPPER(@c) 
            ELSE 
                SET @c = LOWER(@c) 
 
            SET @strOut = @strOut + @c 
            SET @Up = 0 
        END 
        SET @i = @i + 1 
    END 
    RETURN @strOut 
END

GO
/****** Object:  Table [dbo].[CELERITY_ST_ACCOMMODATION]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CELERITY_ST_ACCOMMODATION](
	[Source_Key] [varchar](50) NOT NULL,
	[BookRef] [varchar](50) NOT NULL,
	[Name] [varchar](50) NULL,
	[Resort] [varchar](50) NULL,
	[Type] [varchar](50) NULL,
	[Room] [varchar](100) NULL,
	[Country] [varchar](30) NULL,
	[Region] [varchar](50) NULL,
	[Supplier] [varchar](100) NULL,
	[SupplierCode] [varchar](50) NULL,
	[BasePrice] [money] NULL,
	[CurrencyCode] [varchar](50) NULL,
	[ExchangeRate] [decimal](18, 0) NULL,
	[Price] [money] NULL,
	[Base] [varchar](50) NULL,
	[Date] [date] NULL,
	[Duration] [int] NULL,
	[NoOfPassengers] [int] NULL,
	[Comment] [varchar](400) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CELERITY_ST_BOOKEDPASSENGERS]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CELERITY_ST_BOOKEDPASSENGERS](
	[Source_Key] [varchar](50) NOT NULL,
	[ClientCode] [varchar](50) NOT NULL,
	[BookRef] [varchar](50) NOT NULL,
	[ExpiryDate] [date] NULL,
	[IssueDate] [date] NULL,
	[LeadPassenger] [varchar](10) NULL,
	[PassengerType] [varchar](10) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [CELERITY_ST_BOOKEDPASSENGERS_PK]    Script Date: 24/08/2018 12:11:06 ******/
CREATE CLUSTERED INDEX [CELERITY_ST_BOOKEDPASSENGERS_PK] ON [dbo].[CELERITY_ST_BOOKEDPASSENGERS]
(
	[BookRef] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CELERITY_ST_BOOKINGS]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CELERITY_ST_BOOKINGS](
	[Source_Key] [varchar](50) NOT NULL,
	[BookRef] [varchar](50) NOT NULL,
	[LinkedBooking] [varchar](10) NULL,
	[BookingType] [varchar](30) NULL,
	[BookedBy] [varchar](50) NULL,
	[BookingSourcePrimary] [varchar](50) NULL,
	[BookingSourceSecondary] [varchar](50) NULL,
	[AmendedDate] [date] NULL,
	[BookingDate] [date] NULL,
	[OptionDate] [date] NULL,
	[CancelledDate] [date] NULL,
	[DepartureDate] [date] NULL,
	[ConfirmDate] [date] NULL,
	[Status] [varchar](30) NULL,
	[TotalPax] [int] NULL,
	[Adults] [int] NULL,
	[Children] [int] NULL,
	[Infants] [int] NULL,
	[Duration] [int] NULL,
	[BaseTotalPrice] [money] NULL,
	[BaseTotalCost] [money] NULL,
	[BaseTotalMargin] [money] NULL,
	[TotalPrice] [money] NULL,
	[TotalCost] [money] NULL,
	[TotalMargin] [money] NULL,
	[TotalDiscount] [decimal](18, 0) NULL,
	[ExchangeRate] [decimal](18, 0) NULL,
	[CurrencyCode] [varchar](30) NULL,
	[BookingOfficeLocation] [varchar](100) NULL,
	[BookingLanguage] [varchar](15) NULL,
	[BookingLanguageFull] [varchar](15) NULL,
	[CompanyName] [varchar](100) NULL,
	[CompanyCode] [varchar](30) NULL,
	[InternalCompanyName] [varchar](100) NULL,
	[InternalCompanyCode] [varchar](30) NULL,
	[Tripcode] [varchar](50) NULL,
	[PackageName] [varchar](50) NULL,
	[PackageCode] [varchar](10) NULL,
	[CharterTypeName] [varchar](50) NULL,
	[CharterTypeCode] [varchar](10) NULL,
	[BrochureName] [varchar](50) NULL,
	[BrochureCode] [varchar](10) NULL,
	[BrandName] [varchar](50) NULL,
	[BrandCode] [varchar](10) NULL,
	[ProductName] [varchar](50) NULL,
	[ProductCode] [varchar](10) NULL,
	[AreaName] [varchar](50) NULL,
	[AreaCode] [varchar](10) NULL,
	[UserDefinable1] [varchar](50) NULL,
	[UserDefinable2] [varchar](50) NULL,
	[UserDefinable3] [varchar](50) NULL,
	[UserDefinable4] [varchar](50) NULL,
	[UserDefinable5] [varchar](50) NULL,
	[UserDefinable6] [varchar](50) NULL,
	[UserDefinable7] [varchar](50) NULL,
	[UserDefinable8] [varchar](50) NULL,
	[UserDefinable9] [varchar](50) NULL,
	[UserDefinable10] [varchar](50) NULL,
	[PrimaryContactName] [varchar](12) NULL,
	[ReturnBaseCode] [varchar](6) NULL,
	[FlotillaIdentifier] [varchar](50) NULL,
	[GroupCode] [varchar](20) NULL,
	[InhibitProcessingFlag] [varchar](2) NULL,
	[AgentCode] [varchar](25) NULL,
	[ProductFlag] [varchar](10) NULL,
	[CleanBaseName] [varchar](50) NULL,
	[CleanBoatName] [varchar](50) NULL,
	[HullType] [varchar](50) NULL,
	[SkipperedProduct] [varchar](50) NULL,
	[ExecutiveReportingRegion] [varchar](50) NULL,
	[BoatType] [varchar](100) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [CELERITY_ST_BOOKINGS_PK]    Script Date: 24/08/2018 12:11:06 ******/
CREATE CLUSTERED INDEX [CELERITY_ST_BOOKINGS_PK] ON [dbo].[CELERITY_ST_BOOKINGS]
(
	[BookRef] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CELERITY_ST_BROCHUREREQUEST]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CELERITY_ST_BROCHUREREQUEST](
	[Source_Key] [varchar](50) NOT NULL,
	[ClientCode] [varchar](50) NOT NULL,
	[Type] [varchar](20) NULL,
	[BrochureName] [varchar](100) NULL,
	[DateRequested] [date] NULL,
	[Quantity] [int] NULL,
	[Notes] [varchar](200) NULL,
	[AddedBy] [varchar](50) NULL,
	[InternalCompanyName] [varchar](50) NULL,
	[InternalCompanyCode] [varchar](20) NULL,
	[Language] [varchar](30) NULL,
	[Location] [varchar](30) NULL,
	[Source] [varchar](50) NULL,
	[SourceCode] [varchar](50) NULL,
	[SecondarySource] [varchar](50) NULL,
	[SecondarySourceCode] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CELERITY_ST_CLIENT]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CELERITY_ST_CLIENT](
	[Source_Key] [varchar](50) NOT NULL,
	[ClientCode] [varchar](50) NOT NULL,
	[HouseHoldLeader] [varchar](10) NULL,
	[ClientSource] [varchar](100) NULL,
	[ClientSourceCode] [varchar](50) NULL,
	[DateCreated] [date] NULL,
	[Title] [varchar](10) NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[DateOfBirth] [date] NULL,
	[Nationality] [varchar](30) NULL,
	[Language] [varchar](30) NULL,
	[HouseName] [varchar](100) NULL,
	[CompanyName] [varchar](100) NULL,
	[Add1] [varchar](100) NULL,
	[Add2] [varchar](100) NULL,
	[Add3] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[County] [varchar](100) NULL,
	[Postcode] [varchar](30) NULL,
	[Country] [varchar](50) NULL,
	[ClientType] [varchar](30) NULL,
	[Phone1] [varchar](50) NULL,
	[Phone2] [varchar](50) NULL,
	[BusinessPhone] [varchar](50) NULL,
	[MobilePhone] [varchar](50) NULL,
	[Email1] [varchar](100) NULL,
	[UseEmail1] [varchar](5) NULL,
	[Email2] [varchar](100) NULL,
	[UseEmail2] [varchar](5) NULL,
	[Email3] [varchar](100) NULL,
	[UseEmail3] [varchar](5) NULL,
	[Email4] [varchar](100) NULL,
	[UseEmail4] [varchar](5) NULL,
	[AgencyReference] [varchar](20) NULL,
	[AgencyKeyContactName] [varchar](30) NULL,
	[ClientCat] [varchar](30) NULL,
	[CountryOfOrigin] [varchar](50) NULL,
	[Blacklisted] [varchar](10) NULL,
	[Deceased] [varchar](10) NULL,
	[GoneAway] [varchar](10) NULL,
	[UserDefinable1] [varchar](50) NULL,
	[UserDefinable2] [varchar](50) NULL,
	[UserDefinable3] [varchar](50) NULL,
	[UserDefinable4] [varchar](50) NULL,
	[UserDefinable5] [varchar](50) NULL,
	[UserDefinable6] [varchar](50) NULL,
	[UserDefinable7] [varchar](50) NULL,
	[UserDefinable8] [varchar](50) NULL,
	[UserDefinable9] [varchar](50) NULL,
	[UserDefinable10] [varchar](50) NULL,
	[CustomerDOB] [varchar](30) NULL,
	[CustomerLinkCode] [varchar](20) NULL,
	[CustomerClass] [varchar](20) NULL,
	[BookingOffice] [varchar](50) NULL,
	[NumberOfCharters] [int] NULL,
	[LastContactDate] [varchar](30) NULL,
	[LastCharterDate] [varchar](30) NULL,
	[Brand] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [CELERITY_ST_CLIENT_PK]    Script Date: 24/08/2018 12:11:06 ******/
CREATE CLUSTERED INDEX [CELERITY_ST_CLIENT_PK] ON [dbo].[CELERITY_ST_CLIENT]
(
	[ClientCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CELERITY_ST_CLIENTPREFERENCES]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CELERITY_ST_CLIENTPREFERENCES](
	[Source_Key] [varchar](50) NOT NULL,
	[ClientCode] [varchar](50) NOT NULL,
	[Brand] [varchar](20) NULL,
	[CancelFromBrochure] [varchar](5) NULL,
	[CancelFromMailing] [varchar](5) NULL,
	[CancelFromEmail] [varchar](5) NULL,
	[CancelFromTelephone] [varchar](5) NULL,
	[CancelFromSMS] [varchar](5) NULL,
	[CancelFromElectronicB] [varchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CELERITY_ST_EXTRAS]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CELERITY_ST_EXTRAS](
	[Source_Key] [varchar](50) NOT NULL,
	[BookRef] [varchar](50) NOT NULL,
	[ExtraName] [varchar](300) NULL,
	[Supplier] [varchar](100) NULL,
	[SupplierCode] [varchar](50) NULL,
	[Date] [date] NULL,
	[Qty] [int] NULL,
	[BaseExtraAdultPrice] [money] NULL,
	[BaseExtraChildPrice] [money] NULL,
	[ExtraAdultPrice] [money] NULL,
	[ExtraChildPrice] [money] NULL,
	[CurrencyCode] [varchar](50) NULL,
	[ExchangeRate] [decimal](18, 0) NULL,
	[ClientCode] [varchar](50) NULL,
	[TypeCode] [varchar](20) NULL,
	[TypeDescription] [varchar](50) NULL,
	[SubtypeCode] [varchar](20) NULL,
	[SubtypeDescription] [varchar](50) NULL,
	[TourCountry] [varchar](50) NULL,
	[Duration] [varchar](10) NULL,
	[CreateDate] [date] NULL,
	[SalesCategory] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CELERITY_ST_FLIGHTS]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CELERITY_ST_FLIGHTS](
	[Source_Key] [varchar](50) NOT NULL,
	[BookRef] [varchar](50) NOT NULL,
	[Airline] [varchar](50) NULL,
	[FlightNumber] [varchar](50) NULL,
	[DepartureDate] [date] NULL,
	[DepartureTime] [time](7) NULL,
	[ArrivalDate] [date] NULL,
	[ArrivalTime] [time](7) NULL,
	[DepartureAirportCode] [varchar](50) NULL,
	[DepartureAirportName] [varchar](50) NULL,
	[ArrivalAirportCode] [varchar](50) NULL,
	[ArrivalAirportName] [varchar](50) NULL,
	[Type] [varchar](30) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CELERITY_ST_MAILINGHISTORY]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CELERITY_ST_MAILINGHISTORY](
	[Source_Key] [varchar](50) NOT NULL,
	[ClientRef] [varchar](50) NOT NULL,
	[OfficeLocation] [varchar](20) NULL,
	[CreateDate] [date] NULL,
	[AddedBy] [varchar](50) NULL,
	[MailingName] [varchar](50) NULL,
	[MailingNameCode] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEPTUNE_MAIL_CONTACT]    Script Date: 24/08/2018 12:11:06 ******/
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
/****** Object:  Table [dbo].[NPT_BookedAccom]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NPT_BookedAccom](
	[Source_Key] [varchar](50) NULL,
	[BookRef] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[Resort] [varchar](50) NULL,
	[Type] [varchar](50) NULL,
	[Room] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[Region] [varchar](50) NULL,
	[Supplier] [varchar](50) NULL,
	[SupplierCode] [varchar](50) NULL,
	[BasePrice] [varchar](50) NULL,
	[CurrencyCode] [varchar](50) NULL,
	[ExchangeRate] [varchar](50) NULL,
	[Price] [varchar](50) NULL,
	[Base] [varchar](50) NULL,
	[Date] [varchar](50) NULL,
	[Duration] [varchar](50) NULL,
	[NoOfPassengers] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NPT_BookedExtra]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NPT_BookedExtra](
	[Source_Key] [varchar](50) NULL,
	[BookRef] [varchar](50) NULL,
	[ExtraName] [varchar](50) NULL,
	[Supplier] [varchar](50) NULL,
	[SupplierCode] [varchar](50) NULL,
	[Date] [varchar](50) NULL,
	[Qty] [varchar](50) NULL,
	[BaseExtraAdultPrice] [varchar](50) NULL,
	[BaseExtraChildPrice] [varchar](50) NULL,
	[ExtraAdultPrice] [varchar](50) NULL,
	[ExtraChildPrice] [varchar](50) NULL,
	[CurrencyCode] [varchar](50) NULL,
	[ExchangeRate] [varchar](50) NULL,
	[ClientCode] [varchar](50) NULL,
	[TypeCode] [varchar](50) NULL,
	[TypeDescription] [varchar](50) NULL,
	[SubtypeCode] [varchar](50) NULL,
	[SubtypeDescription] [varchar](50) NULL,
	[TourCountry] [varchar](50) NULL,
	[Duration] [varchar](50) NULL,
	[CreateDate] [varchar](50) NULL,
	[SalesCategory] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NPT_BookedFlight]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NPT_BookedFlight](
	[Source_Key] [varchar](50) NULL,
	[BookRef] [varchar](50) NULL,
	[Airline] [varchar](50) NULL,
	[FlightNumber] [varchar](50) NULL,
	[DepartureDate] [varchar](50) NULL,
	[DepartureTime] [varchar](50) NULL,
	[ArrivalDate] [varchar](50) NULL,
	[ArrivalTime] [varchar](50) NULL,
	[DepartureAirportCode] [varchar](50) NULL,
	[DepartureAirportName] [varchar](50) NULL,
	[ArrivalAirportCode] [varchar](50) NULL,
	[ArrivalAirportName] [varchar](50) NULL,
	[Type] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NPT_BookingPax]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NPT_BookingPax](
	[Source_Key] [varchar](50) NULL,
	[ClientCode] [varchar](50) NULL,
	[BookRef] [varchar](50) NULL,
	[ExpiryDate] [varchar](50) NULL,
	[IssueDate] [varchar](50) NULL,
	[LeadPassenger] [varchar](50) NULL,
	[PassengerType] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NPT_Bookings]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NPT_Bookings](
	[Source_Key] [varchar](50) NULL,
	[BookRef] [varchar](50) NULL,
	[LinkedBooking] [varchar](50) NULL,
	[BookingType] [varchar](50) NULL,
	[BookedBy] [varchar](50) NULL,
	[BookingSourcePrimary] [varchar](50) NULL,
	[BookingSourceSecondary] [varchar](50) NULL,
	[AmendedDate] [varchar](50) NULL,
	[BookingDate] [varchar](50) NULL,
	[OptionDate] [varchar](50) NULL,
	[CancelledDate] [varchar](50) NULL,
	[DepartureDate] [varchar](50) NULL,
	[ConfirmDate] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
	[TotalPax] [varchar](50) NULL,
	[Adults] [varchar](50) NULL,
	[Children] [varchar](50) NULL,
	[Infants] [varchar](50) NULL,
	[Duration] [varchar](50) NULL,
	[BaseTotalPrice] [varchar](50) NULL,
	[BaseTotalCost] [varchar](50) NULL,
	[BaseTotalMargin] [varchar](50) NULL,
	[TotalPrice] [varchar](50) NULL,
	[TotalCost] [varchar](50) NULL,
	[TotalMargin] [varchar](50) NULL,
	[TotalDiscount] [varchar](50) NULL,
	[ExchangeRate] [varchar](50) NULL,
	[CurrencyCode] [varchar](50) NULL,
	[BookingOfficeLocation] [varchar](50) NULL,
	[BookingLanguage] [varchar](50) NULL,
	[CompanyName] [varchar](50) NULL,
	[CompanyCode] [varchar](50) NULL,
	[InternalCompanyName] [varchar](50) NULL,
	[InternalCompanyCode] [varchar](50) NULL,
	[Tripcode] [varchar](50) NULL,
	[PackageName] [varchar](350) NULL,
	[PackageCode] [varchar](50) NULL,
	[CharterTypeName] [varchar](50) NULL,
	[CharterTypeCode] [varchar](50) NULL,
	[BrochureName] [varchar](50) NULL,
	[BrochureCode] [varchar](50) NULL,
	[BrandName] [varchar](50) NULL,
	[BrandCode] [varchar](50) NULL,
	[ProductName] [varchar](50) NULL,
	[ProductCode] [varchar](50) NULL,
	[AreaName] [varchar](50) NULL,
	[AreaCode] [varchar](50) NULL,
	[UserDefinable1] [varchar](50) NULL,
	[UserDefinable2] [varchar](50) NULL,
	[UserDefinable3] [varchar](50) NULL,
	[UserDefinable4] [varchar](50) NULL,
	[UserDefinable5] [varchar](50) NULL,
	[UserDefinable6] [varchar](50) NULL,
	[UserDefinable7] [varchar](50) NULL,
	[UserDefinable8] [varchar](50) NULL,
	[UserDefinable9] [varchar](50) NULL,
	[UserDefinable10] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NPT_BrochureRequest]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NPT_BrochureRequest](
	[Source_Key] [varchar](50) NULL,
	[ClientCode] [varchar](50) NULL,
	[Type] [varchar](50) NULL,
	[BrochureName] [varchar](50) NULL,
	[DateRequested] [varchar](50) NULL,
	[Quantity] [varchar](50) NULL,
	[Notes] [varchar](50) NULL,
	[AddedBy] [varchar](50) NULL,
	[InternalCompanyName] [varchar](50) NULL,
	[InternalCompanyCode] [varchar](50) NULL,
	[Language] [varchar](50) NULL,
	[Location] [varchar](50) NULL,
	[Source] [varchar](50) NULL,
	[SourceCode] [varchar](50) NULL,
	[SecondarySource] [varchar](50) NULL,
	[SecondarySourceCode] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NPT_Client]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NPT_Client](
	[Source_Key] [varchar](50) NULL,
	[ClientCode] [varchar](50) NULL,
	[HouseHoldLeader] [varchar](50) NULL,
	[ClientSource] [varchar](50) NULL,
	[ClientSourceCode] [varchar](50) NULL,
	[DateCreated] [varchar](50) NULL,
	[Title] [varchar](50) NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[DateOfBirth] [varchar](50) NULL,
	[Nationality] [varchar](50) NULL,
	[Language] [varchar](50) NULL,
	[HouseName] [varchar](50) NULL,
	[CompanyName] [varchar](50) NULL,
	[Add1] [varchar](50) NULL,
	[Add2] [varchar](50) NULL,
	[Add3] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[County] [varchar](50) NULL,
	[Postcode] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[ClientType] [varchar](50) NULL,
	[Phone1] [varchar](50) NULL,
	[Phone2] [varchar](50) NULL,
	[BusinessPhone] [varchar](50) NULL,
	[MobilePhone] [varchar](50) NULL,
	[Email1] [varchar](100) NULL,
	[UseEmail1] [varchar](50) NULL,
	[Email2] [varchar](50) NULL,
	[UseEmail2] [varchar](50) NULL,
	[Email3] [varchar](50) NULL,
	[UseEmail3] [varchar](50) NULL,
	[Email4] [varchar](50) NULL,
	[UseEmail4] [varchar](50) NULL,
	[AgencyReference] [varchar](50) NULL,
	[AgencyKeyContactName] [varchar](50) NULL,
	[ClientCat] [varchar](50) NULL,
	[CountryOfOrigin] [varchar](50) NULL,
	[Blacklisted] [varchar](50) NULL,
	[Deceased] [varchar](50) NULL,
	[GoneAway] [varchar](50) NULL,
	[UserDefinable1] [varchar](50) NULL,
	[UserDefinable2] [varchar](50) NULL,
	[UserDefinable3] [varchar](50) NULL,
	[UserDefinable4] [varchar](50) NULL,
	[UserDefinable5] [varchar](50) NULL,
	[UserDefinable6] [varchar](50) NULL,
	[UserDefinable7] [varchar](50) NULL,
	[UserDefinable8] [varchar](50) NULL,
	[UserDefinable9] [varchar](50) NULL,
	[UserDefinable10] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NPT_ClientPreference]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NPT_ClientPreference](
	[Source_Key] [varchar](50) NULL,
	[ClientCode] [varchar](50) NULL,
	[Brand] [varchar](50) NULL,
	[CancelFromBrochure] [varchar](50) NULL,
	[CancelFromMailing] [varchar](50) NULL,
	[CancelFromEmail] [varchar](50) NULL,
	[CancelFromTelephone] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NPT_MailingHistory]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NPT_MailingHistory](
	[Source_Key] [varchar](50) NULL,
	[Client_Code] [varchar](50) NULL,
	[OfficeLocation] [varchar](50) NULL,
	[CreateDate] [varchar](50) NULL,
	[AddedBy] [varchar](50) NULL,
	[MailingName] [varchar](50) NULL,
	[MailingNameCode] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NPT_ml_book]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NPT_ml_book](
	[F_mail_no] [varchar](50) NULL,
	[F_loc] [varchar](50) NULL,
	[F_history_no] [varchar](50) NULL,
	[F_client_no] [varchar](50) NULL,
	[F_type] [varchar](50) NULL,
	[F_opt_date] [varchar](50) NULL,
	[F_opt_by] [varchar](50) NULL,
	[F_rem_date] [varchar](50) NULL,
	[F_rem_by] [varchar](50) NULL,
	[F_conf_date] [varchar](50) NULL,
	[F_conf_by] [varchar](50) NULL,
	[F_canx_date] [varchar](50) NULL,
	[F_canx_by] [varchar](50) NULL,
	[F_source] [varchar](50) NULL,
	[F_sec_source] [varchar](50) NULL,
	[F_company] [varchar](50) NULL,
	[F_brochure] [varchar](50) NULL,
	[F_product] [varchar](50) NULL,
	[F_area] [varchar](50) NULL,
	[F_base] [varchar](50) NULL,
	[F_dep_date] [varchar](50) NULL,
	[F_accom_type] [varchar](50) NULL,
	[F_duration] [varchar](50) NULL,
	[F_pax] [varchar](50) NULL,
	[F_party_makeup] [varchar](50) NULL,
	[F_party_leader] [varchar](50) NULL,
	[F_value] [varchar](50) NULL,
	[F_origin] [varchar](50) NULL,
	[F_lang] [varchar](50) NULL,
	[F_imp_client_no] [varchar](50) NULL,
	[F_orig_brochure] [varchar](50) NULL,
	[F_fact_value] [varchar](50) NULL,
	[F_fact_pax] [varchar](50) NULL,
	[F_charter] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NPT_ml_cont]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NPT_ml_cont](
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
/****** Object:  Table [dbo].[NPT_ml_enq]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NPT_ml_enq](
	[F_mail_no] [varchar](50) NULL,
	[F_fam_no] [varchar](50) NULL,
	[F_company_no] [varchar](50) NULL,
	[F_lang] [varchar](50) NULL,
	[F_loc] [varchar](50) NULL,
	[F_history_no] [varchar](50) NULL,
	[F_added_date] [varchar](50) NULL,
	[F_added_by] [varchar](50) NULL,
	[F_source] [varchar](50) NULL,
	[F_sec_source] [varchar](50) NULL,
	[F_brochure] [varchar](50) NULL,
	[F_package] [varchar](50) NULL,
	[F_follow_up] [varchar](50) NULL,
	[F_decision_by] [varchar](50) NULL,
	[F_label_req] [varchar](50) NULL,
	[F_printed] [varchar](50) NULL,
	[F_orig_brochure] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NPT_ml_fam]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NPT_ml_fam](
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
	[F_dup_type] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NPT_ml_quest]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NPT_ml_quest](
	[F_mail_no] [varchar](50) NULL,
	[F_fam_no] [varchar](50) NULL,
	[F_loc] [varchar](50) NULL,
	[F_name1] [varchar](50) NULL,
	[F_dob1] [varchar](50) NULL,
	[F_sex1] [varchar](50) NULL,
	[F_kids1] [varchar](50) NULL,
	[F_kids2] [varchar](50) NULL,
	[F_kids3] [varchar](50) NULL,
	[F_kids4] [varchar](50) NULL,
	[F_kids5] [varchar](50) NULL,
	[F_income] [varchar](50) NULL,
	[F_occ] [varchar](50) NULL,
	[F_industry] [varchar](50) NULL,
	[F_marital_stat] [varchar](50) NULL,
	[F_holiday_with] [varchar](50) NULL,
	[F_outside_sailing1] [varchar](50) NULL,
	[F_outside_sailing2] [varchar](50) NULL,
	[F_outside_sailing3] [varchar](50) NULL,
	[F_outside_sailing4] [varchar](50) NULL,
	[F_outside_sailing5] [varchar](50) NULL,
	[F_fitness_club] [varchar](50) NULL,
	[F_pub1] [varchar](50) NULL,
	[F_pub2] [varchar](50) NULL,
	[F_pub3] [varchar](50) NULL,
	[F_news1] [varchar](50) NULL,
	[F_news2] [varchar](50) NULL,
	[F_news3] [varchar](50) NULL,
	[F_holiday_when1] [varchar](50) NULL,
	[F_holiday_when2] [varchar](50) NULL,
	[F_holiday_when3] [varchar](50) NULL,
	[F_book_in_advance] [varchar](50) NULL,
	[F_own_boat] [varchar](50) NULL,
	[F_yacht_club] [varchar](50) NULL,
	[F_boat_used_most] [varchar](50) NULL,
	[F_dinghy_sail_freq] [varchar](50) NULL,
	[F_dinghy_race_freq] [varchar](50) NULL,
	[F_charter_freq] [varchar](50) NULL,
	[F_windsurf_freq] [varchar](50) NULL,
	[F_yacht_sail_freq] [varchar](50) NULL,
	[F_yacht_race_freq] [varchar](50) NULL,
	[F_year_start] [varchar](50) NULL,
	[F_course1] [varchar](50) NULL,
	[F_course2] [varchar](50) NULL,
	[F_course3] [varchar](50) NULL,
	[F_notes] [varchar](4000) NULL,
	[F_similar_hol1] [varchar](50) NULL,
	[F_similar_hol2] [varchar](50) NULL,
	[F_similar_hol3] [varchar](255) NULL,
	[F_other_hol1] [varchar](1000) NULL,
	[F_other_hol2] [varchar](50) NULL,
	[F_other_hol3] [varchar](50) NULL,
	[F_other_hol4] [varchar](50) NULL,
	[F_other_hol5] [varchar](50) NULL,
	[F_other_hol6] [varchar](50) NULL,
	[F_household] [varchar](50) NULL,
	[F_sunsail_hols] [varchar](50) NULL,
	[F_hols_per_yr] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NPT_ml_raf]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NPT_ml_raf](
	[F_tag] [varchar](50) NULL,
	[F_mendor] [varchar](50) NULL,
	[F_mendee] [varchar](50) NULL,
	[F_brand] [varchar](50) NULL,
	[F_status] [varchar](50) NULL,
	[F_date_n] [varchar](50) NULL,
	[F_added_n] [varchar](50) NULL,
	[F_date_q] [varchar](50) NULL,
	[F_added_q] [varchar](50) NULL,
	[F_date_p] [varchar](50) NULL,
	[F_added_p] [varchar](50) NULL,
	[F_date_r] [varchar](50) NULL,
	[F_added_r] [varchar](50) NULL,
	[F_value] [varchar](50) NULL,
	[F_origin] [varchar](50) NULL,
	[F_client_no] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NPT_Quotes]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NPT_Quotes](
	[COMPANY_NUMBER] [varchar](50) NULL,
	[INV_COMPANY] [varchar](50) NULL,
	[LOCATION] [varchar](50) NULL,
	[CLIENT_NO] [varchar](50) NULL,
	[OPT_BOOK] [varchar](50) NULL,
	[START_DATE] [varchar](50) NULL,
	[BASE_CODE] [varchar](50) NULL,
	[CHARTER] [varchar](50) NULL,
	[REMOVED_DATE] [varchar](50) NULL,
	[AGENT_NAME] [varchar](50) NULL,
	[SURNAME] [varchar](50) NULL,
	[COMPANY] [varchar](50) NULL,
	[ADDR1] [varchar](50) NULL,
	[ADDR2] [varchar](50) NULL,
	[ADDR3] [varchar](50) NULL,
	[CITY] [varchar](50) NULL,
	[STATE] [varchar](50) NULL,
	[ZIP_CODE] [varchar](50) NULL,
	[COUNTRY] [varchar](50) NULL,
	[NATIONALITY] [varchar](50) NULL,
	[REASON] [varchar](50) NULL,
	[NETT_TOTAL] [varchar](50) NULL,
	[VAT] [varchar](50) NULL,
	[AGENT_COMM] [varchar](50) NULL,
	[PAYMENTS] [varchar](50) NULL,
	[EXPIRY_DATE] [varchar](50) NULL,
	[ADDED_BY] [varchar](50) NULL,
	[TITLE] [varchar](50) NULL,
	[FORENAME] [varchar](50) NULL,
	[TEL1_NO] [varchar](50) NULL,
	[TEL2_NO] [varchar](50) NULL,
	[TEL3_NO] [varchar](50) NULL,
	[EMAIL] [varchar](150) NULL,
	[BOAT_TYPE] [varchar](50) NULL,
	[END_BASE] [varchar](50) NULL,
	[DURATION] [varchar](50) NULL,
	[LANGUAGE] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NPT_rembook]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NPT_rembook](
	[F_company_no] [varchar](50) NULL,
	[F_inv_co] [varchar](50) NULL,
	[F_loc] [varchar](50) NULL,
	[F_client_no] [varchar](50) NULL,
	[F_opt_book] [varchar](50) NULL,
	[F_start_date] [varchar](50) NULL,
	[F_base_code] [varchar](50) NULL,
	[F_charter] [varchar](50) NULL,
	[F_removed_date] [varchar](50) NULL,
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
	[F_expiry_date] [varchar](50) NULL,
	[F_added_by] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SB_Currency]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SB_Currency](
	[CurrencyCode] [varchar](50) NULL,
	[CuurencyCodeUniform] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SB_NPT_Title]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SB_NPT_Title](
	[Title] [varchar](50) NULL,
	[MatchedTitle] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SB_TRT_Title]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SB_TRT_Title](
	[Title] [varchar](50) NULL,
	[MatchedTitle] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRT_BookedAccom]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRT_BookedAccom](
	[Source_Key] [varchar](50) NULL,
	[BookRef] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[Resort] [varchar](50) NULL,
	[Type] [varchar](50) NULL,
	[Room] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[Region] [varchar](50) NULL,
	[Supplier] [varchar](50) NULL,
	[SupplierCo] [varchar](50) NULL,
	[BasePrice] [varchar](50) NULL,
	[CurrencyCode] [varchar](50) NULL,
	[ExchangeRate] [varchar](50) NULL,
	[Price] [varchar](50) NULL,
	[Base] [varchar](50) NULL,
	[Date] [varchar](50) NULL,
	[Duration] [varchar](50) NULL,
	[NoOfPassengers] [varchar](50) NULL,
	[Comment] [varchar](50) NULL,
	[Brand] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRT_BookedAccom_Incremental]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRT_BookedAccom_Incremental](
	[Source_Key] [varchar](50) NULL,
	[BookRef] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[Resort] [varchar](50) NULL,
	[Type] [varchar](50) NULL,
	[Room] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[Region] [varchar](50) NULL,
	[Supplier] [varchar](50) NULL,
	[SupplierCo] [varchar](50) NULL,
	[BasePrice] [varchar](50) NULL,
	[CurrencyCode] [varchar](50) NULL,
	[ExchangeRate] [varchar](50) NULL,
	[Price] [varchar](50) NULL,
	[Base] [varchar](50) NULL,
	[Date] [varchar](50) NULL,
	[Duration] [varchar](50) NULL,
	[NoOfPassengers] [varchar](50) NULL,
	[Comment] [varchar](50) NULL,
	[Brand] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRT_BookedExtra]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRT_BookedExtra](
	[Source_Key] [varchar](50) NULL,
	[BookRef] [varchar](50) NULL,
	[ExtraName] [varchar](50) NULL,
	[Supplier] [varchar](50) NULL,
	[SupplierCode] [varchar](50) NULL,
	[Date] [varchar](50) NULL,
	[Qty] [varchar](50) NULL,
	[BaseExtraAdultPrice] [varchar](50) NULL,
	[BaseExtraChildPrice] [varchar](50) NULL,
	[ExtraAdultPrice] [varchar](50) NULL,
	[ExtraChildPrice] [varchar](50) NULL,
	[CurrencyCode] [varchar](50) NULL,
	[ExchangeRate] [varchar](50) NULL,
	[ClientCode] [varchar](50) NULL,
	[TypeCode] [varchar](50) NULL,
	[TypeDescription] [varchar](50) NULL,
	[SubtypeCode] [varchar](50) NULL,
	[SubtypeDescription] [varchar](50) NULL,
	[TourCountry] [varchar](50) NULL,
	[Duration] [varchar](50) NULL,
	[CreateDate] [varchar](50) NULL,
	[SalesCategory] [varchar](50) NULL,
	[Brand] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRT_BookedExtra_Incremental]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRT_BookedExtra_Incremental](
	[Source_Key] [varchar](50) NULL,
	[BookRef] [varchar](50) NULL,
	[ExtraName] [varchar](50) NULL,
	[Supplier] [varchar](50) NULL,
	[SupplierCode] [varchar](50) NULL,
	[Date] [varchar](50) NULL,
	[Qty] [varchar](50) NULL,
	[BaseExtraAdultPrice] [varchar](50) NULL,
	[BaseExtraChildPrice] [varchar](50) NULL,
	[ExtraAdultPrice] [varchar](50) NULL,
	[ExtraChildPrice] [varchar](50) NULL,
	[CurrencyCode] [varchar](50) NULL,
	[ExchangeRate] [varchar](50) NULL,
	[ClientCode] [varchar](50) NULL,
	[TypeCode] [varchar](50) NULL,
	[TypeDescription] [varchar](50) NULL,
	[SubtypeCode] [varchar](50) NULL,
	[SubtypeDescription] [varchar](50) NULL,
	[TourCountry] [varchar](50) NULL,
	[Duration] [varchar](50) NULL,
	[CreateDate] [varchar](50) NULL,
	[SalesCategory] [varchar](50) NULL,
	[Brand] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRT_BookedExtraLookup]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRT_BookedExtraLookup](
	[SourceSystem] [varchar](50) NULL,
	[TRT_BookedExtraName] [nvarchar](255) NULL,
	[DerivedExtraName] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRT_BookedFlight]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRT_BookedFlight](
	[Source_Key] [varchar](50) NULL,
	[BookRef] [varchar](50) NULL,
	[Airline] [varchar](50) NULL,
	[FlightNumber] [varchar](50) NULL,
	[DepartureDate] [varchar](50) NULL,
	[DepartureTime] [varchar](50) NULL,
	[ArrivalDate] [varchar](50) NULL,
	[ArrivalTime] [varchar](50) NULL,
	[DepartureAirportCode] [varchar](50) NULL,
	[DepartureAirportName] [varchar](50) NULL,
	[ArrivalAirportCode] [varchar](50) NULL,
	[ArrivalAirportName] [varchar](50) NULL,
	[Type] [varchar](50) NULL,
	[Brand] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRT_BookedFlight_Incremental]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRT_BookedFlight_Incremental](
	[Source_Key] [varchar](50) NULL,
	[BookRef] [varchar](50) NULL,
	[Airline] [varchar](50) NULL,
	[FlightNumber] [varchar](50) NULL,
	[DepartureDate] [varchar](50) NULL,
	[DepartureTime] [varchar](50) NULL,
	[ArrivalDate] [varchar](50) NULL,
	[ArrivalTime] [varchar](50) NULL,
	[DepartureAirportCode] [varchar](50) NULL,
	[DepartureAirportName] [varchar](50) NULL,
	[ArrivalAirportCode] [varchar](50) NULL,
	[ArrivalAirportName] [varchar](50) NULL,
	[Type] [varchar](50) NULL,
	[Brand] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRT_BookingOffice_Location]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRT_BookingOffice_Location](
	[BookingOfficeLocation] [varchar](50) NULL,
	[BookingLanguage] [varchar](15) NULL,
	[BookingLanguage_Default_Full] [varchar](15) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRT_BookingPax]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRT_BookingPax](
	[Source_Key] [varchar](50) NULL,
	[ClientCode] [varchar](50) NULL,
	[BookRef] [varchar](50) NULL,
	[ExpiryDate] [varchar](50) NULL,
	[IssueDate] [varchar](50) NULL,
	[LeadPassenger] [varchar](50) NULL,
	[PassengerType] [varchar](50) NULL,
	[Brand] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRT_BookingPax_Incremental]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRT_BookingPax_Incremental](
	[Source_Key] [varchar](50) NULL,
	[ClientCode] [varchar](50) NULL,
	[BookRef] [varchar](50) NULL,
	[ExpiryDate] [varchar](50) NULL,
	[IssueDate] [varchar](50) NULL,
	[LeadPassenger] [varchar](50) NULL,
	[PassengerType] [varchar](50) NULL,
	[Brand] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRT_Bookings]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRT_Bookings](
	[Source_Key] [varchar](50) NULL,
	[BookRef] [varchar](50) NULL,
	[LinkedBooking] [varchar](50) NULL,
	[BookingType] [varchar](50) NULL,
	[BookedBy] [varchar](50) NULL,
	[BookingSourcePrimary] [varchar](50) NULL,
	[BookingSourceSecondary] [varchar](50) NULL,
	[AmendedDate] [varchar](50) NULL,
	[BookingDate] [varchar](50) NULL,
	[OptionDate] [varchar](50) NULL,
	[CancelledDate] [varchar](50) NULL,
	[DepartureDate] [varchar](50) NULL,
	[ConfirmDate] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
	[TotalPax] [varchar](50) NULL,
	[Adults] [varchar](50) NULL,
	[Children] [varchar](50) NULL,
	[Infants] [varchar](50) NULL,
	[Duration] [varchar](50) NULL,
	[BaseTotalPrice] [varchar](50) NULL,
	[BaseTotalCost] [varchar](50) NULL,
	[BaseTotalMargin] [varchar](50) NULL,
	[TotalPrice] [varchar](50) NULL,
	[TotalCost] [varchar](50) NULL,
	[TotalMargin] [varchar](50) NULL,
	[TotalDiscount] [varchar](50) NULL,
	[ExchangeRate] [varchar](50) NULL,
	[CurrencyCode] [varchar](50) NULL,
	[BookingOfficeLocation] [varchar](50) NULL,
	[BookingLanguage] [varchar](50) NULL,
	[CompanyName] [varchar](50) NULL,
	[CompanyCode] [varchar](50) NULL,
	[InternalCompanyName] [varchar](50) NULL,
	[InternalCompanyCode] [varchar](50) NULL,
	[Tripcode] [varchar](50) NULL,
	[PackageName] [varchar](50) NULL,
	[PackageCode] [varchar](50) NULL,
	[CharterTypeName] [varchar](50) NULL,
	[CharterTypeCode] [varchar](50) NULL,
	[BrochureName] [varchar](50) NULL,
	[BrochureCode] [varchar](50) NULL,
	[BrandName] [varchar](50) NULL,
	[BrandCode] [varchar](50) NULL,
	[ProductName] [varchar](50) NULL,
	[ProductCode] [varchar](50) NULL,
	[AreaName] [varchar](50) NULL,
	[AreaCode] [varchar](50) NULL,
	[UserDefinable1] [varchar](50) NULL,
	[UserDefinable2] [varchar](50) NULL,
	[UserDefinable3] [varchar](50) NULL,
	[UserDefinable4] [varchar](50) NULL,
	[UserDefinable5] [varchar](50) NULL,
	[UserDefinable6] [varchar](50) NULL,
	[UserDefinable7] [varchar](50) NULL,
	[UserDefinable8] [varchar](50) NULL,
	[UserDefinable9] [varchar](50) NULL,
	[UserDefinable10] [varchar](50) NULL,
	[Brand] [varchar](50) NULL,
	[Destination] [varchar](50) NULL,
	[PrimaryContactName] [varchar](12) NULL,
	[ReturnBaseCode] [varchar](6) NULL,
	[FlotillaIdentifier] [varchar](50) NULL,
	[GroupCode] [varchar](20) NULL,
	[InhibitProcessingFlag] [varchar](2) NULL,
	[BookingOffice] [varchar](50) NULL,
	[AgentCode] [varchar](25) NULL,
	[ProductFlag] [varchar](10) NULL,
	[CleanBaseName] [varchar](50) NULL,
	[CleanBoatName] [varchar](50) NULL,
	[HullType] [varchar](50) NULL,
	[SkipperedProduct] [varchar](50) NULL,
	[ExecutiveReportingRegion] [varchar](50) NULL,
	[InvoiceNotes] [varchar](250) NULL,
	[ReturnBaseCodeName] [varchar](50) NULL,
	[ReturnDate] [varchar](10) NULL,
	[TravelStartDate] [varchar](10) NULL,
	[TravelEndDate] [varchar](10) NULL,
	[BoatName] [varchar](50) NULL,
	[BookingReference] [varchar](20) NULL,
	[AgentContactName] [varchar](50) NULL,
	[Direct_Agent] [varchar](2) NULL,
	[BoatNameClean] [varchar](50) NULL,
	[BoatType] [varchar](30) NULL,
	[Paperwork] [varchar](30) NULL,
	[SignedContractComplete] [varchar](1) NULL,
	[GuestListComplete] [varchar](1) NULL,
	[ResumeComplete] [varchar](1) NULL,
	[BoatPrice] [varchar](50) NULL,
	[ExtrasPrice] [varchar](50) NULL,
	[CDWPrice] [varchar](50) NULL,
	[Taxes] [varchar](50) NULL,
	[ListPrice] [varchar](50) NULL,
	[Discount] [varchar](50) NULL,
	[DiscountPercentage] [varchar](50) NULL,
	[Margin] [varchar](50) NULL,
	[MarginPercentage] [varchar](50) NULL,
	[CostToLeBoat] [varchar](50) NULL,
	[TotalPaid] [varchar](50) NULL,
	[TotalPaidDate] [varchar](10) NULL,
	[BalanceRemaining] [varchar](50) NULL,
	[BalanceDueDate] [varchar](10) NULL,
	[ProfitToLeBoat] [varchar](50) NULL,
	[BookingNotes] [varchar](500) NULL,
	[PaymentStatus] [varchar](50) NULL,
	[HoldFlag] [varchar](10) NULL,
	[OptionFlag] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRT_Bookings_Incremental]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRT_Bookings_Incremental](
	[Source_Key] [varchar](50) NULL,
	[BookRef] [varchar](50) NULL,
	[LinkedBooking] [varchar](50) NULL,
	[BookingType] [varchar](50) NULL,
	[BookedBy] [varchar](50) NULL,
	[BookingSourcePrimary] [varchar](50) NULL,
	[BookingSourceSecondary] [varchar](50) NULL,
	[AmendedDate] [varchar](50) NULL,
	[BookingDate] [varchar](50) NULL,
	[OptionDate] [varchar](50) NULL,
	[CancelledDate] [varchar](50) NULL,
	[DepartureDate] [varchar](50) NULL,
	[ConfirmDate] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
	[TotalPax] [varchar](50) NULL,
	[Adults] [varchar](50) NULL,
	[Children] [varchar](50) NULL,
	[Infants] [varchar](50) NULL,
	[Duration] [varchar](50) NULL,
	[BaseTotalPrice] [varchar](50) NULL,
	[BaseTotalCost] [varchar](50) NULL,
	[BaseTotalMargin] [varchar](50) NULL,
	[TotalPrice] [varchar](50) NULL,
	[TotalCost] [varchar](50) NULL,
	[TotalMargin] [varchar](50) NULL,
	[TotalDiscount] [varchar](50) NULL,
	[ExchangeRate] [varchar](50) NULL,
	[CurrencyCode] [varchar](50) NULL,
	[BookingOfficeLocation] [varchar](50) NULL,
	[BookingLanguage] [varchar](50) NULL,
	[CompanyName] [varchar](50) NULL,
	[CompanyCode] [varchar](50) NULL,
	[InternalCompanyName] [varchar](50) NULL,
	[InternalCompanyCode] [varchar](50) NULL,
	[Tripcode] [varchar](50) NULL,
	[PackageName] [varchar](50) NULL,
	[PackageCode] [varchar](50) NULL,
	[CharterTypeName] [varchar](50) NULL,
	[CharterTypeCode] [varchar](50) NULL,
	[BrochureName] [varchar](50) NULL,
	[BrochureCode] [varchar](50) NULL,
	[BrandName] [varchar](50) NULL,
	[BrandCode] [varchar](50) NULL,
	[ProductName] [varchar](50) NULL,
	[ProductCode] [varchar](50) NULL,
	[AreaName] [varchar](50) NULL,
	[AreaCode] [varchar](50) NULL,
	[UserDefinable1] [varchar](50) NULL,
	[UserDefinable2] [varchar](50) NULL,
	[UserDefinable3] [varchar](50) NULL,
	[UserDefinable4] [varchar](50) NULL,
	[UserDefinable5] [varchar](50) NULL,
	[UserDefinable6] [varchar](50) NULL,
	[UserDefinable7] [varchar](50) NULL,
	[UserDefinable8] [varchar](50) NULL,
	[UserDefinable9] [varchar](50) NULL,
	[UserDefinable10] [varchar](50) NULL,
	[Brand] [varchar](50) NULL,
	[Destination] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRT_BrochureRequest]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRT_BrochureRequest](
	[Source_Key] [varchar](50) NULL,
	[ClientCode] [varchar](50) NULL,
	[Type] [varchar](50) NULL,
	[BrochureName] [varchar](50) NULL,
	[DateRequested] [varchar](50) NULL,
	[Quantity] [varchar](50) NULL,
	[Notes] [varchar](50) NULL,
	[AddedBy] [varchar](50) NULL,
	[InternalCompanyName] [varchar](50) NULL,
	[InternalCompanyCode] [varchar](50) NULL,
	[Language] [varchar](50) NULL,
	[Location] [varchar](50) NULL,
	[Source] [varchar](50) NULL,
	[SourceCode] [varchar](50) NULL,
	[SecondarySource] [varchar](50) NULL,
	[SecondarySourceCode] [varchar](50) NULL,
	[Brand] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRT_BrochureRequest_Incremental]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRT_BrochureRequest_Incremental](
	[Source_Key] [varchar](50) NULL,
	[ClientCode] [varchar](50) NULL,
	[Type] [varchar](50) NULL,
	[BrochureName] [varchar](50) NULL,
	[DateRequested] [varchar](50) NULL,
	[Quantity] [varchar](50) NULL,
	[Notes] [varchar](50) NULL,
	[AddedBy] [varchar](50) NULL,
	[InternalCompanyName] [varchar](50) NULL,
	[InternalCompanyCode] [varchar](50) NULL,
	[Language] [varchar](50) NULL,
	[Location] [varchar](50) NULL,
	[Source] [varchar](50) NULL,
	[SourceCode] [varchar](50) NULL,
	[SecondarySource] [varchar](50) NULL,
	[SecondarySourceCode] [varchar](50) NULL,
	[Brand] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRT_Client]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRT_Client](
	[Source_Key] [varchar](50) NULL,
	[ClientCode] [varchar](50) NULL,
	[HouseHoldLeader] [varchar](50) NULL,
	[ClientSource] [varchar](50) NULL,
	[ClientSourceCode] [varchar](50) NULL,
	[DateCreated] [varchar](50) NULL,
	[Title] [varchar](50) NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[DateOfBirth] [varchar](50) NULL,
	[Nationality] [varchar](50) NULL,
	[Language] [varchar](50) NULL,
	[HouseName] [varchar](50) NULL,
	[CompanyName] [varchar](50) NULL,
	[Add1] [varchar](50) NULL,
	[Add2] [varchar](50) NULL,
	[Add3] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[County] [varchar](50) NULL,
	[Postcode] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[ClientType] [varchar](50) NULL,
	[Phone1] [varchar](50) NULL,
	[Phone2] [varchar](50) NULL,
	[Business Phone] [varchar](50) NULL,
	[Mobile Phone] [varchar](50) NULL,
	[Email1] [varchar](255) NULL,
	[UseEmail1] [varchar](50) NULL,
	[Email2] [varchar](50) NULL,
	[UseEmail2] [varchar](50) NULL,
	[Email3] [varchar](50) NULL,
	[UseEmail3] [varchar](50) NULL,
	[Email4] [varchar](50) NULL,
	[UseEmail4] [varchar](50) NULL,
	[AgencyReference] [varchar](50) NULL,
	[AgencyKeyContactName] [varchar](50) NULL,
	[ClientCat] [varchar](50) NULL,
	[CountryOfOrigin] [varchar](50) NULL,
	[Blacklisted] [varchar](50) NULL,
	[Deceased] [varchar](50) NULL,
	[GoneAway] [varchar](50) NULL,
	[UserDefinable1] [varchar](50) NULL,
	[UserDefinable2] [varchar](50) NULL,
	[UserDefinable3] [varchar](50) NULL,
	[UserDefinable4] [varchar](50) NULL,
	[UserDefinable5] [varchar](50) NULL,
	[UserDefinable6] [varchar](50) NULL,
	[UserDefinable7] [varchar](50) NULL,
	[UserDefinable8] [varchar](50) NULL,
	[UserDefinable9] [varchar](50) NULL,
	[UserDefinable10] [varchar](50) NULL,
	[Brand] [varchar](50) NULL,
	[CustomerDOB] [varchar](20) NULL,
	[CustomerLinkCode] [varchar](20) NULL,
	[CustomerClass] [varchar](20) NULL,
	[BookingOffice] [varchar](50) NULL,
	[NumberOfCharters] [varchar](10) NULL,
	[LastContactDate] [varchar](30) NULL,
	[LastCharterDate] [varchar](30) NULL,
	[EnteredBy] [varchar](50) NULL,
	[AgentCode] [varchar](50) NULL,
	[AgentBranch] [varchar](50) NULL,
	[LastActvityDate] [varchar](50) NULL,
	[FirstCharterDate] [varchar](50) NULL,
	[TotalLifetimeSpend] [varchar](50) NULL,
	[RFVScore] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRT_Client_Incremental]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRT_Client_Incremental](
	[Source_Key] [varchar](50) NULL,
	[ClientCode] [varchar](50) NULL,
	[HouseHoldLeader] [varchar](50) NULL,
	[ClientSource] [varchar](50) NULL,
	[ClientSourceCode] [varchar](50) NULL,
	[DateCreated] [varchar](50) NULL,
	[Title] [varchar](50) NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[DateOfBirth] [varchar](50) NULL,
	[Nationality] [varchar](50) NULL,
	[Language] [varchar](50) NULL,
	[HouseName] [varchar](50) NULL,
	[CompanyName] [varchar](50) NULL,
	[Add1] [varchar](50) NULL,
	[Add2] [varchar](50) NULL,
	[Add3] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[County] [varchar](50) NULL,
	[Postcode] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[ClientType] [varchar](50) NULL,
	[Phone1] [varchar](50) NULL,
	[Phone2] [varchar](50) NULL,
	[Business Phone] [varchar](50) NULL,
	[Mobile Phone] [varchar](50) NULL,
	[Email1] [varchar](255) NULL,
	[UseEmail1] [varchar](50) NULL,
	[Email2] [varchar](50) NULL,
	[UseEmail2] [varchar](50) NULL,
	[Email3] [varchar](50) NULL,
	[UseEmail3] [varchar](50) NULL,
	[Email4] [varchar](50) NULL,
	[UseEmail4] [varchar](50) NULL,
	[AgencyReference] [varchar](50) NULL,
	[AgencyKeyContactName] [varchar](50) NULL,
	[ClientCat] [varchar](50) NULL,
	[CountryOfOrigin] [varchar](50) NULL,
	[Blacklisted] [varchar](50) NULL,
	[Deceased] [varchar](50) NULL,
	[GoneAway] [varchar](50) NULL,
	[UserDefinable1] [varchar](50) NULL,
	[UserDefinable2] [varchar](50) NULL,
	[UserDefinable3] [varchar](50) NULL,
	[UserDefinable4] [varchar](50) NULL,
	[UserDefinable5] [varchar](50) NULL,
	[UserDefinable6] [varchar](50) NULL,
	[UserDefinable7] [varchar](50) NULL,
	[UserDefinable8] [varchar](50) NULL,
	[UserDefinable9] [varchar](50) NULL,
	[UserDefinable10] [varchar](50) NULL,
	[Brand] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRT_ClientPreference]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRT_ClientPreference](
	[Source_Key] [varchar](50) NULL,
	[ClientCode] [varchar](50) NULL,
	[Brand] [varchar](50) NULL,
	[CancelFromBrochure] [varchar](50) NULL,
	[CancelFromMailing] [varchar](50) NULL,
	[CancelFromEmail] [varchar](50) NULL,
	[CancelFromTelephone] [varchar](50) NULL,
	[BrandSource] [varchar](50) NULL,
	[OptInToEmail] [varchar](50) NULL,
	[OptInToEmailDate] [varchar](50) NULL,
	[UserDefinable1] [varchar](50) NULL,
	[UserDefinable2] [varchar](50) NULL,
	[UserDefinable3] [varchar](50) NULL,
	[UserDefinable4] [varchar](50) NULL,
	[UserDefinable5] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRT_ClientPreference_Incremental]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRT_ClientPreference_Incremental](
	[Source_Key] [varchar](50) NULL,
	[ClientCode] [varchar](50) NULL,
	[Brand] [varchar](50) NULL,
	[CancelFromBrochure] [varchar](50) NULL,
	[CancelFromMailing] [varchar](50) NULL,
	[CancelFromEmail] [varchar](50) NULL,
	[CancelFromTelephone] [varchar](50) NULL,
	[BrandSource] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRT_DateControl]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRT_DateControl](
	[Date_Identifier] [int] IDENTITY(1,1) NOT NULL,
	[Today] [date] NULL,
	[Today+1] [date] NULL,
	[today+7] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRT_Efirst]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRT_Efirst](
	[Source_Key] [varchar](50) NULL,
	[Name] [varchar](100) NULL,
	[EmailID] [varchar](200) NULL,
	[Country] [varchar](100) NULL,
	[CancelFromEmail] [char](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRT_Email_Language]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRT_Email_Language](
	[Client_Source_Key] [varchar](50) NULL,
	[Booking_BookRef] [varchar](50) NULL,
	[Client_Country] [varchar](50) NULL,
	[Client_Country_of_origin] [varchar](50) NULL,
	[Bookings_BookingOffice_location] [varchar](50) NULL,
	[Email_Language] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRT_EmailPreference]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRT_EmailPreference](
	[Source_Key] [varchar](50) NULL,
	[InternetAddress] [varchar](255) NULL,
	[Brand] [varchar](50) NULL,
	[NoBareeboatEmail] [varchar](1) NULL,
	[NoFlotillaEmail] [varchar](1) NULL,
	[NoCrewedYachtEmail] [varchar](1) NULL,
	[NoPoweredEmail] [varchar](1) NULL,
	[NoEmail] [varchar](1) NULL,
	[DoNotPhone] [varchar](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRT_File_Row_Counts]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRT_File_Row_Counts](
	[a_DataBase] [varchar](50) NULL,
	[a_Name] [varchar](50) NULL,
	[a_Row_Count] [int] NULL,
	[i_SK_Rownumber] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRT_MailingHistory]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRT_MailingHistory](
	[Source_Key] [varchar](50) NULL,
	[ClientRef] [varchar](50) NULL,
	[OfficeLocation] [varchar](50) NULL,
	[CreateDate] [varchar](50) NULL,
	[AddedBy] [varchar](50) NULL,
	[MailingName] [varchar](50) NULL,
	[MailingNameCode] [varchar](50) NULL,
	[Brand] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRT_MailingHistory_Incremental]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRT_MailingHistory_Incremental](
	[Source_Key] [varchar](50) NULL,
	[ClientRef] [varchar](50) NULL,
	[OfficeLocation] [varchar](50) NULL,
	[CreateDate] [varchar](50) NULL,
	[AddedBy] [varchar](50) NULL,
	[MailingName] [varchar](50) NULL,
	[MailingNameCode] [varchar](50) NULL,
	[Brand] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRT_Merged_Row_Counts]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRT_Merged_Row_Counts](
	[DataBase_Name] [varchar](50) NULL,
	[File_Name] [varchar](50) NULL,
	[File_Row_Count_Actual] [int] NULL,
	[File_Row_Count_Adjusted] [int] NULL,
	[Table_Row_Count] [int] NULL,
	[Table_Name] [varchar](50) NULL,
	[Row_Difference] [int] NULL,
	[i_SK_Rownumber] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRT_Sunsail_ST_EFMST]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRT_Sunsail_ST_EFMST](
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
/****** Object:  Table [dbo].[TRT_Table_Row_Counts]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRT_Table_Row_Counts](
	[AuditID] [int] IDENTITY(1,1) NOT NULL,
	[a_Name] [varchar](50) NULL,
	[Iteration] [int] NULL,
	[LoadTime] [datetime] NULL,
	[NumberofRecords] [int] NULL,
	[TableName] [varchar](25) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRT_Triton_ST_EFMST]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRT_Triton_ST_EFMST](
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
SET ANSI_PADDING ON
GO
/****** Object:  Index [CELERITY_ST_BOOKINGS_NCI]    Script Date: 24/08/2018 12:11:06 ******/
CREATE NONCLUSTERED INDEX [CELERITY_ST_BOOKINGS_NCI] ON [dbo].[CELERITY_ST_BOOKINGS]
(
	[BrandName] ASC,
	[Status] ASC
)
INCLUDE ( 	[BookRef],
	[BookingDate],
	[CancelledDate],
	[ConfirmDate],
	[BookingSourcePrimary]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [NonClusteredIndex-ClientCode]    Script Date: 24/08/2018 12:11:06 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-ClientCode] ON [dbo].[CELERITY_ST_BROCHUREREQUEST]
(
	[ClientCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [CELERITY_ST_CLIENT_NCI]    Script Date: 24/08/2018 12:11:06 ******/
CREATE NONCLUSTERED INDEX [CELERITY_ST_CLIENT_NCI] ON [dbo].[CELERITY_ST_CLIENT]
(
	[ClientCode] ASC,
	[Brand] ASC
)
INCLUDE ( 	[Email1]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [CELERITY_ST_CLIENTPREFERENCES_PK]    Script Date: 24/08/2018 12:11:06 ******/
CREATE NONCLUSTERED INDEX [CELERITY_ST_CLIENTPREFERENCES_PK] ON [dbo].[CELERITY_ST_CLIENTPREFERENCES]
(
	[ClientCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[BUILD_CELERITY_ST_NEPTUNE_ACCOMMODATON]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BUILD_CELERITY_ST_NEPTUNE_ACCOMMODATON]
AS
BEGIN
	
	DECLARE @rowcount BIGINT
	
	PRINT 'Build Celerity Neptune Accomodation Table.'
	
	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'MCEL','NeptAccomm','Build Neptune Celerity Accomodation Table.'

	INSERT INTO CELERITY_ST_ACCOMMODATION
		
	SELECT
		NPT_BookedAccom.Source_Key,
		NPT_BookedAccom.BookRef,
		NPT_BookedAccom.Name,
		NPT_BookedAccom.Resort,
		NPT_BookedAccom.Type,
		NPT_BookedAccom.Room,
		LEFT(NPT_BookedAccom.Country,30) AS Country,
		NPT_BookedAccom.Region,
		NPT_BookedAccom.Supplier,
		NPT_BookedAccom.SupplierCode,
		CASE
			WHEN NPT_BookedAccom.BasePrice = '' THEN NULL
			ELSE CAST(NPT_BookedAccom.BasePrice AS money)
		END  AS BasePrice,
		NPT_BookedAccom.CurrencyCode,
		CASE 
			WHEN NPT_BookedAccom.ExchangeRate = '' THEN NULL 
			ELSE CAST(CAST(NPT_BookedAccom.ExchangeRate AS real) AS decimal(18,0))
		END AS ExchangeRate,
		CASE
			WHEN NPT_BookedAccom.Price = '' THEN NULL
			ELSE CAST(NPT_BookedAccom.Price AS money)
		END AS Price,
		NPT_BookedAccom.Base,
		CASE 
			WHEN NPT_BookedAccom.Date = '' THEN NULL
			ELSE CONVERT(datetime,CelerityMarine_Stage.dbo.fn_CheckDate(SUBSTRING(NPT_BookedAccom.Date,7,4) + SUBSTRING(NPT_BookedAccom.Date,4,2) + SUBSTRING(NPT_BookedAccom.Date,1,2)),103)
		END AS Date,
		CASE
			WHEN NPT_BookedAccom.Duration = '' THEN NULL
			ELSE CAST(NPT_BookedAccom.Duration AS int)
		END AS Duration,
		CASE 
			WHEN NPT_BookedAccom.NoOfPassengers = '' THEN NULL
			ELSE CAST(NPT_BookedAccom.NoOfPassengers AS int)
		END AS NoOfPassengers,
		NULL AS Comment
	FROM
		NPT_BookedAccom
	LEFT JOIN 
		NPT_Bookings
		ON
			NPT_BookedAccom.BookRef = NPT_Bookings.BookRef
	WHERE 
		NPT_Bookings.BookRef IS NOT NULL
		
		
	SET @rowcount = @@ROWCOUNT
	
	-- End of SP
	EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'MCEL','NeptAccomm',@row_count=@rowcount
	
END
GO
/****** Object:  StoredProcedure [dbo].[BUILD_CELERITY_ST_NEPTUNE_BOOKEDPAX]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BUILD_CELERITY_ST_NEPTUNE_BOOKEDPAX]
AS
BEGIN
	
	DECLARE @rowcount BIGINT
	
	PRINT 'Build Celerity Neptune Booked Passengers Table.'
	
	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'MCEL','NeptBkdPax','Build Neptune Celerity Booked Passenger Table.'

	INSERT INTO 
		CELERITY_ST_BOOKEDPASSENGERS	
	SELECT 
		Client.ClientCode,
		Client.ClientCode,
		NPT_Bookings.BookRef,
		NULL,
		NULL,
		CASE WHEN LeadPassenger = 'TRUE' THEN 'Y' ELSE 'N' END AS LeadPassenger,
		DateOfBirth
	FROM 
		NPT_Bookings
	INNER JOIN
		NEPTUNE_Stage.dbo.ST_MARINE_FBKG ST_MARINE_FBKG
	ON
		SUBSTRING(NPT_Bookings.BookRef,5,LEN(NPT_Bookings.BookRef)-4) = ST_MARINE_FBKG.BkgRef
	INNER  JOIN
		(
			SELECT
				CASE WHEN CHARINDEX('-',ClientCode,5)=0 THEN '' ELSE SUBSTRING(NPT_Client.ClientCode,5, CHARINDEX('-',ClientCode,5) - 5) END AS ClientCodeNeptune, 
				ClientCode,
				DateOfBirth
			FROM 
				NPT_Client
			WHERE 
				ExistS (SELECT  SUBSTRING(NPT_Client.ClientCode,5, CHARINDEX('-',ClientCode,5) - 5) FROM NPT_Client)	
		)Client
		ON
			Client.ClientCodeNeptune = ST_MARINE_FBKG.ClientNo
	LEFT JOIN 
		NPT_BookingPax
		ON
			NPT_BookingPax.ClientCode = Client.ClientCode
			AND
			NPT_BookingPax.BookRef = NPT_Bookings.BookRef
	WHERE 
		ClientNo <>0
		AND
		NPT_BookingPax.ClientCode IS NULL
	
	INSERT INTO 
		CELERITY_ST_BOOKEDPASSENGERS	
	SELECT
		NPT_BookingPax.Source_Key,
		NPT_BookingPax.ClientCode,
		NPT_BookingPax.BookRef,
		CASE 
			WHEN NPT_BookingPax.ExpiryDate = '' THEN NULL
			ELSE CONVERT(datetime,CelerityMarine_Stage.dbo.fn_CheckDate(SUBSTRING(NPT_BookingPax.ExpiryDate,7,4) + SUBSTRING(NPT_BookingPax.ExpiryDate,4,2) + SUBSTRING(NPT_BookingPax.ExpiryDate,1,2)),103)
		END AS ExpiryDate,
		CASE 
			WHEN NPT_BookingPax.IssueDate = '' THEN NULL
			ELSE CONVERT(datetime,CelerityMarine_Stage.dbo.fn_CheckDate(SUBSTRING(NPT_BookingPax.IssueDate,7,4) + SUBSTRING(NPT_BookingPax.IssueDate,4,2) + SUBSTRING(NPT_BookingPax.IssueDate,1,2)),103)
		END AS IssueDate,
		CASE
			WHEN NPT_BookingPax.LeadPassenger = '' THEN NULL
			ELSE LEFT(NPT_BookingPax.LeadPassenger,10)
		END AS LeadPassenger,
		CASE
			WHEN NPT_BookingPax.PassengerType = '' THEN NULL
			ELSE LEFT(NPT_BookingPax.PassengerType,10)
		END AS PassengerType
	FROM
		NPT_BookingPax
	LEFT JOIN 
		NPT_Bookings
		ON
			NPT_BookingPax.BookRef = NPT_Bookings.BookRef
	LEFT JOIN 
		NPT_Client
		ON
			NPT_BookingPax.ClientCode = NPT_Client.ClientCode
	WHERE 
		NPT_Bookings.BookRef IS NOT NULL 
		AND
		NPT_Client.ClientCode IS NOT NULL	
		
		
		
	SET @rowcount = @@ROWCOUNT
	
	-- End of SP
	EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'MCEL','NeptBkdPax',@row_count=@rowcount
	
END
GO
/****** Object:  StoredProcedure [dbo].[BUILD_CELERITY_ST_NEPTUNE_BOOKINGS]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BUILD_CELERITY_ST_NEPTUNE_BOOKINGS]
AS
BEGIN
	
	DECLARE @rowcount BIGINT
	
	PRINT 'Build Celerity Neptune Bookings Table.'
	
	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'MCEL','NeptBookgs','Build Neptune Celerity Bookings Table.'

	INSERT INTO CELERITY_ST_BOOKINGS
		
	SELECT 
		NPT_Bookings.Source_Key,
		NPT_Bookings.BookRef,
		LEFT(NPT_Bookings.LinkedBooking,10) AS LinkedBooking,
		LEFT(NPT_Bookings.BookingType,30)AS BookingType,
		NPT_Bookings.BookedBy,
		NPT_Bookings.BookingSourcePrimary,
		NPT_Bookings.BookingSourceSecondary,
		CASE
			WHEN NPT_Bookings.AmendedDate = '' THEN NULL
			ELSE CONVERT(datetime,CelerityMarine_Stage.dbo.fn_CheckDate(SUBSTRING(NPT_Bookings.AmendedDate,7,4) + SUBSTRING(NPT_Bookings.AmendedDate,4,2) + SUBSTRING(NPT_Bookings.AmendedDate,1,2)),103)
		END AS AmendedDate,
		CASE
			WHEN NPT_Bookings.BookingDate = '' THEN NULL
			ELSE CONVERT(datetime,CelerityMarine_Stage.dbo.fn_CheckDate(SUBSTRING(NPT_Bookings.BookingDate,7,4) + SUBSTRING(NPT_Bookings.BookingDate,4,2) + SUBSTRING(NPT_Bookings.BookingDate,1,2)),103)
		END AS BookingDate,
		CASE
			WHEN NPT_Bookings.OptionDate = '' THEN NULL
			ELSE CONVERT(datetime,CelerityMarine_Stage.dbo.fn_CheckDate(SUBSTRING(NPT_Bookings.OptionDate,7,4) + SUBSTRING(NPT_Bookings.OptionDate,4,2) + SUBSTRING(NPT_Bookings.OptionDate,1,2)),103)
		END AS OptionDate,
		CASE
			WHEN NPT_Bookings.CancelledDate = '' THEN NULL
			ELSE CONVERT(datetime,CelerityMarine_Stage.dbo.fn_CheckDate(SUBSTRING(NPT_Bookings.CancelledDate,7,4) + SUBSTRING(NPT_Bookings.CancelledDate,4,2) + SUBSTRING(NPT_Bookings.CancelledDate,1,2)),103)
		END AS CancelledDate,
		CASE
			WHEN NPT_Bookings.DepartureDate = '' THEN NULL
			ELSE CONVERT(datetime,CelerityMarine_Stage.dbo.fn_CheckDate(SUBSTRING(NPT_Bookings.DepartureDate,7,4) + SUBSTRING(NPT_Bookings.DepartureDate,4,2) + SUBSTRING(NPT_Bookings.DepartureDate,1,2)),103)
		END AS DepartureDate,
		CASE
			WHEN NPT_Bookings.ConfirmDate = '' THEN NULL
			ELSE CONVERT(datetime,CelerityMarine_Stage.dbo.fn_CheckDate(SUBSTRING(NPT_Bookings.ConfirmDate,7,4) + SUBSTRING(NPT_Bookings.ConfirmDate,4,2) + SUBSTRING(NPT_Bookings.ConfirmDate,1,2)),103)
		END AS ConfirmDate,
		LEFT(NPT_Bookings.Status,30) AS Status,
		CASE
			WHEN NPT_Bookings.TotalPax = '' THEN NULL
			ELSE CAST(NPT_Bookings.TotalPax AS int)
		END AS TotalPax,
		CASE
			WHEN NPT_Bookings.Adults = '' THEN NULL
			ELSE CAST(NPT_Bookings.Adults AS int)
		END AS Adults,
		CASE
			WHEN NPT_Bookings.Children = '' THEN NULL
			ELSE CAST(NPT_Bookings.Children AS int)
		END AS Children,
		CASE
			WHEN NPT_Bookings.Infants = '' THEN NULL
			ELSE CAST(NPT_Bookings.Infants AS int)
		END AS Infants,
		CASE
			WHEN NPT_Bookings.Duration = '' THEN NULL
			ELSE CAST(NPT_Bookings.Duration AS int)
		END AS Duration,
		CASE
			WHEN NPT_Bookings.BaseTotalPrice = '' THEN NULL
			ELSE 1.0/CONF_DT_MARINE_EXCHANGERATE_GBP.a_ExchangeRate * CAST(NPT_Bookings.BaseTotalPrice AS money)
		END AS BaseTotalPrice,
		CASE
			WHEN NPT_Bookings.BaseTotalCost = '' THEN NULL
			ELSE 1.0/CONF_DT_MARINE_EXCHANGERATE_GBP.a_ExchangeRate * CAST(NPT_Bookings.BaseTotalCost AS money)
		END AS BaseTotalCost,
		CASE
			WHEN NPT_Bookings.BaseTotalMargin = '' THEN NULL
			ELSE 1.0/CONF_DT_MARINE_EXCHANGERATE_GBP.a_ExchangeRate * CAST(NPT_Bookings.BaseTotalMargin AS money)
		END AS BaseTotalMargin,
		CASE
			WHEN NPT_Bookings.TotalPrice = '' THEN NULL
			ELSE 1.0/CONF_DT_MARINE_EXCHANGERATE_GBP.a_ExchangeRate * CAST(NPT_Bookings.TotalPrice AS money)
		END AS TotalPrice,
		CASE
			WHEN NPT_Bookings.TotalCost = '' THEN NULL
			ELSE 1.0/CONF_DT_MARINE_EXCHANGERATE_GBP.a_ExchangeRate * CAST(NPT_Bookings.TotalCost AS money)
		END AS TotalCost,
		CASE
			WHEN NPT_Bookings.TotalMargin = '' THEN NULL
			ELSE 1.0/CONF_DT_MARINE_EXCHANGERATE_GBP.a_ExchangeRate * CAST(NPT_Bookings.TotalMargin AS money)
		END AS TotalMargin,
		CASE
			WHEN NPT_Bookings.TotalDiscount = '' THEN NULL
			ELSE  1.0/CONF_DT_MARINE_EXCHANGERATE_GBP.a_ExchangeRate * CAST(NPT_Bookings.TotalDiscount AS decimal(18,2))
		END AS TotalDiscount,
		CASE
			WHEN NPT_Bookings.ExchangeRate = '' THEN NULL
			ELSE CAST(NPT_Bookings.ExchangeRate AS decimal(18,3))
		END AS ExchangeRate,
		LEFT(NPT_Bookings.CurrencyCode,30) AS CurrencyCode,
		LEFT(NPT_Bookings.BookingOfficeLocation,10) AS BookingOfficeLocation,
		LEFT(NPT_Bookings.BookingLanguage,10) AS BookingLanguage,
		NPT_Bookings.CompanyName,
		LEFT(NPT_Bookings.CompanyCode,30) AS CompanyCode,
		NPT_Bookings.InternalCompanyName,
		LEFT(NPT_Bookings.InternalCompanyCode,30) AS InternalCompanyCode,
		NPT_Bookings.Tripcode,
		LEFT(NPT_Bookings.PackageName,50) AS PackageName,
		LEFT(NPT_Bookings.PackageCode,10) AS PackageCode,
		NPT_Bookings.CharterTypeName,
		LEFT(NPT_Bookings.CharterTypeCode,10) AS CharterTypeCode,
		NPT_Bookings.BrochureName,
		LEFT(NPT_Bookings.BrochureCode,10) AS BrochureCode,
		NPT_Bookings.BrandName,
		LEFT(NPT_Bookings.BrandCode,10) AS BrandCode,
		NPT_Bookings.ProductName,
		LEFT(NPT_Bookings.ProductCode,10) AS ProductCode,
		NPT_Bookings.AreaName,
		LEFT(NPT_Bookings.AreaCode,10) AS AreaCode,
		NPT_Bookings.UserDefinable1,
		NPT_Bookings.UserDefinable2,
		NPT_Bookings.UserDefinable3,
		NPT_Bookings.UserDefinable4,
		NPT_Bookings.UserDefinable5,
		NPT_Bookings.UserDefinable6,
		NPT_Bookings.UserDefinable7,
		NPT_Bookings.UserDefinable8,
		NPT_Bookings.UserDefinable9,
		NPT_Bookings.UserDefinable10
	FROM 
		NPT_Bookings
	LEFT JOIN 
		AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR
		ON
			CONF_DT_CALENDAR.a_date = CONVERT(datetime,CelerityMarine_Stage.dbo.fn_CheckDate(SUBSTRING(NPT_Bookings.DepartureDate,7,4) + SUBSTRING(NPT_Bookings.DepartureDate,4,2) + SUBSTRING(NPT_Bookings.DepartureDate,1,2)))
	LEFT JOIN 
		SB_Currency
		ON
			SB_Currency.CurrencyCode = NPT_Bookings.CurrencyCode
	--- can be made distinguis between M and S but the exchange rates the same I haven't at the moment
	LEFT JOIN
		AMI_Galaxy.dbo.CONF_DT_MARINE_EXCHANGERATE CONF_DT_MARINE_EXCHANGERATE_GBP
		ON
			CONF_DT_MARINE_EXCHANGERATE_GBP.a_CurrencyCode = SB_Currency.CuurencyCodeUniform
			AND
			CONF_DT_MARINE_EXCHANGERATE_GBP.a_TermsCode ='GBP'
			AND
			CONF_DT_CALENDAR.a_Date BETWEEN CONF_DT_MARINE_EXCHANGERATE_GBP.a_EffectiveFromDate AND CONF_DT_MARINE_EXCHANGERATE_GBP.a_EffectiveToDate
			AND
			CONF_DT_MARINE_EXCHANGERATE_GBP.a_SystemSourceID ='103'		
	WHERE 
		CONVERT(DATETIME,CelerityMarine_Stage.dbo.fn_CheckDate(CONVERT(INT,SUBSTRING(NPT_Bookings.OptionDate,7,4)+SUBSTRING(NPT_Bookings.OptionDate,4,2)+SUBSTRING(NPT_Bookings.OptionDate,1,2)))) >= '2010-01-01'
	
		
	SET @rowcount = @@ROWCOUNT
	
	-- End of SP
	EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'MCEL','NeptBookgs',@row_count=@rowcount
	
END
GO
/****** Object:  StoredProcedure [dbo].[BUILD_CELERITY_ST_NEPTUNE_BROCHUREREQUEST]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BUILD_CELERITY_ST_NEPTUNE_BROCHUREREQUEST]
AS
BEGIN
	
	DECLARE @rowcount BIGINT
	
	PRINT 'Build Celerity Neptune Brochure Request Table.'
	
	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'MCEL','NeptBroReq','Build Neptune Celerity Brochure Request Table.'

	INSERT INTO dbo.CELERITY_ST_BROCHUREREQUEST
		
	SELECT 
		NPT_BrochureRequest.Source_Key,
		NPT_BrochureRequest.ClientCode,
		LEFT(NPT_BrochureRequest.Type,20) AS NPT_BrochureRequest,
		NPT_BrochureRequest.BrochureName,
		CASE
			WHEN NPT_BrochureRequest.DateRequested = '' THEN NULL
			ELSE CONVERT(datetime,CelerityMarine_Stage.dbo.fn_CheckDate(SUBSTRING(NPT_BrochureRequest.DateRequested,7,4) + SUBSTRING(NPT_BrochureRequest.DateRequested,4,2) + SUBSTRING(NPT_BrochureRequest.DateRequested,1,2)),103)
		END AS DateRequested,
		CASE
			WHEN NPT_BrochureRequest.Quantity = '' THEN NULL
			ELSE CONVERT(int,NPT_BrochureRequest.Quantity)
		END AS Quantity,
		NPT_BrochureRequest.Notes,
		NPT_BrochureRequest.AddedBy,
		NPT_BrochureRequest.InternalCompanyName,
		LEFT(NPT_BrochureRequest.InternalCompanyCode,20) AS InternalCompanyCode,
		LEFT(NPT_BrochureRequest.Language,30) AS Language,
		LEFT(NPT_BrochureRequest.Location,30) AS Location,
		NPT_BrochureRequest.Source,
		NPT_BrochureRequest.SourceCode,
		NPT_BrochureRequest.SecondarySource,
		NPT_BrochureRequest.SecondarySourceCode
	FROM
		NPT_BrochureRequest
	LEFT JOIN 
		NPT_Client
		ON
			NPT_BrochureRequest.ClientCode = NPT_Client.ClientCode
	WHERE 
		NPT_Client.ClientCode IS NOT NULL
		
	SET @rowcount = @@ROWCOUNT
	
	-- End of SP
	EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'MCEL','NeptBroReq',@row_count=@rowcount
	
END
GO
/****** Object:  StoredProcedure [dbo].[BUILD_CELERITY_ST_NEPTUNE_CLIENT]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BUILD_CELERITY_ST_NEPTUNE_CLIENT]
AS
BEGIN
	
	DECLARE @rowcount BIGINT
	
	PRINT 'Build Celerity Neptune Client Table.'
	
	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'MCEL','NeptClient','Build Neptune Celerity Client Table.'

	INSERT INTO CELERITY_ST_CLIENT
		
	SELECT DISTINCT
		NPT_Client.Source_Key,
		NPT_Client.ClientCode,		
		LEFT(NPT_Client.HouseHoldLeader,10) AS HouseHoldLeader, 
		NPT_Client.ClientSource,
		NPT_Client.ClientSourceCode,
		CASE
			WHEN NPT_Client.DateCreated = '' THEN NULL
			ELSE CONVERT(datetime,CelerityMarine_Stage.dbo.fn_CheckDate(SUBSTRING(NPT_Client.DateCreated,7,4) + SUBSTRING(NPT_Client.DateCreated,4,2) + SUBSTRING(NPT_Client.DateCreated,1,2)),103)
		END AS DateCreated,
		LEFT(ISNULL([MatchedTitle] ,'unmatched'),10) AS Title,
		NPT_Client.FirstName,
		NPT_Client.LastName,
		CASE
			WHEN NPT_Client.DateCreated = '' THEN NULL
			ELSE CONVERT(datetime,CelerityMarine_Stage.dbo.fn_CheckDate(SUBSTRING(NPT_Client.DateOfBirth,7,4) + SUBSTRING(NPT_Client.DateOfBirth,4,2) + SUBSTRING(NPT_Client.DateOfBirth,1,2)),103)
		END AS DateOfBirth,
		LEFT(NPT_Client.Nationality,30) AS Nationality,
		LEFT(NPT_Client.Language,30) AS Language,
		NPT_Client.HouseName,
		NPT_Client.CompanyName,
		NPT_Client.Add1,
		NPT_Client.Add2,
		NPT_Client.Add3,
		NPT_Client.City,
		NPT_Client.County,
		LEFT(NPT_Client.Postcode,30)AS Postcode,
		NPT_Client.Country,
		LEFT(NPT_Client.ClientType,30) AS ClientType,
		NPT_Client.Phone1,
		NPT_Client.Phone2,
		NPT_Client.BusinessPhone,
		NPT_Client.MobilePhone,
		NPT_Client.Email1,
		LEFT(NPT_Client.UseEmail1,5) AS UseEmail1,
		NPT_Client.Email2,
		LEFT(NPT_Client.UseEmail2,5) AS UseEmail2,
		NPT_Client.Email3,
		LEFT(NPT_Client.UseEmail3,5) AS UseEmail3,
		NPT_Client.Email4,
		LEFT(NPT_Client.UseEmail4,5) AS UseEmail4,
		LEFT(NPT_Client.AgencyReference,20) AS AgencyReference,
		LEFT(NPT_Client.AgencyKeyContactName,30) AS AgencyKeyContactName,
		LEFT(NPT_Client.ClientCat,30) AS ClientCat,
		NPT_Client.CountryOfOrigin,
		LEFT(NPT_Client.Blacklisted,10) AS Blacklisted,
		LEFT(NPT_Client.Deceased,10) AS Deceased,
		LEFT(NPT_Client.GoneAway,10) AS GoneAway,
		NPT_Client.UserDefinable1,
		NPT_Client.UserDefinable2,
		NPT_Client.UserDefinable3,
		NPT_Client.UserDefinable4,
		NPT_Client.UserDefinable5,
		NPT_Client.UserDefinable6,
		NPT_Client.UserDefinable7,
		NPT_Client.UserDefinable8,
		NPT_Client.UserDefinable9,
		NPT_Client.UserDefinable10		
	FROM 
		NPT_Client
	LEFT JOIN 
		SB_NPT_Title
		ON
			SB_NPT_Title.Title = NPT_Client.Title	
	
		
	SET @rowcount = @@ROWCOUNT
	
	-- End of SP
	EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'MCEL','NeptClient',@row_count=@rowcount
	
END
GO
/****** Object:  StoredProcedure [dbo].[BUILD_CELERITY_ST_NEPTUNE_CLIENTPREFERENCE]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BUILD_CELERITY_ST_NEPTUNE_CLIENTPREFERENCE]
AS
BEGIN
	
	DECLARE @rowcount BIGINT
	
	PRINT 'Build Celerity Neptune Client Preference Table.'
	
	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'MCEL','NeptCliPref','Build Neptune Celerity Client Preference Table.'

	INSERT INTO dbo.CELERITY_ST_CLIENTPREFERENCES
		
	SELECT
		NPT_ClientPreference.Source_Key,
		NPT_ClientPreference.ClientCode,
		LEFT(NPT_ClientPreference.Brand,20) AS Brand,
		LEFT(NPT_ClientPreference.CancelFromBrochure,5) AS CancelFromBrochure,
		LEFT(NPT_ClientPreference.CancelFromMailing,5) AS CancelFromBrochure,
		LEFT(NPT_ClientPreference.CancelFromEmail,5) AS CancelFromBrochure,
		LEFT(NPT_ClientPreference.CancelFromTelephone,5) AS CancelFromBrochure,
		'',
		''
	FROM
		NPT_ClientPreference
	LEFT JOIN 
		NPT_Client
		ON
			NPT_ClientPreference.ClientCode = NPT_Client.ClientCode
	WHERE 
		NPT_Client.ClientCode IS NOT NULL
		
	SET @rowcount = @@ROWCOUNT
	
	-- End of SP
	EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'MCEL','NeptCliPref',@row_count=@rowcount
	
END
GO
/****** Object:  StoredProcedure [dbo].[BUILD_CELERITY_ST_NEPTUNE_EXTRAS]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BUILD_CELERITY_ST_NEPTUNE_EXTRAS]
AS
BEGIN
	
	DECLARE @rowcount BIGINT
	
	PRINT 'Build Celerity Neptune Extra.'
	
	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'MCEL','NeptExtras','Build Neptune Celerity Extras.'

	INSERT INTO dbo.CELERITY_ST_EXTRAS
		
	SELECT 
		NPT_BookedExtra.Source_Key,
		NPT_BookedExtra.BookRef,
		NPT_BookedExtra.ExtraName,
		NPT_BookedExtra.Supplier,
		NPT_BookedExtra.SupplierCode,
		CASE 
			WHEN NPT_BookedExtra.Date = '' THEN NULL
			ELSE CONVERT(datetime,CelerityMarine_Stage.dbo.fn_CheckDate(SUBSTRING(NPT_BookedExtra.Date,7,4) + SUBSTRING(NPT_BookedExtra.Date,4,2) + SUBSTRING(NPT_BookedExtra.Date,1,2)),103)
		END AS Date,
		CASE
			WHEN NPT_BookedExtra.Qty = '' THEN NULL
			ELSE CAST(NPT_BookedExtra.Qty AS int)
		END AS Qty,
		CASE
			WHEN NPT_BookedExtra.BaseExtraAdultPrice = '' THEN NULL
			ELSE CAST(NPT_BookedExtra.BaseExtraAdultPrice AS money)
		END AS BaseExtraAdultPrice,
		CASE
			WHEN NPT_BookedExtra.BaseExtraChildPrice = '' THEN NULL
			ELSE CAST(NPT_BookedExtra.BaseExtraChildPrice AS money)
		END AS BaseExtraChildPrice,
		CASE
			WHEN NPT_BookedExtra.ExtraAdultPrice = '' THEN NULL
			ELSE CAST(NPT_BookedExtra.ExtraAdultPrice AS money)
		END AS ExtraAdultPrice,
		CASE
			WHEN NPT_BookedExtra.ExtraChildPrice = '' THEN NULL
			ELSE CAST(NPT_BookedExtra.ExtraChildPrice AS money)
		END AS ExtraChildPrice,
		NPT_BookedExtra.CurrencyCode,
		CASE
			WHEN NPT_BookedExtra.ExchangeRate = '' THEN NULL
			ELSE CAST(NPT_BookedExtra.ExchangeRate AS decimal(18,0))
		END AS ExchangeRate,
		NPT_BookedExtra.ClientCode,
		LEFT(NPT_BookedExtra.TypeCode,20) AS TypeCode,
		NPT_BookedExtra.TypeDescription,
		LEFT(NPT_BookedExtra.SubtypeCode,20) AS SubtypeCode,
		NPT_BookedExtra.SubtypeDescription,
		NPT_BookedExtra.TourCountry,
		LEFT(NPT_BookedExtra.Duration,10)AS Duration,
		CASE 
			WHEN NPT_BookedExtra.CreateDate = '' THEN NULL
			ELSE CONVERT(datetime,CelerityMarine_Stage.dbo.fn_CheckDate(SUBSTRING(NPT_BookedExtra.CreateDate,7,4) + SUBSTRING(NPT_BookedExtra.CreateDate,4,2) + SUBSTRING(NPT_BookedExtra.CreateDate,1,2)),103)
		END AS CreateDate,
		NPT_BookedExtra.SalesCategory
	FROM
		NPT_BookedExtra
	LEFT JOIN 
		NPT_Bookings
		ON
			NPT_BookedExtra.BookRef = NPT_Bookings.BookRef
	WHERE 
		NPT_Bookings.BookRef IS NOT NULL
	
	-- End of SP
	EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'MCEL','NeptExtras',@row_count=@rowcount
	
END
GO
/****** Object:  StoredProcedure [dbo].[BUILD_CELERITY_ST_NEPTUNE_FLIGHTS]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BUILD_CELERITY_ST_NEPTUNE_FLIGHTS]
AS
BEGIN
	
	DECLARE @rowcount BIGINT
	
	PRINT 'Build Celerity Neptune Flights Table.'
	
	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'MCEL','NeptFlight','Build Neptune Celerity Flights Table.'

	INSERT INTO dbo.CELERITY_ST_FLIGHTS
		
	SELECT 
		NPT_BookedFlight.Source_Key,
		NPT_BookedFlight.BookRef,
		NPT_BookedFlight.Airline,
		NPT_BookedFlight.FlightNumber,
		CASE
			WHEN NPT_BookedFlight.DepartureDate = '' THEN NULL
			ELSE CONVERT(datetime,CelerityMarine_Stage.dbo.fn_CheckDate(SUBSTRING(NPT_BookedFlight.DepartureDate,7,4) + SUBSTRING(NPT_BookedFlight.DepartureDate,4,2) + SUBSTRING(NPT_BookedFlight.DepartureDate,1,2)),103) 
		END AS DepartureDate,
		CASE
			WHEN NPT_BookedFlight.DepartureTime = '' THEN NULL
			ELSE 
				CASE
					WHEN LEN(NPT_BookedFlight.DepartureTime)= 4 THEN CONVERT(time,'0' + SUBSTRING(NPT_BookedFlight.DepartureTime,1,1) + ':'+SUBSTRING(NPT_BookedFlight.DepartureTime,4,2)+':00:000')
					ELSE CONVERT(time,SUBSTRING(NPT_BookedFlight.DepartureTime,1,2)+':'+SUBSTRING(NPT_BookedFlight.DepartureTime,4,2)+':00:000')
				END
		END AS DepartureTime,
		CASE
			WHEN NPT_BookedFlight.ArrivalDate = '' THEN NULL
			ELSE CONVERT(datetime,CelerityMarine_Stage.dbo.fn_CheckDate(SUBSTRING(NPT_BookedFlight.ArrivalDate,7,4) + SUBSTRING(NPT_BookedFlight.ArrivalDate,4,2) + SUBSTRING(NPT_BookedFlight.ArrivalDate,1,2)),103) 
		END AS ArrivalDate,
		CASE
			WHEN NPT_BookedFlight.ArrivalTime = '' THEN NULL
			ELSE 
				CASE
					WHEN LEN(NPT_BookedFlight.ArrivalTime)= 4 THEN CONVERT(time,'0' + SUBSTRING(NPT_BookedFlight.ArrivalTime,1,1) + ':'+SUBSTRING(NPT_BookedFlight.ArrivalTime,4,2)+':00:000')
					ELSE CONVERT(time,SUBSTRING(NPT_BookedFlight.ArrivalTime,1,2)+':'+SUBSTRING(NPT_BookedFlight.ArrivalTime,4,2)+':00:000')
				END
		END AS ArrivalTime,
		NPT_BookedFlight.DepartureAirportCode,
		NPT_BookedFlight.DepartureAirportName,
		NPT_BookedFlight.ArrivalAirportCode,
		NPT_BookedFlight.ArrivalAirportName,
		LEFT(NPT_BookedFlight.Type,30) AS Type
	FROM
		NPT_BookedFlight
	LEFT JOIN 
		NPT_Bookings
		ON
			NPT_BookedFlight.BookRef = NPT_Bookings.BookRef
	WHERE 
		NPT_Bookings.BookRef IS NOT NULL
		
	SET @rowcount = @@ROWCOUNT
	
	-- End of SP
	EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'MCEL','NeptFlight',@row_count=@rowcount
	
END
GO
/****** Object:  StoredProcedure [dbo].[BUILD_CELERITY_ST_NEPTUNE_MAILINGHISTORY]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BUILD_CELERITY_ST_NEPTUNE_MAILINGHISTORY]
AS
BEGIN
	
	DECLARE @rowcount BIGINT
	
	PRINT 'Build Celerity Neptune MailingHistory Table.'
	
	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'MCEL','NeptMLHist','Build Neptune Celerity MailingHistory Table.'

	INSERT INTO CELERITY_ST_MAILINGHISTORY
		
	SELECT 
		NPT_MailingHistory.Source_Key,
		NPT_MailingHistory.Client_Code,
		LEFT(NPT_MailingHistory.OfficeLocation,20) AS OfficeLocation,
		CASE
			WHEN CreateDate = '' THEN NULL
			ELSE CONVERT(datetime,CelerityMarine_Stage.dbo.fn_CheckDate(SUBSTRING(NPT_MailingHistory.CreateDate,7,4) + SUBSTRING(NPT_MailingHistory.CreateDate,4,2) + SUBSTRING(NPT_MailingHistory.CreateDate,1,2)),103)
		END AS CreateDate,
		NPT_MailingHistory.AddedBy,
		NPT_MailingHistory.MailingName,
		LEFT(NPT_MailingHistory.MailingNameCode,20) AS MailingNameCode
	FROM
		NPT_MailingHistory
	LEFT JOIN 
		NPT_Client
		ON
			NPT_MailingHistory.Client_Code = NPT_Client.ClientCode
	WHERE 
		NPT_Client.ClientCode IS NOT NULL
		
	SET @rowcount = @@ROWCOUNT
	
	-- End of SP
	EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'MCEL','NeptMLHist',@row_count=@rowcount
	
END
GO
/****** Object:  StoredProcedure [dbo].[BUILD_CELERITY_ST_NEPTUNE_QUOTES]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[BUILD_CELERITY_ST_NEPTUNE_QUOTES]
AS
BEGIN
	
	DECLARE @rowcount BIGINT
	
	PRINT 'Build Celerity Neptune Quotes Table.'

	TRUNCATE TABLE [NEPTUNE_Stage].[dbo].[NEPTUNE_QUOTES]
	
	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'MCEL','NeptQuote','Build Neptune Celerity Quotes Table.'

	INSERT INTO [NEPTUNE_Stage].[dbo].[NEPTUNE_QUOTES]
           (
		   [COMPANY_NUMBER],[INV_COMPANY],[LOCATION],[CLIENT_NO],[OPT_BOOK]
			,[START_DATE],[BASE_CODE],[CHARTER],[REMOVED_DATE],[AGENT_NAME]
			,[SURNAME],[COMPANY],[ADDR1],[ADDR2],[ADDR3]
			,[CITY],[STATE],[ZIP_CODE],[COUNTRY],[NATIONALITY]
			,[REASON],[NETT_TOTAL],[VAT],[AGENT_COMM],[PAYMENTS]
			,[EXPIRY_DATE],[ADDED_BY],[TITLE],[FORENAME],[TEL1_NO]
			,[TEL2_NO],[TEL3_NO],[EMAIL],[BOAT_TYPE],[END_BASE]
			,[DURATION],[LANGUAGE],[DATE_LOADED]
			)
		
	SELECT		CAST([COMPANY_NUMBER] AS int),CAST([INV_COMPANY] AS varchar(5)),CAST([LOCATION] AS varchar(30)),CAST([CLIENT_NO] AS int),CAST([OPT_BOOK] AS varchar(3))
			,CAST([START_DATE] AS varchar(10)),CAST([BASE_CODE] AS varchar(20)),CAST([CHARTER] AS varchar(40)),CAST([REMOVED_DATE] AS varchar(10)),CAST([AGENT_NAME] AS varchar(50))
			,CAST( [SURNAME]AS varchar(50)),CAST([COMPANY] AS varchar(50)),CAST([ADDR1] AS varchar(50)),CAST([ADDR2] AS varchar(50)),CAST([ADDR3] AS varchar(50))
			,CAST([CITY] AS varchar(50)),CAST([STATE] AS varchar(40)),CAST([ZIP_CODE] AS varchar(25)),CAST([COUNTRY] AS varchar(50)),CAST([NATIONALITY] AS varchar(50))
			,CAST([REASON] AS varchar(10)),cast(left([NETT_TOTAL],11) as decimal(8,2)),cast([VAT] as decimal(8,2)),cast([AGENT_COMM] as decimal(8,2)),cast([PAYMENTS] as decimal(8,2))
			,CAST([EXPIRY_DATE] AS VARCHAr(10)),cast([ADDED_BY] as varchar(15)),cast([TITLE] as varchar(15)),cast([FORENAME] as varchar(50)),cast([TEL1_NO] as varchar(25))
			,CAST([TEL2_NO] AS varchar(25)),CAST([TEL3_NO] AS varchar(25)),CAST([EMAIL] AS varchar(100)),CAST([BOAT_TYPE] AS varchar(25)),CAST([END_BASE] AS varchar(25))
			,CAST([DURATION] AS int),CAST([LANGUAGE] AS varchar(5)), GETDATE()

	from	[CelerityMarine_Stage].[dbo].[NPT_Quotes]
		
	SET @rowcount = @@ROWCOUNT
	
	-- End of SP
	EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'MCEL','NeptQuote',@row_count=@rowcount
	
END

GO
/****** Object:  StoredProcedure [dbo].[BUILD_CELERITY_ST_TRITON_ACCOMMODATON]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BUILD_CELERITY_ST_TRITON_ACCOMMODATON]
AS
BEGIN
	
	DECLARE @rowcount BIGINT
	
	PRINT 'Build Celerity Triton Accomodation Table.'
	
	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'MCEL','TritAccomm','Build Triton Celerity Accomodation Table.'

	INSERT INTO CELERITY_ST_ACCOMMODATION
		
	SELECT
		REPLACE(TRT_BookedAccom.Source_Key,'TRT-','TRT-'+TRT_BookedAccom.Brand) AS Source_Key,
		REPLACE(TRT_BookedAccom.BookRef,'TRT-','TRT-'+TRT_BookedAccom.Brand) AS BookRef,
		--TRT_BookedAccom.Name,
		case 
		when patindex('%[0-9]%',name)=1 and substring(name,5,1)='' then substring([dbo].[fnProperCase2](name),6,50)
		when patindex('%[0-9]%',name)=1 and substring(name,6,1)='' then substring([dbo].[fnProperCase2](name),7,50)
		when patindex('%1 per%',name)=26 then substring ([dbo].[fnProperCase2](name),1,25)
		when patindex('%2 per%',name)=26 then substring ([dbo].[fnProperCase2](name),1,25)
		when patindex('%3 per%',name)=26 then substring ([dbo].[fnProperCase2](name),1,25)
		when patindex('%4 per%',name)=26 then substring ([dbo].[fnProperCase2](name),1,25)
		ELSE dbo.[fnProperCase2](name)
		end as Name,
		TRT_BookedAccom.Resort,
		TRT_BookedAccom.Type,
		TRT_BookedAccom.Room,
		LEFT(TRT_BookedAccom.Country,30) AS Country,
		TRT_BookedAccom.Region,
		TRT_BookedAccom.Supplier,
		TRT_BookedAccom.SupplierCo,
		CASE
			WHEN TRT_BookedAccom.BasePrice = '' THEN NULL
			ELSE CAST(TRT_BookedAccom.BasePrice AS money)
		END  AS BasePrice,
		TRT_BookedAccom.CurrencyCode,
		CASE 
			WHEN TRT_BookedAccom.ExchangeRate = '' THEN NULL 
			ELSE CAST(CAST(TRT_BookedAccom.ExchangeRate AS real) AS decimal(18,0))
		END AS ExchangeRate,
		CASE
			WHEN TRT_BookedAccom.Price = '' THEN NULL
			ELSE CAST(TRT_BookedAccom.Price AS money)
		END AS Price,
		TRT_BookedAccom.Base,
		CASE 
			WHEN TRT_BookedAccom.Date = '' THEN NULL
			ELSE CONVERT(datetime,CelerityMarine_Stage.dbo.fn_CheckDate(SUBSTRING(TRT_BookedAccom.Date,7,4) + SUBSTRING(TRT_BookedAccom.Date,4,2) + SUBSTRING(TRT_BookedAccom.Date,1,2)),103)
		END AS Date,
		CASE
			WHEN TRT_BookedAccom.Duration = '' THEN NULL
			ELSE CAST(TRT_BookedAccom.Duration AS int)
		END AS Duration,
		CASE 
			WHEN TRT_BookedAccom.NoOfPassengers = '' THEN NULL
			ELSE CAST(TRT_BookedAccom.NoOfPassengers AS int)
		END AS NoOfPassengers,
		Comment
	FROM
		TRT_BookedAccom
	LEFT JOIN 
		TRT_Bookings
		ON
			TRT_BookedAccom.BookRef = TRT_Bookings.BookRef
			AND
			TRT_BookedAccom.Brand = TRT_Bookings.Brand	
	WHERE 
		TRT_Bookings.BookRef IS NOT NULL
		
	SET @rowcount = @@ROWCOUNT
	
	-- End of SP	
	EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'MCEL','TritAccomm',@row_count=@rowcount
	
END
GO
/****** Object:  StoredProcedure [dbo].[BUILD_CELERITY_ST_TRITON_BOOKEDPAX]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BUILD_CELERITY_ST_TRITON_BOOKEDPAX]
AS
BEGIN
	
	DECLARE @rowcount BIGINT
	
	PRINT 'Build Celerity Triton Booked Passengers Table.'
	
	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'MCEL','TritBkdPax','Build Triton Celerity Booked Passenger Table.'

	INSERT INTO CELERITY_ST_BOOKEDPASSENGERS
		
	SELECT
		REPLACE(TRT_BookingPax.Source_Key,'TRT-','TRT-'+TRT_BookingPax.Brand) AS Source_Key,
		REPLACE(TRT_BookingPax.ClientCode,'TRT-','TRT-'+TRT_BookingPax.Brand) AS ClientCode,
		REPLACE(TRT_BookingPax.BookRef,'TRT-','TRT-'+TRT_BookingPax.Brand) AS BookRef,
		CASE 
			WHEN TRT_BookingPax.ExpiryDate = '' THEN NULL
			ELSE CONVERT(datetime,CelerityMarine_Stage.dbo.fn_CheckDate(SUBSTRING(TRT_BookingPax.ExpiryDate,7,4) + SUBSTRING(TRT_BookingPax.ExpiryDate,4,2) + SUBSTRING(TRT_BookingPax.ExpiryDate,1,2)),103)
		END AS ExpiryDate,
		CASE 
			WHEN TRT_BookingPax.IssueDate = '' THEN NULL
			ELSE CONVERT(datetime,CelerityMarine_Stage.dbo.fn_CheckDate(SUBSTRING(TRT_BookingPax.IssueDate,7,4) + SUBSTRING(TRT_BookingPax.IssueDate,4,2) + SUBSTRING(TRT_BookingPax.IssueDate,1,2)),103)
		END AS IssueDate,
		CASE
			WHEN TRT_BookingPax.LeadPassenger = '' THEN NULL
			ELSE LEFT(TRT_BookingPax.LeadPassenger,10)
		END AS LeadPassenger,
		CASE
			WHEN TRT_BookingPax.PassengerType = '' THEN NULL
			ELSE LEFT(TRT_BookingPax.PassengerType,10)
		END AS PassengerType
	FROM
		TRT_BookingPax
	LEFT JOIN 
		TRT_Bookings
		ON
			TRT_BookingPax.BookRef = TRT_Bookings.BookRef
			AND
			TRT_BookingPax.Brand = TRT_Bookings.Brand
	LEFT JOIN 
		TRT_Client
		ON
			TRT_BookingPax.ClientCode = TRT_Client.ClientCode
			AND
			TRT_BookingPax.Brand = TRT_Client.Brand
	WHERE 
		TRT_Bookings.BookRef IS NOT NULL 
		AND
		TRT_Client.ClientCode IS NOT NULL	
	
		
	SET @rowcount = @@ROWCOUNT
	
	-- End of SP
	EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'MCEL','TritBkdPax',@row_count=@rowcount
	
END
GO
/****** Object:  StoredProcedure [dbo].[BUILD_CELERITY_ST_TRITON_BOOKINGS]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[BUILD_CELERITY_ST_TRITON_BOOKINGS]
AS
BEGIN
	
	DECLARE @rowcount BIGINT
	
	PRINT 'Build Celerity Triton Bookings Table.'
	
	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'MCEL','TritBookgs','Build Triton Celerity Bookings Table.'

	INSERT INTO CELERITY_ST_BOOKINGS
		
	SELECT 
		REPLACE(TRT_Bookings.BookRef,'TRT-','TRT-'+TRT_Bookings.Brand) AS Source_Key,
		REPLACE(TRT_Bookings.BookRef,'TRT-','TRT-'+TRT_Bookings.Brand) AS BookRef,
		LEFT(TRT_Bookings.LinkedBooking,10) AS LinkedBooking,
		LEFT(TRT_Bookings.BookingType,30)AS BookingType,
		TRT_Bookings.BookedBy,
		TRT_Bookings.BookingSourcePrimary,
		TRT_Bookings.BookingSourceSecondary,
		CASE
			WHEN TRT_Bookings.AmendedDate = '' THEN NULL
			ELSE CONVERT(datetime,CelerityMarine_Stage.dbo.fn_CheckDate(SUBSTRING(TRT_Bookings.AmendedDate,7,4) + SUBSTRING(TRT_Bookings.AmendedDate,4,2) + SUBSTRING(TRT_Bookings.AmendedDate,1,2)),103)
		END AS AmendedDate,
		CASE
			WHEN TRT_Bookings.BookingDate = '' THEN NULL
			ELSE CONVERT(datetime,CelerityMarine_Stage.dbo.fn_CheckDate(SUBSTRING(TRT_Bookings.BookingDate,7,4) + SUBSTRING(TRT_Bookings.BookingDate,4,2) + SUBSTRING(TRT_Bookings.BookingDate,1,2)),103)
		END AS BookingDate,
		CASE
			WHEN TRT_Bookings.OptionDate = '' THEN NULL
			ELSE CONVERT(datetime,CelerityMarine_Stage.dbo.fn_CheckDate(SUBSTRING(TRT_Bookings.OptionDate,7,4) + SUBSTRING(TRT_Bookings.OptionDate,4,2) + SUBSTRING(TRT_Bookings.OptionDate,1,2)),103)
		END AS OptionDate,
		CASE
			WHEN TRT_Bookings.CancelledDate = '' THEN NULL
			ELSE CONVERT(datetime,CelerityMarine_Stage.dbo.fn_CheckDate(SUBSTRING(TRT_Bookings.CancelledDate,7,4) + SUBSTRING(TRT_Bookings.CancelledDate,4,2) + SUBSTRING(TRT_Bookings.CancelledDate,1,2)),103)
		END AS CancelledDate,
		CASE
			WHEN TRT_Bookings.DepartureDate = '' THEN NULL
			ELSE CONVERT(datetime,CelerityMarine_Stage.dbo.fn_CheckDate(SUBSTRING(TRT_Bookings.DepartureDate,7,4) + SUBSTRING(TRT_Bookings.DepartureDate,4,2) + SUBSTRING(TRT_Bookings.DepartureDate,1,2)),103)
		END AS DepartureDate,
		CASE
			WHEN TRT_Bookings.ConfirmDate = '' THEN NULL
			ELSE CONVERT(datetime,CelerityMarine_Stage.dbo.fn_CheckDate(SUBSTRING(TRT_Bookings.ConfirmDate,7,4) + SUBSTRING(TRT_Bookings.ConfirmDate,4,2) + SUBSTRING(TRT_Bookings.ConfirmDate,1,2)),103)
		END AS ConfirmDate,
		LEFT(TRT_Bookings.Status,30) AS Status,
		CASE
			WHEN TRT_Bookings.TotalPax = '' THEN NULL
			ELSE CAST(TRT_Bookings.TotalPax AS int)
		END AS TotalPax,
		CASE
			WHEN TRT_Bookings.Adults = '' THEN NULL
			ELSE CAST(TRT_Bookings.Adults AS int)
		END AS Adults,
		CASE
			WHEN TRT_Bookings.Children = '' THEN NULL
			ELSE CAST(TRT_Bookings.Children AS int)
		END AS Children,
		CASE
			WHEN TRT_Bookings.Infants = '' THEN NULL
			ELSE CAST(TRT_Bookings.Infants AS int)
		END AS Infants,
		CASE
			WHEN TRT_Bookings.Duration = '' THEN NULL
			ELSE CAST(TRT_Bookings.Duration AS int)
		END AS Duration,
		CASE
			WHEN TRT_Bookings.BaseTotalPrice = '' THEN NULL
			ELSE 1.0/CONF_DT_MARINE_EXCHANGERATE_GBP.a_ExchangeRate * CAST(TRT_Bookings.BaseTotalPrice AS money)
		END AS BaseTotalPrice,
		CASE
			WHEN TRT_Bookings.BaseTotalCost = '' THEN NULL
			ELSE 1.0/CONF_DT_MARINE_EXCHANGERATE_GBP.a_ExchangeRate * CAST(TRT_Bookings.BaseTotalCost AS money)
		END AS BaseTotalCost,
		CASE
			WHEN TRT_Bookings.BaseTotalMargin = '' THEN NULL
			ELSE 1.0/CONF_DT_MARINE_EXCHANGERATE_GBP.a_ExchangeRate * CAST(TRT_Bookings.BaseTotalMargin AS money)
		END AS BaseTotalMargin,
		CASE
			WHEN TRT_Bookings.TotalPrice = '' THEN NULL
			ELSE 1.0/CONF_DT_MARINE_EXCHANGERATE_GBP.a_ExchangeRate * CAST(TRT_Bookings.TotalPrice AS money)
		END AS TotalPrice,
		CASE
			WHEN TRT_Bookings.TotalCost = '' THEN NULL
			ELSE 1.0/CONF_DT_MARINE_EXCHANGERATE_GBP.a_ExchangeRate * CAST(TRT_Bookings.TotalCost AS money)
		END AS TotalCost,
		CASE
			WHEN TRT_Bookings.TotalMargin = '' THEN NULL
			ELSE 1.0/CONF_DT_MARINE_EXCHANGERATE_GBP.a_ExchangeRate * CAST(TRT_Bookings.TotalMargin AS money)
		END AS TotalMargin,
		CASE
			WHEN TRT_Bookings.TotalDiscount = '' THEN NULL
			ELSE 1.0/CONF_DT_MARINE_EXCHANGERATE_GBP.a_ExchangeRate * CAST(TRT_Bookings.TotalDiscount AS decimal(18,2))
		END AS TotalDiscount,
		CASE
			WHEN TRT_Bookings.ExchangeRate = '' THEN NULL
			ELSE CAST(TRT_Bookings.ExchangeRate AS decimal(18,3))
		END AS ExchangeRate,
		LEFT(TRT_Bookings.CurrencyCode,30) AS CurrencyCode,
		
		LEFT(TRT_Bookings.BookingOfficeLocation,10) AS BookingOfficeLocation,
		LEFT(TRT_Bookings.BookingLanguage,10) AS BookingLanguage,
		BookingLanguage_Default_Full ,
		TRT_Bookings.CompanyName,
		LEFT(TRT_Bookings.CompanyCode,30) AS CompanyCode,
		TRT_Bookings.InternalCompanyName,
		LEFT(TRT_Bookings.InternalCompanyCode,30) AS InternalCompanyCode,
		TRT_Bookings.Tripcode,
		LEFT(TRT_Bookings.PackageName,50) AS PackageName,
		LEFT(TRT_Bookings.PackageCode,10) AS PackageCode,
		TRT_Bookings.CharterTypeName,
		LEFT(TRT_Bookings.CharterTypeCode,10) AS CharterTypeCode,
		TRT_Bookings.BrochureName,
		LEFT(TRT_Bookings.BrochureCode,10) AS BrochureCode,
		CASE WHEN TRT_Bookings.Brand ='S' THEN 'SUN' 
			 WHEN SB_MARINE_BASE.a_ProductCode ='FOOTLOOSE' THEN 'FTL' ELSE 'MRG'END AS BrandName,
		LEFT(TRT_Bookings.BrandCode,10) AS BrandCode,
		CASE WHEN SB_MARINE_BASE.a_ProductCode ='FOOTLOOSE' THEN 'FOOTLOOSE'
			 WHEN SB_MARINE_BASE.a_ProductCode ='FRANCHISE' THEN 'FRANCHISE'
			 WHEN TRT_Bookings.CharterTypeCode ='P' THEN 'POWER'
			 WHEN TRT_Bookings.CharterTypeCode ='C' THEN 'CREWED'
			 WHEN TRT_Bookings.Destination <>'' THEN 'FLOTILLA'
			 ELSE SB_MARINE_BASE.a_ProductCode END AS ProductName,
		LEFT(TRT_Bookings.ProductCode,10) AS ProductCode,
		TRT_Bookings.AreaName,
		LEFT(TRT_Bookings.AreaCode,10) AS AreaCode,
		TRT_Bookings.UserDefinable1,
		TRT_Bookings.UserDefinable2,
		TRT_Bookings.UserDefinable3,
		TRT_Bookings.UserDefinable4,
		TRT_Bookings.UserDefinable5,
		TRT_Bookings.UserDefinable6,
		TRT_Bookings.UserDefinable7,
		TRT_Bookings.UserDefinable8,
		TRT_Bookings.UserDefinable9,
		TRT_Bookings.UserDefinable10,
		TRT_Bookings.PrimaryContactName,
		TRT_Bookings.ReturnBaseCode,
		TRT_Bookings.FlotillaIdentifier,
		TRT_Bookings.GroupCode,	
		TRT_Bookings.InhibitProcessingFlag,
		TRT_Bookings.AgentCode,
		TRT_Bookings.ProductFlag,
		TRT_Bookings.CleanBaseName,
		TRT_Bookings.CleanBoatName,
		TRT_Bookings.HullType,
		TRT_Bookings.SkipperedProduct,
		TRT_Bookings.ExecutiveReportingRegion,
		TRT_Bookings.BoatType
	FROM 
		TRT_Bookings
	LEFT JOIN
		AMI_Static.dbo.SB_MARINE_BASE SB_MARINE_BASE
		ON
			SB_MARINE_BASE.a_BaseCode = TRT_Bookings.AreaCode
			AND
			SB_MARINE_BASE.a_SourceSystem = CASE WHEN TRT_Bookings.Brand = 'S' THEN 'Neptune' ELSE 'Triton' END
	LEFT JOIN 
		AMI_Galaxy.dbo.CONF_DT_CALENDAR CONF_DT_CALENDAR
		ON
			CONF_DT_CALENDAR.a_date = CONVERT(datetime,CelerityMarine_Stage.dbo.fn_CheckDate(SUBSTRING(TRT_Bookings.DepartureDate,7,4) + SUBSTRING(TRT_Bookings.DepartureDate,4,2) + SUBSTRING(TRT_Bookings.DepartureDate,1,2)))
	LEFT JOIN 
		SB_Currency
		ON
			SB_Currency.CurrencyCode = TRT_Bookings.CurrencyCode
--- can be made distinguis between M and S but the exchange rates the same I haven't at the moment
	LEFT JOIN
		AMI_Galaxy.dbo.CONF_DT_MARINE_EXCHANGERATE CONF_DT_MARINE_EXCHANGERATE_GBP
		ON
			CONF_DT_MARINE_EXCHANGERATE_GBP.a_CurrencyCode = SB_Currency.CuurencyCodeUniform
			AND
			CONF_DT_MARINE_EXCHANGERATE_GBP.a_TermsCode ='GBP'
			AND
			CONF_DT_CALENDAR.a_Date BETWEEN CONF_DT_MARINE_EXCHANGERATE_GBP.a_EffectiveFromDate AND CONF_DT_MARINE_EXCHANGERATE_GBP.a_EffectiveToDate
			AND
			CONF_DT_MARINE_EXCHANGERATE_GBP.a_SystemSourceID ='101'
	LEFT JOIN
	TRT_BookingOffice_Location
		ON
			TRT_Bookings.BookingOfficeLocation=TRT_BookingOffice_Location.BookingOfficeLocation
			and 
			TRT_Bookings.Bookinglanguage=TRT_BookingOffice_Location.Bookinglanguage

		
	SET @rowcount = @@ROWCOUNT
	
	-- End of SP
	EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'MCEL','TritBookgs',@row_count=@rowcount
	
END

GO
/****** Object:  StoredProcedure [dbo].[BUILD_CELERITY_ST_TRITON_BROCHUREREQUEST]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BUILD_CELERITY_ST_TRITON_BROCHUREREQUEST]
AS
BEGIN
	
	DECLARE @rowcount BIGINT
	
	PRINT 'Build Celerity Triton Brochure Request Table.'
	
	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'MCEL','TritBroReq','Build Triton Celerity Brochure Request Table.'

	INSERT INTO dbo.CELERITY_ST_BROCHUREREQUEST
		
	SELECT 
		REPLACE(TRT_BrochureRequest.Source_Key,'TRT-','TRT-'+TRT_BrochureRequest.Brand) AS Source_Key,
		REPLACE(TRT_BrochureRequest.ClientCode,'TRT-','TRT-'+TRT_BrochureRequest.Brand) AS ClientCode,
		LEFT(TRT_BrochureRequest.Type,20) AS BrochureRequest,
		TRT_BrochureRequest.BrochureName,
		CASE
			WHEN TRT_BrochureRequest.DateRequested = '' THEN NULL
			ELSE CONVERT(datetime,CelerityMarine_Stage.dbo.fn_CheckDate(SUBSTRING(TRT_BrochureRequest.DateRequested,7,4) + SUBSTRING(TRT_BrochureRequest.DateRequested,4,2) + SUBSTRING(TRT_BrochureRequest.DateRequested,1,2)),103)
		END AS DateRequested,
		CASE
			WHEN TRT_BrochureRequest.Quantity = '' THEN NULL
			ELSE CONVERT(int,TRT_BrochureRequest.Quantity)
		END AS Quantity,
		TRT_BrochureRequest.Notes,
		TRT_BrochureRequest.AddedBy,
		TRT_BrochureRequest.InternalCompanyName,
		LEFT(TRT_BrochureRequest.InternalCompanyCode,20) AS InternalCompanyCode,
		LEFT(TRT_BrochureRequest.Language,30) AS Language,
		LEFT(TRT_BrochureRequest.Location,30) AS Location,
		TRT_BrochureRequest.Source,
		TRT_BrochureRequest.SourceCode,
		TRT_BrochureRequest.SecondarySource,
		TRT_BrochureRequest.SecondarySourceCode
	FROM
		TRT_BrochureRequest
	LEFT JOIN 
		TRT_Client
		ON
			TRT_BrochureRequest.ClientCode = TRT_Client.ClientCode
			AND
			TRT_BrochureRequest.Brand = TRT_Client.Brand
		
		
	SET @rowcount = @@ROWCOUNT
	
	-- End of SP
	EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'MCEL','TritBroReq',@row_count=@rowcount
	
END
GO
/****** Object:  StoredProcedure [dbo].[BUILD_CELERITY_ST_TRITON_CLIENT]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--========================================================================================================================
-- Procedure Date - Procedure Description
--                  BUILD_CELERITY_ST_TRITON_CLIENT - Selects Triton TRT_Client records for staging
--
--========================================================================================================================
-- Change History===
--========================================================================================================================
-- Date             Version     Who                Comment
-- 18-Apr-2018      1.1         Tim Wilson         New requirement for date of birth calculation received from Lubna Khan
-- 25-Apr-2018      1.2         Tim Wilson         New column for Brand
--                                                 to enable unambiguous join between CELERITY_ST_BOOKINGS, etc.
--                                                 and CELERITY_ST_CLIENT (ClientCode is only unique within a Brand)
--========================================================================================================================
CREATE PROCEDURE [dbo].[BUILD_CELERITY_ST_TRITON_CLIENT]
AS
BEGIN
	
	DECLARE @rowcount BIGINT
	
	PRINT 'Build Celerity Triton Client Table.'
	
	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'MCEL','TritClient','Build Triton Celerity Client Table.'

	INSERT INTO CELERITY_ST_CLIENT
		
	SELECT DISTINCT
		REPLACE(TRT_Client.Source_Key,'TRT-','TRT-'+TRT_Client.Brand) AS Source_Key,
		REPLACE(TRT_Client.ClientCode,'TRT-','TRT-'+TRT_Client.Brand) AS BookRef,		
		LEFT(TRT_Client.HouseHoldLeader,10) AS HouseHoldLeader, 
		TRT_Client.ClientSource,
		TRT_Client.ClientSourceCode,
		CASE
			WHEN TRT_Client.DateCreated = '' THEN NULL
			ELSE CONVERT(datetime,CelerityMarine_Stage.dbo.fn_CheckDate(SUBSTRING(TRT_Client.DateCreated,7,4) + SUBSTRING(TRT_Client.DateCreated,4,2) + SUBSTRING(TRT_Client.DateCreated,1,2)),103)
		END AS DateCreated,
		LEFT(ISNULL([MatchedTitle] ,'unmatched'),10) AS Title,
		TRT_Client.FirstName,
		TRT_Client.LastName,
		-- 17/04/2018  TW  Per Lubna Khan DOB should be taken from CustomerDOB then DateOfBirth
		CASE
			WHEN TRT_Client.DateCreated  = '' THEN NULL
			WHEN TRT_Client.CustomerDOB != '' AND TRT_Client.CustomerDOB != '0' THEN CONVERT(datetime,CelerityMarine_Stage.dbo.fn_CheckDate(SUBSTRING(TRT_Client.CustomerDOB,7,4) + SUBSTRING(TRT_Client.CustomerDOB,4,2) + SUBSTRING(TRT_Client.CustomerDOB,1,2)),103)
			WHEN TRT_Client.DateOfBirth != '' AND TRT_Client.DateOfBirth != '0' THEN CONVERT(datetime,CelerityMarine_Stage.dbo.fn_CheckDate(SUBSTRING(TRT_Client.DateOfBirth,7,4) + SUBSTRING(TRT_Client.DateOfBirth,4,2) + SUBSTRING(TRT_Client.DateOfBirth,1,2)),103)
			ELSE NULL
		END AS DateOfBirth,
		LEFT(TRT_Client.Nationality,30) AS Nationality,
		LEFT(TRT_Client.Language,30) AS Language,
		TRT_Client.HouseName,
		TRT_Client.CompanyName,
		TRT_Client.Add1,
		TRT_Client.Add2,
		TRT_Client.Add3,
		TRT_Client.City,
		TRT_Client.County,
		LEFT(TRT_Client.Postcode,30)AS Postcode,
		TRT_Client.Country,
		LEFT(TRT_Client.ClientType,30) AS ClientType,
		TRT_Client.Phone1,
		TRT_Client.Phone2,
		TRT_Client.[Business Phone],
		TRT_Client.[Mobile Phone],
		TRT_Client.Email1,
		LEFT(TRT_Client.UseEmail1,5) AS UseEmail1,
		TRT_Client.Email2,
		LEFT(TRT_Client.UseEmail2,5) AS UseEmail2,
		TRT_Client.Email3,
		LEFT(TRT_Client.UseEmail3,5) AS UseEmail3,
		TRT_Client.Email4,
		LEFT(TRT_Client.UseEmail4,5) AS UseEmail4,
		LEFT(TRT_Client.AgencyReference,20) AS AgencyReference,
		LEFT(TRT_Client.AgencyKeyContactName,30) AS AgencyKeyContactName,
		LEFT(TRT_Client.ClientCat,30) AS ClientCat,
		TRT_Client.CountryOfOrigin,
		LEFT(TRT_Client.Blacklisted,10) AS Blacklisted,
		LEFT(TRT_Client.Deceased,10) AS Deceased,
		LEFT(TRT_Client.GoneAway,10) AS GoneAway,
		TRT_Client.UserDefinable1,
		TRT_Client.UserDefinable2,
		TRT_Client.UserDefinable3,
		TRT_Client.UserDefinable4,
		TRT_Client.UserDefinable5,
		TRT_Client.UserDefinable6,
		TRT_Client.UserDefinable7,
		TRT_Client.UserDefinable8,
		TRT_Client.UserDefinable9,
		TRT_Client.UserDefinable10,
		TRT_Client.CustomerDOB,
		TRT_Client.CustomerLinkCode,
		TRT_Client.CustomerClass,
		TRT_Client.BookingOffice,
		TRT_Client.NumberOfCharters,
		CASE 
			WHEN
				TRT_Client.LastContactdate='0' THEN '0'
				ELSE 
				CONVERT(VARCHAR(30),convert(varchar(30),cast(TRT_Client.LastContactdate as datetime),103))
			END AS LastContactDate,
		CASE 
			WHEN
				TRT_Client.LastCharterdate='0' THEN '0'
				ELSE 
				CONVERT(VARCHAR(30),convert(varchar(30),cast(TRT_Client.LastCharterdate as datetime),103))
			END AS LastCharterDate,
		TRT_Client.Brand
	FROM 
		TRT_Client
	LEFT JOIN 
		SB_TRT_Title
		ON
			SB_TRT_Title.Title = TRT_Client.Title	
	
		
	SET @rowcount = @@ROWCOUNT
	
	-- End of SP
	EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'MCEL','TritClient',@row_count=@rowcount
	
END

GO
/****** Object:  StoredProcedure [dbo].[BUILD_CELERITY_ST_TRITON_CLIENT_BOOKINGS_X]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BUILD_CELERITY_ST_TRITON_CLIENT_BOOKINGS_X]
AS
BEGIN
	
	DECLARE @rowcount BIGINT
	
	PRINT 'Build Celerity Neptune Accomodation Table.'
	
	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'MCEL','NeptAccomm','Build Neptune Celerity Client Booking X Table.'

	truncate table CELERITY_ST_CLIENT_BOOKINGS_X
		
	insert into CELERITY_ST_CLIENT_BOOKINGS_X(ClientCode,Source_Key)
	SELECT distinct CELERITY_ST_CLIENT.ClientCode,CELERITY_ST_BOOKINGS.Source_Key
	FROM
	  CelerityMarine_Stage.dbo.CELERITY_ST_CLIENT  
	  inner JOIN CelerityMarine_Stage.dbo.CELERITY_ST_BOOKEDPASSENGERS 
	  ON (CelerityMarine_Stage.dbo.CELERITY_ST_CLIENT.ClientCode=CelerityMarine_Stage.dbo.CELERITY_ST_BOOKEDPASSENGERS.ClientCode) 
	  inner join CelerityMarine_Stage.dbo.CELERITY_ST_BOOKINGS
	  on CelerityMarine_Stage.dbo.CELERITY_ST_BOOKEDPASSENGERS.BookRef=CelerityMarine_Stage.dbo.CELERITY_ST_BOOKINGS.Source_Key

		
		
	SET @rowcount = @@ROWCOUNT
	
	-- End of SP
	EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'MCEL','NeptAccomm',@row_count=@rowcount
	
END

GO
/****** Object:  StoredProcedure [dbo].[BUILD_CELERITY_ST_TRITON_CLIENTPREFERENCE]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BUILD_CELERITY_ST_TRITON_CLIENTPREFERENCE]
AS
BEGIN
	
	DECLARE @rowcount BIGINT
	
	PRINT 'Build Celerity Triton Client Preference Table.'
	
	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'MCEL','TritCliPref','Build Triton Celerity Client Preference Table.'

	INSERT INTO dbo.CELERITY_ST_CLIENTPREFERENCES
		
	SELECT
		REPLACE(TRT_ClientPreference.Source_Key,'TRT-','TRT-'+TRT_ClientPreference.Brand) AS Source_Key,
		REPLACE(TRT_ClientPreference.ClientCode,'TRT-','TRT-'+TRT_ClientPreference.BrandSource) AS ClientCode,	
		LEFT(TRT_ClientPreference.Brand,20) AS Brand,
		LEFT(TRT_ClientPreference.CancelFromBrochure,5) AS CancelFromBrochure,
		LEFT(TRT_ClientPreference.CancelFromMailing,5) AS CancelFromBrochure,
		LEFT(TRT_ClientPreference.CancelFromEmail,5) AS CancelFromBrochure,
		LEFT(TRT_ClientPreference.CancelFromTelephone,5) AS CancelFromBrochure,
		'',
		''
	FROM
		TRT_ClientPreference
	LEFT JOIN 
		TRT_Client
		ON
			TRT_ClientPreference.ClientCode = TRT_Client.ClientCode
			AND
			TRT_ClientPreference.BrandSource = TRT_Client.Brand
	WHERE 
		TRT_Client.ClientCode IS NOT NULL
		
		
	SET @rowcount = @@ROWCOUNT
	
	-- End of SP
	EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'MCEL','TritCliPref',@row_count=@rowcount
	
END
GO
/****** Object:  StoredProcedure [dbo].[BUILD_CELERITY_ST_TRITON_EXTRAS]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[BUILD_CELERITY_ST_TRITON_EXTRAS]
AS
BEGIN
	
	DECLARE @rowcount BIGINT
	
	PRINT 'Build Celerity Triton Extra.'
	
	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'MCEL','TritExtras','Build Triton Celerity Extras.'

	INSERT INTO 
		dbo.CELERITY_ST_EXTRAS	
	SELECT 
		REPLACE(TRT_BookedExtra.Source_Key,'TRT-','TRT-'+TRT_BookedExtra.Brand) AS Source_Key,
		REPLACE(TRT_BookedExtra.BookRef,'TRT-','TRT-'+TRT_BookedExtra.Brand) AS BookRef,
		TRT_BookedExtra.ExtraName,
		TRT_BookedExtra.Supplier,
		TRT_BookedExtra.SupplierCode,
		CASE 
			WHEN TRT_BookedExtra.Date = '' THEN NULL
			ELSE CONVERT(datetime,CelerityMarine_Stage.dbo.fn_CheckDate(SUBSTRING(TRT_BookedExtra.Date,7,4) + SUBSTRING(TRT_BookedExtra.Date,4,2) + SUBSTRING(TRT_BookedExtra.Date,1,2)),103)
		END AS Date,
		CASE
			WHEN TRT_BookedExtra.Qty = '' THEN NULL
			ELSE CAST(TRT_BookedExtra.Qty AS int)
		END AS Qty,
		CASE
			WHEN TRT_BookedExtra.BaseExtraAdultPrice = '' THEN NULL
			ELSE CAST(TRT_BookedExtra.BaseExtraAdultPrice AS money)
		END AS BaseExtraAdultPrice,
		CASE
			WHEN TRT_BookedExtra.BaseExtraChildPrice = '' THEN NULL
			ELSE CAST(TRT_BookedExtra.BaseExtraChildPrice AS money)
		END AS BaseExtraChildPrice,
		CASE
			WHEN TRT_BookedExtra.ExtraAdultPrice = '' THEN NULL
			ELSE CAST(TRT_BookedExtra.ExtraAdultPrice AS money)
		END AS ExtraAdultPrice,
		CASE
			WHEN TRT_BookedExtra.ExtraChildPrice = '' THEN NULL
			ELSE CAST(TRT_BookedExtra.ExtraChildPrice AS money)
		END AS ExtraChildPrice,
		TRT_BookedExtra.CurrencyCode,
		CASE
			WHEN TRT_BookedExtra.ExchangeRate = '' THEN NULL
			ELSE CAST(TRT_BookedExtra.ExchangeRate AS decimal(18,0))
		END AS ExchangeRate,
		TRT_BookedExtra.ClientCode,
		LEFT(TRT_BookedExtra.TypeCode,20) AS TypeCode,
		TRT_BookedExtra.TypeDescription,
		LEFT(TRT_BookedExtra.SubtypeCode,20) AS SubtypeCode,
		TRT_BookedExtra.SubtypeDescription,
		TRT_BookedExtra.TourCountry,
		LEFT(TRT_BookedExtra.Duration,10)AS Duration,
		CASE 
			WHEN TRT_BookedExtra.CreateDate = '' THEN NULL
			ELSE CONVERT(datetime,CelerityMarine_Stage.dbo.fn_CheckDate(SUBSTRING(TRT_BookedExtra.CreateDate,7,4) + SUBSTRING(TRT_BookedExtra.CreateDate,4,2) + SUBSTRING(TRT_BookedExtra.CreateDate,1,2)),103)
		END AS CreateDate,
		TRT_BookedExtra.SalesCategory
	FROM
		TRT_BookedExtra
	LEFT JOIN 
		TRT_Bookings
		ON
			--REPLACE(TRT_BookedExtra.BookRef,'TRT-','TRT-'+TRT_BookedExtra.Brand) = TRT_Bookings.BookRef
			TRT_BookedExtra.BookRef = TRT_Bookings.BookRef
			AND
			TRT_BookedExtra.Brand = TRT_Bookings.Brand	
	WHERE 
		TRT_Bookings.BookRef IS NOT NULL
	
	-- End of SP
	EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'MCEL','TritExtras',@row_count=@rowcount
	
END




GO
/****** Object:  StoredProcedure [dbo].[BUILD_CELERITY_ST_TRITON_FLIGHTS]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BUILD_CELERITY_ST_TRITON_FLIGHTS]
AS
BEGIN
	
	DECLARE @rowcount BIGINT
	
	PRINT 'Build Celerity Triton Flights Table.'
	
	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'MCEL','TritFlight','Build Triton Celerity Flights Table.'

	INSERT INTO dbo.CELERITY_ST_FLIGHTS
		
	SELECT 
		REPLACE(TRT_BookedFlight.Source_Key,'TRT-','TRT-'+TRT_BookedFlight.Brand) AS Source_Key,
		REPLACE(TRT_BookedFlight.BookRef,'TRT-','TRT-'+TRT_BookedFlight.Brand) AS BookRef,
		TRT_BookedFlight.Airline,
		TRT_BookedFlight.FlightNumber,
		CASE
			WHEN TRT_BookedFlight.DepartureDate = '' THEN NULL
			ELSE CONVERT(datetime,CelerityMarine_Stage.dbo.fn_CheckDate(SUBSTRING(TRT_BookedFlight.DepartureDate,7,4) + SUBSTRING(TRT_BookedFlight.DepartureDate,4,2) + SUBSTRING(TRT_BookedFlight.DepartureDate,1,2)),103) 
		END AS DepartureDate,
		CASE
			WHEN TRT_BookedFlight.DepartureTime = '' THEN NULL
			ELSE 
				CASE
					WHEN LEN(TRT_BookedFlight.DepartureTime)= 4 THEN CONVERT(time,'0' + SUBSTRING(TRT_BookedFlight.DepartureTime,1,1) + ':'+SUBSTRING(TRT_BookedFlight.DepartureTime,4,2)+':00:000')
					ELSE CONVERT(time,SUBSTRING(TRT_BookedFlight.DepartureTime,1,2)+':'+SUBSTRING(TRT_BookedFlight.DepartureTime,4,2)+':00:000')
				END
		END AS DepartureTime,
		CASE
			WHEN TRT_BookedFlight.ArrivalDate = '' THEN NULL
			ELSE CONVERT(datetime,CelerityMarine_Stage.dbo.fn_CheckDate(SUBSTRING(TRT_BookedFlight.ArrivalDate,7,4) + SUBSTRING(TRT_BookedFlight.ArrivalDate,4,2) + SUBSTRING(TRT_BookedFlight.ArrivalDate,1,2)),103) 
		END AS ArrivalDate,
		CASE
			WHEN TRT_BookedFlight.ArrivalTime = '' THEN NULL
			ELSE 
				CASE
					WHEN LEN(TRT_BookedFlight.ArrivalTime)= 4 THEN CONVERT(time,'0' + SUBSTRING(TRT_BookedFlight.ArrivalTime,1,1) + ':'+SUBSTRING(TRT_BookedFlight.ArrivalTime,4,2)+':00:000')
					ELSE CONVERT(time,SUBSTRING(TRT_BookedFlight.ArrivalTime,1,2)+':'+SUBSTRING(TRT_BookedFlight.ArrivalTime,4,2)+':00:000')
				END
		END AS ArrivalTime,
		TRT_BookedFlight.DepartureAirportCode,
		TRT_BookedFlight.DepartureAirportName,
		TRT_BookedFlight.ArrivalAirportCode,
		TRT_BookedFlight.ArrivalAirportName,
		LEFT(TRT_BookedFlight.Type,30) AS Type
	FROM
		TRT_BookedFlight
	LEFT JOIN 
		TRT_Bookings
		ON
			TRT_BookedFlight.BookRef = TRT_Bookings.BookRef
			AND
			TRT_BookedFlight.Brand = TRT_Bookings.Brand	
	WHERE 
		TRT_Bookings.BookRef IS NOT NULL
		
		
	SET @rowcount = @@ROWCOUNT
	
	-- End of SP
	EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'MCEL','TritFlight',@row_count=@rowcount
	
END
GO
/****** Object:  StoredProcedure [dbo].[BUILD_CELERITY_ST_TRITON_MAILINGHISTORY]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BUILD_CELERITY_ST_TRITON_MAILINGHISTORY]
AS
BEGIN
	
	DECLARE @rowcount BIGINT
	
	PRINT 'Build Celerity Triton MailingHistory Table.'
	
	EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'MCEL','TritMLHist','Build Triton Celerity MailingHistory Table.'

	INSERT INTO CELERITY_ST_MAILINGHISTORY
		
	SELECT 
		REPLACE(TRT_MailingHistory.Source_Key,'TRT-','TRT-'+TRT_MailingHistory.Brand) AS Source_Key,
		REPLACE(TRT_MailingHistory.ClientRef,'TRT-','TRT-'+TRT_MailingHistory.Brand) AS ClientRef,
		LEFT(TRT_MailingHistory.OfficeLocation,20) AS OfficeLocation,
		CASE
			WHEN CreateDate = '' THEN NULL
			ELSE CONVERT(datetime,CelerityMarine_Stage.dbo.fn_CheckDate(SUBSTRING(TRT_MailingHistory.CreateDate,7,4) + SUBSTRING(TRT_MailingHistory.CreateDate,4,2) + SUBSTRING(TRT_MailingHistory.CreateDate,1,2)),103)
		END AS CreateDate,
		TRT_MailingHistory.AddedBy,
		TRT_MailingHistory.MailingName,
		LEFT(TRT_MailingHistory.MailingNameCode,20) AS MailingNameCode
	FROM
		TRT_MailingHistory
	LEFT JOIN 
		TRT_Client
		ON
			TRT_MailingHistory.ClientRef = TRT_Client.ClientCode
			AND
			TRT_MailingHistory.Brand = TRT_Client.Brand
		
	SET @rowcount = @@ROWCOUNT
	
	-- End of SP	
	EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'MCEL','TritMLHist',@row_count=@rowcount
	
END
GO
/****** Object:  StoredProcedure [dbo].[BUILD_CELERITY_TABLES]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec [dbo].[TRUNCATE_CELERITY_TABLES]

CREATE PROCEDURE [dbo].[BUILD_CELERITY_TABLES]
AS
BEGIN
	
	EXEC BUILD_CELERITY_ST_TRITON_BOOKINGS

	EXEC BUILD_CELERITY_ST_TRITON_ACCOMMODATON

	EXEC BUILD_CELERITY_ST_TRITON_EXTRAS

	EXEC BUILD_CELERITY_ST_TRITON_FLIGHTS

	EXEC BUILD_CELERITY_ST_TRITON_CLIENT

	EXEC BUILD_CELERITY_ST_TRITON_CLIENTPREFERENCE

	EXEC BUILD_CELERITY_ST_TRITON_BROCHUREREQUEST

	EXEC BUILD_CELERITY_ST_TRITON_MAILINGHISTORY

	EXEC BUILD_CELERITY_ST_TRITON_BOOKEDPAX

	--EXEC BUILD_CELERITY_ST_NEPTUNE_QUOTES
END


GO
/****** Object:  StoredProcedure [dbo].[LOG_TRITON_BOOKEDACCOM]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[LOG_TRITON_BOOKEDACCOM]
(
@MODE AS INT
)
AS
BEGIN
DECLARE @COUNT AS INT	
	
	PRINT 'Import CelerityMarineStaging: BookedAccom table.'

	IF(@MODE) = 1
		EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'CMST','TRT_BookAc','Process BookedAccom Data.'

	IF(@MODE) = 2
		SELECT @COUNT = COUNT(*) FROM [dbo].[NPT_BookedAccom]
		EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'CMST', 'TRT_BookAc',@row_count=@COUNT

END



GO
/****** Object:  StoredProcedure [dbo].[LOG_TRITON_BOOKEDEXTRA]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[LOG_TRITON_BOOKEDEXTRA]
(
@MODE AS INT
)
AS
BEGIN
DECLARE @COUNT AS INT	
	
	PRINT 'Import CelerityMarineStaging: BookedExtra table.'

	IF(@MODE) = 1
		EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'CMST','TRT_BookEx','Process BookedExtra Data.'

	IF(@MODE) = 2
		SELECT @COUNT = COUNT(*) FROM [dbo].[NPT_BookedExtra]
		EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'CMST', 'TRT_BookEx',@row_count=@COUNT

END



GO
/****** Object:  StoredProcedure [dbo].[LOG_TRITON_BOOKEDFLIGHT]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[LOG_TRITON_BOOKEDFLIGHT]
(
@MODE AS INT
)
AS
BEGIN
DECLARE @COUNT AS INT	
	
	PRINT 'Import CelerityMarineStaging: BookedFlight table.'

	IF(@MODE) = 1
		EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'CMST','TRT_BookFlt','Process BookedFlight Data.'

	IF(@MODE) = 2
		SELECT @COUNT = COUNT(*) FROM [dbo].[NPT_BookedFlight]
		EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'CMST', 'TRT_BookFlt',@row_count=@COUNT

END




GO
/****** Object:  StoredProcedure [dbo].[LOG_TRITON_BOOKINGPAX]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[LOG_TRITON_BOOKINGPAX]
(
@MODE AS INT
)
AS
BEGIN
DECLARE @COUNT AS INT	
	
	PRINT 'Import CelerityMarineStaging: BookingPax table.'

	IF(@MODE) = 1
		EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'CMST','TRT_BookPax','Process BookingPax Data.'

	IF(@MODE) = 2
		SELECT @COUNT = COUNT(*) FROM [dbo].[NPT_BookedAccom]
		EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'CMST', 'TRT_BookPax',@row_count=@COUNT

END





GO
/****** Object:  StoredProcedure [dbo].[LOG_TRITON_BOOKINGS]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[LOG_TRITON_BOOKINGS]
(
@MODE AS INT
)
AS
BEGIN
DECLARE @COUNT AS INT	
	
	PRINT 'Import CelerityMarineStaging: Bookings table.'

	IF(@MODE) = 1
		EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'CMST','TRT_Bookings','Process Bookings Data.'

	IF(@MODE) = 2
		SELECT @COUNT = COUNT(*) FROM [dbo].[NPT_Bookings]
		EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'CMST', 'TRT_Bookings',@row_count=@COUNT

END


GO
/****** Object:  StoredProcedure [dbo].[LOG_TRITON_BROCHUREREQUEST]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[LOG_TRITON_BROCHUREREQUEST]
(
@MODE AS INT
)
AS
BEGIN
DECLARE @COUNT AS INT	
	
	PRINT 'Import CelerityMarineStaging: BrochureRequest table.'

	IF(@MODE) = 1
		EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'CMST','TRT_BrocReq','Process BrochureRequest Data.'

	IF(@MODE) = 2
		SELECT @COUNT = COUNT(*) FROM [dbo].[TRT_BrochureRequest]
		EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'CMST', 'TRT_BrocReq',@row_count=@COUNT

END





GO
/****** Object:  StoredProcedure [dbo].[LOG_TRITON_CLIENT]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[LOG_TRITON_CLIENT]
(
@MODE AS INT
)
AS
BEGIN
DECLARE @COUNT AS INT	
	
	PRINT 'Import CelerityMarineStaging: Clent table.'

	IF(@MODE) = 1
		EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'CMST','TRT_Clent','Process Clent Data.'

	IF(@MODE) = 2
		SELECT @COUNT = COUNT(*) FROM [dbo].[NPT_Client]
		EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'CMST', 'TRT_Clent',@row_count=@COUNT

END


GO
/****** Object:  StoredProcedure [dbo].[LOG_TRITON_CLIENTPREFERENCE]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[LOG_TRITON_CLIENTPREFERENCE]
(
@MODE AS INT
)
AS
BEGIN
DECLARE @COUNT AS INT	
	
	PRINT 'Import CelerityMarineStaging: ClientPreference table.'

	IF(@MODE) = 1
		EXEC AMI_Galaxy.dbo.AMI_LOG_OPEN 'CMST','TRT_Cl_Pref','Process ClientPreference Data.'

	IF(@MODE) = 2
		SELECT @COUNT = COUNT(*) FROM [dbo].[TRT_ClientPreference]
		EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'CMST', 'TRT_Cl_Pref',@row_count=@COUNT

END





GO
/****** Object:  StoredProcedure [dbo].[LOG_TRITON_TABLE_ROW_COUNTS]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==============================================================
-- Author:		Murali Gongati
-- Create date: 27/09/2017
-- Description:	Procedure to log the number of records processed.
-- ==============================================================
CREATE PROCEDURE [dbo].[LOG_TRITON_TABLE_ROW_COUNTS] 
    @a_name varchar(50),
	@numberofrecords int
AS
BEGIN
	DECLARE @ITERATION INT

	SET  @ITERATION= (SELECT MAX(ITERATION) FROM [dbo].[TRT_Table_Row_Counts] with (NOLOCK) WHERE a_Name=@a_name)

	IF @ITERATION IS NULL 
		SET  @ITERATION=1
	ELSE
		SET  @ITERATION=@ITERATION+1

	INSERT INTO [dbo].[TRT_Table_Row_Counts] (a_name,iteration,loadtime,numberofrecords) VALUES(@a_name,@ITERATION,GETDATE(),@numberofrecords)
END
GO
/****** Object:  StoredProcedure [dbo].[TRITON_CELERITY_EMAIL_FORMAT]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[TRITON_CELERITY_EMAIL_FORMAT]
	@EmailBody VARCHAR (MAX) = '' OUTPUT,
	@EmailTitle VARCHAR(100) = '',
	@QueryCode VARCHAR (MAX) = '',
	@Fail VARCHAR(100) = '' 
AS
BEGIN 

IF @Fail = 'YES'
BEGIN 
SET @QueryCode = N'<style type = ''text/css''> table{border-collapse:collapse;border:1px solid #B2B2B2; margin-right:200px; width:600px; font:10pt verdana; color:#343434} table td, table th, table caption { border:1px solid #B2B2B2;} table caption{baclground-color:white} table th{background-color:#33999FF;font-weight:bold;}  </style>' + N'<table>' + N'<Caption><h3>Triton Celerity Row Counts</h3></caption>' + N'<tr><th>Database</th><th>File Name</th><th>FileRow</th><th>Database Rows</th><th>Rows Match</th></tr>' + CAST((SELECT
	td = [DataBase_Name],
	'',
	td = [FILE_NAME] , 
	'',
	td = [File_Row_Count_Adjusted],
	'',
	td = [Table_Row_Count],  
	'',
	td = CASE WHEN [File_Row_Count_Adjusted]!= [Table_Row_Count]
			THEN 'NO' 
			ELSE 'YES' 
			END, ''
FROM TRT_Merged_Row_Counts
ORDER BY 
		CASE WHEN 
			[File_Row_Count_Adjusted] != [Table_Row_Count]
			THEN 'NO' 
			ELSE 'YES'
		END
		
	FOR XML PATH ('tr'), TYPE)
	AS NVARCHAR(MAX)) + N'</table>'

	SET @EmailBody = @QueryCode
END

ELSE
BEGIN
set @QueryCode =  N'<style type = ''text/css''> table{border-collapse:collapse;border:1px solid #B2B2B2; margin-right:200px; width:600px; font:10pt verdana; color:#343434} table td, table th, table caption { border:1px solid #B2B2B2;} table caption{baclground-color:white} table th{background-color:#33999FF;font-weight:bold;}  </style>'+N'<table>' + N'<Caption><h3>Triton Celerity Row Counts</h3></caption>' + N'<tr><th>Database</th><th>File Name</th><th>FileRow</th><th>Database Rows</th></tr>' + CAST((
SELECT
	td = DataBase_Name, 
	'',
	td = [FILE_NAME], 
	'',
	td = File_Row_Count_Adjusted, 
	'',
	td = Table_Row_Count, 
	''
 
FROM TRT_Merged_Row_Counts
FOR XML PATH ('tr'), TYPE)
AS NVARCHAR(MAX)) + N'</table>'

SET @EmailBody=@QueryCode
END	
END



--File_Row_Count_Adjusted
--File_Row_Count_Adjusted
GO
/****** Object:  StoredProcedure [dbo].[TRITON_CELERITY_IMPORT_ROW_COUNT]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TRITON_CELERITY_IMPORT_ROW_COUNT]
@i_Flat_File_Row VARCHAR (500)=0,
@i_Database_Row VARCHAR(500) = 0,
@FullEmail VARCHAR (MAX) = '',
@EmailTitle VARCHAR(100) = '',
@QueryCode VARCHAR (MAX) = '',
@EmailBody VARCHAR (MAX) = ''

AS

set @i_Flat_File_Row = (
  SELECT SUM(a_row_count)-45   -- 45 files processed each with 1 header row
						FROM 
							TRT_File_row_Counts
						WHERE a_Name NOT LIKE '%_Priorities.csv%'   -- MAR_TRT_datestamp_Priorities.csv file is not processed
						)


SET @i_Database_Row = (
						SELECT SUM(NumberofRecords)
							FROM 
							TRT_Table_row_Counts
						)

				IF @i_Database_Row = @i_Flat_File_Row 
					BEGIN
					
						SET @EmailTitle = 'TRITON Celerity Data Warehouse load ' + CAST(CAST(GETDATE() AS DATE) AS VARCHAR) + ' SUCCESS'

						EXEC CelerityMarine_Stage.dbo.TRITON_CELERITY_EMAIL_FORMAT  @EmailBody = @EmailBody OUTPUT
						set @FullEmail = '<br /> File Rows: '+ @i_Flat_File_Row + '<br /> Database Rows: '+@i_Database_Row + @EmailBody

						EXEC msdb.dbo.sp_send_dbmail	@profile_name = SHG,
														@recipients = 'SHGDLMIDevelopmentTeam@specialistholidays.com', --'david.holmes@specialistholidays.com',--; adrian.sprake@specialistholidays.com;Jennifer.keller@tuimarine.com;Sil.delos-santos@tuimarine.com',
														@subject = @EmailTitle,
														@body = @FullEmail,
														@body_format = 'html'
					END
					
				ELSE
					BEGIN		

						SET @EmailTitle = 'TRITON Celerity Data Warehouse load '+ cast(cast(getdate() as date) as VARCHAR) + ' FAIL'

						EXEC CelerityMarine_Stage.dbo.TRITON_CELERITY_EMAIL_FORMAT @Fail='YES', @EmailBody = @EmailBody OUTPUT
						SET @FullEmail = '<br /> File Rows: ' + @i_Flat_File_Row + '<br /> Database Rows: ' + @i_Database_Row + @EmailBody
	
						EXEC msdb.dbo.sp_send_dbmail	@profile_name = SHG,
														@recipients = 'SHGDLMIDevelopmentTeam@specialistholidays.com', --'david.holmes@specialistholidays.com',--; adrian.sprake@specialistholidays.com;Jennifer.keller@tuimarine.com;Sil.delos-santos@tuimarine.com',
														@subject = @EmailTitle,
														@body = @FullEmail,
														@body_format = 'html'
				END

GO
/****** Object:  StoredProcedure [dbo].[TRUNCATE_CELERITY_TABLES]    Script Date: 24/08/2018 12:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TRUNCATE_CELERITY_TABLES]
AS
BEGIN
	
	PRINT 'Truncate Celerity Tables.'
	
	TRUNCATE TABLE CELERITY_ST_BOOKINGS
	TRUNCATE TABLE CELERITY_ST_ACCOMMODATION
	TRUNCATE TABLE CELERITY_ST_EXTRAS
	TRUNCATE TABLE CELERITY_ST_FLIGHTS
	TRUNCATE TABLE CELERITY_ST_BOOKEDPASSENGERS
	TRUNCATE TABLE CELERITY_ST_CLIENT
	TRUNCATE TABLE CELERITY_ST_CLIENTPREFERENCES
	TRUNCATE TABLE CELERITY_ST_BROCHUREREQUEST
	TRUNCATE TABLE CELERITY_ST_MAILINGHISTORY
END
GO
EXEC [CelerityMarine_Stage].sys.sp_addextendedproperty @name=N'SQLSourceControl Scripts Location', @value=N'<?xml version="1.0" encoding="utf-16" standalone="yes"?>
<ISOCCompareLocation version="1" type="TfsLocation">
  <ServerUrl>http://v-jsh-tfs-01:8080/tfs/ami</ServerUrl>
  <SourceControlFolder>$/AMI/UAT_Dublin/CelerityMarine_Stage</SourceControlFolder>
</ISOCCompareLocation>' 
GO
EXEC [CelerityMarine_Stage].sys.sp_addextendedproperty @name=N'SQLSourceControl Database Revision', @value=52 
GO
USE [master]
GO
ALTER DATABASE [CelerityMarine_Stage] SET  READ_WRITE 
GO
