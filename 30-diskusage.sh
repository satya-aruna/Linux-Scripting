#!/bin/bash

# color codes in Linux, can be enabled with echo -e option
R='\e[31m'
G='\e[32m'
Y='\e[33m'
B='\e[34m'
N='\e[0m'
MESSAGE=""
IP_ADDRESS=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)

log() {
    echo -e "$(date "+%Y-%m-%d %H:%M:%S") | $1" | tee -a $LOGS_FILE
}

DISK_USAGE=$(df -hT | grep -v Filesystem)
USAGE_THRESHOLD=3

while IFS= read -r line
do 
    USAGE=$(echo $line | awk '{print $6}'|cut -d "%"  -f1)
    PARTITION=$(echo $line | awk '{print $NF}')
    if [ $USAGE -ge $USAGE_THRESHOLD ]; then
        MESSAGE+="High disk usage on $PARTITION: $USAGE% \n"
    fi
done <<< $DISK_USAGE

echo -e "$MESSAGE"

sh mail.sh "satya.aruna@gmail.com" "High Disk usage on $IP_ADDRESS" "$MESSAGE" "HIGH_DISK_USAGE" "$IP_ADDRESS" "DevOps Team"
