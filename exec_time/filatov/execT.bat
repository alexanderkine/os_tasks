@echo off
setlocal enabledelayedexpansion
if "%1"=="/?" (
echo Usage: execT [filename] [agrguments]
echo This command executes the program in executable directory and shows execution time
goto :eof
)
if "%1"=="" (
echo Try input an argument
goto :eof
)
set arg=%1%
shift /1
:le
if not "%1"=="" (
set arg=%arg% %1%
shift /1
goto le
)
set /a tl=0
set /a x=!tl!
set /a _msv=360000
set _p=%cd%\%2
set _ts=%time:,=" "%
set _ts=%_ts:.=" "%
set _ts="%_ts::=" "%"
for %%t in (%_ts%) do (
set tlx=%%~t
set /a mx=!tlx:~-1!+10*!tlx:~0,1!
set /a tl=!tl!+!mx!*!_msv!
set /a _msv=!_msv!/60
)
set /a x=!tl!-!x!

echo %arg%
call %arg%

set /a x=!tl!
set /a tl=0
set /a _msv=360000
set _p=%cd%\%2
set _ts=%time:,=" "%
set _ts=%_ts:.=" "%
set _ts="%_ts::=" "%"
for %%t in (%_ts%) do (
set tlx=%%~t
set /a mx=!tlx:~-1!+10*!tlx:~0,1!
set /a tl=!tl!+!mx!*_msv!
set /a _msv=!_msv!/60
)
set /a x=!tl!-!x!
echo !x! ms
endlocal
