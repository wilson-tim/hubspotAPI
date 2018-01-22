G:
cd G:\Marine\MarineCRM\HUBSPOT

for /f %%a IN ('powershell get-date -format "{yyyy_MM_dd_HH_mm_ss}"') do set today=%%a

echo Clearing the error log
set srcLocation=G:\Marine\MarineCRM\HUBSPOT\
powershell.exe %srcLocation%HUBSPOT_API_clearerrorlog.ps1

echo ***********************************************************
  echo ZZTEST TMENEWS Process Started At %TIME:~0,2%:%TIME:~3,2%  > HUBSPOT_API_%TODAY%.log
  HubSpot_API.exe ZZTEST TMENEWS >> HUBSPOT_API_%TODAY%.log
echo ***********************************************************

echo ***********************************************************
  echo ZZTEST TMBROCREQ Process Started At %TIME:~0,2%:%TIME:~3,2% >> HUBSPOT_API_%TODAY%.log
  HubSpot_API.exe ZZTEST TMBROCREQ >> HUBSPOT_API_%TODAY%.log
echo ***********************************************************

echo ***********************************************************
  echo ZZTEST TMQUOTES Process Started At %TIME:~0,2%:%TIME:~3,2% >> HUBSPOT_API_%TODAY%.log
  HubSpot_API.exe ZZTEST TMQUOTES >> HUBSPOT_API_%TODAY%.log
echo ***********************************************************

echo ***********************************************************
  echo ZZTEST TMBOOKINGS Process Started At %TIME:~0,2%:%TIME:~3,2% >> HUBSPOT_API_%TODAY%.log
  HubSpot_API.exe ZZTEST TMBOOKINGS >> HUBSPOT_API_%TODAY%.log
echo ***********************************************************

echo ***********************************************************
  echo ZZTEST FLQUOTES Process Started At %TIME:~0,2%:%TIME:~3,2% >> HUBSPOT_API_%TODAY%.log
  HubSpot_API.exe ZZTEST FLQUOTES >> HUBSPOT_API_%TODAY%.log
echo ***********************************************************

echo ***********************************************************
  echo ZZTEST FLBOOKINGS Process Started At %TIME:~0,2%:%TIME:~3,2% >> HUBSPOT_API_%TODAY%.log
  HubSpot_API.exe ZZTEST FLBOOKINGS >> HUBSPOT_API_%TODAY%.log
echo ***********************************************************

echo ***********************************************************
  echo ZZTEST SSENEWS Process Started At %TIME:~0,2%:%TIME:~3,2% >> HUBSPOT_API_%TODAY%.log
  HubSpot_API.exe ZZTEST SSENEWS >> HUBSPOT_API_%TODAY%.log
echo ***********************************************************

echo ***********************************************************
  echo ZZTEST SSBROCREQ Process Started At %TIME:~0,2%:%TIME:~3,2% >> HUBSPOT_API_%TODAY%.log
  HubSpot_API.exe ZZTEST SSBROCREQ >> HUBSPOT_API_%TODAY%.log
echo ***********************************************************

echo ***********************************************************
  echo ZZTEST SSQUOTES Process Started At %TIME:~0,2%:%TIME:~3,2% >> HUBSPOT_API_%TODAY%.log
  HubSpot_API.exe ZZTEST SSQUOTES >> HUBSPOT_API_%TODAY%.log
echo ***********************************************************

echo ***********************************************************
  echo ZZTEST SSBOOKINGS Process Started At %TIME:~0,2%:%TIME:~3,2% >> HUBSPOT_API_%TODAY%.log
  HubSpot_API.exe ZZTEST SSBOOKINGS >> HUBSPOT_API_%TODAY%.log
echo ***********************************************************

echo ***********************************************************
REM  echo ZLBTEST LBENEWS Process Started At %TIME:~0,2%:%TIME:~3,2% >> HUBSPOT_API_%TODAY%.log
REM  HubSpot_API.exe ZLBTEST ENEWS >> HUBSPOT_API_%TODAY%.log
echo ***********************************************************

echo ***********************************************************
REM  echo ZLBTEST LBBROCREQ Process Started At %TIME:~0,2%:%TIME:~3,2% >> HUBSPOT_API_%TODAY%.log
REM  HubSpot_API.exe ZLBTEST BROCREQ >> HUBSPOT_API_%TODAY%.log
echo ***********************************************************

echo ***********************************************************
REM  echo ZLBTEST LBQUOTES Process Started At %TIME:~0,2%:%TIME:~3,2% >> HUBSPOT_API_%TODAY%.log
REM  HubSpot_API.exe ZLBTEST QUOTES >> HUBSPOT_API_%TODAY%.log
echo ***********************************************************

echo ***********************************************************
REM  echo ZLBTEST LBBOOKINGS Process Started At %TIME:~0,2%:%TIME:~3,2% >> HUBSPOT_API_%TODAY%.log
REM  HubSpot_API.exe ZLBTEST BOOKINGS >> HUBSPOT_API_%TODAY%.log
echo ***********************************************************

pause