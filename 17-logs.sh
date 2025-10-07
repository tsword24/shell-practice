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
echo "Script Started at $(date)" | tee -a $LOG_FILE

if [ $USERID -ne 0 ]; then 
    echo "Give root privilages"
    exit 1
fi

VALIDATE(){
    if [ $1 -eq 0 ];then
        echo -e "Install is $G success$N"  | tee -a $LOG_FILE
    else
        echo -e "$R Failure$N" | tee -a $LOG_FILE
    fi
}

dnf list installed mysql  &>>$LOG_FILE
if [ $? -ne 0 ];then 
    echo "Installing my sql" | tee -a $LOG_FILE
    dnf install mysql -y &>>$LOG_FILE
    VALIDATE $? "MYSQL"
else
    echo -e "Already installed ... $Y Skipping $N" | tee -a $LOG_FILE
fi

dnf list installed nginx  &>>$LOG_FILE
if [ $? -ne 0 ];then 
    echo "Installing nginx" | tee -a $LOG_FILE
    dnf install nginx -y &>>$LOG_FILE
    VALIDATE $? "nginx"
else
    echo -e "Already installed ... $Y Skipping $N" | tee -a $LOG_FILE
fi