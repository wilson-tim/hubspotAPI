import-module "sqlps" -DisableNameChecking


Invoke-Sqlcmd -ServerInstance V-AWD-SQL-09 -Query "TRUNCATE TABLE [HUBSPOT].[DBO].[ST_ERROR_LOG];"
