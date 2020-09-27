#!/bin/bash
pause(){
    echo  "Press [Enter] key to continue..."
	read -p "$*"
	echo ""
}

banner(){
    echo  "       "
    echo  "       "
    echo  "  	  	               -/oyo  :MMMMMMMMMMMMMM+  +o/-                "
    echo  "  	  	         -/shmMMMMMs  .sssssMMMMyssss-  yMMMMmhs/-          "
    echo  "  	  	  .:+shmNMMMMMMdyo/.        MMMM.       -oydmMMMMMMmhs+:.   "
    echo  "  	   	hmNMMNmdhs+yMMN             MMMM.            NMMhshdmNMMMmdy"
    echo  "  	  	MMMmy+:.   oMMN             MMMM.            NMMo   .:+ymMMM"
    echo  "  	  	hdNMMMNmdhshMMN             MMMM.            NMMy+sydmNMMMNd"
    echo  "  	  	   ./oydmMMMMMMmhs+-        MMMM.       .:+shMMMMMMMmdyo:.  "
    echo  "  	  	         .:+shmMMMMy        MMMM.       sMMMMMmhs+:.        "
    echo  "  	  	                -+s+        mmmm.       ohs/-               "
    echo  "  	                                                                           "                                                        
    echo 	"      ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::        "
    echo  "      ::                  ATA Tool v0.0.2.28092020                  ::        "
    echo  "      ::                   adb and fastboot tool                    ::        "
    echo  "      ::                      Created By Sway	                    ::        "
    echo  "      ::                  Copyright 2019-2020 Sway	            ::        "
    echo  "      ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::        "
}

mainRecovery(){
    reset 
    banner
    echo  "================================================================================="
    echo  " RECOVERY MENU "
    echo  "================================================================================="
    echo  " 1. Sideload (ONLY .zip) "
    echo  "================================================================================="
    echo  " 0. Return to main menu"
    echo  "================================================================================="

    echo  "Please Select:"
    read inputmenu

    case $inputmenu in

    0)
        mainmenu
        ;;
    1)
        echo  "Please enter zip name file with exention:"
        read inputsideload
        ./adb sideload $inputsideload
        ;;
    esac
    echo  "Press [Enter] key to continue..."
    read 1 -p prompt
    mainRecovery
}

mainmenu(){
    reset
    banner
    echo  "================================================================================="
    echo  " SYSTEM MENU "
    echo  "================================================================================="
    echo  " 1. System Commands "
    echo  " 2. Recovery Commands (Sideload) "
    echo  " 3. Fastboot/Bootloader Commands "
    echo  "================================================================================="
    echo  " 0. EXIT "
    echo  "================================================================================="

    echo  "Please Select:"
    read inputmenu

    case $inputmenu in
    0)
        exit
        ;;    
    1)
        mainSystem
        ;;
    2)
        mainRecovery
        ;;
    3)
        mainFastboot
        ;;       
    esac
    pause
    mainmenu
}

mainFastboot()
    {
    reset 
    banner
    echo  "================================================================================="
    echo  " FASTBOOT MENU "
    echo  "================================================================================="
    echo  " 1. FLASH RECOVERY (only .img file) "
    echo  " 2. FLASH KERNEL (only .img file) "
    echo  " 3. FLASH ROM (You must know what you are doing) "
    echo  " 4. Check connected devices "
    echo  " 5. Boot into ROM "
    echo  " 6. Boot into recovery "
    echo  " 7. Hard Reset "
    echo  " 8. FORMAT DATA PARTITION (EXT4) "
    echo  " 9. FORMAT DATA PARTITION (F2FS) "
    echo  "================================================================================="
    echo  " 0. Return to main menu"
    echo  "================================================================================="

    echo  "Please Select:"
    read inputmenu

    case $inputmenu in

    0)
        mainmenu
        ;;
    1)
        echo  " Write recovery name like (recoveryname.img) "
        read inputfr
        fastboot flash recovery $inputfr
        ;;
    2)
        echo  " Write kernel name like (kernelname.img) "
        read inputfk
        fastboot flash boot $inputfk
        ;;
    3)
        echo  " Write rom path like (/path/to/your/Rom.zip) "
        read inputfrom
        fastboot -w
        fastboot update $inputfrom
        ;;
    4)
        fastboot devices
        ;;
    5)
        echo  " Booting into rom "
        fastboot reboot 
        ;;
    6)
        echo  " Booting into recovery "
        fastboot reboot recovery
        ;;
    7)
        echo  " Erasing process started "
        fastboot erase userdata
        fastboot erase cache
        ;;
    8)
        fastboot format:ext4 userdata
        ;;
    9)
        fastboot format:f2fs userdata
        ;;

    esac
    pause
    mainFastboot
}

mainSystem()
{
reset 
banner
echo  "================================================================================="
echo  " SYSTEM MENU "
echo  "================================================================================="
echo  " 1. Check connected devices "
echo  " 2. REBOOT SMARTPHONE "
echo  " 3. REBOOT INTO THE RECOVERY "
echo  " 4. REBOOT INTO THE Fastboot/Bootloader "
echo  " 5. Device version "
echo  " 6. Device serial number "
echo  " 7. Enable Dark Mode "
echo  " 8. Disable Dark Mode "
echo  " 9. APK MENU  "
echo  "================================================================================="
echo  " 0. Return to mainSystem menu"
echo  "================================================================================="


echo  "Please Select:"
read inputmenu

case $inputmenu in

   0)
    mainmenu
    ;;
   1)
    ./adb devices
    ;;
   2)
    ./adb reboot
    ;;
   3)
    ./adb reboot recovery
    ;;
   4)
    ./adb reboot-bootloader
    ;;
   5)
    ./adb shell getprop ro.build.version.release
    ;;
   6)
    ./adb get-serialno
    ;;
   7)
    ./adb shell settings put secure ui_night_mode 2
    ./adb reboot
    ;;
   8)
    ./adb shell settings put secure ui_night_mode 1
    ./adb reboot
    ;;
   9)
    APKmenu
    ;;
esac
pause
mainSystem
}

APKmenu()
{
reset 
banner
echo  "================================================================================="
echo  " APK MENU "
echo  "================================================================================="
echo "1) List of non system app"
echo "2) List of system app"
echo "3) Install an app"
echo "4) Unistall an app (No System App)"
echo "5) Unistall System App/Bloat "
echo  "================================================================================="
echo  " 0. Return to mainSystem menu"
echo  "================================================================================="
echo  "Please Select:"
read inputmenuapk

case $inputmenuapk in
   
   0)
    mainSystem
    ;;
   1)
    ./adb shell pm list packages -3
    ;;
   2)
    ./adb shell pm list packages -s
    ;;
   3)
   echo  "Write the app name like (com.myAppPackage)"
   read inputapkname
    ./adb install -r $inputapkname
    ;;
   4)
   echo  "Write the app name like (com.myAppPackage)"
   read inputapkname
    ./adb uninstall $inputapkname
    ;;
   5)
   echo  "Write the app name like (com.myAppPackage)"
   read inputapkname
    ./adb shell pm uninstall -k --user 0 $inputapkname
    ;;
esac
pause
APKmenu
}
mainmenu