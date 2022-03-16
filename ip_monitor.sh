#!/bin/bash

IPFILE="wan_ip.txt"
LAST_IP="-.-.-.-"

# Retrieve the current WAN IP
echo "Checking WAN IP..."
WAN_IP=$(wget -q -O - checkip.dyndns.com | grep -Po "[\d\.]+")

echo "Current WAN IP  is: $WAN_IP"


if [[ -f "$IPFILE" ]]
then

LAST_IP=$(cat "$IPFILE")

echo "Previous WAN IP was: $LAST_IP"

if [ "$LAST_IP" != "$WAN_IP" ]; then
    echo "WAN IP Address has CHANGE to $WAN_IP since last checked."

#now lets send an email usingan SMTP Service
 
else
    echo "WAN IP Still the same as $WAN_IP."
fi

else
   echo "WAN IP first run  is : $WAN_IP"

fi

#Now lets write this to the file
echo "Updating WAN_IP file to: $WAN_IP"
cat <<EOM >  $IPFILE
$WAN_IP
EOM


# finally assocate this with a crontab entry to run periodically.
# such as this example runs hourly to check for changes
# 0 * * * *   /<path_to/ip_monitor.sh

