#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.me/ip);
IZIN=$( curl http://147.139.194.54:81/aksesvpstoken | grep $MYIP )
if [ $MYIP = $IZIN ]; then
echo -e "${green}Permission Accepted...${NC}"
else
echo -e "${red}Permission Denied!${NC}";
echo "Please Contact Admin"
echo "Telegram t.me/RPJ258"
echo "WhatsApp wa.me/6285601438824"
rm -f setup.sh
exit 0
fi
versi=$(cat /home/ver)
if [[ $versi == 1.2 ]]; then
echo "You Have The Latest Version"
exit 0
fi
echo "Start Update"
cd /usr/bin
wget -O menu "http://147.139.194.54:81/sc/menu.sh"
wget -O usernew "http://147.139.194.54:81/sc/usernew.sh"
wget -O trial "http://147.139.194.54:81/sc/trial.sh"
wget -O change-port "http://147.139.194.54:81/sc/change.sh"
wget -O port-ovpn "http://147.139.194.54:81/sc/port-ovpn.sh"
wget -O port-ssl "http://147.139.194.54:81/sc/port-ssl.sh"
wget -O port-wg "http://147.139.194.54:81/sc/port-wg.sh"
wget -O port-tr "http://147.139.194.54:81/sc/port-tr.sh"
wget -O port-sstp "http://147.139.194.54:81/sc/port-sstp.sh"
wget -O port-squid "http://147.139.194.54:81/sc/port-squid.sh"
wget -O port-ws "http://147.139.194.54:81/sc/port-ws.sh"
wget -O port-vless "http://147.139.194.54:81/sc/port-vless.sh"
wget -O wbmn "http://147.139.194.54:81/sc/webmin.sh"
wget -O xp "http://147.139.194.54:81/sc/xp.sh"
wget -O limit-speed "http://147.139.194.54:81/sc/limit-speed.sh"
wget -O add-sstp "http://147.139.194.54:81/sc/add-sstp.sh"
wget -O add-ws "http://147.139.194.54:81/sc/add-ws.sh"
wget -O add-vless "http://147.139.194.54:81/sc/add-vless.sh"
wget -O add-tr "http://147.139.194.54:81/sc/add-tr.sh"
chmod +x change-port
chmod +x port-ovpn
chmod +x port-ssl
chmod +x port-wg
chmod +x port-sstp
chmod +x port-tr
chmod +x port-squid
chmod +x port-ws
chmod +x port-vless
chmod +x wbmn
chmod +x xp
chmod +x limit-speed
echo "0 5 * * * root clear-log && reboot" > /etc/crontab
echo "0 0 * * * root xp" > /etc/crontab
cd
echo "1.2" > /home/ver
clear
echo " Fix minor Bugs"
echo " Now You Can Change Port Of Some Services"
echo " Reboot 5 Sec"
sleep 5
rm -f update.sh
reboot
