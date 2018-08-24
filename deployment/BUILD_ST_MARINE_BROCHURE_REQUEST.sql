USE NEPTUNE_Stage
GO

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
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
ALTER TABLE dbo.NEPTUNE_EBROC_NEWLETTERS ADD
    F_CONTACT_URN varchar(50) NULL
GO
ALTER TABLE dbo.NEPTUNE_EBROC_NEWLETTERS SET (LOCK_ESCALATION = TABLE)
GO
COMMIT


USE NEPTUNE_Stage
GO

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
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
ALTER TABLE dbo.ST_MARINE_BROCHURE_REQUEST ADD
    F_CONTACT_URN bigint NULL
GO
ALTER TABLE dbo.ST_MARINE_BROCHURE_REQUEST SET (LOCK_ESCALATION = TABLE)
GO
COMMIT


USE [NEPTUNE_Stage]
GO
/****** Object:  StoredProcedure [dbo].[BUILD_ST_MARINE_BROCHURE_REQUEST]    Script Date: 26/04/2018 09:11:18 ******/
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

ALTER PROCEDURE [dbo].[BUILD_ST_MARINE_BROCHURE_REQUEST]
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


USE [NEPTUNE_Stage]
GO
/****** Object:  StoredProcedure [dbo].[BUILD_ST_MARINE_BROCHURE_REQUEST]    Script Date: 25/04/2018 11:53:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--========================================================================================================================
-- Procedure Date - Procedure Description
--                  BUILD_ST_MARINE_BROCHURE_REQUEST - Selects Neptune NEPTUNE_EBROC_NEWLETTERS records for staging
--
--========================================================================================================================
-- Change History===
--========================================================================================================================
-- Date             Version     Who                Comment
-- 25-Apr-2018      1.1         Tim Wilson         New column for URN
--                                                 to enable unambiguous join between ST_MARINE_BROCHURE_REQUEST
--                                                 and ST_MARINE_CLIENTS
--========================================================================================================================

ALTER PROCEDURE [dbo].[BUILD_ST_MARINE_BROCHURE_REQUEST]
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
        F_COUNTRY                        Location,
        F_Source                        SourceDescription,                 
        SL_BrochureName.Source             Source,
        CONVERT(bigint, F_CONTACT_URN)  F_CONTACT_URN
    FROM
        [NEPTUNE_EBROC_NEWLETTERS]    NEPTUNE_EBROC_NEWLETTERS
    LEFT JOIN
        NEPTUNE_STAGE.DBO.NEPTUNE_ORIGIN    NEPTUNE_ORIGIN
        ON
            NEPTUNE_EBROC_NEWLETTERS.F_LANGUAGE=NEPTUNE_ORIGIN.ORIGIN
    LEFT JOIN 
        NEPTUNE_STAGE.dbo.SL_BrochureName 
        ON
            SL_BrochureName.[BrochureName]=NEPTUNE_EBROC_NEWLETTERS.Brochure_Name
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
        SL_BrochureName.Source,
        F_CONTACT_URN
    ORDER BY Source_Key

EXEC AMI_Galaxy.dbo.AMI_LOG_CLOSE 'NPTN','ST_MAR_BRO'



