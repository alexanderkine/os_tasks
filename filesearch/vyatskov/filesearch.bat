@echo off
setlocal enabledelayedexpansion

set attr=%1

if [!attr!] EQU [] goto :syntax

set attr="!attr:"=!"

if [!attr!] EQU ["/?"] goto :help

if [!attr!] EQU ["/f"] shift /1 & goto :files


:directories

set attr=%1
set attr="!attr:"=!"

echo Given argument: !attr!

set folders=

for /r . %%i in (.) do (
	pushd %%i
	
	dir !attr! >nul 2>&1
	
	REM echo Folder: !CD! Result: !errorlevel! Folders: !folders!
	
	if not errorlevel 1 set folders=!folders! "%%i"
	
	popd
)

if [!folders!] EQU [] echo No such files found & exit /b 0

for %%i in (!folders!) do (
	set prnt=%%i
	set prnt=!prnt:"=!
	echo !prnt:~0,-1!
)

exit /b 0

:files

set attr=%1
set attr="!attr:"=!"

echo Given argument: !attr!

dir /s /b !attr! 2>nul

if %errorlevel% EQU 1 echo No such files found

exit /b 0

:help
echo Searches directories, that have files which fit specified mask.
echo.
echo Syntax:
echo filesearch.bat [/f] ^<mask^>
echo /f for displaying files
exit /b 0

:syntax
echo. >&2
echo Check syntax: >&2
echo filesearch.bat [/f] ^<mask^> >&2
echo /f for displaying files >&2
exit /b 1


endlocal