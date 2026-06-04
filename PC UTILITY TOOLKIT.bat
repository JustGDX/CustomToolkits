@echo off
title PC Utility Tools - Created by JustGDX
color 0A
setlocal EnableDelayedExpansion

:: ============================================
:: ADMIN AUTO-CHECK
:: ============================================
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting Administrator access...
    powershell -Command "Start-Process cmd -ArgumentList '/c %~s0' -Verb RunAs"
    exit
)

:: ============================================
:: MAIN MENU
:: ============================================
:menu
cls
echo ==================================================
echo              PC UTILITY TOOLS
echo              Created by JustGDX
echo ==================================================
echo.
echo 1. Check Disk Partition Type (GPT/MBR)
echo 2. Detect UEFI or Legacy BIOS
echo 3. Disk Health and Management
echo 4. System Detailed Information
echo 5. Windows Activation Status
echo 6. Clean and Format Guide
echo 7. Bootable USB Guide
echo.
echo 0. Exit
echo.
set /p choice=Select option: 

if "%choice%"=="1" goto partitioncheck
if "%choice%"=="2" goto biosdetect
if "%choice%"=="3" goto diskmenu
if "%choice%"=="4" goto systemdetails
if "%choice%"=="5" goto activation
if "%choice%"=="6" goto formatguide
if "%choice%"=="7" goto bootguide
if "%choice%"=="0" exit
goto menu


:: ============================================
:: 1 - GPT / MBR CHECK
:: ============================================
:partitioncheck
cls
echo list disk > %temp%\check.txt
echo exit >> %temp%\check.txt
diskpart /s %temp%\check.txt
echo.
echo (* under GPT column means GPT disk)
echo.
echo 1. Re-check
echo 2. Back to Main Menu
echo.
set /p opt=Select option: 
if "%opt%"=="1" goto partitioncheck
if "%opt%"=="2" goto menu
goto partitioncheck


:: ============================================
:: 2 - UEFI OR LEGACY
:: ============================================
:biosdetect
cls
bcdedit | find "winload.efi" >nul
if %errorlevel%==0 (
    echo System Firmware: UEFI
) else (
    echo System Firmware: Legacy BIOS
)
echo.
echo 1. Re-check
echo 2. Back to Main Menu
echo.
set /p opt=Select option: 
if "%opt%"=="1" goto biosdetect
if "%opt%"=="2" goto menu
goto biosdetect


:: ============================================
:: 3 - DISK MENU
:: ============================================
:diskmenu
cls
echo ==========================================
echo             DISK OPTIONS
echo ==========================================
echo.
echo 1. Open Disk Management
echo 2. Show Disk Health Information (SMART)
echo 3. Back to Main Menu
echo.
set /p opt=Select option: 

if "%opt%"=="1" (
    start diskmgmt.msc
    goto diskmenu
)

if "%opt%"=="2" goto diskhealth
if "%opt%"=="3" goto menu
goto diskmenu


:: ============================================
:: DISK HEALTH (SMART SIMPLE VERSION)
:: ============================================
:diskhealth
cls
echo ==========================================
echo           DISK SMART STATUS
echo ==========================================
echo.
wmic diskdrive get Model,Status
echo.
echo ------------------------------------------
echo Status OK = Healthy
echo ------------------------------------------
echo.
echo 1. Refresh
echo 2. Back
echo.
set /p opt=Select option: 
if "%opt%"=="1" goto diskhealth
if "%opt%"=="2" goto diskmenu
goto diskhealth


:: ============================================
:: 4 - SYSTEM DETAILS
:: ============================================
:systemdetails
cls
echo ==========================================
echo           SYSTEM INFORMATION
echo ==========================================
echo.

echo 1. Processor (CPU)
wmic cpu get name
echo.

echo 2. Installed Memory (RAM)
for /f "skip=1" %%A in ('wmic computersystem get TotalPhysicalMemory') do (
    if not "%%A"=="" (
        set /a ramgb=%%A/1024/1024/1024
        echo !ramgb! GB
        goto ramdone
    )
)
:ramdone
echo.

echo 3. Operating System (OS) and Architecture
systeminfo | findstr /B /C:"OS Name" /C:"OS Version" /C:"System Type"
echo.

echo 4. Storage (Model / Type / Size)
wmic diskdrive get Model,MediaType,Size
echo.

echo 5. Graphics Card (GPU)
wmic path win32_videocontroller get name
echo.

echo 6. BIOS Version / Date
wmic bios get smbiosbiosversion, releasedate
echo.

echo ==========================================
echo 1. Refresh
echo 2. Back to Main Menu
echo.
set /p opt=Select option: 
if "%opt%"=="1" goto systemdetails
if "%opt%"=="2" goto menu
goto systemdetails


:: ============================================
:: 5 - WINDOWS ACTIVATION
:: ============================================
:activation
cls
echo ==========================================
echo         WINDOWS ACTIVATION STATUS
echo ==========================================
echo.
cscript //nologo %windir%\system32\slmgr.vbs /xpr
echo.
echo ==========================================
echo 1. Check Again
echo 2. Back to Main Menu
echo.
set /p opt=Select option: 
if "%opt%"=="1" goto activation
if "%opt%"=="2" goto menu
goto activation


:: ============================================
:: 6 - FORMAT GUIDE
:: ============================================
:formatguide
cls
echo diskpart
echo list disk
echo select disk X
echo clean
echo create partition primary
echo format fs=ntfs quick
echo assign
echo exit
echo.
echo UEFI  = GPT
echo Legacy = MBR
echo.
echo 1. Show Again
echo 2. Back to Main Menu
echo.
set /p opt=Select option: 
if "%opt%"=="1" goto formatguide
if "%opt%"=="2" goto menu
goto formatguide


:: ============================================
:: 7 - BOOTABLE USB GUIDE
:: ============================================
:bootguide
cls
echo Use Rufus:
echo UEFI  = GPT
echo Legacy = MBR
echo.
echo Enter BIOS:
echo DEL / F2 / F10 / F12 / ESC
echo Set Boot Option #1 to USB
echo Save and Exit
echo.
echo 1. Show Again
echo 2. Back to Main Menu
echo.
set /p opt=Select option: 
if "%opt%"=="1" goto bootguide
if "%opt%"=="2" goto menu
goto bootguide