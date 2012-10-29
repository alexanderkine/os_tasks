@echo off
setlocal enabledelayedexpansion

if "%1"=="/?" echo Shows difference between two folders & goto :eof

if "%2"=="" echo Invalid parameters & goto :eof

if not exist %~f1 echo Invalid parameters & goto:eof
if not exist %~f2 echo Invalid parameters & goto:eof

for /f "tokens=4" %%i in ('fc %1\* %2\* 2^>^&1 ^| findstr /b /r /C:"[A-Z][A-Z]: cannot"') do (
	echo Folder "%~f1" has file "%%~ni" and "%~f2" don't
)

for /f "tokens=4" %%i in ('fc %2\* %1\* 2^>^&1 ^| findstr /b /r /C:"[A-Z][A-Z]: cannot"') do (
	echo Folder "%~f2" has file "%%~ni" and "%~f1" don't
)


endlocal