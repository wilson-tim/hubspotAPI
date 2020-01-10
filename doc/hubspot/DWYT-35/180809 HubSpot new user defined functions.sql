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
/****** Object:  UserDefinedFunction [dbo].[fn_convertDate]    Script Date: 09/08/2018 08:38:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


--========================================================================================================================
-- Procedure Date - Procedure Description
-- 28-Nov-2017      fn_convertDate - converts a datetime date to a varchar date, e.g. '31-12-2017'
--
--========================================================================================================================
-- Change History===
--========================================================================================================================
-- Date             Version     Who                Comment
-- 19-Jun-2018      1.0         Tim Wilson         New function
--
--========================================================================================================================

CREATE FUNCTION [dbo].[fn_convertDate] (@dateInput datetime, @outputFormat varchar(10))
RETURNS varchar(50)
AS
BEGIN
   DECLARE
		@result as varchar(50)

		SET @result = ''

		IF @outputFormat = 'unix'
		BEGIN
			SET @result =
				CASE
					WHEN @dateInput IS NULL THEN ''
					ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01',@dateInput))*60*60*1000)
				END
		END

		IF @outputFormat = 'date'
		BEGIN
			SET @result =
				CASE
					WHEN @dateInput IS NULL THEN ''
					ELSE CONVERT(VARCHAR(10),@dateInput,120)
				END
		END

     RETURN (@result)
END	

GO
/****** Object:  UserDefinedFunction [dbo].[fn_convertDateFromInteger]    Script Date: 09/08/2018 08:38:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


--========================================================================================================================
-- Procedure Date - Procedure Description
-- 28-Nov-2017      fn_convertDateFromInteger - converts integer date, e.g. 20171231, to a varchar date, e.g. '31-12-2017'
--
--========================================================================================================================
-- Change History===
--========================================================================================================================
-- Date             Version     Who                Comment
-- 19-Jun-2018      1.0         Tim Wilson         New function
--
--========================================================================================================================

CREATE FUNCTION [dbo].[fn_convertDateFromInteger] (@dateInput int, @outputFormat varchar(10))
RETURNS varchar(50)
AS
BEGIN
   DECLARE
		@result as varchar(50)

		SET @result = ''

		IF @outputFormat = 'unix'
		BEGIN
			SET @result =
				CASE
					WHEN @dateInput IS NULL OR @dateInput = 0 THEN ''
					ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', CONVERT(DATETIME, CONVERT(VARCHAR(8), @dateInput), 112)))*60*60*1000)
					END
		END

		IF @outputFormat = 'date'
		BEGIN
			SET @result =
				CASE
					WHEN @dateInput IS NULL OR @dateInput = 0 THEN ''
					ELSE CONVERT(VARCHAR(10),CONVERT(DATETIME, CONVERT(VARCHAR(8), @dateInput), 112),120)
				END
		END

     RETURN (@result)
END	

GO
/****** Object:  UserDefinedFunction [dbo].[fn_convertDateFromText]    Script Date: 09/08/2018 08:38:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


--========================================================================================================================
-- Procedure Date - Procedure Description
-- 28-Nov-2017      fn_convertDateFromText - changes format of a varchar date, e.g. from '31/12/2017' to '31-12-2017'
--
--========================================================================================================================
-- Change History===
--========================================================================================================================
-- Date             Version     Who                Comment
-- 19-Jun-2018      1.0         Tim Wilson         New function
--
--========================================================================================================================

CREATE FUNCTION [dbo].[fn_convertDateFromText] (@dateInput varchar(50), @outputFormat varchar(10))
RETURNS varchar(50)
AS
BEGIN
   DECLARE
		@result as varchar(50)

		SET @result = ''

		IF @outputFormat = 'unix'
		BEGIN
			SET @result =
				CASE
					WHEN (ISNULL(@dateInput,'') = '' OR @dateInput NOT LIKE '__/__/____' OR @dateInput = '01/01/0000' OR @dateInput = '01/01/0001') THEN ''
					ELSE CONVERT(VARCHAR(50),CONVERT(BIGINT,DATEDIFF(HOUR, '1970-01-01', CONVERT(DATETIME, @dateInput, 103)))*60*60*1000)
				END
		END

		IF @outputFormat = 'date'
		BEGIN
			SET @result =
				CASE
					WHEN (ISNULL(@dateInput,'') = '' OR @dateInput NOT LIKE '__/__/____' OR @dateInput = '01/01/0000' OR @dateInput = '01/01/0001') THEN ''
					ELSE CONVERT(VARCHAR(10), CONVERT(DATE,@dateInput,103), 120)
				END
		END

     RETURN (@result)
END	

GO
