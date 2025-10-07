#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
USERID=$(id -u)

LOGS_FOLDER="/var/log/shell-practice"
SCRIPT_NAME="$( echo $0 | cut -d "." -f1)"
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
echo "Script Started at $(date)" 

if [ $USERID -ne 0 ]; then 
    echo "Give root privilages"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ];then
        echo -e "Install is $G success$N" 
    else
        echo -e "$R Failure$N"
    fi
}

dnf list install mysql  &>>$LOG_FILE
if [ $? -ne 0 ];then 
    echo "Installing my sql"
    dnf install mysql -y
    VALIDATE $? "MYSQL"
else
    echo -e "Already installed ... $Y Skipping $N"
fi

dnf list install nginx  &>>$LOG_FILE
if [ $? -ne 0 ];then 
    echo "Installing nginx"
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo -e "Already installed ... $Y Skipping $N"
fi