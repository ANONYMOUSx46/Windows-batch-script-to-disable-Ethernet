## This batch script is designed to disable the Ethernet connection and ensure it remains disabled upon system startup by creating a scheduled task.

Only the scheduled scritp needs to be run.
Run the enable script to re-enable ethernet.
Steps Performed:

Disable Ethernet Interface: Disables the specified Ethernet interface to prevent network access.

batch

Copy
netsh interface set interface "Ethernet 2" admin=disabled 2>> error.log
if %errorlevel% neq 0 (
    echo Failed to disable Ethernet. Error: %errorlevel%
    exit /b %errorlevel%
)
echo Ethernet has been disabled.

## Create Scheduled Task: Creates a scheduled task that runs the same script to ensure the Ethernet interface remains disabled on startup.

batch

Copy
schtasks /create /tn "DisableEthernetOnStartup" /tr "D:\Escripts\disable_ethernet.bat" /sc onstart /ru SYSTEM /f
if %errorlevel% neq 0 (
    echo Failed to create scheduled task. Error: %errorlevel%
    exit /b %errorlevel%
)
echo Scheduled task created to disable Ethernet on startup.


## Usage:

Run this script to disable the Ethernet connection and create a scheduled task to keep it disabled upon system startup.

enable_ethernet Script
This batch script is designed to re-enable the Ethernet connection and remove the scheduled task that disables it on startup.

## Steps Performed:

Enable Ethernet Interface: Re-enables the specified Ethernet interface to restore network access.

batch

Copy
netsh interface set interface "Ethernet 2" admin=enabled 2>> error.log
if %errorlevel% neq 0 (
    echo Failed to enable Ethernet. Error: %errorlevel%
    exit /b %errorlevel%
)
echo Ethernet has been enabled.
Remove Scheduled Task: Deletes the scheduled task that disables the Ethernet interface on startup.

batch

Copy
schtasks /delete /tn "DisableEthernetOnStartup" /f
if %errorlevel% neq 0 (
    echo Failed to delete scheduled task. Error: %errorlevel%
    exit /b %errorlevel%
)
echo Scheduled task to disable Ethernet on startup has been removed.
Usage:

Run this script to re-enable the Ethernet connection and remove the scheduled task that disables it on startup.
