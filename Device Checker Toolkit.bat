@echo off
title PC / Laptop Condition Check Toolkit - Created by JustGDX
color 0B

:menu
cls
echo ==============================================
echo     PC / LAPTOP CONDITION CHECK TOOLKIT
echo             Created by JustGDX
echo ==============================================
echo.
echo [1] System Information
echo [2] Check Disk Health
echo [3] Check RAM Info
echo [4] Check CPU Info
echo [5] Check Battery Health (Laptop)
echo [6] Check Network Status
echo [7] Run Full Quick Scan
echo [8] Help / Info
echo [9] Exit
echo.
set /p choice=Select an option (1-9): 

if "%choice%"=="1" goto sysinfo
if "%choice%"=="2" goto disk
if "%choice%"=="3" goto ram
if "%choice%"=="4" goto cpu
if "%choice%"=="5" goto battery
if "%choice%"=="6" goto network
if "%choice%"=="7" goto fullscan
if "%choice%"=="8" goto help
if "%choice%"=="9" exit
goto menu

:sysinfo
cls
echo ===== SYSTEM INFORMATION =====
systeminfo
pause
goto menu

:disk
cls
echo ===== DISK STATUS CHECK =====
wmic diskdrive get model,status,size
pause
goto menu

:ram
cls
echo ===== RAM INFORMATION =====
wmic memorychip get capacity, speed, manufacturer
pause
goto menu

:cpu
cls
echo ===== CPU INFORMATION =====
wmic cpu get name, maxclockspeed, numberofcores, numberoflogicalprocessors
pause
goto menu

:battery
cls
echo ===== BATTERY REPORT =====
powercfg /batteryreport
echo.
echo Battery report saved in:
echo C:\Users\%username%\battery-report.html
pause
goto menu

:network
cls
echo ===== NETWORK STATUS =====
ipconfig
echo.
ping google.com
pause
goto menu

:fullscan
cls
echo Running Full Quick System Check...
echo.
systeminfo
echo.
wmic diskdrive get model,status,size
echo.
wmic cpu get name
echo.
wmic memorychip get capacity
echo.
echo Scan Complete!
pause
goto menu

:help
cls
echo ==============================================
echo                  HELP / INFO
echo ==============================================
echo.
echo This toolkit checks:
echo  - System specifications
echo  - Disk health status
echo  - RAM details
echo  - CPU information
echo  - Battery health (laptops)
echo  - Network connectivity
echo.
echo This tool DOES NOT:
echo  - Modify system files
echo  - Delete data
echo  - Change settings
echo.
echo It is completely safe to run.
echo.
pause
goto menu