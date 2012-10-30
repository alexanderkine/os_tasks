@echo off

if "%1"=="/?" echo Shows help for every command in help & goto :eof

for /f %%i in ('help ^| findstr /r /b /c:"[A-Z][A-Z]*  "') do help %%i