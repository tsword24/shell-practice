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
else
    echo "install is success"
fi
