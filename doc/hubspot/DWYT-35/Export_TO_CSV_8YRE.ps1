import-module "sqlps" -DisableNameChecking

$currdate = $args[0]
$expLocation = $args[1]
$queryParams = "@pStartDate='2010-01-01',@pEndDate='TODAY',@pDateFormat='date'"
#$queryParams = ""

#Invoke-Sqlcmd -ServerInstance V-AZD-SQL-11 -Query "SELECT * FROM [HUBSPOT].[dbo].[ST_ERROR_LOG] WITH (NOLOCK) WHERE Status='Fail' ORDER BY LogDate;" | Export-Csv -NoTypeInformation $($expLocation + "HUBSPOT_API_Errors_" + $currdate + ".csv")
#Invoke-Sqlcmd -ServerInstance V-AZD-SQL-11 -Query "SELECT * FROM [HUBSPOT].[dbo].[ST_ERROR_LOG] WITH (NOLOCK) WHERE Status='Success' ORDER BY LogDate;" | Export-Csv -NoTypeInformation $($expLocation + "HUBSPOT_API_Success_" + $currdate + ".csv")

#Invoke-SQLcmd -ServerInstance V-AZD-SQL-11 -Query "exec [HUBSPOT].[dbo].[timtestNeptuneBookings] $queryParams" -QueryTimeout 0 | Export-Csv -NoTypeInformation -Encoding utf8 $($expLocation + "timtestNeptuneBookings_" + $currdate + ".csv")

Invoke-SQLcmd -ServerInstance V-AZD-SQL-11 -Query "exec [HUBSPOT].[dbo].[BUILD_HUBSPOT_TRITON_SS_BOOKINGS] $queryParams" -QueryTimeout 0 | Export-Csv -NoTypeInformation -Encoding utf8 $($expLocation + "HUBSPOT_TRITON_SS_BOOKINGS_" + $currdate + ".csv")
Invoke-SQLcmd -ServerInstance V-AZD-SQL-11 -Query "exec [HUBSPOT].[dbo].[BUILD_HUBSPOT_TRITON_SS_QUOTES] $queryParams" -QueryTimeout 0 | Export-Csv -NoTypeInformation -Encoding utf8 $($expLocation + "HUBSPOT_TRITON_SS_QUOTES_" + $currdate + ".csv")
Invoke-SQLcmd -ServerInstance V-AZD-SQL-11 -Query "exec [HUBSPOT].[dbo].[BUILD_HUBSPOT_TRITON_SS_BROCHURE_REQUESTS] $queryParams" -QueryTimeout 0 | Export-Csv -NoTypeInformation -Encoding utf8 $($expLocation + "HUBSPOT_TRITON_SS_BROCHURE_REQUESTS_" + $currdate + ".csv")
Invoke-SQLcmd -ServerInstance V-AZD-SQL-11 -Query "exec [HUBSPOT].[dbo].[BUILD_HUBSPOT_TRITON_SS_ENEWS] $queryParams" -QueryTimeout 0 | Export-Csv -NoTypeInformation -Encoding utf8 $($expLocation + "HUBSPOT_TRITON_SS_ENEWS_" + $currdate + ".csv")

Invoke-SQLcmd -ServerInstance V-AZD-SQL-11 -Query "exec [HUBSPOT].[dbo].[BUILD_HUBSPOT_TRITON_TM_BOOKINGS] $queryParams" -QueryTimeout 0 | Export-Csv -NoTypeInformation -Encoding utf8 $($expLocation + "HUBSPOT_TRITON_TM_BOOKINGS_" + $currdate + ".csv")
Invoke-SQLcmd -ServerInstance V-AZD-SQL-11 -Query "exec [HUBSPOT].[dbo].[BUILD_HUBSPOT_TRITON_TM_QUOTES] $queryParams" -QueryTimeout 0 | Export-Csv -NoTypeInformation -Encoding utf8 $($expLocation + "HUBSPOT_TRITON_TM_QUOTES_" + $currdate + ".csv")
Invoke-SQLcmd -ServerInstance V-AZD-SQL-11 -Query "exec [HUBSPOT].[dbo].[BUILD_HUBSPOT_TRITON_TM_BROCHURE_REQUESTS] $queryParams" -QueryTimeout 0 | Export-Csv -NoTypeInformation -Encoding utf8 $($expLocation + "HUBSPOT_TRITON_TM_BROCHURE_REQUESTS_" + $currdate + ".csv")
Invoke-SQLcmd -ServerInstance V-AZD-SQL-11 -Query "exec [HUBSPOT].[dbo].[BUILD_HUBSPOT_TRITON_TM_ENEWS] $queryParams" -QueryTimeout 0 | Export-Csv -NoTypeInformation -Encoding utf8 $($expLocation + "HUBSPOT_TRITON_TM_ENEWS_" + $currdate + ".csv")

Invoke-SQLcmd -ServerInstance V-AZD-SQL-11 -Query "exec [HUBSPOT].[dbo].[BUILD_HUBSPOT_TRITON_FL_BOOKINGS] $queryParams" -QueryTimeout 0 | Export-Csv -NoTypeInformation -Encoding utf8 $($expLocation + "HUBSPOT_TRITON_FL_BOOKINGS_" + $currdate + ".csv")
Invoke-SQLcmd -ServerInstance V-AZD-SQL-11 -Query "exec [HUBSPOT].[dbo].[BUILD_HUBSPOT_TRITON_FL_QUOTES] $queryParams" -QueryTimeout 0 | Export-Csv -NoTypeInformation -Encoding utf8 $($expLocation + "HUBSPOT_TRITON_FL_QUOTES_" + $currdate + ".csv")

Invoke-SQLcmd -ServerInstance V-AZD-SQL-11 -Query "exec [HUBSPOT].[dbo].[BUILD_HUBSPOT_NEPTUNE_BOOKINGS] $queryParams" -QueryTimeout 0 | Export-Csv -NoTypeInformation -Encoding utf8 $($expLocation + "HUBSPOT_NEPTUNE_BOOKINGS_" + $currdate + ".csv")
Invoke-SQLcmd -ServerInstance V-AZD-SQL-11 -Query "exec [HUBSPOT].[dbo].[BUILD_HUBSPOT_NEPTUNE_QUOTES] $queryParams" -QueryTimeout 0 | Export-Csv -NoTypeInformation -Encoding utf8 $($expLocation + "HUBSPOT_NEPTUNE_QUOTES_" + $currdate + ".csv")
Invoke-SQLcmd -ServerInstance V-AZD-SQL-11 -Query "exec [HUBSPOT].[dbo].[BUILD_HUBSPOT_NEPTUNE_BROCHURE_REQUESTS] $queryParams" -QueryTimeout 0 | Export-Csv -NoTypeInformation -Encoding utf8 $($expLocation + "HUBSPOT_NEPTUNE_BROCHURE_REQUESTS_" + $currdate + ".csv")
Invoke-SQLcmd -ServerInstance V-AZD-SQL-11 -Query "exec [HUBSPOT].[dbo].[BUILD_HUBSPOT_NEPTUNE_ENEWS] $queryParams" -QueryTimeout 0 | Export-Csv -NoTypeInformation -Encoding utf8 $($expLocation + "HUBSPOT_NEPTUNE_ENEWS_" + $currdate + ".csv")
