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
/****** Object:  UserDefinedDataType [dbo].[HugeMoney]    Script Date: 18/05/2018 09:50:37 ******/
CREATE TYPE [dbo].[HugeMoney] FROM [decimal](28, 4) NULL
GO
