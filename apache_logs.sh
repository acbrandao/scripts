#!/bin/bash

#Parse the APACHE LOGS files and
DEFAULT_LOG="/var/log/apache2/access.log"

#assing default log path if non is provided
LOG=${1:-$DEFAULT_LOG}    

echo "Reading Apache LOG file : [ $LOG  ]"

echo  "Hits by source IP:"
echo "======================================================================"
 
awk '{print $2}' $LOG | grep -ivE "(127.0.0.1|192.168.100.)" | sort | uniq -c | sort -   rn | head -25
 
 
echo "The 25 most popular pages:"
echo "======================================================================"
 
awk '{print $6}' $LOG | grep -ivE '(mod_status|favico|crossdomain|alive.txt)' | grep  -ivE '(.gif|.jpg|.png)' | sed 's/\/$//g' | sort | uniq -c | sort -rn | head -25
 
echo
 
echo "The 25 most popular pages (no js or css):"
echo "======================================================================"
 
awk '{print $6}' $LOG | grep -ivE '(mod_status|favico|crossdomain|alive.txt)' | grep -ivE '(.gif|.jpg|.png|.js|.css)' | sed 's/\/$//g' | sort | uniq -c | sort -rn | head -25
 
 
echo "The 25 most common referrer URLs:"
echo "======================================================================"
 
awk '{print $11}' $LOG | \
grep -vE "(^"-"$|/www.$host|/$host)" | \
sort | uniq -c | sort -rn | head -25
 
 
 
echo "Longest running requests"
echo "======================================================================"
 
awk  '{print $10,$6}' $LOG | grep -ivE '(.gif|.jpg|.png|.css|.js)'  | awk '{secs=0.000001*$1;req=$2;printf("%.2f minutes req time for %s\n", secs / 60,req )}' | sort -rn | head -50
 
exit 0
