@echo off
REM made by schooi (gh: schooicodes)
REM manual operations to disinfect PCs from the u* xm injection miner
REM dev start: 30/10/2025
color 0f
title U* XMRig Virus Removal ^| v1.1
call :logo
echo %TIME% [Console] ^| Start
echo %TIME% [Console] ^| Checking for infection..
if not exist "C:\Windows\System32\wsvcz" echo %TIME% [Warning] ^| Device seems clean, exiting.. & pause & exit
echo %TIME% [Console] ^| Device seems infected, initiating removal..
cd "C:\Windows\System32"
for /f %%a in ('dir %SystemRoot%\System32\u??????.dll /b ^| findstr /R /C:"^u[0-9][0-9][0-9][0-9][0-9][0-9]\.dll$"') do set "serv=%%a"
echo %TIME% [Console] ^| Stopping service "%serv:~0,-4%"..
sc stop %serv:~0,-4% >nul
echo %TIME% [Console] ^| Deleting service "%serv:~0,-4%"..
sc delete %serv:~0,-4% >nul
set /p "delconf=%TIME% [Confirm] | Delete "%serv%"? ([Y]es/[N]o) > "
if /i "%delconf%"=="n" echo %TIME% [Warning] ^| Aborting.. & pause & exit
echo %TIME% [Console] ^| Deleting "%serv%"..
del /f /q %serv%
if exist "C:\Windows\System32\wsvcz" cd /d "C:\Windows\System32\wsvcz"
setlocal enabledelayedexpansion
for /f "delims=" %%a in ('dir /b u*.exe 2^>nul') do (
  set "exe_name=%%a"
)
set /p "delconf=%TIME% [Confirm] | Delete "%exe_name%"? ([Y]es/[N]o) > "
if /i "%delconf%"=="n" echo %TIME% [Warning] ^| Aborting.. & pause & exit
echo %TIME% [Console] ^| Killing "%exe_name%"..
taskkill /f /im %exe_name% >nul 2>&1
echo %TIME% [Console] ^| Deleting "%exe_name%"..
del %exe_name%
endlocal
REM start /MIN "" "%USERPROFILE%\Desktop\loopkill" !exe_name!
REM echo %TIME% [Console] ^| Attempting loopdelete..
REM start /MIN "" "%USERPROFILE%\Desktop\loopdel" !exe_name!
REM echo %TIME% [Console] ^| Killing loopdelete script..
REM for /f "usebackq tokens=2 delims=," %%P in (`tasklist /v /fo csv /nh ^| findstr /i "loopdelop"`) do (
    REM set "PID=%%~P"
REM )
REM taskkill /pid %PID% /f >nul 2>&1
REM echo %TIME% [Console] ^| Killing loopkill script..
REM for /f "usebackq tokens=2 delims=," %%P in (`tasklist /v /fo csv /nh ^| findstr /i "loopkillop"`) do (
    REM set "PID=%%~P"
REM )
REM taskkill /pid %PID% /f >nul 2>&1
cd "C:\Windows\System32"
echo %TIME% [Console] ^| Removing infected folder (wsvcz)..
rd /s /q "C:\Windows\System32\wsvcz"
echo %TIME% [Console] ^| Removing injected sysfile (svctrl64)..
del "C:\Windows\System32\svctrl64.exe"
echo %TIME% [Console] ^| Finished.
explorer .
pause
exit

:logo
for /f "tokens=2,*delims=:" %%i in ('chcp') do set /a oldcp=%%i
chcp 65001 >nul
echo ██╗   ██╗██╗  ██╗███╗   ███╗        ██████╗ 
echo ██║   ██║╚██╗██╔╝████╗ ████║        ██╔══██╗
echo ██║   ██║ ╚███╔╝ ██╔████╔██║        ██████╔╝
echo ██║   ██║ ██╔██╗ ██║╚██╔╝██║        ██╔══██╗
echo ╚██████╔╝██╔╝ ██╗██║ ╚═╝ ██║███████╗██║  ██║
echo  ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝
chcp %oldcp% >nul
                                            