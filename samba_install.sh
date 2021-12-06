#!/bin/bash

LINUX_SHARE_FOLDER=/tmp/LinuxShare
SHARE_NAME=LinuxShare
echo "Samba/Cifs Linux share setup (Debian based)"

apt update
apt-get install samba -y

echo "Creating  Linux share here: $LINUX_SHARE_FOLDER"
mkdir $LINUX_SHARE_FOLDER

echo  "Just a sample file. If you are reading this then you can access this share" > $LINUX_SHARE_FOLDER/linux_file_shares.txt


echo "Modifying /etc/samba/smb.conf ..."

echo "[$SHARE_NAME]" >> /etc/samba/smb.conf
echo "comment = Linux shared folder " >> /etc/samba/smb.conf
echo "read only = no " >> /etc/samba/smb.conf
echo "path = $LINUX_SHARE_FOLDER " >> /etc/samba/smb.conf
echo "guest ok = yes " >> /etc/samba/smb.conf



echo "Resarting Samba/Cifs Shares"
service samba restart

echo "Samba Status"
smbstatus

echo "Now Sharing folder on this computer: $SHARE_NAME as  \\\\$(hostname -a)\\\\$SHARE_NAME "
echo "To access Windows access by going to:  \\\\$(hostname -a)\\\\$SHARE_NAME "
