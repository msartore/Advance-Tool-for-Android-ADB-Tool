Rem Tool made by Sway 
Rem github repository: https://github.com/MassimilianoSartore/Advance-Tool-for-Android-ADB-Tool-
Rem twitter: https://twitter.com/SWayWasTaken
Rem email: massimiliano.sartore@protonmail.com
Rem Copyright (C) 2019-2020 SwayWasTaken

MODE 150
@echo off
:prelaunch
TITLE ATA Tool by Sway [USER MODE]
color 07
call "Banners/banner1.bat"
echo. 
echo Log:
echo.
if exist settings.ini (
    goto :disclaimercheck
) else (
    echo a >> settings.ini
)

:disclaimercheck
set DeviceCheckVar=0
for /f %%a in (settings.ini) do (
    if %%a==417070726f766564 (
        goto :adblaunch
    ) else (
        goto :disclaimer
    )
)

:infodevice
echo [  OK  ] Device found!
for /f "delims=" %%v in ('adb shell getprop ro.build.user') do set "ro_build_user=%%v"
echo [  OK  ] ro.build.use loaded!
for /f "delims=" %%v in ('adb shell getprop ro.product.cpu.abilist') do set "ro_product_cpu_abilist=%%v"
echo [  OK  ] ro.product.cpu.abilist loaded!
for /f "delims=" %%v in ('adb shell getprop ro.product.manufacturer') do set "ro_product_manufacturer=%%v"
echo [  OK  ] ro.product.manufacturer loaded!
for /f "delims=" %%v in ('adb shell getprop ro.product.model') do set "ro_product_model=%%v"
echo [  OK  ] ro.product.model loaded! 
for /f "delims=" %%v in ('adb shell getprop ro.product.board') do set "ro_product_board=%%v"
echo [  OK  ] ro.product.board loaded!
for /f "delims=" %%v in ('adb shell getprop ro.product.device') do set "ro_product_device=%%v"
echo [  OK  ] ro.product.device loaded!
for /f "delims=" %%v in ('adb shell getprop ro.build.version.release') do set "ro_android_version=%%v"
echo [  OK  ] ro.build.version.release loaded!
goto :menu 

:infodevicenul
echo [  OK  ] Device still connected!
echo Loading device info again..
for /f "delims=" %%v in ('adb shell getprop ro.build.user') do set "ro_build_user=%%v"
for /f "delims=" %%v in ('adb shell getprop ro.product.cpu.abilist') do set "ro_product_cpu_abilist=%%v"
for /f "delims=" %%v in ('adb shell getprop ro.product.manufacturer') do set "ro_product_manufacturer=%%v"
for /f "delims=" %%v in ('adb shell getprop ro.product.model') do set "ro_product_model=%%v"
for /f "delims=" %%v in ('adb shell getprop ro.product.board') do set "ro_product_board=%%v"
for /f "delims=" %%v in ('adb shell getprop ro.product.device') do set "ro_product_device=%%v"
for /f "delims=" %%v in ('adb shell getprop ro.build.version.release') do set "ro_android_version=%%v"
goto :menu 

:notsuccess
cls
call "Banners/banner1.bat"
echo.
echo Log:
echo.
echo [FAILED] ADB launch failed!
echo [FAILED] Device not found!
echo [FAILED] ro.build.use failed to load!
timeout /T 2>nul
echo [FAILED] ro.product.cpu.abilist failed to load!
timeout /T 2>nul
echo [FAILED] ro.product.manufacturer failed to load!
timeout /T 2>nul
echo [FAILED] ro.product.model failed to load! 
timeout /T 2>nul
echo [FAILED] ro.product.board failed to load!
timeout /T 2>nul
echo [FAILED] ro.product.device failed to load!
timeout /T 2>nul
echo [FAILED] ro.build.version.release failed to load!
timeout /T 2>nul
echo Booting into Bootloader menu
goto :devicenotfound

:adblaunch
echo checking internet connection
Ping www.google.nl -n 1 -w 1000>nul
if errorlevel 1 ( 
    TITLE ATA Tool by Sway [USER OFFLINE MODE]
    goto :integritycheck 
) else ( 
    goto :ATAupdate 
)
:ATAupdate
echo Checking if ATA is up-to-date!
taskkill /f /im adb.exe>nul
powershell -command "& { iwr https://github.com/MassimilianoSartore/ATA-updater/raw/master/updatecheck.zip -OutFile updatecheck.zip }"
echo Unzipping updatecheck.zip
cscript //B j_unzip.vbs updatecheck.zip
echo Deleting updatecheck.zip
del updatecheck.zip
for /f %%b in (update) do (
    for /f %%a in (version) do (
        if %%a==%%b (
            echo ATA is up-to-date
            del update
            goto :integritycheck
        ) else (
            if exist ATAupdater.bat (
                del update
                start ATAupdater.bat
                exit
            ) else (
                echo update failed!
                echo You have to download ATA again!
                start "" https://massimilianosartore.github.io/Advance-Tool-for-Android-ADB-Tool/
                exit 
                pause
            )
        )
    )
)
:integritycheck
echo integrity check started
set adbint=0
echo Checking fastboot.exe
if exist fastboot.exe  set /a adbint=1
if /I "%adbint%" LSS "1" (
    echo fastboot not found
    taskkill /f /im adb.exe>nul
    del fastboot.exe 2>nul
    echo adb installation process started
    if exist j_unzip.vbs (
        echo platform-tools download started
        powershell -command "& { iwr https://dl.google.com/android/repository/platform-tools-latest-windows.zip -OutFile adb.zip }"
        echo Unzipping adb.zip
        cscript //B j_unzip.vbs adb.zip
        set main="%cd%"
        echo Moving fastboot.exe in %cd%
        move platform-tools\fastboot.exe %main%
        echo Deleting platform-tools folder
        rmdir /Q /S platform-tools
        echo Deleting adb.zip
        del adb.zip
        goto :adblaunch
    ) else (
        echo integrity check failed
        echo You have to download ATA again!
        pause
        exit 
    )
) else (
    echo [  OK  ] fastboot.exe found!
)
echo Checking adb.exe
if exist adb.exe set /a scrint+=1
echo Checking AdbWinApi.dll
if exist AdbWinApi.dll set /a scrint+=1 
echo Checking AdbWinUsbApi.dll
if exist AdbWinUsbApi.dll set /a scrint+=1
echo Checking avutil-56.dll
if exist avutil-56.dll set /a scrint+=1
echo Checking avcodec-58.dll
if exist avcodec-58.dll set /a scrint+=1
echo Checking avformat-58.dll
if exist avformat-58.dll set /a scrint+=1
echo Checking scrcpy.exe
if exist scrcpy.exe set /a scrint+=1
echo Checking scrcpy-noconsole.exe
if exist scrcpy-noconsole.exe set /a scrint+=1
echo Checking scrcpy-server
if exist scrcpy-server set /a scrint+=1
echo Checking SDL2.dll
if exist SDL2.dll set /a scrint+=1
echo Checking swresample-3.dll
if exist swresample-3.dll set /a scrint+=1
echo Checking swscale-5.dll
if exist swscale-5.dll set /a scrint+=1
if /I "%scrint%" LSS "11" (
    taskkill /f /im adb.exe 2>nul
    echo scrcpy broken!
    del AdbWinApi.dll 2>nul
    del AdbWinUsbApi.dll 2>nul
    del adb.exe 2>nul
    del avutil-56.dll 2>nul
    del avcodec-58.dll 2>nul
    del avformat-58.dll 2>nul
    del scrcpy.exe 2>nul
    del scrcpy-noconsole.exe 2>nul
    del scrcpy-server 2>nul
    del SDL2.dll 2>nul
    del swresample-3.dll 2>nul
    del swscale-5.dll 2>nul
    echo scrcpy installation process started
    if exist j_unzip.vbs (
        echo scrcpy download started
        powershell -command "& { iwr https://github.com/Genymobile/scrcpy/releases/download/v1.12.1/scrcpy-win64-v1.12.1.zip -OutFile scrcpy.zip }"
        echo Unzipping scrcpy.zip
        cscript //B j_unzip.vbs scrcpy.zip
        echo Deleting scrcpy.zip
        del scrcpy.zip
        goto :adblaunch
    ) else (
        echo integrity check failed
        echo You have to download ATA again!
        pause
        exit
    )
) else (
    echo [  OK  ] adb.exe found!
    echo [  OK  ] AdbWinApi.dll found!
    echo [  OK  ] AdbWinUsbApi.dll found!
    echo [  OK  ] avutil-56.dll found!
    echo [  OK  ] avcodec-58.dll found!
    echo [  OK  ] avformat-58.dll found!
    echo [  OK  ] scrcpy.exe found!
    echo [  OK  ] scrcpy-noconsole.exe found!
    echo [  OK  ] scrcpy-server found!
    echo [  OK  ] SDL2.dll found!
    echo [  OK  ] swresample-3.dll found!
    echo [  OK  ] swscale-5.dll found!
    echo integrity check finished
    echo ADB launch...
    fastboot devices >nul
    adb devices >nul
    goto :devicecheck
)

:dev
cls
call "Banners/devbanner.bat"
echo.
echo  You are now a developer!
pause
cls
TITLE ATA Tool by Sway [DEV MODE]
color 0E
set ro_build_user=NOT LOADED
set ro_product_cpu_abilist=NOT LOADED
set ro_product_manufacturer=NOT LOADED
set ro_product_model=NOT LOADED
set ro_product_board=NOT LOADED
set ro_product_device=NOT LOADED
set ro_android_version=NOT LOADED
goto menu

:devicecheck
if exist admin.dev goto dev
set devicestatus=0
echo Checking if the device is connected...
for /f "delims=" %%v in ('adb shell getprop ro.build.version.release') do set "devicestatus=%%v"
if /I "%devicestatus%" GEQ "1" (
    if %DeviceCheckVar%==0 (
        set DeviceCheckVar=1
        goto :infodevice
    ) else (
        goto :infodevicenul
    )
) else ( 
    goto :notsuccess
    pause
)

:devicenotfound
cls
call "Banners/banner1.bat"
echo =================================================================================
echo DEVICE NOT FOUND/MULTIPLE DEVICES FOUND!
echo.
echo - try to reconnect the device or enable the usb debugging in your settings
echo   after that press enter
echo.
echo - If you are using adb over network, please remove the cable connected to that device
echo =================================================================================
echo 1. fastboot mode 
echo 2. adb sideload
echo 3. Restart the program
echo =================================================================================
echo 0) EXIT
echo =================================================================================
echo.
SET /P inputdnt=Please Select:
echo. 
echo log:
if %inputdnt%==0 goto :exitstatus
if %inputdnt%==1 goto :menubootloader
if %inputdnt%==2 goto :menurecovery
if %inputdnt%==3 goto :devicecheck
echo Error, Wrong input!
pause
cls 
goto :devicecheck

:disclaimer
cls
call "Banners/banner1.bat"
echo *** Disclaimer ***
echo I am not responsible for any damage YOU will do to your device
echo You have been warned, Do you accept? (Y/N)
echo.
SET /P inputd=Please Select:
echo.
echo log:
if %inputd%==Y SET inputd=417070726f766564 
if %inputd%==y SET inputd=417070726f766564 
if %inputd%==N set inputd=6e6f7420617070726f766564
if %inputd%==n set inputd=6e6f7420617070726f766564
echo %inputd% > settings.ini
if %inputd%==417070726f766564 goto :disclaimercheck
if %inputd%==6e6f7420617070726f766564 exit
echo Error, Wrong input!
pause
cls
goto :disclaimer


:menu
set errorlevelaon=1
adb connect %adbwlanvar% | findstr "%adbwlanvar%:5555" && if %ERRORLEVEL%==0 set errorlevelaon=0
if %errorlevelaon%==0 ( 
    set adbwlanstatus=connected to %adbwlanvar%:5555
) else (
    set adbwlanstatus=Error! Any device connected/found
)
cls
call "Banners/banner2.bat"
echo =================================================================================
echo DEVICE INFO
echo =================================================================================
echo Rom builder name: %ro_build_user%     Board: %ro_product_board%     Android Version: %ro_android_version%
echo.
echo Manufacturer: %ro_product_manufacturer%     Model: %ro_product_model%     Device Product: %ro_product_device%
echo.
echo Compitable Apk file: %ro_product_cpu_abilist%     ip registered(ADB over network): %adbwlanstatus%
echo.
echo Wireless debugging: %wirelessDebugging%
echo =================================================================================
echo MAIN MENU
echo =================================================================================
echo 1.  Fastboot/Bootloader Commands
echo.
echo 2.  Recovery Commands (Sideload)
echo.
echo 3.  System Commands
echo.
echo 4.  Stream your SMARTPHONE
echo.
echo 5.  Create your own program!
echo.
echo 6.  ADB over network menu
echo.
echo 7.  Credits
echo =================================================================================
echo 0) EXIT
echo =================================================================================
SET /P inputmm=Please Select:
echo. 
echo log:
if %inputmm%==1 goto menubootloader
if %inputmm%==2 goto menurecovery
if %inputmm%==3 goto menusystem
if %inputmm%==4 call "scrcpy"
if %inputmm%==5 goto creator
if %inputmm%==6 goto adbnetworkmenu
if %inputmm%==7 goto credits
if %inputmm%==0 goto exitstatus
echo. && echo. && echo log: && echo Error! this section doesn't exist. 
pause
goto :menu

:adbnetworkmenu
cls
call "Banners/banner2.bat"
echo =================================================================================
echo ADB OVER NETWORK MENU
echo =================================================================================
echo 1. Connect via ADB over network
echo.
echo 2. Disconnect manually
echo.
echo 3. Connect with Wireless debugging
echo.
echo 4. Disconnect with Wireless debugging
echo =================================================================================
echo 0) BACK
echo =================================================================================
SET /P inputanm=Please Select:
rem Disconnect (%adbwlanstatus%) (NOT WORKING YET)
rem adb disconnect %adbwlanvar%:5555 && del deviceip.tmp && goto devicecheck
if %inputanm%==1 goto adbwlan
if %inputanm%==2 goto disconnectprocess
if %inputanm%==3 (
    SET /P ipaddr=Write IP address: 
    SET /P port=Write port number: 
    adb pair %ipaddr%:%port% 
    adb connect %ipaddr%:%port%
)
if %inputanm%==4 adb disconnect %ipaddr%:%port%
if %inputanm%==0 goto devicecheck
echo. && echo. && echo log: && echo Error! this section doesn't exist. 
goto adbnetworkmenu

:disconnectprocess
adb shell ip route 
SET /P inputanmvar=Enter ip displayed:
adb disconnect %inputanmvar% | findstr "disconnect" && if %ERRORLEVEL%==0 set errorlevelaon=0
if %errorlevelaon%==0 ( 
    pause 
    set adbwlanvar=""
    set adbwlanstatus=Error! Any device connected/found
    goto devicecheck 
) else (
    echo Error!
    goto adbnetworkmenu
)

:adbwlan
set errorlevelaon=1
adb devices 
adb shell ip route
echo Write the ip that you will find at the end
SET /P adbwlanvar=Enter device ip:
adb tcpip 5555
adb connect %adbwlanvar% | findstr "%adbwlanvar%:5555" && if %ERRORLEVEL%==0 set errorlevelaon=0
if %errorlevelaon%==0 ( 
    echo Done!
    echo now you can detach the cable from your smartphone, you can only use system commands via WLAN
    set adbwlanstatus=connected to %adbwlanvar%:5555
) else (
    echo Failed!
    set adbwlanstatus=Error! Any device connected/found
)
pause
goto :adbnetworkmenu

:menubootloader
cls
call "Banners/banner1.bat"
echo =================================================================================
echo BOOTLOADER/FASTBOOT MENU
echo =================================================================================
echo What do you want to do?
echo.
echo 1) UNLOCK/LOCK BOOTLOADER 
echo 2) FORMAT DATA PARTITION (EXT4)
echo 3) FORMAT DATA PARTITION (F2FS)
echo 4) FLASH MENU
echo 5) Check connected devices
echo 6) Boot into ROM
echo 7) Boot into recovery
echo 8) Hard Reset
echo 9) Fastboot reboot
echo =================================================================================
echo 0) BACK
echo =================================================================================
SET /P inputmb=Please Select:
echo.
echo log:
if %inputmb%==0 goto :devicecheck

if %inputmb%==1 goto :menubootloaderunlock

if %inputmb%==2 fastboot format:ext4 userdata

if %inputmb%==3 fastboot format:f2fs userdata

if %inputmb%==4 goto :menufastbootflash

if %inputmb%==5 fastboot devices

if %inputmb%==6 echo Loading. && echo Loading.. && fastboot reboot >nul && echo Loading... && goto :menusystem

if %inputmb%==7 echo Loading. && echo Loading.. && fastboot reboot recovery >nul && echo Loading... && goto :menurecovery

if %inputmb%==8 echo Erasing process started && fastboot erase userdata && fastboot erase cache && echo Erasing process finished! 

if %inputmb%==9 echo rebooting.. && fastboot reboot && echo done!
pause
goto menubootloader

:menufastbootflash
cls
call "Banners/banner1.bat"
echo =================================================================================
echo BOOTLOADER/FASTBOOT FLASH MENU
echo =================================================================================
echo What do you want to do?
echo.
echo 1) FLASH BOOT (only .img file)
echo 2) FLASH BOOTLOADER (only .img file)
echo 3) FLASH RADIO (only .img file)
echo 4) FLASH RECOVERY (only .img file)
echo 5) FLASH SYSTEM (only .img file)
echo 6) FLASH VENDOR (only .img file)
echo 7) FLASH CACHE (only .img file)
echo 8) FLASH ROM (You must know what you are doing)
echo =================================================================================
echo 0) BACK
echo =================================================================================
SET /P inputmfb=Please Select:
echo.
echo log:
if %inputmfb%==0 goto :menubootloader

if %inputmfb%==1 SET /P boot=Write boot name like (bootname.img) && fastboot flash boot %boot%

if %inputmfb%==2 SET /P bootloader=Write bootloader name like (bootloadername.img) && fastboot flash bootloader %boot% && echo Rebooting.. && fastboot reboot-bootloader && echo done!

if %inputmfb%==3 SET /P radio=Write radio name like (radioname.img) && fastboot flash radio %radio%

if %inputmfb%==4 SET /P recovery=Write recovery name like (recoveryname.img) && fastboot flash recovery %recovery%

if %inputmfb%==5 SET /P system=Write system name like (systemname.img) && fastboot flash system %system%

if %inputmfb%==6 SET /P vendor=Write vendor name like (vendorname.img) && fastboot flash vendor %vendor%

if %inputmfb%==7 SET /P cache=Write cache name like (cachename.img) && fastboot flash cache %cache%

if %inputmfb%==8 SET /P rom=Write rom path like (/path/to/your/Rom.zip) && fastboot -w && fastboot update %rom%

goto :menufastbootflash


:menubootloaderunlock
cls
call "Banners/banner1.bat"
echo =================================================================================
echo BOOTLOADER UNLOCK/LOCK MENU
echo =================================================================================
echo What do you want to do? (To use all commands below you have to boot in bootloader mode)
echo.
echo 1) UNLOCK BOOTLOADER for older devices (2014 and earlier) (not all device supported)
echo 2) UNLOCK BOOTLOADER For newer devices (2015 and later) (not all device supported)
echo 3) LOCK BOOTLOADER For older devices (2014 and earlier) (not all device supported)
echo 4) LOCK BOOTLOADER For newer devices (2015 and later) (not all device supported)
echo 5) GET BOOTLOADER INFO 
echo 6) UNLOCK BOOTLOADER for device that have an unlock.bin to flash (Put it inside the folder before start the command)
echo 7) Device ID
echo 8) Oem unlock data (for Motorola devices)
echo 9) UNLOCK BOOTLOADER FOR MOTOROLA DEVICES (I MUST HAVE YOUR OEM UNLOCK CODE)
echo 10) UNLOCK BOOTLOADER FOR VIVO DEVICES
echo 11) LOCK BOOTLOADER FOR VIVO DEVICES
echo =================================================================================
echo 0) BACK
echo =================================================================================
echo.
SET /P inputmbul=Please Select:
echo.
echo log:
if %inputmbul%==0 goto :menubootloader

if %inputmbul%==1 fastboot oem device-info && echo Oem unlocking.. && fastboot oem unlock && echo Getting var unlock state.. && fastboot getvar unlocked

if %inputmbul%==2 fastboot oem device-info && echo Oem unlocking.. && fastboot flashing unlock && echo Getting var unlock state.. && fastboot getvar unlocked

if %inputmbul%==3 fastboot oem device-info && echo Oem locking.. && fastboot oem lock && echo Getting var unlock state.. && fastboot getvar unlocked

if %inputmbul%==4 fastboot oem device-info && echo Oem locking.. && fastboot flashing lock && echo Getting var unlock state.. && fastboot getvar unlocked

if %inputmbul%==5 fastboot getvar all && echo Done!

if %inputmbul%==6 fastboot flash unlock unlock.bin && fastboot reboot && echo Done! && echo. && echo Rebooting!

if %inputmbul%==7 fastboot oem device-id && echo Done!

if %inputmbul%==8 fastboot oem get_unlock_data && echo Done!

if %inputmbul%==9 SET /P oemcode=Paste the code here && fastboot oem unlock %oemcode% && echo Done && echo Rebooting!
pause
if %inputmbul%==10 fastboot bbk unlock_vivo && echo Done!

if %inputmbul%==11 fastboot bbk lock_vivo && echo Done!
goto menubootloaderunlock

:menusystem
cls
call "Banners/banner1.bat"
echo =================================================================================
echo SYSTEM MENU
echo =================================================================================
echo What do you want to do?
echo.
echo 1) REBOOT SMARTPHONE
echo 2) REBOOT INTO THE RECOVERY
echo 3) REBOOT INTO THE Fastboot/Bootloader
echo 4) Check connected devices
echo 5) Interface
echo 6) Install an app
echo 7) Unistall an app (No System App)
echo 8) Emulate device (Resize Screen)
echo 9) Emulate device (Change Density)
echo 10) Reset (Emulate device)
echo 11) Change system info 
echo 12) Screen Recording 
echo 14) Unistall System App/Bloat 
echo 15) Grant root permissions (App)
echo 16) Device Info
echo =================================================================================
echo 0) BACK
echo =================================================================================
echo.
SET /P inputms=Please Select:
echo.
echo log:
if %inputms%==0 goto :devicecheck

if %inputms%==1 echo Loading... && adb reboot >nul && echo Rebooted! 

if %inputms%==2 echo Loading... && adb reboot recovery && goto :menurecovery

if %inputms%==3 echo Loading... && adb reboot-bootloader && goto :menubootloader

if %inputms%==4 adb devices

if %inputms%==5 goto :Interface

if %inputms%==6 SET /P i=Write the app name like (app.apk) && adb install -r %i%

if %inputms%==7 SET /P appcom=Write the app name like (com.myAppPackage) && adb uninstall %appcom%

if %inputms%==8 SET /P ss=Write the size of the screen like (2048x1536) && adb shell wm size %ss%

if %inputms%==9 SET /P sd=Write the density of the screen like (288) && adb shell wm density %sd%

if %inputms%==10 adb shell wm size reset && adb shell wm density reset

if %inputms%==11 echo Loading... && adb reboot recovery && echo Booting to recovery! && goto changesystemsettings  

if %inputms%==12 echo Press Control + C to stop the recording, the file is placed in /storage/emulated/0/ && adb shell screenrecord --verbose /storage/emulated/0/demo.mp4

if %inputms%==14 SET /P app_com=Write the app name like com.myAppPackage && echo Loading.. && adb shell pm uninstall -k --user 0 %app_com% 

if %inputms%==15 goto :grantpermissions

if %inputms%==16 goto :deviceinfo

pause
goto menusystem


:deviceinfo
if not exist temp\ md temp\>nul
cls
call "Banners/banner2.bat"
echo =================================================================================
echo DEVICE INFO MENU
echo =================================================================================
echo 1) Run Logcat and Display On Screen Only
echo 2) Run Logcat and Record Text File Locally
echo 3) Run "getevent" and Display On Screen Only
echo 4) Run "getevent" and Record Text File Locally
echo 5) Check devices version connected
echo 6) View System Info (Data From build.prop, g.prop, and others)\
echo 7) List of system app
echo 8) List of non system app
echo 9) SMARTPHONE Status
echo =================================================================================
echo 0) BACK
echo =================================================================================
echo.
SET /P inputdinfo=Please Select:
echo.
echo log:
if %inputdinfo%==0 goto :menusystem

if %inputdinfo%==1 start "" adb shell logcat

if %inputdinfo%==2 adb shell logcat > "temp\logcat.txt"

if %inputdinfo%==3 start "" adb shell getevent

if %inputdinfo%==4 adb shell getevent > "temp\getevent.txt"

if %inputdinfo%==5 adb shell getprop ro.build.version.release

if %inputdinfo%==6 start view_buildprop_info.bat

if %inputdinfo%==7 adb shell pm list packages -s

if %inputdinfo%==8 adb shell pm list packages -3

if %inputdinfo%==9 cls && adb get-serialno && adb shell netstat && adb shell pwd && adb shell dumpsys battery && adb shell pm list features && adb shell service list && adb shell ps && adb shell wm size 

pause
goto deviceinfo


:Interface
cls
call "Banners/banner2.bat"
echo =================================================================================
echo INTERFACE MENU
echo =================================================================================
echo 1) Enable Dark Mode
echo 2) Disable Dark Mode
echo =================================================================================
echo 0) BACK
echo =================================================================================
echo.
SET /P inputms=Please Select:
echo.
echo log:
if %inputms%==0 goto :devicecheck

if %inputms%==1 adb shell settings put secure ui_night_mode 2 && echo Loading. && cls && adb reboot >nul && cls && echo Rebooted! 

if %inputms%==2 adb shell settings put secure ui_night_mode 1 && echo Loading. && cls && adb reboot >nul && cls && echo Rebooted! 
pause
goto :menusystem

:changesystemsettings
cls
echo This process can cause damage to your SMARTPHONE
echo.
echo Select Mount and then select System from the list of partitions to mount the system partition and then go back.
echo.
echo Select 1 to pull the build.prop to ATA folder, after the pull you can change your 
echo system info. After the change save it and Select 2
goto :changesystemsettings1
:changesystemsettings1
SET /P inputcss=Please Select 
if %inputcss%==0 goto menusystem
if %inputcss%==1 adb pull /system/build.prop "build.prop" && goto :changesystemsettings1 
if %inputcss%==2 adb push "build.prop" /system/ && goto :changesystemsettings2
:changesystemsettings2
echo Now you have to write:
echo cd system
echo chmod 644 build.prop
echo exit
echo Now reboot into the system
adb shell
pause
goto :menusystem


:menurecovery
cls
call "Banners/banner1.bat"
echo =================================================================================
echo RECOVERY MENU
echo =================================================================================
echo What do you want to do?
echo.
echo 1) Sideload a zip
echo =================================================================================
echo 0) BACK
echo =================================================================================
echo.
SET /P inputmr=Please Select:
echo.
echo log:
if %inputmr%==0 goto :devicecheck
set slzip=0
if %inputmr%==1 SET /P slzip=Write the zip name like (name.zip)
adb sideload %slzip%
pause
goto menurecovery

:credits
cls
color 0A
call "Banners/banner2.bat"
echo =================================================================================
echo CREDITS MENU
echo =================================================================================
echo What do you want to do?
echo.
echo 1) Github
echo 2) Twitter
echo 3) Donate
echo 4) Scrcpy repository
echo 5) SDK Platform Tools Website
echo =================================================================================
echo 0) BACK
echo =================================================================================
echo.
SET /P inputmc=Please Select:
echo.
echo log:
if %inputmc%==0 goto :devicecheck 

if %inputmc%==1  start "" https://github.com/MassimilianoSartore/Advance-Tool-for-Android

if %inputmc%==2  start "" https://twitter.com/SWayWasTaken

if %inputmc%==3  start "" https://www.paypal.me/SWayGaming && echo Thank you very much for offering to help out with this project!

if %inputmc%==4  start "" https://github.com/Genymobile/scrcpy/

if %inputmc%==5  start "" https://developer.android.com/studio/releases/platform-tools.html
pause
goto :credits

:optionalreboot
echo Do you want to reboot the SMARTPHONE(Y/N)?
set /p inputop=Please Select:

if %inputop%==Y cls && echo Loading... && adb reboot >nul && cls && echo Rebooted! 
else
goto :menusystem


:grantpermissions
cls
call "Banners/banner2.bat"
echo =================================================================================
echo ROOT PERMISSIONS MENU
echo =================================================================================
echo What do you want to do?
echo.
echo 1) Grant WRITE_SECURE_SETTINGS permission
echo 2) Grant DUMP permission
echo 3) Check for granted permissions
echo =================================================================================
echo 0) BACK
echo =================================================================================
echo.
SET /P inputgp=Please Select:
echo.
echo log:
if %inputgp%==0 goto :devicecheck 

if %inputgp%==1 SET /P app_gp=Write the app name like com.myAppPackage && echo Loading.. && adb shell pm grant %app_gp% android.permission.WRITE_SECURE_SETTINGS && echo Executed!

if %inputgp%==2 SET /P app_gp=Write the app name like com.myAppPackage && echo Loading.. && adb shell pm grant %app_gp% android.permission.DUMP && echo Executed!

if %inputgp%==3 SET /P app_gp=Write the app name like com.myAppPackage && echo Loading.. && adb shell dumpsys package %app_gp% && echo Executed!
pause
goto :grantpermissions


:exitstatus
tasklist /FI "IMAGENAME eq adb.exe" 2>NUL | find /I /N "adb.exe">NUL
if "%ERRORLEVEL%"=="0" goto :exit
exit

:exit 
cls
call "Banners/banner1.bat"
echo The ADB.exe is still running, Do you want to kill it? (Y/n)
SET /P inputex=Please Select:
if %inputex%==Y (
    if DEFINED adbwlanvar (
        adb disconnect %adbwlanvar%
    )
    if DEFINED ipaddr (
        adb disconnect %ipaddr%:%port%
    )
    taskkill /f /im adb.exe
    del deviceip.tmp
    echo Done! 
    goto :exitstatus
)
if %inputex%==y (
    adb disconnect %ipaddr%:%port%>nul
    taskkill /f /im adb.exe
    del deviceip.tmp
    echo Done! 
    goto :exitstatus
)
if %inputex%==N exit
if %inputex%==n exit 
echo Error, Wrong input!
pause
goto :exitstatus


:creator
cls
call "Banners/banner2.bat"
echo.
echo =================================================================================
echo PROGRAM MENU
echo =================================================================================
echo What do you want to do?
echo.
echo 1) Create a program (.bat)
echo 2) Run a program 
echo =================================================================================
echo 0) BACK
echo =================================================================================
SET /P crinput=Please Select:
echo.
echo log:
if %crinput%==1 goto creator1
if %crinput%==2 goto runp
if %crinput%==0 goto menu
pause
goto creator

:creator1
SET /P inputcr=Program name:
if exist %inputcr%.bat (
    echo %inputcr% exist, change the name!
    pause
) else (
    echo @echo off >> %inputcr%.bat
    echo created!
    goto commandsin
)
goto :creator1

:commandsin
cls
call "Banners/banner2.bat"
echo.
echo =================================================================================
echo REMOTE COMMANDS MENU
echo =================================================================================
echo What do you want to do?
echo.
echo 1) Instruction
echo 2) Text
echo =================================================================================
echo 0) BACK
echo =================================================================================
SET /P ccinput=Please Select:
echo.
echo log:
if %ccinput%==1 goto instruction
if %ccinput%==2 goto textc
if %ccinput%==0 goto creator
echo Done!
echo Do you want to continue? (Y/n)
SET /P inputcr1=Please Select:
if %inputcr1%==Y goto commandsin
if %inputcr1%==y goto commandsin
if %inputcr1%==N goto creator
if %inputcr1%==n goto creator
goto commandsin

:instruction
SET /P inputcom=Instruction number: 
echo adb shell input keyevent %inputcom% >> %inputcr%.bat
goto commandsin

:textc
SET /P inputcom=Text: 
echo adb shell input text %inputcom% >> %inputcr%.bat
goto commandsin

:runp
SET /P inputcc1=Program name with extension: 
if exist %inputcc1% (
    start %inputcc1%
    echo Launched!
) else (
    echo The program doesn't exist!
)
pause
goto creator