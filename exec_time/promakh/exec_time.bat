@echo off
setlocal

if "%1"=="/?" (
	echo Execute some programm and shows execution time 
	goto :eof
)
if "%1"=="" (
	echo Programm is not specified 
	goto :eof
)

set program=
:read
set program=%program% %1
shift /1
if not "%1"=="" goto :read

set lt=%time%
set /a start_time=%lt:~0,2% * 60 * 60 * 100 + (%lt:~3,1% * 10 + %lt:~4,1%) * 60 * 100 + (%lt:~6,1% * 10 + %lt:~7,1%) * 100 + %lt:~9,1% * 10 + %lt:~10,1%

call %program% 2>nul 1>nul

set lt=%time%
set /a end_time=%lt:~0,2% * 60 * 60 * 100 + (%lt:~3,1% * 10 + %lt:~4,1%) * 60 * 100 + (%lt:~6,1% * 10 + %lt:~7,1%) * 100 + %lt:~9,1% * 10 + %lt:~10,1%

if %end_time% gtr %start_time% (
	set /a ans=%end_time%-%start_time%
) else (
	set /a ans=8639999-%start_time%+%end_time%
)
rem 8639999 is max value of time

if "%ans:~2%"=="" set ans=0%ans%
if "%ans:~2%"=="" set ans=0%ans%
echo Programm worked for %ans:~0,-2%.%ans:~-2% seconds

endlocal