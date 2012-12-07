@echo off

setlocal

if "%1" == "/?" (
	echo it is help for this comand
	exit /b 0
)

if "%1" equ "" (
	echo No program
	exit /b 4
)

set Program=%1 
shift /1
:tadam

if "%1" neq "" (
	set Program=%Program% %1
	shift /1
	goto :tadam
)

set /a timeStart=(%time:~0,2%*3600+(%time:~3,1%*10+%time:~4,1%)*60+%time:~6,1%*10+%time:~7,1%)*100+%time:~9,1%*10+%time:~10,1% 

%program% 1>nul 2>nul

set /a timeEnd=(%time:~0,2%*3600+(%time:~3,1%*10+%time:~4,1%)*60+%time:~6,1%*10+%time:~7,1%)*100+%time:~9,1%*10+%time:~10,1%
echo %timeStart%
echo %timeEnd%
set /a resultTime=%timeEnd%-%timeStart%
echo %resultTime% 

endlocal