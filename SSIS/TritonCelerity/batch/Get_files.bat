REM 19/01/2018  TW  Edited batch file for DWYT-18 Marine / Hubspot testing

for /f %%a IN ('powershell get-date -format "{yyyyMMdd}"') do set today=%%a
SET TODAY=%today%%

@echo off
REM pause
SET TritonExtract=N
SET /a FTP_LOOP=1

IF EXIST Q: NET USE Q: /D
NET USE Q: \\V-GS2-FTP-01\Triton
REM pause
:loop_all

ECHO ExtractStatus: Triton %TritonExtract% - Attempt %FTP_LOOP%

:trigger_TritonExtract
REM ECHO Looking for TritonExtract
if exist Q:\TST_TRT_%TODAY%_TritonCelerity.csv goto copy_files

REM pause
ECHO TritonExtract Trigger not found
goto time_delay

:copy_files
REM ECHO Copying TritonExtract files

COPY Q:\TritonCelerity\TST_TRT_%TODAY%_*.csv G:\Marine\Triton\data\FULLLOAD
COPY Q:\TST_TRT_%TODAY%_TritonCelerity.csv G:\Marine\Triton\data\FULLLOAD

REM ECHO Copied TritonExtract files

SET TritonExtract=Y
goto end

:time_delay
REM timeout /t 600
REM set /a ftp_loop=(%ftp_loop% + 1)
REM goto loop_all

:file_fail
REM SET mailsubject=""
if "%TritonExtract%"=="N" SET mailsubject="No Triton TEST Extracts"
REM blat empty.txt -from DoNotReply@SpecialistHolidays.com -to SHGDLMIDevelopmentTeam@SpecialistHolidays.com -subject "Missing Triton TEST Files" -body "%mailsubject%" -server mail.specialistholidays.com -f "DoNotReply@SQL11.SpecialistHolidays.com"
goto end

:end
REM NET USE Q: /D /Y

REM pause
