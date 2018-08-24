USE [CelerityMarine_Stage]
GO

BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.CELERITY_ST_CLIENT ADD
	Brand varchar(50) NULL
GO
ALTER TABLE dbo.CELERITY_ST_CLIENT SET (LOCK_ESCALATION = TABLE)
GO
COMMIT


USE [CelerityMarine_Stage]
GO
/****** Object:  StoredProcedure [dbo].[BUILD_CELERITY_ST_TRITON_CLIENT]    Script Date: 25/04/2018 08:30:43 ******/
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

ALTER PROCEDURE [dbo].[BUILD_CELERITY_ST_TRITON_CLIENT]
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
