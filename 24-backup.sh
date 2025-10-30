#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
USERID=$(id -u)

SOURCE_DIR=$1
DESTINATION_DIR=$2
DAYS=${3:-14}
LOGS_FOLDER="/var/log/shell-practice"
SCRIPT_NAME="$( echo $0 | cut -d "." -f1)" #to get the script name
#LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
LOG_FILE="$LOGS_FOLDER/backup.log" #script is being modified to be run as command


mkdir -p $LOGS_FOLDER
echo "Script Started at $(date)" | tee -a $LOG_FILE

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run this script with root privelege"
    exit 1 # failure is other than 0
fi

USAGE(){
    echo -e "$R USAGE:: sudo sh 24-backup.sh <SOURCE_DIR> <DEST_DIR> <DAYS>[optional, default 14 days] $N"
    exit 1
}



if [ $# -lt 2 ];then 
    echo -e "The arguments are not passed"
    exit 1          
fi

if [ ! -d $DESTINATION_DIR ];then   
    echo "the destination directory does not exist"
    exit 1
fi

if [ ! -d $SOURCE_DIR ];then   
    echo "the destination directory does not exist"
    exit 1
fi


FILES=$(find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS)

if [ ! -z "${FILES}" ];then
    echo "Files found: $FILES"
    TIMESTAMP=$(date +%F-%H-%M)
    ZIP_FILE_NAME="$DESTINATION_DIR/app-logs-$TIMESTAMP.zip"
    echo "Zip file name: $ZIP_FILE_NAME"
    find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS | zip -@ -j "$ZIP_FILE_NAME"

    if [ -f $ZIP_FILE_NAME ];
    then
     echo "Archival success"

     while IFS= read -r file;
     do
        echo "removing the file $file"
        rm -rf $file
     done <<< $FILES
    else
    echo "archival failure"
    fi
else
    echo "no files to archive"
fi