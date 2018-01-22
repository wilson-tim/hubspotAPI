G:
cd G:\AMI_UAT\MarineCRM\HUBSPOT

for /f %%a IN ('powershell get-date -format "{yyyy_MM_dd_HH_mm_ss}"') do set today=%%a

echo Clearing the error log
set srcLocation=G:\Marine\MarineCRM\HUBSPOT\
powershell.exe %srcLocation%HUBSPOT_API_clearerrorlog.ps1

echo ***********************************************************
echo SUNSAIL ENEWS Process Started At %TIME:~0,2%:%TIME:~3,2%  > HUBSPOT_API_%TODAY%.log
HubSpot_API.exe SUNSAIL ENEWS >> HUBSPOT_API_%TODAY%.log
echo ***********************************************************

echo ***********************************************************
echo SUNSAIL BROCREQ Process Started At %TIME:~0,2%:%TIME:~3,2% >> HUBSPOT_API_%TODAY%.log
HubSpot_API.exe SUNSAIL BROCREQ >> HUBSPOT_API_%TODAY%.log
echo ***********************************************************

echo ***********************************************************
echo SUNSAIL QUOTES Process Started At %TIME:~0,2%:%TIME:~3,2% >> HUBSPOT_API_%TODAY%.log
HubSpot_API.exe SUNSAIL QUOTES >> HUBSPOT_API_%TODAY%.log
echo ***********************************************************

echo ***********************************************************
echo SUNSAIL BOOKINGS Process Started At %TIME:~0,2%:%TIME:~3,2% >> HUBSPOT_API_%TODAY%.log
HubSpot_API.exe SUNSAIL BOOKINGS >> HUBSPOT_API_%TODAY%.log
echo ***********************************************************

echo ***********************************************************
echo MOORINGS ENEWS Process Started At %TIME:~0,2%:%TIME:~3,2% >> HUBSPOT_API_%TODAY%.log
HubSpot_API.exe MOORINGS ENEWS >> HUBSPOT_API_%TODAY%.log
echo ***********************************************************

echo ***********************************************************
echo MOORINGS BROCREQ Process Started At %TIME:~0,2%:%TIME:~3,2% >> HUBSPOT_API_%TODAY%.log
HubSpot_API.exe MOORINGS BROCREQ >> HUBSPOT_API_%TODAY%.log

echo ***********************************************************
echo MOORINGS QUOTES Process Started At %TIME:~0,2%:%TIME:~3,2% >> HUBSPOT_API_%TODAY%.log
HubSpot_API.exe MOORINGS QUOTES >> HUBSPOT_API_%TODAY%.log
echo ***********************************************************

echo ***********************************************************
echo MOORINGS BOOKINGS Process Started At %TIME:~0,2%:%TIME:~3,2% >> HUBSPOT_API_%TODAY%.log
HubSpot_API.exe MOORINGS BOOKINGS >> HUBSPOT_API_%TODAY%.log
echo ***********************************************************

echo ***********************************************************
echo FOOTLOOSE QUOTES Process Started At %TIME:~0,2%:%TIME:~3,2% >> HUBSPOT_API_%TODAY%.log
HubSpot_API.exe FOOTLOOSE QUOTES >> HUBSPOT_API_%TODAY%.log
echo ***********************************************************

echo ***********************************************************
echo FOOTLOOSE BOOKINGS Process Started At %TIME:~0,2%:%TIME:~3,2% >> HUBSPOT_API_%TODAY%.log
HubSpot_API.exe FOOTLOOSE BOOKINGS >> HUBSPOT_API_%TODAY%.log
echo ***********************************************************

echo ***********************************************************
echo LEBOAT ENEWS Process Started At %TIME:~0,2%:%TIME:~3,2% >> HUBSPOT_API_%TODAY%.log
HubSpot_API.exe LEBOAT ENEWS >> HUBSPOT_API_%TODAY%.log
echo ***********************************************************

echo ***********************************************************
echo LEBOAT BROCREQ Process Started At %TIME:~0,2%:%TIME:~3,2% >> HUBSPOT_API_%TODAY%.log
HubSpot_API.exe LEBOAT BROCREQ >> HUBSPOT_API_%TODAY%.log
echo ***********************************************************

echo ***********************************************************
echo LEBOAT QUOTES Process Started At %TIME:~0,2%:%TIME:~3,2% >> HUBSPOT_API_%TODAY%.log
HubSpot_API.exe LEBOAT QUOTES >> HUBSPOT_API_%TODAY%.log
echo ***********************************************************

echo ***********************************************************
echo LEBOAT BOOKINGS Process Started At %TIME:~0,2%:%TIME:~3,2% >> HUBSPOT_API_%TODAY%.log
HubSpot_API.exe LEBOAT BOOKINGS >> HUBSPOT_API_%TODAY%.log
echo ***********************************************************

