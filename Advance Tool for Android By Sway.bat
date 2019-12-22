
@echo off
TITLE ATA Tool by Sway
color 07
ECHO      ######  ##               ##    ######  ##   ##
ECHO     ##       ##   ###  ###   ##   ##   ##   ## ##
ECHO     ######   ##   ##  ##   ##    #######    ###
ECHO       ##     ##   ####   ##    ##   ##     ##
ECHO  ######      #####  #####    ##   ##     ##
ECHO 	::::::::::::::::::::::::::::::::
ECHO  	:: ATA Tool V0.5              ::
ECHO  	:: adb and fastboot tool      ::
ECHO  	:: Created By Sway	      ::
ECHO  	:: Copyright 2019 Sway	      ::
ECHO  	::::::::::::::::::::::::::::::::
echo.

echo a >> settings.txt

:prelaunch
for /f %%a in (settings.txt) do (
if %%a==4920617070726f7665 (
goto :adblaunch
) else (
goto :disclaimer
)
)

:adblaunch
set dinfb=1
set dinos=1
echo Loading...
fastboot devices >nul
adb devices >nul
cls
goto :devicecheck

:devicecheck
set "ten=10"
set "nine=9"
set "eight_1=8.1.0"
set "eight=8"
set "seven=7"
set "seven_1_2=7.1.2"
set "seven_1_1=7.1.1"
set "seven_1=7.1"
set "six=6.0"
set "six_0_1=6.0.1"
set "five=5"
set "five5_0_2=5.0.2"
set "five5_1=5.1"
set "five5_0_1=5.0.1"
set "five5_1_1=5.1.1"
for /f "delims=" %%v in ('adb shell getprop ro.build.version.release') do set "version=%%v"
echo %version%
if "%ten%" == "%version%" goto :menu
if "%nine%" == "%version%" goto :menu
if "%eight_1%" == "%version%" goto :menu
if "%eight%" == "%version%" goto :menu
if "%seven%" == "%version%" goto :menu
if "%seven_1_2%" == "%version%" goto :menu
if "%seven_1_1%" == "%version%" goto :menu
if "%seven_1_2%" == "%version%" goto :menu
if "%six%" == "%version%" goto :menu
if "%six_0_1%" == "%version%" goto :menu
if "%five%" == "%version%" goto :menu
if "%five5_0_2%" == "%version%" goto :menu
if "%five5_1%" == "%version%" goto :menu
if "%five5_0_1%" == "%version%" goto :menu
if "%five5_1_1%" == "%version%" goto :menu
goto :devicenotfound

:devicenotfound
echo try to reconnect the device or enable the usb debugging in your settings
echo after that press forward
pause
cls
goto :devicecheck

:disclaimer
echo *** Disclaimer ***
echo I am not responsible for any damage YOU will do to your device
echo You have been warned, Do you accept? (Y/N)
echo.
SET /P inputd=Please Select:
if %inputd%==Y (
SET inputd=4920617070726f7665
) else (
set inputd=546s578eehds7s6553445401x
)
echo %inputd% > settings.txt
if %inputd%==4920617070726f7665 goto :devicecheck
if %inputd%==546s578eehds7s6553445401x exit


:menu
cls
color 07
echo ========================================================
echo DEVICE INFO
echo ========================================================
if %dinos%==1 adb devices -l 2>nul && fastboot devices 2>nul && echo Device version: && adb shell getprop ro.build.version.release 2>nul 
if %dinfb%==0 echo no devices connected in fastboot mode
if %dinos%==0 echo no devices connected
echo ========================================================
echo MAIN MENU
echo ========================================================
echo 1.  Fastboot/Bootloader Commands
echo.
echo 2.  Recovery Commands (Sideload)
echo.
echo 3.  System Commands
echo.
echo 4.  Credits
echo ========================================================
echo 0) EXIT
echo ========================================================

SET /P inputmm=Please Select:

if %inputmm%==1 goto menubootloader
if %inputmm%==2 goto menurecovery
if %inputmm%==3 goto menusystem
if %inputmm%==4 goto credits
if %inputmm%==0 exit


:menubootloader
cls
echo ========================================================
echo BOOTLOADER/FASTBOOT MENU
echo ========================================================
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
echo ========================================================
echo 0) EXIT
echo ========================================================
echo.
SET /P inputmb=Please Select:

if %inputmb%==0 goto :devicecheck

if %inputmb%==1 fastboot oem device-info && fastboot oem unlock && echo checking. && cls && echo checking.. && cls && echo checking... && fastboot getvar unlocked

if %inputmb%==2 fastboot format:ext4 userdata

if %inputmb%==3 fastboot format:f2fs userdata

if %inputmb%==4 SET /P recovery=Write recovery name like (recoveryname.img) && fastboot flash recovery %recovery%

if %inputmb%==5 SET /P kernel=Write kernel name like (kernelname.img) && fastboot flash boot %kernel%

if %inputmb%==6 SET /P rom=Write rom path like (/path/to/your/Rom.zip) && fastboot -w && fastboot update %rom%

if %inputmb%==7 fastboot devices

if %inputmb%==8 echo Loading. && echo Loading.. && fastboot reboot >nul && echo Loading... && goto :menubootloader

if %inputmb%==9 echo Loading. && echo Loading.. && fastboot reboot recovery >nul && echo Loading... && goto :menurecovery

pause
goto menubootloader



:menusystem
cls
echo ========================================================
echo SYSTEM MENU
echo ========================================================
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
echo 11) Change system info (NOT WORKING YET)
echo.
echo 12) Screen Recording 
echo. 
echo 13) SMARTPHONE Status
echo ========================================================
echo 0) EXIT
echo ========================================================
echo.
SET /P inputmb=Please Select:

if %inputmb%==0 goto :devicecheck

if %inputmb%==1 cls && echo Loading. && cls && adb reboot >nul && cls && echo Rebooted! 

if %inputmb%==2 echo Loading... && adb reboot recovery && goto :menurecovery

if %inputmb%==3 echo Loading... && adb reboot-bootloader && goto :menubootloader

if %inputmb%==4 adb devices

if %inputmb%==5 adb shell getprop ro.build.version.release

if %inputmb%==6 SET /P i=Write the app name like (app.apk) && adb install -r %i%

if %inputmb%==7 SET /P appcom=Write the app name like (com.myAppPackage) && adb uninstall %appcom%

if %inputmb%==8 SET /P ss=Write the size of the screen like (2048x1536) && adb shell wm size %ss%

if %inputmb%==9 SET /P sd=Write the density of the screen like (288) && adb shell wm density %sd%

if %inputmb%==10 adb shell wm size reset && adb shell wm density reset

if %inputmb%==11 goto changesystemsettings  

if %inputmb%==12 echo Press Control + C to stop the recording, the file is placed in /storage/emulated/0/ && adb shell screenrecord --verbose /storage/emulated/0/demo.mp4

if %inputmb%==13 cls && adb get-serialno && adb shell netstat && adb shell pwd && adb shell dumpsys battery && adb shell pm list features && adb shell service list && adb shell ps && adb shell wm size 

pause
goto menusystem


:changesystemsettings
cls
echo This process can cause damage to your SMARTPHONE
echo Select 1 to pull the build prop to C:/ folder, after the pull you can change your 
echo System info. After the change save it and Select 2
SET /P inputcss=Please Select 
if %inputcss%==0 goto menusystem
if %inputcss%==1 adb pull /system/build.prop "build.prop" 
if %inputcss%==2 
pause
goto changesystemsettings


:menurecovery
cls
echo ========================================================
echo RECOVERY MENU
echo ========================================================
echo What do you want to do?
echo.
echo 1) Sideload a zip
echo ========================================================
echo 0) EXIT
echo ========================================================
echo.
SET /P inputmb=Please Select:

if %inputmb%==0 goto :devicecheck

if %inputmb%==1 SET /P slzip=Write the zip name like (name.zip) && adb sideload %slzip%
pause
goto menurecovery

:credits
cls
color 0A
ECHO      ######  ##               ##    ######  ##   ##
ECHO     ##       ##   ###  ###   ##   ##   ##   ## ##
ECHO     ######   ##   ##  ##   ##    #######    ###
ECHO       ##     ##   ####   ##    ##   ##     ##
ECHO  ######      #####  #####    ##   ##     ##
ECHO 	::::::::::::::::::::::::::::::::
ECHO  	:: ATA Tool V0.4.1            ::
ECHO  	:: adb and fastboot tool      ::
ECHO  	:: Created By Sway	      ::
ECHO  	:: Copyright 2019 Sway	      ::
ECHO  	::::::::::::::::::::::::::::::::
echo ========================================================
echo CREDITS MENU
echo ========================================================
echo What do you want to do?
echo.
echo 1) Github
echo.
echo 2) Twitter
echo ========================================================
echo 0) EXIT
echo ========================================================
echo.
SET /P inputmb=Please Select:

if %inputmb%==0 goto :devicecheck

if %inputmb%==1  start "" https://github.com/MassimilianoSartore/Advance-Tool-for-Android

if %inputmb%==2  start "" https://twitter.com/SWayWasTaken
