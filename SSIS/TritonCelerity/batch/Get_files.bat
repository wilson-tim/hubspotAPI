REM 19/01/2018  TW  Edited batch file for DWYT-18 Marine / Hubspot testing

REM for /f "tokens=1-3 delims=/ " %%a in ('date /t') do set today=%%c%%b%%a

REM for /f %%a IN ('powershell get-date -format "{yyyyMMdd}"') do set today=%%a
REM SET TODAY=%today%%

SET TODAY=180118

@echo off
REM pause
SET TritonExtract=N

IF EXIST Q: NET USE Q: /D
NET USE Q: \\V-GS2-FTP-01\Triton

:trigger_TritonExtract
REM ECHO Looking for TritonExtract
if exist Q:\TST_TRT_%TODAY%_TritonCelerity.csv goto copy_files

REM pause
ECHO TritonExtract Trigger not found
goto end

:copy_files
REM ECHO Copying TritonExtract file

COPY Q:\TritonCelerity\TST_TRT_%TODAY%_*.csv G:\Marine\Triton\data\FULLLOAD
COPY Q:\TST_TRT_%TODAY%_TritonCelerity.csv G:\Marine\Triton\data\FULLLOAD

REM ECHO TritonExtracts Files Copied
SET TritonExtract=Y
goto end

:file_fail
REM SET mailsubject=""
if "%TritonExtract%"=="N" SET mailsubject="No Triton Extracts"
blat empty.txt -from DoNotReply@SpecialistHolidays.com -to SHGDLMIDevelopmentTeam@SpecialistHolidays.com -subject "Missing Triton Files" -body "%mailsubject%" -server mail.specialistholidays.com -f "DoNotReply@SQL11.SpecialistHolidays.com"
goto end

:end
REM NET USE Q: /D

pause
