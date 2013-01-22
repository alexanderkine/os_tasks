@echo off
setlocal enabledelayedexpansion

set attr=%1
set flag=

if [!attr!] EQU [/?] echo Kill calc.exe if any, and reboot if -r is specified. Syntax: & echo atquake.bat [-r] & goto :eof	

for /f "tokens=2" %%i in ('tasklist ^| findstr /irc:"calc\.exe "') do (
	if [!flag!] EQU [] echo MUAHAHA, FOUND IT^^! PREPARE TO DIE^^!
	set flag=KILL 'EM ALL
	taskkill /PID %%i >nul 2>nul
)

if [!flag!] NEQ [] if [!attr!] EQU [-r] echo Rebooting... & goto :eof
if [!flag!] EQU [] echo Didn't find a thing... yet. Watchin' ya...

endlocal