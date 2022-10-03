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
echo -e "\e[94m  |                      MENU SSR                      |    "
echo -e "\e[94m  '----------------------------------------------------'    "
echo -e "\e[0m                                                             "
echo -e ""
echo -e "\e[1;37m* [1]\e[0m \e[1;36m: Create SSR Account\e[0m"
echo -e "\e[1;37m* [2]\e[0m \e[1;36m: Deleting SSR Account\e[0m"
echo -e "\e[1;37m* [3]\e[0m \e[1;36m: Extending SSR Account Active Life\e[0m"
echo -e "\e[1;37m* [4]\e[0m \e[1;36m: Show Other SSR Menu\e[0m"
echo -e ""
read -p "        Select From Options [1-4 or x]: " menussr
echo -e ""
case $menussr in
1)
add-ssr
;;
2)
del-ssr
;;
3)
renew-ssr
;;
4)
ssr
;;
x)
menu
;;
*)
echo " Please enter an correct number!!"
;;
esac
