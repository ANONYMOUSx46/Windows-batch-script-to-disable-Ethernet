:: i need to remember to change the "Ethernet" to the correct interface name
:: netsh interface show interface


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
