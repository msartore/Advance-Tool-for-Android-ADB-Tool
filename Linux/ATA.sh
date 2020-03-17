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
tput setaf 2; echo  " SYSTEM MENU "
tput setaf 2; echo  "================================================================================="
tput setaf 2; echo  " 1. System Commands "
tput setaf 2; echo  " 2. Recovery Commands (Sideload) "
tput setaf 2; echo  " 3. Fastboot/Bootloader Commands "
tput setaf 2; echo  " 4. Stream your SMARTPHONE "
tput setaf 2; echo  "================================================================================="
tput setaf 2; echo  " EXIT Press CTRL + C at the same time"
tput setaf 2; echo  "================================================================================="

tput setaf 2; echo  "Please Select:"
read inputmenu

case $inputmenu in

   1)
    sh system.sh
    ;;
   2)
    sh recovery.sh
    ;;
   3)
    sh fastboot.sh
    ;;
   4)
    scrcpy
    ;;
    
esac
tput setaf 2; echo  "Press [Enter] key to continue..."
read 1 -p prompt
sh ATA.sh
