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
tput setaf 2; echo  "      ::                  ATA Tool v0.0.1.17032020                  ::        "
tput setaf 2; echo  "      ::                   adb and fastboot tool                    ::        "
tput setaf 2; echo  "      ::                      Created By Sway	                    ::        "
tput setaf 2; echo  "      ::                  Copyright 2019-2020 Sway	            ::        "
tput setaf 2; echo  "      ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::        "


tput setaf 2; echo  "================================================================================="
tput setaf 2; echo  " FASTBOOT MENU "
tput setaf 2; echo  "================================================================================="
tput setaf 2; echo  " 1. FLASH RECOVERY (only .img file) "
tput setaf 2; echo  " 2. FLASH KERNEL (only .img file) "
tput setaf 2; echo  " 3. FLASH ROM (You must know what you are doing) "
tput setaf 2; echo  " 4. Check connected devices "
tput setaf 2; echo  " 5. Boot into ROM "
tput setaf 2; echo  " 6. Boot into recovery "
tput setaf 2; echo  " 7. Hard Reset "
tput setaf 2; echo  " 8. FORMAT DATA PARTITION (EXT4) "
tput setaf 2; echo  " 9. FORMAT DATA PARTITION (F2FS) "
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
    tput setaf 2; echo  " Write recovery name like (recoveryname.img) "
    read inputfr
    fastboot flash recovery $inputfr
    ;;
   2)
    tput setaf 2; echo  " Write kernel name like (kernelname.img) "
    read inputfk
    fastboot flash boot $inputfk
    ;;
   3)
    tput setaf 2; echo  " Write rom path like (/path/to/your/Rom.zip) "
    read inputfrom
    fastboot -w
    fastboot update $inputfrom
    ;;
   4)
    fastboot devices
    ;;
   5)
    tput setaf 2; echo  " Booting into rom "
    fastboot reboot 
    ;;
   6)
    tput setaf 2; echo  " Booting into recovery "
    fastboot reboot recovery
    ;;
   7)
    tput setaf 2; echo  " Erasing process started "
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
tput setaf 2; echo  "Press [Enter] key to continue..."
read 1 -p prompt
sh ATA.sh
