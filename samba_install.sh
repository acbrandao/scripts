#!/bin/bash

# Define Ansi color code variables
red="\e[0;91m"
yellow="\e[1;33m "
green="\e[0;92m"
bold="\e[1m"
clr="\e[0m"  #clear back to default

LINUX_SHARE_FOLDER=/tmp/LinuxShare
SHARE_NAME=LinuxShare
echo "==--> Samba/Cifs Linux share setup (Debian based)"

echo -e "${green}Installing...${clr}Samba/Cifs Linux share setup (Debian based)"
apt update
apt-get install samba -y

echo -e "Creating  Linux share here: echo -e ${green}$LINUX_SHARE_FOLDER ${clr} "
mkdir $LINUX_SHARE_FOLDER

echo  "SAMBA TEST: \n Just a sample file. If you are reading this then you can access this share. Can be removed" > $LINUX_SHARE_FOLDER/linux_file_shares.txt
echo -e "Modifying ${bold}/etc/samba/smb.conf ${clr} ..."

echo "[$SHARE_NAME]" >> /etc/samba/smb.conf
echo "comment = Linux shared folder " >> /etc/samba/smb.conf
echo "read only = no " >> /etc/samba/smb.conf
echo "path = $LINUX_SHARE_FOLDER " >> /etc/samba/smb.conf
echo "guest ok = yes " >> /etc/samba/smb.conf

echo "Resarting Samba/Cifs Shares"
service smbd  restart

echo "Samba Status"
systemctl status smbd
smbstatus

echo -e "Now Sharing folder on this computer: $SHARE_NAME as  $(hostname -a) $SHARE_NAME "
echo -e "To access Windows access by going to: ${yellow} \\\\$(hostname -a)\\\\$SHARE_NAME ${clr}"
echo -e "To check this host for shares and connetcions use ${yellow}smbstatus${clr}"
