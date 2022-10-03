#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
CYAN='\e[36m'
LIGHT='\033[0;37m'
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
clear
echo -e "\e[94m  ══════════════════════════════════════════════════════"
echo -e "\e[94m          Script Vps For Debian N Ubuntu    "
echo -e "\e[94m                   Nakata143                "
echo -e "\e[94m  .----------------------------------------------------.    "
echo -e "\e[94m  |                   MENU WIREGUARD                   |    "
echo -e "\e[94m  '----------------------------------------------------'    "
echo -e "\e[0m                                                             "
echo -e "\e[1;37m* [1]\e[0m \e[1;36m: Create Wireguard Account\e[0m"
echo -e "\e[1;37m* [2]\e[0m \e[1;36m: Delete Wireguard Account\e[0m"
echo -e "\e[1;37m* [3]\e[0m \e[1;36m: Check User Login Wireguard\e[0m"
echo -e "\e[1;37m* [4]\e[0m \e[1;36m: Renew Wireguard Account\e[0m"
echo -e ""
read -p "     Please Input Number  [1-4 or x] :  "  wgr
echo -e ""
case $wgr in
1)
add-wg
;;
2)
del-wg
;;
3)
cek-wg
;;
4)
renew-wg
;;
*)
clear
menu
;;
esac

