# Alan - One Step Project

You have downloaded a One Step project template for the Alan Application Platform. To get started:

- run the start.sh script in a terminal (with bash, see below) 

See? One step. Your application is now available at:

http://localhost:8000/client 


## Creating your own application

To change the application, all you have to do is:

- modify the file at models/model/application.alan
- run the start.sh script again


## Learn more

Fabric includes Excel reports, todo's, support for all popular editors, and the language has more features than can be covered in a tutorial. If you're ready for the next level go to:

https://alan.m-industries.com


## Bash on Windows

MacOS and Linux already come with bash. On Windows this is an optional feature:

- Check that you have Windows 10 build 16215 or newer: 
  https://msdn.microsoft.com/en-us/commandline/wsl/troubleshooting#check-your-build-number
- Open Powershell
- Right-click on its icon in the Taskbar and select "Run as administrator"
- In the new window paste and then run this:
  Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
- Reboot
- Install Ubuntu from the Microsoft Store

More info: https://msdn.microsoft.com/en-us/commandline/wsl/install-win10
Note that in Ubuntu "c:/" is located at "/mnt/c"

You're now ready to open Ubuntu and run that start.sh script. 
