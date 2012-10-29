@echo off 
if "%1"=="/?" (
	echo This command create a file in a folder
	echo "tempfile <path>"
	goto :eof
)

::Валидация
if "%1"=="" (
	echo You must input a path
	goto :eof
)

set oldcd=%cd%
cd %1

set filename=0

:createname
set memory=%filename%
set /A filename=%memory%+1 
if exist %filename% (
	goto :createname
)
echo.>%filename%

cd %oldcd%