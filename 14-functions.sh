#!/bin/bash

USERIS=$(id -u)

if [ $USERIS -ne 0 ];then
    echo "give root privilages"
else
    echo "continue"
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo "installation of $2 is unsuccessful"
    else
        echo "installation of $2 is successful"
    fi
}

dnf install mysql -y
VALIDATE $? "Mysql"

dnf install nginx -y
VALIDATE $? "Nginx"
