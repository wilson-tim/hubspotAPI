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
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_TRITON_TM_QUOTES_8YR]    Script Date: 09/08/2018 08:16:37 ******/
DROP PROCEDURE [dbo].[BUILD_HUBSPOT_TRITON_TM_QUOTES_8YR]
GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_TRITON_TM_QUOTES]    Script Date: 09/08/2018 08:16:37 ******/
DROP PROCEDURE [dbo].[BUILD_HUBSPOT_TRITON_TM_QUOTES]
GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_TRITON_TM_ENEWS_8YR]    Script Date: 09/08/2018 08:16:37 ******/
DROP PROCEDURE [dbo].[BUILD_HUBSPOT_TRITON_TM_ENEWS_8YR]
GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_TRITON_TM_ENEWS]    Script Date: 09/08/2018 08:16:37 ******/
DROP PROCEDURE [dbo].[BUILD_HUBSPOT_TRITON_TM_ENEWS]
GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_TRITON_TM_BROCHURE_REQUESTS_8YR]    Script Date: 09/08/2018 08:16:37 ******/
DROP PROCEDURE [dbo].[BUILD_HUBSPOT_TRITON_TM_BROCHURE_REQUESTS_8YR]
GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_TRITON_TM_BROCHURE_REQUESTS]    Script Date: 09/08/2018 08:16:37 ******/
DROP PROCEDURE [dbo].[BUILD_HUBSPOT_TRITON_TM_BROCHURE_REQUESTS]
GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_TRITON_TM_BOOKINGS_8YR]    Script Date: 09/08/2018 08:16:37 ******/
DROP PROCEDURE [dbo].[BUILD_HUBSPOT_TRITON_TM_BOOKINGS_8YR]
GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_TRITON_TM_BOOKINGS]    Script Date: 09/08/2018 08:16:37 ******/
DROP PROCEDURE [dbo].[BUILD_HUBSPOT_TRITON_TM_BOOKINGS]
GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_TRITON_SS_QUOTES_8YR]    Script Date: 09/08/2018 08:16:37 ******/
DROP PROCEDURE [dbo].[BUILD_HUBSPOT_TRITON_SS_QUOTES_8YR]
GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_TRITON_SS_QUOTES]    Script Date: 09/08/2018 08:16:37 ******/
DROP PROCEDURE [dbo].[BUILD_HUBSPOT_TRITON_SS_QUOTES]
GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_TRITON_SS_ENEWS_8YR]    Script Date: 09/08/2018 08:16:37 ******/
DROP PROCEDURE [dbo].[BUILD_HUBSPOT_TRITON_SS_ENEWS_8YR]
GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_TRITON_SS_ENEWS]    Script Date: 09/08/2018 08:16:37 ******/
DROP PROCEDURE [dbo].[BUILD_HUBSPOT_TRITON_SS_ENEWS]
GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_TRITON_SS_BROCHURE_REQUESTS_8YR]    Script Date: 09/08/2018 08:16:37 ******/
DROP PROCEDURE [dbo].[BUILD_HUBSPOT_TRITON_SS_BROCHURE_REQUESTS_8YR]
GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_TRITON_SS_BROCHURE_REQUESTS]    Script Date: 09/08/2018 08:16:37 ******/
DROP PROCEDURE [dbo].[BUILD_HUBSPOT_TRITON_SS_BROCHURE_REQUESTS]
GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_TRITON_SS_BOOKINGS_8YR]    Script Date: 09/08/2018 08:16:37 ******/
DROP PROCEDURE [dbo].[BUILD_HUBSPOT_TRITON_SS_BOOKINGS_8YR]
GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_TRITON_SS_BOOKINGS]    Script Date: 09/08/2018 08:16:37 ******/
DROP PROCEDURE [dbo].[BUILD_HUBSPOT_TRITON_SS_BOOKINGS]
GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_TRITON_FL_QUOTES_8YR]    Script Date: 09/08/2018 08:16:37 ******/
DROP PROCEDURE [dbo].[BUILD_HUBSPOT_TRITON_FL_QUOTES_8YR]
GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_TRITON_FL_QUOTES]    Script Date: 09/08/2018 08:16:37 ******/
DROP PROCEDURE [dbo].[BUILD_HUBSPOT_TRITON_FL_QUOTES]
GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_TRITON_FL_BOOKINGS_8YR]    Script Date: 09/08/2018 08:16:37 ******/
DROP PROCEDURE [dbo].[BUILD_HUBSPOT_TRITON_FL_BOOKINGS_8YR]
GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_TRITON_FL_BOOKINGS]    Script Date: 09/08/2018 08:16:37 ******/
DROP PROCEDURE [dbo].[BUILD_HUBSPOT_TRITON_FL_BOOKINGS]
GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_NEPTUNE_QUOTES_8YR]    Script Date: 09/08/2018 08:16:37 ******/
DROP PROCEDURE [dbo].[BUILD_HUBSPOT_NEPTUNE_QUOTES_8YR]
GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_NEPTUNE_QUOTES]    Script Date: 09/08/2018 08:16:37 ******/
DROP PROCEDURE [dbo].[BUILD_HUBSPOT_NEPTUNE_QUOTES]
GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_NEPTUNE_ENEWS_8YR]    Script Date: 09/08/2018 08:16:37 ******/
DROP PROCEDURE [dbo].[BUILD_HUBSPOT_NEPTUNE_ENEWS_8YR]
GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_NEPTUNE_ENEWS]    Script Date: 09/08/2018 08:16:37 ******/
DROP PROCEDURE [dbo].[BUILD_HUBSPOT_NEPTUNE_ENEWS]
GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_NEPTUNE_BROCHURE_REQUESTS_8YR]    Script Date: 09/08/2018 08:16:37 ******/
DROP PROCEDURE [dbo].[BUILD_HUBSPOT_NEPTUNE_BROCHURE_REQUESTS_8YR]
GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_NEPTUNE_BROCHURE_REQUESTS]    Script Date: 09/08/2018 08:16:37 ******/
DROP PROCEDURE [dbo].[BUILD_HUBSPOT_NEPTUNE_BROCHURE_REQUESTS]
GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_NEPTUNE_BOOKINGS_8YR]    Script Date: 09/08/2018 08:16:37 ******/
DROP PROCEDURE [dbo].[BUILD_HUBSPOT_NEPTUNE_BOOKINGS_8YR]
GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_NEPTUNE_BOOKINGS]    Script Date: 09/08/2018 08:16:37 ******/
DROP PROCEDURE [dbo].[BUILD_HUBSPOT_NEPTUNE_BOOKINGS]
GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_NEPTUNE_BOOKINGS]    Script Date: 09/08/2018 08:16:37 ******/
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
-- 21-May-2018      1.4         Tim Wilson         Corrections for dedup logic
--========================================================================================================================

CREATE PROC [dbo].[BUILD_HUBSPOT_NEPTUNE_BOOKINGS]
AS
BEGIN
    SELECT DISTINCT
         LifecycleStage
        ,BrandName
        ,Charter
        ,ConfirmDate
        ,BookingSourcePrimary
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
--        ,ProductName
        ,BookingDateBooked
        ,BookingDepartureDate
        ,BookingDestination
        ,Address1
        ,Address2
        ,Address3
        ,Phone1
        ,Phone2
        ,BusinessPhone
        ,DateOfBirth
        ,Duration
        ,BookingBookRef
        ,[Status]
        ,CancelFromTelephone
--        ,Notes
        ,LastContactDate
        ,BookingCancellationDate
        ,CancellationBookRef
        ,CancellationCancellationDate
        ,FirstCharterBookRef
        ,FirstCharterDepartureDate
        ,FirstCharterDestination
        ,FirstCharterDateBooked
        ,FirstCharterProduct
        ,FirstCharterHullType
        ,FirstCharterBoat
        ,NumberOfBookings
        ,NeptuneCreateDate
        ,BookingSourceSecondary
        ,BookingSourceTertiary
        ,BookingSalesAgent
        ,CleanClientID
        ,BookingCleanBookRef
        ,BookingTotalPax
        ,BookingStatus
    FROM 
    (
        SELECT
            'customer' as LifecycleStage,
            'Le Boat Charter' AS BrandName,
            'Le Boat Charter' AS Charter,
            CASE WHEN [ST_MARINE_BOOKINGS].ConfirmDate IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', [ST_MARINE_BOOKINGS].ConfirmDate))*60*60*1000) END AS ConfirmDate,
            [ST_MARINE_BOOKINGS].BookingSourcePrimary AS BookingSourcePrimary,
            COALESCE([SL_Simplified_SalesOffice].[SalesOfficeSimplified],[ST_MARINE_BOOKINGS].BookingOfficeLocation,'') AS BookingOfficeLocation, 
            [ST_MARINE_BOOKINGS].BookingLanguage,
            CLI.ClientCode,
            COALESCE([SL_Simplified_Title].[TitleSimplified],'') AS Title,
            CLI.FirstName,
            CLI.LastName,
            CLI.City,
            CLI.County,
            CLI.Postcode,
            COALESCE([SL_Simplified_Neptune_Client_Country].[CountrySimplified],CLI.Country,'') AS Country,
            REPLACE(CLI.Email1,'\@','@') AS Email,
            CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromMailing WHEN 'TRUE' THEN 'Y' ELSE 'N' END AS CancelFromMailing,
            CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromEmail WHEN 'TRUE' THEN 'Y' ELSE 'N' END AS CancelFromEmail,
            CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromBrochure WHEN 'TRUE' THEN 'Y' ELSE 'N' END AS CancelFromBrochure,
            CLI.Deceased,
            CASE CLI.Blacklisted WHEN 'Y' THEN 'Y' ELSE 'N' END AS Blacklisted,
            --[ST_MARINE_BOOKINGS].ProductName,For now its not required
            CASE WHEN [ST_MARINE_BOOKINGS].BookingDate IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', [ST_MARINE_BOOKINGS].BookingDate))*60*60*1000) END AS BookingDateBooked,
            CASE WHEN [ST_MARINE_BOOKINGS].DepartureDate IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', [ST_MARINE_BOOKINGS].DepartureDate))*60*60*1000) END AS BookingDepartureDate,
            COALESCE([SL_BaseNameFull].[BaseName],[ST_MARINE_FBKG].BaseLocation,'') AS BookingDestination, 
            COALESCE(CLI.Add1,'') AS Address1,
            COALESCE(CLI.Add2,'') AS Address2,
            COALESCE(CLI.Add3,'') AS Address3,
            COALESCE(CLI.Phone1,'') AS Phone1,
            COALESCE(CLI.Phone2,'') AS Phone2,
            COALESCE(CLI.MobilePhone,'') AS BusinessPhone,
            CASE WHEN CLI.DateOfBirth IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', CLI.DateOfBirth))*60*60*1000) END AS DateOfBirth,
            COALESCE([ST_MARINE_BOOKINGS].[Duration],'') AS Duration,
            COALESCE([ST_MARINE_BOOKINGS].BookRef,'') AS BookingBookRef,
            'Booking' as [Status],
            DENSE_RANK() OVER(PARTITION BY CLI.Email1 
                ORDER BY 
                    [ST_MARINE_BOOKINGS].BookingDate DESC,
                    [ST_MARINE_BOOKINGS].DepartureDate DESC,
                    [ST_MARINE_BOOKINGS].BookRef DESC,
                    [ST_MARINE_BOOKINGS].ConfirmDate DESC,
                    (CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromEmail WHEN 'TRUE' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromMailing WHEN 'TRUE' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromBrochure WHEN 'TRUE' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromTelephone WHEN 'TRUE' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE CLI.Blacklisted WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    [ST_MARINE_BOOKINGS].BookingSourcePrimary,
                    COALESCE([SL_Simplified_SalesOffice].[SalesOfficeSimplified],[ST_MARINE_BOOKINGS].BookingOfficeLocation),
                    [ST_MARINE_BOOKINGS].BookingLanguage,
                    CLI.ClientCode,
                    COALESCE([SL_Simplified_Title].[TitleSimplified],''),
                    CLI.FirstName,
                    CLI.LastName,
                    CLI.City,
                    CLI.County,
                    CLI.Postcode,
                    COALESCE([SL_Simplified_Neptune_Client_Country].[CountrySimplified],CLI.Country),
                    COALESCE([SL_BaseNameFull].[BaseName],[ST_MARINE_FBKG].BaseLocation), 
                    CLI.Add1,
                    CLI.Add2,
                    CLI.Add3,
                    CLI.Phone1,
                    CLI.Phone2,
                    CLI.MobilePhone,
                    CLI.DateOfBirth,
                    [ST_MARINE_BOOKINGS].[Duration]
            ) AS RankResult,
            
            -- DWYT-16 New HubSpot API fields
            CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromTelephone WHEN 'TRUE' THEN 'Y' ELSE 'N' END AS CancelFromTelephone,
            '' AS Notes,
            '' AS LastContactDate,
            CASE WHEN [ST_MARINE_BOOKINGS].CancelledDate IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', [ST_MARINE_BOOKINGS].CancelledDate))*60*60*1000) END AS BookingCancellationDate,
            COALESCE(CancelledBookings.CancellationDate, '') AS CancellationCancellationDate,
            COALESCE(CancelledBookings.CancellationBookRef, '') AS CancellationBookRef,
            COALESCE(FirstCharter.FirstCharterBookRef, '') AS FirstCharterBookRef,
            COALESCE(FirstCharter.FirstCharterDepartureDate, '') AS FirstCharterDepartureDate,
            COALESCE(FirstCharter.FirstCharterDestination, '') AS FirstCharterDestination,
            COALESCE(FirstCharter.FirstCharterDateBooked, '') AS FirstCharterDateBooked,
            COALESCE(FirstCharter.FirstCharterProduct, '') AS FirstCharterProduct,
            COALESCE(FirstCharter.FirstCharterHullType, '') AS FirstCharterHullType,
            COALESCE(FirstCharter.FirstCharterBoat,'') AS FirstCharterBoat,
            (SELECT COUNT(*)
                FROM [NEPTUNE_Stage].[dbo].[ST_MARINE_BOOKINGS] WITH (NOLOCK)
                INNER JOIN [NEPTUNE_Stage].[dbo].[ST_MARINE_CLIENTS] WITH (NOLOCK)
                    ON [ST_MARINE_BOOKINGS].ClientCode=    [ST_MARINE_CLIENTS].ClientCode
                WHERE [ST_MARINE_CLIENTS].ClientCode = CLI.ClientCode
                    AND [ST_MARINE_BOOKINGS].BrandCode='LBT'
                    AND [ST_MARINE_BOOKINGS].[Status] IN ('Confirmed','Cancelled')
            ) AS NumberOfBookings,
            CASE WHEN (ISNULL([NEPTUNE_MAIL_CONTACT].F_added_date,'') = '' OR [NEPTUNE_MAIL_CONTACT].F_added_date NOT LIKE '__/__/____' OR [NEPTUNE_MAIL_CONTACT].F_added_date = '01/01/0000' OR [NEPTUNE_MAIL_CONTACT].F_added_date = '01/01/0001') THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', CONVERT(DATETIME, [NEPTUNE_MAIL_CONTACT].F_added_date, 103)))*60*60*1000) END AS NeptuneCreateDate,
            '' AS BookingSourceSecondary,
            '' AS BookingSourceTertiary,
            COALESCE([ST_MARINE_FBKG].AgentContact,'') AS BookingSalesAgent,
            CLI.CLientCode AS CleanClientID,
            [ST_MARINE_BOOKINGS].BookRef AS BookingCleanBookRef,
            COALESCE([ST_MARINE_FBKG].[PaxNo],0) AS BookingTotalPax,
            COALESCE(REPLACE([ST_MARINE_BOOKINGS].[Status], 'Booking', 'Confirmed'),'') AS BookingStatus

        FROM 
            [NEPTUNE_Stage].[dbo].[ST_MARINE_BOOKINGS] WITH (NOLOCK)
        INNER JOIN [NEPTUNE_Stage].[dbo].[ST_MARINE_CLIENTS] AS CLI WITH (NOLOCK)
            ON [ST_MARINE_BOOKINGS].ClientCode=CLI.ClientCode
        INNER JOIN [NEPTUNE_Stage].[dbo].[ST_MARINE_FBKG] WITH (NOLOCK)
            ON [ST_MARINE_FBKG].BkgRef=[ST_MARINE_BOOKINGS].BookRef
        INNER JOIN [NEPTUNE_Stage].[dbo].[NEPTUNE_MAIL_CONTACT] WITH (NOLOCK) 
            ON [NEPTUNE_MAIL_CONTACT].F_mail_no = CLI.MailNo
        INNER JOIN [NEPTUNE_Stage].[dbo].[NEPTUNE_FAMILY] WITH (NOLOCK)
            ON [NEPTUNE_FAMILY].F_mail_no = [NEPTUNE_MAIL_CONTACT].[F_mail_no]
            AND [NEPTUNE_FAMILY].F_leader = 'true'
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_SalesOffice] WITH (NOLOCK)
            ON [SL_Simplified_SalesOffice].[SalesOfficeFromRawData]=[ST_MARINE_BOOKINGS].BookingOfficeLocation 
        LEFT JOIN [NEPTUNE_Stage].[dbo].[ST_MARINE_CLIENT_PREFERENCE] WITH (NOLOCK)
            ON [ST_MARINE_CLIENT_PREFERENCE].ClientCode=CLI.ClientCode
        LEFT JOIN AMI_Static.dbo.SB_MARINE_BASE WITH (NOLOCK) 
            ON SB_MARINE_BASE.a_BaseCode=ST_MARINE_FBKG.BaseLocation and a_SourceSystemID = 103
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Neptune_Client_Country] WITH (NOLOCK)
            ON [SL_Simplified_Neptune_Client_Country].[CountryActual]=CLI.Country
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Title] WITH (NOLOCK)
            ON [SL_Simplified_Title].[TitleActual]=CLI.Title
        LEFT JOIN [HUBSPOT].[dbo].[SL_BaseNameFull] WITH (NOLOCK)
            ON [SL_BaseNameFull].[BaseCode]=[ST_MARINE_FBKG].BaseLocation
            AND [SL_BaseNameFull].Brand = 'LBT'
        LEFT JOIN
        -- First Charter records
        (
            SELECT DISTINCT
                BookRef AS FirstCharterBookRef,
                DepartureDate AS FirstCharterDepartureDate,
                Destination AS FirstCharterDestination,
                BookingDate AS FirstCharterDateBooked,
                ProductName AS FirstCharterProduct,
                HullType AS FirstCharterHullType,
                BoatType AS FirstCharterBoat,
                ClientCode AS FirstCharterClientCode,
                RankResultFirstCharter
            FROM
            (
                SELECT
                    COALESCE([ST_MARINE_BOOKINGS].BookRef,'') AS BookRef,
                    CASE WHEN [ST_MARINE_BOOKINGS].DepartureDate IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', [ST_MARINE_BOOKINGS].DepartureDate))*60*60*1000) END AS DepartureDate,
                    COALESCE([SL_BaseNameFull].[BaseName],[ST_MARINE_FBKG].BaseLocation,'') AS Destination,
                    CASE WHEN [ST_MARINE_BOOKINGS].BookingDate IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', [ST_MARINE_BOOKINGS].BookingDate))*60*60*1000) END AS BookingDate,
                    COALESCE([SL_Simplified_ProductName].ProductNameSimplified,[ST_MARINE_BOOKINGS].ProductCode,'') AS ProductName,
                    COALESCE([NEPTUNE_ACC_TYPE].KEEL_TYPE, '') AS HullType,
                    COALESCE([ST_MARINE_FBKG].BoatType, '') AS BoatType,
                    CLI.ClientCode,
                    DENSE_RANK() OVER(PARTITION BY CLI.ClientCode
                        ORDER BY 
                            [ST_MARINE_BOOKINGS].BookingDate ASC,
                            [ST_MARINE_BOOKINGS].DepartureDate DESC,
                            [ST_MARINE_BOOKINGS].BookRef DESC,
                            [ST_MARINE_BOOKINGS].ConfirmDate DESC,
                            (CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromEmail WHEN 'TRUE' THEN 'Y' ELSE 'N' END) DESC,
                            (CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromMailing WHEN 'TRUE' THEN 'Y' ELSE 'N' END) DESC,
                            (CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromBrochure WHEN 'TRUE' THEN 'Y' ELSE 'N' END) DESC,
                            (CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromTelephone WHEN 'TRUE' THEN 'Y' ELSE 'N' END) DESC,
                            (CASE CLI.Blacklisted WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                            [ST_MARINE_BOOKINGS].BookingSourcePrimary,
                            COALESCE([SL_Simplified_SalesOffice].[SalesOfficeSimplified],[ST_MARINE_BOOKINGS].BookingOfficeLocation),
                            [ST_MARINE_BOOKINGS].BookingLanguage,
                            CLI.ClientCode,
                            COALESCE([SL_Simplified_Title].[TitleSimplified],''),
                            CLI.FirstName,
                            CLI.LastName,
                            CLI.City,
                            CLI.County,
                            CLI.Postcode,
                            COALESCE([SL_Simplified_Neptune_Client_Country].[CountrySimplified],CLI.Country),
                            COALESCE([SL_BaseNameFull].[BaseName],[ST_MARINE_FBKG].BaseLocation), 
                            CLI.Add1,
                            CLI.Add2,
                            CLI.Add3,
                            CLI.Phone1,
                            CLI.Phone2,
                            CLI.MobilePhone,
                            CLI.DateOfBirth,
                            [ST_MARINE_BOOKINGS].[Duration]
                    ) AS RankResultFirstCharter
                FROM 
                    [NEPTUNE_Stage].[dbo].[ST_MARINE_BOOKINGS] WITH (NOLOCK)
                INNER JOIN [NEPTUNE_Stage].[dbo].[ST_MARINE_CLIENTS] AS CLI WITH (NOLOCK)
                    ON [ST_MARINE_BOOKINGS].ClientCode=CLI.ClientCode
                INNER JOIN [NEPTUNE_Stage].[dbo].[ST_MARINE_FBKG] WITH (NOLOCK)
                    ON [ST_MARINE_FBKG].BkgRef=[ST_MARINE_BOOKINGS].BookRef
                LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_SalesOffice] WITH (NOLOCK)
                    ON [SL_Simplified_SalesOffice].[SalesOfficeFromRawData]=[ST_MARINE_BOOKINGS].BookingOfficeLocation 
                LEFT JOIN [NEPTUNE_Stage].[dbo].[ST_MARINE_CLIENT_PREFERENCE] WITH (NOLOCK)
                    ON [ST_MARINE_CLIENT_PREFERENCE].ClientCode=CLI.ClientCode
                LEFT JOIN AMI_Static.dbo.SB_MARINE_BASE WITH (NOLOCK) 
                    ON SB_MARINE_BASE.a_BaseCode=ST_MARINE_FBKG.BaseLocation and a_SourceSystemID = 103
                LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Neptune_Client_Country] WITH (NOLOCK)
                    ON [SL_Simplified_Neptune_Client_Country].[CountryActual]=CLI.Country
                LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Title] WITH (NOLOCK)
                    ON [SL_Simplified_Title].[TitleActual]=CLI.Title
                LEFT JOIN [HUBSPOT].[dbo].[SL_BaseNameFull] WITH (NOLOCK)
                    ON [SL_BaseNameFull].[BaseCode]=[ST_MARINE_FBKG].BaseLocation
                    AND [SL_BaseNameFull].Brand = 'LBT'
                LEFT JOIN [NEPTUNE_Stage].[dbo].[NEPTUNE_ACC_TYPE] WITH (NOLOCK)
                    ON [NEPTUNE_ACC_TYPE].ACC_TYPE_DESC = [ST_MARINE_FBKG].BoatType
                LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_ProductName] WITH (NOLOCK)
                    ON [SL_Simplified_ProductName].[ProductNameActual]=[ST_MARINE_BOOKINGS].ProductCode
                WHERE 
                    [ST_MARINE_BOOKINGS].BrandCode='LBT'
                AND [ST_MARINE_BOOKINGS].[Status] = 'Confirmed'
                AND [ST_MARINE_BOOKINGS].BookingType='Direct'
                AND CLI.Lead='Yes'
                AND CLI.Email1 LIKE '%_@%_.__%'
                AND CLI.Email1 not like '%[[]%' AND CLI.Email1 not like '%]%' AND CLI.Email1 not like '%(%' AND CLI.Email1 not like '%)%' AND CLI.Email1 not like '%''%' AND CLI.Email1 not like '% %'
                AND [ST_MARINE_BOOKINGS].BookingDate >= CONVERT(datetime, '2010-01-01 00:00:00.000')
            ) FirstCharterInnerSelect
            WHERE RankResultFirstCharter = 1
        ) FirstCharter
        ON FirstCharter.FirstCharterClientCode = CLI.ClientCode
        LEFT JOIN
        -- Most recent cancellation records
        (
            SELECT DISTINCT
                CancellationBookRef AS CancellationBookRef,
                CancellationDate AS CancellationDate,
                ClientCode AS CancellationClientCode,
                RankResultCancellation
            FROM
            (
                SELECT
                    COALESCE([ST_MARINE_BOOKINGS].BookRef,'') AS CancellationBookRef,
                    CASE WHEN [ST_MARINE_BOOKINGS].CancelledDate IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', [ST_MARINE_BOOKINGS].CancelledDate))*60*60*1000) END AS CancellationDate,
                    CLI.ClientCode,
                    COALESCE([SL_BaseNameFull].[BaseName],[ST_MARINE_FBKG].BaseLocation,'') AS Destination,
                    DENSE_RANK() OVER(PARTITION BY CLI.ClientCode
                        ORDER BY 
                            [ST_MARINE_BOOKINGS].BookingDate DESC,
                            [ST_MARINE_BOOKINGS].DepartureDate DESC,
                            [ST_MARINE_BOOKINGS].BookRef DESC,
                            [ST_MARINE_BOOKINGS].ConfirmDate DESC,
                            (CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromEmail WHEN 'TRUE' THEN 'Y' ELSE 'N' END) DESC,
                            (CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromMailing WHEN 'TRUE' THEN 'Y' ELSE 'N' END) DESC,
                            (CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromBrochure WHEN 'TRUE' THEN 'Y' ELSE 'N' END) DESC,
                            (CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromTelephone WHEN 'TRUE' THEN 'Y' ELSE 'N' END) DESC,
                            (CASE CLI.Blacklisted WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                            [ST_MARINE_BOOKINGS].BookingSourcePrimary,
                            COALESCE([SL_Simplified_SalesOffice].[SalesOfficeSimplified],[ST_MARINE_BOOKINGS].BookingOfficeLocation),
                            [ST_MARINE_BOOKINGS].BookingLanguage,
                            CLI.ClientCode,
                            COALESCE([SL_Simplified_Title].[TitleSimplified],''),
                            CLI.FirstName,
                            CLI.LastName,
                            CLI.City,
                            CLI.County,
                            CLI.Postcode,
                            COALESCE([SL_Simplified_Neptune_Client_Country].[CountrySimplified],CLI.Country),
                            COALESCE([SL_BaseNameFull].[BaseName],[ST_MARINE_FBKG].BaseLocation), 
                            CLI.Add1,
                            CLI.Add2,
                            CLI.Add3,
                            CLI.Phone1,
                            CLI.Phone2,
                            CLI.MobilePhone,
                            CLI.DateOfBirth,
                            [ST_MARINE_BOOKINGS].[Duration]
                    ) AS RankResultCancellation
                FROM 
                    [NEPTUNE_Stage].[dbo].[ST_MARINE_BOOKINGS] WITH (NOLOCK)
                INNER JOIN [NEPTUNE_Stage].[dbo].[ST_MARINE_CLIENTS] AS CLI WITH (NOLOCK)
                    ON [ST_MARINE_BOOKINGS].ClientCode=CLI.ClientCode
                INNER JOIN [NEPTUNE_Stage].[dbo].[ST_MARINE_FBKG] WITH (NOLOCK)
                    ON [ST_MARINE_FBKG].BkgRef=[ST_MARINE_BOOKINGS].BookRef
                LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_SalesOffice] WITH (NOLOCK)
                    ON [SL_Simplified_SalesOffice].[SalesOfficeFromRawData]=[ST_MARINE_BOOKINGS].BookingOfficeLocation 
                LEFT JOIN [NEPTUNE_Stage].[dbo].[ST_MARINE_CLIENT_PREFERENCE] WITH (NOLOCK)
                    ON [ST_MARINE_CLIENT_PREFERENCE].ClientCode=CLI.ClientCode
                LEFT JOIN AMI_Static.dbo.SB_MARINE_BASE WITH (NOLOCK) 
                    ON SB_MARINE_BASE.a_BaseCode=ST_MARINE_FBKG.BaseLocation and a_SourceSystemID = 103
                LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Neptune_Client_Country] WITH (NOLOCK)
                    ON [SL_Simplified_Neptune_Client_Country].[CountryActual]=CLI.Country
                LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Title] WITH (NOLOCK)
                    ON [SL_Simplified_Title].[TitleActual]=CLI.Title
                LEFT JOIN [HUBSPOT].[dbo].[SL_BaseNameFull] WITH (NOLOCK)
                    ON [SL_BaseNameFull].[BaseCode]=[ST_MARINE_FBKG].BaseLocation
                    AND [SL_BaseNameFull].Brand = 'LBT'
                WHERE 
                    [ST_MARINE_BOOKINGS].BrandCode='LBT'
                AND [ST_MARINE_BOOKINGS].[Status] IN ('Confirmed','Cancelled')
                AND [ST_MARINE_BOOKINGS].CancelledDate IS NOT NULL
                AND [ST_MARINE_BOOKINGS].BookingType='Direct'
                AND CLI.Lead='Yes'
                AND CLI.Email1 LIKE '%_@%_.__%'
                AND CLI.Email1 not like '%[[]%' AND CLI.Email1 not like '%]%' AND CLI.Email1 not like '%(%' AND CLI.Email1 not like '%)%' AND CLI.Email1 not like '%''%' AND CLI.Email1 not like '% %'
                --Search all bookings for most recent cancellation records
                --AND [ST_MARINE_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,GETDATE()-8) AND CONVERT(DATE,GETDATE()-1)
                --AND [ST_MARINE_BOOKINGS].BookingDate BETWEEN '2017-08-03' AND '2017-09-10'
            ) CancelledBookingsInnerSelect
            WHERE RankResultCancellation = 1
        ) CancelledBookings
        ON CancelledBookings.CancellationClientCode = CLI.ClientCode
        WHERE 
            [ST_MARINE_BOOKINGS].BrandCode='LBT'
        AND [ST_MARINE_BOOKINGS].[Status] IN ('Confirmed','Cancelled')
        AND [ST_MARINE_BOOKINGS].BookingType='Direct'
        AND CLI.Lead='Yes'
        AND CLI.Email1 LIKE '%_@%_.__%'
        AND CLI.Email1 not like '%[[]%' AND CLI.Email1 not like '%]%' AND CLI.Email1 not like '%(%' AND CLI.Email1 not like '%)%' AND CLI.Email1 not like '%''%' AND CLI.Email1 not like '% %'
        AND [ST_MARINE_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,GETDATE()-10) AND CONVERT(DATE,GETDATE()-1)
--        AND [ST_MARINE_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,'2013-01-01', 120) AND CONVERT(DATE, '2013-12-31', 120)
--        AND [ST_MARINE_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,'2016-01-01', 120) AND CONVERT(DATE, '2016-12-31', 120)
        AND [ST_MARINE_BOOKINGS].BookingSourcePrimary NOT IN ('STHOL','OPS','STAFF','OWNER','OWNS')
    ) Result
    WHERE 
        RankResult=1
    ORDER BY 
        ConfirmDate 
END


GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_NEPTUNE_BOOKINGS_8YR]    Script Date: 09/08/2018 08:16:37 ******/
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
--========================================================================================================================

CREATE PROC [dbo].[BUILD_HUBSPOT_NEPTUNE_BOOKINGS_8YR]
AS
BEGIN
    SELECT DISTINCT
         LifecycleStage
        ,BrandName
        ,Charter
        ,ConfirmDate
        ,BookingSourcePrimary
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
--        ,ProductName
        ,BookingDateBooked
        ,BookingDepartureDate
        ,BookingDestination
        ,Address1
        ,Address2
        ,Address3
        ,Phone1
        ,Phone2
        ,BusinessPhone
        ,DateOfBirth
        ,Duration
        ,BookingBookRef
        ,[Status]
        ,CancelFromTelephone
--        ,Notes
        ,LastContactDate
        ,BookingCancellationDate
        ,CancellationBookRef
        ,CancellationCancellationDate
        ,FirstCharterBookRef
        ,FirstCharterDepartureDate
        ,FirstCharterDestination
        ,FirstCharterDateBooked
        ,FirstCharterProduct
        ,FirstCharterHullType
        ,FirstCharterBoat
        ,NumberOfBookings
        ,NeptuneCreateDate
        ,BookingSourceSecondary
        ,BookingSourceTertiary
        ,BookingSalesAgent
        ,CleanClientID
        ,BookingCleanBookRef
        ,BookingTotalPax
        ,BookingStatus
    FROM 
    (
        SELECT
            'customer' as LifecycleStage,
            'Le Boat Charter' AS BrandName,
            'Le Boat Charter' AS Charter,
            CASE WHEN [ST_MARINE_BOOKINGS].ConfirmDate IS NULL THEN '' ELSE CONVERT(VARCHAR(10),[ST_MARINE_BOOKINGS].ConfirmDate,120) END AS ConfirmDate,
            [ST_MARINE_BOOKINGS].BookingSourcePrimary AS BookingSourcePrimary,
            COALESCE([SL_Simplified_SalesOffice].[SalesOfficeSimplified],[ST_MARINE_BOOKINGS].BookingOfficeLocation,'') AS BookingOfficeLocation, 
            [ST_MARINE_BOOKINGS].BookingLanguage,
            CLI.ClientCode,
            COALESCE([SL_Simplified_Title].[TitleSimplified],'') AS Title,
            CLI.FirstName,
            CLI.LastName,
            CLI.City,
            CLI.County,
            CLI.Postcode,
            COALESCE([SL_Simplified_Neptune_Client_Country].[CountrySimplified],CLI.Country,'') AS Country,
            REPLACE(CLI.Email1,'\@','@') AS Email,
            CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromMailing WHEN 'TRUE' THEN 'Y' ELSE 'N' END AS CancelFromMailing,
            CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromEmail WHEN 'TRUE' THEN 'Y' ELSE 'N' END AS CancelFromEmail,
            CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromBrochure WHEN 'TRUE' THEN 'Y' ELSE 'N' END AS CancelFromBrochure,
            CLI.Deceased,
            CASE CLI.Blacklisted WHEN 'Y' THEN 'Y' ELSE 'N' END AS Blacklisted,
            --[ST_MARINE_BOOKINGS].ProductName,For now its not required
            CASE WHEN [ST_MARINE_BOOKINGS].BookingDate IS NULL THEN '' ELSE CONVERT(VARCHAR(10),[ST_MARINE_BOOKINGS].BookingDate,120) END AS BookingDateBooked,
            CASE WHEN [ST_MARINE_BOOKINGS].DepartureDate IS NULL THEN '' ELSE CONVERT(VARCHAR(10),[ST_MARINE_BOOKINGS].DepartureDate,120) END AS BookingDepartureDate,
            COALESCE([SL_BaseNameFull].[BaseName],[ST_MARINE_FBKG].BaseLocation,'') AS BookingDestination, 
            COALESCE(CLI.Add1,'') AS Address1,
            COALESCE(CLI.Add2,'') AS Address2,
            COALESCE(CLI.Add3,'') AS Address3,
            COALESCE(CLI.Phone1,'') AS Phone1,
            COALESCE(CLI.Phone2,'') AS Phone2,
            COALESCE(CLI.MobilePhone,'') AS BusinessPhone,
            CASE WHEN CLI.DateOfBirth IS NULL THEN '' ELSE CONVERT(VARCHAR(10),CLI.DateOfBirth,120) END AS DateOfBirth,
            COALESCE([ST_MARINE_BOOKINGS].[Duration],'') AS Duration,
            COALESCE([ST_MARINE_BOOKINGS].BookRef,'') AS BookingBookRef,
            'Booking' as [Status],
            DENSE_RANK() OVER(PARTITION BY CLI.Email1 
                ORDER BY 
                    [ST_MARINE_BOOKINGS].BookingDate DESC,
                    [ST_MARINE_BOOKINGS].DepartureDate DESC,
                    [ST_MARINE_BOOKINGS].BookRef DESC,
                    [ST_MARINE_BOOKINGS].ConfirmDate DESC,
                    (CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromEmail WHEN 'TRUE' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromMailing WHEN 'TRUE' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromBrochure WHEN 'TRUE' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromTelephone WHEN 'TRUE' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE CLI.Blacklisted WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    [ST_MARINE_BOOKINGS].BookingSourcePrimary,
                    COALESCE([SL_Simplified_SalesOffice].[SalesOfficeSimplified],[ST_MARINE_BOOKINGS].BookingOfficeLocation),
                    [ST_MARINE_BOOKINGS].BookingLanguage,
                    CLI.ClientCode,
                    COALESCE([SL_Simplified_Title].[TitleSimplified],''),
                    CLI.FirstName,
                    CLI.LastName,
                    CLI.City,
                    CLI.County,
                    CLI.Postcode,
                    COALESCE([SL_Simplified_Neptune_Client_Country].[CountrySimplified],CLI.Country),
                    COALESCE([SL_BaseNameFull].[BaseName],[ST_MARINE_FBKG].BaseLocation), 
                    CLI.Add1,
                    CLI.Add2,
                    CLI.Add3,
                    CLI.Phone1,
                    CLI.Phone2,
                    CLI.MobilePhone,
                    CLI.DateOfBirth,
                    [ST_MARINE_BOOKINGS].[Duration]
            ) AS RankResult,
            
            -- DWYT-16 New HubSpot API fields
            CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromTelephone WHEN 'TRUE' THEN 'Y' ELSE 'N' END AS CancelFromTelephone,
            '' AS Notes,
            '' AS LastContactDate,
            CASE WHEN [ST_MARINE_BOOKINGS].CancelledDate IS NULL THEN '' ELSE CONVERT(VARCHAR(10),[ST_MARINE_BOOKINGS].CancelledDate,120) END AS BookingCancellationDate,
            COALESCE(CancelledBookings.CancellationDate, '') AS CancellationCancellationDate,
            COALESCE(CancelledBookings.CancellationBookRef, '') AS CancellationBookRef,
            COALESCE(FirstCharter.FirstCharterBookRef, '') AS FirstCharterBookRef,
            COALESCE(FirstCharter.FirstCharterDepartureDate, '') AS FirstCharterDepartureDate,
            COALESCE(FirstCharter.FirstCharterDestination, '') AS FirstCharterDestination,
            COALESCE(FirstCharter.FirstCharterDateBooked, '') AS FirstCharterDateBooked,
            COALESCE(FirstCharter.FirstCharterProduct, '') AS FirstCharterProduct,
            COALESCE(FirstCharter.FirstCharterHullType, '') AS FirstCharterHullType,
            COALESCE(FirstCharter.FirstCharterBoat,'') AS FirstCharterBoat,
            (SELECT COUNT(*)
                FROM [NEPTUNE_Stage].[dbo].[ST_MARINE_BOOKINGS] WITH (NOLOCK)
                INNER JOIN [NEPTUNE_Stage].[dbo].[ST_MARINE_CLIENTS] WITH (NOLOCK)
                    ON [ST_MARINE_BOOKINGS].ClientCode=    [ST_MARINE_CLIENTS].ClientCode
                WHERE [ST_MARINE_CLIENTS].ClientCode = CLI.ClientCode
                    AND [ST_MARINE_BOOKINGS].BrandCode='LBT'
                    AND [ST_MARINE_BOOKINGS].[Status] IN ('Confirmed','Cancelled')
            ) AS NumberOfBookings,
            CASE WHEN (ISNULL([NEPTUNE_MAIL_CONTACT].F_added_date,'') = '' OR [NEPTUNE_MAIL_CONTACT].F_added_date NOT LIKE '__/__/____' OR [NEPTUNE_MAIL_CONTACT].F_added_date = '01/01/0000' OR [NEPTUNE_MAIL_CONTACT].F_added_date = '01/01/0001') THEN '' ELSE CONVERT(VARCHAR(10), CONVERT(DATETIME,[NEPTUNE_MAIL_CONTACT].F_added_date,103), 120) END AS NeptuneCreateDate,
            '' AS BookingSourceSecondary,
            '' AS BookingSourceTertiary,
            COALESCE([ST_MARINE_FBKG].AgentContact,'') AS BookingSalesAgent,
            CLI.CLientCode AS CleanClientID,
            [ST_MARINE_BOOKINGS].BookRef AS BookingCleanBookRef,
            COALESCE([ST_MARINE_FBKG].[PaxNo],0) AS BookingTotalPax,
            COALESCE(REPLACE([ST_MARINE_BOOKINGS].[Status], 'Booking', 'Confirmed'),'') AS BookingStatus

        FROM 
            [NEPTUNE_Stage].[dbo].[ST_MARINE_BOOKINGS] WITH (NOLOCK)
        INNER JOIN [NEPTUNE_Stage].[dbo].[ST_MARINE_CLIENTS] AS CLI WITH (NOLOCK)
            ON [ST_MARINE_BOOKINGS].ClientCode=CLI.ClientCode
        INNER JOIN [NEPTUNE_Stage].[dbo].[ST_MARINE_FBKG] WITH (NOLOCK)
            ON [ST_MARINE_FBKG].BkgRef=[ST_MARINE_BOOKINGS].BookRef
        INNER JOIN [NEPTUNE_Stage].[dbo].[NEPTUNE_MAIL_CONTACT] WITH (NOLOCK) 
            ON [NEPTUNE_MAIL_CONTACT].F_mail_no = CLI.MailNo
        INNER JOIN [NEPTUNE_Stage].[dbo].[NEPTUNE_FAMILY] WITH (NOLOCK)
            ON [NEPTUNE_FAMILY].F_mail_no = [NEPTUNE_MAIL_CONTACT].[F_mail_no]
            AND [NEPTUNE_FAMILY].F_leader = 'true'
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_SalesOffice] WITH (NOLOCK)
            ON [SL_Simplified_SalesOffice].[SalesOfficeFromRawData]=[ST_MARINE_BOOKINGS].BookingOfficeLocation 
        LEFT JOIN [NEPTUNE_Stage].[dbo].[ST_MARINE_CLIENT_PREFERENCE] WITH (NOLOCK)
            ON [ST_MARINE_CLIENT_PREFERENCE].ClientCode=CLI.ClientCode
        LEFT JOIN AMI_Static.dbo.SB_MARINE_BASE WITH (NOLOCK) 
            ON SB_MARINE_BASE.a_BaseCode=ST_MARINE_FBKG.BaseLocation and a_SourceSystemID = 103
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Neptune_Client_Country] WITH (NOLOCK)
            ON [SL_Simplified_Neptune_Client_Country].[CountryActual]=CLI.Country
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Title] WITH (NOLOCK)
            ON [SL_Simplified_Title].[TitleActual]=CLI.Title
        LEFT JOIN [HUBSPOT].[dbo].[SL_BaseNameFull] WITH (NOLOCK)
            ON [SL_BaseNameFull].[BaseCode]=[ST_MARINE_FBKG].BaseLocation
            AND [SL_BaseNameFull].Brand = 'LBT'
        LEFT JOIN
        -- First Charter records
        (
            SELECT DISTINCT
                BookRef AS FirstCharterBookRef,
                DepartureDate AS FirstCharterDepartureDate,
                Destination AS FirstCharterDestination,
                BookingDate AS FirstCharterDateBooked,
                ProductName AS FirstCharterProduct,
                HullType AS FirstCharterHullType,
                BoatType AS FirstCharterBoat,
                ClientCode AS FirstCharterClientCode,
                RankResultFirstCharter
            FROM
            (
                SELECT
                    COALESCE([ST_MARINE_BOOKINGS].BookRef,'') AS BookRef,
                    CASE WHEN [ST_MARINE_BOOKINGS].DepartureDate IS NULL THEN '' ELSE CONVERT(VARCHAR(10),[ST_MARINE_BOOKINGS].DepartureDate,120) END AS DepartureDate,
                    COALESCE([SL_BaseNameFull].[BaseName],[ST_MARINE_FBKG].BaseLocation,'') AS Destination,
                    CASE WHEN [ST_MARINE_BOOKINGS].BookingDate IS NULL THEN '' ELSE CONVERT(VARCHAR(10),[ST_MARINE_BOOKINGS].BookingDate,120) END AS BookingDate,
                    COALESCE([SL_Simplified_ProductName].ProductNameSimplified,[ST_MARINE_BOOKINGS].ProductCode,'') AS ProductName,
                    COALESCE([NEPTUNE_ACC_TYPE].KEEL_TYPE, '') AS HullType,
                    COALESCE([ST_MARINE_FBKG].BoatType, '') AS BoatType,
                    CLI.ClientCode,
                    DENSE_RANK() OVER(PARTITION BY CLI.ClientCode
                        ORDER BY 
                            [ST_MARINE_BOOKINGS].BookingDate ASC,
                            [ST_MARINE_BOOKINGS].DepartureDate DESC,
                            [ST_MARINE_BOOKINGS].BookRef DESC,
                            [ST_MARINE_BOOKINGS].ConfirmDate DESC,
                            (CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromEmail WHEN 'TRUE' THEN 'Y' ELSE 'N' END) DESC,
                            (CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromMailing WHEN 'TRUE' THEN 'Y' ELSE 'N' END) DESC,
                            (CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromBrochure WHEN 'TRUE' THEN 'Y' ELSE 'N' END) DESC,
                            (CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromTelephone WHEN 'TRUE' THEN 'Y' ELSE 'N' END) DESC,
                            (CASE CLI.Blacklisted WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                            [ST_MARINE_BOOKINGS].BookingSourcePrimary,
                            COALESCE([SL_Simplified_SalesOffice].[SalesOfficeSimplified],[ST_MARINE_BOOKINGS].BookingOfficeLocation),
                            [ST_MARINE_BOOKINGS].BookingLanguage,
                            CLI.ClientCode,
                            COALESCE([SL_Simplified_Title].[TitleSimplified],''),
                            CLI.FirstName,
                            CLI.LastName,
                            CLI.City,
                            CLI.County,
                            CLI.Postcode,
                            COALESCE([SL_Simplified_Neptune_Client_Country].[CountrySimplified],CLI.Country),
                            COALESCE([SL_BaseNameFull].[BaseName],[ST_MARINE_FBKG].BaseLocation), 
                            CLI.Add1,
                            CLI.Add2,
                            CLI.Add3,
                            CLI.Phone1,
                            CLI.Phone2,
                            CLI.MobilePhone,
                            CLI.DateOfBirth,
                            [ST_MARINE_BOOKINGS].[Duration]
                    ) AS RankResultFirstCharter
                FROM 
                    [NEPTUNE_Stage].[dbo].[ST_MARINE_BOOKINGS] WITH (NOLOCK)
                INNER JOIN [NEPTUNE_Stage].[dbo].[ST_MARINE_CLIENTS] AS CLI WITH (NOLOCK)
                    ON [ST_MARINE_BOOKINGS].ClientCode=CLI.ClientCode
                INNER JOIN [NEPTUNE_Stage].[dbo].[ST_MARINE_FBKG] WITH (NOLOCK)
                    ON [ST_MARINE_FBKG].BkgRef=[ST_MARINE_BOOKINGS].BookRef
                LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_SalesOffice] WITH (NOLOCK)
                    ON [SL_Simplified_SalesOffice].[SalesOfficeFromRawData]=[ST_MARINE_BOOKINGS].BookingOfficeLocation 
                LEFT JOIN [NEPTUNE_Stage].[dbo].[ST_MARINE_CLIENT_PREFERENCE] WITH (NOLOCK)
                    ON [ST_MARINE_CLIENT_PREFERENCE].ClientCode=CLI.ClientCode
                LEFT JOIN AMI_Static.dbo.SB_MARINE_BASE WITH (NOLOCK) 
                    ON SB_MARINE_BASE.a_BaseCode=ST_MARINE_FBKG.BaseLocation and a_SourceSystemID = 103
                LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Neptune_Client_Country] WITH (NOLOCK)
                    ON [SL_Simplified_Neptune_Client_Country].[CountryActual]=CLI.Country
                LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Title] WITH (NOLOCK)
                    ON [SL_Simplified_Title].[TitleActual]=CLI.Title
                LEFT JOIN [HUBSPOT].[dbo].[SL_BaseNameFull] WITH (NOLOCK)
                    ON [SL_BaseNameFull].[BaseCode]=[ST_MARINE_FBKG].BaseLocation
                    AND [SL_BaseNameFull].Brand = 'LBT'
                LEFT JOIN [NEPTUNE_Stage].[dbo].[NEPTUNE_ACC_TYPE] WITH (NOLOCK)
                    ON [NEPTUNE_ACC_TYPE].ACC_TYPE_DESC = [ST_MARINE_FBKG].BoatType
                LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_ProductName] WITH (NOLOCK)
                    ON [SL_Simplified_ProductName].[ProductNameActual]=[ST_MARINE_BOOKINGS].ProductCode
                WHERE 
                    [ST_MARINE_BOOKINGS].BrandCode='LBT'
                AND [ST_MARINE_BOOKINGS].[Status] = 'Confirmed'
                AND [ST_MARINE_BOOKINGS].BookingType='Direct'
                AND CLI.Lead='Yes'
                AND CLI.Email1 LIKE '%_@%_.__%'
                AND CLI.Email1 not like '%[[]%' AND CLI.Email1 not like '%]%' AND CLI.Email1 not like '%(%' AND CLI.Email1 not like '%)%' AND CLI.Email1 not like '%''%' AND CLI.Email1 not like '% %'
                AND [ST_MARINE_BOOKINGS].BookingDate >= CONVERT(datetime, '2010-01-01 00:00:00.000')
            ) FirstCharterInnerSelect
            WHERE RankResultFirstCharter = 1
        ) FirstCharter
        ON FirstCharter.FirstCharterClientCode = CLI.ClientCode
        LEFT JOIN
        -- Most recent cancellation records
        (
            SELECT DISTINCT
                CancellationBookRef AS CancellationBookRef,
                CancellationDate AS CancellationDate,
                ClientCode AS CancellationClientCode,
                RankResultCancellation
            FROM
            (
                SELECT
                    COALESCE([ST_MARINE_BOOKINGS].BookRef,'') AS CancellationBookRef,
                    CASE WHEN [ST_MARINE_BOOKINGS].CancelledDate IS NULL THEN '' ELSE CONVERT(VARCHAR(10),[ST_MARINE_BOOKINGS].CancelledDate,120) END AS CancellationDate,
                    CLI.ClientCode,
                    COALESCE([SL_BaseNameFull].[BaseName],[ST_MARINE_FBKG].BaseLocation,'') AS Destination,
                    DENSE_RANK() OVER(PARTITION BY CLI.ClientCode
                        ORDER BY 
                            [ST_MARINE_BOOKINGS].BookingDate DESC,
                            [ST_MARINE_BOOKINGS].DepartureDate DESC,
                            [ST_MARINE_BOOKINGS].BookRef DESC,
                            [ST_MARINE_BOOKINGS].ConfirmDate DESC,
                            (CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromEmail WHEN 'TRUE' THEN 'Y' ELSE 'N' END) DESC,
                            (CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromMailing WHEN 'TRUE' THEN 'Y' ELSE 'N' END) DESC,
                            (CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromBrochure WHEN 'TRUE' THEN 'Y' ELSE 'N' END) DESC,
                            (CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromTelephone WHEN 'TRUE' THEN 'Y' ELSE 'N' END) DESC,
                            (CASE CLI.Blacklisted WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                            [ST_MARINE_BOOKINGS].BookingSourcePrimary,
                            COALESCE([SL_Simplified_SalesOffice].[SalesOfficeSimplified],[ST_MARINE_BOOKINGS].BookingOfficeLocation),
                            [ST_MARINE_BOOKINGS].BookingLanguage,
                            CLI.ClientCode,
                            COALESCE([SL_Simplified_Title].[TitleSimplified],''),
                            CLI.FirstName,
                            CLI.LastName,
                            CLI.City,
                            CLI.County,
                            CLI.Postcode,
                            COALESCE([SL_Simplified_Neptune_Client_Country].[CountrySimplified],CLI.Country),
                            COALESCE([SL_BaseNameFull].[BaseName],[ST_MARINE_FBKG].BaseLocation), 
                            CLI.Add1,
                            CLI.Add2,
                            CLI.Add3,
                            CLI.Phone1,
                            CLI.Phone2,
                            CLI.MobilePhone,
                            CLI.DateOfBirth,
                            [ST_MARINE_BOOKINGS].[Duration]
                    ) AS RankResultCancellation
                FROM 
                    [NEPTUNE_Stage].[dbo].[ST_MARINE_BOOKINGS] WITH (NOLOCK)
                INNER JOIN [NEPTUNE_Stage].[dbo].[ST_MARINE_CLIENTS] AS CLI WITH (NOLOCK)
                    ON [ST_MARINE_BOOKINGS].ClientCode=CLI.ClientCode
                INNER JOIN [NEPTUNE_Stage].[dbo].[ST_MARINE_FBKG] WITH (NOLOCK)
                    ON [ST_MARINE_FBKG].BkgRef=[ST_MARINE_BOOKINGS].BookRef
                LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_SalesOffice] WITH (NOLOCK)
                    ON [SL_Simplified_SalesOffice].[SalesOfficeFromRawData]=[ST_MARINE_BOOKINGS].BookingOfficeLocation 
                LEFT JOIN [NEPTUNE_Stage].[dbo].[ST_MARINE_CLIENT_PREFERENCE] WITH (NOLOCK)
                    ON [ST_MARINE_CLIENT_PREFERENCE].ClientCode=CLI.ClientCode
                LEFT JOIN AMI_Static.dbo.SB_MARINE_BASE WITH (NOLOCK) 
                    ON SB_MARINE_BASE.a_BaseCode=ST_MARINE_FBKG.BaseLocation and a_SourceSystemID = 103
                LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Neptune_Client_Country] WITH (NOLOCK)
                    ON [SL_Simplified_Neptune_Client_Country].[CountryActual]=CLI.Country
                LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Title] WITH (NOLOCK)
                    ON [SL_Simplified_Title].[TitleActual]=CLI.Title
                LEFT JOIN [HUBSPOT].[dbo].[SL_BaseNameFull] WITH (NOLOCK)
                    ON [SL_BaseNameFull].[BaseCode]=[ST_MARINE_FBKG].BaseLocation
                    AND [SL_BaseNameFull].Brand = 'LBT'
                WHERE 
                    [ST_MARINE_BOOKINGS].BrandCode='LBT'
                AND [ST_MARINE_BOOKINGS].[Status] IN ('Confirmed','Cancelled')
                AND [ST_MARINE_BOOKINGS].CancelledDate IS NOT NULL
                AND [ST_MARINE_BOOKINGS].BookingType='Direct'
                AND CLI.Lead='Yes'
                AND CLI.Email1 LIKE '%_@%_.__%'
                AND CLI.Email1 not like '%[[]%' AND CLI.Email1 not like '%]%' AND CLI.Email1 not like '%(%' AND CLI.Email1 not like '%)%' AND CLI.Email1 not like '%''%' AND CLI.Email1 not like '% %'
                --Search all bookings for most recent cancellation records
                --AND [ST_MARINE_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,GETDATE()-8) AND CONVERT(DATE,GETDATE()-1)
                --AND [ST_MARINE_BOOKINGS].BookingDate BETWEEN '2017-08-03' AND '2017-09-10'
            ) CancelledBookingsInnerSelect
            WHERE RankResultCancellation = 1
        ) CancelledBookings
        ON CancelledBookings.CancellationClientCode = CLI.ClientCode
        WHERE 
            [ST_MARINE_BOOKINGS].BrandCode='LBT'
        AND [ST_MARINE_BOOKINGS].[Status] IN ('Confirmed','Cancelled')
        AND [ST_MARINE_BOOKINGS].BookingType='Direct'
        AND CLI.Lead='Yes'
        AND CLI.Email1 LIKE '%_@%_.__%'
        AND CLI.Email1 not like '%[[]%' AND CLI.Email1 not like '%]%' AND CLI.Email1 not like '%(%' AND CLI.Email1 not like '%)%' AND CLI.Email1 not like '%''%' AND CLI.Email1 not like '% %'
        AND [ST_MARINE_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,'2010-01-01', 120) AND CONVERT(DATE,GETDATE()-1)
--        AND [ST_MARINE_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,GETDATE()-10) AND CONVERT(DATE,GETDATE()-1)
--        AND [ST_MARINE_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,'2013-01-01', 120) AND CONVERT(DATE, '2013-12-31', 120)
--        AND [ST_MARINE_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,'2016-01-01', 120) AND CONVERT(DATE, '2016-12-31', 120)
        AND [ST_MARINE_BOOKINGS].BookingSourcePrimary NOT IN ('STHOL','OPS','STAFF','OWNER','OWNS')
    ) Result
    WHERE 
        RankResult=1
    ORDER BY 
        ConfirmDate 
END
GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_NEPTUNE_BROCHURE_REQUESTS]    Script Date: 09/08/2018 08:16:37 ******/
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
-- 21-May-2018      1.6         Tim Wilson         Corrections for dedupe logic
--========================================================================================================================

CREATE PROC [dbo].[BUILD_HUBSPOT_NEPTUNE_BROCHURE_REQUESTS]
AS
BEGIN
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
            [ST_MARINE_CLIENTS].FirstName,
            [ST_MARINE_CLIENTS].LastName,
            [ST_MARINE_CLIENTS].City,
            [ST_MARINE_CLIENTS].County,
            [ST_MARINE_CLIENTS].Postcode,
            COALESCE([SL_Simplified_Neptune_Client_Country].[CountrySimplified],[ST_MARINE_CLIENTS].Country,'') AS Country,
            REPLACE([ST_MARINE_CLIENTS].Email1,'\@','@') AS Email,
            [ST_MARINE_CLIENTS].Deceased,
            CASE [ST_MARINE_CLIENTS].Blacklisted WHEN 'Y' THEN 'Y' ELSE 'N' END AS Blacklisted,
            CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromMailing WHEN 'TRUE' THEN 'Y' ELSE 'N' END AS CancelFromMailing,
            CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromEmail WHEN 'TRUE' THEN 'Y' ELSE 'N' END AS CancelFromEmail,
            CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromBrochure WHEN 'TRUE' THEN 'Y' ELSE 'N' END AS CancelFromBrochure,
            COALESCE([SL_Simplified_BrochureName].[BrochureNameSimplified],[ST_MARINE_BROCHURE_REQUEST].BrochureName) AS BrochureProductRequested,
            CASE WHEN [ST_MARINE_BROCHURE_REQUEST].DateRequested IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', [ST_MARINE_BROCHURE_REQUEST].DateRequested))*60*60*1000) END AS BrochureDateRequested,
            COALESCE([ST_MARINE_CLIENTS].Add1,'') AS Address1,
            COALESCE([ST_MARINE_CLIENTS].Add2,'') AS Address2,
            COALESCE([ST_MARINE_CLIENTS].Add3,'') AS Address3,
            COALESCE([ST_MARINE_CLIENTS].Phone1,'') AS Phone1,
            COALESCE([ST_MARINE_CLIENTS].Phone2,'') AS Phone2,
            COALESCE([ST_MARINE_CLIENTS].MobilePhone,'') AS BusinessPhone,
            CASE WHEN [ST_MARINE_CLIENTS].DateOfBirth IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', [ST_MARINE_CLIENTS].DateOfBirth))*60*60*1000) END AS DateOfBirth,
            'Brochure' as Status,
            DENSE_RANK() OVER(PARTITION BY [ST_MARINE_CLIENTS].Email1 
                ORDER BY 
                    [ST_MARINE_BROCHURE_REQUEST].DateRequested DESC, 
                    (CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromEmail WHEN 'TRUE' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromMailing WHEN 'TRUE' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromBrochure WHEN 'TRUE' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromTelephone WHEN 'TRUE' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE [ST_MARINE_CLIENTS].Blacklisted WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    [ST_MARINE_BROCHURE_REQUEST].Language,
                    [ST_MARINE_BROCHURE_REQUEST].ClientCode,
                    COALESCE([SL_Simplified_BrochureName].[BrochureNameSimplified],[ST_MARINE_BROCHURE_REQUEST].BrochureName),
                    COALESCE([SL_Simplified_Title].[TitleSimplified],''),
                    [ST_MARINE_CLIENTS].FirstName,
                    [ST_MARINE_CLIENTS].LastName,
                    [ST_MARINE_CLIENTS].City,
                    [ST_MARINE_CLIENTS].County,
                    [ST_MARINE_CLIENTS].Postcode,
                    COALESCE([SL_Simplified_Neptune_Client_Country].[CountrySimplified],[ST_MARINE_CLIENTS].Country),
                    SO.[SourceOffice],
                    [ST_MARINE_CLIENTS].Add1,
                    [ST_MARINE_CLIENTS].Add2,
                    [ST_MARINE_CLIENTS].Add3,
                    [ST_MARINE_CLIENTS].Phone1,
                    [ST_MARINE_CLIENTS].Phone2,
                    [ST_MARINE_CLIENTS].MobilePhone,
                    [ST_MARINE_CLIENTS].DateOfBirth
            ) AS RankResult,

            -- DWYT-16 New HubSpot API fields
            CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromTelephone WHEN 'TRUE' THEN 'Y' ELSE 'N' END AS CancelFromTelephone,
            '' AS LastContactDate,
            CASE WHEN (ISNULL([NEPTUNE_MAIL_CONTACT].F_added_date,'') = '' OR [NEPTUNE_MAIL_CONTACT].F_added_date NOT LIKE '__/__/____' OR [NEPTUNE_MAIL_CONTACT].F_added_date = '01/01/0000' OR [NEPTUNE_MAIL_CONTACT].F_added_date = '01/01/0001') THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', CONVERT(DATETIME, [NEPTUNE_MAIL_CONTACT].F_added_date, 103)))*60*60*1000) END AS NeptuneCreateDate,
            COALESCE(REPLACE(REPLACE(REPLACE([ST_MARINE_CLIENTS].ClientCode, 'TRT-M',''), 'TRT-S', ''), 'TRT-', ''), '') AS CleanClientID

        FROM    
            [NEPTUNE_Stage].[dbo].[ST_MARINE_BROCHURE_REQUEST] WITH (NOLOCK)
        INNER JOIN [NEPTUNE_Stage].[dbo].[ST_MARINE_CLIENTS] WITH (NOLOCK)
            ON [ST_MARINE_BROCHURE_REQUEST].ClientCode=[ST_MARINE_CLIENTS].ClientCode
            AND [ST_MARINE_BROCHURE_REQUEST].F_CONTACT_URN = [ST_MARINE_CLIENTS].F_URN
        INNER JOIN [HUBSPOT].[dbo].[SL_Simplified_BrochureName] WITH (NOLOCK)
            ON [SL_Simplified_BrochureName].[BrochureNameActual]=[ST_MARINE_BROCHURE_REQUEST].[Type] AND [SL_Simplified_BrochureName].[BrandName]='LBT'
        INNER JOIN [NEPTUNE_Stage].[dbo].[NEPTUNE_MAIL_CONTACT] WITH (NOLOCK) 
            ON [NEPTUNE_MAIL_CONTACT].F_mail_no = [ST_MARINE_CLIENTS].MailNo
        LEFT JOIN [NEPTUNE_Stage].[dbo].[ST_MARINE_CLIENT_PREFERENCE] WITH (NOLOCK)
            ON [ST_MARINE_CLIENT_PREFERENCE].ClientCode=[ST_MARINE_CLIENTS].ClientCode
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Country] WITH (NOLOCK)
            ON [SL_Simplified_Country].[CountryActual]=[ST_MARINE_CLIENTS].Country
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Country_Language_SourceOffice] SO WITH (NOLOCK) 
            ON SO.[CountrySimplified_Language]=ISNULL([SL_Simplified_Country].[CountrySimplified],'') + [ST_MARINE_BROCHURE_REQUEST].Language
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Neptune_Client_Country] WITH (NOLOCK)
            ON [SL_Simplified_Neptune_Client_Country].[CountryActual]=[ST_MARINE_CLIENTS].Country
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Title] WITH (NOLOCK)
            ON [SL_Simplified_Title].[TitleActual]=[ST_MARINE_CLIENTS].Title
        WHERE
            [ST_MARINE_CLIENTS].Email1 LIKE '%_@%_.__%'
        AND [ST_MARINE_CLIENTS].Email1 not like '%[[]%' AND [ST_MARINE_CLIENTS].Email1 not like '%]%' AND [ST_MARINE_CLIENTS].Email1 not like '%(%' AND [ST_MARINE_CLIENTS].Email1 not like '%)%' AND [ST_MARINE_CLIENTS].Email1 not like '%''%' AND [ST_MARINE_CLIENTS].Email1 not like '% %'
        AND [ST_MARINE_BROCHURE_REQUEST].DateRequested BETWEEN CONVERT(DATE,GETDATE()-10) AND CONVERT(DATE,GETDATE()-1)
--        AND [ST_MARINE_BROCHURE_REQUEST].DateRequested BETWEEN CONVERT(DATE,'2013-01-01', 120) AND CONVERT(DATE, '2013-12-31', 120)
--        AND [ST_MARINE_BROCHURE_REQUEST].DateRequested BETWEEN CONVERT(DATE,'2016-01-01', 120) AND CONVERT(DATE, '2016-12-31', 120)
    )Result
    Where RankResult=1
    ORDER BY BrochureDateRequested 
END


GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_NEPTUNE_BROCHURE_REQUESTS_8YR]    Script Date: 09/08/2018 08:16:37 ******/
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
--========================================================================================================================

CREATE PROC [dbo].[BUILD_HUBSPOT_NEPTUNE_BROCHURE_REQUESTS_8YR]
AS
BEGIN
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
            [ST_MARINE_CLIENTS].FirstName,
            [ST_MARINE_CLIENTS].LastName,
            [ST_MARINE_CLIENTS].City,
            [ST_MARINE_CLIENTS].County,
            [ST_MARINE_CLIENTS].Postcode,
            COALESCE([SL_Simplified_Neptune_Client_Country].[CountrySimplified],[ST_MARINE_CLIENTS].Country,'') AS Country,
            REPLACE([ST_MARINE_CLIENTS].Email1,'\@','@') AS Email,
            [ST_MARINE_CLIENTS].Deceased,
            CASE [ST_MARINE_CLIENTS].Blacklisted WHEN 'Y' THEN 'Y' ELSE 'N' END AS Blacklisted,
            CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromMailing WHEN 'TRUE' THEN 'Y' ELSE 'N' END AS CancelFromMailing,
            CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromEmail WHEN 'TRUE' THEN 'Y' ELSE 'N' END AS CancelFromEmail,
            CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromBrochure WHEN 'TRUE' THEN 'Y' ELSE 'N' END AS CancelFromBrochure,
            COALESCE([SL_Simplified_BrochureName].[BrochureNameSimplified],[ST_MARINE_BROCHURE_REQUEST].BrochureName) AS BrochureProductRequested,
            CASE WHEN [ST_MARINE_BROCHURE_REQUEST].DateRequested IS NULL THEN '' ELSE CONVERT(VARCHAR(10),[ST_MARINE_BROCHURE_REQUEST].DateRequested,120) END AS BrochureDateRequested,
            COALESCE([ST_MARINE_CLIENTS].Add1,'') AS Address1,
            COALESCE([ST_MARINE_CLIENTS].Add2,'') AS Address2,
            COALESCE([ST_MARINE_CLIENTS].Add3,'') AS Address3,
            COALESCE([ST_MARINE_CLIENTS].Phone1,'') AS Phone1,
            COALESCE([ST_MARINE_CLIENTS].Phone2,'') AS Phone2,
            COALESCE([ST_MARINE_CLIENTS].MobilePhone,'') AS BusinessPhone,
            CASE WHEN [ST_MARINE_CLIENTS].DateOfBirth IS NULL THEN '' ELSE CONVERT(VARCHAR(10),[ST_MARINE_CLIENTS].DateOfBirth,120) END AS DateOfBirth,
            'Brochure' as Status,
            DENSE_RANK() OVER(PARTITION BY [ST_MARINE_CLIENTS].Email1 
                ORDER BY 
                    [ST_MARINE_BROCHURE_REQUEST].DateRequested DESC, 
                    (CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromEmail WHEN 'TRUE' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromMailing WHEN 'TRUE' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromBrochure WHEN 'TRUE' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromTelephone WHEN 'TRUE' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE [ST_MARINE_CLIENTS].Blacklisted WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    [ST_MARINE_BROCHURE_REQUEST].Language,
                    [ST_MARINE_BROCHURE_REQUEST].ClientCode,
                    COALESCE([SL_Simplified_BrochureName].[BrochureNameSimplified],[ST_MARINE_BROCHURE_REQUEST].BrochureName),
                    COALESCE([SL_Simplified_Title].[TitleSimplified],''),
                    [ST_MARINE_CLIENTS].FirstName,
                    [ST_MARINE_CLIENTS].LastName,
                    [ST_MARINE_CLIENTS].City,
                    [ST_MARINE_CLIENTS].County,
                    [ST_MARINE_CLIENTS].Postcode,
                    COALESCE([SL_Simplified_Neptune_Client_Country].[CountrySimplified],[ST_MARINE_CLIENTS].Country),
                    SO.[SourceOffice],
                    [ST_MARINE_CLIENTS].Add1,
                    [ST_MARINE_CLIENTS].Add2,
                    [ST_MARINE_CLIENTS].Add3,
                    [ST_MARINE_CLIENTS].Phone1,
                    [ST_MARINE_CLIENTS].Phone2,
                    [ST_MARINE_CLIENTS].MobilePhone,
                    [ST_MARINE_CLIENTS].DateOfBirth
            ) AS RankResult,

            -- DWYT-16 New HubSpot API fields
            CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromTelephone WHEN 'TRUE' THEN 'Y' ELSE 'N' END AS CancelFromTelephone,
            '' AS LastContactDate,
            CASE WHEN (ISNULL([NEPTUNE_MAIL_CONTACT].F_added_date,'') = '' OR [NEPTUNE_MAIL_CONTACT].F_added_date NOT LIKE '__/__/____' OR [NEPTUNE_MAIL_CONTACT].F_added_date = '01/01/0000' OR [NEPTUNE_MAIL_CONTACT].F_added_date = '01/01/0001') THEN '' ELSE CONVERT(VARCHAR(10), CONVERT(DATETIME,[NEPTUNE_MAIL_CONTACT].F_added_date,103), 120) END AS NeptuneCreateDate,
            COALESCE(REPLACE(REPLACE(REPLACE([ST_MARINE_CLIENTS].ClientCode, 'TRT-M',''), 'TRT-S', ''), 'TRT-', ''), '') AS CleanClientID

        FROM    
            [NEPTUNE_Stage].[dbo].[ST_MARINE_BROCHURE_REQUEST] WITH (NOLOCK)
        INNER JOIN [NEPTUNE_Stage].[dbo].[ST_MARINE_CLIENTS] WITH (NOLOCK)
            ON [ST_MARINE_BROCHURE_REQUEST].ClientCode=[ST_MARINE_CLIENTS].ClientCode
            AND [ST_MARINE_BROCHURE_REQUEST].F_CONTACT_URN = [ST_MARINE_CLIENTS].F_URN
        INNER JOIN [HUBSPOT].[dbo].[SL_Simplified_BrochureName] WITH (NOLOCK)
            ON [SL_Simplified_BrochureName].[BrochureNameActual]=[ST_MARINE_BROCHURE_REQUEST].[Type] AND [SL_Simplified_BrochureName].[BrandName]='LBT'
        INNER JOIN [NEPTUNE_Stage].[dbo].[NEPTUNE_MAIL_CONTACT] WITH (NOLOCK) 
            ON [NEPTUNE_MAIL_CONTACT].F_mail_no = [ST_MARINE_CLIENTS].MailNo
        LEFT JOIN [NEPTUNE_Stage].[dbo].[ST_MARINE_CLIENT_PREFERENCE] WITH (NOLOCK)
            ON [ST_MARINE_CLIENT_PREFERENCE].ClientCode=[ST_MARINE_CLIENTS].ClientCode
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Country] WITH (NOLOCK)
            ON [SL_Simplified_Country].[CountryActual]=[ST_MARINE_CLIENTS].Country
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Country_Language_SourceOffice] SO WITH (NOLOCK) 
            ON SO.[CountrySimplified_Language]=ISNULL([SL_Simplified_Country].[CountrySimplified],'') + [ST_MARINE_BROCHURE_REQUEST].Language
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Neptune_Client_Country] WITH (NOLOCK)
            ON [SL_Simplified_Neptune_Client_Country].[CountryActual]=[ST_MARINE_CLIENTS].Country
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Title] WITH (NOLOCK)
            ON [SL_Simplified_Title].[TitleActual]=[ST_MARINE_CLIENTS].Title
        WHERE
            [ST_MARINE_CLIENTS].Email1 LIKE '%_@%_.__%'
        AND [ST_MARINE_CLIENTS].Email1 not like '%[[]%' AND [ST_MARINE_CLIENTS].Email1 not like '%]%' AND [ST_MARINE_CLIENTS].Email1 not like '%(%' AND [ST_MARINE_CLIENTS].Email1 not like '%)%' AND [ST_MARINE_CLIENTS].Email1 not like '%''%' AND [ST_MARINE_CLIENTS].Email1 not like '% %'
        AND [ST_MARINE_BROCHURE_REQUEST].DateRequested BETWEEN CONVERT(DATE,'2010-01-01', 120) AND CONVERT(DATE,GETDATE()-1)
--        AND [ST_MARINE_BROCHURE_REQUEST].DateRequested BETWEEN CONVERT(DATE,GETDATE()-10) AND CONVERT(DATE,GETDATE()-1)
--        AND [ST_MARINE_BROCHURE_REQUEST].DateRequested BETWEEN CONVERT(DATE,'2013-01-01', 120) AND CONVERT(DATE, '2013-12-31', 120)
--        AND [ST_MARINE_BROCHURE_REQUEST].DateRequested BETWEEN CONVERT(DATE,'2016-01-01', 120) AND CONVERT(DATE, '2016-12-31', 120)
    )Result
    Where RankResult=1
    ORDER BY BrochureDateRequested 
END


GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_NEPTUNE_ENEWS]    Script Date: 09/08/2018 08:16:37 ******/
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
-- 21-May-2018      1.6         Tim Wilson         Corrections for dedupe logic
--========================================================================================================================

CREATE PROC [dbo].[BUILD_HUBSPOT_NEPTUNE_ENEWS]
AS
BEGIN
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
            COALESCE([ST_MARINE_BROCHURE_REQUEST].Language,'') AS BookingLanguage,
            [ST_MARINE_BROCHURE_REQUEST].ClientCode,
            COALESCE([SL_Simplified_Title].[TitleSimplified],'') AS Title,
            [ST_MARINE_CLIENTS].FirstName,
            [ST_MARINE_CLIENTS].LastName,
            [ST_MARINE_CLIENTS].City,
            [ST_MARINE_CLIENTS].County,
            [ST_MARINE_CLIENTS].Postcode,
            COALESCE([SL_Simplified_Neptune_Client_Country].[CountrySimplified],[ST_MARINE_CLIENTS].Country,'') AS Country,
            REPLACE([ST_MARINE_CLIENTS].Email1,'\@','@') AS Email,
            [ST_MARINE_CLIENTS].Deceased,
            CASE [ST_MARINE_CLIENTS].Blacklisted WHEN 'Y' THEN 'Y' ELSE 'N' END AS Blacklisted,
            CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromMailing WHEN 'TRUE' THEN 'Y' ELSE 'N' END AS CancelFromMailing,
            CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromEmail WHEN 'TRUE' THEN 'Y' ELSE 'N' END AS CancelFromEmail,
            CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromBrochure WHEN 'TRUE' THEN 'Y' ELSE 'N' END AS CancelFromBrochure,
            CASE WHEN [ST_MARINE_BROCHURE_REQUEST].DateRequested IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', [ST_MARINE_BROCHURE_REQUEST].DateRequested))*60*60*1000) END AS EnewsDateRequested,
            COALESCE([ST_MARINE_CLIENTS].Add1,'') AS Address1,
            COALESCE([ST_MARINE_CLIENTS].Add2,'') AS Address2,
            COALESCE([ST_MARINE_CLIENTS].Add3,'') AS Address3,
            COALESCE([ST_MARINE_CLIENTS].Phone1,'') AS Phone1,
            COALESCE([ST_MARINE_CLIENTS].Phone2,'') AS Phone2,
            COALESCE([ST_MARINE_CLIENTS].MobilePhone,'') AS BusinessPhone,
            CASE WHEN [ST_MARINE_CLIENTS].DateOfBirth IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', [ST_MARINE_CLIENTS].DateOfBirth))*60*60*1000) END AS DateOfBirth,
            'Enews' as Status,
            DENSE_RANK() OVER(PARTITION BY [ST_MARINE_CLIENTS].Email1 
                ORDER BY 
                    [ST_MARINE_BROCHURE_REQUEST].DateRequested DESC,
                    (CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromEmail WHEN 'TRUE' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromMailing WHEN 'TRUE' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromBrochure WHEN 'TRUE' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromTelephone WHEN 'TRUE' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE [ST_MARINE_CLIENTS].Blacklisted WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    [ST_MARINE_BROCHURE_REQUEST].Language,
                    [ST_MARINE_BROCHURE_REQUEST].ClientCode,
                    [ST_MARINE_BROCHURE_REQUEST].BrochureName,
                    COALESCE([SL_Simplified_Title].[TitleSimplified],''),
                    [ST_MARINE_CLIENTS].FirstName,
                    [ST_MARINE_CLIENTS].LastName,
                    [ST_MARINE_CLIENTS].City,
                    [ST_MARINE_CLIENTS].County,
                    [ST_MARINE_CLIENTS].Postcode,
                    COALESCE([SL_Simplified_Neptune_Client_Country].[CountrySimplified],[ST_MARINE_CLIENTS].Country),
                    SO.[SourceOffice],
                    [ST_MARINE_CLIENTS].Add1,
                    [ST_MARINE_CLIENTS].Add2,
                    [ST_MARINE_CLIENTS].Add3,
                    [ST_MARINE_CLIENTS].Phone1,
                    [ST_MARINE_CLIENTS].Phone2,
                    [ST_MARINE_CLIENTS].MobilePhone,
                    [ST_MARINE_CLIENTS].DateOfBirth
            ) AS RankResult,
            
            -- DWYT-16 New HubSpot API fields
            CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromTelephone WHEN 'TRUE' THEN 'Y' ELSE 'N' END AS CancelFromTelephone,
            '' AS LastContactDate,
            CASE WHEN (ISNULL([NEPTUNE_MAIL_CONTACT].F_added_date,'') = '' OR [NEPTUNE_MAIL_CONTACT].F_added_date NOT LIKE '__/__/____' OR [NEPTUNE_MAIL_CONTACT].F_added_date = '01/01/0000' OR [NEPTUNE_MAIL_CONTACT].F_added_date = '01/01/0001') THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', CONVERT(DATETIME, [NEPTUNE_MAIL_CONTACT].F_added_date, 103)))*60*60*1000) END AS NeptuneCreateDate,
            COALESCE(REPLACE(REPLACE(REPLACE([ST_MARINE_CLIENTS].ClientCode, 'TRT-M',''), 'TRT-S', ''), 'TRT-', ''), '') AS CleanClientID

        FROM    
            [NEPTUNE_Stage].[dbo].[ST_MARINE_BROCHURE_REQUEST] WITH (NOLOCK)
        INNER JOIN [NEPTUNE_Stage].[dbo].[ST_MARINE_CLIENTS] WITH (NOLOCK)
            ON [ST_MARINE_BROCHURE_REQUEST].ClientCode=[ST_MARINE_CLIENTS].ClientCode
            AND [ST_MARINE_BROCHURE_REQUEST].F_CONTACT_URN = [ST_MARINE_CLIENTS].F_URN
        INNER JOIN [NEPTUNE_Stage].[dbo].[NEPTUNE_MAIL_CONTACT] WITH (NOLOCK) 
            ON [NEPTUNE_MAIL_CONTACT].F_mail_no = [ST_MARINE_CLIENTS].MailNo
        LEFT JOIN [NEPTUNE_Stage].[dbo].[ST_MARINE_CLIENT_PREFERENCE] WITH (NOLOCK)
            ON [ST_MARINE_CLIENT_PREFERENCE].ClientCode=[ST_MARINE_CLIENTS].ClientCode
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Country] WITH (NOLOCK)
            ON [SL_Simplified_Country].[CountryActual]=[ST_MARINE_CLIENTS].Country
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Country_Language_SourceOffice] SO WITH (NOLOCK) 
            ON SO.[CountrySimplified_Language]=ISNULL([SL_Simplified_Country].[CountrySimplified],'') + [ST_MARINE_BROCHURE_REQUEST].Language
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Neptune_Client_Country] WITH (NOLOCK)
            ON [SL_Simplified_Neptune_Client_Country].[CountryActual]=[ST_MARINE_CLIENTS].Country
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Title] WITH (NOLOCK)
            ON [SL_Simplified_Title].[TitleActual]=[ST_MARINE_CLIENTS].Title
        WHERE
            (
                [ST_MARINE_BROCHURE_REQUEST].TYPE = 'LBE'
                OR
                [ST_MARINE_BROCHURE_REQUEST].BrochureName LIKE ('LeBoat Enews %')
            )
        AND [ST_MARINE_CLIENTS].Email1 LIKE '%_@%_.__%'
        AND [ST_MARINE_CLIENTS].Email1 not like '%[[]%' AND [ST_MARINE_CLIENTS].Email1 not like '%]%' AND [ST_MARINE_CLIENTS].Email1 not like '%(%' AND [ST_MARINE_CLIENTS].Email1 not like '%)%' AND [ST_MARINE_CLIENTS].Email1 not like '%''%' AND [ST_MARINE_CLIENTS].Email1 not like '% %'
        AND [ST_MARINE_BROCHURE_REQUEST].DateRequested BETWEEN CONVERT(DATE,GETDATE()-10) AND CONVERT(DATE,GETDATE()-1)
--        AND [ST_MARINE_BROCHURE_REQUEST].DateRequested BETWEEN CONVERT(DATE,'2013-01-01', 120) AND CONVERT(DATE, '2013-12-31', 120)
--        AND [ST_MARINE_BROCHURE_REQUEST].DateRequested BETWEEN CONVERT(DATE,'2016-01-01', 120) AND CONVERT(DATE, '2016-12-31', 120)
    )Result
    Where RankResult=1
    ORDER BY EnewsDateRequested
END


GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_NEPTUNE_ENEWS_8YR]    Script Date: 09/08/2018 08:16:37 ******/
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
--========================================================================================================================

CREATE PROC [dbo].[BUILD_HUBSPOT_NEPTUNE_ENEWS_8YR]
AS
BEGIN
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
            COALESCE([ST_MARINE_BROCHURE_REQUEST].Language,'') AS BookingLanguage,
            [ST_MARINE_BROCHURE_REQUEST].ClientCode,
            COALESCE([SL_Simplified_Title].[TitleSimplified],'') AS Title,
            [ST_MARINE_CLIENTS].FirstName,
            [ST_MARINE_CLIENTS].LastName,
            [ST_MARINE_CLIENTS].City,
            [ST_MARINE_CLIENTS].County,
            [ST_MARINE_CLIENTS].Postcode,
            COALESCE([SL_Simplified_Neptune_Client_Country].[CountrySimplified],[ST_MARINE_CLIENTS].Country,'') AS Country,
            REPLACE([ST_MARINE_CLIENTS].Email1,'\@','@') AS Email,
            [ST_MARINE_CLIENTS].Deceased,
            CASE [ST_MARINE_CLIENTS].Blacklisted WHEN 'Y' THEN 'Y' ELSE 'N' END AS Blacklisted,
            CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromMailing WHEN 'TRUE' THEN 'Y' ELSE 'N' END AS CancelFromMailing,
            CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromEmail WHEN 'TRUE' THEN 'Y' ELSE 'N' END AS CancelFromEmail,
            CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromBrochure WHEN 'TRUE' THEN 'Y' ELSE 'N' END AS CancelFromBrochure,
            CASE WHEN [ST_MARINE_BROCHURE_REQUEST].DateRequested IS NULL THEN '' ELSE CONVERT(VARCHAR(10),[ST_MARINE_BROCHURE_REQUEST].DateRequested,120) END AS EnewsDateRequested,
            COALESCE([ST_MARINE_CLIENTS].Add1,'') AS Address1,
            COALESCE([ST_MARINE_CLIENTS].Add2,'') AS Address2,
            COALESCE([ST_MARINE_CLIENTS].Add3,'') AS Address3,
            COALESCE([ST_MARINE_CLIENTS].Phone1,'') AS Phone1,
            COALESCE([ST_MARINE_CLIENTS].Phone2,'') AS Phone2,
            COALESCE([ST_MARINE_CLIENTS].MobilePhone,'') AS BusinessPhone,
            CASE WHEN [ST_MARINE_CLIENTS].DateOfBirth IS NULL THEN '' ELSE CONVERT(VARCHAR(10),[ST_MARINE_CLIENTS].DateOfBirth,120) END AS DateOfBirth,
            'Enews' as Status,
            DENSE_RANK() OVER(PARTITION BY [ST_MARINE_CLIENTS].Email1 
                ORDER BY 
                    [ST_MARINE_BROCHURE_REQUEST].DateRequested DESC,
                    (CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromEmail WHEN 'TRUE' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromMailing WHEN 'TRUE' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromBrochure WHEN 'TRUE' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromTelephone WHEN 'TRUE' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE [ST_MARINE_CLIENTS].Blacklisted WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    [ST_MARINE_BROCHURE_REQUEST].Language,
                    [ST_MARINE_BROCHURE_REQUEST].ClientCode,
                    [ST_MARINE_BROCHURE_REQUEST].BrochureName,
                    COALESCE([SL_Simplified_Title].[TitleSimplified],''),
                    [ST_MARINE_CLIENTS].FirstName,
                    [ST_MARINE_CLIENTS].LastName,
                    [ST_MARINE_CLIENTS].City,
                    [ST_MARINE_CLIENTS].County,
                    [ST_MARINE_CLIENTS].Postcode,
                    COALESCE([SL_Simplified_Neptune_Client_Country].[CountrySimplified],[ST_MARINE_CLIENTS].Country),
                    SO.[SourceOffice],
                    [ST_MARINE_CLIENTS].Add1,
                    [ST_MARINE_CLIENTS].Add2,
                    [ST_MARINE_CLIENTS].Add3,
                    [ST_MARINE_CLIENTS].Phone1,
                    [ST_MARINE_CLIENTS].Phone2,
                    [ST_MARINE_CLIENTS].MobilePhone,
                    [ST_MARINE_CLIENTS].DateOfBirth
            ) AS RankResult,
            
            -- DWYT-16 New HubSpot API fields
            CASE [ST_MARINE_CLIENT_PREFERENCE].CancelFromTelephone WHEN 'TRUE' THEN 'Y' ELSE 'N' END AS CancelFromTelephone,
            '' AS LastContactDate,
            CASE WHEN (ISNULL([NEPTUNE_MAIL_CONTACT].F_added_date,'') = '' OR [NEPTUNE_MAIL_CONTACT].F_added_date NOT LIKE '__/__/____' OR [NEPTUNE_MAIL_CONTACT].F_added_date = '01/01/0000' OR [NEPTUNE_MAIL_CONTACT].F_added_date = '01/01/0001') THEN '' ELSE CONVERT(VARCHAR(10),CONVERT(DATETIME, [NEPTUNE_MAIL_CONTACT].F_added_date, 103),120) END AS NeptuneCreateDate,
            COALESCE(REPLACE(REPLACE(REPLACE([ST_MARINE_CLIENTS].ClientCode, 'TRT-M',''), 'TRT-S', ''), 'TRT-', ''), '') AS CleanClientID

        FROM    
            [NEPTUNE_Stage].[dbo].[ST_MARINE_BROCHURE_REQUEST] WITH (NOLOCK)
        INNER JOIN [NEPTUNE_Stage].[dbo].[ST_MARINE_CLIENTS] WITH (NOLOCK)
            ON [ST_MARINE_BROCHURE_REQUEST].ClientCode=[ST_MARINE_CLIENTS].ClientCode
            AND [ST_MARINE_BROCHURE_REQUEST].F_CONTACT_URN = [ST_MARINE_CLIENTS].F_URN
        INNER JOIN [NEPTUNE_Stage].[dbo].[NEPTUNE_MAIL_CONTACT] WITH (NOLOCK) 
            ON [NEPTUNE_MAIL_CONTACT].F_mail_no = [ST_MARINE_CLIENTS].MailNo
        LEFT JOIN [NEPTUNE_Stage].[dbo].[ST_MARINE_CLIENT_PREFERENCE] WITH (NOLOCK)
            ON [ST_MARINE_CLIENT_PREFERENCE].ClientCode=[ST_MARINE_CLIENTS].ClientCode
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Country] WITH (NOLOCK)
            ON [SL_Simplified_Country].[CountryActual]=[ST_MARINE_CLIENTS].Country
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Country_Language_SourceOffice] SO WITH (NOLOCK) 
            ON SO.[CountrySimplified_Language]=ISNULL([SL_Simplified_Country].[CountrySimplified],'') + [ST_MARINE_BROCHURE_REQUEST].Language
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Neptune_Client_Country] WITH (NOLOCK)
            ON [SL_Simplified_Neptune_Client_Country].[CountryActual]=[ST_MARINE_CLIENTS].Country
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Title] WITH (NOLOCK)
            ON [SL_Simplified_Title].[TitleActual]=[ST_MARINE_CLIENTS].Title
        WHERE
            (
                [ST_MARINE_BROCHURE_REQUEST].TYPE = 'LBE'
                OR
                [ST_MARINE_BROCHURE_REQUEST].BrochureName LIKE ('LeBoat Enews %')
            )
        AND [ST_MARINE_CLIENTS].Email1 LIKE '%_@%_.__%'
        AND [ST_MARINE_CLIENTS].Email1 not like '%[[]%' AND [ST_MARINE_CLIENTS].Email1 not like '%]%' AND [ST_MARINE_CLIENTS].Email1 not like '%(%' AND [ST_MARINE_CLIENTS].Email1 not like '%)%' AND [ST_MARINE_CLIENTS].Email1 not like '%''%' AND [ST_MARINE_CLIENTS].Email1 not like '% %'
        AND [ST_MARINE_BROCHURE_REQUEST].DateRequested BETWEEN CONVERT(DATE,'2010-01-01', 120) AND CONVERT(DATE,GETDATE()-1)
--        AND [ST_MARINE_BROCHURE_REQUEST].DateRequested BETWEEN CONVERT(DATE,GETDATE()-10) AND CONVERT(DATE,GETDATE()-1)
--        AND [ST_MARINE_BROCHURE_REQUEST].DateRequested BETWEEN CONVERT(DATE,'2013-01-01', 120) AND CONVERT(DATE, '2013-12-31', 120)
--        AND [ST_MARINE_BROCHURE_REQUEST].DateRequested BETWEEN CONVERT(DATE,'2016-01-01', 120) AND CONVERT(DATE, '2016-12-31', 120)
    )Result
    Where RankResult=1
    ORDER BY EnewsDateRequested
END


GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_NEPTUNE_QUOTES]    Script Date: 09/08/2018 08:16:37 ******/
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
-- 21-May-2018      1.7         Tim Wilson         Corrections for dedupe logic
--========================================================================================================================

CREATE PROC [dbo].[BUILD_HUBSPOT_NEPTUNE_QUOTES]
AS
BEGIN
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
            COALESCE([ST_MARINE_REMBOOK].Language,'') AS BookingLanguage,
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
            CASE WHEN [ST_MARINE_REMBOOK].RemovedDate IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', [ST_MARINE_REMBOOK].RemovedDate))*60*60*1000) END AS QuoteDateRequested,
            CASE WHEN [ST_MARINE_REMBOOK].DepartureDate IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', [ST_MARINE_REMBOOK].DepartureDate))*60*60*1000) END AS QuoteDepartureDate,
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
                    [ST_MARINE_REMBOOK].DepartureDate DESC,
                    [ST_MARINE_REMBOOK].BookRef DESC,
                    (CASE Client.CancelFromEmail WHEN 'TRUE' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE Client.CancelFromMailing WHEN 'TRUE' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE Client.CancelFromBrochure WHEN 'TRUE' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE Client.CancelFromTelephone WHEN 'TRUE' THEN 'Y' ELSE 'N' END) DESC,
                    COALESCE(Client.LastContactDate,'') DESC,
                    COALESCE(Client.CreateDate,'') DESC,
                    (CASE Client.Deceased WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE Client.Blacklisted WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    COALESCE([SL_Simplified_SalesOffice].[SalesOfficeSimplified],[ST_MARINE_REMBOOK].[Location]),
                    [ST_MARINE_REMBOOK].Language,
                    [ST_MARINE_REMBOOK].MailNo,
                    COALESCE([SL_Simplified_Title].[TitleSimplified],''),
                    [ST_MARINE_REMBOOK].FirstName,
                    [ST_MARINE_REMBOOK].Surname,
                    [ST_MARINE_REMBOOK].City,
                    [ST_MARINE_REMBOOK].County,
                    [ST_MARINE_REMBOOK].Postcode,
                    COALESCE([SL_Simplified_Neptune_Client_Country].[CountrySimplified],[ST_MARINE_REMBOOK].Country),
                    [ST_MARINE_REMBOOK].Add1,
                    [ST_MARINE_REMBOOK].Add2,
                    [ST_MARINE_REMBOOK].Add3,
                    [ST_MARINE_REMBOOK].Phone1,
                    [ST_MARINE_REMBOOK].Phone2,
                    [ST_MARINE_REMBOOK].Phone3
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
                    CASE WHEN (ISNULL([NEPTUNE_MAIL_CONTACT].F_added_date,'') = '' OR [NEPTUNE_MAIL_CONTACT].F_added_date NOT LIKE '__/__/____' OR [NEPTUNE_MAIL_CONTACT].F_added_date = '01/01/0000' OR [NEPTUNE_MAIL_CONTACT].F_added_date = '01/01/0001') THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', CONVERT(DATETIME, [NEPTUNE_MAIL_CONTACT].F_added_date, 103)))*60*60*1000) END AS CreateDate
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
                    [ST_MARINE_CLIENTS].Email1 LIKE '%_@%_.__%'
--                    AND REPLACE([ST_MARINE_CLIENTS].Email1,'\@','@') = REPLACE([ST_MARINE_REMBOOK].Email1,'\@','@')
--                    AND [ST_MARINE_CLIENTS].MailNo = [ST_MARINE_REMBOOK].MailNo
                    AND [ST_MARINE_CLIENTS].Email1 NOT LIKE '%[[]%' 
                    AND [ST_MARINE_CLIENTS].Email1 NOT LIKE '%]%' 
                    AND [ST_MARINE_CLIENTS].Email1 NOT LIKE '%(%'
                    AND [ST_MARINE_CLIENTS].Email1 NOT LIKE '%)%'
                    AND [ST_MARINE_CLIENTS].Email1 NOT LIKE '%''%'
                    AND [ST_MARINE_CLIENTS].Email1 NOT LIKE '% %'
                    AND [ST_MARINE_CLIENTS].Lead = 'Yes'
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
        AND [ST_MARINE_REMBOOK].RemovedDate BETWEEN CONVERT(DATE,GETDATE()-10) AND CONVERT(DATE,GETDATE()-1)
--        AND [ST_MARINE_REMBOOK].RemovedDate BETWEEN CONVERT(DATE,'2013-01-01', 120) AND CONVERT(DATE, '2013-12-31', 120)
--        AND [ST_MARINE_REMBOOK].RemovedDate BETWEEN CONVERT(DATE,'2016-01-01', 120) AND CONVERT(DATE, '2016-12-31', 120)
    )Result
    WHERE 
        RankResult=1 
    ORDER BY 
        QuoteDateRequested
END



GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_NEPTUNE_QUOTES_8YR]    Script Date: 09/08/2018 08:16:37 ******/
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
--========================================================================================================================

CREATE PROC [dbo].[BUILD_HUBSPOT_NEPTUNE_QUOTES_8YR]
AS
BEGIN
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
            COALESCE([ST_MARINE_REMBOOK].Language,'') AS BookingLanguage,
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
            CASE WHEN [ST_MARINE_REMBOOK].RemovedDate IS NULL THEN '' ELSE CONVERT(VARCHAR(10),[ST_MARINE_REMBOOK].RemovedDate,120) END AS QuoteDateRequested,
            CASE WHEN [ST_MARINE_REMBOOK].DepartureDate IS NULL THEN '' ELSE CONVERT(VARCHAR(10),[ST_MARINE_REMBOOK].DepartureDate,120) END AS QuoteDepartureDate,
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
                    [ST_MARINE_REMBOOK].DepartureDate DESC,
                    [ST_MARINE_REMBOOK].BookRef DESC,
                    (CASE Client.CancelFromEmail WHEN 'TRUE' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE Client.CancelFromMailing WHEN 'TRUE' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE Client.CancelFromBrochure WHEN 'TRUE' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE Client.CancelFromTelephone WHEN 'TRUE' THEN 'Y' ELSE 'N' END) DESC,
                    COALESCE(Client.LastContactDate,'') DESC,
                    COALESCE(Client.CreateDate,'') DESC,
                    (CASE Client.Deceased WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE Client.Blacklisted WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    COALESCE([SL_Simplified_SalesOffice].[SalesOfficeSimplified],[ST_MARINE_REMBOOK].[Location]),
                    [ST_MARINE_REMBOOK].Language,
                    [ST_MARINE_REMBOOK].MailNo,
                    COALESCE([SL_Simplified_Title].[TitleSimplified],''),
                    [ST_MARINE_REMBOOK].FirstName,
                    [ST_MARINE_REMBOOK].Surname,
                    [ST_MARINE_REMBOOK].City,
                    [ST_MARINE_REMBOOK].County,
                    [ST_MARINE_REMBOOK].Postcode,
                    COALESCE([SL_Simplified_Neptune_Client_Country].[CountrySimplified],[ST_MARINE_REMBOOK].Country),
                    [ST_MARINE_REMBOOK].Add1,
                    [ST_MARINE_REMBOOK].Add2,
                    [ST_MARINE_REMBOOK].Add3,
                    [ST_MARINE_REMBOOK].Phone1,
                    [ST_MARINE_REMBOOK].Phone2,
                    [ST_MARINE_REMBOOK].Phone3
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
                    CASE WHEN (ISNULL([NEPTUNE_MAIL_CONTACT].F_added_date,'') = '' OR [NEPTUNE_MAIL_CONTACT].F_added_date NOT LIKE '__/__/____' OR [NEPTUNE_MAIL_CONTACT].F_added_date = '01/01/0000' OR [NEPTUNE_MAIL_CONTACT].F_added_date = '01/01/0001') THEN '' ELSE CONVERT(VARCHAR(10),CONVERT(DATETIME, [NEPTUNE_MAIL_CONTACT].F_added_date, 103),120) END AS CreateDate
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
                    [ST_MARINE_CLIENTS].Email1 LIKE '%_@%_.__%'
--                    AND REPLACE([ST_MARINE_CLIENTS].Email1,'\@','@') = REPLACE([ST_MARINE_REMBOOK].Email1,'\@','@')
--                    AND [ST_MARINE_CLIENTS].MailNo = [ST_MARINE_REMBOOK].MailNo
                    AND [ST_MARINE_CLIENTS].Email1 NOT LIKE '%[[]%' 
                    AND [ST_MARINE_CLIENTS].Email1 NOT LIKE '%]%' 
                    AND [ST_MARINE_CLIENTS].Email1 NOT LIKE '%(%'
                    AND [ST_MARINE_CLIENTS].Email1 NOT LIKE '%)%'
                    AND [ST_MARINE_CLIENTS].Email1 NOT LIKE '%''%'
                    AND [ST_MARINE_CLIENTS].Email1 NOT LIKE '% %'
                    AND [ST_MARINE_CLIENTS].Lead = 'Yes'
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
        AND [ST_MARINE_REMBOOK].RemovedDate BETWEEN CONVERT(DATE,'2010-01-01', 120) AND CONVERT(DATE,GETDATE()-1)
--        AND [ST_MARINE_REMBOOK].RemovedDate BETWEEN CONVERT(DATE,GETDATE()-10) AND CONVERT(DATE,GETDATE()-1)
--        AND [ST_MARINE_REMBOOK].RemovedDate BETWEEN CONVERT(DATE,'2013-01-01', 120) AND CONVERT(DATE, '2013-12-31', 120)
--        AND [ST_MARINE_REMBOOK].RemovedDate BETWEEN CONVERT(DATE,'2016-01-01', 120) AND CONVERT(DATE, '2016-12-31', 120)
    )Result
    WHERE 
        RankResult=1 
    ORDER BY 
        QuoteDateRequested
END



GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_TRITON_FL_BOOKINGS]    Script Date: 09/08/2018 08:16:37 ******/
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
-- 21-May-2018      1.5         Tim Wilson         Corrections for dedup logic
--========================================================================================================================

CREATE PROC [dbo].[BUILD_HUBSPOT_TRITON_FL_BOOKINGS]
AS
BEGIN
    SELECT DISTINCT 
         LifecycleStage
        ,BrandName
        ,ConfirmDate
        ,BookingSourcePrimary
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
        ,BookingProductName
        ,BookingDateBooked
        ,BookingDepartureDate
        ,BookingDestination
        ,BookingHullType
        ,Address1
        ,Address2
        ,Address3
        ,Phone1
        ,Phone2
        ,BusinessPhone
        ,DateOfBirth
--        ,NumberOfCharters
        ,Duration
        ,BookingBoat
        ,BookingBookRef
        ,CustomerLinkCode
        ,CustomerClass
        ,GoneAway
        ,ClientSourceCode
        ,[Status]
        ,ClientBookingOffice
        ,CancelFromTelephone
--        ,Notes
        ,LastContactDate
        ,BookingCancellationDate
        ,CancellationCancellationDate
        ,CancellationBookRef
        ,FirstCharterDepartureDate
        ,FirstCharterDestination
        ,FirstCharterDateBooked
        ,FirstCharterProduct
        ,FirstCharterHullType
        ,FirstCharterBoat
        ,NumberOfBookings
        ,TritonCreateDate
        ,BookingSourceSecondary
        ,BookingSourceTertiary
        ,BookingSalesAgent
        ,CleanClientID
        ,BookingCleanBookRef
        ,BookingTotalPax
        ,BookingStatus
    FROM 
    (
        SELECT
            'customer' AS LifecycleStage,
            'Footloose' AS BrandName,
            CASE WHEN [CELERITY_ST_BOOKINGS].ConfirmDate IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', [CELERITY_ST_BOOKINGS].ConfirmDate))*60*60*1000) END AS ConfirmDate,
            [CELERITY_ST_BOOKINGS].BookingSourcePrimary,
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
            CLI.Email1 AS Email,
            CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromMailing WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromMailing,
            CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromEmail,
            CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromBrochure,
            CLI.Deceased,
            CASE CLI.Blacklisted WHEN 'Y' THEN 'true' ELSE 'false' END AS Blacklisted,
            COALESCE([SL_Simplified_ProductName].ProductNameSimplified,'') AS BookingProductName,
            CASE WHEN [CELERITY_ST_BOOKINGS].BookingDate IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', [CELERITY_ST_BOOKINGS].BookingDate))*60*60*1000) END AS BookingDateBooked,
            CASE WHEN [CELERITY_ST_BOOKINGS].DepartureDate IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', [CELERITY_ST_BOOKINGS].DepartureDate))*60*60*1000) END AS BookingDepartureDate,
            COALESCE([SL_BaseNameFull].[BaseName],[CELERITY_ST_BOOKINGS].AreaName) AS BookingDestination,
            CASE WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1,3,1) IN ('X','L','P') THEN 'Catamaran' ELSE 'Monohull' END AS BookingHullType, 
            COALESCE(CLI.[Add1],'') AS Address1,
            COALESCE(CLI.[Add2],'') AS Address2,
            COALESCE(CLI.[Add3],'') AS Address3,
            COALESCE(CLI.[Phone1],'') AS Phone1,
            COALESCE(CLI.[Phone2],'') AS Phone2,
            COALESCE(CLI.[BusinessPhone],'') AS BusinessPhone,
            CASE WHEN CLI.DateOfBirth IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', CLI.DateOfBirth))*60*60*1000) END AS DateOfBirth,
            COALESCE(CLI.NumberOfCharters,'') AS NumberOfCharters,
            COALESCE([CELERITY_ST_BOOKINGS].Duration,'') AS Duration,
            COALESCE([CELERITY_ST_BOOKINGS].UserDefinable1,'') AS BookingBoat,
            COALESCE([CELERITY_ST_BOOKINGS].BookRef,'') AS BookingBookRef,
            COALESCE(CLI.CustomerLinkCode,'') AS CustomerLinkCode,
            COALESCE(CLI.[CustomerClass],'') AS CustomerClass,
            CASE CLI.GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END AS GoneAway,
            COALESCE(CLI.ClientSourceCode,'') AS ClientSourceCode,
            'Booking' AS [Status], 
            COALESCE([SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified],'') AS ClientBookingOffice,
            DENSE_RANK() OVER(PARTITION BY CLI.Email1 
                ORDER BY 
                    [CELERITY_ST_BOOKINGS].BookingDate DESC,
                    [CELERITY_ST_BOOKINGS].DepartureDate DESC,
                    [CELERITY_ST_BOOKINGS].BookRef DESC, 
                    [CELERITY_ST_BOOKINGS].ConfirmDate DESC,
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,    
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromMailing WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                      (CASE WHEN CLI.[LastContactDate] = '0' THEN '' ELSE CONVERT(VARCHAR(10),CONVERT(datetime, CLI.[LastContactDate], 103),120) END) DESC,
                    (CASE WHEN CLI.DateCreated IS NULL THEN '' ELSE CONVERT(VARCHAR(10),CLI.DateCreated,120) END) DESC,
                    (CASE CLI.Blacklisted WHEN 'Y' THEN 'true' ELSE 'false' END) DESC,
                    (CASE CLI.GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    [CELERITY_ST_BOOKINGS].BookingSourcePrimary,
                    COALESCE([SL_Simplified_SalesOffice].[SalesOfficeSimplified],[CELERITY_ST_BOOKINGS].BookingOfficeLocation),
                    [CELERITY_ST_BOOKINGS].BookingLanguageFull,
                    [CELERITY_ST_BOOKINGS].ProductName,
                    [CELERITY_ST_BOOKINGS].AreaName,
                    CLI.ClientCode,
                    COALESCE([SL_Simplified_Title].[TitleSimplified],''),
                    CLI.FirstName,
                    CLI.LastName,
                    CLI.City,
                    CLI.County,
                    CLI.Postcode,
                    COALESCE([SL_Simplified_Triton_Client_Country].[CountrySimplified],CLI.Country),
                    (CASE WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1,3,1) IN ('X','L','P') THEN 'Catamaran' ELSE 'Monohull' END),
                    CLI.[Add1],
                    CLI.[Add2],
                    CLI.[Add3],
                    CLI.[Phone1],
                    CLI.[Phone2],
                    CLI.[BusinessPhone],
                    CLI.DateOfBirth,
                    CLI.NumberOfCharters,
                    [CELERITY_ST_BOOKINGS].Duration,
                    [CELERITY_ST_BOOKINGS].UserDefinable1,
                    CLI.CustomerLinkCode,
                    CLI.[CustomerClass],
                    CLI.ClientSourceCode,
                    [SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified]
            ) AS RankResultMostRecentBooking,
            RankResultFirstCharter,

            -- DWYT-16 New HubSpot API fields
            CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromTelephone,
            '' AS Notes,
            CASE WHEN CLI.[LastContactDate] = '0' THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', CONVERT(datetime, CLI.[LastContactDate], 103)))*60*60*1000) END AS LastContactDate,
            CASE WHEN [CELERITY_ST_BOOKINGS].CancelledDate IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', [CELERITY_ST_BOOKINGS].CancelledDate))*60*60*1000) END AS BookingCancellationDate,
            COALESCE(CancelledBookings.CancellationDate, '') AS CancellationCancellationDate,
            COALESCE(CancelledBookings.CancellationBookRef, '') AS CancellationBookRef,
            COALESCE(FirstCharter.FirstCharterDepartureDate, '') AS FirstCharterDepartureDate,
            COALESCE(FirstCharter.FirstCharterDestination, '') AS FirstCharterDestination,
            COALESCE(FirstCharter.FirstCharterDateBooked, '') AS FirstCharterDateBooked,
            COALESCE(FirstCharter.FirstCharterProduct, '') AS FirstCharterProduct,
            COALESCE(FirstCharter.FirstCharterHullType, '') AS FirstCharterHullType,
            COALESCE(FirstCharter.FirstCharterBoat,'') AS FirstCharterBoat,
            (SELECT COUNT(*) FROM [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKINGS] WITH (NOLOCK)
                INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKEDPASSENGERS] WITH (NOLOCK)
                ON [CELERITY_ST_BOOKEDPASSENGERS].BookRef=[CELERITY_ST_BOOKINGS].BookRef
                INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENT] WITH (NOLOCK)
                ON [CELERITY_ST_BOOKEDPASSENGERS].ClientCode = [CELERITY_ST_CLIENT].ClientCode
                WHERE [CELERITY_ST_CLIENT].ClientCode = CLI.ClientCode
                AND [CELERITY_ST_BOOKINGS].BrandName ='FTL'
                AND [CELERITY_ST_BOOKINGS].[Status] = 'Booking'
            ) AS NumberOfBookings,
            CASE WHEN CLI.DateCreated IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', CLI.DateCreated))*60*60*1000) END AS TritonCreateDate,
            COALESCE([CELERITY_ST_BOOKINGS].BookingSourceSecondary,'') AS BookingSourceSecondary,
            '' AS BookingSourceTertiary,
            COALESCE([CELERITY_ST_BOOKINGS].AgentCode,'') AS BookingSalesAgent,
            COALESCE(REPLACE(REPLACE(REPLACE(CLI.ClientCode, 'TRT-M',''), 'TRT-S', ''), 'TRT-', ''), '') AS CleanClientID,
            COALESCE(REPLACE(REPLACE(REPLACE([CELERITY_ST_BOOKINGS].BookRef, 'TRT-M', ''), 'TRT-S', ''), 'TRT-', ''),'') AS BookingCleanBookRef,
            COALESCE([CELERITY_ST_BOOKINGS].[TotalPax],0) AS BookingTotalPax,
            COALESCE(REPLACE([CELERITY_ST_BOOKINGS].[Status], 'Booking', 'Confirmed'),'') AS BookingStatus
            
        FROM 
            [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKINGS] WITH (NOLOCK)
        INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKEDPASSENGERS] WITH (NOLOCK)
            ON [CELERITY_ST_BOOKEDPASSENGERS].BookRef=[CELERITY_ST_BOOKINGS].BookRef
        INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENT] CLI WITH (NOLOCK)
            ON CLI.ClientCode=[CELERITY_ST_BOOKEDPASSENGERS].ClientCode
            AND CLI.Brand = 'M'
        LEFT JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENTPREFERENCES] WITH (NOLOCK)
            ON [CELERITY_ST_CLIENTPREFERENCES].ClientCode = CLI.ClientCode
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
        LEFT JOIN
        -- First Charter records
        (
            SELECT DISTINCT
                BookRef AS FirstCharterBookRef,
                DepartureDate AS FirstCharterDepartureDate,
                Destination AS FirstCharterDestination,
                BookingDate AS FirstCharterDateBooked,
                ProductName AS FirstCharterProduct,
                HullType AS FirstCharterHullType,
                UserDefinable1 AS FirstCharterBoat,
                ClientCode AS FirstCharterClientCode,
                RankResultFirstCharter
            FROM
            (
                SELECT
                    [CELERITY_ST_BOOKINGS].BookRef,
                    CASE WHEN [CELERITY_ST_BOOKINGS].DepartureDate IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', [CELERITY_ST_BOOKINGS].DepartureDate))*60*60*1000) END AS DepartureDate,
                    COALESCE([SL_BaseNameFull].[BaseName],[CELERITY_ST_BOOKINGS].AreaName) AS Destination,
                    CASE WHEN [CELERITY_ST_BOOKINGS].BookingDate IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', [CELERITY_ST_BOOKINGS].BookingDate))*60*60*1000) END AS BookingDate,
                    [SL_Simplified_ProductName].ProductNameSimplified AS ProductName,
                    CASE
                        WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1, 3, 1) = 'P' THEN 'Power'
                        WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1, 3, 1) = 'X' THEN 'Catamaran'
                        WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1, 3, 1) = 'L' THEN 'Catamaran'
                        ELSE 'Monohull'
                    END AS HullType,
                    [CELERITY_ST_BOOKINGS].UserDefinable1,
                    CLI.ClientCode,
                    DENSE_RANK() OVER(PARTITION BY CLI.ClientCode
                        ORDER BY 
                            [CELERITY_ST_BOOKINGS].BookingDate ASC,
                            [CELERITY_ST_BOOKINGS].DepartureDate DESC,
                            [CELERITY_ST_BOOKINGS].BookRef DESC, 
                            [CELERITY_ST_BOOKINGS].ConfirmDate DESC,
                            (CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,    
                            (CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromMailing WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                            (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                            (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                            (CASE WHEN CLI.[LastContactDate] = '0' THEN '' ELSE CONVERT(VARCHAR(10),CONVERT(datetime, CLI.[LastContactDate], 103),120) END) DESC,
                            (CASE WHEN CLI.DateCreated IS NULL THEN '' ELSE CONVERT(VARCHAR(10),CLI.DateCreated,120) END) DESC,
                            (CASE CLI.Blacklisted WHEN 'Y' THEN 'true' ELSE 'false' END) DESC,
                            (CASE CLI.GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                            [CELERITY_ST_BOOKINGS].BookingSourcePrimary ASC,
                            COALESCE([SL_Simplified_SalesOffice].[SalesOfficeSimplified],[CELERITY_ST_BOOKINGS].BookingOfficeLocation) ASC,
                            [CELERITY_ST_BOOKINGS].BookingLanguageFull ASC,
                            [CELERITY_ST_BOOKINGS].ProductName ASC,
                            [CELERITY_ST_BOOKINGS].AreaName ASC,
                            CLI.ClientCode ASC,
                            COALESCE([SL_Simplified_Title].[TitleSimplified],'') ASC,
                            CLI.FirstName ASC,
                            CLI.LastName ASC,
                            CLI.City ASC,
                            CLI.County ASC,
                            CLI.Postcode ASC,
                            COALESCE([SL_Simplified_Triton_Client_Country].[CountrySimplified],CLI.Country) ASC,
                            (CASE WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1,3,1) IN ('X','L','P') THEN 'Catamaran' ELSE 'Monohull' END) ASC,
                            CLI.[Add1] ASC,
                            CLI.[Add2] ASC,
                            CLI.[Add3] ASC,
                            CLI.[Phone1] ASC,
                            CLI.[Phone2] ASC,
                            CLI.[BusinessPhone] ASC,
                            CLI.DateOfBirth ASC,
                            CLI.NumberOfCharters ASC,
                            [CELERITY_ST_BOOKINGS].Duration ASC,
                            [CELERITY_ST_BOOKINGS].UserDefinable1 ASC,
                            CLI.CustomerLinkCode ASC,
                            CLI.[CustomerClass] ASC,
                            CLI.ClientSourceCode ASC,
                            [SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified] ASC
                    ) AS RankResultFirstCharter
                FROM 
                    [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKINGS] WITH (NOLOCK)
                INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKEDPASSENGERS] WITH (NOLOCK)
                    ON [CELERITY_ST_BOOKEDPASSENGERS].BookRef=[CELERITY_ST_BOOKINGS].BookRef
                INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENT] CLI WITH (NOLOCK)
                    ON CLI.ClientCode=[CELERITY_ST_BOOKEDPASSENGERS].ClientCode
                    AND CLI.Brand = 'M'
                LEFT JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENTPREFERENCES] WITH (NOLOCK)
                    ON [CELERITY_ST_CLIENTPREFERENCES].ClientCode = CLI.ClientCode
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
                AND [CELERITY_ST_BOOKINGS].Status = 'Booking'
                AND [CELERITY_ST_BOOKINGS].BookingSourcePrimary NOT IN ('PR-Pr free trip','TAAC-Ta on account','PR-Public relations-mor','PRESS-Bericht in der press','STAFF-Staff booking','OWNS-Owner with no paymen','OS-Wot-offshore sailing','OWNER-Owner','DAYCH-Day charter discount','LOCAL-Local booking','OS-Offshore sailing','OSS-Offshore sailing','OW-Owner use','OPS-Operations/maintenan','TA','STHOL-Staff holiday','TAGEN-Travel agent','OSSFF-Staff friends & fami','LOCA2-Local booking','TO-Tour operator')
                AND [CELERITY_ST_BOOKINGS].AreaCode NOT IN ('UKD','UK1','CVO','SS1','UK2','SS2','UK3','FLT','UK4')
                AND [CELERITY_ST_BOOKINGS].ProductName IN ('SAILING_SCHOOLS','CREWED','FLOTILLA','FRANCHISE','FOOTLOOSE','BAREBOAT','CORPORATE','POWER')
                AND [CELERITY_ST_BOOKINGS].BookingType ='DIRECT'
                AND [CELERITY_ST_BOOKINGS].UserDefinable1 IS NOT NULL
                AND LTRIM(RTRIM([CELERITY_ST_BOOKINGS].UserDefinable1)) <> '' 
                AND CLI.Email1 LIKE '%_@%_.__%'
                AND CLI.Email1 not like '%[[]%' AND CLI.Email1 not like '%]%' AND CLI.Email1 not like '%(%' AND CLI.Email1 not like '%)%' AND CLI.Email1 not like '%''%' AND CLI.Email1 not like '% %'
                AND [CELERITY_ST_BOOKINGS].BookingDate >= CONVERT(date,'2010-01-01 00:00:00.000')
            ) FirstCharterInnerSelect
            WHERE RankResultFirstCharter = 1
        ) FirstCharter
        ON FirstCharter.FirstCharterClientCode = CLI.ClientCode
        LEFT JOIN
        -- Most recent cancellation records
        (
            SELECT DISTINCT
                BookRef AS CancellationBookRef,
                CancellationDate AS CancellationDate,
                ClientCode AS CancellationClientCode,
                RankResultCancellation
            FROM
            (
                SELECT
                    [CELERITY_ST_BOOKINGS].BookRef,
                    CASE WHEN [CELERITY_ST_BOOKINGS].CancelledDate IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', [CELERITY_ST_BOOKINGS].CancelledDate))*60*60*1000) END AS CancellationDate,
                    CLI.ClientCode,
                    DENSE_RANK() OVER(PARTITION BY CLI.ClientCode
                        ORDER BY 
                            [CELERITY_ST_BOOKINGS].BookingDate DESC,
                            [CELERITY_ST_BOOKINGS].DepartureDate DESC,
                            [CELERITY_ST_BOOKINGS].BookRef DESC, 
                            [CELERITY_ST_BOOKINGS].ConfirmDate DESC,
                            (CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,    
                            (CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromMailing WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                            (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                            (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                              (CASE WHEN CLI.[LastContactDate] = '0' THEN '' ELSE CONVERT(VARCHAR(10),CONVERT(datetime, CLI.[LastContactDate], 103),120) END) DESC,
                            (CASE WHEN CLI.DateCreated IS NULL THEN '' ELSE CONVERT(VARCHAR(10),CLI.DateCreated,120) END) DESC,
                            (CASE CLI.Blacklisted WHEN 'Y' THEN 'true' ELSE 'false' END) DESC,
                            (CASE CLI.GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                            [CELERITY_ST_BOOKINGS].BookingSourcePrimary ASC,
                            COALESCE([SL_Simplified_SalesOffice].[SalesOfficeSimplified],[CELERITY_ST_BOOKINGS].BookingOfficeLocation) ASC,
                            [CELERITY_ST_BOOKINGS].BookingLanguageFull ASC,
                            [CELERITY_ST_BOOKINGS].ProductName ASC,
                            [CELERITY_ST_BOOKINGS].AreaName ASC,
                            CLI.ClientCode ASC,
                            COALESCE([SL_Simplified_Title].[TitleSimplified],'') ASC,
                            CLI.FirstName ASC,
                            CLI.LastName ASC,
                            CLI.City ASC,
                            CLI.County ASC,
                            CLI.Postcode ASC,
                            COALESCE([SL_Simplified_Triton_Client_Country].[CountrySimplified],CLI.Country) ASC,
                            (CASE WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1,3,1) IN ('X','L','P') THEN 'Catamaran' ELSE 'Monohull' END) ASC,
                            CLI.[Add1] ASC,
                            CLI.[Add2] ASC,
                            CLI.[Add3] ASC,
                            CLI.[Phone1] ASC,
                            CLI.[Phone2] ASC,
                            CLI.[BusinessPhone] ASC,
                            CLI.DateOfBirth ASC,
                            CLI.NumberOfCharters ASC,
                            [CELERITY_ST_BOOKINGS].Duration ASC,
                            [CELERITY_ST_BOOKINGS].UserDefinable1 ASC,
                            CLI.CustomerLinkCode ASC,
                            CLI.[CustomerClass] ASC,
                            CLI.ClientSourceCode ASC,
                            [SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified] ASC
                    ) AS RankResultCancellation
                FROM 
                    [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKINGS] WITH (NOLOCK)
                INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKEDPASSENGERS] WITH (NOLOCK)
                    ON [CELERITY_ST_BOOKEDPASSENGERS].BookRef=[CELERITY_ST_BOOKINGS].BookRef
                INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENT] CLI WITH (NOLOCK)
                    ON CLI.ClientCode=[CELERITY_ST_BOOKEDPASSENGERS].ClientCode
                    AND CLI.Brand = 'M'
                LEFT JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENTPREFERENCES] WITH (NOLOCK)
                    ON [CELERITY_ST_CLIENTPREFERENCES].ClientCode = CLI.ClientCode
                LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_SalesOffice] WITH (NOLOCK)
                    ON [SL_Simplified_SalesOffice].BrandName='MRG' AND [SL_Simplified_SalesOffice].[SalesOfficeFromRawData]=[CELERITY_ST_BOOKINGS].BookingOfficeLocation
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
                AND [CELERITY_ST_BOOKINGS].Status IN ('Booking','Cancelled')
                AND [CELERITY_ST_BOOKINGS].CancelledDate IS NOT NULL
                AND [CELERITY_ST_BOOKINGS].BookingSourcePrimary NOT IN ('PR-Pr free trip','TAAC-Ta on account','PR-Public relations-mor','PRESS-Bericht in der press','STAFF-Staff booking','OWNS-Owner with no paymen','OS-Wot-offshore sailing','OWNER-Owner','DAYCH-Day charter discount','LOCAL-Local booking','OS-Offshore sailing','OSS-Offshore sailing','OW-Owner use','OPS-Operations/maintenan','TA','STHOL-Staff holiday','TAGEN-Travel agent','OSSFF-Staff friends & fami','LOCA2-Local booking','TO-Tour operator')
                AND [CELERITY_ST_BOOKINGS].AreaCode NOT IN ('UKD','UK1','CVO','SS1','UK2','SS2','UK3','FLT','UK4')
                AND [CELERITY_ST_BOOKINGS].ProductName IN ('SAILING_SCHOOLS','CREWED','FLOTILLA','FRANCHISE','FOOTLOOSE','BAREBOAT','CORPORATE','POWER')
                AND [CELERITY_ST_BOOKINGS].BookingType ='DIRECT'
                AND [CELERITY_ST_BOOKINGS].UserDefinable1 IS NOT NULL
                AND LTRIM(RTRIM([CELERITY_ST_BOOKINGS].UserDefinable1)) <> '' 
                AND CLI.Email1 LIKE '%_@%_.__%'
                AND CLI.Email1 not like '%[[]%' AND CLI.Email1 not like '%]%' AND CLI.Email1 not like '%(%' AND CLI.Email1 not like '%)%' AND CLI.Email1 not like '%''%' AND CLI.Email1 not like '% %'
                --Search all bookings for most recent cancellation records
                --AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,GETDATE()-8) AND CONVERT(DATE,GETDATE()-1)
                --AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN '2017-08-03' AND '2017-09-10'
            ) CancelledBookingsInnerSelect
            WHERE RankResultCancellation = 1
        ) CancelledBookings
        ON CancelledBookings.CancellationClientCode = CLI.ClientCode
        WHERE 
            [CELERITY_ST_BOOKINGS].BrandName ='FTL'
        AND [CELERITY_ST_BOOKINGS].Status IN ('Booking','Cancelled')
        AND [CELERITY_ST_BOOKINGS].BookingSourcePrimary NOT IN ('PR-Pr free trip','TAAC-Ta on account','PR-Public relations-mor','PRESS-Bericht in der press','STAFF-Staff booking','OWNS-Owner with no paymen','OS-Wot-offshore sailing','OWNER-Owner','DAYCH-Day charter discount','LOCAL-Local booking','OS-Offshore sailing','OSS-Offshore sailing','OW-Owner use','OPS-Operations/maintenan','TA','STHOL-Staff holiday','TAGEN-Travel agent','OSSFF-Staff friends & fami','LOCA2-Local booking','TO-Tour operator')
        AND [CELERITY_ST_BOOKINGS].AreaCode NOT IN ('UKD','UK1','CVO','SS1','UK2','SS2','UK3','FLT','UK4')
        AND [CELERITY_ST_BOOKINGS].ProductName IN ('SAILING_SCHOOLS','CREWED','FLOTILLA','FRANCHISE','FOOTLOOSE','BAREBOAT','CORPORATE','POWER')
        AND [CELERITY_ST_BOOKINGS].BookingType ='DIRECT'
        AND [CELERITY_ST_BOOKINGS].UserDefinable1 IS NOT NULL
        AND LTRIM(RTRIM([CELERITY_ST_BOOKINGS].UserDefinable1)) <> '' 
        AND CLI.Email1 LIKE '%_@%_.__%'
        AND CLI.Email1 not like '%[[]%' AND CLI.Email1 not like '%]%' AND CLI.Email1 not like '%(%' AND CLI.Email1 not like '%)%' AND CLI.Email1 not like '%''%' AND CLI.Email1 not like '% %'
        AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,GETDATE()-10) AND CONVERT(DATE,GETDATE()-1)
--        AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,'2013-01-01', 120) AND CONVERT(DATE, '2013-12-31', 120)
--        AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,'2016-01-01', 120) AND CONVERT(DATE, '2016-12-31', 120)
    ) Result

    WHERE RankResultMostRecentBooking=1
    ORDER BY ConfirmDate

END


GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_TRITON_FL_BOOKINGS_8YR]    Script Date: 09/08/2018 08:16:37 ******/
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
--========================================================================================================================

CREATE PROC [dbo].[BUILD_HUBSPOT_TRITON_FL_BOOKINGS_8YR]
AS
BEGIN
    SELECT DISTINCT 
         LifecycleStage
        ,BrandName
        ,ConfirmDate
        ,BookingSourcePrimary
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
        ,BookingProductName
        ,BookingDateBooked
        ,BookingDepartureDate
        ,BookingDestination
        ,BookingHullType
        ,Address1
        ,Address2
        ,Address3
        ,Phone1
        ,Phone2
        ,BusinessPhone
        ,DateOfBirth
--        ,NumberOfCharters
        ,Duration
        ,BookingBoat
        ,BookingBookRef
        ,CustomerLinkCode
        ,CustomerClass
        ,GoneAway
        ,ClientSourceCode
        ,[Status]
        ,ClientBookingOffice
        ,CancelFromTelephone
--        ,Notes
        ,LastContactDate
        ,BookingCancellationDate
        ,CancellationCancellationDate
        ,CancellationBookRef
        ,FirstCharterDepartureDate
        ,FirstCharterDestination
        ,FirstCharterDateBooked
        ,FirstCharterProduct
        ,FirstCharterHullType
        ,FirstCharterBoat
        ,NumberOfBookings
        ,TritonCreateDate
        ,BookingSourceSecondary
        ,BookingSourceTertiary
        ,BookingSalesAgent
        ,CleanClientID
        ,BookingCleanBookRef
        ,BookingTotalPax
        ,BookingStatus
    FROM 
    (
        SELECT
            'customer' AS LifecycleStage,
            'Footloose' AS BrandName,
            CASE WHEN [CELERITY_ST_BOOKINGS].ConfirmDate IS NULL THEN '' ELSE CONVERT(VARCHAR(10),[CELERITY_ST_BOOKINGS].ConfirmDate,120) END AS ConfirmDate,
            [CELERITY_ST_BOOKINGS].BookingSourcePrimary,
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
            CLI.Email1 AS Email,
            CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromMailing WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromMailing,
            CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromEmail,
            CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromBrochure,
            CLI.Deceased,
            CASE CLI.Blacklisted WHEN 'Y' THEN 'true' ELSE 'false' END AS Blacklisted,
            COALESCE([SL_Simplified_ProductName].ProductNameSimplified,'') AS BookingProductName,
            CASE WHEN [CELERITY_ST_BOOKINGS].BookingDate IS NULL THEN '' ELSE CONVERT(VARCHAR(10),[CELERITY_ST_BOOKINGS].BookingDate,120) END AS BookingDateBooked,
            CASE WHEN [CELERITY_ST_BOOKINGS].DepartureDate IS NULL THEN '' ELSE CONVERT(VARCHAR(10),[CELERITY_ST_BOOKINGS].DepartureDate,120) END AS BookingDepartureDate,
            COALESCE([SL_BaseNameFull].[BaseName],[CELERITY_ST_BOOKINGS].AreaName) AS BookingDestination,
            CASE WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1,3,1) IN ('X','L','P') THEN 'Catamaran' ELSE 'Monohull' END AS BookingHullType, 
            COALESCE(CLI.[Add1],'') AS Address1,
            COALESCE(CLI.[Add2],'') AS Address2,
            COALESCE(CLI.[Add3],'') AS Address3,
            COALESCE(CLI.[Phone1],'') AS Phone1,
            COALESCE(CLI.[Phone2],'') AS Phone2,
            COALESCE(CLI.[BusinessPhone],'') AS BusinessPhone,
            CASE WHEN CLI.DateOfBirth IS NULL THEN '' ELSE CONVERT(VARCHAR(10),CLI.DateOfBirth,120) END AS DateOfBirth,
            COALESCE(CLI.NumberOfCharters,'') AS NumberOfCharters,
            COALESCE([CELERITY_ST_BOOKINGS].Duration,'') AS Duration,
            COALESCE([CELERITY_ST_BOOKINGS].UserDefinable1,'') AS BookingBoat,
            COALESCE([CELERITY_ST_BOOKINGS].BookRef,'') AS BookingBookRef,
            COALESCE(CLI.CustomerLinkCode,'') AS CustomerLinkCode,
            COALESCE(CLI.[CustomerClass],'') AS CustomerClass,
            CASE CLI.GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END AS GoneAway,
            COALESCE(CLI.ClientSourceCode,'') AS ClientSourceCode,
            'Booking' AS [Status], 
            COALESCE([SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified],'') AS ClientBookingOffice,
            DENSE_RANK() OVER(PARTITION BY CLI.Email1 
                ORDER BY 
                    [CELERITY_ST_BOOKINGS].BookingDate DESC,
                    [CELERITY_ST_BOOKINGS].DepartureDate DESC,
                    [CELERITY_ST_BOOKINGS].BookRef DESC, 
                    [CELERITY_ST_BOOKINGS].ConfirmDate DESC,
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,    
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromMailing WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE WHEN CLI.[LastContactDate] = '0' THEN '' ELSE CONVERT(VARCHAR(10),CONVERT(datetime, CLI.[LastContactDate], 103),120) END) DESC,
                    (CASE WHEN CLI.DateCreated IS NULL THEN '' ELSE CONVERT(VARCHAR(10),CLI.DateCreated,120) END) DESC,
                    (CASE CLI.Blacklisted WHEN 'Y' THEN 'true' ELSE 'false' END) DESC,
                    (CASE CLI.GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    [CELERITY_ST_BOOKINGS].BookingSourcePrimary,
                    COALESCE([SL_Simplified_SalesOffice].[SalesOfficeSimplified],[CELERITY_ST_BOOKINGS].BookingOfficeLocation),
                    [CELERITY_ST_BOOKINGS].BookingLanguageFull,
                    [CELERITY_ST_BOOKINGS].ProductName,
                    [CELERITY_ST_BOOKINGS].AreaName,
                    CLI.ClientCode,
                    COALESCE([SL_Simplified_Title].[TitleSimplified],''),
                    CLI.FirstName,
                    CLI.LastName,
                    CLI.City,
                    CLI.County,
                    CLI.Postcode,
                    COALESCE([SL_Simplified_Triton_Client_Country].[CountrySimplified],CLI.Country),
                    (CASE WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1,3,1) IN ('X','L','P') THEN 'Catamaran' ELSE 'Monohull' END),
                    CLI.[Add1],
                    CLI.[Add2],
                    CLI.[Add3],
                    CLI.[Phone1],
                    CLI.[Phone2],
                    CLI.[BusinessPhone],
                    CLI.DateOfBirth,
                    CLI.NumberOfCharters,
                    [CELERITY_ST_BOOKINGS].Duration,
                    [CELERITY_ST_BOOKINGS].UserDefinable1,
                    CLI.CustomerLinkCode,
                    CLI.[CustomerClass],
                    CLI.ClientSourceCode,
                    [SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified]
            ) AS RankResultMostRecentBooking,
            RankResultFirstCharter,

            -- DWYT-16 New HubSpot API fields
            CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromTelephone,
            '' AS Notes,
            CASE WHEN CLI.[LastContactDate] = '0' THEN '' ELSE CONVERT(VARCHAR(10),CONVERT(datetime, CLI.[LastContactDate], 103),120) END AS LastContactDate,
            CASE WHEN [CELERITY_ST_BOOKINGS].CancelledDate IS NULL THEN '' ELSE CONVERT(VARCHAR(10),[CELERITY_ST_BOOKINGS].CancelledDate,120) END AS BookingCancellationDate,
            COALESCE(CancelledBookings.CancellationDate, '') AS CancellationCancellationDate,
            COALESCE(CancelledBookings.CancellationBookRef, '') AS CancellationBookRef,
            COALESCE(FirstCharter.FirstCharterDepartureDate, '') AS FirstCharterDepartureDate,
            COALESCE(FirstCharter.FirstCharterDestination, '') AS FirstCharterDestination,
            COALESCE(FirstCharter.FirstCharterDateBooked, '') AS FirstCharterDateBooked,
            COALESCE(FirstCharter.FirstCharterProduct, '') AS FirstCharterProduct,
            COALESCE(FirstCharter.FirstCharterHullType, '') AS FirstCharterHullType,
            COALESCE(FirstCharter.FirstCharterBoat,'') AS FirstCharterBoat,
            (SELECT COUNT(*) FROM [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKINGS] WITH (NOLOCK)
                INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKEDPASSENGERS] WITH (NOLOCK)
                ON [CELERITY_ST_BOOKEDPASSENGERS].BookRef=[CELERITY_ST_BOOKINGS].BookRef
                INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENT] WITH (NOLOCK)
                ON [CELERITY_ST_BOOKEDPASSENGERS].ClientCode = [CELERITY_ST_CLIENT].ClientCode
                WHERE [CELERITY_ST_CLIENT].ClientCode = CLI.ClientCode
                AND [CELERITY_ST_BOOKINGS].BrandName ='FTL'
                AND [CELERITY_ST_BOOKINGS].[Status] = 'Booking'
            ) AS NumberOfBookings,
            CASE WHEN CLI.DateCreated IS NULL THEN '' ELSE CONVERT(VARCHAR(10),CLI.DateCreated,120) END AS TritonCreateDate,
            COALESCE([CELERITY_ST_BOOKINGS].BookingSourceSecondary,'') AS BookingSourceSecondary,
            '' AS BookingSourceTertiary,
            COALESCE([CELERITY_ST_BOOKINGS].AgentCode,'') AS BookingSalesAgent,
            COALESCE(REPLACE(REPLACE(REPLACE(CLI.ClientCode, 'TRT-M',''), 'TRT-S', ''), 'TRT-', ''), '') AS CleanClientID,
            COALESCE(REPLACE(REPLACE(REPLACE([CELERITY_ST_BOOKINGS].BookRef, 'TRT-M', ''), 'TRT-S', ''), 'TRT-', ''),'') AS BookingCleanBookRef,
            COALESCE([CELERITY_ST_BOOKINGS].[TotalPax],0) AS BookingTotalPax,
            COALESCE(REPLACE([CELERITY_ST_BOOKINGS].[Status], 'Booking', 'Confirmed'),'') AS BookingStatus
            
        FROM 
            [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKINGS] WITH (NOLOCK)
        INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKEDPASSENGERS] WITH (NOLOCK)
            ON [CELERITY_ST_BOOKEDPASSENGERS].BookRef=[CELERITY_ST_BOOKINGS].BookRef
        INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENT] CLI WITH (NOLOCK)
            ON CLI.ClientCode=[CELERITY_ST_BOOKEDPASSENGERS].ClientCode
            AND CLI.Brand = 'M'
        LEFT JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENTPREFERENCES] WITH (NOLOCK)
            ON [CELERITY_ST_CLIENTPREFERENCES].ClientCode = CLI.ClientCode
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
        LEFT JOIN
        -- First Charter records
        (
            SELECT DISTINCT
                BookRef AS FirstCharterBookRef,
                DepartureDate AS FirstCharterDepartureDate,
                Destination AS FirstCharterDestination,
                BookingDate AS FirstCharterDateBooked,
                ProductName AS FirstCharterProduct,
                HullType AS FirstCharterHullType,
                UserDefinable1 AS FirstCharterBoat,
                ClientCode AS FirstCharterClientCode,
                RankResultFirstCharter
            FROM
            (
                SELECT
                    [CELERITY_ST_BOOKINGS].BookRef,
                    CASE WHEN [CELERITY_ST_BOOKINGS].DepartureDate IS NULL THEN '' ELSE CONVERT(VARCHAR(10),[CELERITY_ST_BOOKINGS].DepartureDate,120) END AS DepartureDate,
                    COALESCE([SL_BaseNameFull].[BaseName],[CELERITY_ST_BOOKINGS].AreaName) AS Destination,
                    CASE WHEN [CELERITY_ST_BOOKINGS].BookingDate IS NULL THEN '' ELSE CONVERT(VARCHAR(10),[CELERITY_ST_BOOKINGS].BookingDate,120) END AS BookingDate,
                    [SL_Simplified_ProductName].ProductNameSimplified AS ProductName,
                    CASE
                        WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1, 3, 1) = 'P' THEN 'Power'
                        WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1, 3, 1) = 'X' THEN 'Catamaran'
                        WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1, 3, 1) = 'L' THEN 'Catamaran'
                        ELSE 'Monohull'
                    END AS HullType,
                    [CELERITY_ST_BOOKINGS].UserDefinable1,
                    CLI.ClientCode,
                    DENSE_RANK() OVER(PARTITION BY CLI.ClientCode
                        ORDER BY 
                            [CELERITY_ST_BOOKINGS].BookingDate ASC,
                            [CELERITY_ST_BOOKINGS].DepartureDate DESC,
                            [CELERITY_ST_BOOKINGS].BookRef DESC, 
                            [CELERITY_ST_BOOKINGS].ConfirmDate DESC,
                            (CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,    
                            (CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromMailing WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                            (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                            (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                            (CASE WHEN CLI.[LastContactDate] = '0' THEN '' ELSE CONVERT(VARCHAR(10),CONVERT(datetime, CLI.[LastContactDate], 103),120) END) DESC,
                            (CASE WHEN CLI.DateCreated IS NULL THEN '' ELSE CONVERT(VARCHAR(10),CLI.DateCreated,120) END) DESC,
                            (CASE CLI.Blacklisted WHEN 'Y' THEN 'true' ELSE 'false' END) DESC,
                            (CASE CLI.GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                            [CELERITY_ST_BOOKINGS].BookingSourcePrimary ASC,
                            COALESCE([SL_Simplified_SalesOffice].[SalesOfficeSimplified],[CELERITY_ST_BOOKINGS].BookingOfficeLocation) ASC,
                            [CELERITY_ST_BOOKINGS].BookingLanguageFull ASC,
                            [CELERITY_ST_BOOKINGS].ProductName ASC,
                            [CELERITY_ST_BOOKINGS].AreaName ASC,
                            CLI.ClientCode ASC,
                            COALESCE([SL_Simplified_Title].[TitleSimplified],'') ASC,
                            CLI.FirstName ASC,
                            CLI.LastName ASC,
                            CLI.City ASC,
                            CLI.County ASC,
                            CLI.Postcode ASC,
                            COALESCE([SL_Simplified_Triton_Client_Country].[CountrySimplified],CLI.Country) ASC,
                            (CASE WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1,3,1) IN ('X','L','P') THEN 'Catamaran' ELSE 'Monohull' END) ASC,
                            CLI.[Add1] ASC,
                            CLI.[Add2] ASC,
                            CLI.[Add3] ASC,
                            CLI.[Phone1] ASC,
                            CLI.[Phone2] ASC,
                            CLI.[BusinessPhone] ASC,
                            CLI.DateOfBirth ASC,
                            CLI.NumberOfCharters ASC,
                            [CELERITY_ST_BOOKINGS].Duration ASC,
                            [CELERITY_ST_BOOKINGS].UserDefinable1 ASC,
                            CLI.CustomerLinkCode ASC,
                            CLI.[CustomerClass] ASC,
                            CLI.ClientSourceCode ASC,
                            [SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified] ASC
                    ) AS RankResultFirstCharter
                FROM 
                    [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKINGS] WITH (NOLOCK)
                INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKEDPASSENGERS] WITH (NOLOCK)
                    ON [CELERITY_ST_BOOKEDPASSENGERS].BookRef=[CELERITY_ST_BOOKINGS].BookRef
                INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENT] CLI WITH (NOLOCK)
                    ON CLI.ClientCode=[CELERITY_ST_BOOKEDPASSENGERS].ClientCode
                    AND CLI.Brand = 'M'
                LEFT JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENTPREFERENCES] WITH (NOLOCK)
                    ON [CELERITY_ST_CLIENTPREFERENCES].ClientCode = CLI.ClientCode
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
                AND [CELERITY_ST_BOOKINGS].Status = 'Booking'
                AND [CELERITY_ST_BOOKINGS].BookingSourcePrimary NOT IN ('PR-Pr free trip','TAAC-Ta on account','PR-Public relations-mor','PRESS-Bericht in der press','STAFF-Staff booking','OWNS-Owner with no paymen','OS-Wot-offshore sailing','OWNER-Owner','DAYCH-Day charter discount','LOCAL-Local booking','OS-Offshore sailing','OSS-Offshore sailing','OW-Owner use','OPS-Operations/maintenan','TA','STHOL-Staff holiday','TAGEN-Travel agent','OSSFF-Staff friends & fami','LOCA2-Local booking','TO-Tour operator')
                AND [CELERITY_ST_BOOKINGS].AreaCode NOT IN ('UKD','UK1','CVO','SS1','UK2','SS2','UK3','FLT','UK4')
                AND [CELERITY_ST_BOOKINGS].ProductName IN ('SAILING_SCHOOLS','CREWED','FLOTILLA','FRANCHISE','FOOTLOOSE','BAREBOAT','CORPORATE','POWER')
                AND [CELERITY_ST_BOOKINGS].BookingType ='DIRECT'
                AND [CELERITY_ST_BOOKINGS].UserDefinable1 IS NOT NULL
                AND LTRIM(RTRIM([CELERITY_ST_BOOKINGS].UserDefinable1)) <> '' 
                AND CLI.Email1 LIKE '%_@%_.__%'
                AND CLI.Email1 not like '%[[]%' AND CLI.Email1 not like '%]%' AND CLI.Email1 not like '%(%' AND CLI.Email1 not like '%)%' AND CLI.Email1 not like '%''%' AND CLI.Email1 not like '% %'
                AND [CELERITY_ST_BOOKINGS].BookingDate >= CONVERT(date,'2010-01-01 00:00:00.000')
            ) FirstCharterInnerSelect
            WHERE RankResultFirstCharter = 1
        ) FirstCharter
        ON FirstCharter.FirstCharterClientCode = CLI.ClientCode
        LEFT JOIN
        -- Most recent cancellation records
        (
            SELECT DISTINCT
                BookRef AS CancellationBookRef,
                CancellationDate AS CancellationDate,
                ClientCode AS CancellationClientCode,
                RankResultCancellation
            FROM
            (
                SELECT
                    [CELERITY_ST_BOOKINGS].BookRef,
                    CASE WHEN [CELERITY_ST_BOOKINGS].CancelledDate IS NULL THEN '' ELSE CONVERT(VARCHAR(10),[CELERITY_ST_BOOKINGS].CancelledDate,120) END AS CancellationDate,
                    CLI.ClientCode,
                    DENSE_RANK() OVER(PARTITION BY CLI.ClientCode
                        ORDER BY 
                            [CELERITY_ST_BOOKINGS].BookingDate DESC,
                            [CELERITY_ST_BOOKINGS].DepartureDate DESC,
                            [CELERITY_ST_BOOKINGS].BookRef DESC, 
                            [CELERITY_ST_BOOKINGS].ConfirmDate DESC,
                            (CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,    
                            (CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromMailing WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                            (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                            (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                              (CASE WHEN CLI.[LastContactDate] = '0' THEN '' ELSE CONVERT(VARCHAR(10),CONVERT(datetime, CLI.[LastContactDate], 103),120) END) DESC,
                            (CASE WHEN CLI.DateCreated IS NULL THEN '' ELSE CONVERT(VARCHAR(10),CLI.DateCreated,120) END) DESC,
                            (CASE CLI.Blacklisted WHEN 'Y' THEN 'true' ELSE 'false' END) DESC,
                            (CASE CLI.GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                            [CELERITY_ST_BOOKINGS].BookingSourcePrimary ASC,
                            COALESCE([SL_Simplified_SalesOffice].[SalesOfficeSimplified],[CELERITY_ST_BOOKINGS].BookingOfficeLocation) ASC,
                            [CELERITY_ST_BOOKINGS].BookingLanguageFull ASC,
                            [CELERITY_ST_BOOKINGS].ProductName ASC,
                            [CELERITY_ST_BOOKINGS].AreaName ASC,
                            CLI.ClientCode ASC,
                            COALESCE([SL_Simplified_Title].[TitleSimplified],'') ASC,
                            CLI.FirstName ASC,
                            CLI.LastName ASC,
                            CLI.City ASC,
                            CLI.County ASC,
                            CLI.Postcode ASC,
                            COALESCE([SL_Simplified_Triton_Client_Country].[CountrySimplified],CLI.Country) ASC,
                            (CASE WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1,3,1) IN ('X','L','P') THEN 'Catamaran' ELSE 'Monohull' END) ASC,
                            CLI.[Add1] ASC,
                            CLI.[Add2] ASC,
                            CLI.[Add3] ASC,
                            CLI.[Phone1] ASC,
                            CLI.[Phone2] ASC,
                            CLI.[BusinessPhone] ASC,
                            CLI.DateOfBirth ASC,
                            CLI.NumberOfCharters ASC,
                            [CELERITY_ST_BOOKINGS].Duration ASC,
                            [CELERITY_ST_BOOKINGS].UserDefinable1 ASC,
                            CLI.CustomerLinkCode ASC,
                            CLI.[CustomerClass] ASC,
                            CLI.ClientSourceCode ASC,
                            [SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified] ASC
                    ) AS RankResultCancellation
                FROM 
                    [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKINGS] WITH (NOLOCK)
                INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKEDPASSENGERS] WITH (NOLOCK)
                    ON [CELERITY_ST_BOOKEDPASSENGERS].BookRef=[CELERITY_ST_BOOKINGS].BookRef
                INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENT] CLI WITH (NOLOCK)
                    ON CLI.ClientCode=[CELERITY_ST_BOOKEDPASSENGERS].ClientCode
                    AND CLI.Brand = 'M'
                LEFT JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENTPREFERENCES] WITH (NOLOCK)
                    ON [CELERITY_ST_CLIENTPREFERENCES].ClientCode = CLI.ClientCode
                LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_SalesOffice] WITH (NOLOCK)
                    ON [SL_Simplified_SalesOffice].BrandName='MRG' AND [SL_Simplified_SalesOffice].[SalesOfficeFromRawData]=[CELERITY_ST_BOOKINGS].BookingOfficeLocation
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
                AND [CELERITY_ST_BOOKINGS].Status IN ('Booking','Cancelled')
                AND [CELERITY_ST_BOOKINGS].CancelledDate IS NOT NULL
                AND [CELERITY_ST_BOOKINGS].BookingSourcePrimary NOT IN ('PR-Pr free trip','TAAC-Ta on account','PR-Public relations-mor','PRESS-Bericht in der press','STAFF-Staff booking','OWNS-Owner with no paymen','OS-Wot-offshore sailing','OWNER-Owner','DAYCH-Day charter discount','LOCAL-Local booking','OS-Offshore sailing','OSS-Offshore sailing','OW-Owner use','OPS-Operations/maintenan','TA','STHOL-Staff holiday','TAGEN-Travel agent','OSSFF-Staff friends & fami','LOCA2-Local booking','TO-Tour operator')
                AND [CELERITY_ST_BOOKINGS].AreaCode NOT IN ('UKD','UK1','CVO','SS1','UK2','SS2','UK3','FLT','UK4')
                AND [CELERITY_ST_BOOKINGS].ProductName IN ('SAILING_SCHOOLS','CREWED','FLOTILLA','FRANCHISE','FOOTLOOSE','BAREBOAT','CORPORATE','POWER')
                AND [CELERITY_ST_BOOKINGS].BookingType ='DIRECT'
                AND [CELERITY_ST_BOOKINGS].UserDefinable1 IS NOT NULL
                AND LTRIM(RTRIM([CELERITY_ST_BOOKINGS].UserDefinable1)) <> '' 
                AND CLI.Email1 LIKE '%_@%_.__%'
                AND CLI.Email1 not like '%[[]%' AND CLI.Email1 not like '%]%' AND CLI.Email1 not like '%(%' AND CLI.Email1 not like '%)%' AND CLI.Email1 not like '%''%' AND CLI.Email1 not like '% %'
                --Search all bookings for most recent cancellation records
                --AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,GETDATE()-8) AND CONVERT(DATE,GETDATE()-1)
                --AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN '2017-08-03' AND '2017-09-10'
            ) CancelledBookingsInnerSelect
            WHERE RankResultCancellation = 1
        ) CancelledBookings
        ON CancelledBookings.CancellationClientCode = CLI.ClientCode
        WHERE 
            [CELERITY_ST_BOOKINGS].BrandName ='FTL'
        AND [CELERITY_ST_BOOKINGS].Status IN ('Booking','Cancelled')
        AND [CELERITY_ST_BOOKINGS].BookingSourcePrimary NOT IN ('PR-Pr free trip','TAAC-Ta on account','PR-Public relations-mor','PRESS-Bericht in der press','STAFF-Staff booking','OWNS-Owner with no paymen','OS-Wot-offshore sailing','OWNER-Owner','DAYCH-Day charter discount','LOCAL-Local booking','OS-Offshore sailing','OSS-Offshore sailing','OW-Owner use','OPS-Operations/maintenan','TA','STHOL-Staff holiday','TAGEN-Travel agent','OSSFF-Staff friends & fami','LOCA2-Local booking','TO-Tour operator')
        AND [CELERITY_ST_BOOKINGS].AreaCode NOT IN ('UKD','UK1','CVO','SS1','UK2','SS2','UK3','FLT','UK4')
        AND [CELERITY_ST_BOOKINGS].ProductName IN ('SAILING_SCHOOLS','CREWED','FLOTILLA','FRANCHISE','FOOTLOOSE','BAREBOAT','CORPORATE','POWER')
        AND [CELERITY_ST_BOOKINGS].BookingType ='DIRECT'
        AND [CELERITY_ST_BOOKINGS].UserDefinable1 IS NOT NULL
        AND LTRIM(RTRIM([CELERITY_ST_BOOKINGS].UserDefinable1)) <> '' 
        AND CLI.Email1 LIKE '%_@%_.__%'
        AND CLI.Email1 not like '%[[]%' AND CLI.Email1 not like '%]%' AND CLI.Email1 not like '%(%' AND CLI.Email1 not like '%)%' AND CLI.Email1 not like '%''%' AND CLI.Email1 not like '% %'
        AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,'2010-01-01', 120) AND CONVERT(DATE,GETDATE()-1)
--      AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,GETDATE()-10) AND CONVERT(DATE,GETDATE()-1)
--        AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,'2013-01-01', 120) AND CONVERT(DATE, '2013-12-31', 120)
--        AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,'2016-01-01', 120) AND CONVERT(DATE, '2016-12-31', 120)
    ) Result

    WHERE RankResultMostRecentBooking=1
    ORDER BY ConfirmDate

END


GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_TRITON_FL_QUOTES]    Script Date: 09/08/2018 08:16:37 ******/
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
-- 21-May-2018      1.7         Tim Wilson         Corrections for dedupe logic
--========================================================================================================================

CREATE PROC [dbo].[BUILD_HUBSPOT_TRITON_FL_QUOTES]
AS
BEGIN
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
            CLI.Email1 AS Email,
            CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromMailing WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromMailing,
            CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromEmail,
            CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromBrochure,
            CLI.Deceased,
            CASE CLI.Blacklisted WHEN 'Y' THEN 'true' ELSE 'false' END AS Blacklisted,
            COALESCE([SL_Simplified_ProductName].ProductNameSimplified,'') AS QuoteProductName,
            CASE WHEN [CELERITY_ST_BOOKINGS].BookingDate IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', [CELERITY_ST_BOOKINGS].BookingDate))*60*60*1000) END AS QuoteDateRequested,
            CASE WHEN [CELERITY_ST_BOOKINGS].DepartureDate IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', [CELERITY_ST_BOOKINGS].DepartureDate))*60*60*1000) END AS QuoteDepartureDate,
            COALESCE([SL_BaseNameFull].[BaseName],[CELERITY_ST_BOOKINGS].AreaName) AS QuoteDestination,
            CASE WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1,3,1) IN ('X','L','P') THEN 'Catamaran' ELSE 'Monohull' END AS QuoteHullType, 
            COALESCE(CLI.[Add1],'') AS Address1,
            COALESCE(CLI.[Add2],'') AS Address2,
            COALESCE(CLI.[Add3],'') AS Address3,
            COALESCE(CLI.[Phone1],'') AS Phone1,
            COALESCE(CLI.[Phone2],'') AS Phone2,
            COALESCE(CLI.[BusinessPhone],'') AS BusinessPhone,
            CASE WHEN CLI.DateOfBirth IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', CLI.DateOfBirth))*60*60*1000) END AS DateOfBirth,
            COALESCE([CELERITY_ST_BOOKINGS].ExecutiveReportingRegion,'') AS QuoteExecutiveReportingRegion,
            COALESCE([CELERITY_ST_BOOKINGS].UserDefinable1,'') AS QuoteBoat,
            COALESCE([CELERITY_ST_BOOKINGS].BookRef,'') AS QuoteBookRef,
            COALESCE(CLI.CustomerLinkCode,'') AS CustomerLinkCode,
            COALESCE(CLI.[CustomerClass],'') AS CustomerClass,
            CASE CLI.GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END AS GoneAway,
            COALESCE(CLI.ClientSourceCode,'') AS ClientSourceCode,
            [CELERITY_ST_BOOKINGS].[Status], 
            COALESCE([SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified],'') AS ClientBookingOffice,
            DENSE_RANK() OVER(PARTITION BY CLI.Email1 
                ORDER BY 
                    [CELERITY_ST_BOOKINGS].BookingDate DESC, 
                    [CELERITY_ST_BOOKINGS].DepartureDate DESC,
                    [CELERITY_ST_BOOKINGS].BookRef DESC, 
                    [CELERITY_ST_BOOKINGS].ConfirmDate DESC,
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,    
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromMailing WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE WHEN CLI.[LastContactDate] = '0' THEN '' ELSE CONVERT(VARCHAR(10),CONVERT(datetime, CLI.[LastContactDate], 103),120) END) DESC,
                    (CASE WHEN CLI.DateCreated IS NULL THEN '' ELSE CONVERT(VARCHAR(10),CLI.DateCreated,120) END) DESC,
                    (CASE CLI.Blacklisted WHEN 'Y' THEN 'true' ELSE 'false' END) DESC,
                    (CASE CLI.GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    [CELERITY_ST_BOOKINGS].BookingSourcePrimary,
                    COALESCE([SL_Simplified_SalesOffice].[SalesOfficeSimplified],[CELERITY_ST_BOOKINGS].BookingOfficeLocation),
                    [CELERITY_ST_BOOKINGS].BookingLanguageFull,
                    [CELERITY_ST_BOOKINGS].ProductName,
                    [CELERITY_ST_BOOKINGS].AreaName,
                    CLI.ClientCode,
                    COALESCE([SL_Simplified_Title].[TitleSimplified],''),
                    CLI.FirstName,
                    CLI.LastName,
                    CLI.City,
                    CLI.County,
                    CLI.Postcode,
                    COALESCE([SL_Simplified_Triton_Client_Country].[CountrySimplified],CLI.Country),
                    (CASE WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1,3,1) IN ('X','L','P') THEN 'Catamaran' ELSE 'Monohull' END),
                    CLI.[Add1],
                    CLI.[Add2],
                    CLI.[Add3],
                    CLI.[Phone1],
                    CLI.[Phone2],
                    CLI.[BusinessPhone],
                    CLI.DateOfBirth,
                    [CELERITY_ST_BOOKINGS].ExecutiveReportingRegion,
                    [CELERITY_ST_BOOKINGS].UserDefinable1,
                    CLI.CustomerLinkCode,
                    CLI.[CustomerClass],
                    CLI.ClientSourceCode,
                    [SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified]
            ) AS RankResultMostRecentQuote,

            -- DWYT-16 New HubSpot API fields
            CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromTelephone,
            '' AS Notes,
            CASE WHEN CLI.[LastContactDate] = '0' THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', CONVERT(datetime, CLI.[LastContactDate], 103)))*60*60*1000) END AS LastContactDate,
            CASE WHEN CLI.DateCreated IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', CLI.DateCreated))*60*60*1000) END AS TritonCreateDate,
            COALESCE(REPLACE(REPLACE(REPLACE(CLI.ClientCode, 'TRT-M',''), 'TRT-S', ''), 'TRT-', ''), '') AS CleanClientID,
            COALESCE([CELERITY_ST_BOOKINGS].AgentCode,'') AS QuoteSalesAgent
            
        FROM 
            [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKINGS] WITH (NOLOCK)
        INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKEDPASSENGERS] WITH (NOLOCK)
            ON [CELERITY_ST_BOOKEDPASSENGERS].BookRef=[CELERITY_ST_BOOKINGS].BookRef
        INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENT] CLI WITH (NOLOCK)
            ON CLI.ClientCode=[CELERITY_ST_BOOKEDPASSENGERS].ClientCode
            AND CLI.Brand = 'M'
        LEFT JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENTPREFERENCES] WITH (NOLOCK)
            ON [CELERITY_ST_CLIENTPREFERENCES].ClientCode = CLI.ClientCode
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
        AND [CELERITY_ST_BOOKINGS].BookingSourcePrimary NOT IN ('PR-Pr free trip','TAAC-Ta on account','PR-Public relations-mor','PRESS-Bericht in der press','STAFF-Staff booking','OWNS-Owner with no paymen','OS-Wot-offshore sailing','OWNER-Owner','DAYCH-Day charter discount','LOCAL-Local booking','OS-Offshore sailing','OSS-Offshore sailing','OW-Owner use','OPS-Operations/maintenan','TA','STHOL-Staff holiday','TAGEN-Travel agent','OSSFF-Staff friends & fami','LOCA2-Local booking','TO-Tour operator')
        AND [CELERITY_ST_BOOKINGS].AreaCode NOT IN ('UKD','UK1','CVO','SS1','UK2','SS2','UK3','FLT','UK4')
        AND [CELERITY_ST_BOOKINGS].ProductName IN ('SAILING_SCHOOLS','CREWED','FLOTILLA','FRANCHISE','FOOTLOOSE','BAREBOAT','CORPORATE','POWER')
        AND [CELERITY_ST_BOOKINGS].BookingType ='DIRECT'
        AND [CELERITY_ST_BOOKINGS].UserDefinable1 IS NOT NULL
        AND LTRIM(RTRIM([CELERITY_ST_BOOKINGS].UserDefinable1)) <> '' 
        AND CLI.Email1 LIKE '%_@%_.__%'
        AND CLI.Email1 not like '%[[]%' AND CLI.Email1 not like '%]%' AND CLI.Email1 not like '%(%' AND CLI.Email1 not like '%)%' AND CLI.Email1 not like '%''%' AND CLI.Email1 not like '% %'
        AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,GETDATE()-10) AND CONVERT(DATE,GETDATE()-1)
--        AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,'2013-01-01', 120) AND CONVERT(DATE, '2013-12-31', 120)
--        AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,'2016-01-01', 120) AND CONVERT(DATE, '2016-12-31', 120)
    ) Result

    WHERE RankResultMostRecentQuote=1
    ORDER BY QuoteDateRequested

END


GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_TRITON_FL_QUOTES_8YR]    Script Date: 09/08/2018 08:16:37 ******/
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
--========================================================================================================================

CREATE PROC [dbo].[BUILD_HUBSPOT_TRITON_FL_QUOTES_8YR]
AS
BEGIN
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
            CLI.Email1 AS Email,
            CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromMailing WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromMailing,
            CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromEmail,
            CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromBrochure,
            CLI.Deceased,
            CASE CLI.Blacklisted WHEN 'Y' THEN 'true' ELSE 'false' END AS Blacklisted,
            COALESCE([SL_Simplified_ProductName].ProductNameSimplified,'') AS QuoteProductName,
            CASE WHEN [CELERITY_ST_BOOKINGS].BookingDate IS NULL THEN '' ELSE CONVERT(VARCHAR(10),[CELERITY_ST_BOOKINGS].BookingDate,120) END AS QuoteDateRequested,
            CASE WHEN [CELERITY_ST_BOOKINGS].DepartureDate IS NULL THEN '' ELSE CONVERT(VARCHAR(10),[CELERITY_ST_BOOKINGS].DepartureDate,120) END AS QuoteDepartureDate,
            COALESCE([SL_BaseNameFull].[BaseName],[CELERITY_ST_BOOKINGS].AreaName) AS QuoteDestination,
            CASE WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1,3,1) IN ('X','L','P') THEN 'Catamaran' ELSE 'Monohull' END AS QuoteHullType, 
            COALESCE(CLI.[Add1],'') AS Address1,
            COALESCE(CLI.[Add2],'') AS Address2,
            COALESCE(CLI.[Add3],'') AS Address3,
            COALESCE(CLI.[Phone1],'') AS Phone1,
            COALESCE(CLI.[Phone2],'') AS Phone2,
            COALESCE(CLI.[BusinessPhone],'') AS BusinessPhone,
            CASE WHEN CLI.DateOfBirth IS NULL THEN '' ELSE CONVERT(VARCHAR(10),CLI.DateOfBirth,120) END AS DateOfBirth,
            COALESCE([CELERITY_ST_BOOKINGS].ExecutiveReportingRegion,'') AS QuoteExecutiveReportingRegion,
            COALESCE([CELERITY_ST_BOOKINGS].UserDefinable1,'') AS QuoteBoat,
            COALESCE([CELERITY_ST_BOOKINGS].BookRef,'') AS QuoteBookRef,
            COALESCE(CLI.CustomerLinkCode,'') AS CustomerLinkCode,
            COALESCE(CLI.[CustomerClass],'') AS CustomerClass,
            CASE CLI.GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END AS GoneAway,
            COALESCE(CLI.ClientSourceCode,'') AS ClientSourceCode,
            [CELERITY_ST_BOOKINGS].[Status], 
            COALESCE([SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified],'') AS ClientBookingOffice,
            DENSE_RANK() OVER(PARTITION BY CLI.Email1 
                ORDER BY 
                    [CELERITY_ST_BOOKINGS].BookingDate DESC, 
                    [CELERITY_ST_BOOKINGS].DepartureDate DESC,
                    [CELERITY_ST_BOOKINGS].BookRef DESC, 
                    [CELERITY_ST_BOOKINGS].ConfirmDate DESC,
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,    
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromMailing WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE WHEN CLI.[LastContactDate] = '0' THEN '' ELSE CONVERT(VARCHAR(10),CONVERT(datetime, CLI.[LastContactDate], 103),120) END) DESC,
                    (CASE WHEN CLI.DateCreated IS NULL THEN '' ELSE CONVERT(VARCHAR(10),CLI.DateCreated,120) END) DESC,
                    (CASE CLI.Blacklisted WHEN 'Y' THEN 'true' ELSE 'false' END) DESC,
                    (CASE CLI.GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    [CELERITY_ST_BOOKINGS].BookingSourcePrimary,
                    COALESCE([SL_Simplified_SalesOffice].[SalesOfficeSimplified],[CELERITY_ST_BOOKINGS].BookingOfficeLocation),
                    [CELERITY_ST_BOOKINGS].BookingLanguageFull,
                    [CELERITY_ST_BOOKINGS].ProductName,
                    [CELERITY_ST_BOOKINGS].AreaName,
                    CLI.ClientCode,
                    COALESCE([SL_Simplified_Title].[TitleSimplified],''),
                    CLI.FirstName,
                    CLI.LastName,
                    CLI.City,
                    CLI.County,
                    CLI.Postcode,
                    COALESCE([SL_Simplified_Triton_Client_Country].[CountrySimplified],CLI.Country),
                    (CASE WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1,3,1) IN ('X','L','P') THEN 'Catamaran' ELSE 'Monohull' END),
                    CLI.[Add1],
                    CLI.[Add2],
                    CLI.[Add3],
                    CLI.[Phone1],
                    CLI.[Phone2],
                    CLI.[BusinessPhone],
                    CLI.DateOfBirth,
                    [CELERITY_ST_BOOKINGS].ExecutiveReportingRegion,
                    [CELERITY_ST_BOOKINGS].UserDefinable1,
                    CLI.CustomerLinkCode,
                    CLI.[CustomerClass],
                    CLI.ClientSourceCode,
                    [SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified]
            ) AS RankResultMostRecentQuote,

            -- DWYT-16 New HubSpot API fields
            CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromTelephone,
            '' AS Notes,
            CASE WHEN CLI.[LastContactDate] = '0' THEN '' ELSE CONVERT(VARCHAR(10),CONVERT(datetime, CLI.[LastContactDate], 103),120) END AS LastContactDate,
            CASE WHEN CLI.DateCreated IS NULL THEN '' ELSE CONVERT(VARCHAR(10),CLI.DateCreated,120) END AS TritonCreateDate,
            COALESCE(REPLACE(REPLACE(REPLACE(CLI.ClientCode, 'TRT-M',''), 'TRT-S', ''), 'TRT-', ''), '') AS CleanClientID,
            COALESCE([CELERITY_ST_BOOKINGS].AgentCode,'') AS QuoteSalesAgent
            
        FROM 
            [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKINGS] WITH (NOLOCK)
        INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKEDPASSENGERS] WITH (NOLOCK)
            ON [CELERITY_ST_BOOKEDPASSENGERS].BookRef=[CELERITY_ST_BOOKINGS].BookRef
        INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENT] CLI WITH (NOLOCK)
            ON CLI.ClientCode=[CELERITY_ST_BOOKEDPASSENGERS].ClientCode
            AND CLI.Brand = 'M'
        LEFT JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENTPREFERENCES] WITH (NOLOCK)
            ON [CELERITY_ST_CLIENTPREFERENCES].ClientCode = CLI.ClientCode
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
        AND [CELERITY_ST_BOOKINGS].BookingSourcePrimary NOT IN ('PR-Pr free trip','TAAC-Ta on account','PR-Public relations-mor','PRESS-Bericht in der press','STAFF-Staff booking','OWNS-Owner with no paymen','OS-Wot-offshore sailing','OWNER-Owner','DAYCH-Day charter discount','LOCAL-Local booking','OS-Offshore sailing','OSS-Offshore sailing','OW-Owner use','OPS-Operations/maintenan','TA','STHOL-Staff holiday','TAGEN-Travel agent','OSSFF-Staff friends & fami','LOCA2-Local booking','TO-Tour operator')
        AND [CELERITY_ST_BOOKINGS].AreaCode NOT IN ('UKD','UK1','CVO','SS1','UK2','SS2','UK3','FLT','UK4')
        AND [CELERITY_ST_BOOKINGS].ProductName IN ('SAILING_SCHOOLS','CREWED','FLOTILLA','FRANCHISE','FOOTLOOSE','BAREBOAT','CORPORATE','POWER')
        AND [CELERITY_ST_BOOKINGS].BookingType ='DIRECT'
        AND [CELERITY_ST_BOOKINGS].UserDefinable1 IS NOT NULL
        AND LTRIM(RTRIM([CELERITY_ST_BOOKINGS].UserDefinable1)) <> '' 
        AND CLI.Email1 LIKE '%_@%_.__%'
        AND CLI.Email1 not like '%[[]%' AND CLI.Email1 not like '%]%' AND CLI.Email1 not like '%(%' AND CLI.Email1 not like '%)%' AND CLI.Email1 not like '%''%' AND CLI.Email1 not like '% %'
        AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,'2010-01-01', 120) AND CONVERT(DATE,GETDATE()-1)
--        AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,GETDATE()-10) AND CONVERT(DATE,GETDATE()-1)
--        AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,'2013-01-01', 120) AND CONVERT(DATE, '2013-12-31', 120)
--        AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,'2016-01-01', 120) AND CONVERT(DATE, '2016-12-31', 120)
    ) Result

    WHERE RankResultMostRecentQuote=1
    ORDER BY QuoteDateRequested

END


GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_TRITON_SS_BOOKINGS]    Script Date: 09/08/2018 08:16:37 ******/
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
-- 21-May-2018      1.5         Tim Wilson         Corrections for dedup logic
--========================================================================================================================

CREATE PROC [dbo].[BUILD_HUBSPOT_TRITON_SS_BOOKINGS]
AS
BEGIN
    SELECT DISTINCT 
         LifecycleStage
        ,BrandName
        ,ConfirmDate
        ,BookingSourcePrimary
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
        ,BookingProductName
        ,BookingDateBooked
        ,BookingDepartureDate
        ,BookingDestination
        ,BookingHullType
        ,Address1
        ,Address2
        ,Address3
        ,Phone1
        ,Phone2
        ,BusinessPhone
        ,DateOfBirth
        ,BookingExecutiveReportingRegion
--        ,NumberOfCharters
        ,Duration
        ,BookingBoat
        ,BookingBookRef
        ,CustomerLinkCode
        ,CustomerClass
        ,GoneAway
        ,ClientSourceCode
        ,[Status]
        ,ClientBookingOffice
        ,CancelFromTelephone
--        ,Notes
        ,LastContactDate
        ,BookingCancellationDate
        ,CancellationCancellationDate
        ,CancellationBookRef
        ,FirstCharterDepartureDate
        ,FirstCharterDestination
        ,FirstCharterDateBooked
        ,FirstCharterProduct
        ,FirstCharterHullType
        ,FirstCharterBoat
        ,NumberOfBookings
        ,TritonCreateDate
        ,BookingSourceSecondary
        ,BookingSourceTertiary
        ,BookingSalesAgent
        ,CleanClientID
        ,BookingCleanBookRef
        ,BookingTotalPax
        ,BookingStatus
    FROM 
    (
        SELECT
            'customer' AS LifecycleStage,
            'Sunsail' AS BrandName,
            CASE WHEN [CELERITY_ST_BOOKINGS].ConfirmDate IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', [CELERITY_ST_BOOKINGS].ConfirmDate))*60*60*1000) END AS ConfirmDate,
            [CELERITY_ST_BOOKINGS].BookingSourcePrimary,
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
            CLI.Email1 AS Email,
            CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromMailing WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromMailing,
            CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromEmail,
            CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromBrochure,
            CLI.Deceased,
            CASE CLI.Blacklisted WHEN 'Y' THEN 'Y' ELSE 'N' END AS Blacklisted,
            [CELERITY_ST_BOOKINGS].ProductName AS BookingProductName,
            CASE WHEN [CELERITY_ST_BOOKINGS].BookingDate IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', [CELERITY_ST_BOOKINGS].BookingDate))*60*60*1000) END AS BookingDateBooked,
            CASE WHEN [CELERITY_ST_BOOKINGS].DepartureDate IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', [CELERITY_ST_BOOKINGS].DepartureDate))*60*60*1000) END AS BookingDepartureDate,
            COALESCE([SL_BaseNameFull].[BaseName],[CELERITY_ST_BOOKINGS].AreaName) AS BookingDestination,
            CASE WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1,3,1) IN ('X','L','P') THEN 'Catamaran' ELSE 'Monohull' END AS BookingHullType, 
            COALESCE(CLI.[Add1],'') AS Address1,
            COALESCE(CLI.[Add2],'') AS Address2,
            COALESCE(CLI.[Add3],'') AS Address3,
            COALESCE(CLI.[Phone1],'') AS Phone1,
            COALESCE(CLI.[Phone2],'') AS Phone2,
            COALESCE(CLI.[BusinessPhone],'') AS BusinessPhone,
            CASE WHEN CLI.DateOfBirth IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', CLI.DateOfBirth))*60*60*1000) END AS DateOfBirth,
            COALESCE([CELERITY_ST_BOOKINGS].ExecutiveReportingRegion,'') AS BookingExecutiveReportingRegion,
            COALESCE(CLI.NumberOfCharters,'') AS NumberOfCharters,
            COALESCE([CELERITY_ST_BOOKINGS].Duration,'') AS Duration,
            --COALESCE([CELERITY_ST_BOOKINGS].CleanBaseName,'') AS CleanBaseName,--Ignore for now
            --COALESCE([CELERITY_ST_BOOKINGS].CleanBoatName,'') AS CleanBoatName,--Ignore for now
            COALESCE([CELERITY_ST_BOOKINGS].UserDefinable1,'') AS BookingBoat,
            COALESCE([CELERITY_ST_BOOKINGS].BookRef,'') AS BookingBookRef,
            COALESCE(CLI.CustomerLinkCode,'') AS CustomerLinkCode,
            COALESCE(CLI.[CustomerClass],'') AS CustomerClass,
            CASE CLI.GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END AS GoneAway,
            COALESCE(CLI.ClientSourceCode,'') AS ClientSourceCode,
            'Booking' AS [Status], 
            COALESCE([SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified],'') AS ClientBookingOffice,
            DENSE_RANK() OVER(PARTITION BY CLI.Email1 
                ORDER BY 
                    [CELERITY_ST_BOOKINGS].BookingDate DESC,
                    [CELERITY_ST_BOOKINGS].DepartureDate DESC,
                    [CELERITY_ST_BOOKINGS].BookRef DESC, 
                    [CELERITY_ST_BOOKINGS].ConfirmDate DESC,
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,    
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromMailing WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE WHEN CLI.[LastContactDate] = '0' THEN '' ELSE CONVERT(VARCHAR(10),CONVERT(datetime, CLI.[LastContactDate], 103),120) END) DESC,
                    (CASE WHEN CLI.DateCreated IS NULL THEN '' ELSE CONVERT(VARCHAR(10),CLI.DateCreated,120) END) DESC,
                    (CASE CLI.Blacklisted WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE CLI.GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    [CELERITY_ST_BOOKINGS].BookingSourcePrimary,
                    COALESCE([SL_Simplified_SalesOffice].[SalesOfficeSimplified],[CELERITY_ST_BOOKINGS].BookingOfficeLocation),
                    [CELERITY_ST_BOOKINGS].BookingLanguageFull,
                    [CELERITY_ST_BOOKINGS].ProductName,
                    [CELERITY_ST_BOOKINGS].AreaName,
                    CLI.ClientCode,
                    COALESCE([SL_Simplified_Title].[TitleSimplified],''),
                    CLI.FirstName,
                    CLI.LastName,
                    CLI.City,
                    CLI.County,
                    CLI.Postcode,
                    COALESCE([SL_Simplified_Triton_Client_Country].[CountrySimplified],CLI.Country),
                    (CASE WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1,3,1) IN ('X','L','P') THEN 'Catamaran' ELSE 'Monohull' END),
                    CLI.[Add1],
                    CLI.[Add2],
                    CLI.[Add3],
                    CLI.[Phone1],
                    CLI.[Phone2],
                    CLI.[BusinessPhone],
                    CLI.DateOfBirth,
                    [CELERITY_ST_BOOKINGS].ExecutiveReportingRegion,
                    CLI.NumberOfCharters,
                    [CELERITY_ST_BOOKINGS].Duration,
                    [CELERITY_ST_BOOKINGS].UserDefinable1,
                    CLI.CustomerLinkCode,
                    CLI.[CustomerClass],
                    CLI.ClientSourceCode,
                    [SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified]
            ) AS RankResultMostRecentBooking,
            RankResultFirstCharter,

            -- DWYT-16 New HubSpot API fields
            CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromTelephone,
            '' AS Notes,
            CASE WHEN CLI.[LastContactDate] = '0' THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', CONVERT(datetime, CLI.[LastContactDate], 103)))*60*60*1000) END AS LastContactDate,
            CASE WHEN [CELERITY_ST_BOOKINGS].CancelledDate IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', [CELERITY_ST_BOOKINGS].CancelledDate))*60*60*1000) END AS BookingCancellationDate,
            COALESCE(CancelledBookings.CancellationDate, '') AS CancellationCancellationDate,
            COALESCE(CancelledBookings.CancellationBookRef, '') AS CancellationBookRef,
            COALESCE(FirstCharter.FirstCharterDepartureDate, '') AS FirstCharterDepartureDate,
            COALESCE(FirstCharter.FirstCharterDestination, '') AS FirstCharterDestination,
            COALESCE(FirstCharter.FirstCharterDateBooked, '') AS FirstCharterDateBooked,
            COALESCE(FirstCharter.FirstCharterProduct, '') AS FirstCharterProduct,
            COALESCE(FirstCharter.FirstCharterHullType, '') AS FirstCharterHullType,
            COALESCE(FirstCharter.FirstCharterBoat,'') AS FirstCharterBoat,
            (SELECT COUNT(*) FROM [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKINGS] WITH (NOLOCK)
                INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKEDPASSENGERS] WITH (NOLOCK)
                ON [CELERITY_ST_BOOKEDPASSENGERS].BookRef=[CELERITY_ST_BOOKINGS].BookRef
                INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENT] WITH (NOLOCK)
                ON [CELERITY_ST_BOOKEDPASSENGERS].ClientCode = [CELERITY_ST_CLIENT].ClientCode
                WHERE [CELERITY_ST_CLIENT].ClientCode = CLI.ClientCode
                AND [CELERITY_ST_BOOKINGS].BrandName ='SUN'
                AND [CELERITY_ST_BOOKINGS].[Status] = 'Booking'
            ) AS NumberOfBookings,
            CASE WHEN CLI.DateCreated IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', CLI.DateCreated))*60*60*1000) END AS TritonCreateDate,
            COALESCE([CELERITY_ST_BOOKINGS].BookingSourceSecondary,'') AS BookingSourceSecondary,
            '' AS BookingSourceTertiary,
            COALESCE([CELERITY_ST_BOOKINGS].AgentCode,'') AS BookingSalesAgent,
            COALESCE(REPLACE(REPLACE(REPLACE(CLI.ClientCode, 'TRT-M',''), 'TRT-S', ''), 'TRT-', ''), '') AS CleanClientID,
            COALESCE(REPLACE(REPLACE(REPLACE([CELERITY_ST_BOOKINGS].BookRef, 'TRT-M', ''), 'TRT-S', ''), 'TRT-', ''),'') AS BookingCleanBookRef,
            COALESCE([CELERITY_ST_BOOKINGS].[TotalPax],0) AS BookingTotalPax,
            COALESCE(REPLACE([CELERITY_ST_BOOKINGS].[Status], 'Booking', 'Confirmed'),'') AS BookingStatus
            
        FROM 
            [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKINGS] WITH (NOLOCK)
        INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKEDPASSENGERS] WITH (NOLOCK)
            ON [CELERITY_ST_BOOKEDPASSENGERS].BookRef=[CELERITY_ST_BOOKINGS].BookRef
        INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENT] CLI WITH (NOLOCK)
            ON CLI.ClientCode=[CELERITY_ST_BOOKEDPASSENGERS].ClientCode
            AND CLI.Brand = 'S'
        LEFT JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENTPREFERENCES] WITH (NOLOCK)
            ON [CELERITY_ST_CLIENTPREFERENCES].ClientCode = CLI.ClientCode
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
        LEFT JOIN
        -- First Charter records
        (
            SELECT DISTINCT
                BookRef AS FirstCharterBookRef,
                DepartureDate AS FirstCharterDepartureDate,
                Destination AS FirstCharterDestination,
                BookingDate AS FirstCharterDateBooked,
                ProductName AS FirstCharterProduct,
                HullType AS FirstCharterHullType,
                UserDefinable1 AS FirstCharterBoat,
                ClientCode AS FirstCharterClientCode,
                RankResultFirstCharter
            FROM
            (
                SELECT
                    [CELERITY_ST_BOOKINGS].BookRef,
                    CASE WHEN [CELERITY_ST_BOOKINGS].DepartureDate IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', [CELERITY_ST_BOOKINGS].DepartureDate))*60*60*1000) END AS DepartureDate,
                    COALESCE([SL_BaseNameFull].[BaseName],[CELERITY_ST_BOOKINGS].AreaName) AS Destination,
                    CASE WHEN [CELERITY_ST_BOOKINGS].BookingDate IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', [CELERITY_ST_BOOKINGS].BookingDate))*60*60*1000) END AS BookingDate,
                    [CELERITY_ST_BOOKINGS].ProductName,
                    CASE
                        WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1, 3, 1) = 'P' THEN 'Power'
                        WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1, 3, 1) = 'X' THEN 'Catamaran'
                        WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1, 3, 1) = 'L' THEN 'Catamaran'
                        ELSE 'Monohull'
                    END AS HullType,
                    [CELERITY_ST_BOOKINGS].UserDefinable1,
                    CLI.ClientCode,
                    DENSE_RANK() OVER(PARTITION BY CLI.ClientCode
                        ORDER BY 
                            [CELERITY_ST_BOOKINGS].BookingDate ASC,
                            [CELERITY_ST_BOOKINGS].DepartureDate DESC,
                            [CELERITY_ST_BOOKINGS].BookRef DESC, 
                            [CELERITY_ST_BOOKINGS].ConfirmDate DESC,
                            (CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,    
                            (CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromMailing WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                            (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                            (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                            (CASE WHEN CLI.[LastContactDate] = '0' THEN '' ELSE CONVERT(VARCHAR(10),CONVERT(datetime, CLI.[LastContactDate], 103),120) END) DESC,
                            (CASE WHEN CLI.DateCreated IS NULL THEN '' ELSE CONVERT(VARCHAR(10),CLI.DateCreated,120) END) DESC,
                            (CASE CLI.Blacklisted WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                            (CASE CLI.GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                            [CELERITY_ST_BOOKINGS].BookingSourcePrimary,
                            COALESCE([SL_Simplified_SalesOffice].[SalesOfficeSimplified],[CELERITY_ST_BOOKINGS].BookingOfficeLocation),
                            [CELERITY_ST_BOOKINGS].BookingLanguageFull,
                            [CELERITY_ST_BOOKINGS].ProductName,
                            [CELERITY_ST_BOOKINGS].AreaName,
                            CLI.ClientCode,
                            COALESCE([SL_Simplified_Title].[TitleSimplified],''),
                            CLI.FirstName,
                            CLI.LastName,
                            CLI.City,
                            CLI.County,
                            CLI.Postcode,
                            COALESCE([SL_Simplified_Triton_Client_Country].[CountrySimplified],CLI.Country),
                            (CASE WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1,3,1) IN ('X','L','P') THEN 'Catamaran' ELSE 'Monohull' END),
                            CLI.[Add1],
                            CLI.[Add2],
                            CLI.[Add3],
                            CLI.[Phone1],
                            CLI.[Phone2],
                            CLI.[BusinessPhone],
                            CLI.DateOfBirth,
                            [CELERITY_ST_BOOKINGS].ExecutiveReportingRegion,
                            CLI.NumberOfCharters,
                            [CELERITY_ST_BOOKINGS].Duration,
                            [CELERITY_ST_BOOKINGS].UserDefinable1,
                            CLI.CustomerLinkCode,
                            CLI.[CustomerClass],
                            CLI.ClientSourceCode,
                            [SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified]
                    ) AS RankResultFirstCharter
                FROM 
                    [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKINGS] WITH (NOLOCK)
                INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKEDPASSENGERS] WITH (NOLOCK)
                    ON [CELERITY_ST_BOOKEDPASSENGERS].BookRef=[CELERITY_ST_BOOKINGS].BookRef
                INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENT] CLI WITH (NOLOCK)
                    ON CLI.ClientCode=[CELERITY_ST_BOOKEDPASSENGERS].ClientCode
                    AND CLI.Brand = 'S'
                LEFT JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENTPREFERENCES] WITH (NOLOCK)
                    ON [CELERITY_ST_CLIENTPREFERENCES].ClientCode = CLI.ClientCode
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
                AND [CELERITY_ST_BOOKINGS].Status = 'Booking'
                AND [CELERITY_ST_BOOKINGS].BookingSourcePrimary NOT IN ('PR-Pr free trip','TAAC-Ta on account','PR-Public relations-mor','PRESS-Bericht in der press','STAFF-Staff booking','OWNS-Owner with no paymen','OS-Wot-offshore sailing','OWNER-Owner','DAYCH-Day charter discount','LOCAL-Local booking','OS-Offshore sailing','OSS-Offshore sailing','OW-Owner use','OPS-Operations/maintenan','TA','STHOL-Staff holiday','TAGEN-Travel agent','OSSFF-Staff friends & fami','LOCA2-Local booking','TO-Tour operator')
                AND [CELERITY_ST_BOOKINGS].AreaCode NOT IN ('UKD','UK1','CVO','SS1','UK2','SS2','UK3','FLT','UK4')
                AND [CELERITY_ST_BOOKINGS].ProductName IN ('SAILING_SCHOOLS','CREWED','FLOTILLA','FRANCHISE','FOOTLOOSE','BAREBOAT','CORPORATE','POWER')
                AND [CELERITY_ST_BOOKINGS].BookingType ='DIRECT'
                AND [CELERITY_ST_BOOKINGS].UserDefinable1 IS NOT NULL
                AND LTRIM(RTRIM([CELERITY_ST_BOOKINGS].UserDefinable1)) <> '' 
                AND CLI.Email1 LIKE '%_@%_.__%'
                AND CLI.Email1 not like '%[[]%' AND CLI.Email1 not like '%]%' AND CLI.Email1 not like '%(%' AND CLI.Email1 not like '%)%' AND CLI.Email1 not like '%''%' AND CLI.Email1 not like '% %'
                AND [CELERITY_ST_BOOKINGS].BookingDate >= CONVERT(date,'2010-01-01 00:00:00.000')
            ) FirstCharterInnerSelect
            WHERE RankResultFirstCharter = 1
        ) FirstCharter
        ON FirstCharter.FirstCharterClientCode = CLI.ClientCode
        LEFT JOIN
        -- Most recent cancellation records
        (
            SELECT DISTINCT
                BookRef AS CancellationBookRef,
                CancellationDate AS CancellationDate,
                ClientCode AS CancellationClientCode,
                RankResultCancellation
            FROM
            (
                SELECT
                    [CELERITY_ST_BOOKINGS].BookRef,
                    CASE WHEN [CELERITY_ST_BOOKINGS].CancelledDate IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', [CELERITY_ST_BOOKINGS].CancelledDate))*60*60*1000) END AS CancellationDate,
                    CLI.ClientCode,
                    DENSE_RANK() OVER(PARTITION BY CLI.ClientCode
                ORDER BY 
                    [CELERITY_ST_BOOKINGS].BookingDate DESC,
                    [CELERITY_ST_BOOKINGS].DepartureDate DESC,
                    [CELERITY_ST_BOOKINGS].BookRef DESC, 
                    [CELERITY_ST_BOOKINGS].ConfirmDate DESC,
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,    
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromMailing WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE WHEN CLI.[LastContactDate] = '0' THEN '' ELSE CONVERT(VARCHAR(10),CONVERT(datetime, CLI.[LastContactDate], 103),120) END) DESC,
                    (CASE WHEN CLI.DateCreated IS NULL THEN '' ELSE CONVERT(VARCHAR(10),CLI.DateCreated,120) END) DESC,
                    (CASE CLI.Blacklisted WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE CLI.GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    [CELERITY_ST_BOOKINGS].BookingSourcePrimary,
                    COALESCE([SL_Simplified_SalesOffice].[SalesOfficeSimplified],[CELERITY_ST_BOOKINGS].BookingOfficeLocation),
                    [CELERITY_ST_BOOKINGS].BookingLanguageFull,
                    [CELERITY_ST_BOOKINGS].ProductName,
                    [CELERITY_ST_BOOKINGS].AreaName,
                    CLI.ClientCode,
                    COALESCE([SL_Simplified_Title].[TitleSimplified],''),
                    CLI.FirstName,
                    CLI.LastName,
                    CLI.City,
                    CLI.County,
                    CLI.Postcode,
                    COALESCE([SL_Simplified_Triton_Client_Country].[CountrySimplified],CLI.Country),
                    (CASE WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1,3,1) IN ('X','L','P') THEN 'Catamaran' ELSE 'Monohull' END),
                    CLI.[Add1],
                    CLI.[Add2],
                    CLI.[Add3],
                    CLI.[Phone1],
                    CLI.[Phone2],
                    CLI.[BusinessPhone],
                    CLI.DateOfBirth,
                    [CELERITY_ST_BOOKINGS].ExecutiveReportingRegion,
                    CLI.NumberOfCharters,
                    [CELERITY_ST_BOOKINGS].Duration,
                    [CELERITY_ST_BOOKINGS].UserDefinable1,
                    CLI.CustomerLinkCode,
                    CLI.[CustomerClass],
                    CLI.ClientSourceCode,
                    [SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified]
                    ) AS RankResultCancellation
                FROM 
                    [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKINGS] WITH (NOLOCK)
                INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKEDPASSENGERS] WITH (NOLOCK)
                    ON [CELERITY_ST_BOOKEDPASSENGERS].BookRef=[CELERITY_ST_BOOKINGS].BookRef
                INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENT] CLI WITH (NOLOCK)
                    ON CLI.ClientCode=[CELERITY_ST_BOOKEDPASSENGERS].ClientCode
                    AND CLI.Brand = 'S'
                LEFT JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENTPREFERENCES] WITH (NOLOCK)
                    ON [CELERITY_ST_CLIENTPREFERENCES].ClientCode = CLI.ClientCode
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
                WHERE 
                    [CELERITY_ST_BOOKINGS].BrandName ='SUN'
                AND [CELERITY_ST_BOOKINGS].Status IN ('Booking','Cancelled')
                AND [CELERITY_ST_BOOKINGS].CancelledDate IS NOT NULL
                AND [CELERITY_ST_BOOKINGS].BookingSourcePrimary NOT IN ('PR-Pr free trip','TAAC-Ta on account','PR-Public relations-mor','PRESS-Bericht in der press','STAFF-Staff booking','OWNS-Owner with no paymen','OS-Wot-offshore sailing','OWNER-Owner','DAYCH-Day charter discount','LOCAL-Local booking','OS-Offshore sailing','OSS-Offshore sailing','OW-Owner use','OPS-Operations/maintenan','TA','STHOL-Staff holiday','TAGEN-Travel agent','OSSFF-Staff friends & fami','LOCA2-Local booking','TO-Tour operator')
                AND [CELERITY_ST_BOOKINGS].AreaCode NOT IN ('UKD','UK1','CVO','SS1','UK2','SS2','UK3','FLT','UK4')
                AND [CELERITY_ST_BOOKINGS].ProductName IN ('SAILING_SCHOOLS','CREWED','FLOTILLA','FRANCHISE','FOOTLOOSE','BAREBOAT','CORPORATE','POWER')
                AND [CELERITY_ST_BOOKINGS].BookingType ='DIRECT'
                AND [CELERITY_ST_BOOKINGS].UserDefinable1 IS NOT NULL
                AND LTRIM(RTRIM([CELERITY_ST_BOOKINGS].UserDefinable1)) <> '' 
                AND CLI.Email1 LIKE '%_@%_.__%'
                AND CLI.Email1 not like '%[[]%' AND CLI.Email1 not like '%]%' AND CLI.Email1 not like '%(%' AND CLI.Email1 not like '%)%' AND CLI.Email1 not like '%''%' AND CLI.Email1 not like '% %'
                --Search all bookings for most recent cancellation records
                --AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,GETDATE()-8) AND CONVERT(DATE,GETDATE()-1)
                --AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN '2017-08-03' AND '2017-09-10'
            ) CancelledBookingsInnerSelect
            WHERE RankResultCancellation = 1
        ) CancelledBookings
        ON CancelledBookings.CancellationClientCode = CLI.ClientCode
        WHERE 
            [CELERITY_ST_BOOKINGS].BrandName ='SUN'
        AND [CELERITY_ST_BOOKINGS].Status IN ('Booking','Cancelled')
        AND [CELERITY_ST_BOOKINGS].BookingSourcePrimary NOT IN ('PR-Pr free trip','TAAC-Ta on account','PR-Public relations-mor','PRESS-Bericht in der press','STAFF-Staff booking','OWNS-Owner with no paymen','OS-Wot-offshore sailing','OWNER-Owner','DAYCH-Day charter discount','LOCAL-Local booking','OS-Offshore sailing','OSS-Offshore sailing','OW-Owner use','OPS-Operations/maintenan','TA','STHOL-Staff holiday','TAGEN-Travel agent','OSSFF-Staff friends & fami','LOCA2-Local booking','TO-Tour operator')
        AND [CELERITY_ST_BOOKINGS].AreaCode NOT IN ('UKD','UK1','CVO','SS1','UK2','SS2','UK3','FLT','UK4')
        AND [CELERITY_ST_BOOKINGS].ProductName IN ('SAILING_SCHOOLS','CREWED','FLOTILLA','FRANCHISE','FOOTLOOSE','BAREBOAT','CORPORATE','POWER')
        AND [CELERITY_ST_BOOKINGS].BookingType ='DIRECT'
        AND [CELERITY_ST_BOOKINGS].UserDefinable1 IS NOT NULL
        AND LTRIM(RTRIM([CELERITY_ST_BOOKINGS].UserDefinable1)) <> '' 
        AND CLI.Email1 LIKE '%_@%_.__%'
        AND CLI.Email1 not like '%[[]%' AND CLI.Email1 not like '%]%' AND CLI.Email1 not like '%(%' AND CLI.Email1 not like '%)%' AND CLI.Email1 not like '%''%' AND CLI.Email1 not like '% %'
        AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,GETDATE()-10) AND CONVERT(DATE,GETDATE()-1)
--        AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,'2013-01-01', 120) AND CONVERT(DATE, '2013-12-31', 120)
--        AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,'2016-01-01', 120) AND CONVERT(DATE, '2016-12-31', 120)
    ) Result

    WHERE RankResultMostRecentBooking=1
    ORDER BY ConfirmDate

END


GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_TRITON_SS_BOOKINGS_8YR]    Script Date: 09/08/2018 08:16:37 ******/
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
--========================================================================================================================

CREATE PROC [dbo].[BUILD_HUBSPOT_TRITON_SS_BOOKINGS_8YR]
AS
BEGIN
    SELECT DISTINCT 
         LifecycleStage
        ,BrandName
        ,ConfirmDate
        ,BookingSourcePrimary
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
        ,BookingProductName
        ,BookingDateBooked
        ,BookingDepartureDate
        ,BookingDestination
        ,BookingHullType
        ,Address1
        ,Address2
        ,Address3
        ,Phone1
        ,Phone2
        ,BusinessPhone
        ,DateOfBirth
        ,BookingExecutiveReportingRegion
--        ,NumberOfCharters
        ,Duration
        ,BookingBoat
        ,BookingBookRef
        ,CustomerLinkCode
        ,CustomerClass
        ,GoneAway
        ,ClientSourceCode
        ,[Status]
        ,ClientBookingOffice
        ,CancelFromTelephone
--        ,Notes
        ,LastContactDate
        ,BookingCancellationDate
        ,CancellationCancellationDate
        ,CancellationBookRef
        ,FirstCharterDepartureDate
        ,FirstCharterDestination
        ,FirstCharterDateBooked
        ,FirstCharterProduct
        ,FirstCharterHullType
        ,FirstCharterBoat
        ,NumberOfBookings
        ,TritonCreateDate
        ,BookingSourceSecondary
        ,BookingSourceTertiary
        ,BookingSalesAgent
        ,CleanClientID
        ,BookingCleanBookRef
        ,BookingTotalPax
        ,BookingStatus
    FROM 
    (
        SELECT
            'customer' AS LifecycleStage,
            'Sunsail' AS BrandName,
            CASE WHEN [CELERITY_ST_BOOKINGS].ConfirmDate IS NULL THEN '' ELSE CONVERT(VARCHAR(10),[CELERITY_ST_BOOKINGS].ConfirmDate,120) END AS ConfirmDate,
            [CELERITY_ST_BOOKINGS].BookingSourcePrimary,
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
            CLI.Email1 AS Email,
            CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromMailing WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromMailing,
            CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromEmail,
            CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromBrochure,
            CLI.Deceased,
            CASE CLI.Blacklisted WHEN 'Y' THEN 'Y' ELSE 'N' END AS Blacklisted,
            [CELERITY_ST_BOOKINGS].ProductName AS BookingProductName,
            CASE WHEN [CELERITY_ST_BOOKINGS].BookingDate IS NULL THEN '' ELSE CONVERT(VARCHAR(10),[CELERITY_ST_BOOKINGS].BookingDate,120) END AS BookingDateBooked,
            CASE WHEN [CELERITY_ST_BOOKINGS].DepartureDate IS NULL THEN '' ELSE CONVERT(VARCHAR(10),[CELERITY_ST_BOOKINGS].DepartureDate,120) END AS BookingDepartureDate,
            COALESCE([SL_BaseNameFull].[BaseName],[CELERITY_ST_BOOKINGS].AreaName) AS BookingDestination,
            CASE WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1,3,1) IN ('X','L','P') THEN 'Catamaran' ELSE 'Monohull' END AS BookingHullType, 
            COALESCE(CLI.[Add1],'') AS Address1,
            COALESCE(CLI.[Add2],'') AS Address2,
            COALESCE(CLI.[Add3],'') AS Address3,
            COALESCE(CLI.[Phone1],'') AS Phone1,
            COALESCE(CLI.[Phone2],'') AS Phone2,
            COALESCE(CLI.[BusinessPhone],'') AS BusinessPhone,
            CASE WHEN CLI.DateOfBirth IS NULL THEN '' ELSE CONVERT(VARCHAR(10),CLI.DateOfBirth,120) END AS DateOfBirth,
            COALESCE([CELERITY_ST_BOOKINGS].ExecutiveReportingRegion,'') AS BookingExecutiveReportingRegion,
            COALESCE(CLI.NumberOfCharters,'') AS NumberOfCharters,
            COALESCE([CELERITY_ST_BOOKINGS].Duration,'') AS Duration,
            --COALESCE([CELERITY_ST_BOOKINGS].CleanBaseName,'') AS CleanBaseName,--Ignore for now
            --COALESCE([CELERITY_ST_BOOKINGS].CleanBoatName,'') AS CleanBoatName,--Ignore for now
            COALESCE([CELERITY_ST_BOOKINGS].UserDefinable1,'') AS BookingBoat,
            COALESCE([CELERITY_ST_BOOKINGS].BookRef,'') AS BookingBookRef,
            COALESCE(CLI.CustomerLinkCode,'') AS CustomerLinkCode,
            COALESCE(CLI.[CustomerClass],'') AS CustomerClass,
            CASE CLI.GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END AS GoneAway,
            COALESCE(CLI.ClientSourceCode,'') AS ClientSourceCode,
            'Booking' AS [Status], 
            COALESCE([SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified],'') AS ClientBookingOffice,
            DENSE_RANK() OVER(PARTITION BY CLI.Email1 
                ORDER BY 
                    [CELERITY_ST_BOOKINGS].BookingDate DESC,
                    [CELERITY_ST_BOOKINGS].DepartureDate DESC,
                    [CELERITY_ST_BOOKINGS].BookRef DESC, 
                    [CELERITY_ST_BOOKINGS].ConfirmDate DESC,
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,    
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromMailing WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE WHEN CLI.[LastContactDate] = '0' THEN '' ELSE CONVERT(VARCHAR(10),CONVERT(datetime, CLI.[LastContactDate], 103),120) END) DESC,
                    (CASE WHEN CLI.DateCreated IS NULL THEN '' ELSE CONVERT(VARCHAR(10),CLI.DateCreated,120) END) DESC,
                    (CASE CLI.Blacklisted WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE CLI.GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    [CELERITY_ST_BOOKINGS].BookingSourcePrimary,
                    COALESCE([SL_Simplified_SalesOffice].[SalesOfficeSimplified],[CELERITY_ST_BOOKINGS].BookingOfficeLocation),
                    [CELERITY_ST_BOOKINGS].BookingLanguageFull,
                    [CELERITY_ST_BOOKINGS].ProductName,
                    [CELERITY_ST_BOOKINGS].AreaName,
                    CLI.ClientCode,
                    COALESCE([SL_Simplified_Title].[TitleSimplified],''),
                    CLI.FirstName,
                    CLI.LastName,
                    CLI.City,
                    CLI.County,
                    CLI.Postcode,
                    COALESCE([SL_Simplified_Triton_Client_Country].[CountrySimplified],CLI.Country),
                    (CASE WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1,3,1) IN ('X','L','P') THEN 'Catamaran' ELSE 'Monohull' END),
                    CLI.[Add1],
                    CLI.[Add2],
                    CLI.[Add3],
                    CLI.[Phone1],
                    CLI.[Phone2],
                    CLI.[BusinessPhone],
                    CLI.DateOfBirth,
                    [CELERITY_ST_BOOKINGS].ExecutiveReportingRegion,
                    CLI.NumberOfCharters,
                    [CELERITY_ST_BOOKINGS].Duration,
                    [CELERITY_ST_BOOKINGS].UserDefinable1,
                    CLI.CustomerLinkCode,
                    CLI.[CustomerClass],
                    CLI.ClientSourceCode,
                    [SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified]
            ) AS RankResultMostRecentBooking,
            RankResultFirstCharter,

            -- DWYT-16 New HubSpot API fields
            CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromTelephone,
            '' AS Notes,
            CASE WHEN CLI.[LastContactDate] = '0' THEN '' ELSE CONVERT(VARCHAR(10),CONVERT(datetime, CLI.[LastContactDate], 103),120) END AS LastContactDate,
            CASE WHEN [CELERITY_ST_BOOKINGS].CancelledDate IS NULL THEN '' ELSE CONVERT(VARCHAR(10),[CELERITY_ST_BOOKINGS].CancelledDate,120) END AS BookingCancellationDate,
            COALESCE(CancelledBookings.CancellationDate, '') AS CancellationCancellationDate,
            COALESCE(CancelledBookings.CancellationBookRef, '') AS CancellationBookRef,
            COALESCE(FirstCharter.FirstCharterDepartureDate, '') AS FirstCharterDepartureDate,
            COALESCE(FirstCharter.FirstCharterDestination, '') AS FirstCharterDestination,
            COALESCE(FirstCharter.FirstCharterDateBooked, '') AS FirstCharterDateBooked,
            COALESCE(FirstCharter.FirstCharterProduct, '') AS FirstCharterProduct,
            COALESCE(FirstCharter.FirstCharterHullType, '') AS FirstCharterHullType,
            COALESCE(FirstCharter.FirstCharterBoat,'') AS FirstCharterBoat,
            (SELECT COUNT(*) FROM [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKINGS] WITH (NOLOCK)
                INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKEDPASSENGERS] WITH (NOLOCK)
                ON [CELERITY_ST_BOOKEDPASSENGERS].BookRef=[CELERITY_ST_BOOKINGS].BookRef
                INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENT] WITH (NOLOCK)
                ON [CELERITY_ST_BOOKEDPASSENGERS].ClientCode = [CELERITY_ST_CLIENT].ClientCode
                WHERE [CELERITY_ST_CLIENT].ClientCode = CLI.ClientCode
                AND [CELERITY_ST_BOOKINGS].BrandName ='SUN'
                AND [CELERITY_ST_BOOKINGS].[Status] = 'Booking'
            ) AS NumberOfBookings,
            CASE WHEN CLI.DateCreated IS NULL THEN '' ELSE CONVERT(VARCHAR(10),CLI.DateCreated,120) END AS TritonCreateDate,
            COALESCE([CELERITY_ST_BOOKINGS].BookingSourceSecondary,'') AS BookingSourceSecondary,
            '' AS BookingSourceTertiary,
            COALESCE([CELERITY_ST_BOOKINGS].AgentCode,'') AS BookingSalesAgent,
            COALESCE(REPLACE(REPLACE(REPLACE(CLI.ClientCode, 'TRT-M',''), 'TRT-S', ''), 'TRT-', ''), '') AS CleanClientID,
            COALESCE(REPLACE(REPLACE(REPLACE([CELERITY_ST_BOOKINGS].BookRef, 'TRT-M', ''), 'TRT-S', ''), 'TRT-', ''),'') AS BookingCleanBookRef,
            COALESCE([CELERITY_ST_BOOKINGS].[TotalPax],0) AS BookingTotalPax,
            COALESCE(REPLACE([CELERITY_ST_BOOKINGS].[Status], 'Booking', 'Confirmed'),'') AS BookingStatus
            
        FROM 
            [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKINGS] WITH (NOLOCK)
        INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKEDPASSENGERS] WITH (NOLOCK)
            ON [CELERITY_ST_BOOKEDPASSENGERS].BookRef=[CELERITY_ST_BOOKINGS].BookRef
        INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENT] CLI WITH (NOLOCK)
            ON CLI.ClientCode=[CELERITY_ST_BOOKEDPASSENGERS].ClientCode
            AND CLI.Brand = 'S'
        LEFT JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENTPREFERENCES] WITH (NOLOCK)
            ON [CELERITY_ST_CLIENTPREFERENCES].ClientCode = CLI.ClientCode
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
        LEFT JOIN
        -- First Charter records
        (
            SELECT DISTINCT
                BookRef AS FirstCharterBookRef,
                DepartureDate AS FirstCharterDepartureDate,
                Destination AS FirstCharterDestination,
                BookingDate AS FirstCharterDateBooked,
                ProductName AS FirstCharterProduct,
                HullType AS FirstCharterHullType,
                UserDefinable1 AS FirstCharterBoat,
                ClientCode AS FirstCharterClientCode,
                RankResultFirstCharter
            FROM
            (
                SELECT
                    [CELERITY_ST_BOOKINGS].BookRef,
                    CASE WHEN [CELERITY_ST_BOOKINGS].DepartureDate IS NULL THEN '' ELSE CONVERT(VARCHAR(10),[CELERITY_ST_BOOKINGS].DepartureDate,120) END AS DepartureDate,
                    COALESCE([SL_BaseNameFull].[BaseName],[CELERITY_ST_BOOKINGS].AreaName) AS Destination,
                    CASE WHEN [CELERITY_ST_BOOKINGS].BookingDate IS NULL THEN '' ELSE CONVERT(VARCHAR(10),[CELERITY_ST_BOOKINGS].BookingDate,120) END AS BookingDate,
                    [CELERITY_ST_BOOKINGS].ProductName,
                    CASE
                        WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1, 3, 1) = 'P' THEN 'Power'
                        WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1, 3, 1) = 'X' THEN 'Catamaran'
                        WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1, 3, 1) = 'L' THEN 'Catamaran'
                        ELSE 'Monohull'
                    END AS HullType,
                    [CELERITY_ST_BOOKINGS].UserDefinable1,
                    CLI.ClientCode,
                    DENSE_RANK() OVER(PARTITION BY CLI.ClientCode
                        ORDER BY 
                            [CELERITY_ST_BOOKINGS].BookingDate ASC,
                            [CELERITY_ST_BOOKINGS].DepartureDate DESC,
                            [CELERITY_ST_BOOKINGS].BookRef DESC, 
                            [CELERITY_ST_BOOKINGS].ConfirmDate DESC,
                            (CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,    
                            (CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromMailing WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                            (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                            (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                            (CASE WHEN CLI.[LastContactDate] = '0' THEN '' ELSE CONVERT(VARCHAR(10),CONVERT(datetime, CLI.[LastContactDate], 103),120) END) DESC,
                            (CASE WHEN CLI.DateCreated IS NULL THEN '' ELSE CONVERT(VARCHAR(10),CLI.DateCreated,120) END) DESC,
                            (CASE CLI.Blacklisted WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                            (CASE CLI.GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                            [CELERITY_ST_BOOKINGS].BookingSourcePrimary,
                            COALESCE([SL_Simplified_SalesOffice].[SalesOfficeSimplified],[CELERITY_ST_BOOKINGS].BookingOfficeLocation),
                            [CELERITY_ST_BOOKINGS].BookingLanguageFull,
                            [CELERITY_ST_BOOKINGS].ProductName,
                            [CELERITY_ST_BOOKINGS].AreaName,
                            CLI.ClientCode,
                            COALESCE([SL_Simplified_Title].[TitleSimplified],''),
                            CLI.FirstName,
                            CLI.LastName,
                            CLI.City,
                            CLI.County,
                            CLI.Postcode,
                            COALESCE([SL_Simplified_Triton_Client_Country].[CountrySimplified],CLI.Country),
                            (CASE WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1,3,1) IN ('X','L','P') THEN 'Catamaran' ELSE 'Monohull' END),
                            CLI.[Add1],
                            CLI.[Add2],
                            CLI.[Add3],
                            CLI.[Phone1],
                            CLI.[Phone2],
                            CLI.[BusinessPhone],
                            CLI.DateOfBirth,
                            [CELERITY_ST_BOOKINGS].ExecutiveReportingRegion,
                            CLI.NumberOfCharters,
                            [CELERITY_ST_BOOKINGS].Duration,
                            [CELERITY_ST_BOOKINGS].UserDefinable1,
                            CLI.CustomerLinkCode,
                            CLI.[CustomerClass],
                            CLI.ClientSourceCode,
                            [SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified]
                    ) AS RankResultFirstCharter
                FROM 
                    [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKINGS] WITH (NOLOCK)
                INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKEDPASSENGERS] WITH (NOLOCK)
                    ON [CELERITY_ST_BOOKEDPASSENGERS].BookRef=[CELERITY_ST_BOOKINGS].BookRef
                INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENT] CLI WITH (NOLOCK)
                    ON CLI.ClientCode=[CELERITY_ST_BOOKEDPASSENGERS].ClientCode
                    AND CLI.Brand = 'S'
                LEFT JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENTPREFERENCES] WITH (NOLOCK)
                    ON [CELERITY_ST_CLIENTPREFERENCES].ClientCode = CLI.ClientCode
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
                AND [CELERITY_ST_BOOKINGS].Status = 'Booking'
                AND [CELERITY_ST_BOOKINGS].BookingSourcePrimary NOT IN ('PR-Pr free trip','TAAC-Ta on account','PR-Public relations-mor','PRESS-Bericht in der press','STAFF-Staff booking','OWNS-Owner with no paymen','OS-Wot-offshore sailing','OWNER-Owner','DAYCH-Day charter discount','LOCAL-Local booking','OS-Offshore sailing','OSS-Offshore sailing','OW-Owner use','OPS-Operations/maintenan','TA','STHOL-Staff holiday','TAGEN-Travel agent','OSSFF-Staff friends & fami','LOCA2-Local booking','TO-Tour operator')
                AND [CELERITY_ST_BOOKINGS].AreaCode NOT IN ('UKD','UK1','CVO','SS1','UK2','SS2','UK3','FLT','UK4')
                AND [CELERITY_ST_BOOKINGS].ProductName IN ('SAILING_SCHOOLS','CREWED','FLOTILLA','FRANCHISE','FOOTLOOSE','BAREBOAT','CORPORATE','POWER')
                AND [CELERITY_ST_BOOKINGS].BookingType ='DIRECT'
                AND [CELERITY_ST_BOOKINGS].UserDefinable1 IS NOT NULL
                AND LTRIM(RTRIM([CELERITY_ST_BOOKINGS].UserDefinable1)) <> '' 
                AND CLI.Email1 LIKE '%_@%_.__%'
                AND CLI.Email1 not like '%[[]%' AND CLI.Email1 not like '%]%' AND CLI.Email1 not like '%(%' AND CLI.Email1 not like '%)%' AND CLI.Email1 not like '%''%' AND CLI.Email1 not like '% %'
                AND [CELERITY_ST_BOOKINGS].BookingDate >= CONVERT(date,'2010-01-01 00:00:00.000')
            ) FirstCharterInnerSelect
            WHERE RankResultFirstCharter = 1
        ) FirstCharter
        ON FirstCharter.FirstCharterClientCode = CLI.ClientCode
        LEFT JOIN
        -- Most recent cancellation records
        (
            SELECT DISTINCT
                BookRef AS CancellationBookRef,
                CancellationDate AS CancellationDate,
                ClientCode AS CancellationClientCode,
                RankResultCancellation
            FROM
            (
                SELECT
                    [CELERITY_ST_BOOKINGS].BookRef,
                    CASE WHEN [CELERITY_ST_BOOKINGS].CancelledDate IS NULL THEN '' ELSE CONVERT(VARCHAR(10),[CELERITY_ST_BOOKINGS].CancelledDate,120) END AS CancellationDate,
                    CLI.ClientCode,
                    DENSE_RANK() OVER(PARTITION BY CLI.ClientCode
                ORDER BY 
                    [CELERITY_ST_BOOKINGS].BookingDate DESC,
                    [CELERITY_ST_BOOKINGS].DepartureDate DESC,
                    [CELERITY_ST_BOOKINGS].BookRef DESC, 
                    [CELERITY_ST_BOOKINGS].ConfirmDate DESC,
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,    
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromMailing WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE WHEN CLI.[LastContactDate] = '0' THEN '' ELSE CONVERT(VARCHAR(10),CONVERT(datetime, CLI.[LastContactDate], 103),120) END) DESC,
                    (CASE WHEN CLI.DateCreated IS NULL THEN '' ELSE CONVERT(VARCHAR(10),CLI.DateCreated,120) END) DESC,
                    (CASE CLI.Blacklisted WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE CLI.GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    [CELERITY_ST_BOOKINGS].BookingSourcePrimary,
                    COALESCE([SL_Simplified_SalesOffice].[SalesOfficeSimplified],[CELERITY_ST_BOOKINGS].BookingOfficeLocation),
                    [CELERITY_ST_BOOKINGS].BookingLanguageFull,
                    [CELERITY_ST_BOOKINGS].ProductName,
                    [CELERITY_ST_BOOKINGS].AreaName,
                    CLI.ClientCode,
                    COALESCE([SL_Simplified_Title].[TitleSimplified],''),
                    CLI.FirstName,
                    CLI.LastName,
                    CLI.City,
                    CLI.County,
                    CLI.Postcode,
                    COALESCE([SL_Simplified_Triton_Client_Country].[CountrySimplified],CLI.Country),
                    (CASE WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1,3,1) IN ('X','L','P') THEN 'Catamaran' ELSE 'Monohull' END),
                    CLI.[Add1],
                    CLI.[Add2],
                    CLI.[Add3],
                    CLI.[Phone1],
                    CLI.[Phone2],
                    CLI.[BusinessPhone],
                    CLI.DateOfBirth,
                    [CELERITY_ST_BOOKINGS].ExecutiveReportingRegion,
                    CLI.NumberOfCharters,
                    [CELERITY_ST_BOOKINGS].Duration,
                    [CELERITY_ST_BOOKINGS].UserDefinable1,
                    CLI.CustomerLinkCode,
                    CLI.[CustomerClass],
                    CLI.ClientSourceCode,
                    [SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified]
                    ) AS RankResultCancellation
                FROM 
                    [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKINGS] WITH (NOLOCK)
                INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKEDPASSENGERS] WITH (NOLOCK)
                    ON [CELERITY_ST_BOOKEDPASSENGERS].BookRef=[CELERITY_ST_BOOKINGS].BookRef
                INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENT] CLI WITH (NOLOCK)
                    ON CLI.ClientCode=[CELERITY_ST_BOOKEDPASSENGERS].ClientCode
                    AND CLI.Brand = 'S'
                LEFT JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENTPREFERENCES] WITH (NOLOCK)
                    ON [CELERITY_ST_CLIENTPREFERENCES].ClientCode = CLI.ClientCode
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
                WHERE 
                    [CELERITY_ST_BOOKINGS].BrandName ='SUN'
                AND [CELERITY_ST_BOOKINGS].Status IN ('Booking','Cancelled')
                AND [CELERITY_ST_BOOKINGS].CancelledDate IS NOT NULL
                AND [CELERITY_ST_BOOKINGS].BookingSourcePrimary NOT IN ('PR-Pr free trip','TAAC-Ta on account','PR-Public relations-mor','PRESS-Bericht in der press','STAFF-Staff booking','OWNS-Owner with no paymen','OS-Wot-offshore sailing','OWNER-Owner','DAYCH-Day charter discount','LOCAL-Local booking','OS-Offshore sailing','OSS-Offshore sailing','OW-Owner use','OPS-Operations/maintenan','TA','STHOL-Staff holiday','TAGEN-Travel agent','OSSFF-Staff friends & fami','LOCA2-Local booking','TO-Tour operator')
                AND [CELERITY_ST_BOOKINGS].AreaCode NOT IN ('UKD','UK1','CVO','SS1','UK2','SS2','UK3','FLT','UK4')
                AND [CELERITY_ST_BOOKINGS].ProductName IN ('SAILING_SCHOOLS','CREWED','FLOTILLA','FRANCHISE','FOOTLOOSE','BAREBOAT','CORPORATE','POWER')
                AND [CELERITY_ST_BOOKINGS].BookingType ='DIRECT'
                AND [CELERITY_ST_BOOKINGS].UserDefinable1 IS NOT NULL
                AND LTRIM(RTRIM([CELERITY_ST_BOOKINGS].UserDefinable1)) <> '' 
                AND CLI.Email1 LIKE '%_@%_.__%'
                AND CLI.Email1 not like '%[[]%' AND CLI.Email1 not like '%]%' AND CLI.Email1 not like '%(%' AND CLI.Email1 not like '%)%' AND CLI.Email1 not like '%''%' AND CLI.Email1 not like '% %'
                --Search all bookings for most recent cancellation records
                --AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,GETDATE()-8) AND CONVERT(DATE,GETDATE()-1)
                --AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN '2017-08-03' AND '2017-09-10'
            ) CancelledBookingsInnerSelect
            WHERE RankResultCancellation = 1
        ) CancelledBookings
        ON CancelledBookings.CancellationClientCode = CLI.ClientCode
        WHERE 
            [CELERITY_ST_BOOKINGS].BrandName ='SUN'
        AND [CELERITY_ST_BOOKINGS].Status IN ('Booking','Cancelled')
        AND [CELERITY_ST_BOOKINGS].BookingSourcePrimary NOT IN ('PR-Pr free trip','TAAC-Ta on account','PR-Public relations-mor','PRESS-Bericht in der press','STAFF-Staff booking','OWNS-Owner with no paymen','OS-Wot-offshore sailing','OWNER-Owner','DAYCH-Day charter discount','LOCAL-Local booking','OS-Offshore sailing','OSS-Offshore sailing','OW-Owner use','OPS-Operations/maintenan','TA','STHOL-Staff holiday','TAGEN-Travel agent','OSSFF-Staff friends & fami','LOCA2-Local booking','TO-Tour operator')
        AND [CELERITY_ST_BOOKINGS].AreaCode NOT IN ('UKD','UK1','CVO','SS1','UK2','SS2','UK3','FLT','UK4')
        AND [CELERITY_ST_BOOKINGS].ProductName IN ('SAILING_SCHOOLS','CREWED','FLOTILLA','FRANCHISE','FOOTLOOSE','BAREBOAT','CORPORATE','POWER')
        AND [CELERITY_ST_BOOKINGS].BookingType ='DIRECT'
        AND [CELERITY_ST_BOOKINGS].UserDefinable1 IS NOT NULL
        AND LTRIM(RTRIM([CELERITY_ST_BOOKINGS].UserDefinable1)) <> '' 
        AND CLI.Email1 LIKE '%_@%_.__%'
        AND CLI.Email1 not like '%[[]%' AND CLI.Email1 not like '%]%' AND CLI.Email1 not like '%(%' AND CLI.Email1 not like '%)%' AND CLI.Email1 not like '%''%' AND CLI.Email1 not like '% %'
        AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,'2010-01-01', 120) AND CONVERT(DATE,GETDATE()-1)
--        AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,GETDATE()-10) AND CONVERT(DATE,GETDATE()-1)
--        AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,'2013-01-01', 120) AND CONVERT(DATE, '2013-12-31', 120)
--        AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,'2016-01-01', 120) AND CONVERT(DATE, '2016-12-31', 120)
    ) Result

    WHERE RankResultMostRecentBooking=1
    ORDER BY ConfirmDate

END


GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_TRITON_SS_BROCHURE_REQUESTS]    Script Date: 09/08/2018 08:16:37 ******/
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
-- 21-May-2018      1.6         Tim Wilson         Corrections for dedupe logic
--========================================================================================================================

CREATE PROC [dbo].[BUILD_HUBSPOT_TRITON_SS_BROCHURE_REQUESTS]
AS
BEGIN
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
            [CELERITY_ST_CLIENT].[FirstName],
            [CELERITY_ST_CLIENT].[LastName],
            [CELERITY_ST_CLIENT].[City],
            [CELERITY_ST_CLIENT].[County],
            [CELERITY_ST_CLIENT].[Postcode],
            COALESCE([SL_Simplified_Triton_Client_Country].[CountrySimplified],[CELERITY_ST_CLIENT].Country,'') AS Country,
            [CELERITY_ST_CLIENT].[Email1] AS Email,
            CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromMailing WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromMailing,
            CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromEmail,
            CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromBrochure,
            [CELERITY_ST_CLIENT].[Deceased],
            CASE [CELERITY_ST_CLIENT].Blacklisted WHEN 'Y' THEN 'Y' ELSE 'N' END AS Blacklisted,
            COALESCE([SL_Simplified_BrochureName].[BrochureNameSimplified],[CELERITY_ST_BROCHUREREQUEST].[BrochureName],'') AS BrochureProductRequested,
            CASE WHEN [CELERITY_ST_BROCHUREREQUEST].[DateRequested] IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', [CELERITY_ST_BROCHUREREQUEST].[DateRequested]))*60*60*1000) END AS BrochureDateRequested,
            COALESCE([CELERITY_ST_CLIENT].[Add1],'') AS Address1,
            COALESCE([CELERITY_ST_CLIENT].[Add2],'') AS Address2,
            COALESCE([CELERITY_ST_CLIENT].[Add3],'') AS Address3,
            COALESCE([CELERITY_ST_CLIENT].[Phone1],'') AS Phone1,
            COALESCE([CELERITY_ST_CLIENT].[Phone2],'') AS Phone2,
            COALESCE([CELERITY_ST_CLIENT].[BusinessPhone],'') AS BusinessPhone,
            CASE WHEN [CELERITY_ST_CLIENT].DateOfBirth IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', [CELERITY_ST_CLIENT].DateOfBirth))*60*60*1000) END AS DateOfBirth,
            COALESCE([CELERITY_ST_CLIENT].CustomerLinkCode,'') AS CustomerLinkCode,
            COALESCE([CELERITY_ST_CLIENT].[CustomerClass],'') AS CustomerClass,
            CASE [CELERITY_ST_CLIENT].GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END AS GoneAway,
            COALESCE(CELERITY_ST_CLIENT.ClientSourceCode,'') AS ClientSourceCode,
            'Brochure' AS Status,  
            COALESCE([SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified],'') AS ClientBookingOffice,
            DENSE_RANK() OVER(PARTITION BY [CELERITY_ST_CLIENT].[Email1] 
            ORDER BY 
                [CELERITY_ST_BROCHUREREQUEST].[DateRequested] DESC,
                (CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,    
                (CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromMailing WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                (CASE WHEN [CELERITY_ST_CLIENT].[LastContactDate] = '0' OR [CELERITY_ST_CLIENT].[LastContactDate] IS NULL THEN '' ELSE CONVERT(VARCHAR(10),CONVERT(datetime, [CELERITY_ST_CLIENT].[LastContactDate], 103),120) END) DESC,
                (CASE WHEN [CELERITY_ST_CLIENT].DateCreated IS NULL THEN '' ELSE CONVERT(VARCHAR(10),[CELERITY_ST_CLIENT].DateCreated,120) END) Desc,
                (CASE [CELERITY_ST_CLIENT].Blacklisted WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                (CASE [CELERITY_ST_CLIENT].GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                CELERITY_ST_CLIENT.ClientCode DESC,
                COALESCE([SL_Simplified_SalesOffice].[SalesOfficeSimplified],[CELERITY_ST_BROCHUREREQUEST].[Location]),
                COALESCE([SL_Simplified_Title].[TitleSimplified],''),
                [CELERITY_ST_CLIENT].[FirstName],
                [CELERITY_ST_CLIENT].[LastName], 
                [CELERITY_ST_CLIENT].[City],
                [CELERITY_ST_CLIENT].[County],
                [CELERITY_ST_CLIENT].[Postcode],
                COALESCE([SL_Simplified_Triton_Client_Country].[CountrySimplified],[CELERITY_ST_CLIENT].Country),
                COALESCE([SL_Simplified_BrochureName].[BrochureNameSimplified],[CELERITY_ST_BROCHUREREQUEST].[BrochureName]),
                [CELERITY_ST_CLIENT].[Add1],
                [CELERITY_ST_CLIENT].[Add2],
                [CELERITY_ST_CLIENT].[Add3],
                [CELERITY_ST_CLIENT].[Phone1],
                [CELERITY_ST_CLIENT].[Phone2],
                [CELERITY_ST_CLIENT].[BusinessPhone],
                [CELERITY_ST_CLIENT].DateOfBirth,
                [CELERITY_ST_CLIENT].CustomerLinkCode,
                [CELERITY_ST_CLIENT].[CustomerClass],
                CELERITY_ST_CLIENT.ClientSourceCode,
                [SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified]
            ) AS RankResult,

            -- DWYT-16 New HubSpot API fields
            CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromTelephone,
            CASE WHEN [CELERITY_ST_CLIENT].[LastContactDate] = '0' OR [CELERITY_ST_CLIENT].[LastContactDate] IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', CONVERT(datetime, [CELERITY_ST_CLIENT].[LastContactDate], 103)))*60*60*1000) END AS LastContactDate,
            CASE WHEN [CELERITY_ST_CLIENT].DateCreated IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', [CELERITY_ST_CLIENT].DateCreated))*60*60*1000) END AS TritonCreateDate,
            COALESCE(REPLACE(REPLACE(REPLACE([CELERITY_ST_CLIENT].ClientCode, 'TRT-M',''), 'TRT-S', ''), 'TRT-', ''), '') AS CleanClientID

        FROM
            [CelerityMarine_Stage].[dbo].[CELERITY_ST_BROCHUREREQUEST] WITH (NOLOCK)
        INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENT] WITH (NOLOCK)
            ON [CELERITY_ST_CLIENT].ClientCode=[CELERITY_ST_BROCHUREREQUEST].ClientCode
            AND [CELERITY_ST_CLIENT].Brand = 'S'
        INNER JOIN [HUBSPOT].[dbo].[SL_Simplified_BrochureName] WITH (NOLOCK)
            ON [SL_Simplified_BrochureName].[BrochureNameActual]=[CELERITY_ST_BROCHUREREQUEST].[BrochureName] AND [SL_Simplified_BrochureName].[BrandName]='SUN'
        LEFT JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENTPREFERENCES] WITH (NOLOCK)
            ON [CELERITY_ST_CLIENTPREFERENCES].ClientCode=[CELERITY_ST_CLIENT].ClientCode
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_SalesOffice] WITH (NOLOCK)
            ON [SL_Simplified_SalesOffice].BrandName ='SUN' AND [SL_Simplified_SalesOffice].[SalesOfficeFromRawData]=[CELERITY_ST_BROCHUREREQUEST].[Location]
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Triton_Client_Country] WITH (NOLOCK)
            ON [SL_Simplified_Triton_Client_Country].[CountryActual]=[CELERITY_ST_CLIENT].Country
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Title] WITH (NOLOCK)
            ON [SL_Simplified_Title].[TitleActual]=[CELERITY_ST_CLIENT].Title
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_ClientBookingOffice] WITH (NOLOCK)
            ON [SL_Simplified_ClientBookingOffice].[ClientBookingOfficeActual]=[CELERITY_ST_CLIENT].BookingOffice
        WHERE
            [CELERITY_ST_BROCHUREREQUEST].[DateRequested] BETWEEN CONVERT(DATE,GETDATE()-10) AND CONVERT(DATE,GETDATE()-1)
--      AND [CELERITY_ST_BROCHUREREQUEST].[DateRequested] BETWEEN CONVERT(DATE,'2013-01-01', 120) AND CONVERT(DATE, '2013-12-31', 120)
--        AND [CELERITY_ST_BROCHUREREQUEST].[DateRequested] BETWEEN CONVERT(DATE,'2016-01-01', 120) AND CONVERT(DATE, '2016-12-31', 120)
        AND [CELERITY_ST_CLIENT].Email1 LIKE '%_@%_.__%'
        AND [CELERITY_ST_CLIENT].Email1 not like '%[[]%' AND [CELERITY_ST_CLIENT].Email1 not like '%]%' AND [CELERITY_ST_CLIENT].Email1 not like '%(%' AND [CELERITY_ST_CLIENT].Email1 not like '%)%' AND [CELERITY_ST_CLIENT].Email1 not like '%''%' AND [CELERITY_ST_CLIENT].Email1 not like '% %'
    )Result
    Where 
        RankResult=1
    ORDER BY 
        BrochureDateRequested  DESC
END


GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_TRITON_SS_BROCHURE_REQUESTS_8YR]    Script Date: 09/08/2018 08:16:37 ******/
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
--========================================================================================================================

CREATE PROC [dbo].[BUILD_HUBSPOT_TRITON_SS_BROCHURE_REQUESTS_8YR]
AS
BEGIN
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
            [CELERITY_ST_CLIENT].[FirstName],
            [CELERITY_ST_CLIENT].[LastName],
            [CELERITY_ST_CLIENT].[City],
            [CELERITY_ST_CLIENT].[County],
            [CELERITY_ST_CLIENT].[Postcode],
            COALESCE([SL_Simplified_Triton_Client_Country].[CountrySimplified],[CELERITY_ST_CLIENT].Country,'') AS Country,
            [CELERITY_ST_CLIENT].[Email1] AS Email,
            CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromMailing WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromMailing,
            CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromEmail,
            CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromBrochure,
            [CELERITY_ST_CLIENT].[Deceased],
            CASE [CELERITY_ST_CLIENT].Blacklisted WHEN 'Y' THEN 'Y' ELSE 'N' END AS Blacklisted,
            COALESCE([SL_Simplified_BrochureName].[BrochureNameSimplified],[CELERITY_ST_BROCHUREREQUEST].[BrochureName],'') AS BrochureProductRequested,
            CASE WHEN [CELERITY_ST_BROCHUREREQUEST].[DateRequested] IS NULL THEN '' ELSE CONVERT(VARCHAR(10),[CELERITY_ST_BROCHUREREQUEST].[DateRequested],120) END AS BrochureDateRequested,
            COALESCE([CELERITY_ST_CLIENT].[Add1],'') AS Address1,
            COALESCE([CELERITY_ST_CLIENT].[Add2],'') AS Address2,
            COALESCE([CELERITY_ST_CLIENT].[Add3],'') AS Address3,
            COALESCE([CELERITY_ST_CLIENT].[Phone1],'') AS Phone1,
            COALESCE([CELERITY_ST_CLIENT].[Phone2],'') AS Phone2,
            COALESCE([CELERITY_ST_CLIENT].[BusinessPhone],'') AS BusinessPhone,
            CASE WHEN [CELERITY_ST_CLIENT].DateOfBirth IS NULL THEN '' ELSE CONVERT(VARCHAR(10),[CELERITY_ST_CLIENT].DateOfBirth,120) END AS DateOfBirth,
            COALESCE([CELERITY_ST_CLIENT].CustomerLinkCode,'') AS CustomerLinkCode,
            COALESCE([CELERITY_ST_CLIENT].[CustomerClass],'') AS CustomerClass,
            CASE [CELERITY_ST_CLIENT].GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END AS GoneAway,
            COALESCE(CELERITY_ST_CLIENT.ClientSourceCode,'') AS ClientSourceCode,
            'Brochure' AS Status,  
            COALESCE([SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified],'') AS ClientBookingOffice,
            DENSE_RANK() OVER(PARTITION BY [CELERITY_ST_CLIENT].[Email1] 
            ORDER BY 
                [CELERITY_ST_BROCHUREREQUEST].[DateRequested] DESC,
                (CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,    
                (CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromMailing WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                (CASE WHEN [CELERITY_ST_CLIENT].[LastContactDate] = '0' OR [CELERITY_ST_CLIENT].[LastContactDate] IS NULL THEN '' ELSE CONVERT(VARCHAR(10),CONVERT(datetime, [CELERITY_ST_CLIENT].[LastContactDate], 103),120) END) DESC,
                (CASE WHEN [CELERITY_ST_CLIENT].DateCreated IS NULL THEN '' ELSE CONVERT(VARCHAR(10),[CELERITY_ST_CLIENT].DateCreated,120) END) Desc,
                (CASE [CELERITY_ST_CLIENT].Blacklisted WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                (CASE [CELERITY_ST_CLIENT].GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                CELERITY_ST_CLIENT.ClientCode DESC,
                COALESCE([SL_Simplified_SalesOffice].[SalesOfficeSimplified],[CELERITY_ST_BROCHUREREQUEST].[Location]),
                COALESCE([SL_Simplified_Title].[TitleSimplified],''),
                [CELERITY_ST_CLIENT].[FirstName],
                [CELERITY_ST_CLIENT].[LastName], 
                [CELERITY_ST_CLIENT].[City],
                [CELERITY_ST_CLIENT].[County],
                [CELERITY_ST_CLIENT].[Postcode],
                COALESCE([SL_Simplified_Triton_Client_Country].[CountrySimplified],[CELERITY_ST_CLIENT].Country),
                COALESCE([SL_Simplified_BrochureName].[BrochureNameSimplified],[CELERITY_ST_BROCHUREREQUEST].[BrochureName]),
                [CELERITY_ST_CLIENT].[Add1],
                [CELERITY_ST_CLIENT].[Add2],
                [CELERITY_ST_CLIENT].[Add3],
                [CELERITY_ST_CLIENT].[Phone1],
                [CELERITY_ST_CLIENT].[Phone2],
                [CELERITY_ST_CLIENT].[BusinessPhone],
                [CELERITY_ST_CLIENT].DateOfBirth,
                [CELERITY_ST_CLIENT].CustomerLinkCode,
                [CELERITY_ST_CLIENT].[CustomerClass],
                CELERITY_ST_CLIENT.ClientSourceCode,
                [SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified]
            ) AS RankResult,

            -- DWYT-16 New HubSpot API fields
            CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromTelephone,
            CASE WHEN [CELERITY_ST_CLIENT].[LastContactDate] = '0' OR [CELERITY_ST_CLIENT].[LastContactDate] IS NULL THEN '' ELSE CONVERT(VARCHAR(10),CONVERT(datetime, [CELERITY_ST_CLIENT].[LastContactDate], 103),120) END AS LastContactDate,
            CASE WHEN [CELERITY_ST_CLIENT].DateCreated IS NULL THEN '' ELSE CONVERT(VARCHAR(10),[CELERITY_ST_CLIENT].DateCreated,120) END AS TritonCreateDate,
            COALESCE(REPLACE(REPLACE(REPLACE([CELERITY_ST_CLIENT].ClientCode, 'TRT-M',''), 'TRT-S', ''), 'TRT-', ''), '') AS CleanClientID

        FROM
            [CelerityMarine_Stage].[dbo].[CELERITY_ST_BROCHUREREQUEST] WITH (NOLOCK)
        INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENT] WITH (NOLOCK)
            ON [CELERITY_ST_CLIENT].ClientCode=[CELERITY_ST_BROCHUREREQUEST].ClientCode
            AND [CELERITY_ST_CLIENT].Brand = 'S'
        INNER JOIN [HUBSPOT].[dbo].[SL_Simplified_BrochureName] WITH (NOLOCK)
            ON [SL_Simplified_BrochureName].[BrochureNameActual]=[CELERITY_ST_BROCHUREREQUEST].[BrochureName] AND [SL_Simplified_BrochureName].[BrandName]='SUN'
        LEFT JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENTPREFERENCES] WITH (NOLOCK)
            ON [CELERITY_ST_CLIENTPREFERENCES].ClientCode=[CELERITY_ST_CLIENT].ClientCode
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_SalesOffice] WITH (NOLOCK)
            ON [SL_Simplified_SalesOffice].BrandName ='SUN' AND [SL_Simplified_SalesOffice].[SalesOfficeFromRawData]=[CELERITY_ST_BROCHUREREQUEST].[Location]
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Triton_Client_Country] WITH (NOLOCK)
            ON [SL_Simplified_Triton_Client_Country].[CountryActual]=[CELERITY_ST_CLIENT].Country
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Title] WITH (NOLOCK)
            ON [SL_Simplified_Title].[TitleActual]=[CELERITY_ST_CLIENT].Title
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_ClientBookingOffice] WITH (NOLOCK)
            ON [SL_Simplified_ClientBookingOffice].[ClientBookingOfficeActual]=[CELERITY_ST_CLIENT].BookingOffice
        WHERE
            [CELERITY_ST_BROCHUREREQUEST].[DateRequested] BETWEEN CONVERT(DATE,'2010-01-01', 120) AND CONVERT(DATE,GETDATE()-1)
--            [CELERITY_ST_BROCHUREREQUEST].[DateRequested] BETWEEN CONVERT(DATE,GETDATE()-10) AND CONVERT(DATE,GETDATE()-1)
--      AND [CELERITY_ST_BROCHUREREQUEST].[DateRequested] BETWEEN CONVERT(DATE,'2013-01-01', 120) AND CONVERT(DATE, '2013-12-31', 120)
--        AND [CELERITY_ST_BROCHUREREQUEST].[DateRequested] BETWEEN CONVERT(DATE,'2016-01-01', 120) AND CONVERT(DATE, '2016-12-31', 120)
        AND [CELERITY_ST_CLIENT].Email1 LIKE '%_@%_.__%'
        AND [CELERITY_ST_CLIENT].Email1 not like '%[[]%' AND [CELERITY_ST_CLIENT].Email1 not like '%]%' AND [CELERITY_ST_CLIENT].Email1 not like '%(%' AND [CELERITY_ST_CLIENT].Email1 not like '%)%' AND [CELERITY_ST_CLIENT].Email1 not like '%''%' AND [CELERITY_ST_CLIENT].Email1 not like '% %'
    )Result
    Where 
        RankResult=1
    ORDER BY 
        BrochureDateRequested  DESC
END


GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_TRITON_SS_ENEWS]    Script Date: 09/08/2018 08:16:37 ******/
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
-- 21-May-2018      1.6         Tim Wilson         Corrections for dedupe logic
--========================================================================================================================

CREATE PROC [dbo].[BUILD_HUBSPOT_TRITON_SS_ENEWS]
AS
BEGIN
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
            CASE WHEN TRT_SUNSAIL_ST_EFMST.EFETDT IS NULL OR TRT_SUNSAIL_ST_EFMST.EFETDT = 0 THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', CONVERT(DATETIME, CONVERT(VARCHAR(8), TRT_SUNSAIL_ST_EFMST.EFETDT), 112)))*60*60*1000) END AS EnewsDateRequested,
            COALESCE([CELERITY_ST_CLIENT].[Add1],'') AS Address1,
            COALESCE([CELERITY_ST_CLIENT].[Add2],'') AS Address2,
            COALESCE([CELERITY_ST_CLIENT].[Add3],'') AS Address3,
            COALESCE([CELERITY_ST_CLIENT].[Phone1],'') AS Phone1,
            COALESCE([CELERITY_ST_CLIENT].[Phone2],'') AS Phone2,
            COALESCE([CELERITY_ST_CLIENT].[BusinessPhone],'') AS BusinessPhone,
            CASE WHEN [CELERITY_ST_CLIENT].DateOfBirth IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', [CELERITY_ST_CLIENT].DateOfBirth))*60*60*1000) END AS DateOfBirth,
            --COALESCE([CELERITY_ST_CLIENT].NumberOfCharters,'') AS NumberOfCharters, -- Ignore for now
            COALESCE([CELERITY_ST_CLIENT].CustomerLinkCode,'') AS CustomerLinkCode,
            COALESCE([CELERITY_ST_CLIENT].[CustomerClass],'') AS CustomerClass,
            CASE [CELERITY_ST_CLIENT].GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END AS GoneAway,
            COALESCE(CELERITY_ST_CLIENT.ClientSourceCode,'') AS ClientSourceCode,
            'Enews' as Status,
            COALESCE([SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified],'') AS ClientBookingOffice,
            DENSE_RANK() OVER(PARTITION BY TRT_SUNSAIL_ST_EFMST.EFMAIL 
                ORDER BY 
                CAST(CASE ISNULL(TRT_SUNSAIL_ST_EFMST.EFETDT,0) WHEN 0 THEN NULL ELSE CONVERT(DATETIME, CONVERT(VARCHAR(8), TRT_SUNSAIL_ST_EFMST.EFETDT), 112) END AS Datetime) DESC,
                (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromEmail] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                (CASE WHEN [CELERITY_ST_CLIENT].[LastContactDate] = '0' OR [CELERITY_ST_CLIENT].[LastContactDate] IS NULL THEN '' ELSE CONVERT(VARCHAR(10),CONVERT(datetime, [CELERITY_ST_CLIENT].[LastContactDate], 103),120) END) DESC,
                (CASE WHEN [CELERITY_ST_CLIENT].[DateCreated] IS NULL THEN '' ELSE CONVERT(VARCHAR(10),[CELERITY_ST_CLIENT].DateCreated,120) END) DESC,
                (CASE [CELERITY_ST_CLIENT].GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                CELERITY_ST_CLIENT.ClientCode DESC,
                [SL_ISO_SalesOffice].[SalesOffice],
                [SL_ISO_SalesOffice].[Language],
                CELERITY_ST_CLIENT.ClientCode,
                COALESCE([SL_Simplified_Title].[TitleSimplified],''),
                TRT_SUNSAIL_ST_EFMST.EFFNAM,
                TRT_SUNSAIL_ST_EFMST.EFLNAM,
                COALESCE([SL_Simplified_Triton_Client_Country].[CountrySimplified],[SL_ISO_SalesOffice].[CountryOfResidence]),
                COALESCE([SL_EFSITE_PRODUCT_INTEREST].[ProductInterest],TRT_SUNSAIL_ST_EFMST.EFSITE),
                [CELERITY_ST_CLIENT].[Add1],
                [CELERITY_ST_CLIENT].[Add2],
                [CELERITY_ST_CLIENT].[Add3],
                [CELERITY_ST_CLIENT].[Phone1],
                [CELERITY_ST_CLIENT].[Phone2],
                [CELERITY_ST_CLIENT].[BusinessPhone],
                [CELERITY_ST_CLIENT].DateOfBirth,
                --[CELERITY_ST_CLIENT].NumberOfCharters,
                [CELERITY_ST_CLIENT].CustomerLinkCode,
                [CELERITY_ST_CLIENT].[CustomerClass],
                CELERITY_ST_CLIENT.ClientSourceCode,
                [SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified]
            ) AS RankResult,

            -- DWYT-16 New HubSpot API fields
            CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromTelephone,
            CASE WHEN [CELERITY_ST_CLIENT].[LastContactDate] = '0' OR [CELERITY_ST_CLIENT].[LastContactDate] IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', CONVERT(datetime, [CELERITY_ST_CLIENT].[LastContactDate], 103)))*60*60*1000) END AS LastContactDate,
            CASE WHEN [CELERITY_ST_CLIENT].[DateCreated] IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', [CELERITY_ST_CLIENT].DateCreated))*60*60*1000) END AS TritonCreateDate,
            COALESCE([CELERITY_ST_CLIENT].[Deceased],'') AS Deceased,
            CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromEmail,
            CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromBrochure,
            COALESCE([CELERITY_ST_CLIENT].ClientCode,'') AS ClientCode
            
        FROM 
            [CelerityMarine_Stage].[dbo].[TRT_SUNSAIL_ST_EFMST] WITH (NOLOCK)
        LEFT JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENT] WITH (NOLOCK) 
            ON REPLACE([CELERITY_ST_CLIENT].Email1,'\@','@') = REPLACE(TRT_SUNSAIL_ST_EFMST.EFMAIL,'\@','@')
            AND [CELERITY_ST_CLIENT].Email1 != ''
            AND [CELERITY_ST_CLIENT].Brand = 'S'
        LEFT JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENTPREFERENCES] WITH (NOLOCK)
            ON [CELERITY_ST_CLIENTPREFERENCES].ClientCode=[CELERITY_ST_CLIENT].ClientCode
        LEFT JOIN [HUBSPOT].[dbo].[SL_ISO_SalesOffice] WITH (NOLOCK) 
            ON [SL_ISO_SalesOffice].[ISO_Code]=TRT_SUNSAIL_ST_EFMST.EFCTCD
        LEFT JOIN [HUBSPOT].[dbo].[SL_EFSITE_PRODUCT_INTEREST] WITH (NOLOCK)
            ON [SL_EFSITE_PRODUCT_INTEREST].[EFSITE]=TRT_SUNSAIL_ST_EFMST.EFSITE AND [SL_EFSITE_PRODUCT_INTEREST].[BrandName]='Sunsail'
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Triton_Client_Country] WITH (NOLOCK)
            ON [SL_Simplified_Triton_Client_Country].[CountryActual]=[SL_ISO_SalesOffice].[CountryOfResidence]
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Title] WITH (NOLOCK)
            ON [SL_Simplified_Title].[TitleActual]=[CELERITY_ST_CLIENT].Title
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_ClientBookingOffice] WITH (NOLOCK)
            ON [SL_Simplified_ClientBookingOffice].[ClientBookingOfficeActual]=[CELERITY_ST_CLIENT].BookingOffice
        WHERE
            TRT_SUNSAIL_ST_EFMST.EFMAIL LIKE '%_@%_.__%'
        AND TRT_SUNSAIL_ST_EFMST.EFMAIL not like '%[[]%' AND TRT_SUNSAIL_ST_EFMST.EFMAIL not like '%]%' AND TRT_SUNSAIL_ST_EFMST.EFMAIL not like '%(%' AND TRT_SUNSAIL_ST_EFMST.EFMAIL not like '%)%' AND TRT_SUNSAIL_ST_EFMST.EFMAIL not like '%''%' AND TRT_SUNSAIL_ST_EFMST.EFMAIL not like '% %'
        AND TRT_SUNSAIL_ST_EFMST.EFETDT != 0
        AND TRT_SUNSAIL_ST_EFMST.EFETDT >= CONVERT(INT, CONVERT(VARCHAR(8),GETDATE()-10,112)) AND TRT_SUNSAIL_ST_EFMST.EFETDT <= CONVERT(INT, CONVERT(VARCHAR(8),GETDATE()-1,112))
--        AND TRT_SUNSAIL_ST_EFMST.EFETDT BETWEEN 20130101 AND 20131231
--        AND TRT_SUNSAIL_ST_EFMST.EFETDT BETWEEN 20160101 AND 20161231
    )Result
    Where RankResult=1
END


GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_TRITON_SS_ENEWS_8YR]    Script Date: 09/08/2018 08:16:37 ******/
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
--========================================================================================================================

CREATE PROC [dbo].[BUILD_HUBSPOT_TRITON_SS_ENEWS_8YR]
AS
BEGIN
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
            COALESCE([CELERITY_ST_CLIENT].[Add1],'') AS Address1,
            COALESCE([CELERITY_ST_CLIENT].[Add2],'') AS Address2,
            COALESCE([CELERITY_ST_CLIENT].[Add3],'') AS Address3,
            COALESCE([CELERITY_ST_CLIENT].[Phone1],'') AS Phone1,
            COALESCE([CELERITY_ST_CLIENT].[Phone2],'') AS Phone2,
            COALESCE([CELERITY_ST_CLIENT].[BusinessPhone],'') AS BusinessPhone,
            CASE WHEN [CELERITY_ST_CLIENT].DateOfBirth IS NULL THEN '' ELSE CONVERT(VARCHAR(10),[CELERITY_ST_CLIENT].DateOfBirth,120) END AS DateOfBirth,
            --COALESCE([CELERITY_ST_CLIENT].NumberOfCharters,'') AS NumberOfCharters, -- Ignore for now
            COALESCE([CELERITY_ST_CLIENT].CustomerLinkCode,'') AS CustomerLinkCode,
            COALESCE([CELERITY_ST_CLIENT].[CustomerClass],'') AS CustomerClass,
            CASE [CELERITY_ST_CLIENT].GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END AS GoneAway,
            COALESCE(CELERITY_ST_CLIENT.ClientSourceCode,'') AS ClientSourceCode,
            'Enews' as Status,
            COALESCE([SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified],'') AS ClientBookingOffice,
            DENSE_RANK() OVER(PARTITION BY TRT_SUNSAIL_ST_EFMST.EFMAIL 
                ORDER BY 
                CAST(CASE ISNULL(TRT_SUNSAIL_ST_EFMST.EFETDT,0) WHEN 0 THEN NULL ELSE CONVERT(DATETIME, CONVERT(VARCHAR(8), TRT_SUNSAIL_ST_EFMST.EFETDT), 112) END AS Datetime) DESC,
                (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromEmail] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                (CASE WHEN [CELERITY_ST_CLIENT].[LastContactDate] = '0' OR [CELERITY_ST_CLIENT].[LastContactDate] IS NULL THEN '' ELSE CONVERT(VARCHAR(10),CONVERT(datetime, [CELERITY_ST_CLIENT].[LastContactDate], 103),120) END) DESC,
                (CASE WHEN [CELERITY_ST_CLIENT].[DateCreated] IS NULL THEN '' ELSE CONVERT(VARCHAR(10),[CELERITY_ST_CLIENT].DateCreated,120) END) DESC,
                (CASE [CELERITY_ST_CLIENT].GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                CELERITY_ST_CLIENT.ClientCode DESC,
                [SL_ISO_SalesOffice].[SalesOffice],
                [SL_ISO_SalesOffice].[Language],
                COALESCE([SL_Simplified_Title].[TitleSimplified],''),
                TRT_SUNSAIL_ST_EFMST.EFFNAM,
                TRT_SUNSAIL_ST_EFMST.EFLNAM,
                COALESCE([SL_Simplified_Triton_Client_Country].[CountrySimplified],[SL_ISO_SalesOffice].[CountryOfResidence]),
                COALESCE([SL_EFSITE_PRODUCT_INTEREST].[ProductInterest],TRT_SUNSAIL_ST_EFMST.EFSITE),
                [CELERITY_ST_CLIENT].[Add1],
                [CELERITY_ST_CLIENT].[Add2],
                [CELERITY_ST_CLIENT].[Add3],
                [CELERITY_ST_CLIENT].[Phone1],
                [CELERITY_ST_CLIENT].[Phone2],
                [CELERITY_ST_CLIENT].[BusinessPhone],
                [CELERITY_ST_CLIENT].DateOfBirth,
                --[CELERITY_ST_CLIENT].NumberOfCharters,
                [CELERITY_ST_CLIENT].CustomerLinkCode,
                [CELERITY_ST_CLIENT].[CustomerClass],
                CELERITY_ST_CLIENT.ClientSourceCode,
                [SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified]
            ) AS RankResult,

            -- DWYT-16 New HubSpot API fields
            CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromTelephone,
            CASE WHEN [CELERITY_ST_CLIENT].[LastContactDate] = '0' OR [CELERITY_ST_CLIENT].[LastContactDate] IS NULL THEN '' ELSE CONVERT(VARCHAR(10),CONVERT(datetime, [CELERITY_ST_CLIENT].[LastContactDate], 103),120) END AS LastContactDate,
            CASE WHEN [CELERITY_ST_CLIENT].[DateCreated] IS NULL THEN '' ELSE CONVERT(VARCHAR(10),[CELERITY_ST_CLIENT].DateCreated,120) END AS TritonCreateDate,
            COALESCE([CELERITY_ST_CLIENT].[Deceased],'') AS Deceased,
            CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromEmail,
            CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromBrochure,
            COALESCE([CELERITY_ST_CLIENT].ClientCode,'') AS ClientCode
            
        FROM 
            [CelerityMarine_Stage].[dbo].[TRT_SUNSAIL_ST_EFMST] WITH (NOLOCK)
        LEFT JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENT] WITH (NOLOCK) 
            ON REPLACE([CELERITY_ST_CLIENT].Email1,'\@','@') = REPLACE(TRT_SUNSAIL_ST_EFMST.EFMAIL,'\@','@')
            AND [CELERITY_ST_CLIENT].Email1 != ''
            AND [CELERITY_ST_CLIENT].Brand = 'S'
        LEFT JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENTPREFERENCES] WITH (NOLOCK)
            ON [CELERITY_ST_CLIENTPREFERENCES].ClientCode=[CELERITY_ST_CLIENT].ClientCode
        LEFT JOIN [HUBSPOT].[dbo].[SL_ISO_SalesOffice] WITH (NOLOCK) 
            ON [SL_ISO_SalesOffice].[ISO_Code]=TRT_SUNSAIL_ST_EFMST.EFCTCD
        LEFT JOIN [HUBSPOT].[dbo].[SL_EFSITE_PRODUCT_INTEREST] WITH (NOLOCK)
            ON [SL_EFSITE_PRODUCT_INTEREST].[EFSITE]=TRT_SUNSAIL_ST_EFMST.EFSITE AND [SL_EFSITE_PRODUCT_INTEREST].[BrandName]='Sunsail'
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Triton_Client_Country] WITH (NOLOCK)
            ON [SL_Simplified_Triton_Client_Country].[CountryActual]=[SL_ISO_SalesOffice].[CountryOfResidence]
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Title] WITH (NOLOCK)
            ON [SL_Simplified_Title].[TitleActual]=[CELERITY_ST_CLIENT].Title
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_ClientBookingOffice] WITH (NOLOCK)
            ON [SL_Simplified_ClientBookingOffice].[ClientBookingOfficeActual]=[CELERITY_ST_CLIENT].BookingOffice
        WHERE
            TRT_SUNSAIL_ST_EFMST.EFMAIL LIKE '%_@%_.__%'
        AND TRT_SUNSAIL_ST_EFMST.EFMAIL not like '%[[]%' AND TRT_SUNSAIL_ST_EFMST.EFMAIL not like '%]%' AND TRT_SUNSAIL_ST_EFMST.EFMAIL not like '%(%' AND TRT_SUNSAIL_ST_EFMST.EFMAIL not like '%)%' AND TRT_SUNSAIL_ST_EFMST.EFMAIL not like '%''%' AND TRT_SUNSAIL_ST_EFMST.EFMAIL not like '% %'
        AND TRT_SUNSAIL_ST_EFMST.EFETDT != 0
--        AND TRT_SUNSAIL_ST_EFMST.EFETDT >= CONVERT(INT, CONVERT(VARCHAR(8),GETDATE()-10,112)) AND TRT_SUNSAIL_ST_EFMST.EFETDT <= CONVERT(INT, CONVERT(VARCHAR(8),GETDATE()-1,112))
--        AND TRT_SUNSAIL_ST_EFMST.EFETDT BETWEEN 20130101 AND 20131231
--        AND TRT_SUNSAIL_ST_EFMST.EFETDT BETWEEN 20160101 AND 20161231
        AND TRT_SUNSAIL_ST_EFMST.EFETDT BETWEEN 20100101 AND CONVERT(INT, CONVERT(VARCHAR(8),GETDATE()-1,112))
    )Result
    Where RankResult=1
END


GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_TRITON_SS_QUOTES]    Script Date: 09/08/2018 08:16:37 ******/
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
-- 21-May-2018      1.7         Tim Wilson         Corrections for dedupe logic
--========================================================================================================================

CREATE PROC [dbo].[BUILD_HUBSPOT_TRITON_SS_QUOTES]
AS
BEGIN
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
            CLI.Email1 AS Email,
            CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromMailing WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromMailing,
            CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromEmail,
            CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromBrochure,
            CLI.Deceased,
            CASE CLI.Blacklisted WHEN 'Y' THEN 'Y' ELSE 'N' END AS Blacklisted,
            [CELERITY_ST_BOOKINGS].ProductName AS QuoteProductName,
            CASE WHEN [CELERITY_ST_BOOKINGS].BookingDate IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', [CELERITY_ST_BOOKINGS].BookingDate))*60*60*1000) END AS QuoteDateRequested,
            CASE WHEN [CELERITY_ST_BOOKINGS].DepartureDate IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', [CELERITY_ST_BOOKINGS].DepartureDate))*60*60*1000) END AS QuoteDepartureDate,
            COALESCE([SL_BaseNameFull].[BaseName],[CELERITY_ST_BOOKINGS].AreaName) AS QuoteDestination,
            CASE WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1,3,1) IN ('X','L','P') THEN 'Catamaran' ELSE 'Monohull' END AS QuoteHullType, 
            COALESCE(CLI.[Add1],'') AS Address1,
            COALESCE(CLI.[Add2],'') AS Address2,
            COALESCE(CLI.[Add3],'') AS Address3,
            COALESCE(CLI.[Phone1],'') AS Phone1,
            COALESCE(CLI.[Phone2],'') AS Phone2,
            COALESCE(CLI.[BusinessPhone],'') AS BusinessPhone,
            CASE WHEN CLI.DateOfBirth IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', CLI.DateOfBirth))*60*60*1000) END AS DateOfBirth,
            COALESCE([CELERITY_ST_BOOKINGS].ExecutiveReportingRegion,'') AS QuoteExecutiveReportingRegion,
            COALESCE([CELERITY_ST_BOOKINGS].UserDefinable1,'') AS QuoteBoat,
            COALESCE([CELERITY_ST_BOOKINGS].BookRef,'') AS QuoteBookRef,
            COALESCE(CLI.CustomerLinkCode,'') AS CustomerLinkCode,
            COALESCE(CLI.[CustomerClass],'') AS CustomerClass,
            CASE CLI.GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END AS GoneAway,
            COALESCE(CLI.ClientSourceCode,'') AS ClientSourceCode,
            [CELERITY_ST_BOOKINGS].[Status], 
            COALESCE([SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified],'') AS ClientBookingOffice,
            DENSE_RANK() OVER(PARTITION BY CLI.Email1 
                ORDER BY 
                    [CELERITY_ST_BOOKINGS].BookingDate DESC, 
                    [CELERITY_ST_BOOKINGS].DepartureDate DESC,
                    [CELERITY_ST_BOOKINGS].BookRef DESC, 
                    [CELERITY_ST_BOOKINGS].ConfirmDate DESC,
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,    
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromMailing WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE WHEN CLI.[LastContactDate] = '0' THEN '' ELSE CONVERT(VARCHAR(10),CONVERT(datetime, CLI.[LastContactDate], 103),120) END) DESC,
                    (CASE WHEN CLI.DateCreated IS NULL THEN '' ELSE CONVERT(VARCHAR(10),CLI.DateCreated,120) END) DESC,
                    (CASE CLI.Blacklisted WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE CLI.GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    [CELERITY_ST_BOOKINGS].BookingSourcePrimary,
                    COALESCE([SL_Simplified_SalesOffice].[SalesOfficeSimplified],[CELERITY_ST_BOOKINGS].BookingOfficeLocation),
                    [CELERITY_ST_BOOKINGS].BookingLanguageFull,
                    [CELERITY_ST_BOOKINGS].ProductName,
                    [CELERITY_ST_BOOKINGS].AreaName,
                    CLI.ClientCode,
                    COALESCE([SL_Simplified_Title].[TitleSimplified],''),
                    CLI.FirstName,
                    CLI.LastName,
                    CLI.City,
                    CLI.County,
                    CLI.Postcode,
                    COALESCE([SL_Simplified_Triton_Client_Country].[CountrySimplified],CLI.Country),
                    (CASE WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1,3,1) IN ('X','L','P') THEN 'Catamaran' ELSE 'Monohull' END),
                    CLI.[Add1],
                    CLI.[Add2],
                    CLI.[Add3],
                    CLI.[Phone1],
                    CLI.[Phone2],
                    CLI.[BusinessPhone],
                    CLI.DateOfBirth,
                    [CELERITY_ST_BOOKINGS].ExecutiveReportingRegion,
                    [CELERITY_ST_BOOKINGS].UserDefinable1,
                    CLI.CustomerLinkCode,
                    CLI.[CustomerClass],
                    CLI.ClientSourceCode,
                    [SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified]
            ) AS RankResultMostRecentQuote,

            -- DWYT-16 New HubSpot API fields
            CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromTelephone,
            '' AS Notes,
            CASE WHEN CLI.[LastContactDate] = '0' THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', CONVERT(datetime, CLI.[LastContactDate], 103)))*60*60*1000) END AS LastContactDate,
            CASE WHEN CLI.DateCreated IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', CLI.DateCreated))*60*60*1000) END AS TritonCreateDate,
            COALESCE(REPLACE(REPLACE(REPLACE(CLI.ClientCode, 'TRT-M',''), 'TRT-S', ''), 'TRT-', ''), '') AS CleanClientID,
            COALESCE([CELERITY_ST_BOOKINGS].AgentCode,'') AS QuoteSalesAgent

        FROM 
            [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKINGS] WITH (NOLOCK)
        INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKEDPASSENGERS] WITH (NOLOCK)
            ON [CELERITY_ST_BOOKEDPASSENGERS].BookRef=[CELERITY_ST_BOOKINGS].BookRef
        INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENT] CLI WITH (NOLOCK)
            ON CLI.ClientCode=[CELERITY_ST_BOOKEDPASSENGERS].ClientCode
            AND CLI.Brand = 'S'
        LEFT JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENTPREFERENCES] WITH (NOLOCK)
            ON [CELERITY_ST_CLIENTPREFERENCES].ClientCode = CLI.ClientCode
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
        AND CLI.Email1 LIKE '%_@%_.__%'
        AND CLI.Email1 not like '%[[]%' AND CLI.Email1 not like '%]%' AND CLI.Email1 not like '%(%' AND CLI.Email1 not like '%)%' AND CLI.Email1 not like '%''%' AND CLI.Email1 not like '% %'
        AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,GETDATE()-10) AND CONVERT(DATE,GETDATE()-1)
--        AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,'2013-01-01', 120) AND CONVERT(DATE, '2013-12-31', 120)
--        AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,'2016-01-01', 120) AND CONVERT(DATE, '2016-12-31', 120)
    ) Result

    WHERE RankResultMostRecentQuote=1
    ORDER BY QuoteDateRequested
END


GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_TRITON_SS_QUOTES_8YR]    Script Date: 09/08/2018 08:16:37 ******/
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
--========================================================================================================================

CREATE PROC [dbo].[BUILD_HUBSPOT_TRITON_SS_QUOTES_8YR]
AS
BEGIN
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
            CLI.Email1 AS Email,
            CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromMailing WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromMailing,
            CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromEmail,
            CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromBrochure,
            CLI.Deceased,
            CASE CLI.Blacklisted WHEN 'Y' THEN 'Y' ELSE 'N' END AS Blacklisted,
            [CELERITY_ST_BOOKINGS].ProductName AS QuoteProductName,
            CASE WHEN [CELERITY_ST_BOOKINGS].BookingDate IS NULL THEN '' ELSE CONVERT(VARCHAR(10),[CELERITY_ST_BOOKINGS].BookingDate,120) END AS QuoteDateRequested,
            CASE WHEN [CELERITY_ST_BOOKINGS].DepartureDate IS NULL THEN '' ELSE CONVERT(VARCHAR(10),[CELERITY_ST_BOOKINGS].DepartureDate,120) END AS QuoteDepartureDate,
            COALESCE([SL_BaseNameFull].[BaseName],[CELERITY_ST_BOOKINGS].AreaName) AS QuoteDestination,
            CASE WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1,3,1) IN ('X','L','P') THEN 'Catamaran' ELSE 'Monohull' END AS QuoteHullType, 
            COALESCE(CLI.[Add1],'') AS Address1,
            COALESCE(CLI.[Add2],'') AS Address2,
            COALESCE(CLI.[Add3],'') AS Address3,
            COALESCE(CLI.[Phone1],'') AS Phone1,
            COALESCE(CLI.[Phone2],'') AS Phone2,
            COALESCE(CLI.[BusinessPhone],'') AS BusinessPhone,
            CASE WHEN CLI.DateOfBirth IS NULL THEN '' ELSE CONVERT(VARCHAR(10),CLI.DateOfBirth,120) END AS DateOfBirth,
            COALESCE([CELERITY_ST_BOOKINGS].ExecutiveReportingRegion,'') AS QuoteExecutiveReportingRegion,
            COALESCE([CELERITY_ST_BOOKINGS].UserDefinable1,'') AS QuoteBoat,
            COALESCE([CELERITY_ST_BOOKINGS].BookRef,'') AS QuoteBookRef,
            COALESCE(CLI.CustomerLinkCode,'') AS CustomerLinkCode,
            COALESCE(CLI.[CustomerClass],'') AS CustomerClass,
            CASE CLI.GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END AS GoneAway,
            COALESCE(CLI.ClientSourceCode,'') AS ClientSourceCode,
            [CELERITY_ST_BOOKINGS].[Status], 
            COALESCE([SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified],'') AS ClientBookingOffice,
            DENSE_RANK() OVER(PARTITION BY CLI.Email1 
                ORDER BY 
                    [CELERITY_ST_BOOKINGS].BookingDate DESC, 
                    [CELERITY_ST_BOOKINGS].DepartureDate DESC,
                    [CELERITY_ST_BOOKINGS].BookRef DESC, 
                    [CELERITY_ST_BOOKINGS].ConfirmDate DESC,
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,    
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromMailing WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE WHEN CLI.[LastContactDate] = '0' THEN '' ELSE CONVERT(VARCHAR(10),CONVERT(datetime, CLI.[LastContactDate], 103),120) END) DESC,
                    (CASE WHEN CLI.DateCreated IS NULL THEN '' ELSE CONVERT(VARCHAR(10),CLI.DateCreated,120) END) DESC,
                    (CASE CLI.Blacklisted WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE CLI.GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    [CELERITY_ST_BOOKINGS].BookingSourcePrimary,
                    COALESCE([SL_Simplified_SalesOffice].[SalesOfficeSimplified],[CELERITY_ST_BOOKINGS].BookingOfficeLocation),
                    [CELERITY_ST_BOOKINGS].BookingLanguageFull,
                    [CELERITY_ST_BOOKINGS].ProductName,
                    [CELERITY_ST_BOOKINGS].AreaName,
                    CLI.ClientCode,
                    COALESCE([SL_Simplified_Title].[TitleSimplified],''),
                    CLI.FirstName,
                    CLI.LastName,
                    CLI.City,
                    CLI.County,
                    CLI.Postcode,
                    COALESCE([SL_Simplified_Triton_Client_Country].[CountrySimplified],CLI.Country),
                    (CASE WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1,3,1) IN ('X','L','P') THEN 'Catamaran' ELSE 'Monohull' END),
                    CLI.[Add1],
                    CLI.[Add2],
                    CLI.[Add3],
                    CLI.[Phone1],
                    CLI.[Phone2],
                    CLI.[BusinessPhone],
                    CLI.DateOfBirth,
                    [CELERITY_ST_BOOKINGS].ExecutiveReportingRegion,
                    [CELERITY_ST_BOOKINGS].UserDefinable1,
                    CLI.CustomerLinkCode,
                    CLI.[CustomerClass],
                    CLI.ClientSourceCode,
                    [SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified]
            ) AS RankResultMostRecentQuote,

            -- DWYT-16 New HubSpot API fields
            CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromTelephone,
            '' AS Notes,
            CASE WHEN CLI.[LastContactDate] = '0' THEN '' ELSE CONVERT(VARCHAR(10),CONVERT(datetime, CLI.[LastContactDate], 103),120) END AS LastContactDate,
            CASE WHEN CLI.DateCreated IS NULL THEN '' ELSE CONVERT(VARCHAR(10),CLI.DateCreated,120) END AS TritonCreateDate,
            COALESCE(REPLACE(REPLACE(REPLACE(CLI.ClientCode, 'TRT-M',''), 'TRT-S', ''), 'TRT-', ''), '') AS CleanClientID,
            COALESCE([CELERITY_ST_BOOKINGS].AgentCode,'') AS QuoteSalesAgent

        FROM 
            [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKINGS] WITH (NOLOCK)
        INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKEDPASSENGERS] WITH (NOLOCK)
            ON [CELERITY_ST_BOOKEDPASSENGERS].BookRef=[CELERITY_ST_BOOKINGS].BookRef
        INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENT] CLI WITH (NOLOCK)
            ON CLI.ClientCode=[CELERITY_ST_BOOKEDPASSENGERS].ClientCode
            AND CLI.Brand = 'S'
        LEFT JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENTPREFERENCES] WITH (NOLOCK)
            ON [CELERITY_ST_CLIENTPREFERENCES].ClientCode = CLI.ClientCode
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
        AND CLI.Email1 LIKE '%_@%_.__%'
        AND CLI.Email1 not like '%[[]%' AND CLI.Email1 not like '%]%' AND CLI.Email1 not like '%(%' AND CLI.Email1 not like '%)%' AND CLI.Email1 not like '%''%' AND CLI.Email1 not like '% %'
        AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,'2010-01-01', 120) AND CONVERT(DATE,GETDATE()-1)
--        AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,GETDATE()-10) AND CONVERT(DATE,GETDATE()-1)
--        AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,'2013-01-01', 120) AND CONVERT(DATE, '2013-12-31', 120)
--        AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,'2016-01-01', 120) AND CONVERT(DATE, '2016-12-31', 120)
    ) Result

    WHERE RankResultMostRecentQuote=1
    ORDER BY QuoteDateRequested
END


GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_TRITON_TM_BOOKINGS]    Script Date: 09/08/2018 08:16:37 ******/
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
-- 21-May-2018      1.5         Tim Wilson         Corrections for dedup logic
--========================================================================================================================

CREATE PROC [dbo].[BUILD_HUBSPOT_TRITON_TM_BOOKINGS]
AS
BEGIN
    SELECT DISTINCT 
         LifecycleStage
        ,BrandName
        ,ConfirmDate
        ,BookingSourcePrimary
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
        ,BookingProductName
        ,BookingDateBooked
        ,BookingDepartureDate
        ,BookingDestination
        ,BookingHullType
        ,Address1
        ,Address2
        ,Address3
        ,Phone1
        ,Phone2
        ,BusinessPhone
        ,DateOfBirth
        ,BookingExecutiveReportingRegion
--        ,NumberOfCharters
        ,Duration
        ,BookingBoat
        ,BookingBookRef
        ,CustomerLinkCode
        ,CustomerClass
        ,GoneAway
        ,ClientSourceCode
        ,[Status]
        ,ClientBookingOffice
        ,CancelFromTelephone
--        ,Notes
        ,LastContactDate
        ,BookingCancellationDate
        ,CancellationCancellationDate
        ,CancellationBookRef
        ,FirstCharterDepartureDate
        ,FirstCharterDestination
        ,FirstCharterDateBooked
        ,FirstCharterProduct
        ,FirstCharterHullType
        ,FirstCharterBoat
        ,NumberOfBookings
        ,TritonCreateDate
        ,BookingSourceSecondary
        ,BookingSourceTertiary
        ,BookingSalesAgent
        ,CleanClientID
        ,BookingCleanBookRef
        ,BookingTotalPax
        ,BookingStatus
    FROM 
    (
        SELECT
            'customer' AS LifecycleStage,
            'Moorings' AS BrandName,
            CASE WHEN [CELERITY_ST_BOOKINGS].ConfirmDate IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', [CELERITY_ST_BOOKINGS].ConfirmDate))*60*60*1000) END AS ConfirmDate,
            [CELERITY_ST_BOOKINGS].BookingSourcePrimary,
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
            CLI.Email1 AS Email,
            CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromMailing WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromMailing,
            CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromEmail,
            CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromBrochure,
            CLI.Deceased,
            CASE CLI.Blacklisted WHEN 'Y' THEN 'true' ELSE 'false' END AS Blacklisted,
            [SL_Simplified_ProductName].ProductNameSimplified AS BookingProductName,
            CASE WHEN [CELERITY_ST_BOOKINGS].BookingDate IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', [CELERITY_ST_BOOKINGS].BookingDate))*60*60*1000) END AS BookingDateBooked,
            CASE WHEN [CELERITY_ST_BOOKINGS].DepartureDate IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', [CELERITY_ST_BOOKINGS].DepartureDate))*60*60*1000) END AS BookingDepartureDate,
            COALESCE([SL_BaseNameFull].[BaseName],[CELERITY_ST_BOOKINGS].AreaName) AS BookingDestination,
            CASE WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1,3,1) IN ('X','L','P') THEN 'Catamaran' ELSE 'Monohull' END AS BookingHullType, 
            COALESCE(CLI.[Add1],'') AS Address1,
            COALESCE(CLI.[Add2],'') AS Address2,
            COALESCE(CLI.[Add3],'') AS Address3,
            COALESCE(CLI.[Phone1],'') AS Phone1,
            COALESCE(CLI.[Phone2],'') AS Phone2,
            COALESCE(CLI.[BusinessPhone],'') AS BusinessPhone,
            CASE WHEN CLI.DateOfBirth IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', CLI.DateOfBirth))*60*60*1000) END AS DateOfBirth,
            COALESCE([CELERITY_ST_BOOKINGS].ExecutiveReportingRegion,'') AS BookingExecutiveReportingRegion,
            COALESCE(CLI.NumberOfCharters,'') AS NumberOfCharters,
            COALESCE([CELERITY_ST_BOOKINGS].Duration,'') AS Duration,
            --COALESCE([CELERITY_ST_BOOKINGS].CleanBaseName,'') AS CleanBaseName,--Ignore for now
            --COALESCE([CELERITY_ST_BOOKINGS].CleanBoatName,'') AS CleanBoatName,--Ignore for now
            COALESCE([CELERITY_ST_BOOKINGS].UserDefinable1,'') AS BookingBoat,
            COALESCE([CELERITY_ST_BOOKINGS].BookRef,'') AS BookingBookRef,
            COALESCE(CLI.CustomerLinkCode,'') AS CustomerLinkCode,
            COALESCE(CLI.[CustomerClass],'') AS CustomerClass,
            CASE CLI.GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END AS GoneAway,
            COALESCE(CLI.ClientSourceCode,'') AS ClientSourceCode,
            'Booking' AS [Status], 
            COALESCE([SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified],'') AS ClientBookingOffice,
            DENSE_RANK() OVER(PARTITION BY CLI.Email1 
                ORDER BY 
                    [CELERITY_ST_BOOKINGS].BookingDate DESC,
                    [CELERITY_ST_BOOKINGS].DepartureDate DESC,
                    [CELERITY_ST_BOOKINGS].BookRef DESC, 
                    [CELERITY_ST_BOOKINGS].ConfirmDate DESC,
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,    
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromMailing WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE WHEN CLI.[LastContactDate] = '0' THEN '' ELSE CONVERT(VARCHAR(10),CONVERT(datetime, CLI.[LastContactDate], 103),120) END) DESC,
                    (CASE WHEN CLI.DateCreated IS NULL THEN '' ELSE CONVERT(VARCHAR(10),CLI.DateCreated,120) END) DESC,
                    (CASE CLI.Blacklisted WHEN 'Y' THEN 'true' ELSE 'false' END) DESC,
                    (CASE CLI.GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    [CELERITY_ST_BOOKINGS].BookingSourcePrimary,
                    COALESCE([SL_Simplified_SalesOffice].[SalesOfficeSimplified],[CELERITY_ST_BOOKINGS].BookingOfficeLocation),
                    [CELERITY_ST_BOOKINGS].BookingLanguageFull,
                    [CELERITY_ST_BOOKINGS].ProductName,
                    [CELERITY_ST_BOOKINGS].AreaName,
                    CLI.ClientCode,
                    COALESCE([SL_Simplified_Title].[TitleSimplified],''),
                    CLI.FirstName,
                    CLI.LastName,
                    CLI.City,
                    CLI.County,
                    CLI.Postcode,
                    COALESCE([SL_Simplified_Triton_Client_Country].[CountrySimplified],CLI.Country),
                    (CASE WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1,3,1) IN ('X','L','P') THEN 'Catamaran' ELSE 'Monohull' END),
                    CLI.[Add1],
                    CLI.[Add2],
                    CLI.[Add3],
                    CLI.[Phone1],
                    CLI.[Phone2],
                    CLI.[BusinessPhone],
                    CLI.DateOfBirth,
                    [CELERITY_ST_BOOKINGS].ExecutiveReportingRegion,
                    CLI.NumberOfCharters,
                    [CELERITY_ST_BOOKINGS].Duration,
                    [CELERITY_ST_BOOKINGS].UserDefinable1,
                    CLI.CustomerLinkCode,
                    CLI.[CustomerClass],
                    CLI.ClientSourceCode,
                    [SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified]
            ) AS RankResultMostRecentBooking,
            RankResultFirstCharter,

            -- DWYT-16 New HubSpot API fields
            CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromTelephone,
            '' AS Notes,
            CASE WHEN CLI.[LastContactDate] = '0' THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', CONVERT(datetime, CLI.[LastContactDate], 103)))*60*60*1000) END AS LastContactDate,
            CASE WHEN [CELERITY_ST_BOOKINGS].CancelledDate IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', [CELERITY_ST_BOOKINGS].CancelledDate))*60*60*1000) END AS BookingCancellationDate,
            COALESCE(CancelledBookings.CancellationDate, '') AS CancellationCancellationDate,
            COALESCE(CancelledBookings.CancellationBookRef, '') AS CancellationBookRef,
            COALESCE(FirstCharter.FirstCharterDepartureDate, '') AS FirstCharterDepartureDate,
            COALESCE(FirstCharter.FirstCharterDestination, '') AS FirstCharterDestination,
            COALESCE(FirstCharter.FirstCharterDateBooked, '') AS FirstCharterDateBooked,
            COALESCE(FirstCharter.FirstCharterProduct, '') AS FirstCharterProduct,
            COALESCE(FirstCharter.FirstCharterHullType, '') AS FirstCharterHullType,
            COALESCE(FirstCharter.FirstCharterBoat,'') AS FirstCharterBoat,
            (SELECT COUNT(*) FROM [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKINGS] WITH (NOLOCK)
                INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKEDPASSENGERS] WITH (NOLOCK)
                ON [CELERITY_ST_BOOKEDPASSENGERS].BookRef=[CELERITY_ST_BOOKINGS].BookRef
                INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENT] WITH (NOLOCK)
                ON [CELERITY_ST_BOOKEDPASSENGERS].ClientCode = [CELERITY_ST_CLIENT].ClientCode
                WHERE [CELERITY_ST_CLIENT].ClientCode = CLI.ClientCode
                AND [CELERITY_ST_BOOKINGS].BrandName ='MRG'
                AND [CELERITY_ST_BOOKINGS].[Status] = 'Booking'
            ) AS NumberOfBookings,
            CASE WHEN CLI.DateCreated IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', CLI.DateCreated))*60*60*1000) END AS TritonCreateDate,
            COALESCE([CELERITY_ST_BOOKINGS].BookingSourceSecondary,'') AS BookingSourceSecondary,
            '' AS BookingSourceTertiary,
            COALESCE([CELERITY_ST_BOOKINGS].AgentCode,'') AS BookingSalesAgent,
            COALESCE(REPLACE(REPLACE(REPLACE(CLI.ClientCode, 'TRT-M',''), 'TRT-S', ''), 'TRT-', ''), '') AS CleanClientID,
            COALESCE(REPLACE(REPLACE(REPLACE([CELERITY_ST_BOOKINGS].BookRef, 'TRT-M', ''), 'TRT-S', ''), 'TRT-', ''),'') AS BookingCleanBookRef,
            COALESCE([CELERITY_ST_BOOKINGS].[TotalPax],0) AS BookingTotalPax,
            COALESCE(REPLACE([CELERITY_ST_BOOKINGS].[Status], 'Booking', 'Confirmed'),'') AS BookingStatus
            
        FROM 
            [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKINGS] WITH (NOLOCK)
        INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKEDPASSENGERS] WITH (NOLOCK)
            ON [CELERITY_ST_BOOKEDPASSENGERS].BookRef=[CELERITY_ST_BOOKINGS].BookRef
        INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENT] CLI WITH (NOLOCK)
            ON CLI.ClientCode=[CELERITY_ST_BOOKEDPASSENGERS].ClientCode
            AND CLI.Brand = 'M'
        LEFT JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENTPREFERENCES] WITH (NOLOCK)
            ON [CELERITY_ST_CLIENTPREFERENCES].ClientCode = CLI.ClientCode
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_SalesOffice] WITH (NOLOCK)
            ON [SL_Simplified_SalesOffice].BrandName=[CELERITY_ST_BOOKINGS].BrandName AND [SL_Simplified_SalesOffice].[SalesOfficeFromRawData]=[CELERITY_ST_BOOKINGS].BookingOfficeLocation
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
        LEFT JOIN [SL_BaseNameFull] WITH (NOLOCK)
            ON [SL_BaseNameFull].BaseCode = [CELERITY_ST_BOOKINGS].AreaCode
            AND [SL_BaseNameFull].Brand = 'MRG'
        LEFT JOIN
        -- First Charter records
        (
            SELECT DISTINCT
                BookRef AS FirstCharterBookRef,
                DepartureDate AS FirstCharterDepartureDate,
                Destination AS FirstCharterDestination,
                BookingDate AS FirstCharterDateBooked,
                ProductName AS FirstCharterProduct,
                HullType AS FirstCharterHullType,
                UserDefinable1 AS FirstCharterBoat,
                ClientCode AS FirstCharterClientCode,
                RankResultFirstCharter
            FROM
            (
                SELECT
                    [CELERITY_ST_BOOKINGS].BookRef,
                    CASE WHEN [CELERITY_ST_BOOKINGS].DepartureDate IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', [CELERITY_ST_BOOKINGS].DepartureDate))*60*60*1000) END AS DepartureDate,
                    COALESCE([SL_BaseNameFull].[BaseName],[CELERITY_ST_BOOKINGS].AreaName) AS Destination,
                    CASE WHEN [CELERITY_ST_BOOKINGS].BookingDate IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', [CELERITY_ST_BOOKINGS].BookingDate))*60*60*1000) END AS BookingDate,
                    [SL_Simplified_ProductName].ProductNameSimplified AS ProductName,
                    CASE
                        WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1, 3, 1) = 'P' THEN 'Power'
                        WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1, 3, 1) = 'X' THEN 'Catamaran'
                        WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1, 3, 1) = 'L' THEN 'Catamaran'
                        ELSE 'Monohull'
                    END AS HullType,
                    [CELERITY_ST_BOOKINGS].UserDefinable1,
                    CLI.ClientCode,
                    DENSE_RANK() OVER(PARTITION BY CLI.ClientCode
                        ORDER BY 
                            [CELERITY_ST_BOOKINGS].BookingDate ASC,
                            [CELERITY_ST_BOOKINGS].DepartureDate DESC,
                            [CELERITY_ST_BOOKINGS].BookRef DESC, 
                            [CELERITY_ST_BOOKINGS].ConfirmDate DESC,
                            (CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,    
                            (CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromMailing WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                            (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                            (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                            (CASE WHEN CLI.[LastContactDate] = '0' THEN '' ELSE CONVERT(VARCHAR(10),CONVERT(datetime, CLI.[LastContactDate], 103),120) END) DESC,
                            (CASE WHEN CLI.DateCreated IS NULL THEN '' ELSE CONVERT(VARCHAR(10),CLI.DateCreated,120) END) DESC,
                            (CASE CLI.Blacklisted WHEN 'Y' THEN 'true' ELSE 'false' END) DESC,
                            (CASE CLI.GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                            [CELERITY_ST_BOOKINGS].BookingSourcePrimary,
                            COALESCE([SL_Simplified_SalesOffice].[SalesOfficeSimplified],[CELERITY_ST_BOOKINGS].BookingOfficeLocation),
                            [CELERITY_ST_BOOKINGS].BookingLanguageFull,
                            [CELERITY_ST_BOOKINGS].ProductName,
                            [CELERITY_ST_BOOKINGS].AreaName,
                            CLI.ClientCode,
                            COALESCE([SL_Simplified_Title].[TitleSimplified],''),
                            CLI.FirstName,
                            CLI.LastName,
                            CLI.City,
                            CLI.County,
                            CLI.Postcode,
                            COALESCE([SL_Simplified_Triton_Client_Country].[CountrySimplified],CLI.Country),
                            (CASE WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1,3,1) IN ('X','L','P') THEN 'Catamaran' ELSE 'Monohull' END),
                            CLI.[Add1],
                            CLI.[Add2],
                            CLI.[Add3],
                            CLI.[Phone1],
                            CLI.[Phone2],
                            CLI.[BusinessPhone],
                            CLI.DateOfBirth,
                            [CELERITY_ST_BOOKINGS].ExecutiveReportingRegion,
                            CLI.NumberOfCharters,
                            [CELERITY_ST_BOOKINGS].Duration,
                            [CELERITY_ST_BOOKINGS].UserDefinable1,
                            CLI.CustomerLinkCode,
                            CLI.[CustomerClass],
                            CLI.ClientSourceCode,
                            [SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified]
                    ) AS RankResultFirstCharter
                FROM 
                    [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKINGS] WITH (NOLOCK)
                INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKEDPASSENGERS] WITH (NOLOCK)
                    ON [CELERITY_ST_BOOKEDPASSENGERS].BookRef=[CELERITY_ST_BOOKINGS].BookRef
                INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENT] CLI WITH (NOLOCK)
                    ON CLI.ClientCode=[CELERITY_ST_BOOKEDPASSENGERS].ClientCode
                    AND CLI.Brand = 'M'
                LEFT JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENTPREFERENCES] WITH (NOLOCK)
                    ON [CELERITY_ST_CLIENTPREFERENCES].ClientCode = CLI.ClientCode
                LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_SalesOffice] WITH (NOLOCK)
                    ON [SL_Simplified_SalesOffice].BrandName=[CELERITY_ST_BOOKINGS].BrandName AND [SL_Simplified_SalesOffice].[SalesOfficeFromRawData]=[CELERITY_ST_BOOKINGS].BookingOfficeLocation
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
                LEFT JOIN [SL_BaseNameFull] WITH (NOLOCK)
                    ON [SL_BaseNameFull].BaseCode = [CELERITY_ST_BOOKINGS].AreaCode
                    AND [SL_BaseNameFull].Brand = 'MRG'
                WHERE 
                    [CELERITY_ST_BOOKINGS].BrandName ='MRG'
                AND [CELERITY_ST_BOOKINGS].Status = 'Booking'
                AND [CELERITY_ST_BOOKINGS].BookingSourcePrimary NOT IN ('PR-Pr free trip','TAAC-Ta on account','PR-Public relations-mor','PRESS-Bericht in der press','STAFF-Staff booking','OWNS-Owner with no paymen','OS-Wot-offshore sailing','OWNER-Owner','DAYCH-Day charter discount','LOCAL-Local booking','OS-Offshore sailing','OSS-Offshore sailing','OW-Owner use','OPS-Operations/maintenan','TA','STHOL-Staff holiday','TAGEN-Travel agent','OSSFF-Staff friends & fami','LOCA2-Local booking','TO-Tour operator')
                AND [CELERITY_ST_BOOKINGS].AreaCode NOT IN ('UKD','UK1','CVO','SS1','UK2','SS2','UK3','FLT','UK4')
                AND [CELERITY_ST_BOOKINGS].ProductName IN ('SAILING_SCHOOLS','CREWED','FLOTILLA','FRANCHISE','FOOTLOOSE','BAREBOAT','CORPORATE','POWER')
                AND [CELERITY_ST_BOOKINGS].BookingType ='DIRECT'
                AND [CELERITY_ST_BOOKINGS].UserDefinable1 IS NOT NULL
                AND LTRIM(RTRIM([CELERITY_ST_BOOKINGS].UserDefinable1)) <> '' 
                AND CLI.Email1 LIKE '%_@%_.__%'
                AND CLI.Email1 not like '%[[]%' AND CLI.Email1 not like '%]%' AND CLI.Email1 not like '%(%' AND CLI.Email1 not like '%)%' AND CLI.Email1 not like '%''%' AND CLI.Email1 not like '% %'
                AND [CELERITY_ST_BOOKINGS].BookingDate >= CONVERT(date,'2010-01-01 00:00:00.000')
            ) FirstCharterInnerSelect
            WHERE RankResultFirstCharter = 1
        ) FirstCharter
        ON FirstCharter.FirstCharterClientCode = CLI.ClientCode
        LEFT JOIN
        -- Most recent cancellation records
        (
            SELECT DISTINCT
                BookRef AS CancellationBookRef,
                CancellationDate AS CancellationDate,
                ClientCode AS CancellationClientCode,
                RankResultCancellation
            FROM
            (
                SELECT
                    [CELERITY_ST_BOOKINGS].BookRef,
                    CASE WHEN [CELERITY_ST_BOOKINGS].CancelledDate IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', [CELERITY_ST_BOOKINGS].CancelledDate))*60*60*1000) END AS CancellationDate,
                    CLI.ClientCode,
                    DENSE_RANK() OVER(PARTITION BY CLI.ClientCode
                ORDER BY 
                    [CELERITY_ST_BOOKINGS].BookingDate DESC,
                    [CELERITY_ST_BOOKINGS].DepartureDate DESC,
                    [CELERITY_ST_BOOKINGS].BookRef DESC, 
                    [CELERITY_ST_BOOKINGS].ConfirmDate DESC,
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,    
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromMailing WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE WHEN CLI.[LastContactDate] = '0' THEN '' ELSE CONVERT(VARCHAR(10),CONVERT(datetime, CLI.[LastContactDate], 103),120) END) DESC,
                    (CASE WHEN CLI.DateCreated IS NULL THEN '' ELSE CONVERT(VARCHAR(10),CLI.DateCreated,120) END) DESC,
                    (CASE CLI.Blacklisted WHEN 'Y' THEN 'true' ELSE 'false' END) DESC,
                    (CASE CLI.GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    [CELERITY_ST_BOOKINGS].BookingSourcePrimary,
                    COALESCE([SL_Simplified_SalesOffice].[SalesOfficeSimplified],[CELERITY_ST_BOOKINGS].BookingOfficeLocation),
                    [CELERITY_ST_BOOKINGS].BookingLanguageFull,
                    [CELERITY_ST_BOOKINGS].ProductName,
                    [CELERITY_ST_BOOKINGS].AreaName,
                    CLI.ClientCode,
                    COALESCE([SL_Simplified_Title].[TitleSimplified],''),
                    CLI.FirstName,
                    CLI.LastName,
                    CLI.City,
                    CLI.County,
                    CLI.Postcode,
                    COALESCE([SL_Simplified_Triton_Client_Country].[CountrySimplified],CLI.Country),
                    (CASE WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1,3,1) IN ('X','L','P') THEN 'Catamaran' ELSE 'Monohull' END),
                    CLI.[Add1],
                    CLI.[Add2],
                    CLI.[Add3],
                    CLI.[Phone1],
                    CLI.[Phone2],
                    CLI.[BusinessPhone],
                    CLI.DateOfBirth,
                    [CELERITY_ST_BOOKINGS].ExecutiveReportingRegion,
                    CLI.NumberOfCharters,
                    [CELERITY_ST_BOOKINGS].Duration,
                    [CELERITY_ST_BOOKINGS].UserDefinable1,
                    CLI.CustomerLinkCode,
                    CLI.[CustomerClass],
                    CLI.ClientSourceCode,
                    [SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified]
                    ) AS RankResultCancellation
                FROM 
                    [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKINGS] WITH (NOLOCK)
                INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKEDPASSENGERS] WITH (NOLOCK)
                    ON [CELERITY_ST_BOOKEDPASSENGERS].BookRef=[CELERITY_ST_BOOKINGS].BookRef
                INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENT] CLI WITH (NOLOCK)
                    ON CLI.ClientCode=[CELERITY_ST_BOOKEDPASSENGERS].ClientCode
                    AND CLI.Brand = 'M'
                LEFT JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENTPREFERENCES] WITH (NOLOCK)
                    ON [CELERITY_ST_CLIENTPREFERENCES].ClientCode = CLI.ClientCode
                LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_SalesOffice] WITH (NOLOCK)
                    ON [SL_Simplified_SalesOffice].BrandName=[CELERITY_ST_BOOKINGS].BrandName AND [SL_Simplified_SalesOffice].[SalesOfficeFromRawData]=[CELERITY_ST_BOOKINGS].BookingOfficeLocation
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
                    [CELERITY_ST_BOOKINGS].BrandName ='MRG'
                AND [CELERITY_ST_BOOKINGS].Status IN ('Booking','Cancelled')
                AND [CELERITY_ST_BOOKINGS].CancelledDate IS NOT NULL
                AND [CELERITY_ST_BOOKINGS].BookingSourcePrimary NOT IN ('PR-Pr free trip','TAAC-Ta on account','PR-Public relations-mor','PRESS-Bericht in der press','STAFF-Staff booking','OWNS-Owner with no paymen','OS-Wot-offshore sailing','OWNER-Owner','DAYCH-Day charter discount','LOCAL-Local booking','OS-Offshore sailing','OSS-Offshore sailing','OW-Owner use','OPS-Operations/maintenan','TA','STHOL-Staff holiday','TAGEN-Travel agent','OSSFF-Staff friends & fami','LOCA2-Local booking','TO-Tour operator')
                AND [CELERITY_ST_BOOKINGS].AreaCode NOT IN ('UKD','UK1','CVO','SS1','UK2','SS2','UK3','FLT','UK4')
                AND [CELERITY_ST_BOOKINGS].ProductName IN ('SAILING_SCHOOLS','CREWED','FLOTILLA','FRANCHISE','FOOTLOOSE','BAREBOAT','CORPORATE','POWER')
                AND [CELERITY_ST_BOOKINGS].BookingType ='DIRECT'
                AND [CELERITY_ST_BOOKINGS].UserDefinable1 IS NOT NULL
                AND LTRIM(RTRIM([CELERITY_ST_BOOKINGS].UserDefinable1)) <> '' 
                AND CLI.Email1 LIKE '%_@%_.__%'
                AND CLI.Email1 not like '%[[]%' AND CLI.Email1 not like '%]%' AND CLI.Email1 not like '%(%' AND CLI.Email1 not like '%)%' AND CLI.Email1 not like '%''%' AND CLI.Email1 not like '% %'
                --Search all bookings for most recent cancellation records
                --AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,GETDATE()-8) AND CONVERT(DATE,GETDATE()-1)
                --AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN '2017-08-03' AND '2017-09-10'
            ) CancelledBookingsInnerSelect
            WHERE RankResultCancellation = 1
        ) CancelledBookings
        ON CancelledBookings.CancellationClientCode = CLI.ClientCode
        WHERE 
            [CELERITY_ST_BOOKINGS].BrandName ='MRG'
        AND [CELERITY_ST_BOOKINGS].Status IN ('Booking','Cancelled')
        AND [CELERITY_ST_BOOKINGS].BookingSourcePrimary NOT IN ('PR-Pr free trip','TAAC-Ta on account','PR-Public relations-mor','PRESS-Bericht in der press','STAFF-Staff booking','OWNS-Owner with no paymen','OS-Wot-offshore sailing','OWNER-Owner','DAYCH-Day charter discount','LOCAL-Local booking','OS-Offshore sailing','OSS-Offshore sailing','OW-Owner use','OPS-Operations/maintenan','TA','STHOL-Staff holiday','TAGEN-Travel agent','OSSFF-Staff friends & fami','LOCA2-Local booking','TO-Tour operator')
        AND [CELERITY_ST_BOOKINGS].AreaCode NOT IN ('UKD','UK1','CVO','SS1','UK2','SS2','UK3','FLT','UK4')
        AND [CELERITY_ST_BOOKINGS].ProductName IN ('SAILING_SCHOOLS','CREWED','FLOTILLA','FRANCHISE','FOOTLOOSE','BAREBOAT','CORPORATE','POWER')
        AND [CELERITY_ST_BOOKINGS].BookingType ='DIRECT'
        AND [CELERITY_ST_BOOKINGS].UserDefinable1 IS NOT NULL
        AND LTRIM(RTRIM([CELERITY_ST_BOOKINGS].UserDefinable1)) <> '' 
        AND CLI.Email1 LIKE '%_@%_.__%'
        AND CLI.Email1 not like '%[[]%' AND CLI.Email1 not like '%]%' AND CLI.Email1 not like '%(%' AND CLI.Email1 not like '%)%' AND CLI.Email1 not like '%''%' AND CLI.Email1 not like '% %'
        AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,GETDATE()-10) AND CONVERT(DATE,GETDATE()-1)
--        AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,'2013-01-01', 120) AND CONVERT(DATE, '2013-12-31', 120)
--        AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,'2016-01-01', 120) AND CONVERT(DATE, '2016-12-31', 120)
    ) Result

    WHERE RankResultMostRecentBooking=1
    ORDER BY ConfirmDate

END


GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_TRITON_TM_BOOKINGS_8YR]    Script Date: 09/08/2018 08:16:37 ******/
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
--========================================================================================================================

CREATE PROC [dbo].[BUILD_HUBSPOT_TRITON_TM_BOOKINGS_8YR]
AS
BEGIN
    SELECT DISTINCT 
         LifecycleStage
        ,BrandName
        ,ConfirmDate
        ,BookingSourcePrimary
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
        ,BookingProductName
        ,BookingDateBooked
        ,BookingDepartureDate
        ,BookingDestination
        ,BookingHullType
        ,Address1
        ,Address2
        ,Address3
        ,Phone1
        ,Phone2
        ,BusinessPhone
        ,DateOfBirth
        ,BookingExecutiveReportingRegion
--        ,NumberOfCharters
        ,Duration
        ,BookingBoat
        ,BookingBookRef
        ,CustomerLinkCode
        ,CustomerClass
        ,GoneAway
        ,ClientSourceCode
        ,[Status]
        ,ClientBookingOffice
        ,CancelFromTelephone
--        ,Notes
        ,LastContactDate
        ,BookingCancellationDate
        ,CancellationCancellationDate
        ,CancellationBookRef
        ,FirstCharterDepartureDate
        ,FirstCharterDestination
        ,FirstCharterDateBooked
        ,FirstCharterProduct
        ,FirstCharterHullType
        ,FirstCharterBoat
        ,NumberOfBookings
        ,TritonCreateDate
        ,BookingSourceSecondary
        ,BookingSourceTertiary
        ,BookingSalesAgent
        ,CleanClientID
        ,BookingCleanBookRef
        ,BookingTotalPax
        ,BookingStatus
    FROM 
    (
        SELECT
            'customer' AS LifecycleStage,
            'Moorings' AS BrandName,
            CASE WHEN [CELERITY_ST_BOOKINGS].ConfirmDate IS NULL THEN '' ELSE CONVERT(VARCHAR(10),[CELERITY_ST_BOOKINGS].ConfirmDate,120) END AS ConfirmDate,
            [CELERITY_ST_BOOKINGS].BookingSourcePrimary,
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
            CLI.Email1 AS Email,
            CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromMailing WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromMailing,
            CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromEmail,
            CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromBrochure,
            CLI.Deceased,
            CASE CLI.Blacklisted WHEN 'Y' THEN 'true' ELSE 'false' END AS Blacklisted,
            [SL_Simplified_ProductName].ProductNameSimplified AS BookingProductName,
            CASE WHEN [CELERITY_ST_BOOKINGS].BookingDate IS NULL THEN '' ELSE CONVERT(VARCHAR(10),[CELERITY_ST_BOOKINGS].BookingDate,120) END AS BookingDateBooked,
            CASE WHEN [CELERITY_ST_BOOKINGS].DepartureDate IS NULL THEN '' ELSE CONVERT(VARCHAR(10),[CELERITY_ST_BOOKINGS].DepartureDate,120) END AS BookingDepartureDate,
            COALESCE([SL_BaseNameFull].[BaseName],[CELERITY_ST_BOOKINGS].AreaName) AS BookingDestination,
            CASE WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1,3,1) IN ('X','L','P') THEN 'Catamaran' ELSE 'Monohull' END AS BookingHullType, 
            COALESCE(CLI.[Add1],'') AS Address1,
            COALESCE(CLI.[Add2],'') AS Address2,
            COALESCE(CLI.[Add3],'') AS Address3,
            COALESCE(CLI.[Phone1],'') AS Phone1,
            COALESCE(CLI.[Phone2],'') AS Phone2,
            COALESCE(CLI.[BusinessPhone],'') AS BusinessPhone,
            CASE WHEN CLI.DateOfBirth IS NULL THEN '' ELSE CONVERT(VARCHAR(10),CLI.DateOfBirth,120) END AS DateOfBirth,
            COALESCE([CELERITY_ST_BOOKINGS].ExecutiveReportingRegion,'') AS BookingExecutiveReportingRegion,
            COALESCE(CLI.NumberOfCharters,'') AS NumberOfCharters,
            COALESCE([CELERITY_ST_BOOKINGS].Duration,'') AS Duration,
            --COALESCE([CELERITY_ST_BOOKINGS].CleanBaseName,'') AS CleanBaseName,--Ignore for now
            --COALESCE([CELERITY_ST_BOOKINGS].CleanBoatName,'') AS CleanBoatName,--Ignore for now
            COALESCE([CELERITY_ST_BOOKINGS].UserDefinable1,'') AS BookingBoat,
            COALESCE([CELERITY_ST_BOOKINGS].BookRef,'') AS BookingBookRef,
            COALESCE(CLI.CustomerLinkCode,'') AS CustomerLinkCode,
            COALESCE(CLI.[CustomerClass],'') AS CustomerClass,
            CASE CLI.GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END AS GoneAway,
            COALESCE(CLI.ClientSourceCode,'') AS ClientSourceCode,
            'Booking' AS [Status], 
            COALESCE([SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified],'') AS ClientBookingOffice,
            DENSE_RANK() OVER(PARTITION BY CLI.Email1 
                ORDER BY 
                    [CELERITY_ST_BOOKINGS].BookingDate DESC,
                    [CELERITY_ST_BOOKINGS].DepartureDate DESC,
                    [CELERITY_ST_BOOKINGS].BookRef DESC, 
                    [CELERITY_ST_BOOKINGS].ConfirmDate DESC,
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,    
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromMailing WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE WHEN CLI.[LastContactDate] = '0' THEN '' ELSE CONVERT(VARCHAR(10),CONVERT(datetime, CLI.[LastContactDate], 103),120) END) DESC,
                    (CASE WHEN CLI.DateCreated IS NULL THEN '' ELSE CONVERT(VARCHAR(10),CLI.DateCreated,120) END) DESC,
                    (CASE CLI.Blacklisted WHEN 'Y' THEN 'true' ELSE 'false' END) DESC,
                    (CASE CLI.GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    [CELERITY_ST_BOOKINGS].BookingSourcePrimary,
                    COALESCE([SL_Simplified_SalesOffice].[SalesOfficeSimplified],[CELERITY_ST_BOOKINGS].BookingOfficeLocation),
                    [CELERITY_ST_BOOKINGS].BookingLanguageFull,
                    [CELERITY_ST_BOOKINGS].ProductName,
                    [CELERITY_ST_BOOKINGS].AreaName,
                    CLI.ClientCode,
                    COALESCE([SL_Simplified_Title].[TitleSimplified],''),
                    CLI.FirstName,
                    CLI.LastName,
                    CLI.City,
                    CLI.County,
                    CLI.Postcode,
                    COALESCE([SL_Simplified_Triton_Client_Country].[CountrySimplified],CLI.Country),
                    (CASE WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1,3,1) IN ('X','L','P') THEN 'Catamaran' ELSE 'Monohull' END),
                    CLI.[Add1],
                    CLI.[Add2],
                    CLI.[Add3],
                    CLI.[Phone1],
                    CLI.[Phone2],
                    CLI.[BusinessPhone],
                    CLI.DateOfBirth,
                    [CELERITY_ST_BOOKINGS].ExecutiveReportingRegion,
                    CLI.NumberOfCharters,
                    [CELERITY_ST_BOOKINGS].Duration,
                    [CELERITY_ST_BOOKINGS].UserDefinable1,
                    CLI.CustomerLinkCode,
                    CLI.[CustomerClass],
                    CLI.ClientSourceCode,
                    [SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified]
            ) AS RankResultMostRecentBooking,
            RankResultFirstCharter,

            -- DWYT-16 New HubSpot API fields
            CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromTelephone,
            '' AS Notes,
            CASE WHEN CLI.[LastContactDate] = '0' THEN '' ELSE CONVERT(VARCHAR(10),CONVERT(datetime, CLI.[LastContactDate], 103),120) END AS LastContactDate,
            CASE WHEN [CELERITY_ST_BOOKINGS].CancelledDate IS NULL THEN '' ELSE CONVERT(VARCHAR(10),[CELERITY_ST_BOOKINGS].CancelledDate,120) END AS BookingCancellationDate,
            COALESCE(CancelledBookings.CancellationDate, '') AS CancellationCancellationDate,
            COALESCE(CancelledBookings.CancellationBookRef, '') AS CancellationBookRef,
            COALESCE(FirstCharter.FirstCharterDepartureDate, '') AS FirstCharterDepartureDate,
            COALESCE(FirstCharter.FirstCharterDestination, '') AS FirstCharterDestination,
            COALESCE(FirstCharter.FirstCharterDateBooked, '') AS FirstCharterDateBooked,
            COALESCE(FirstCharter.FirstCharterProduct, '') AS FirstCharterProduct,
            COALESCE(FirstCharter.FirstCharterHullType, '') AS FirstCharterHullType,
            COALESCE(FirstCharter.FirstCharterBoat,'') AS FirstCharterBoat,
            (SELECT COUNT(*) FROM [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKINGS] WITH (NOLOCK)
                INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKEDPASSENGERS] WITH (NOLOCK)
                ON [CELERITY_ST_BOOKEDPASSENGERS].BookRef=[CELERITY_ST_BOOKINGS].BookRef
                INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENT] WITH (NOLOCK)
                ON [CELERITY_ST_BOOKEDPASSENGERS].ClientCode = [CELERITY_ST_CLIENT].ClientCode
                WHERE [CELERITY_ST_CLIENT].ClientCode = CLI.ClientCode
                AND [CELERITY_ST_BOOKINGS].BrandName ='MRG'
                AND [CELERITY_ST_BOOKINGS].[Status] = 'Booking'
            ) AS NumberOfBookings,
            CASE WHEN CLI.DateCreated IS NULL THEN '' ELSE CONVERT(VARCHAR(10),CLI.DateCreated,120) END AS TritonCreateDate,
            COALESCE([CELERITY_ST_BOOKINGS].BookingSourceSecondary,'') AS BookingSourceSecondary,
            '' AS BookingSourceTertiary,
            COALESCE([CELERITY_ST_BOOKINGS].AgentCode,'') AS BookingSalesAgent,
            COALESCE(REPLACE(REPLACE(REPLACE(CLI.ClientCode, 'TRT-M',''), 'TRT-S', ''), 'TRT-', ''), '') AS CleanClientID,
            COALESCE(REPLACE(REPLACE(REPLACE([CELERITY_ST_BOOKINGS].BookRef, 'TRT-M', ''), 'TRT-S', ''), 'TRT-', ''),'') AS BookingCleanBookRef,
            COALESCE([CELERITY_ST_BOOKINGS].[TotalPax],0) AS BookingTotalPax,
            COALESCE(REPLACE([CELERITY_ST_BOOKINGS].[Status], 'Booking', 'Confirmed'),'') AS BookingStatus
            
        FROM 
            [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKINGS] WITH (NOLOCK)
        INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKEDPASSENGERS] WITH (NOLOCK)
            ON [CELERITY_ST_BOOKEDPASSENGERS].BookRef=[CELERITY_ST_BOOKINGS].BookRef
        INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENT] CLI WITH (NOLOCK)
            ON CLI.ClientCode=[CELERITY_ST_BOOKEDPASSENGERS].ClientCode
            AND CLI.Brand = 'M'
        LEFT JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENTPREFERENCES] WITH (NOLOCK)
            ON [CELERITY_ST_CLIENTPREFERENCES].ClientCode = CLI.ClientCode
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_SalesOffice] WITH (NOLOCK)
            ON [SL_Simplified_SalesOffice].BrandName=[CELERITY_ST_BOOKINGS].BrandName AND [SL_Simplified_SalesOffice].[SalesOfficeFromRawData]=[CELERITY_ST_BOOKINGS].BookingOfficeLocation
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
        LEFT JOIN [SL_BaseNameFull] WITH (NOLOCK)
            ON [SL_BaseNameFull].BaseCode = [CELERITY_ST_BOOKINGS].AreaCode
            AND [SL_BaseNameFull].Brand = 'MRG'
        LEFT JOIN
        -- First Charter records
        (
            SELECT DISTINCT
                BookRef AS FirstCharterBookRef,
                DepartureDate AS FirstCharterDepartureDate,
                Destination AS FirstCharterDestination,
                BookingDate AS FirstCharterDateBooked,
                ProductName AS FirstCharterProduct,
                HullType AS FirstCharterHullType,
                UserDefinable1 AS FirstCharterBoat,
                ClientCode AS FirstCharterClientCode,
                RankResultFirstCharter
            FROM
            (
                SELECT
                    [CELERITY_ST_BOOKINGS].BookRef,
                    CASE WHEN [CELERITY_ST_BOOKINGS].DepartureDate IS NULL THEN '' ELSE CONVERT(VARCHAR(10),[CELERITY_ST_BOOKINGS].DepartureDate,120) END AS DepartureDate,
                    COALESCE([SL_BaseNameFull].[BaseName],[CELERITY_ST_BOOKINGS].AreaName) AS Destination,
                    CASE WHEN [CELERITY_ST_BOOKINGS].BookingDate IS NULL THEN '' ELSE CONVERT(VARCHAR(10),[CELERITY_ST_BOOKINGS].BookingDate,120) END AS BookingDate,
                    [SL_Simplified_ProductName].ProductNameSimplified AS ProductName,
                    CASE
                        WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1, 3, 1) = 'P' THEN 'Power'
                        WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1, 3, 1) = 'X' THEN 'Catamaran'
                        WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1, 3, 1) = 'L' THEN 'Catamaran'
                        ELSE 'Monohull'
                    END AS HullType,
                    [CELERITY_ST_BOOKINGS].UserDefinable1,
                    CLI.ClientCode,
                    DENSE_RANK() OVER(PARTITION BY CLI.ClientCode
                        ORDER BY 
                            [CELERITY_ST_BOOKINGS].BookingDate ASC,
                            [CELERITY_ST_BOOKINGS].DepartureDate DESC,
                            [CELERITY_ST_BOOKINGS].BookRef DESC, 
                            [CELERITY_ST_BOOKINGS].ConfirmDate DESC,
                            (CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,    
                            (CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromMailing WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                            (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                            (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                            (CASE WHEN CLI.[LastContactDate] = '0' THEN '' ELSE CONVERT(VARCHAR(10),CONVERT(datetime, CLI.[LastContactDate], 103),120) END) DESC,
                            (CASE WHEN CLI.DateCreated IS NULL THEN '' ELSE CONVERT(VARCHAR(10),CLI.DateCreated,120) END) DESC,
                            (CASE CLI.Blacklisted WHEN 'Y' THEN 'true' ELSE 'false' END) DESC,
                            (CASE CLI.GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                            [CELERITY_ST_BOOKINGS].BookingSourcePrimary,
                            COALESCE([SL_Simplified_SalesOffice].[SalesOfficeSimplified],[CELERITY_ST_BOOKINGS].BookingOfficeLocation),
                            [CELERITY_ST_BOOKINGS].BookingLanguageFull,
                            [CELERITY_ST_BOOKINGS].ProductName,
                            [CELERITY_ST_BOOKINGS].AreaName,
                            CLI.ClientCode,
                            COALESCE([SL_Simplified_Title].[TitleSimplified],''),
                            CLI.FirstName,
                            CLI.LastName,
                            CLI.City,
                            CLI.County,
                            CLI.Postcode,
                            COALESCE([SL_Simplified_Triton_Client_Country].[CountrySimplified],CLI.Country),
                            (CASE WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1,3,1) IN ('X','L','P') THEN 'Catamaran' ELSE 'Monohull' END),
                            CLI.[Add1],
                            CLI.[Add2],
                            CLI.[Add3],
                            CLI.[Phone1],
                            CLI.[Phone2],
                            CLI.[BusinessPhone],
                            CLI.DateOfBirth,
                            [CELERITY_ST_BOOKINGS].ExecutiveReportingRegion,
                            CLI.NumberOfCharters,
                            [CELERITY_ST_BOOKINGS].Duration,
                            [CELERITY_ST_BOOKINGS].UserDefinable1,
                            CLI.CustomerLinkCode,
                            CLI.[CustomerClass],
                            CLI.ClientSourceCode,
                            [SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified]
                    ) AS RankResultFirstCharter
                FROM 
                    [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKINGS] WITH (NOLOCK)
                INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKEDPASSENGERS] WITH (NOLOCK)
                    ON [CELERITY_ST_BOOKEDPASSENGERS].BookRef=[CELERITY_ST_BOOKINGS].BookRef
                INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENT] CLI WITH (NOLOCK)
                    ON CLI.ClientCode=[CELERITY_ST_BOOKEDPASSENGERS].ClientCode
                    AND CLI.Brand = 'M'
                LEFT JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENTPREFERENCES] WITH (NOLOCK)
                    ON [CELERITY_ST_CLIENTPREFERENCES].ClientCode = CLI.ClientCode
                LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_SalesOffice] WITH (NOLOCK)
                    ON [SL_Simplified_SalesOffice].BrandName=[CELERITY_ST_BOOKINGS].BrandName AND [SL_Simplified_SalesOffice].[SalesOfficeFromRawData]=[CELERITY_ST_BOOKINGS].BookingOfficeLocation
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
                LEFT JOIN [SL_BaseNameFull] WITH (NOLOCK)
                    ON [SL_BaseNameFull].BaseCode = [CELERITY_ST_BOOKINGS].AreaCode
                    AND [SL_BaseNameFull].Brand = 'MRG'
                WHERE 
                    [CELERITY_ST_BOOKINGS].BrandName ='MRG'
                AND [CELERITY_ST_BOOKINGS].Status = 'Booking'
                AND [CELERITY_ST_BOOKINGS].BookingSourcePrimary NOT IN ('PR-Pr free trip','TAAC-Ta on account','PR-Public relations-mor','PRESS-Bericht in der press','STAFF-Staff booking','OWNS-Owner with no paymen','OS-Wot-offshore sailing','OWNER-Owner','DAYCH-Day charter discount','LOCAL-Local booking','OS-Offshore sailing','OSS-Offshore sailing','OW-Owner use','OPS-Operations/maintenan','TA','STHOL-Staff holiday','TAGEN-Travel agent','OSSFF-Staff friends & fami','LOCA2-Local booking','TO-Tour operator')
                AND [CELERITY_ST_BOOKINGS].AreaCode NOT IN ('UKD','UK1','CVO','SS1','UK2','SS2','UK3','FLT','UK4')
                AND [CELERITY_ST_BOOKINGS].ProductName IN ('SAILING_SCHOOLS','CREWED','FLOTILLA','FRANCHISE','FOOTLOOSE','BAREBOAT','CORPORATE','POWER')
                AND [CELERITY_ST_BOOKINGS].BookingType ='DIRECT'
                AND [CELERITY_ST_BOOKINGS].UserDefinable1 IS NOT NULL
                AND LTRIM(RTRIM([CELERITY_ST_BOOKINGS].UserDefinable1)) <> '' 
                AND CLI.Email1 LIKE '%_@%_.__%'
                AND CLI.Email1 not like '%[[]%' AND CLI.Email1 not like '%]%' AND CLI.Email1 not like '%(%' AND CLI.Email1 not like '%)%' AND CLI.Email1 not like '%''%' AND CLI.Email1 not like '% %'
                AND [CELERITY_ST_BOOKINGS].BookingDate >= CONVERT(date,'2010-01-01 00:00:00.000')
            ) FirstCharterInnerSelect
            WHERE RankResultFirstCharter = 1
        ) FirstCharter
        ON FirstCharter.FirstCharterClientCode = CLI.ClientCode
        LEFT JOIN
        -- Most recent cancellation records
        (
            SELECT DISTINCT
                BookRef AS CancellationBookRef,
                CancellationDate AS CancellationDate,
                ClientCode AS CancellationClientCode,
                RankResultCancellation
            FROM
            (
                SELECT
                    [CELERITY_ST_BOOKINGS].BookRef,
                    CASE WHEN [CELERITY_ST_BOOKINGS].CancelledDate IS NULL THEN '' ELSE CONVERT(VARCHAR(10),[CELERITY_ST_BOOKINGS].CancelledDate,120) END AS CancellationDate,
                    CLI.ClientCode,
                    DENSE_RANK() OVER(PARTITION BY CLI.ClientCode
                ORDER BY 
                    [CELERITY_ST_BOOKINGS].BookingDate DESC,
                    [CELERITY_ST_BOOKINGS].DepartureDate DESC,
                    [CELERITY_ST_BOOKINGS].BookRef DESC, 
                    [CELERITY_ST_BOOKINGS].ConfirmDate DESC,
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,    
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromMailing WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE WHEN CLI.[LastContactDate] = '0' THEN '' ELSE CONVERT(VARCHAR(10),CONVERT(datetime, CLI.[LastContactDate], 103),120) END) DESC,
                    (CASE WHEN CLI.DateCreated IS NULL THEN '' ELSE CONVERT(VARCHAR(10),CLI.DateCreated,120) END) DESC,
                    (CASE CLI.Blacklisted WHEN 'Y' THEN 'true' ELSE 'false' END) DESC,
                    (CASE CLI.GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    [CELERITY_ST_BOOKINGS].BookingSourcePrimary,
                    COALESCE([SL_Simplified_SalesOffice].[SalesOfficeSimplified],[CELERITY_ST_BOOKINGS].BookingOfficeLocation),
                    [CELERITY_ST_BOOKINGS].BookingLanguageFull,
                    [CELERITY_ST_BOOKINGS].ProductName,
                    [CELERITY_ST_BOOKINGS].AreaName,
                    CLI.ClientCode,
                    COALESCE([SL_Simplified_Title].[TitleSimplified],''),
                    CLI.FirstName,
                    CLI.LastName,
                    CLI.City,
                    CLI.County,
                    CLI.Postcode,
                    COALESCE([SL_Simplified_Triton_Client_Country].[CountrySimplified],CLI.Country),
                    (CASE WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1,3,1) IN ('X','L','P') THEN 'Catamaran' ELSE 'Monohull' END),
                    CLI.[Add1],
                    CLI.[Add2],
                    CLI.[Add3],
                    CLI.[Phone1],
                    CLI.[Phone2],
                    CLI.[BusinessPhone],
                    CLI.DateOfBirth,
                    [CELERITY_ST_BOOKINGS].ExecutiveReportingRegion,
                    CLI.NumberOfCharters,
                    [CELERITY_ST_BOOKINGS].Duration,
                    [CELERITY_ST_BOOKINGS].UserDefinable1,
                    CLI.CustomerLinkCode,
                    CLI.[CustomerClass],
                    CLI.ClientSourceCode,
                    [SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified]
                    ) AS RankResultCancellation
                FROM 
                    [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKINGS] WITH (NOLOCK)
                INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKEDPASSENGERS] WITH (NOLOCK)
                    ON [CELERITY_ST_BOOKEDPASSENGERS].BookRef=[CELERITY_ST_BOOKINGS].BookRef
                INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENT] CLI WITH (NOLOCK)
                    ON CLI.ClientCode=[CELERITY_ST_BOOKEDPASSENGERS].ClientCode
                    AND CLI.Brand = 'M'
                LEFT JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENTPREFERENCES] WITH (NOLOCK)
                    ON [CELERITY_ST_CLIENTPREFERENCES].ClientCode = CLI.ClientCode
                LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_SalesOffice] WITH (NOLOCK)
                    ON [SL_Simplified_SalesOffice].BrandName=[CELERITY_ST_BOOKINGS].BrandName AND [SL_Simplified_SalesOffice].[SalesOfficeFromRawData]=[CELERITY_ST_BOOKINGS].BookingOfficeLocation
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
                    [CELERITY_ST_BOOKINGS].BrandName ='MRG'
                AND [CELERITY_ST_BOOKINGS].Status IN ('Booking','Cancelled')
                AND [CELERITY_ST_BOOKINGS].CancelledDate IS NOT NULL
                AND [CELERITY_ST_BOOKINGS].BookingSourcePrimary NOT IN ('PR-Pr free trip','TAAC-Ta on account','PR-Public relations-mor','PRESS-Bericht in der press','STAFF-Staff booking','OWNS-Owner with no paymen','OS-Wot-offshore sailing','OWNER-Owner','DAYCH-Day charter discount','LOCAL-Local booking','OS-Offshore sailing','OSS-Offshore sailing','OW-Owner use','OPS-Operations/maintenan','TA','STHOL-Staff holiday','TAGEN-Travel agent','OSSFF-Staff friends & fami','LOCA2-Local booking','TO-Tour operator')
                AND [CELERITY_ST_BOOKINGS].AreaCode NOT IN ('UKD','UK1','CVO','SS1','UK2','SS2','UK3','FLT','UK4')
                AND [CELERITY_ST_BOOKINGS].ProductName IN ('SAILING_SCHOOLS','CREWED','FLOTILLA','FRANCHISE','FOOTLOOSE','BAREBOAT','CORPORATE','POWER')
                AND [CELERITY_ST_BOOKINGS].BookingType ='DIRECT'
                AND [CELERITY_ST_BOOKINGS].UserDefinable1 IS NOT NULL
                AND LTRIM(RTRIM([CELERITY_ST_BOOKINGS].UserDefinable1)) <> '' 
                AND CLI.Email1 LIKE '%_@%_.__%'
                AND CLI.Email1 not like '%[[]%' AND CLI.Email1 not like '%]%' AND CLI.Email1 not like '%(%' AND CLI.Email1 not like '%)%' AND CLI.Email1 not like '%''%' AND CLI.Email1 not like '% %'
                --Search all bookings for most recent cancellation records
                --AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,GETDATE()-8) AND CONVERT(DATE,GETDATE()-1)
                --AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN '2017-08-03' AND '2017-09-10'
            ) CancelledBookingsInnerSelect
            WHERE RankResultCancellation = 1
        ) CancelledBookings
        ON CancelledBookings.CancellationClientCode = CLI.ClientCode
        WHERE 
            [CELERITY_ST_BOOKINGS].BrandName ='MRG'
        AND [CELERITY_ST_BOOKINGS].Status IN ('Booking','Cancelled')
        AND [CELERITY_ST_BOOKINGS].BookingSourcePrimary NOT IN ('PR-Pr free trip','TAAC-Ta on account','PR-Public relations-mor','PRESS-Bericht in der press','STAFF-Staff booking','OWNS-Owner with no paymen','OS-Wot-offshore sailing','OWNER-Owner','DAYCH-Day charter discount','LOCAL-Local booking','OS-Offshore sailing','OSS-Offshore sailing','OW-Owner use','OPS-Operations/maintenan','TA','STHOL-Staff holiday','TAGEN-Travel agent','OSSFF-Staff friends & fami','LOCA2-Local booking','TO-Tour operator')
        AND [CELERITY_ST_BOOKINGS].AreaCode NOT IN ('UKD','UK1','CVO','SS1','UK2','SS2','UK3','FLT','UK4')
        AND [CELERITY_ST_BOOKINGS].ProductName IN ('SAILING_SCHOOLS','CREWED','FLOTILLA','FRANCHISE','FOOTLOOSE','BAREBOAT','CORPORATE','POWER')
        AND [CELERITY_ST_BOOKINGS].BookingType ='DIRECT'
        AND [CELERITY_ST_BOOKINGS].UserDefinable1 IS NOT NULL
        AND LTRIM(RTRIM([CELERITY_ST_BOOKINGS].UserDefinable1)) <> '' 
        AND CLI.Email1 LIKE '%_@%_.__%'
        AND CLI.Email1 not like '%[[]%' AND CLI.Email1 not like '%]%' AND CLI.Email1 not like '%(%' AND CLI.Email1 not like '%)%' AND CLI.Email1 not like '%''%' AND CLI.Email1 not like '% %'
        AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,'2010-01-01', 120) AND CONVERT(DATE,GETDATE()-1)
--        AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,GETDATE()-10) AND CONVERT(DATE,GETDATE()-1)
--        AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,'2013-01-01', 120) AND CONVERT(DATE, '2013-12-31', 120)
--        AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,'2016-01-01', 120) AND CONVERT(DATE, '2016-12-31', 120)
    ) Result

    WHERE RankResultMostRecentBooking=1
    ORDER BY ConfirmDate

END


GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_TRITON_TM_BROCHURE_REQUESTS]    Script Date: 09/08/2018 08:16:37 ******/
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
-- 21-May-2018      1.6         Tim Wilson         Corrections for dedupe logic
--========================================================================================================================

CREATE PROC [dbo].[BUILD_HUBSPOT_TRITON_TM_BROCHURE_REQUESTS]
AS
BEGIN
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
            [CELERITY_ST_CLIENT].[FirstName],
            [CELERITY_ST_CLIENT].[LastName],
            [CELERITY_ST_CLIENT].[City],
            [CELERITY_ST_CLIENT].[County],
            [CELERITY_ST_CLIENT].[Postcode],
            COALESCE([SL_Simplified_Triton_Client_Country].[CountrySimplified],[CELERITY_ST_CLIENT].Country,'') AS Country,
            [CELERITY_ST_CLIENT].[Email1] AS Email,
            CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromMailing WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromMailing,
            CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromEmail,
            CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromBrochure,
            [CELERITY_ST_CLIENT].[Deceased],
            CASE [CELERITY_ST_CLIENT].Blacklisted WHEN 'Y' THEN 'true' ELSE 'false' END AS Blacklisted,
            COALESCE([SL_Simplified_BrochureName].[BrochureNameSimplified],[CELERITY_ST_BROCHUREREQUEST].[BrochureName],'') AS BrochureProductRequested,
            CASE WHEN [CELERITY_ST_BROCHUREREQUEST].[DateRequested] IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', [CELERITY_ST_BROCHUREREQUEST].[DateRequested]))*60*60*1000) END AS BrochureDateRequested,
            COALESCE([CELERITY_ST_CLIENT].[Add1],'') AS Address1,
            COALESCE([CELERITY_ST_CLIENT].[Add2],'') AS Address2,
            COALESCE([CELERITY_ST_CLIENT].[Add3],'') AS Address3,
            COALESCE([CELERITY_ST_CLIENT].[Phone1],'') AS Phone1,
            COALESCE([CELERITY_ST_CLIENT].[Phone2],'') AS Phone2,
            COALESCE([CELERITY_ST_CLIENT].[BusinessPhone],'') AS BusinessPhone,
            CASE WHEN [CELERITY_ST_CLIENT].DateOfBirth IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', [CELERITY_ST_CLIENT].DateOfBirth))*60*60*1000) END AS DateOfBirth,
            COALESCE([CELERITY_ST_CLIENT].CustomerLinkCode,'') AS CustomerLinkCode,
            COALESCE([CELERITY_ST_CLIENT].[CustomerClass],'') AS CustomerClass,
            CASE [CELERITY_ST_CLIENT].GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END AS GoneAway,
            COALESCE(CELERITY_ST_CLIENT.ClientSourceCode,'') AS ClientSourceCode,
            'Brochure' AS Status,  
            COALESCE([SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified],'') AS ClientBookingOffice,
            DENSE_RANK() OVER(PARTITION BY [CELERITY_ST_CLIENT].[Email1] 
            ORDER BY 
                [CELERITY_ST_BROCHUREREQUEST].[DateRequested] DESC,
                (CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,    
                (CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromMailing WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                (CASE WHEN [CELERITY_ST_CLIENT].[LastContactDate] = '0' OR [CELERITY_ST_CLIENT].[LastContactDate] IS NULL THEN '' ELSE CONVERT(VARCHAR(10),CONVERT(datetime, [CELERITY_ST_CLIENT].[LastContactDate], 103),120) END) DESC,
                (CASE WHEN [CELERITY_ST_CLIENT].DateCreated IS NULL THEN '' ELSE CONVERT(VARCHAR(10),[CELERITY_ST_CLIENT].DateCreated,120) END) Desc,
                (CASE [CELERITY_ST_CLIENT].Blacklisted WHEN 'Y' THEN 'true' ELSE 'false' END) DESC,
                (CASE [CELERITY_ST_CLIENT].GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                CELERITY_ST_CLIENT.ClientCode DESC,
                COALESCE([SL_Simplified_SalesOffice].[SalesOfficeSimplified],[CELERITY_ST_BROCHUREREQUEST].[Location]),
                COALESCE([SL_Simplified_Title].[TitleSimplified],''),
                [CELERITY_ST_CLIENT].[FirstName],
                [CELERITY_ST_CLIENT].[LastName], 
                [CELERITY_ST_CLIENT].[City],
                [CELERITY_ST_CLIENT].[County],
                [CELERITY_ST_CLIENT].[Postcode],
                COALESCE([SL_Simplified_Triton_Client_Country].[CountrySimplified],[CELERITY_ST_CLIENT].Country),
                COALESCE([SL_Simplified_BrochureName].[BrochureNameSimplified],[CELERITY_ST_BROCHUREREQUEST].[BrochureName]),
                [CELERITY_ST_CLIENT].[Add1],
                [CELERITY_ST_CLIENT].[Add2],
                [CELERITY_ST_CLIENT].[Add3],
                [CELERITY_ST_CLIENT].[Phone1],
                [CELERITY_ST_CLIENT].[Phone2],
                [CELERITY_ST_CLIENT].[BusinessPhone],
                [CELERITY_ST_CLIENT].DateOfBirth,
                [CELERITY_ST_CLIENT].CustomerLinkCode,
                [CELERITY_ST_CLIENT].[CustomerClass],
                CELERITY_ST_CLIENT.ClientSourceCode,
                [SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified]
            ) AS RankResult,

            -- DWYT-16 New HubSpot API fields
            CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromTelephone,
            CASE WHEN [CELERITY_ST_CLIENT].[LastContactDate] = '0' OR [CELERITY_ST_CLIENT].[LastContactDate] IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', CONVERT(datetime, [CELERITY_ST_CLIENT].[LastContactDate], 103)))*60*60*1000) END AS LastContactDate,
            CASE WHEN [CELERITY_ST_CLIENT].DateCreated IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', [CELERITY_ST_CLIENT].DateCreated))*60*60*1000) END AS TritonCreateDate,
            COALESCE(REPLACE(REPLACE(REPLACE([CELERITY_ST_CLIENT].ClientCode, 'TRT-M',''), 'TRT-S', ''), 'TRT-', ''), '') AS CleanClientID

        FROM
            [CelerityMarine_Stage].[dbo].[CELERITY_ST_BROCHUREREQUEST] WITH (NOLOCK)
        INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENT] WITH (NOLOCK)
            ON [CELERITY_ST_CLIENT].ClientCode=[CELERITY_ST_BROCHUREREQUEST].ClientCode
            AND [CELERITY_ST_CLIENT].Brand = 'M'
        INNER JOIN [HUBSPOT].[dbo].[SL_Simplified_BrochureName] WITH (NOLOCK)
            ON [SL_Simplified_BrochureName].[BrochureNameActual]=[CELERITY_ST_BROCHUREREQUEST].[BrochureName] AND [SL_Simplified_BrochureName].[BrandName]='MRG'
        LEFT JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENTPREFERENCES] WITH (NOLOCK)
            ON [CELERITY_ST_CLIENTPREFERENCES].ClientCode=[CELERITY_ST_CLIENT].ClientCode
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_SalesOffice] WITH (NOLOCK)
            ON [SL_Simplified_SalesOffice].BrandName ='MRG' AND [SL_Simplified_SalesOffice].[SalesOfficeFromRawData]=[CELERITY_ST_BROCHUREREQUEST].[Location]
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Triton_Client_Country] WITH (NOLOCK)
            ON [SL_Simplified_Triton_Client_Country].[CountryActual]=[CELERITY_ST_CLIENT].Country
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Title] WITH (NOLOCK)
            ON [SL_Simplified_Title].[TitleActual]=[CELERITY_ST_CLIENT].Title
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_ClientBookingOffice] WITH (NOLOCK)
            ON [SL_Simplified_ClientBookingOffice].[ClientBookingOfficeActual]=[CELERITY_ST_CLIENT].BookingOffice
        WHERE
            [CELERITY_ST_BROCHUREREQUEST].[DateRequested] BETWEEN CONVERT(DATE,GETDATE()-10) AND CONVERT(DATE,GETDATE()-1)
--      AND [CELERITY_ST_BROCHUREREQUEST].[DateRequested] BETWEEN CONVERT(DATE,'2013-01-01', 120) AND CONVERT(DATE, '2013-12-31', 120)
--        AND [CELERITY_ST_BROCHUREREQUEST].[DateRequested] BETWEEN CONVERT(DATE,'2016-01-01', 120) AND CONVERT(DATE, '2016-12-31', 120)
        AND [CELERITY_ST_CLIENT].Email1 LIKE '%_@%_.__%'
        AND [CELERITY_ST_CLIENT].Email1 not like '%[[]%' AND [CELERITY_ST_CLIENT].Email1 not like '%]%' AND [CELERITY_ST_CLIENT].Email1 not like '%(%' AND [CELERITY_ST_CLIENT].Email1 not like '%)%' AND [CELERITY_ST_CLIENT].Email1 not like '%''%' AND [CELERITY_ST_CLIENT].Email1 not like '% %'
    ) Result
    Where 
        RankResult=1
    ORDER BY 
        BrochureDateRequested
END

GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_TRITON_TM_BROCHURE_REQUESTS_8YR]    Script Date: 09/08/2018 08:16:37 ******/
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
--========================================================================================================================

CREATE PROC [dbo].[BUILD_HUBSPOT_TRITON_TM_BROCHURE_REQUESTS_8YR]
AS
BEGIN
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
            [CELERITY_ST_CLIENT].[FirstName],
            [CELERITY_ST_CLIENT].[LastName],
            [CELERITY_ST_CLIENT].[City],
            [CELERITY_ST_CLIENT].[County],
            [CELERITY_ST_CLIENT].[Postcode],
            COALESCE([SL_Simplified_Triton_Client_Country].[CountrySimplified],[CELERITY_ST_CLIENT].Country,'') AS Country,
            [CELERITY_ST_CLIENT].[Email1] AS Email,
            CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromMailing WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromMailing,
            CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromEmail,
            CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromBrochure,
            [CELERITY_ST_CLIENT].[Deceased],
            CASE [CELERITY_ST_CLIENT].Blacklisted WHEN 'Y' THEN 'true' ELSE 'false' END AS Blacklisted,
            COALESCE([SL_Simplified_BrochureName].[BrochureNameSimplified],[CELERITY_ST_BROCHUREREQUEST].[BrochureName],'') AS BrochureProductRequested,
            CASE WHEN [CELERITY_ST_BROCHUREREQUEST].[DateRequested] IS NULL THEN '' ELSE CONVERT(VARCHAR(10),[CELERITY_ST_BROCHUREREQUEST].[DateRequested],120) END AS BrochureDateRequested,
            COALESCE([CELERITY_ST_CLIENT].[Add1],'') AS Address1,
            COALESCE([CELERITY_ST_CLIENT].[Add2],'') AS Address2,
            COALESCE([CELERITY_ST_CLIENT].[Add3],'') AS Address3,
            COALESCE([CELERITY_ST_CLIENT].[Phone1],'') AS Phone1,
            COALESCE([CELERITY_ST_CLIENT].[Phone2],'') AS Phone2,
            COALESCE([CELERITY_ST_CLIENT].[BusinessPhone],'') AS BusinessPhone,
            CASE WHEN [CELERITY_ST_CLIENT].DateOfBirth IS NULL THEN '' ELSE CONVERT(VARCHAR(10),[CELERITY_ST_CLIENT].DateOfBirth,120) END AS DateOfBirth,
            COALESCE([CELERITY_ST_CLIENT].CustomerLinkCode,'') AS CustomerLinkCode,
            COALESCE([CELERITY_ST_CLIENT].[CustomerClass],'') AS CustomerClass,
            CASE [CELERITY_ST_CLIENT].GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END AS GoneAway,
            COALESCE(CELERITY_ST_CLIENT.ClientSourceCode,'') AS ClientSourceCode,
            'Brochure' AS Status,  
            COALESCE([SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified],'') AS ClientBookingOffice,
            DENSE_RANK() OVER(PARTITION BY [CELERITY_ST_CLIENT].[Email1] 
            ORDER BY 
                [CELERITY_ST_BROCHUREREQUEST].[DateRequested] DESC,
                (CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,    
                (CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromMailing WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                (CASE WHEN [CELERITY_ST_CLIENT].[LastContactDate] = '0' OR [CELERITY_ST_CLIENT].[LastContactDate] IS NULL THEN '' ELSE CONVERT(VARCHAR(10),CONVERT(datetime, [CELERITY_ST_CLIENT].[LastContactDate], 103),120) END) DESC,
                (CASE WHEN [CELERITY_ST_CLIENT].DateCreated IS NULL THEN '' ELSE CONVERT(VARCHAR(10),[CELERITY_ST_CLIENT].DateCreated,120) END) Desc,
                (CASE [CELERITY_ST_CLIENT].Blacklisted WHEN 'Y' THEN 'true' ELSE 'false' END) DESC,
                (CASE [CELERITY_ST_CLIENT].GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                CELERITY_ST_CLIENT.ClientCode DESC,
                COALESCE([SL_Simplified_SalesOffice].[SalesOfficeSimplified],[CELERITY_ST_BROCHUREREQUEST].[Location]),
                COALESCE([SL_Simplified_Title].[TitleSimplified],''),
                [CELERITY_ST_CLIENT].[FirstName],
                [CELERITY_ST_CLIENT].[LastName], 
                [CELERITY_ST_CLIENT].[City],
                [CELERITY_ST_CLIENT].[County],
                [CELERITY_ST_CLIENT].[Postcode],
                COALESCE([SL_Simplified_Triton_Client_Country].[CountrySimplified],[CELERITY_ST_CLIENT].Country),
                COALESCE([SL_Simplified_BrochureName].[BrochureNameSimplified],[CELERITY_ST_BROCHUREREQUEST].[BrochureName]),
                [CELERITY_ST_CLIENT].[Add1],
                [CELERITY_ST_CLIENT].[Add2],
                [CELERITY_ST_CLIENT].[Add3],
                [CELERITY_ST_CLIENT].[Phone1],
                [CELERITY_ST_CLIENT].[Phone2],
                [CELERITY_ST_CLIENT].[BusinessPhone],
                [CELERITY_ST_CLIENT].DateOfBirth,
                [CELERITY_ST_CLIENT].CustomerLinkCode,
                [CELERITY_ST_CLIENT].[CustomerClass],
                CELERITY_ST_CLIENT.ClientSourceCode,
                [SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified]
            ) AS RankResult,

            -- DWYT-16 New HubSpot API fields
            CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromTelephone,
            CASE WHEN [CELERITY_ST_CLIENT].[LastContactDate] = '0' OR [CELERITY_ST_CLIENT].[LastContactDate] IS NULL THEN '' ELSE CONVERT(VARCHAR(10),CONVERT(datetime, [CELERITY_ST_CLIENT].[LastContactDate], 103),120) END AS LastContactDate,
            CASE WHEN [CELERITY_ST_CLIENT].DateCreated IS NULL THEN '' ELSE CONVERT(VARCHAR(10),[CELERITY_ST_CLIENT].DateCreated,120) END AS TritonCreateDate,
            COALESCE(REPLACE(REPLACE(REPLACE([CELERITY_ST_CLIENT].ClientCode, 'TRT-M',''), 'TRT-S', ''), 'TRT-', ''), '') AS CleanClientID

        FROM
            [CelerityMarine_Stage].[dbo].[CELERITY_ST_BROCHUREREQUEST] WITH (NOLOCK)
        INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENT] WITH (NOLOCK)
            ON [CELERITY_ST_CLIENT].ClientCode=[CELERITY_ST_BROCHUREREQUEST].ClientCode
            AND [CELERITY_ST_CLIENT].Brand = 'M'
        INNER JOIN [HUBSPOT].[dbo].[SL_Simplified_BrochureName] WITH (NOLOCK)
            ON [SL_Simplified_BrochureName].[BrochureNameActual]=[CELERITY_ST_BROCHUREREQUEST].[BrochureName] AND [SL_Simplified_BrochureName].[BrandName]='MRG'
        LEFT JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENTPREFERENCES] WITH (NOLOCK)
            ON [CELERITY_ST_CLIENTPREFERENCES].ClientCode=[CELERITY_ST_CLIENT].ClientCode
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_SalesOffice] WITH (NOLOCK)
            ON [SL_Simplified_SalesOffice].BrandName ='MRG' AND [SL_Simplified_SalesOffice].[SalesOfficeFromRawData]=[CELERITY_ST_BROCHUREREQUEST].[Location]
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Triton_Client_Country] WITH (NOLOCK)
            ON [SL_Simplified_Triton_Client_Country].[CountryActual]=[CELERITY_ST_CLIENT].Country
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Title] WITH (NOLOCK)
            ON [SL_Simplified_Title].[TitleActual]=[CELERITY_ST_CLIENT].Title
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_ClientBookingOffice] WITH (NOLOCK)
            ON [SL_Simplified_ClientBookingOffice].[ClientBookingOfficeActual]=[CELERITY_ST_CLIENT].BookingOffice
        WHERE
            [CELERITY_ST_BROCHUREREQUEST].[DateRequested] BETWEEN CONVERT(DATE,'2010-01-01', 120) AND CONVERT(DATE,GETDATE()-1)
--            [CELERITY_ST_BROCHUREREQUEST].[DateRequested] BETWEEN CONVERT(DATE,GETDATE()-10) AND CONVERT(DATE,GETDATE()-1)
--      AND [CELERITY_ST_BROCHUREREQUEST].[DateRequested] BETWEEN CONVERT(DATE,'2013-01-01', 120) AND CONVERT(DATE, '2013-12-31', 120)
--        AND [CELERITY_ST_BROCHUREREQUEST].[DateRequested] BETWEEN CONVERT(DATE,'2016-01-01', 120) AND CONVERT(DATE, '2016-12-31', 120)
        AND [CELERITY_ST_CLIENT].Email1 LIKE '%_@%_.__%'
        AND [CELERITY_ST_CLIENT].Email1 not like '%[[]%' AND [CELERITY_ST_CLIENT].Email1 not like '%]%' AND [CELERITY_ST_CLIENT].Email1 not like '%(%' AND [CELERITY_ST_CLIENT].Email1 not like '%)%' AND [CELERITY_ST_CLIENT].Email1 not like '%''%' AND [CELERITY_ST_CLIENT].Email1 not like '% %'
    ) Result
    Where 
        RankResult=1
    ORDER BY 
        BrochureDateRequested
END

GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_TRITON_TM_ENEWS]    Script Date: 09/08/2018 08:16:37 ******/
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
-- 21-May-2018      1.6         Tim Wilson         Corrections for dedupe logic
--========================================================================================================================

CREATE PROC [dbo].[BUILD_HUBSPOT_TRITON_TM_ENEWS]
AS
BEGIN
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
            CASE WHEN TRT_TRITON_ST_EFMST.EFETDT IS NULL OR TRT_TRITON_ST_EFMST.EFETDT = 0 THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', CONVERT(DATETIME, CONVERT(VARCHAR(8), TRT_TRITON_ST_EFMST.EFETDT), 112)))*60*60*1000) END AS EnewsDateRequested,
            COALESCE([CELERITY_ST_CLIENT].[Add1],'') AS Address1,
            COALESCE([CELERITY_ST_CLIENT].[Add2],'') AS Address2,
            COALESCE([CELERITY_ST_CLIENT].[Add3],'') AS Address3,
            COALESCE([CELERITY_ST_CLIENT].[Phone1],'') AS Phone1,
            COALESCE([CELERITY_ST_CLIENT].[Phone2],'') AS Phone2,
            COALESCE([CELERITY_ST_CLIENT].[BusinessPhone],'') AS BusinessPhone,
            CASE WHEN [CELERITY_ST_CLIENT].DateOfBirth IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', [CELERITY_ST_CLIENT].DateOfBirth))*60*60*1000) END AS DateOfBirth,
            --COALESCE([CELERITY_ST_CLIENT].NumberOfCharters,'') AS NumberOfCharters, -- Ignore for now
            COALESCE([CELERITY_ST_CLIENT].CustomerLinkCode,'') AS CustomerLinkCode,
            COALESCE([CELERITY_ST_CLIENT].[CustomerClass],'') AS CustomerClass,
            CASE [CELERITY_ST_CLIENT].GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END AS GoneAway,
            COALESCE(CELERITY_ST_CLIENT.ClientSourceCode,'') AS ClientSourceCode,
            'Enews' as Status,
            COALESCE([SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified],'') AS ClientBookingOffice,
            DENSE_RANK() OVER(PARTITION BY TRT_TRITON_ST_EFMST.EFMAIL 
                ORDER BY 
                CAST(CASE ISNULL(TRT_TRITON_ST_EFMST.EFETDT,0) WHEN 0 THEN NULL ELSE CONVERT(DATETIME, CONVERT(VARCHAR(8), TRT_TRITON_ST_EFMST.EFETDT), 112) END AS Datetime) DESC,
                (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromEmail] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                (CASE WHEN [CELERITY_ST_CLIENT].[LastContactDate] = '0' OR [CELERITY_ST_CLIENT].[LastContactDate] IS NULL THEN '' ELSE CONVERT(VARCHAR(10),CONVERT(datetime, [CELERITY_ST_CLIENT].[LastContactDate], 103),120) END) DESC,
                (CASE WHEN [CELERITY_ST_CLIENT].[DateCreated] IS NULL THEN '' ELSE CONVERT(VARCHAR(10),[CELERITY_ST_CLIENT].DateCreated,120) END) DESC,
                (CASE [CELERITY_ST_CLIENT].GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                CELERITY_ST_CLIENT.ClientCode DESC,
                [SL_ISO_SalesOffice].[SalesOffice],
                [SL_ISO_SalesOffice].[Language],
                COALESCE([SL_Simplified_Title].[TitleSimplified],''),
                TRT_TRITON_ST_EFMST.EFFNAM,
                TRT_TRITON_ST_EFMST.EFLNAM,
                COALESCE([SL_Simplified_Triton_Client_Country].[CountrySimplified],[SL_ISO_SalesOffice].[CountryOfResidence]),
                COALESCE([SL_EFSITE_PRODUCT_INTEREST].[ProductInterest],TRT_TRITON_ST_EFMST.EFSITE),
                [CELERITY_ST_CLIENT].[Add1],
                [CELERITY_ST_CLIENT].[Add2],
                [CELERITY_ST_CLIENT].[Add3],
                [CELERITY_ST_CLIENT].[Phone1],
                [CELERITY_ST_CLIENT].[Phone2],
                [CELERITY_ST_CLIENT].[BusinessPhone],
                [CELERITY_ST_CLIENT].DateOfBirth,
                --[CELERITY_ST_CLIENT].NumberOfCharters,
                [CELERITY_ST_CLIENT].CustomerLinkCode,
                [CELERITY_ST_CLIENT].[CustomerClass],
                CELERITY_ST_CLIENT.ClientSourceCode,
                [SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified]
            ) AS RankResult,

            -- DWYT-16 New HubSpot API fields
            CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromTelephone,
            CASE WHEN [CELERITY_ST_CLIENT].[LastContactDate] = '0' OR [CELERITY_ST_CLIENT].[LastContactDate] IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', CONVERT(datetime, [CELERITY_ST_CLIENT].[LastContactDate], 103)))*60*60*1000) END AS LastContactDate,
            CASE WHEN [CELERITY_ST_CLIENT].[DateCreated] IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', [CELERITY_ST_CLIENT].DateCreated))*60*60*1000) END AS TritonCreateDate,
            COALESCE([CELERITY_ST_CLIENT].[Deceased],'') AS Deceased,
            CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromEmail,
            CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromBrochure,
            COALESCE([CELERITY_ST_CLIENT].ClientCode,'') AS ClientCode
            
        FROM 
            [CelerityMarine_Stage].[dbo].[TRT_Triton_ST_EFMST] WITH (NOLOCK)
        LEFT JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENT] WITH (NOLOCK) 
            ON REPLACE([CELERITY_ST_CLIENT].Email1,'\@','@') = REPLACE(TRT_TRITON_ST_EFMST.EFMAIL,'\@','@')
            AND [CELERITY_ST_CLIENT].Email1 != ''
            AND [CELERITY_ST_CLIENT].Brand = 'M'
        LEFT JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENTPREFERENCES] WITH (NOLOCK)
            ON [CELERITY_ST_CLIENTPREFERENCES].ClientCode=[CELERITY_ST_CLIENT].ClientCode
        LEFT JOIN [HUBSPOT].[dbo].[SL_ISO_SalesOffice] WITH (NOLOCK) 
            ON [SL_ISO_SalesOffice].[ISO_Code]=TRT_TRITON_ST_EFMST.EFCTCD
        LEFT JOIN [HUBSPOT].[dbo].[SL_EFSITE_PRODUCT_INTEREST] WITH (NOLOCK)
            ON [SL_EFSITE_PRODUCT_INTEREST].[EFSITE]=TRT_TRITON_ST_EFMST.EFSITE AND [SL_EFSITE_PRODUCT_INTEREST].[BrandName]='Moorings'
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Triton_Client_Country] WITH (NOLOCK)
            ON [SL_Simplified_Triton_Client_Country].[CountryActual]=[SL_ISO_SalesOffice].[CountryOfResidence]
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Title] WITH (NOLOCK)
            ON [SL_Simplified_Title].[TitleActual]=[CELERITY_ST_CLIENT].Title
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_ClientBookingOffice] WITH (NOLOCK)
            ON [SL_Simplified_ClientBookingOffice].[ClientBookingOfficeActual]=[CELERITY_ST_CLIENT].BookingOffice
        WHERE
            TRT_TRITON_ST_EFMST.EFMAIL LIKE '%_@%_.__%'
        AND TRT_TRITON_ST_EFMST.EFMAIL not like '%[[]%' AND TRT_TRITON_ST_EFMST.EFMAIL not like '%]%' AND TRT_TRITON_ST_EFMST.EFMAIL not like '%(%' AND TRT_TRITON_ST_EFMST.EFMAIL not like '%)%' AND TRT_TRITON_ST_EFMST.EFMAIL not like '%''%' AND TRT_TRITON_ST_EFMST.EFMAIL not like '% %'
        AND TRT_TRITON_ST_EFMST.EFETDT != 0
        AND TRT_TRITON_ST_EFMST.EFETDT >= CONVERT(VARCHAR(8),GETDATE()-10,112) AND TRT_TRITON_ST_EFMST.EFETDT <= CONVERT(VARCHAR(8),GETDATE()-1,112)
--        AND TRT_TRITON_ST_EFMST.EFETDT BETWEEN 20130101 AND 20131231
--        AND TRT_TRITON_ST_EFMST.EFETDT BETWEEN 20160101 AND 20161231
    ) Result
    Where RankResult=1
END


GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_TRITON_TM_ENEWS_8YR]    Script Date: 09/08/2018 08:16:37 ******/
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
--========================================================================================================================

CREATE PROC [dbo].[BUILD_HUBSPOT_TRITON_TM_ENEWS_8YR]
AS
BEGIN
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
            CASE WHEN TRT_TRITON_ST_EFMST.EFETDT IS NULL OR TRT_TRITON_ST_EFMST.EFETDT = 0 THEN '' ELSE CONVERT(VARCHAR(10),CONVERT(DATETIME, CONVERT(VARCHAR(8), TRT_TRITON_ST_EFMST.EFETDT), 112),120) END AS EnewsDateRequested,
            COALESCE([CELERITY_ST_CLIENT].[Add1],'') AS Address1,
            COALESCE([CELERITY_ST_CLIENT].[Add2],'') AS Address2,
            COALESCE([CELERITY_ST_CLIENT].[Add3],'') AS Address3,
            COALESCE([CELERITY_ST_CLIENT].[Phone1],'') AS Phone1,
            COALESCE([CELERITY_ST_CLIENT].[Phone2],'') AS Phone2,
            COALESCE([CELERITY_ST_CLIENT].[BusinessPhone],'') AS BusinessPhone,
            CASE WHEN [CELERITY_ST_CLIENT].DateOfBirth IS NULL THEN '' ELSE CONVERT(VARCHAR(10),[CELERITY_ST_CLIENT].DateOfBirth,120) END AS DateOfBirth,
            --COALESCE([CELERITY_ST_CLIENT].NumberOfCharters,'') AS NumberOfCharters, -- Ignore for now
            COALESCE([CELERITY_ST_CLIENT].CustomerLinkCode,'') AS CustomerLinkCode,
            COALESCE([CELERITY_ST_CLIENT].[CustomerClass],'') AS CustomerClass,
            CASE [CELERITY_ST_CLIENT].GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END AS GoneAway,
            COALESCE(CELERITY_ST_CLIENT.ClientSourceCode,'') AS ClientSourceCode,
            'Enews' as Status,
            COALESCE([SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified],'') AS ClientBookingOffice,
            DENSE_RANK() OVER(PARTITION BY TRT_TRITON_ST_EFMST.EFMAIL 
                ORDER BY 
                CAST(CASE ISNULL(TRT_TRITON_ST_EFMST.EFETDT,0) WHEN 0 THEN NULL ELSE CONVERT(DATETIME, CONVERT(VARCHAR(8), TRT_TRITON_ST_EFMST.EFETDT), 112) END AS Datetime) DESC,
                (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromEmail] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                (CASE WHEN [CELERITY_ST_CLIENT].[LastContactDate] = '0' OR [CELERITY_ST_CLIENT].[LastContactDate] IS NULL THEN '' ELSE CONVERT(VARCHAR(10),CONVERT(datetime, [CELERITY_ST_CLIENT].[LastContactDate], 103),120) END) DESC,
                (CASE WHEN [CELERITY_ST_CLIENT].[DateCreated] IS NULL THEN '' ELSE CONVERT(VARCHAR(10),[CELERITY_ST_CLIENT].DateCreated,120) END) DESC,
                (CASE [CELERITY_ST_CLIENT].GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                CELERITY_ST_CLIENT.ClientCode DESC,
                [SL_ISO_SalesOffice].[SalesOffice],
                [SL_ISO_SalesOffice].[Language],
                COALESCE([SL_Simplified_Title].[TitleSimplified],''),
                TRT_TRITON_ST_EFMST.EFFNAM,
                TRT_TRITON_ST_EFMST.EFLNAM,
                COALESCE([SL_Simplified_Triton_Client_Country].[CountrySimplified],[SL_ISO_SalesOffice].[CountryOfResidence]),
                COALESCE([SL_EFSITE_PRODUCT_INTEREST].[ProductInterest],TRT_TRITON_ST_EFMST.EFSITE),
                [CELERITY_ST_CLIENT].[Add1],
                [CELERITY_ST_CLIENT].[Add2],
                [CELERITY_ST_CLIENT].[Add3],
                [CELERITY_ST_CLIENT].[Phone1],
                [CELERITY_ST_CLIENT].[Phone2],
                [CELERITY_ST_CLIENT].[BusinessPhone],
                [CELERITY_ST_CLIENT].DateOfBirth,
                --[CELERITY_ST_CLIENT].NumberOfCharters,
                [CELERITY_ST_CLIENT].CustomerLinkCode,
                [CELERITY_ST_CLIENT].[CustomerClass],
                CELERITY_ST_CLIENT.ClientSourceCode,
                [SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified]
            ) AS RankResult,

            -- DWYT-16 New HubSpot API fields
            CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromTelephone,
            CASE WHEN [CELERITY_ST_CLIENT].[LastContactDate] = '0' OR [CELERITY_ST_CLIENT].[LastContactDate] IS NULL THEN '' ELSE CONVERT(VARCHAR(10),CONVERT(datetime, [CELERITY_ST_CLIENT].[LastContactDate], 103),120) END AS LastContactDate,
            CASE WHEN [CELERITY_ST_CLIENT].[DateCreated] IS NULL THEN '' ELSE CONVERT(VARCHAR(10),[CELERITY_ST_CLIENT].DateCreated,120) END AS TritonCreateDate,
            COALESCE([CELERITY_ST_CLIENT].[Deceased],'') AS Deceased,
            CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromEmail,
            CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromBrochure,
            COALESCE([CELERITY_ST_CLIENT].ClientCode,'') AS ClientCode
            
        FROM 
            [CelerityMarine_Stage].[dbo].[TRT_Triton_ST_EFMST] WITH (NOLOCK)
        LEFT JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENT] WITH (NOLOCK) 
            ON REPLACE([CELERITY_ST_CLIENT].Email1,'\@','@') = REPLACE(TRT_TRITON_ST_EFMST.EFMAIL,'\@','@')
            AND [CELERITY_ST_CLIENT].Email1 != ''
            AND [CELERITY_ST_CLIENT].Brand = 'M'
        LEFT JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENTPREFERENCES] WITH (NOLOCK)
            ON [CELERITY_ST_CLIENTPREFERENCES].ClientCode=[CELERITY_ST_CLIENT].ClientCode
        LEFT JOIN [HUBSPOT].[dbo].[SL_ISO_SalesOffice] WITH (NOLOCK) 
            ON [SL_ISO_SalesOffice].[ISO_Code]=TRT_TRITON_ST_EFMST.EFCTCD
        LEFT JOIN [HUBSPOT].[dbo].[SL_EFSITE_PRODUCT_INTEREST] WITH (NOLOCK)
            ON [SL_EFSITE_PRODUCT_INTEREST].[EFSITE]=TRT_TRITON_ST_EFMST.EFSITE AND [SL_EFSITE_PRODUCT_INTEREST].[BrandName]='Moorings'
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Triton_Client_Country] WITH (NOLOCK)
            ON [SL_Simplified_Triton_Client_Country].[CountryActual]=[SL_ISO_SalesOffice].[CountryOfResidence]
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Title] WITH (NOLOCK)
            ON [SL_Simplified_Title].[TitleActual]=[CELERITY_ST_CLIENT].Title
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_ClientBookingOffice] WITH (NOLOCK)
            ON [SL_Simplified_ClientBookingOffice].[ClientBookingOfficeActual]=[CELERITY_ST_CLIENT].BookingOffice
        WHERE
            TRT_TRITON_ST_EFMST.EFMAIL LIKE '%_@%_.__%'
        AND TRT_TRITON_ST_EFMST.EFMAIL not like '%[[]%' AND TRT_TRITON_ST_EFMST.EFMAIL not like '%]%' AND TRT_TRITON_ST_EFMST.EFMAIL not like '%(%' AND TRT_TRITON_ST_EFMST.EFMAIL not like '%)%' AND TRT_TRITON_ST_EFMST.EFMAIL not like '%''%' AND TRT_TRITON_ST_EFMST.EFMAIL not like '% %'
        AND TRT_TRITON_ST_EFMST.EFETDT != 0
--        AND TRT_TRITON_ST_EFMST.EFETDT >= CONVERT(VARCHAR(8),GETDATE()-10,112) AND TRT_TRITON_ST_EFMST.EFETDT <= CONVERT(VARCHAR(8),GETDATE()-1,112)
--        AND TRT_TRITON_ST_EFMST.EFETDT BETWEEN 20130101 AND 20131231
--        AND TRT_TRITON_ST_EFMST.EFETDT BETWEEN 20160101 AND 20161231
        AND TRT_TRITON_ST_EFMST.EFETDT BETWEEN 20100101 AND CONVERT(INT, CONVERT(VARCHAR(8),GETDATE()-1,112))
    ) Result
    Where RankResult=1
END


GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_TRITON_TM_QUOTES]    Script Date: 09/08/2018 08:16:37 ******/
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
-- 21-May-2018      1.7         Tim Wilson         Corrections for dedupe logic
--========================================================================================================================

CREATE PROC [dbo].[BUILD_HUBSPOT_TRITON_TM_QUOTES]
AS
BEGIN
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
            CLI.Email1 AS Email,
            CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromMailing WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromMailing,
            CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromEmail,
            CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromBrochure,
            CLI.Deceased,
            CASE CLI.Blacklisted WHEN 'Y' THEN 'true' ELSE 'false' END AS Blacklisted,
            [SL_Simplified_ProductName].ProductNameSimplified AS QuoteProductName,
            CASE WHEN [CELERITY_ST_BOOKINGS].BookingDate IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', [CELERITY_ST_BOOKINGS].BookingDate))*60*60*1000) END AS QuoteDateRequested,
            CASE WHEN [CELERITY_ST_BOOKINGS].DepartureDate IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', [CELERITY_ST_BOOKINGS].DepartureDate))*60*60*1000) END AS QuoteDepartureDate,
            COALESCE([SL_BaseNameFull].[BaseName],[CELERITY_ST_BOOKINGS].AreaName) AS QuoteDestination,
            CASE WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1,3,1) IN ('X','L','P') THEN 'Catamaran' ELSE 'Monohull' END AS QuoteHullType, 
            COALESCE(CLI.[Add1],'') AS Address1,
            COALESCE(CLI.[Add2],'') AS Address2,
            COALESCE(CLI.[Add3],'') AS Address3,
            COALESCE(CLI.[Phone1],'') AS Phone1,
            COALESCE(CLI.[Phone2],'') AS Phone2,
            COALESCE(CLI.[BusinessPhone],'') AS BusinessPhone,
            CASE WHEN CLI.DateOfBirth IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', CLI.DateOfBirth))*60*60*1000) END AS DateOfBirth,
            COALESCE([CELERITY_ST_BOOKINGS].ExecutiveReportingRegion,'') AS QuoteExecutiveReportingRegion,
            COALESCE([CELERITY_ST_BOOKINGS].UserDefinable1,'') AS QuoteBoat,
            COALESCE([CELERITY_ST_BOOKINGS].BookRef,'') AS QuoteBookRef,
            COALESCE(CLI.CustomerLinkCode,'') AS CustomerLinkCode,
            COALESCE(CLI.[CustomerClass],'') AS CustomerClass,
            CASE CLI.GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END AS GoneAway,
            COALESCE(CLI.ClientSourceCode,'') AS ClientSourceCode,
            [CELERITY_ST_BOOKINGS].[Status], 
            COALESCE([SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified],'') AS ClientBookingOffice,
            DENSE_RANK() OVER(PARTITION BY CLI.Email1 
                ORDER BY 
                    [CELERITY_ST_BOOKINGS].BookingDate DESC, 
                    [CELERITY_ST_BOOKINGS].DepartureDate DESC,
                    [CELERITY_ST_BOOKINGS].BookRef DESC, 
                    [CELERITY_ST_BOOKINGS].ConfirmDate DESC,
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,    
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromMailing WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE WHEN CLI.[LastContactDate] = '0' THEN '' ELSE CONVERT(VARCHAR(10),CONVERT(datetime, CLI.[LastContactDate], 103),120) END) DESC,
                    (CASE WHEN CLI.DateCreated IS NULL THEN '' ELSE CONVERT(VARCHAR(10),CLI.DateCreated,120) END) DESC,
                    (CASE CLI.Blacklisted WHEN 'Y' THEN 'true' ELSE 'false' END) DESC,
                    (CASE CLI.GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    [CELERITY_ST_BOOKINGS].BookingSourcePrimary,
                    COALESCE([SL_Simplified_SalesOffice].[SalesOfficeSimplified],[CELERITY_ST_BOOKINGS].BookingOfficeLocation),
                    [CELERITY_ST_BOOKINGS].BookingLanguageFull,
                    [CELERITY_ST_BOOKINGS].ProductName,
                    [CELERITY_ST_BOOKINGS].AreaName,
                    CLI.ClientCode,
                    COALESCE([SL_Simplified_Title].[TitleSimplified],''),
                    CLI.FirstName,
                    CLI.LastName,
                    CLI.City,
                    CLI.County,
                    CLI.Postcode,
                    COALESCE([SL_Simplified_Triton_Client_Country].[CountrySimplified],CLI.Country),
                    (CASE WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1,3,1) IN ('X','L','P') THEN 'Catamaran' ELSE 'Monohull' END),
                    CLI.[Add1],
                    CLI.[Add2],
                    CLI.[Add3],
                    CLI.[Phone1],
                    CLI.[Phone2],
                    CLI.[BusinessPhone],
                    CLI.DateOfBirth,
                    [CELERITY_ST_BOOKINGS].ExecutiveReportingRegion,
                    [CELERITY_ST_BOOKINGS].UserDefinable1,
                    CLI.CustomerLinkCode,
                    CLI.[CustomerClass],
                    CLI.ClientSourceCode,
                    [SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified]
            ) AS RankResultMostRecentQuote,

            -- DWYT-16 New HubSpot API fields
            CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromTelephone,
            '' AS Notes,
            CASE WHEN CLI.[LastContactDate] = '0' THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', CONVERT(datetime, CLI.[LastContactDate], 103)))*60*60*1000) END AS LastContactDate,
            CASE WHEN CLI.DateCreated IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', CLI.DateCreated))*60*60*1000) END AS TritonCreateDate,
            COALESCE(REPLACE(REPLACE(REPLACE(CLI.ClientCode, 'TRT-M',''), 'TRT-S', ''), 'TRT-', ''), '') AS CleanClientID,
            COALESCE([CELERITY_ST_BOOKINGS].AgentCode,'') AS QuoteSalesAgent
            
        FROM 
            [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKINGS] WITH (NOLOCK)
        INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKEDPASSENGERS] WITH (NOLOCK)
            ON [CELERITY_ST_BOOKEDPASSENGERS].BookRef=[CELERITY_ST_BOOKINGS].BookRef
        INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENT] CLI WITH (NOLOCK)
            ON CLI.ClientCode=[CELERITY_ST_BOOKEDPASSENGERS].ClientCode
            AND CLI.Brand = 'M'
        LEFT JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENTPREFERENCES] WITH (NOLOCK)
            ON [CELERITY_ST_CLIENTPREFERENCES].ClientCode = CLI.ClientCode
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_SalesOffice] WITH (NOLOCK)
            ON [SL_Simplified_SalesOffice].BrandName=[CELERITY_ST_BOOKINGS].BrandName AND [SL_Simplified_SalesOffice].[SalesOfficeFromRawData]=[CELERITY_ST_BOOKINGS].BookingOfficeLocation
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
        AND CLI.Email1 LIKE '%_@%_.__%'
        AND CLI.Email1 not like '%[[]%' AND CLI.Email1 not like '%]%' AND CLI.Email1 not like '%(%' AND CLI.Email1 not like '%)%' AND CLI.Email1 not like '%''%' AND CLI.Email1 not like '% %'
        AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,GETDATE()-10) AND CONVERT(DATE,GETDATE()-1)
--        AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,'2013-01-01', 120) AND CONVERT(DATE, '2013-12-31', 120)
--        AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,'2016-01-01', 120) AND CONVERT(DATE, '2016-12-31', 120)
    ) Result

    WHERE RankResultMostRecentQuote=1
    ORDER BY QuoteDateRequested

END


GO
/****** Object:  StoredProcedure [dbo].[BUILD_HUBSPOT_TRITON_TM_QUOTES_8YR]    Script Date: 09/08/2018 08:16:37 ******/
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
--========================================================================================================================

CREATE PROC [dbo].[BUILD_HUBSPOT_TRITON_TM_QUOTES_8YR]
AS
BEGIN
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
            CLI.Email1 AS Email,
            CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromMailing WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromMailing,
            CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromEmail,
            CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromBrochure,
            CLI.Deceased,
            CASE CLI.Blacklisted WHEN 'Y' THEN 'true' ELSE 'false' END AS Blacklisted,
            [SL_Simplified_ProductName].ProductNameSimplified AS QuoteProductName,
            CASE WHEN [CELERITY_ST_BOOKINGS].BookingDate IS NULL THEN '' ELSE CONVERT(VARCHAR(10),[CELERITY_ST_BOOKINGS].BookingDate,120) END AS QuoteDateRequested,
            CASE WHEN [CELERITY_ST_BOOKINGS].DepartureDate IS NULL THEN '' ELSE CONVERT(VARCHAR(10),[CELERITY_ST_BOOKINGS].DepartureDate,120) END AS QuoteDepartureDate,
            COALESCE([SL_BaseNameFull].[BaseName],[CELERITY_ST_BOOKINGS].AreaName) AS QuoteDestination,
            CASE WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1,3,1) IN ('X','L','P') THEN 'Catamaran' ELSE 'Monohull' END AS QuoteHullType, 
            COALESCE(CLI.[Add1],'') AS Address1,
            COALESCE(CLI.[Add2],'') AS Address2,
            COALESCE(CLI.[Add3],'') AS Address3,
            COALESCE(CLI.[Phone1],'') AS Phone1,
            COALESCE(CLI.[Phone2],'') AS Phone2,
            COALESCE(CLI.[BusinessPhone],'') AS BusinessPhone,
            CASE WHEN CLI.DateOfBirth IS NULL THEN '' ELSE CONVERT(VARCHAR(10),CLI.DateOfBirth,120) END AS DateOfBirth,
            COALESCE([CELERITY_ST_BOOKINGS].ExecutiveReportingRegion,'') AS QuoteExecutiveReportingRegion,
            COALESCE([CELERITY_ST_BOOKINGS].UserDefinable1,'') AS QuoteBoat,
            COALESCE([CELERITY_ST_BOOKINGS].BookRef,'') AS QuoteBookRef,
            COALESCE(CLI.CustomerLinkCode,'') AS CustomerLinkCode,
            COALESCE(CLI.[CustomerClass],'') AS CustomerClass,
            CASE CLI.GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END AS GoneAway,
            COALESCE(CLI.ClientSourceCode,'') AS ClientSourceCode,
            [CELERITY_ST_BOOKINGS].[Status], 
            COALESCE([SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified],'') AS ClientBookingOffice,
            DENSE_RANK() OVER(PARTITION BY CLI.Email1 
                ORDER BY 
                    [CELERITY_ST_BOOKINGS].BookingDate DESC, 
                    [CELERITY_ST_BOOKINGS].DepartureDate DESC,
                    [CELERITY_ST_BOOKINGS].BookRef DESC, 
                    [CELERITY_ST_BOOKINGS].ConfirmDate DESC,
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,    
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromMailing WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    (CASE WHEN CLI.[LastContactDate] = '0' THEN '' ELSE CONVERT(VARCHAR(10),CONVERT(datetime, CLI.[LastContactDate], 103),120) END) DESC,
                    (CASE WHEN CLI.DateCreated IS NULL THEN '' ELSE CONVERT(VARCHAR(10),CLI.DateCreated,120) END) DESC,
                    (CASE CLI.Blacklisted WHEN 'Y' THEN 'true' ELSE 'false' END) DESC,
                    (CASE CLI.GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    [CELERITY_ST_BOOKINGS].BookingSourcePrimary,
                    COALESCE([SL_Simplified_SalesOffice].[SalesOfficeSimplified],[CELERITY_ST_BOOKINGS].BookingOfficeLocation),
                    [CELERITY_ST_BOOKINGS].BookingLanguageFull,
                    [CELERITY_ST_BOOKINGS].ProductName,
                    [CELERITY_ST_BOOKINGS].AreaName,
                    CLI.ClientCode,
                    COALESCE([SL_Simplified_Title].[TitleSimplified],''),
                    CLI.FirstName,
                    CLI.LastName,
                    CLI.City,
                    CLI.County,
                    CLI.Postcode,
                    COALESCE([SL_Simplified_Triton_Client_Country].[CountrySimplified],CLI.Country),
                    (CASE WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1,3,1) IN ('X','L','P') THEN 'Catamaran' ELSE 'Monohull' END),
                    CLI.[Add1],
                    CLI.[Add2],
                    CLI.[Add3],
                    CLI.[Phone1],
                    CLI.[Phone2],
                    CLI.[BusinessPhone],
                    CLI.DateOfBirth,
                    [CELERITY_ST_BOOKINGS].ExecutiveReportingRegion,
                    [CELERITY_ST_BOOKINGS].UserDefinable1,
                    CLI.CustomerLinkCode,
                    CLI.[CustomerClass],
                    CLI.ClientSourceCode,
                    [SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified]
            ) AS RankResultMostRecentQuote,

            -- DWYT-16 New HubSpot API fields
            CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromTelephone,
            '' AS Notes,
            CASE WHEN CLI.[LastContactDate] = '0' THEN '' ELSE CONVERT(VARCHAR(10),CONVERT(datetime, CLI.[LastContactDate], 103),120) END AS LastContactDate,
            CASE WHEN CLI.DateCreated IS NULL THEN '' ELSE CONVERT(VARCHAR(10),CLI.DateCreated,120) END AS TritonCreateDate,
            COALESCE(REPLACE(REPLACE(REPLACE(CLI.ClientCode, 'TRT-M',''), 'TRT-S', ''), 'TRT-', ''), '') AS CleanClientID,
            COALESCE([CELERITY_ST_BOOKINGS].AgentCode,'') AS QuoteSalesAgent
            
        FROM 
            [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKINGS] WITH (NOLOCK)
        INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKEDPASSENGERS] WITH (NOLOCK)
            ON [CELERITY_ST_BOOKEDPASSENGERS].BookRef=[CELERITY_ST_BOOKINGS].BookRef
        INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENT] CLI WITH (NOLOCK)
            ON CLI.ClientCode=[CELERITY_ST_BOOKEDPASSENGERS].ClientCode
            AND CLI.Brand = 'M'
        LEFT JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENTPREFERENCES] WITH (NOLOCK)
            ON [CELERITY_ST_CLIENTPREFERENCES].ClientCode = CLI.ClientCode
        LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_SalesOffice] WITH (NOLOCK)
            ON [SL_Simplified_SalesOffice].BrandName=[CELERITY_ST_BOOKINGS].BrandName AND [SL_Simplified_SalesOffice].[SalesOfficeFromRawData]=[CELERITY_ST_BOOKINGS].BookingOfficeLocation
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
        AND CLI.Email1 LIKE '%_@%_.__%'
        AND CLI.Email1 not like '%[[]%' AND CLI.Email1 not like '%]%' AND CLI.Email1 not like '%(%' AND CLI.Email1 not like '%)%' AND CLI.Email1 not like '%''%' AND CLI.Email1 not like '% %'
        AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,'2010-01-01', 120) AND CONVERT(DATE,GETDATE()-1)
--        AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,GETDATE()-10) AND CONVERT(DATE,GETDATE()-1)
--        AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,'2013-01-01', 120) AND CONVERT(DATE, '2013-12-31', 120)
--        AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,'2016-01-01', 120) AND CONVERT(DATE, '2016-12-31', 120)
    ) Result

    WHERE RankResultMostRecentQuote=1
    ORDER BY QuoteDateRequested

END


GO
