@echo off

for /f "tokens=2 delims=:" %%i in ('ipconfig ^| findstr /B /C:"   IPv4"') do (
 echo %%i
)