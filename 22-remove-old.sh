#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
USERID=$(id -u)

LOGS_FOLDER="/var/log/shell-practice"
SCRIPT_NAME="$( echo $0 | cut -d "." -f1)" #to get the script name
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
echo "Script Started at $(date)" | tee -a $LOG_FILE

mkdir -p /home/ec2-user/app-logs
SOURCE_DIR=/home/ec2-user/app-logs
if [ ! -d $SOURCE_DIR ]; then 
    echo -e "ERR: root privilages"
    exit 1
fi

FILES_TO_DELETE=$(find $SOURCE_DIR -name "*.log" -type f -mtime +14 )

while IFS= read -r filepath
do
    echo "file path is $filepath"
done <<<$FILES_TO_DELETE