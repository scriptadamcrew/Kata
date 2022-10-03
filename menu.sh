#!/bin/bash
# Color Validation
yl='\e[031;1m'
bl='\e[36;1m'
gl='\e[32;1m'
DF='\e[39m'
Bold='\e[1m'
Blink='\e[5m'
yell='\e[33m'
red='\e[31m'
green='\e[32m'
blue='\e[34m'
PURPLE='\e[35m'
CYAN='\e[36m'
Lred='\e[91m'
Lgreen='\e[92m'
Lyellow='\e[93m'
NC='\e[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
CYAN='\e[36m'
LIGHT='\033[0;37m'
red='\e[1;31m'
green='\e[0;32m'
wh="\033[0m"
clear 
echo -e ""
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
IPVPS=$(curl -s ipinfo.io/ip )
DOMAIN=$(cat /etc/v2ray/domain)
      	  cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
	  cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
	  freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
	  tram=$( free -m | awk 'NR==2 {print $2}' )
	  swap=$( free -m | awk 'NR==4 {print $2}' )
	  up=$(uptime|awk '{ $1=$2=$(NF-6)=$(NF-5)=$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; print }')
clear
echo -e "${Lred}                                                                          \e[0m"
echo -e "${Lred}███╗░░██╗░█████╗░██╗░░██╗░█████╗░████████╗░█████╗░░░███╗░░░░██╗██╗██████╗░\e[0m"
echo -e "${Lred}████╗░██║██╔══██╗██║░██╔╝██╔══██╗╚══██╔══╝██╔══██╗░████║░░░██╔╝██║╚════██╗\e[0m"
echo -e "${Lred}██╔██╗██║███████║█████═╝░███████║░░░██║░░░███████║██╔██║░░██╔╝░██║░█████╔╝\e[0m"
echo -e "${Lred}██║╚████║██╔══██║██╔═██╗░██╔══██║░░░██║░░░██╔══██║╚═╝██║░░███████║░╚═══██╗\e[0m"
echo -e "${Lred}██║░╚███║██║░░██║██║░╚██╗██║░░██║░░░██║░░░██║░░██║███████╗╚════██║██████╔╝\e[0m"
echo -e "${Lred}╚═╝░░╚══╝╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░╚═╝░░░╚═╝░░░╚═╝░░╚═╝╚══════╝░░░░░╚═╝╚═════╝░\e[0m"                                                                                                                                                              
echo -e "${ORANGE}═════════════════════════════════════════════════════${DF}"
echo -e ""
echo -e "${ORANGE}═════════════════════════════════════════════════════${DF}"
	  echo -e "   \e[93;1mCPU Model:\e[0m $cname"
	  echo -e "   \e[93;1mNumber Of Cores:\e[0m $cores"
	  echo -e "   \e[93;1mCPU Frequency:\e[0m $freq MHz"
	  echo -e "   \e[93;1mTotal Amount Of RAM:\e[0m $tram MB"
	  echo -e "   \e[93;1mSystem Uptime:\e[0m $up"
	  echo -e "   \e[93;1mIsp Name:\e[0m $ISP"
	  echo -e "   \e[93;1mCity:\e[0m $CITY"
	  echo -e "   \e[93;1mTime:\e[0m $WKT"
	  echo -e "   \e[93;1mIPVPS:\e[0m $IPVPS"
	  echo -e "   \e[93;1mDOMAIN:\e[0m $DOMAIN"
echo -e "${ORANGE}═════════════════════════════════════════════════════${DF}"
echo -e "${ORANGE}          ${red} M E N U  P R O T O C O L ${DF} "                                                                                                                                                                                                            
echo -e "${ORANGE}═════════════════════════════════════════════════════${DF}"
echo -e   "\e[1;37m* [01]\e[0m  \e[1;32m:  SSH & OpenVPN Menu\e[0m"
echo -e   "\e[1;37m* [02]\e[0m  \e[1;32m:  Panel Wireguard \e[0m"
echo -e   "\e[1;37m* [03]\e[0m  \e[1;32m:  Panel SSR Account\e[0m"
echo -e   "\e[1;37m* [04]\e[0m  \e[1;32m:  Panel SS Account\e[0m"
echo -e   "\e[1;37m* [05]\e[0m  \e[1;32m:  Panel Vmess\e[0m"
echo -e   "\e[1;37m* [06]\e[0m  \e[1;32m:  Panel VLess\e[0m"
echo -e   "\e[1;37m* [07]\e[0m  \e[1;32m:  Panel Trojan\e[0m"
echo -e "${ORANGE}═════════════════════════════════════════════════════${DF}"
echo -e "${ORANGE}            ${red} M E N U  S Y S T E M ${DF} "                                                                                                                                                                                                            
echo -e "${ORANGE}═════════════════════════════════════════════════════${DF}"
echo -e   "\e[1;37m* [08]\e[0m  \e[1;32m:  Add Subdomain Host For VPS\e[0m"
echo -e   "\e[1;37m* [09]\e[0m  \e[1;32m:  Change Port All Account\e[0m"
echo -e   "\e[1;37m* [10]\e[0m  \e[1;32m:  Reboot VPS\e[0m"
echo -e   "\e[1;37m* [11]\e[0m  \e[1;32m:  Information Display System\e[0m"
echo -e   "\e[1;37m* [12]\e[0m  \e[1;32m:  Info Script Auto Install\e[0m"
echo -e   "\e[1;37m* [13]\e[0m  \e[1;32m:  Install BBR\e[0m"
echo -e   "\e[1;37m* [14]\e[0m  \e[1;32m:  Check Usage of VPS Ram" 
echo -e "${ORANGE}═════════════════════════════════════════════════════${DF}"
echo -e ""
echo -e "${ORANGE}═════════════════════════════════════════════════════${DF}"
echo -e "\e[1;35m*  Group Telegram Saya https://t.me/gabungan_GTS \e[0m"
echo -e "\e[1;35m*  Pm Saya https://t.me/Nakata143\e[0m"
echo -e "${ORANGE}═════════════════════════════════════════════════════${DF}"
echo -e " x)   Exit"
echo -e "${ORANGE}═════════════════════════════════════════════════════${DF}"
echo -e   ""
read -p "     Select From Options [1-14 or x] :  " menu
echo -e   ""
case $menu in
1)
menu-ssh
;;
2)
menu-wg
;;
3)
menu-ssr
;;
4)
menu-ss
;;
5)
menu-vmess
;;
6)
menu-vless
;;
7)
menu-trojan
;;
8)
add-host
;;
9)
change-port
;;
10)
reboot
;;
11)
info
;;
12)
about
;;
13)
bbr
;;
14)
ram
;;
x)
exit
;;
*)
echo  "Please enter an correct number"
;;
esac
