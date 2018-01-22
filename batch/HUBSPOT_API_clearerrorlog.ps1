import-module "sqlps" -DisableNameChecking


Invoke-Sqlcmd -ServerInstance V-AZD-SQL-11 -Query "TRUNCATE TABLE [HUBSPOT].[DBO].[ST_ERROR_LOG];"
