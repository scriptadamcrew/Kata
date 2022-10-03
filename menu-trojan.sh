#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
LIGHT='\033[0;37m'
NC='\e[0m'
CYAN='\e[36m'
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
clear
echo -e "\e[94m  ══════════════════════════════════════════════════════"
echo -e "\e[94m          Script Vps For Debian N Ubuntu    "
echo -e "\e[94m                   Nakata143                "
echo -e "\e[94m  .----------------------------------------------------.    "
echo -e "\e[94m  |                      MENU TROJAN                   |    "
echo -e "\e[94m  '----------------------------------------------------'    "
echo -e "\e[0m                                                             "
echo -e "\e[1;37m* [1]\e[0m \e[1;36m: Create Trojan Accoun\e[0m"
echo -e "\e[1;37m* [2]\e[0m \e[1;36m: Deleting Trojan Account\e[0m"
echo -e "\e[1;37m* [3]\e[0m \e[1;36m: Renew Trojan Account\e[0m"
echo -e "\e[1;37m* [4]\e[0m \e[1;36m: Check User Login Trojan\e[0m"
echo -e ""
read -p "     Please Input Number  [1-4 or x] :  "  trojan
echo -e ""
case $trojan in
1)
add-tr
;;
2)
del-tr
;;
3)
renew-tr
;;
4)
cek-tr
;;
x)
menu
;;
*)
clear
menu
;;
esac

