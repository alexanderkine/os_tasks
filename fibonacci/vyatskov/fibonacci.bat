@echo off
setlocal

if "%1"=="/?" echo Shows n'th fibonacci number (n is 1st parameter) & goto :eof

if "%1"=="" echo Number is not specified & goto :eof

set /a n=%1 2>nul
set a=1
set b=1
if "%n%"=="" set n=0

:LOOP
if %n% LEQ 1 echo %a% & goto :eof
set /a b=%a%+%b%
set /a a=%b%-%a%
set /a n=%n%-1
goto LOOP



endlocal