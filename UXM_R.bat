@echo off
pushd "C:\Windows\System32\wsvcz" || (
  echo Folder not found: C:\Windows\System32\wsvcz
  pause
  exit /b
)
setlocal enabledelayedexpansion
for /f "delims=" %%a in ('dir /b u*.exe 2^>nul') do (
  set "exe_name=%%a"
)
echo Killing "%exe_name%"..
start /MIN "" "%USERPROFILE%\Desktop\loopkill" !exe_name!
echo Deleting "%exe_name%"..
start /MIN "" "%USERPROFILE%\Desktop\loopdel" !exe_name!
popd
endlocal
cd "C:\Windows\System32"
explorer .
set /p "dll_name=Enter DLL Name: "
echo Stopping service "%dll_name%"..
sc stop %dll_name% >nul
echo Deleting service "%dll_name%"..
sc delete %dll_name% >nul
echo Deleting "%dll_name%.dll"..
del %dll_name%.dll
rd /s /q "C:\Windows\System32\wsvcz"
del "C:\Windows\System32\svctrl64.exe"
echo
pause
