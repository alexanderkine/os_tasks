@echo off
setlocal enabledelayedexpansion

set attr=%1

set attr="!attr:"=!"

if [!attr!] EQU ["/?"] echo Count line in specified file. Syntax: & echo count_lines.bat ^<file name^> & exit /b 0

if [!attr!] EQU [] goto :noattr
if not exist !attr! goto :nofile

set _dir="!attr:"=!\*"

if exist !_dir! goto :directory

findstr /R /N ".*" !attr! | find /C ":"

exit /b 0

:noattr
echo No file specified^^! Check syntax^^! >&2
exit /b 1

:nofile
echo File doen't exist^^! Check syntax^^! >&2
exit /b 1

:directory
echo It's directory^^! Check syntax^^! >&2
exit /b 1

endlocal