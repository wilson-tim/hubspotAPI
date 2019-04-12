G:
cd G:\Marine\MarineCRM\HUBSPOT

for /f %%a IN ('powershell get-date -format "{yyyy_MM_dd_HH_mm_ss}"') do set today=%%a

echo ***********************************************************
echo LEBOAT ENEWS Process Started At %TIME:~0,2%:%TIME:~3,2% >> logs\HUBSPOT_API_%TODAY%.log
HUBSPOT_API.exe LEBOAT ENEWS >> logs\HUBSPOT_API_%TODAY%.log
echo ***********************************************************

echo ***********************************************************
echo LEBOAT BROCREQ Process Started At %TIME:~0,2%:%TIME:~3,2% >> logs\HUBSPOT_API_%TODAY%.log
HUBSPOT_API.exe LEBOAT BROCREQ >> logs\HUBSPOT_API_%TODAY%.log
echo ***********************************************************

echo ***********************************************************
echo LEBOAT QUOTES Process Started At %TIME:~0,2%:%TIME:~3,2% >> logs\HUBSPOT_API_%TODAY%.log
HUBSPOT_API.exe LEBOAT QUOTES >> logs\HUBSPOT_API_%TODAY%.log
echo ***********************************************************

echo ***********************************************************
echo LEBOAT BOOKINGS Process Started At %TIME:~0,2%:%TIME:~3,2% >> logs\HUBSPOT_API_%TODAY%.log
HUBSPOT_API.exe LEBOAT BOOKINGS >> logs\HUBSPOT_API_%TODAY%.log
echo ***********************************************************

echo ***********************************************************
echo LEBOAT PREFS Process Started At %TIME:~0,2%:%TIME:~3,2% >> logs\HUBSPOT_API_%TODAY%.log
HUBSPOT_API.exe LEBOAT PREFS >> logs\HUBSPOT_API_%TODAY%.log
echo ***********************************************************
