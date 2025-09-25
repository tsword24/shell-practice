#!/bin/bash

USER=$(id -u)

if [ $USER -ne 0 ]; then
    echo "give root privilages"
    exit 1 #failure is other than 0
else
    echo "root privilages are given"
fi

dnf install mysql -y

if [ $? -ne 0 ]; then 
    echo "install is FAILURE"
    exit 1
else
    echo "install is success"
fi

dnf install nginx -y

if [ $? -ne 0 ]; then 
    echo "install of nginx is FAILURE"
    exit 1
else
    echo "install of nginx is success"
fi

dnf install mongodb-mongosh -y

if [ $? -ne 0 ]; then 
    echo "install is mongodb is FAILURE"
    exit 1
else
    echo "install is mongodb is success"
fi
