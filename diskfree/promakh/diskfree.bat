@echo off
setlocal
if "%1"=="/?" (
	echo This command show free space on disk
	echo "diskfile <disk>"
	goto :eof
)

::Валидация
if "%1"=="" set disk=%SystemDrive%
set disk=%1:
set disk=%disk:::=:%
if not exist %disk% set disk=%SystemDrive%

for /f "tokens=3" %%i in ('dir %disk%') do (
	set string=%%i
)
echo %string%
endlocal