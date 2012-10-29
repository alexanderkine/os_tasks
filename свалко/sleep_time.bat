@echo off
setlocal
if "%1"=="/?" echo Sleeps n seconds (n is the first parameter) & goto :eof

if "%1"=="" echo Sleep time is not specified! & goto :eof

echo %time%

set /a to_wait=%1

if "%to_wait%"=="" set to_wait=0
if %to_wait% LEQ 0 set to_wait=0

set lt=%time%
set /a end_time=%lt:~0,2% * 60 * 60 * 100 + (%lt:~3,1% * 10 + %lt:~4,1%) * 60 * 100 + (%lt:~6,1% * 10 + %lt:~7,1%) * 100 + %lt:~9,1% * 10 + %lt:~10,1% + %to_wait% * 100
if %end_time% GTR 8640000 set /a end_time=%end_time%-8640000
:loop
set lt=%time%
set /a cur_time=%lt:~0,2% * 60 * 60 * 100 + (%lt:~3,1% * 10 + %lt:~4,1%) * 60 * 100 + (%lt:~6,1% * 10 + %lt:~7,1%) * 100 + %lt:~9,1% * 10 + %lt:~10,1%
if %cur_time% EQU %end_time% echo %time% & goto :eof
goto :loop

endlocal