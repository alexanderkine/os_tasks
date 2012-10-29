@echo off
setlocal enabledelayedexpansion

if "%1"=="/?" echo Shows actions for specified file extention & goto :eof

set _path="%path:;=" "%"

for %%i in (%_path%) do echo %%~i

endlocal