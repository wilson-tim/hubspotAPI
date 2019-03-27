REM SET HOUR=%TIME:~0,2%
REM IF "%HOUR:~0,1%" == " " SET HOUR=0%HOUR:~1,1%

REM SET MINUTE=%TIME:~3,2%
REM IF "%MINUTE:~0,1%" == " " SET MINUTE=0%MINUTE:~1,1%

REM for /F "tokens=1,2,3 delims=/ " %%A in ('date /t') do set year=%%C&&set month=%%B&&set day=%%A

REM set today=%year%_%month%_%day%
REM set mydate=%today%_%HOUR%_%MINUTE%

for /f %%a IN ('powershell get-date -format "{yyyy_MM_dd_HH_mm_ss}"') do set mydate=%%a

set srcLocation=G:\Marine\MarineCRM\HUBSPOT\
set destLocation="\\P-GS2-FILECL-01\marine\Marketing\CRM\MI projects\HUBSPOT\"

powershell.exe %srcLocation%Export_TO_CSV.ps1 %mydate% %srcLocation%

Move %srcLocation%HUBSPOT_API_Errors_%mydate%.csv %destLocation%HUBSPOT_API_Errors_%mydate%.csv"
Move %srcLocation%HUBSPOT_API_Success_%mydate%.csv %destLocation%HUBSPOT_API_Success_%mydate%.csv"

Move %srcLocation%HUBSPOT_TRITON_SS_BOOKINGS_%mydate%.csv %destLocation%HUBSPOT_TRITON_SS_BOOKINGS_%mydate%.csv"
Move %srcLocation%HUBSPOT_TRITON_SS_BROCHURE_REQUESTS_%mydate%.csv %destLocation%HUBSPOT_TRITON_SS_BROCHURE_REQUESTS_%mydate%.csv"
Move %srcLocation%HUBSPOT_TRITON_SS_ENEWS_%mydate%.csv %destLocation%HUBSPOT_TRITON_SS_ENEWS_%mydate%.csv"
Move %srcLocation%HUBSPOT_TRITON_SS_QUOTES_%mydate%.csv %destLocation%HUBSPOT_TRITON_SS_QUOTES_%mydate%.csv"

Move %srcLocation%HUBSPOT_TRITON_TM_BOOKINGS_%mydate%.csv %destLocation%HUBSPOT_TRITON_TM_BOOKINGS_%mydate%.csv"
Move %srcLocation%HUBSPOT_TRITON_TM_BROCHURE_REQUESTS_%mydate%.csv %destLocation%HUBSPOT_TRITON_TM_BROCHURE_REQUESTS_%mydate%.csv"
Move %srcLocation%HUBSPOT_TRITON_TM_ENEWS_%mydate%.csv %destLocation%HUBSPOT_TRITON_TM_ENEWS_%mydate%.csv"
Move %srcLocation%HUBSPOT_TRITON_TM_QUOTES_%mydate%.csv %destLocation%HUBSPOT_TRITON_TM_QUOTES_%mydate%.csv"

Move %srcLocation%HUBSPOT_TRITON_FL_BOOKINGS_%mydate%.csv %destLocation%HUBSPOT_TRITON_FL_BOOKINGS_%mydate%.csv"
Move %srcLocation%HUBSPOT_TRITON_FL_QUOTES_%mydate%.csv %destLocation%HUBSPOT_TRITON_FL_QUOTES_%mydate%.csv"

Move %srcLocation%HUBSPOT_NEPTUNE_BOOKINGS_%mydate%.csv %destLocation%HUBSPOT_NEPTUNE_BOOKINGS_%mydate%.csv"
Move %srcLocation%HUBSPOT_NEPTUNE_BROCHURE_REQUESTS_%mydate%.csv %destLocation%HUBSPOT_NEPTUNE_BROCHURE_REQUESTS_%mydate%.csv"
Move %srcLocation%HUBSPOT_NEPTUNE_ENEWS_%mydate%.csv %destLocation%HUBSPOT_NEPTUNE_ENEWS_%mydate%.csv"
Move %srcLocation%HUBSPOT_NEPTUNE_QUOTES_%mydate%.csv %destLocation%HUBSPOT_NEPTUNE_QUOTES_%mydate%.csv"
Move %srcLocation%HUBSPOT_NEPTUNE_PREFS_%mydate%.csv %destLocation%HUBSPOT_NEPTUNE_PREFS_%mydate%.csv"
