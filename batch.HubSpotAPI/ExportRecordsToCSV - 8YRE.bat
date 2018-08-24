REM SET HOUR=%TIME:~0,2%
REM IF "%HOUR:~0,1%" == " " SET HOUR=0%HOUR:~1,1%

REM SET MINUTE=%TIME:~3,2%
REM IF "%MINUTE:~0,1%" == " " SET MINUTE=0%MINUTE:~1,1%

REM for /F "tokens=1,2,3 delims=/ " %%A in ('date /t') do set year=%%C&&set month=%%B&&set day=%%A

REM set today=%year%_%month%_%day%
REM set mydate=%today%_%HOUR%_%MINUTE%

for /f %%a IN ('powershell get-date -format "{yyyy_MM_dd_HH_mm_ss}"') do set mydate=%%a

set srcLocation=G:\Marine\MarineCRM\HUBSPOT\
set destLocation="\\P-gs2-filecl-01\marine\Marketing\CRM\MI projects\HubSpot\8YRE\"

powershell.exe %srcLocation%Export_TO_CSV_8YRE.ps1 %mydate% %srcLocation%

pause