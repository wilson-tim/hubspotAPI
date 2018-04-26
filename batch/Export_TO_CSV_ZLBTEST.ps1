import-module "sqlps" -DisableNameChecking

$currdate = $args[0]
$expLocation = $args[1]

Invoke-Sqlcmd -ServerInstance V-AZD-SQL-11 -Query "SELECT * FROM [HUBSPOT].[dbo].[ST_ERROR_LOG] WITH (NOLOCK) WHERE Status='Fail' ORDER BY LogDate;" | Export-Csv -NoTypeInformation $($expLocation + "HUBSPOT_API_Errors_" + $currdate + ".csv")
Invoke-Sqlcmd -ServerInstance V-AZD-SQL-11 -Query "SELECT * FROM [HUBSPOT].[dbo].[ST_ERROR_LOG] WITH (NOLOCK) WHERE Status='Success' ORDER BY LogDate;" | Export-Csv -NoTypeInformation $($expLocation + "HUBSPOT_API_Success_" + $currdate + ".csv")

Invoke-SQLcmd -ServerInstance V-AZD-SQL-11 -Query "exec [HUBSPOT].[dbo].[BUILD_HUBSPOT_NEPTUNE_BOOKINGS]" -QueryTimeout 0 | Export-Csv -NoTypeInformation -Encoding utf8 $($expLocation + "HUBSPOT_NEPTUNE_BOOKINGS_" + $currdate + ".csv")
Invoke-SQLcmd -ServerInstance V-AZD-SQL-11 -Query "exec [HUBSPOT].[dbo].[BUILD_HUBSPOT_NEPTUNE_QUOTES]" -QueryTimeout 0 | Export-Csv -NoTypeInformation $($expLocation + "HUBSPOT_NEPTUNE_QUOTES_" + $currdate + ".csv")
Invoke-SQLcmd -ServerInstance V-AZD-SQL-11 -Query "exec [HUBSPOT].[dbo].[BUILD_HUBSPOT_NEPTUNE_BROCHURE_REQUESTS]" -QueryTimeout 0 | Export-Csv -NoTypeInformation -Encoding utf8 $($expLocation + "HUBSPOT_NEPTUNE_BROCHURE_REQUESTS_" + $currdate + ".csv")
Invoke-SQLcmd -ServerInstance V-AZD-SQL-11 -Query "exec [HUBSPOT].[dbo].[BUILD_HUBSPOT_NEPTUNE_ENEWS]" -QueryTimeout 0 | Export-Csv -NoTypeInformation $($expLocation + "HUBSPOT_NEPTUNE_ENEWS_" + $currdate + ".csv")
