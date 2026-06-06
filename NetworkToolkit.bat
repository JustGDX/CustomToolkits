@echo off
setlocal enabledelayedexpansion
title Advanced Network Toolkit v3.0 - JustGDX
color 0A

:: =========================
:: ADMIN CHECK
:: =========================
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo [!] Run as Administrator required.
    pause
    exit
)

:: =========================
:: MAIN MENU
:: =========================
:mainmenu
cls
echo =====================================
echo     ADVANCED NETWORK TOOLKIT
echo              v3.0
echo         Created by JustGDX
echo =====================================
echo.
echo [?] Help / Info
echo.
echo [1] Network Diagnostics
echo [2] Network Repair
echo [3] Wi-Fi Tools
echo [4] System Monitoring
echo [5] Reports Information
echo.
echo [6] Exit
echo.
set /p choice=Select Option: 

if "%choice%"=="?" goto helpinfo
if "%choice%"=="1" goto diagnostics
if "%choice%"=="2" goto repair
if "%choice%"=="3" goto wifi
if "%choice%"=="4" goto system
if "%choice%"=="5" goto reports
if "%choice%"=="6" exit

goto mainmenu

:: =========================
:: HELP / INFO
:: =========================
:helpinfo
cls
echo =====================================
echo            HELP / INFO
echo =====================================
echo Advanced Network Toolkit v3.0
echo Created by JustGDX
echo =====================================
echo.
echo NETWORK DIAGNOSTICS:
echo - IP Config      : Shows network details
echo - Ping           : Tests internet connection
echo - Traceroute     : Shows route path
echo - DNS Lookup     : Checks domain resolution
echo - Netstat        : Active connections
echo - ARP Cache      : IP to MAC mapping
echo - Routing Table  : Network routes
echo.
echo NETWORK REPAIR:
echo - Flush DNS      : Clears DNS cache
echo - Release IP     : Drops current IP
echo - Renew IP       : Gets new IP
echo - Winsock Reset  : Fix network sockets
echo - TCP/IP Reset   : Fix network stack
echo - Troubleshooter : Windows repair tool
echo.
echo WIFI TOOLS:
echo - Profiles       : Saved WiFi networks
echo - Interfaces     : WiFi status
echo - Drivers        : WiFi driver info
echo - Settings       : Open WiFi settings
echo.
echo SYSTEM:
echo - Tasklist       : Running apps
echo - Resource Mon   : System usage
echo - Perf Monitor   : Performance tool
echo - Explorer Reset : Restart UI
echo.
echo REPORTS:
echo - System Info
echo - MAC Address
echo - Network Report Export
echo.
pause
goto mainmenu

:: =========================
:: DIAGNOSTICS
:: =========================
:diagnostics
cls
echo ===== NETWORK DIAGNOSTICS =====
echo.
echo [1] IP Configuration
echo [2] Ping Google
echo [3] Ping 8.8.8.8
echo [4] Traceroute
echo [5] DNS Lookup
echo [6] Netstat
echo [7] ARP Cache
echo [8] Routing Table
echo [0] Back
echo.
set /p d=Select Option: 

if "%d%"=="1" (
    ipconfig /all
    pause
    goto diagnostics
)

if "%d%"=="2" (
    ping google.com
    pause
    goto diagnostics
)

if "%d%"=="3" (
    ping 8.8.8.8
    pause
    goto diagnostics
)

if "%d%"=="4" (
    tracert google.com
    pause
    goto diagnostics
)

if "%d%"=="5" (
    nslookup google.com
    pause
    goto diagnostics
)

if "%d%"=="6" (
    netstat -ano
    pause
    goto diagnostics
)

if "%d%"=="7" (
    arp -a
    pause
    goto diagnostics
)

if "%d%"=="8" (
    route print
    pause
    goto diagnostics
)

if "%d%"=="0" goto mainmenu
goto diagnostics

:: =========================
:: REPAIR
:: =========================
:repair
cls
echo ===== NETWORK REPAIR =====
echo.
echo [1] Flush DNS
echo [2] Release IP
echo [3] Renew IP
echo [4] Reset Winsock
echo [5] Reset TCP/IP
echo [6] Troubleshooter
echo [0] Back
echo.
set /p r=Select Option: 

if "%r%"=="1" (
    ipconfig /flushdns
    pause
    goto repair
)

if "%r%"=="2" (
    ipconfig /release
    pause
    goto repair
)

if "%r%"=="3" (
    ipconfig /renew
    pause
    goto repair
)

if "%r%"=="4" (
    netsh winsock reset
    pause
    goto repair
)

if "%r%"=="5" (
    netsh int ip reset
    pause
    goto repair
)

if "%r%"=="6" (
    start msdt.exe /id NetworkDiagnosticsNetworkAdapter
    goto repair
)

if "%r%"=="0" goto mainmenu
goto repair

:: =========================
:: WIFI
:: =========================
:wifi
cls
echo ===== WIFI TOOLS =====
echo.
echo [1] Profiles
echo [2] Interfaces
echo [3] Drivers
echo [4] Settings
echo [0] Back
echo.
set /p w=Select Option: 

if "%w%"=="1" (
    netsh wlan show profiles
    pause
    goto wifi
)

if "%w%"=="2" (
    netsh wlan show interfaces
    pause
    goto wifi
)

if "%w%"=="3" (
    netsh wlan show drivers
    pause
    goto wifi
)

if "%w%"=="4" (
    start ms-settings:network-wifi
    goto wifi
)

if "%w%"=="0" goto mainmenu
goto wifi

:: =========================
:: SYSTEM
:: =========================
:system
cls
echo ===== SYSTEM MONITORING =====
echo.
echo [1] Device Manager
echo [2] Task List
echo [3] Resource Monitor
echo [4] Performance Monitor
echo [5] Restart Explorer
echo [6] System Info
echo [0] Back
echo.
set /p s=Select Option: 

if "%s%"=="1" start devmgmt.msc & goto system
if "%s%"=="2" tasklist & pause & goto system
if "%s%"=="3" start resmon & goto system
if "%s%"=="4" start perfmon & goto system
if "%s%"=="5" taskkill /f /im explorer.exe >nul & start explorer.exe & goto system
if "%s%"=="6" systeminfo & pause & goto system
if "%s%"=="0" goto mainmenu
goto system

:: =========================
:: REPORTS
:: =========================
:reports
cls
echo ===== REPORTS INFORMATION =====
echo.
echo [1] Adapter Status
echo [2] MAC Address
echo [3] System Info
echo [4] Network Center
echo [5] Full Report
echo [0] Back
echo.
set /p rep=Select Option: 

if "%rep%"=="1" powershell Get-NetAdapter & pause & goto reports
if "%rep%"=="2" getmac & pause & goto reports
if "%rep%"=="3" systeminfo & pause & goto reports

if "%rep%"=="4" (
    control.exe /name Microsoft.NetworkAndSharingCenter
    goto reports
)

if "%rep%"=="5" (
    (
        echo ===== NETWORK REPORT =====
        ipconfig /all
        echo.
        netstat -ano
        echo.
        arp -a
        echo.
        route print
        echo.
        netsh wlan show profiles
    ) > Network_Report.txt

    start Network_Report.txt
    goto reports
)

if "%rep%"=="0" goto mainmenu
goto reports