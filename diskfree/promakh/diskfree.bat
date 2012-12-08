@echo off
if "%1"=="/?" (
	echo This command show free space on disk
	echo "diskfile <disk>"
	goto :eof
)

::Валидация
if "%1"=="" (
	echo You must input a disk
	goto :eof
)
set disk=%1:
set disk=%disk:::=:%
if not exist %disk% (
	echo disk not exist
	goto :eof
)

for /f "tokens=3" %%i in ('dir %disk%') do (
	set string=%%i
	echo %%i
)
echo %string%