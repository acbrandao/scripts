#!/bin/sh
# show open ports on [servername] [starting-ending ports]
# show open ports  for this servername

SERVERNAME=localhost

echo "Scanning for open ports  1-2014 on $SERVERNAME"
nc -z $SERVERNAME 1-1024
