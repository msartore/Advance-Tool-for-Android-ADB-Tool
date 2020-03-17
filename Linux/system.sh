reset 
tput setaf 2; echo  "       "
tput setaf 2; echo  "       "
tput setaf 2; echo  "       :shdddhy+..yyyyo    oyyyy.   :yyyy:./shdddhyo- -yyyy+      yyyyo    "             
tput setaf 2; echo  "       hMMMNNNMMMN+yMMMM-  :MMMMMy   dMMMm+NMMNNNNMMMMy yMMMM/    hMMMN.   "              
tput setaf 2; echo  "      -MMMM+. :s/-  NMMMy  mMMMMMM: :MMMM/ -oo-.  /NMMM+ hMMMN-  oMMMM:    "              
tput setaf 2; echo  "       oNMMMMNdho-  +MMMM.oMMMhMMMm dMMMh  +hNMMMNmNMMMs  mMMMm.:MMMM+     "              
tput setaf 2; echo  "         /oshmMMMMh  dMMMdNMMm yMMMhMMMN. dMMMmswayNMMMs  .NMMMmNMMMs      "              
tput setaf 2; echo  "      :ohNh:..oMMMM- -MMMMMMM:  NMMMMMMo .MMMM:   :NMMMs   -NMMMMMMy       "              
tput setaf 2; echo  "      -mMMMMMMMMMMs   sMMMMMy   +MMMMMd   yMMMMmdNMMMMMs    :MMMMMd        "              
tput setaf 2; echo  "         ohdmmdyo.     yyyyy.    syyyy-    :sdmmds-oyyy+     dMMMm.        "          
tput setaf 2; echo  "                                                            sMMMN-         "              
tput setaf 2; echo  "                                                           oMMMM:          "              
tput setaf 2; echo  "                                                          -dddd+           "              
tput setaf 2; echo  "                                                                           "                                                        
tput setaf 2; echo 	"      ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::        "
tput setaf 2; echo  "      ::                  ATA Tool v0.0.1.16032020                  ::        "
tput setaf 2; echo  "      ::                   adb and fastboot tool                    ::        "
tput setaf 2; echo  "      ::                      Created By Sway	                    ::        "
tput setaf 2; echo  "      ::                  Copyright 2019-2020 Sway	            ::        "
tput setaf 2; echo  "      ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::        "


tput setaf 2; echo  "================================================================================="
tput setaf 2; echo  " SYSTEM MENU "
tput setaf 2; echo  "================================================================================="
tput setaf 2; echo  " 1. Check connected devices "
tput setaf 2; echo  " 2. REBOOT SMARTPHONE "
tput setaf 2; echo  " 3. REBOOT INTO THE RECOVERY "
tput setaf 2; echo  " 4. REBOOT INTO THE Fastboot/Bootloader "
tput setaf 2; echo  " 5. Device version "
tput setaf 2; echo  " 6. Device serial number "
tput setaf 2; echo  " 7. Enable Dark Mode "
tput setaf 2; echo  " 8. Disable Dark Mode "
tput setaf 2; echo  " 9. Unistall System App/Bloat  "
tput setaf 2; echo  "================================================================================="
tput setaf 2; echo  " 0. Return to main menu"
tput setaf 2; echo  "================================================================================="


tput setaf 2; echo  "Please Select:"
read inputmenu

case $inputmenu in

   0)
    sh ATA.sh
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
    tput setaf 2; echo  "Write the app name like com.myAppPackage"
    read inputsappuni
    adb shell pm uninstall -k --user 0 $inputsappuni
    
esac
tput setaf 2; echo  "Press [Enter] key to continue..."
read 1 -p prompt
sh system.sh
