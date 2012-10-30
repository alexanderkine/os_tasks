@echo off

if "%1"=="/?" echo Sleeps n seconds (n is the first parameter) & goto :eof

if "%1"=="" echo Sleep time is not specified! & goto :eof

set /a to_wait=%1

if "%to_wait%"=="" set to_wait=0
if %to_wait% LEQ 0 set to_wait=0

set /a to_wait=%to_wait%+1

echo %time%
ping -n %to_wait% -w 1000 0.0.0.0 >nul
echo %time%