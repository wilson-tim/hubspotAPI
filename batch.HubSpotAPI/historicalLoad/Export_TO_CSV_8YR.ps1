import-module "sqlps" -DisableNameChecking

$currdate = $args[0]
$expLocation = $args[1]

#Invoke-Sqlcmd -ServerInstance V-AWD-SQL-09 -querytimeout 0 -Query "SELECT * FROM [HUBSPOT].[dbo].[ST_ERROR_LOG] WITH (NOLOCK) WHERE Status='Fail' ORDER BY LogDate;" | Export-Csv -NoTypeInformation $($expLocation + "HUBSPOT_API_Errors_" + $currdate + "_8YR.csv")
#Invoke-Sqlcmd -ServerInstance V-AWD-SQL-09 -querytimeout 0 -Query "SELECT * FROM [HUBSPOT].[dbo].[ST_ERROR_LOG] WITH (NOLOCK) WHERE Status='Success' ORDER BY LogDate;" | Export-Csv -NoTypeInformation $($expLocation + "HUBSPOT_API_Success_" + $currdate + "_8YR.csv")

Invoke-SQLcmd -ServerInstance V-AWD-SQL-09 -querytimeout 0 -Query "exec [HUBSPOT].[dbo].[BUILD_HUBSPOT_TRITON_SS_ENEWS_8YR]" | Export-Csv -NoTypeInformation -Encoding utf8 $($expLocation + "HUBSPOT_TRITON_SS_ENEWS_" + $currdate + "_8YR.csv")
Invoke-SQLcmd -ServerInstance V-AWD-SQL-09 -querytimeout 0 -Query "exec [HUBSPOT].[dbo].[BUILD_HUBSPOT_TRITON_SS_BROCHURE_REQUESTS_8YR]" | Export-Csv -NoTypeInformation -Encoding utf8 $($expLocation + "HUBSPOT_TRITON_SS_BROCHURE_REQUESTS_" + $currdate + "_8YR.csv")
Invoke-SQLcmd -ServerInstance V-AWD-SQL-09 -querytimeout 0 -Query "exec [HUBSPOT].[dbo].[BUILD_HUBSPOT_TRITON_SS_QUOTES_8YR]" | Export-Csv -NoTypeInformation -Encoding utf8 $($expLocation + "HUBSPOT_TRITON_SS_QUOTES_" + $currdate + "_8YR.csv")
Invoke-SQLcmd -ServerInstance V-AWD-SQL-09 -querytimeout 0 -Query "exec [HUBSPOT].[dbo].[BUILD_HUBSPOT_TRITON_SS_BOOKINGS_8YR]" | Export-Csv -NoTypeInformation -Encoding utf8 $($expLocation + "HUBSPOT_TRITON_SS_BOOKINGS_" + $currdate + "_8YR.csv")

Invoke-SQLcmd -ServerInstance V-AWD-SQL-09 -querytimeout 0 -Query "exec [HUBSPOT].[dbo].[BUILD_HUBSPOT_TRITON_TM_ENEWS_8YR]" | Export-Csv -NoTypeInformation -Encoding utf8 $($expLocation + "HUBSPOT_TRITON_TM_ENEWS_" + $currdate + "_8YR.csv")
Invoke-SQLcmd -ServerInstance V-AWD-SQL-09 -querytimeout 0 -Query "exec [HUBSPOT].[dbo].[BUILD_HUBSPOT_TRITON_TM_BROCHURE_REQUESTS_8YR]" | Export-Csv -NoTypeInformation -Encoding utf8 $($expLocation + "HUBSPOT_TRITON_TM_BROCHURE_REQUESTS_" + $currdate + "_8YR.csv")
Invoke-SQLcmd -ServerInstance V-AWD-SQL-09 -querytimeout 0 -Query "exec [HUBSPOT].[dbo].[BUILD_HUBSPOT_TRITON_TM_QUOTES_8YR]" | Export-Csv -NoTypeInformation -Encoding utf8 $($expLocation + "HUBSPOT_TRITON_TM_QUOTES_" + $currdate + "_8YR.csv")
Invoke-SQLcmd -ServerInstance V-AWD-SQL-09 -querytimeout 0 -Query "exec [HUBSPOT].[dbo].[BUILD_HUBSPOT_TRITON_TM_BOOKINGS_8YR]" | Export-Csv -NoTypeInformation -Encoding utf8 $($expLocation + "HUBSPOT_TRITON_TM_BOOKINGS_" + $currdate + "_8YR.csv")

Invoke-SQLcmd -ServerInstance V-AWD-SQL-09 -querytimeout 0 -Query "exec [HUBSPOT].[dbo].[BUILD_HUBSPOT_TRITON_FL_QUOTES_8YR]" | Export-Csv -NoTypeInformation -Encoding utf8 $($expLocation + "HUBSPOT_TRITON_FL_QUOTES_" + $currdate + "_8YR.csv")
Invoke-SQLcmd -ServerInstance V-AWD-SQL-09 -querytimeout 0 -Query "exec [HUBSPOT].[dbo].[BUILD_HUBSPOT_TRITON_FL_BOOKINGS_8YR]" | Export-Csv -NoTypeInformation -Encoding utf8 $($expLocation + "HUBSPOT_TRITON_FL_BOOKINGS_" + $currdate + "_8YR.csv")

Invoke-SQLcmd -ServerInstance V-AWD-SQL-09 -querytimeout 0 -Query "exec [HUBSPOT].[dbo].[BUILD_HUBSPOT_NEPTUNE_BOOKINGS_8YR]" | Export-Csv -NoTypeInformation -Encoding utf8 $($expLocation + "HUBSPOT_NEPTUNE_BOOKINGS_" + $currdate + "_8YR.csv")
Invoke-SQLcmd -ServerInstance V-AWD-SQL-09 -querytimeout 0 -Query "exec [HUBSPOT].[dbo].[BUILD_HUBSPOT_NEPTUNE_QUOTES_8YR]" | Export-Csv -NoTypeInformation -Encoding utf8 $($expLocation + "HUBSPOT_NEPTUNE_QUOTES_" + $currdate + "_8YR.csv")
Invoke-SQLcmd -ServerInstance V-AWD-SQL-09 -querytimeout 0 -Query "exec [HUBSPOT].[dbo].[BUILD_HUBSPOT_NEPTUNE_BROCHURE_REQUESTS_8YR]" | Export-Csv -NoTypeInformation -Encoding utf8 $($expLocation + "HUBSPOT_NEPTUNE_BROCHURE_REQUESTS_" + $currdate + "_8YR.csv")
Invoke-SQLcmd -ServerInstance V-AWD-SQL-09 -querytimeout 0 -Query "exec [HUBSPOT].[dbo].[BUILD_HUBSPOT_NEPTUNE_ENEWS_8YR]" | Export-Csv -NoTypeInformation -Encoding utf8 $($expLocation + "HUBSPOT_NEPTUNE_ENEWS_" + $currdate + "_8YR.csv")
