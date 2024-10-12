:: i  need to remeber to change the "Ethernet" to the correct interface name
::netsh interface show interface



@echo off
:: Enable Ethernet
netsh interface set interface "Ethernet 2" admin=enabled 2>> error.log
if %errorlevel% neq 0 (
    echo Failed to enable Ethernet. Error: %errorlevel%
    exit /b %errorlevel%
)
echo Ethernet has been enabled.

:: Remove scheduled task to disable Ethernet on startup
schtasks /delete /tn "DisableEthernetOnStartup" /f
if %errorlevel% neq 0 (
    echo Failed to delete scheduled task. Error: %errorlevel%
    exit /b %errorlevel%
)
echo Scheduled task to disable Ethernet on startup has been removed.

pause
