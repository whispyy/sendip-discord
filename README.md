# send-ip to discord

## Project

Little script that send your public ip into a webhook channel

## Config

- Replace `$WebhookURL` with discord webhook url
- Run the script using `.\sendip-discord.ps1`

## Error handling

- Invoke-WebRequest needs IE engine to be available

```powershell
Invoke-WebRequest : The response content cannot be parsed because the Internet Explorer engine is not available, or
Internet Explorer's first-launch configuration is not complete. Specify the UseBasicParsing parameter and try again.
At C:\Scripts\sendip_discord.ps1:18 char:1
+ Invoke-WebRequest -Method Post -Uri $WebhookURL -Body $Body -ContentT ...
+ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : NotImplemented: (:) [Invoke-WebRequest], NotSupportedException
    + FullyQualifiedErrorId : WebCmdletIEDomNotSupportedException,Microsoft.PowerShell.Commands.InvokeWebRequestComman
   d
```

## Run a PowerShell script on Windows startup

1. Open the Start menu and type "powershell". Right-click on "Windows PowerShell" and select "Run as administrator".

2. In the PowerShell window, navigate to the location of the script you want to run on startup. For example, if the script is stored in the C:\Scripts folder, you can use the following command:

```shell
cd C:\Scripts
```

3. To make the script run on startup, you will need to create a scheduled task. To do this, type the following command:

```powershell
schtasks /create /tn "Startup Script" /tr "powershell.exe -File script.ps1" /sc onstart
````

Replace "script.ps1" with the name of your script file.

4. To verify that the task was created, type the following command:

```powershell
schtasks /query
```

You should see a list of all the scheduled tasks on your system, including the one you just created.

5. Finally, reboot your computer to test that the script runs on startup.

Alternatively, you can also add the script to the Startup folder in the Start menu. To do this, create a shortcut to the script file, and then copy the shortcut to the Startup folder. The script will run whenever the user logs on to the system.