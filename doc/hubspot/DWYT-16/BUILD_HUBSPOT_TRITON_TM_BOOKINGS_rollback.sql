/*
  DWYT-16 Restore original SP BUILD_HUBSPOT_TRITON_TM_BOOKINGS
  24/11/2017  TW  New script
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
	SELECT DISTINCT * FROM 
	(
		SELECT 
			'customer' AS LifecycleStage,
			'Moorings' AS BrandName,
			CASE WHEN [CELERITY_ST_BOOKINGS].ConfirmDate IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', [CELERITY_ST_BOOKINGS].ConfirmDate))*60*60*1000) END AS ConfirmDate,
			[CELERITY_ST_BOOKINGS].BookingSourcePrimary,
			COALESCE([SL_Simplified_SalesOffice].[SalesOfficeSimplified],[CELERITY_ST_BOOKINGS].BookingOfficeLocation) AS BookingOfficeLocation,
			COALESCE([SL_Simplified_Language].[LanguageSimplified],[CELERITY_ST_BOOKINGS].BookingLanguageFull) AS BookingLanguage,
			[CELERITY_ST_CLIENT].ClientCode,
			COALESCE([SL_Simplified_Title].[TitleSimplified],'unmatched') AS Title,
			[CELERITY_ST_CLIENT].FirstName,
			[CELERITY_ST_CLIENT].LastName,
			[CELERITY_ST_CLIENT].City,
			[CELERITY_ST_CLIENT].County,
			[CELERITY_ST_CLIENT].Postcode,
			COALESCE([SL_Simplified_Triton_Client_Country].[CountrySimplified],[CELERITY_ST_CLIENT].Country) AS Country,
			[CELERITY_ST_CLIENT].Email1 AS Email,
			CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromMailing WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromMailing,
			CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromEmail,
			CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END AS CancelFromBrochure,
			[CELERITY_ST_CLIENT].Deceased,
			CASE [CELERITY_ST_CLIENT].Blacklisted WHEN 'Y' THEN 'true' ELSE 'false' END AS Blacklisted,
			[SL_Simplified_ProductName].ProductNameSimplified AS BookingProductName,
			CASE WHEN [CELERITY_ST_BOOKINGS].BookingDate IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', [CELERITY_ST_BOOKINGS].BookingDate))*60*60*1000) END AS BookingDateBooked,
			CASE WHEN [CELERITY_ST_BOOKINGS].DepartureDate IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', [CELERITY_ST_BOOKINGS].DepartureDate))*60*60*1000) END AS BookingDepartureDate,
			[CELERITY_ST_BOOKINGS].AreaName AS BookingDestination,
			CASE WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1,3,1) IN ('X','L','P') THEN 'Catamaran' ELSE 'Monohull' END AS BookingHullType, 
			COALESCE([CELERITY_ST_CLIENT].[Add1],'') AS Address1,
			COALESCE([CELERITY_ST_CLIENT].[Add2],'') AS Address2,
			COALESCE([CELERITY_ST_CLIENT].[Add3],'') AS Address3,
			COALESCE([CELERITY_ST_CLIENT].[Phone1],'') AS Phone1,
			COALESCE([CELERITY_ST_CLIENT].[Phone2],'') AS Phone2,
			COALESCE([CELERITY_ST_CLIENT].[BusinessPhone],'') AS BusinessPhone,
			CASE WHEN [CELERITY_ST_CLIENT].DateOfBirth IS NULL THEN '' ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', [CELERITY_ST_CLIENT].DateOfBirth))*60*60*1000) END AS DateOfBirth,
			COALESCE([CELERITY_ST_BOOKINGS].ExecutiveReportingRegion,'') AS BookingExecutiveReportingRegion,
			COALESCE([CELERITY_ST_CLIENT].NumberOfCharters,'') AS NumberOfCharters,
			COALESCE([CELERITY_ST_BOOKINGS].Duration,'') AS Duration,
			--COALESCE([CELERITY_ST_BOOKINGS].CleanBaseName,'') AS CleanBaseName,--Ignore for now
			--COALESCE([CELERITY_ST_BOOKINGS].CleanBoatName,'') AS CleanBoatName,--Ignore for now
			COALESCE([CELERITY_ST_BOOKINGS].UserDefinable1,'') AS BookingBoat,
			COALESCE([CELERITY_ST_BOOKINGS].BookRef,'') AS BookingBookRef,
			COALESCE([CELERITY_ST_CLIENT].CustomerLinkCode,'') AS CustomerLinkCode,
			COALESCE([CELERITY_ST_CLIENT].[CustomerClass],'') AS CustomerClass,
			CASE [CELERITY_ST_CLIENT].GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END AS GoneAway,
			COALESCE(CELERITY_ST_CLIENT.ClientSourceCode,'') AS ClientSourceCode,
			'Booking' AS Status, 
			COALESCE([SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified],'') AS ClientBookingOffice,
			DENSE_RANK() OVER(PARTITION BY [CELERITY_ST_CLIENT].Email1 
				ORDER BY 
					[CELERITY_ST_BOOKINGS].BookingDate DESC,
					[CELERITY_ST_BOOKINGS].DepartureDate DESC,
					[CELERITY_ST_BOOKINGS].BookRef DESC, 
					[CELERITY_ST_BOOKINGS].ConfirmDate DESC,
					(CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromEmail WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,	
					(CASE [CELERITY_ST_CLIENTPREFERENCES].CancelFromMailing WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
					(CASE [CELERITY_ST_CLIENTPREFERENCES].[CancelFromBrochure] WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
					(CASE [CELERITY_ST_CLIENT].Blacklisted WHEN 'Y' THEN 'true' ELSE 'false' END) DESC,
					(CASE [CELERITY_ST_CLIENT].GoneAway WHEN 'Y' THEN 'Y' ELSE 'N' END) DESC,
					[CELERITY_ST_BOOKINGS].BookingSourcePrimary,
					COALESCE([SL_Simplified_SalesOffice].[SalesOfficeSimplified],[CELERITY_ST_BOOKINGS].BookingOfficeLocation),
					[CELERITY_ST_BOOKINGS].BookingLanguageFull,
					[CELERITY_ST_BOOKINGS].ProductName,
					[CELERITY_ST_BOOKINGS].AreaName,
					[CELERITY_ST_CLIENT].ClientCode,
					COALESCE([SL_Simplified_Title].[TitleSimplified],'unmatched'),
					[CELERITY_ST_CLIENT].FirstName,
					[CELERITY_ST_CLIENT].LastName,
					[CELERITY_ST_CLIENT].City,
					[CELERITY_ST_CLIENT].County,
					[CELERITY_ST_CLIENT].Postcode,
					COALESCE([SL_Simplified_Triton_Client_Country].[CountrySimplified],[CELERITY_ST_CLIENT].Country),
					(CASE WHEN SUBSTRING([CELERITY_ST_BOOKINGS].UserDefinable1,3,1) IN ('X','L','P') THEN 'Catamaran' ELSE 'Monohull' END),
					[CELERITY_ST_CLIENT].[Add1],
					[CELERITY_ST_CLIENT].[Add2],
					[CELERITY_ST_CLIENT].[Add3],
					[CELERITY_ST_CLIENT].[Phone1],
					[CELERITY_ST_CLIENT].[Phone2],
					[CELERITY_ST_CLIENT].[BusinessPhone],
					[CELERITY_ST_CLIENT].DateOfBirth,
					[CELERITY_ST_BOOKINGS].ExecutiveReportingRegion,
					[CELERITY_ST_CLIENT].NumberOfCharters,
					[CELERITY_ST_BOOKINGS].Duration,
					[CELERITY_ST_BOOKINGS].UserDefinable1,
					[CELERITY_ST_CLIENT].CustomerLinkCode,
					[CELERITY_ST_CLIENT].[CustomerClass],
					CELERITY_ST_CLIENT.ClientSourceCode,
					[SL_Simplified_ClientBookingOffice].[ClientBookingOfficeSimplified]
			) AS RankResult
		FROM 
			[CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKINGS] WITH (NOLOCK)
		INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_BOOKEDPASSENGERS] WITH (NOLOCK)
			ON [CELERITY_ST_BOOKEDPASSENGERS].BookRef=[CELERITY_ST_BOOKINGS].BookRef
		INNER JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENT] WITH (NOLOCK)
			ON [CELERITY_ST_CLIENT].ClientCode=[CELERITY_ST_BOOKEDPASSENGERS].ClientCode
		LEFT JOIN [CelerityMarine_Stage].[dbo].[CELERITY_ST_CLIENTPREFERENCES] WITH (NOLOCK)
			ON [CELERITY_ST_CLIENTPREFERENCES].ClientCode = [CELERITY_ST_CLIENT].ClientCode
		LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_SalesOffice] WITH (NOLOCK)
			ON [SL_Simplified_SalesOffice].BrandName=[CELERITY_ST_BOOKINGS].BrandName AND [SL_Simplified_SalesOffice].[SalesOfficeFromRawData]=[CELERITY_ST_BOOKINGS].BookingOfficeLocation
		LEFT JOIN [AMI_Galaxy].[dbo].[CONF_DT_BRAND] WITH (NOLOCK)
			ON [CONF_DT_BRAND].a_BrandCd=[CELERITY_ST_BOOKINGS].BrandName
		LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_ProductName] WITH (NOLOCK)
			ON [SL_Simplified_ProductName].[ProductNameActual]=[CELERITY_ST_BOOKINGS].ProductName
		LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Language] WITH (NOLOCK)
			ON [SL_Simplified_Language].LanguageActual=[CELERITY_ST_BOOKINGS].BookingLanguageFull
		LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Triton_Client_Country] WITH (NOLOCK)
			ON [SL_Simplified_Triton_Client_Country].[CountryActual]=[CELERITY_ST_CLIENT].Country
		LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_Title] WITH (NOLOCK)
			ON [SL_Simplified_Title].[TitleActual]=[CELERITY_ST_CLIENT].Title
		LEFT JOIN [HUBSPOT].[dbo].[SL_Simplified_ClientBookingOffice] WITH (NOLOCK)
			ON [SL_Simplified_ClientBookingOffice].[ClientBookingOfficeActual]=[CELERITY_ST_CLIENT].BookingOffice
		WHERE 
			[CELERITY_ST_BOOKINGS].BrandName ='MRG'
		AND [CELERITY_ST_BOOKINGS].Status IN ('Booking','Cancelled')
		AND [CELERITY_ST_BOOKINGS].BookingSourcePrimary NOT IN ('PR-Pr free trip','TAAC-Ta on account','PR-Public relations-mor','PRESS-Bericht in der press','STAFF-Staff booking','OWNS-Owner with no paymen','OS-Wot-offshore sailing','OWNER-Owner','DAYCH-Day charter discount','LOCAL-Local booking','OS-Offshore sailing','OSS-Offshore sailing','OW-Owner use','OPS-Operations/maintenan','TA','STHOL-Staff holiday','TAGEN-Travel agent','OSSFF-Staff friends & fami','LOCA2-Local booking','TO-Tour operator')
		AND [CELERITY_ST_BOOKINGS].AreaCode NOT IN ('UKD','UK1','CVO','SS1','UK2','SS2','UK3','FLT','UK4')
		AND [CELERITY_ST_BOOKINGS].ProductName IN ('SAILING_SCHOOLS','CREWED','FLOTILLA','FRANCHISE','FOOTLOOSE','BAREBOAT','CORPORATE','POWER')
		AND [CELERITY_ST_CLIENT].Deceased ='N'
		AND [CELERITY_ST_BOOKINGS].BookingType ='DIRECT'
		AND [CELERITY_ST_BOOKINGS].UserDefinable1 IS NOT NULL
		AND LTRIM(RTRIM([CELERITY_ST_BOOKINGS].UserDefinable1)) <> '' 
		AND [CELERITY_ST_CLIENT].Email1 <> ''
		AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN CONVERT(DATE,GETDATE()-8) AND CONVERT(DATE,GETDATE()-1)
		--AND [CELERITY_ST_BOOKINGS].BookingDate BETWEEN '2017-08-03' AND '2017-09-10'
		AND [CELERITY_ST_CLIENT].Email1 not like '%[[]%' AND [CELERITY_ST_CLIENT].Email1 not like '%]%' AND [CELERITY_ST_CLIENT].Email1 not like '%''%'    
	) Result
	Where RankResult=1
	ORDER BY ConfirmDate
END

GO