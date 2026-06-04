@echo off
title Safe Windows Cleanup Toolkit - Created by JustGDX
color 0A

:menu
cls
echo ==========================================
echo   SAFE WINDOWS CLEANUP TOOLKIT
echo        Created by JustGDX
echo ==========================================
echo.
echo [1] Clean User Temp Files
echo [2] Clean Windows Temp Files
echo [3] Clean Prefetch Files
echo [4] Empty Recycle Bin
echo [5] Run ALL Safe Cleanups
echo [6] Info / Help
echo [7] Exit
echo.
set /p choice=Select an option (1-7): 

if "%choice%"=="1" goto usertemp
if "%choice%"=="2" goto windowstemp
if "%choice%"=="3" goto prefetch
if "%choice%"=="4" goto recycle
if "%choice%"=="5" goto all
if "%choice%"=="6" goto help
if "%choice%"=="7" exit
goto menu

:confirm
echo.
set /p confirm=Are you sure you want to proceed? (Y/N): 
if /I "%confirm%"=="Y" goto %return%
if /I "%confirm%"=="N" goto menu
goto confirm

:usertemp
cls
echo You selected: Clean User Temp Files
echo.
set return=usertemp_proceed
goto confirm
:usertemp_proceed
del /q /f /s "%TEMP%\*" >nul 2>&1
echo ✅ User Temp Files cleaned successfully!
pause
goto menu

:windowstemp
cls
echo You selected: Clean Windows Temp Files
echo.
set return=windowstemp_proceed
goto confirm
:windowstemp_proceed
del /q /f /s "C:\Windows\Temp\*" >nul 2>&1
echo ✅ Windows Temp Files cleaned successfully!
pause
goto menu

:prefetch
cls
echo You selected: Clean Prefetch Files
echo.
set return=prefetch_proceed
goto confirm
:prefetch_proceed
del /q /f /s "C:\Windows\Prefetch\*" >nul 2>&1
echo ✅ Prefetch Files cleaned successfully!
pause
goto menu

:recycle
cls
echo You selected: Empty Recycle Bin
echo.
set return=recycle_proceed
goto confirm
:recycle_proceed
rd /s /q C:\$Recycle.Bin >nul 2>&1
echo ✅ Recycle Bin emptied successfully!
pause
goto menu

:all
cls
echo You selected: Run ALL Safe Cleanups
echo.
set return=all_proceed
goto confirm
:all_proceed
del /q /f /s "%TEMP%\*" >nul 2>&1
del /q /f /s "C:\Windows\Temp\*" >nul 2>&1
del /q /f /s "C:\Windows\Prefetch\*" >nul 2>&1
rd /s /q C:\$Recycle.Bin >nul 2>&1
echo ✅ All safe cleanup tasks completed!
pause
goto menu

:help
cls
echo ==========================================
echo                HELP / INFO
echo            Created by JustGDX
echo ==========================================
echo.
echo This tool safely removes:
echo   • Temporary user files
echo   • Windows temp files
echo   • Prefetch cache
echo   • Recycle Bin contents
echo.
echo It does NOT delete:
echo   • Personal documents
echo   • Installed programs
echo   • Drivers
echo   • Important system files
echo.
echo Running as Administrator is recommended
echo for best results.
echo.
pause
goto menu