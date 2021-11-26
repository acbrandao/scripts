
# Ansi color code variables
purple="\e[0;35m"
red="\e[0;91m"
cyan="\e[0;36m"
yellowb="\e[1;33m "
yellow="\e[0;33m"
expand_bg="\e[K"
blue_bg="\e[0;104m${expand_bg}"
red_bg="\e[0;101m${expand_bg}"
green_bg="\e[0;102m${expand_bg}"
green="\e[0;92m"
greenb="\e[1;92m"
white="\e[0;97m"
whiteb="\e[1;37m"
bold="\e[1m"
uline="\e[4m"
rst="\e[0m"  #reset/default

mem_free=`free -m | awk 'NR==2{printf "%s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2 }' `
diskinfo=`df -h | awk '$NF=="/"{printf "%d/%dGB (%s)\n", $3,$2,$5}' `
cpu_load=`top -bn1 | grep load | awk '{printf "CPU Load: %.2f\n", $(NF-2)}' `

now=$(date)

echo -e "----| System Information  -------------------------------------------"
echo -e "User       : ${yellowb} $(whoami)${rst}  System Time: $now"
echo -e "System load: ${greenb} $cpu_load  ${rst} Disk: ${greenb}$diskinfo ${rst} Memory :${yellowb} $mem_free  ${rst}"
echo -e "Hardware   : ${greenb} $(grep -m 1 'model name' /proc/cpuinfo | cut -c 13-)${rst} CPUs: ${yellowb}$(grep -c 'model name' /proc/cpuinfo) ${rst} OS: ${whiteb}$(lsb_release -d | cut -c 13-) ${rst} "
echo -e "IP  LAN    : ${whiteb} $(hostname -I) ${rst}  Hostname   : ${whiteb}$(hostname)${rst} "
echo -e "----| Running Services -------------------------------------------"
service --status-all | grep +
