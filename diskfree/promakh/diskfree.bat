@echo off
chcp 65001 > nul
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

set oldcd=%cd%
set disk=%1:
set disk=%disk:::=:%

if not exist %disk% (
	echo disk not exist
	goto :eof
)

dir %disk% | findstr /r /c:"bytes free" > tmp.txt
REM dir %disk% | findstr /r /c:"[0-9]+ папок  [0-9 ]+ байт свободно"
set /p string= < tmp.txt  
echo %string%

cd %oldcd%