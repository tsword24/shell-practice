#!/bin/bash

USER=$(id -u)

if [ $USER -ne 0 ]; then
    echo "give the user root privilages"
    exit 1
else
    echo "continue"
fi

dnf install mysql -y

if [ $? -ne 0 ]; then   
    echo "install is failure"
    exit 1
else
    echo "install is success"
fi
dnf install nginx -y

if [ $? -ne 0 ]; then   
    echo "install is failure"
    exit 1
else
    echo "install is success"
fi

dnf install mongodb-mongosh -y

if [ $? -ne 0 ]; then   
    echo "install is failure"
    exit 1
else
    echo "install is success"
fi