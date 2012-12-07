@echo off

set /a timeStart=%time:~0,2%*3600
set /a timeStart=%timeStart%+%time:~3,2%*60
set /a timeStart=%timeStart%+%time:~6,2%+%1

:toIf

set /a timeNow=%time:~0,2%*3600
set /a timeNow=%timeNow%+%time:~3,2%*60
set /a timeNow=%timeNow%+%time:~6,2%

if not "%timeStart%" lss "%timeNow%" (
	goto :toIf
)

echo end

echo %timeStart%
echo %time:~3,2%*60