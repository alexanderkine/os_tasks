@echo off 
if "%1"=="/?" (
	echo This command create a file in a folder
	echo "tempfile <path> <filename>"
	goto :eof
)

::Валидация
if "%1"=="" (
	echo You must input a path
	goto :eof
)
if "%2"=="" (
	echo You must input a filename
	goto :eof
)

set oldcd=%cd%
cd %1
if exist %2 (
	echo File already exist
	goto :eof
)
echo.>%2
cd %oldcd%