G:
cd G:\Marine\MarineCRM\HUBSPOT

for /f %%a IN ('powershell get-date -format "{yyyy_MM_dd_HH_mm_ss}"') do set today=%%a

echo Clearing the error log
set srcLocation=G:\Marine\MarineCRM\HUBSPOT\
powershell.exe %srcLocation%HUBSPOT_API_clearerrorlog.ps1

echo ***********************************************************
  echo ZLBTEST LBENEWS Process Started At %TIME:~0,2%:%TIME:~3,2%  > HUBSPOT_API_%TODAY%.log
  HubSpot_API.exe ZLBTEST ENEWS >> HUBSPOT_API_%TODAY%.log
echo ***********************************************************

echo ***********************************************************
  echo ZLBTEST LBBROCREQ Process Started At %TIME:~0,2%:%TIME:~3,2% >> HUBSPOT_API_%TODAY%.log
  HubSpot_API.exe ZLBTEST BROCREQ >> HUBSPOT_API_%TODAY%.log
echo ***********************************************************

echo ***********************************************************
  echo ZLBTEST LBQUOTES Process Started At %TIME:~0,2%:%TIME:~3,2% >> HUBSPOT_API_%TODAY%.log
  HubSpot_API.exe ZLBTEST QUOTES >> HUBSPOT_API_%TODAY%.log
echo ***********************************************************

echo ***********************************************************
  echo ZLBTEST LBBOOKINGS Process Started At %TIME:~0,2%:%TIME:~3,2% >> HUBSPOT_API_%TODAY%.log
  HubSpot_API.exe ZLBTEST BOOKINGS >> HUBSPOT_API_%TODAY%.log
echo ***********************************************************

pause