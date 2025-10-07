#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
USERID=$(id -u)

if [ $USERID -ne 0 ]; then 
    echo "Give root privilages"
else
    echo "continue"
fi

VALIDATE(){
    if [ $1 -ne 0 ];then
        echo -e "Install is $G success$N"
    else
        echo -e "$R Failure$N"
    fi
}

dnf install mysql -y
if [$? -ne 0 ];then 
    echo "Installing my sql"
    VALIDATE $? "MYSQL"
else
    echo -e "Already installed ... $Y Skipping $N"
fi

dnf install nginx -y
if [$? -ne 0 ];then 
    echo "Installing nginx"
    VALIDATE $? "nginx"
else
    echo -e "Already installed ... $Y Skipping $N"
fi
