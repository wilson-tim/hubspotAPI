USE [HUBSPOT]
GO

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
--
--========================================================================================================================

ALTER PROC [dbo].[BUILD_HUBSPOT_NEPTUNE_CONTACT_PREFERENCES] @pStartDate varchar(10) = NULL , @pEndDate varchar(10) = NULL, @pDateFormat varchar(10) = NULL
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
             ClientEmail
            ,Brand
            ,CancelFromEnews
            ,Datestamp
        FROM
            (
            SELECT DISTINCT
            --			 [Source_Key_full]
            --		    ,P.[ClientCode] AS PClientCode
                         Brand
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
                        ,REPLACE(F.F_email,'\@','@') AS ClientEmail
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
        ORDER BY ClientEmail, Datestamp  -- ensure that CancelFromEnews settings are uploaded in chronological order

END

GO
