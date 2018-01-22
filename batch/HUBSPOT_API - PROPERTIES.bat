G:
cd G:\Marine\MarineCRM\HUBSPOT

for /f %%a IN ('powershell get-date -format "{yyyy_MM_dd_HH_mm_ss}"') do set today=%%a



echo ***********************************************************
echo ZLBTEST LEBOAT Process Started At %TIME:~0,2%:%TIME:~3,2% > HUBSPOT_API_PROPERTIES_%TODAY%.log
HubSpot_API.exe ZLBTEST LEBOAT >> HUBSPOT_API_PROPERTIES_%TODAY%.log
echo ***********************************************************



pause