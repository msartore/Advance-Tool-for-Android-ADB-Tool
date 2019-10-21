@echo off
TITLE ATA Tool by Sway

ECHO      ######  ##               ##    ######  ##   ##
ECHO     ##       ##   ###  ###   ##   ##   ##   ## ##
ECHO     ######   ##   ##  ##   ##    #######    ###
ECHO       ##     ##   ####   ##    ##   ##     ##
ECHO  ######      #####  #####    ##   ##     ##
ECHO 	::::::::::::::::::::::::::::::::
ECHO  	:: ATA Tool V0.3              ::
ECHO  	:: adb and fastboot tool      ::
ECHO  	:: Created By Sway	      ::
ECHO  	:: Copyright 2019 Sway	      ::
ECHO  	::::::::::::::::::::::::::::::::
echo.

echo a >> settings.txt

:prelaunch
for /f %%a in (settings.txt) do (
if %%a==827361536237637183256253671867278168 (
goto :menu
) else (
goto :disclaimer
)
)


:disclaimer
echo *** Disclaimer ***
echo I am not responsible for any damage YOU will do to your device
echo You have been warned, Do you accept? (Y/N)
echo.
SET /P inputd=Please Select:
if %inputd%==Y (
SET inputd=827361536237637183256253671867278168
) else (
set inputd=546s578eehds7s6553445401x
)
echo %inputd% > settings.txt
if %inputd%==827361536237637183256253671867278168 goto menu
if %inputd%==546s578eehds7s6553445401x exit


:menu
cls
echo ========================================================
echo DEVICE INFO
echo ========================================================
echo Device in Fastboot mode:
fastboot devices 
echo.
adb devices
echo Device Version: 
adb shell getprop ro.build.version.release
echo ========================================================
echo MAIN MENU
echo ========================================================
echo 1.  Fastboot/Bootloader Commands
echo.
echo 2.  Recovery Commands (Sideload)
echo.
echo 3.  System Commands
echo ========================================================
echo 0) EXIT
echo ========================================================

SET /P inputmm=Please Select:

if %inputmm%==1 goto menubootloader
if %inputmm%==2 goto menurecovery
if %inputmm%==3 goto menusystem
if %inputmm%==0 exit


:menubootloader
cls
echo ========================================================
echo.
echo What do you want to do?
echo.
echo 1) UNLOCK BOOTLOADER
echo.
echo 2) FORMAT DATA PARTITION (EXT4)
echo.
echo 3) FORMAT DATA PARTITION (F2FS)
echo.
echo 4) FLASH RECOVERY (only .img file)
echo.
echo 5) FLASH KERNEL (only .img file)
echo.
echo 6) FLASH ROM (You must know what you are doing)
echo.
echo 7) Check connected devices
echo.
echo 8) Boot into ROM
echo.
echo 9) Boot into recovery
echo.
echo ========================================================
echo 0) EXIT
echo ========================================================
echo.
SET /P inputmb=Please Select:

if %inputmb%==0 goto menu

if %inputmb%==1 fastboot oem device-info && fastboot oem unlock && echo checking. && cls && echo checking.. && cls && echo checking... && fastboot getvar unlocked

if %inputmb%==2 fastboot format:ext4 userdata

if %inputmb%==3 fastboot format:f2fs userdata

if %inputmb%==4 SET /P recovery=Write recovery name like (recoveryname.img) && fastboot flash recovery %recovery%

if %inputmb%==5 SET /P kernel=Write kernel name like (kernelname.img) && fastboot flash boot %kernel%

if %inputmb%==6 SET /P rom=Write rom path like (/path/to/your/Rom.zip) && fastboot -w && fastboot update %rom%

if %inputmb%==7 fastboot devices

if %inputmb%==8 fastboot reboot

if %inputmb%==9 fastboot reboot recovery

pause
goto menubootloader



:menusystem
cls
echo ========================================================
echo.
echo What do you want to do?
echo.
echo 1) REBOOT SMARTPHONE
echo.
echo 2) REBOOT INTO THE RECOVERY
echo.
echo 3) REBOOT INTO THE Fastboot/Bootloader
echo.
echo 4) Check connected devices
echo.
echo 5) Check devices version connected
echo.
echo 6) Install an app
echo.
echo 7) Unistall an app (No System App)
echo.
echo 8) Emulate device (Resize Screen)
echo.
echo 9) Emulate device (Change Density)
echo.
echo 10) Reset (Emulate device)
echo.
echo ========================================================
echo 0) EXIT
echo ========================================================
echo.
SET /P inputmb=Please Select:

if %inputmb%==0 goto menu

if %inputmb%==1 adb reboot

if %inputmb%==2 adb reboot recovery

if %inputmb%==3 adb reboot-bootloader

if %inputmb%==4 adb devices

if %inputmb%==5 adb shell getprop ro.build.version.release

if %inputmb%==6 SET /P i=Write the app name like (app.apk) && adb install -r %i%

if %inputmb%==7 SET /P appcom=Write the app name like (com.myAppPackage) && adb uninstall %appcom%

if %inputmb%==8 SET /P ss=Write the size of the screen like (2048x1536) && adb shell wm size %ss%

if %inputmb%==9 SET /P sd=Write the density of the screen like (288) && adb shell wm density %sd%

if %inputmb%==10 adb shell wm size reset && adb shell wm density reset
pause
goto menusystem


:menurecovery
cls
echo ========================================================
echo.
echo What do you want to do?
echo.
echo 1) Sideload a zip
echo.
echo ========================================================
echo 0) EXIT
echo ========================================================
echo.
SET /P inputmb=Please Select:

if %inputmb%==0 goto menu

if %inputmb%==1 SET /P slzip=Write the zip name like (name.zip) && adb sideload %slzip%
pause
goto menurecovery
