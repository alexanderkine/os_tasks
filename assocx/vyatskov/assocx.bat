@echo off
setlocal enabledelayedexpansion

set value=%1

if [!value!] EQU [] goto :SyntaxError
if [!value!] EQU [/?] goto :help

set value=".!value:"=!"
set value=!value:"..=".!

echo Given extenstion: !value!

for /f %%i in ('echo !value! ^| findstr /virc:"\"^\.[0-9a-z][0-9a-z]*\" "') do goto :SyntaxError
set value=!value:"=!

set extName=

for /f "delims=) tokens=1*" %%i in ('reg query HKEY_CLASSES_ROOT\!value! /ve 2^>nul ^| findstr /v "HKEY_CLASSES_ROOT"') do (
	for /f "tokens=1*" %%k in ('echo %%j') do set extName=%%l
)

if [!extName!] EQU [] goto :noSuchExtenstion

set commands=

for /f "delims=\ tokens=4" %%i in ('reg query HKEY_CLASSES_ROOT\!extName!\shell 2^>nul') do (
	set commands="%%i" !commands!
)

if [!commands!] EQU [] goto :noAction

echo.

for %%i in (!commands!) do (
	set action=%%i
	set action=!action:"=!
	
	for /f "delims=) tokens=1*" %%j in ('reg query HKEY_CLASSES_ROOT\!extName!\shell\!action!\command /ve 2^>nul ^| findstr /v "HKEY_CLASSES_ROOT"') do (
		for /f "tokens=1*" %%l in ('echo %%k') do set result=%%m
	)
	echo Action for %%i is !result!
)

exit /b 0

:SyntaxError
echo Syntax is wrong. Try ".[letters]" >&2
exit /b 1

:help
echo Syntax:
echo assocx.bat .[letters]
exit /b 0

:noSuchExtenstion
echo No such Extenstion >&2
exit /b 1

:noAction
echo No actions for this extension >&2
exit /b 1

endlocal