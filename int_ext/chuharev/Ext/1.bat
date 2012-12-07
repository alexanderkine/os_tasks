@echo off

type nul>first.txt
type nul>second.txt

set a=%1
if "%a%"=="/?" (
	echo list of in-and-out comands
	goto :eof
)

setlocal
for /f %%i in ('help ^| findstr /B /R /C:"[A-Z][A-Z]*  "') do (
	for /f "tokens=*" %%j in ('wich.bat %%~i') do (
		if not "%%j" EQU "can't find" echo %%i >>first.txt
		if "%%j" EQU "can't find" echo %%i >>second.txt
	)
)

endlocal