@echo off

if "/?" equ "%1" (
	echo it is help for this program
	exit /b 0
)
set folder=
set a=%1
if "%~x1" equ "" (
	set a=.%1
	goto :m	
)

:m

reg query hkcr\%a% 2>nul 1>nul
if errorlevel 1 (
	echo have not
	exit /b 4
)
for /f "tokens=4" %%i in ('reg query hkcr\%a%^|findstr "("') do set folder=%%i

for /f "delims=\ tokens=4" %%i in ('reg query hkcr\%folder%\shell') do echo %%i



