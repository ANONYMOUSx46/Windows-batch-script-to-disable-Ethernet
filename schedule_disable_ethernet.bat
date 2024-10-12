:: i need to remember to change the "Ethernet" to the correct interface name
::check with... netsh interface show interface


@echo off

:: just incase uk

ipconfig /release 

:: Disable Ethernet
netsh interface set interface "Ethernet 2" admin=disabled 2>> error.log
if %errorlevel% neq 0 (
    echo Failed to disable Ethernet. Error: %errorlevel%
    exit /b %errorlevel%
)
echo Ethernet has been disabled.



::remember the drive letter and the correct file directory


:: Create scheduled task to disable Ethernet on startup
schtasks /create /tn "DisableEthernetOnStartup" /tr "E:\Escripts\disable_ethernet.bat" /sc onstart /ru SYSTEM /f
if %errorlevel% neq 0 (
    echo Failed to create scheduled task. Error: %errorlevel%
    exit /b %errorlevel%
)
echo Scheduled task created to disable Ethernet on startup.

:: Temporarily disable firewall to ensure script runs correctly
netsh advfirewall set allprofiles state off
if %errorlevel% neq 0 (
    echo Failed to disable firewall. Error: %errorlevel%
    exit /b %errorlevel%
)
echo Firewall has been disabled temporarily.

:: Re-enable firewall (optional but recommended)
timeout /t 60 /nobreak >nul
netsh advfirewall set allprofiles state on
if %errorlevel% neq 0 (
    echo Failed to re-enable firewall. Error: %errorlevel%
    exit /b %errorlevel%
)
echo Firewall has been re-enabled.

pause
