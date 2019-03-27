@echo off

REM Check for file count equal to 47, coded below

REM 30/11/2018  TW  New DOS command file to count TritonCelerity data feed files
REM 07/12/2018  TW  Revised with delay loop up to 1 hour


SET /a FTP_LOOP=1


:loop_all
set cnt=0


:file_count
echo Counting TritonCelerity extract files - Attempt %FTP_LOOP%

    REM Connect to the Triton FTP drive
    if exist Q: net use Q: /D /Y > NUL
    REM net use Q: \\V-GS2-FTP-01\Triton
    net use Q: \\V-JSH-FTP-02\Triton > NUL

    REM Initialise the total file count
    set cnt=0

    REM Initialise the date stamp variable
    for /f %%a IN ('powershell get-date -format "{yyyyMMdd}"') do set today=%%a

    REM Count files...

    for %%A in (Q:\TritonCelerity\MAR_TRT_%today%_*.*) do if /i %%~zA gtr 0 set /a cnt+=1
    REM echo File count = %cnt%

    REM Count trigger file if date stamped today (within the file name)
    for %%A in (Q:\MAR_TRT_%today%_TritonCelerity.csv) do if /i %%~zA gtr 0 for /f %%B in ('dir Q:\MAR_TRT_%today%_TritonCelerity.csv ^| find "File(s)"') do set /a cnt+=1
    REM echo File count = %cnt%
    REM pause

    echo File count = %cnt%
    if %cnt% == 47 Goto success

    if %ftp_loop% == 6 Goto fail
    timeout /t 600
    set /a ftp_loop=(%ftp_loop% + 1)
    goto loop_all


:fail
echo Fail
net use Q: /D /Y > NUL
exit /b 1


:success
echo Success
net use Q: /D /Y > NUL
exit /b 0
