/*
  DWYT-16 Revised SP BUILD_HUBSPOT_TRITON_TM_BOOKINGS
  24/11/2017  TW  New script
  27/11/2017  TW  Continued development - removed column CancellationEmail; new left joins to provide First Charter and Most Recent Cancellation data
*/

USE [HUBSPOT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[BUILD_HUBSPOT_TRITON_TM_BOOKINGS]
AS
BEGIN
    SELECT DISTINCT 
         LifecycleStage
        ,BrandName
        ,ConfirmDate
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
        ,NumberOfCharters
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
        ,Notes
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
--        ,RankResultMostRecentBooking
--        ,RankResultFirstCharter
    FROM 
    (
        SELECT
            'customer' AS LifecycleStage,
            'Moorings' AS BrandName,
            CASE WHEN [CELERITY_ST_BOOKINGS].ConfirmDate IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', [CELERITY_ST_BOOKINGS].ConfirmDate))*60*60*1000) END AS ConfirmDate,
            [CELERITY_ST_BOOKINGS].BookingSourcePrimary,
            COALESCE([SL_Simplified_SalesOffice].[SalesOfficeSimplified],[CELERITY_ST_BOOKINGS].BookingOfficeLocation) AS BookingOfficeLocation,
            COALESCE([SL_Simplified_Language].[LanguageSimplified],[CELERITY_ST_BOOKINGS].BookingLanguageFull) AS BookingLanguage,
            CLI.ClientCode,
            COALESCE([SL_Simplified_Title].[TitleSimplified],'unmatched') AS Title,
            CLI.FirstName,
            CLI.LastName,
            CLI.City,
            CLI.County,
            CLI.Postcode,
            COALESCE([SL_Simplified_Triton_Client_Country].[CountrySimplified],CLI.Country) AS Country,
            CLI.Email1 AS Email,
            CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromMailing WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromMailing,
            CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromEmail,
            CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromBrochure,
            CLI.Deceased,
            CASE CLI.Blacklisted WHEN 'Y' THEN 'true' ELSE 'false' END AS Blacklisted,
            [SL_Simplified_ProductName].ProductNameSimplified AS BookingProductName,
            CASE WHEN [CELERITY_ST_BOOKINGS].BookingDate IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', [CELERITY_ST_BOOKINGS].BookingDate))*60*60*1000) END AS BookingDateBooked,
            CASE WHEN [CELERITY_ST_BOOKINGS].DepartureDate IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', [CELERITY_ST_BOOKINGS].DepartureDate))*60*60*1000) END AS BookingDepartureDate,
            [CELERITY_ST_BOOKINGS].AreaName AS BookingDestination,
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
                    (CASE CLI.Blacklisted WHEN 'Y' THEN 'true' ELSE 'false' END) DESC,
                    (CASE CLI.GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
                    [CELERITY_ST_BOOKINGS].BookingSourcePrimary,
                    COALESCE([SL_Simplified_SalesOffice].[SalesOfficeSimplified],[CELERITY_ST_BOOKINGS].BookingOfficeLocation),
                    [CELERITY_ST_BOOKINGS].BookingLanguageFull,
                    [CELERITY_ST_BOOKINGS].ProductName,
                    [CELERITY_ST_BOOKINGS].AreaName,
                    CLI.ClientCode,
                    COALESCE([SL_Simplified_Title].[TitleSimplified],'unmatched'),
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
                AND [CELERITY_ST_BOOKINGS].[Status] = 'Booking'
            ) AS NumberOfBookings,
            CASE WHEN CLI.DateCreated IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', CLI.DateCreated))*60*60*1000) END AS TritonCreateDate,
            COALESCE([CELERITY_ST_BOOKINGS].BookingSourcePrimary,'') AS BookingSourceSecondary,
            '' AS BookingSourceTertiary,
            COALESCE([CELERITY_ST_BOOKINGS].AgentCode,'') AS BookingSalesAgent,
            COALESCE(REPLACE(REPLACE(REPLACE(CLI.ClientCode, 'TRT-M',''), 'TRT-S', ''), 'TRT-', ''), '') AS CleanClientID,
            COALESCE(REPLACE(REPLACE(REPLACE([CELERITY_ST_BOOKINGS].BookRef, 'TRT-M', ''), 'TRT-S', ''), 'TRT-', ''),'') AS BookingCleanBookRef,
            COALESCE([CELERITY_ST_BOOKINGS].[TotalPax],'') AS BookingTotalPax
            
        FROM 
            [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKINGS] WITH (NOLOCK)
        INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKEDPASSENGERS] WITH (NOLOCK)
            ON [CELERITY_ST_BOOKEDPASSENGERS].BookRef=[CELERITY_ST_BOOKINGS].BookRef
        INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENT] CLI WITH (NOLOCK)
            ON CLI.ClientCode=[CELERITY_ST_BOOKEDPASSENGERS].ClientCode
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
        LEFT JOIN
        -- First Charter records
        (
            SELECT DISTINCT
                BookRef AS FirstCharterBookRef,
                DepartureDate AS FirstCharterDepartureDate,
                Destination AS FirstCharterDestination,
                BookingDate AS FirstCharterDateBooked,
                ProductCode AS FirstCharterProduct,
                HullType AS FirstCharterHullType,
                UserDefinable1 AS FirstCharterBoat,
                ClientCode AS FirstCharterClientCode,
                RankResultFirstCharter
            FROM
            (
                SELECT
                    [CELERITY_ST_BOOKINGS].BookRef,
                    CASE WHEN [CELERITY_ST_BOOKINGS].DepartureDate IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', [CELERITY_ST_BOOKINGS].DepartureDate))*60*60*1000) END AS DepartureDate,
                    [CELERITY_ST_BOOKINGS].AreaName AS Destination,
                    CASE WHEN [CELERITY_ST_BOOKINGS].BookingDate IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', [CELERITY_ST_BOOKINGS].BookingDate))*60*60*1000) END AS BookingDate,
                    [CELERITY_ST_BOOKINGS].ProductCode,
                    CASE
                        WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1, 3, 1) = 'P' THEN 'Power'
                        WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1, 3, 1) = 'X' THEN 'Catamaran'
                        WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1, 3, 1) = 'L' THEN 'Catamaran'
                        ELSE 'Monohull'
                    END AS HullType,
                    [CELERITY_ST_BOOKINGS].UserDefinable1,
                    CLI.ClientCode,
                    DENSE_RANK() OVER(PARTITION BY CLI.Email1 
                        ORDER BY 
                        [CELERITY_ST_BOOKINGS].BookingDate ASC,
                        [CELERITY_ST_BOOKINGS].DepartureDate ASC,
                        [CELERITY_ST_BOOKINGS].BookRef ASC, 
                        [CELERITY_ST_BOOKINGS].ConfirmDate ASC,
                        (CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END) ASC,    
                        (CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromMailing WHEN 'Y' THEN 'Y' ELSE 'N' END) ASC,
                        (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END) ASC,
                        (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END) ASC,
                        (CASE CLI.Blacklisted WHEN 'Y' THEN 'true' ELSE 'false' END) ASC,
                        (CASE CLI.GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END) ASC,
                        [CELERITY_ST_BOOKINGS].BookingSourcePrimary DESC,
                        COALESCE([SL_Simplified_SalesOffice].[SalesOfficeSimplified],[CELERITY_ST_BOOKINGS].BookingOfficeLocation) DESC,
                        [CELERITY_ST_BOOKINGS].BookingLanguageFull DESC,
                        [CELERITY_ST_BOOKINGS].ProductName DESC,
                        [CELERITY_ST_BOOKINGS].AreaName DESC,
                        CLI.ClientCode DESC,
                        COALESCE([SL_Simplified_Title].[TitleSimplified],'unmatched') DESC,
                        CLI.FirstName DESC,
                        CLI.LastName DESC,
                        CLI.City DESC,
                        CLI.County DESC,
                        CLI.Postcode DESC,
                        COALESCE([SL_Simplified_Triton_Client_Country].[CountrySimplified],CLI.Country) DESC,
                        (CASE WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1,3,1) IN ('X','L','P') THEN 'Catamaran' ELSE 'Monohull' END) DESC,
                        CLI.[Add1] DESC,
                        CLI.[Add2] DESC,
                        CLI.[Add3] DESC,
                        CLI.[Phone1] DESC,
                        CLI.[Phone2] DESC,
                        CLI.[BusinessPhone] DESC,
                        CLI.DateOfBirth DESC,
                        [CELERITY_ST_BOOKINGS].ExecutiveReportingRegion DESC,
                        CLI.NumberOfCharters DESC,
                        [CELERITY_ST_BOOKINGS].Duration DESC,
                        [CELERITY_ST_BOOKINGS].UserDefinable1 DESC,
                        CLI.CustomerLinkCode DESC,
                        CLI.[CustomerClass] DESC,
                        CLI.ClientSourceCode DESC,
                        [SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified] DESC
                    ) AS RankResultFirstCharter
                FROM 
                    [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKINGS] WITH (NOLOCK)
                INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKEDPASSENGERS] WITH (NOLOCK)
                    ON [CELERITY_ST_BOOKEDPASSENGERS].BookRef=[CELERITY_ST_BOOKINGS].BookRef
                INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENT] CLI WITH (NOLOCK)
                    ON CLI.ClientCode=[CELERITY_ST_BOOKEDPASSENGERS].ClientCode
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
                AND [CELERITY_ST_BOOKINGS].BookingSourcePrimary NOT IN ('PR-Pr free trip','TAAC-Ta on account','PR-Public relations-mor','PRESS-Bericht in der press','STAFF-Staff booking','OWNS-Owner with no paymen','OS-Wot-offshore sailing','OWNER-Owner','DAYCH-Day charter discount','LOCAL-Local booking','OS-Offshore sailing','OSS-Offshore sailing','OW-Owner use','OPS-Operations/maintenan','TA','STHOL-Staff holiday','TAGEN-Travel agent','OSSFF-Staff friends & fami','LOCA2-Local booking','TO-Tour operator')
                AND [CELERITY_ST_BOOKINGS].AreaCode NOT IN ('UKD','UK1','CVO','SS1','UK2','SS2','UK3','FLT','UK4')
                AND [CELERITY_ST_BOOKINGS].ProductName IN ('SAILING_SCHOOLS','CREWED','FLOTILLA','FRANCHISE','FOOTLOOSE','BAREBOAT','CORPORATE','POWER')
                AND CLI.Deceased ='N'
                AND [CELERITY_ST_BOOKINGS].BookingType ='DIRECT'
                AND [CELERITY_ST_BOOKINGS].UserDefinable1 IS NOT NULL
                AND LTRIM(RTRIM([CELERITY_ST_BOOKINGS].UserDefinable1)) <> '' 
                AND CLI.Email1 <> ''
                --Search all bookings for first charter records
                --AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,GETDATE()-8) AND CONVERT(DATE,GETDATE()-1)
                --AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN '2017-08-03' AND '2017-09-10'
                AND CLI.Email1 not like '%[[]%' AND CLI.Email1 not like '%]%' AND CLI.Email1 not like '%''%'   
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
                    DENSE_RANK() OVER(PARTITION BY CLI.Email1 
                        ORDER BY 
                            [CELERITY_ST_BOOKINGS].BookingDate ASC,
                            [CELERITY_ST_BOOKINGS].DepartureDate ASC,
                            [CELERITY_ST_BOOKINGS].BookRef ASC, 
                            [CELERITY_ST_BOOKINGS].ConfirmDate ASC,
                            (CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END) ASC,    
                            (CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromMailing WHEN 'Y' THEN 'Y' ELSE 'N' END) ASC,
                            (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END) ASC,
                            (CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromTelephone] WHEN 'Y' THEN 'Y' ELSE 'N' END) ASC,
                            (CASE CLI.Blacklisted WHEN 'Y' THEN 'true' ELSE 'false' END) ASC,
                            (CASE CLI.GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END) ASC,
                            [CELERITY_ST_BOOKINGS].BookingSourcePrimary DESC,
                            COALESCE([SL_Simplified_SalesOffice].[SalesOfficeSimplified],[CELERITY_ST_BOOKINGS].BookingOfficeLocation) DESC,
                            [CELERITY_ST_BOOKINGS].BookingLanguageFull DESC,
                            [CELERITY_ST_BOOKINGS].ProductName DESC,
                            [CELERITY_ST_BOOKINGS].AreaName DESC,
                            CLI.ClientCode DESC,
                            COALESCE([SL_Simplified_Title].[TitleSimplified],'unmatched') DESC,
                            CLI.FirstName DESC,
                            CLI.LastName DESC,
                            CLI.City DESC,
                            CLI.County DESC,
                            CLI.Postcode DESC,
                            COALESCE([SL_Simplified_Triton_Client_Country].[CountrySimplified],CLI.Country) DESC,
                            (CASE WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1,3,1) IN ('X','L','P') THEN 'Catamaran' ELSE 'Monohull' END) DESC,
                            CLI.[Add1] DESC,
                            CLI.[Add2] DESC,
                            CLI.[Add3] DESC,
                            CLI.[Phone1] DESC,
                            CLI.[Phone2] DESC,
                            CLI.[BusinessPhone] DESC,
                            CLI.DateOfBirth DESC,
                            [CELERITY_ST_BOOKINGS].ExecutiveReportingRegion DESC,
                            CLI.NumberOfCharters DESC,
                            [CELERITY_ST_BOOKINGS].Duration DESC,
                            [CELERITY_ST_BOOKINGS].UserDefinable1 DESC,
                            CLI.CustomerLinkCode DESC,
                            CLI.[CustomerClass] DESC,
                            CLI.ClientSourceCode DESC,
                            [SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified] DESC
                    ) AS RankResultCancellation
                FROM 
                    [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKINGS] WITH (NOLOCK)
                INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKEDPASSENGERS] WITH (NOLOCK)
                    ON [CELERITY_ST_BOOKEDPASSENGERS].BookRef=[CELERITY_ST_BOOKINGS].BookRef
                INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENT] CLI WITH (NOLOCK)
                    ON CLI.ClientCode=[CELERITY_ST_BOOKEDPASSENGERS].ClientCode
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
                AND COALESCE([CELERITY_ST_BOOKINGS].CancelledDate, '') != ''
                AND [CELERITY_ST_BOOKINGS].BookingSourcePrimary NOT IN ('PR-Pr free trip','TAAC-Ta on account','PR-Public relations-mor','PRESS-Bericht in der press','STAFF-Staff booking','OWNS-Owner with no paymen','OS-Wot-offshore sailing','OWNER-Owner','DAYCH-Day charter discount','LOCAL-Local booking','OS-Offshore sailing','OSS-Offshore sailing','OW-Owner use','OPS-Operations/maintenan','TA','STHOL-Staff holiday','TAGEN-Travel agent','OSSFF-Staff friends & fami','LOCA2-Local booking','TO-Tour operator')
                AND [CELERITY_ST_BOOKINGS].AreaCode NOT IN ('UKD','UK1','CVO','SS1','UK2','SS2','UK3','FLT','UK4')
                AND [CELERITY_ST_BOOKINGS].ProductName IN ('SAILING_SCHOOLS','CREWED','FLOTILLA','FRANCHISE','FOOTLOOSE','BAREBOAT','CORPORATE','POWER')
                AND CLI.Deceased ='N'
                AND [CELERITY_ST_BOOKINGS].BookingType ='DIRECT'
                AND [CELERITY_ST_BOOKINGS].UserDefinable1 IS NOT NULL
                AND LTRIM(RTRIM([CELERITY_ST_BOOKINGS].UserDefinable1)) <> '' 
                AND CLI.Email1 <> ''
                --Search all bookings for most recent cancellation records
                --AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,GETDATE()-8) AND CONVERT(DATE,GETDATE()-1)
                --AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN '2017-08-03' AND '2017-09-10'
                AND CLI.Email1 not like '%[[]%' AND CLI.Email1 not like '%]%' AND CLI.Email1 not like '%''%'   
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
        AND CLI.Deceased ='N'
        AND [CELERITY_ST_BOOKINGS].BookingType ='DIRECT'
        AND [CELERITY_ST_BOOKINGS].UserDefinable1 IS NOT NULL
        AND LTRIM(RTRIM([CELERITY_ST_BOOKINGS].UserDefinable1)) <> '' 
        AND CLI.Email1 <> ''
        AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,GETDATE()-8) AND CONVERT(DATE,GETDATE()-1)
        --AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN '2017-08-03' AND '2017-09-10'
        AND CLI.Email1 not like '%[[]%' AND CLI.Email1 not like '%]%' AND CLI.Email1 not like '%''%'    
    ) Result

    WHERE RankResultMostRecentBooking=1
    ORDER BY ConfirmDate

END

GO