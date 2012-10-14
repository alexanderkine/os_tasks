@echo off 
chcp 65001
if "%1"=="/?" (
	echo This command display the help for all commands in the windows console to file helphen.txt
	goto :eof
)
echo/>helpgen.txt
for /f %%i in ('help ^| findstr /r /c:"^[A-Z]"') do help %%i 2>nul 1>>helpgen.txt