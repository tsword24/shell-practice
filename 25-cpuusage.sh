#!/bin/bash

DISK_USAGE=$(df -hT|grep -v Filesystem)
DISK_THRESHOLD=2
IP_ADDRESS=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)
MESSAGE=""
while IFS= read -r line
do
    USAGE=$(echo $line|awk '{print $6}'|cut -d "%" -f1)
    PARTITION=$(echo $line|awk '{print $7}')
    if [ $USAGE -ge $DISK_THRESHOLD ];then
        MESSAGE+="High Disk usage alert $PARTITION:$USAGE % \n"
    fi
done <<< $DISK_USAGE

echo -e "Body of the message:$MESSAGE"