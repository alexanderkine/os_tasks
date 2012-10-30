@echo off
setlocal

if "%1"=="/?" echo Execute some programm and shows execution time & goto :eof

if "%1"=="" echo Programm is not specified & goto :eof

set prog=
:LOOP
set prog=%prog% %1
shift /1
if not "%1"=="" goto :loop

set lt=%time%
set /a start_time=%lt:~0,2% * 60 * 60 * 100 + (%lt:~3,1% * 10 + %lt:~4,1%) * 60 * 100 + (%lt:~6,1% * 10 + %lt:~7,1%) * 100 + %lt:~9,1% * 10 + %lt:~10,1%

%prog% 2>nul 1>nul

set lt=%time%
set /a end_time=%lt:~0,2% * 60 * 60 * 100 + (%lt:~3,1% * 10 + %lt:~4,1%) * 60 * 100 + (%lt:~6,1% * 10 + %lt:~7,1%) * 100 + %lt:~9,1% * 10 + %lt:~10,1%
set /a ans=%end_time%-%start_time%
if "%ans:~2%"=="" set ans=0%ans%
if "%ans:~2%"=="" set ans=0%ans%
echo Programm worked for %ans:~0,-2%.%ans:~-2% seconds

endlocal