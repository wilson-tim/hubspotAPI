REM 19/01/2018  TW  Edited batch file for DWYT-18 Marine / Hubspot testing

ForFiles /P G:\Marine\Triton\data\Archive /D -6 /C "cmd /c if @isdir==FALSE del /F /Q @file"
REM ForFiles /P Q:\TritonCelerity\ /D -2 /C "cmd /c if @isdir==FALSE del /F /Q @file"
