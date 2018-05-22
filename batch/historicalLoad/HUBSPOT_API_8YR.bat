G:
cd G:\Marine\MarineCRM\HUBSPOT

for /f %%a IN ('powershell get-date -format "{yyyy_MM_dd_HH_mm_ss}"') do set today=%%a

set srcLocation=G:\Marine\MarineCRM\HUBSPOT\
REM powershell.exe %srcLocation%HUBSPOT_API_clearerrorlog.ps1

REM echo ***********************************************************
REM echo FOOTLOOSE QUOTES_8YR Process Started At %TIME:~0,2%:%TIME:~3,2% >> logs\HUBSPOT_API_%TODAY%.log
REM HUBSPOT_API.exe FOOTLOOSE QUOTES_8YR >> logs\HUBSPOT_API_%TODAY%.log
REM echo ***********************************************************

REM echo ***********************************************************
REM echo FOOTLOOSE BOOKINGS_8YR Process Started At %TIME:~0,2%:%TIME:~3,2% >> logs\HUBSPOT_API_%TODAY%.log
REM HUBSPOT_API.exe FOOTLOOSE BOOKINGS_8YR >> logs\HUBSPOT_API_%TODAY%.log
REM echo ***********************************************************

REM echo ***********************************************************
REM echo SUNSAIL ENEWS_8YR Process Started At %TIME:~0,2%:%TIME:~3,2%  > logs\HUBSPOT_API_%TODAY%.log
REM HUBSPOT_API.exe SUNSAIL ENEWS_8YR >> logs\HUBSPOT_API_%TODAY%.log
REM echo ***********************************************************

REM echo ***********************************************************
REM echo SUNSAIL BROCREQ_8YR Process Started At %TIME:~0,2%:%TIME:~3,2% >> logs\HUBSPOT_API_%TODAY%.log
REM HUBSPOT_API.exe SUNSAIL BROCREQ_8YR >> logs\HUBSPOT_API_%TODAY%.log
REM echo ***********************************************************

REM echo ***********************************************************
REM echo SUNSAIL QUOTES_8YR Process Started At %TIME:~0,2%:%TIME:~3,2% >> logs\HUBSPOT_API_%TODAY%.log
REM HUBSPOT_API.exe SUNSAIL QUOTES_8YR >> logs\HUBSPOT_API_%TODAY%.log
REM echo ***********************************************************

REM echo ***********************************************************
REM echo MOORINGS ENEWS_8YR Process Started At %TIME:~0,2%:%TIME:~3,2% >> logs\HUBSPOT_API_%TODAY%.log
REM HUBSPOT_API.exe MOORINGS ENEWS_8YR >> logs\HUBSPOT_API_%TODAY%.log
REM echo ***********************************************************

REM echo ***********************************************************
REM echo MOORINGS BROCREQ_8YR Process Started At %TIME:~0,2%:%TIME:~3,2% >> logs\HUBSPOT_API_%TODAY%.log
REM HUBSPOT_API.exe MOORINGS BROCREQ_8YR >> logs\HUBSPOT_API_%TODAY%.log
REM echo ***********************************************************
