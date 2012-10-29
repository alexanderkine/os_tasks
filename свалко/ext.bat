@echo off
setlocal enabledelayedexpansion

if "%1"=="/?" echo Shows external commands, mentioned in help & goto :eof

set path=

for /f %%c in ('%windir%\System32\help.exe ^| %windir%\System32\findstr.exe /r /b /c:"[A-Z][A-Z]*  "') do (
	dir >nul
	%%c /? >nul 2>nul
	if "!errorlevel!" EQU "9009" echo %%c
	rem set path="%_path%"
)

endlocal