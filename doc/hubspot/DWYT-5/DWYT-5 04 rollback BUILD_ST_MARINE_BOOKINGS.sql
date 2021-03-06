--========================================================================================================================
-- Procedure Date - Procedure Description
-- 22-Feb-2017      BUILD_ST_MARINE_BOOKINGS - Loads Bookings feed data into table ST_MARINE_BOOKINGS
--
--========================================================================================================================
-- Change History===
--========================================================================================================================
-- Date             Version     Who                Comment
--                  1.0                            Original Version    
--========================================================================================================================
USE [NEPTUNE_Stage]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[BUILD_ST_MARINE_BOOKINGS] AS

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
        ProductCode
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
