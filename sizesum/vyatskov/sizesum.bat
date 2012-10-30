@echo off
setlocal enabledelayedexpansion

if "%1"=="/?" echo Shows total occupied space & goto :eof

set suml=0
set sumh=0

for /f "tokens=4,5,6 delims= " %%i in ('wmic logicaldisk get Name^, Size^, FreeSpace^, Description ^| find /v "Name" ^| find "Local Fixed Disk"') do (
	set t1=%%k
	set t2=%%i
	set /a suml=!suml! + !t1:~-1! + !t1:~-2,-1! * 10 + !t1:~-3,-2! * 100 + !t1:~-4,-3! * 1000 + !t1:~-5,-4! * 10000 + !t1:~-6,-5! * 100000 + !t1:~-7,-6! * 1000000
	set /a suml=!suml! - !t2:~-1! - !t2:~-2,-1! * 10 - !t2:~-3,-2! * 100 - !t2:~-4,-3! * 1000 - !t2:~-5,-4! * 10000 - !t2:~-6,-5! * 100000 - !t2:~-7,-6! * 1000000 
	set /a sumh=!sumh! + !t1:~0,-7! - !t2:~0,-7!
	if !suml! LSS 0 set /a suml=!suml!+10000000 & set /a sumh=!sumh!-1
	if !suml! GEQ 10000000 set /a suml=!suml!-10000000 & set /a sumh=!sumh!+1
	echo !sumh!!suml!
)

echo %sumh%%suml%

endlocal