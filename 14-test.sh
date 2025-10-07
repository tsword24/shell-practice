#!/bin/bash

USER=$(id -u)

if [ $USER -ne 0 ]; then
    echo "give the user root privilages"
else
    echo "continue"

dnf install mysql -y

if [ $? -ne 0 ]; then   
    echo "install is failure"
else
    echo "install is success"

dnf install nginx -y

if [ $? -ne 0 ]; then   
    echo "install is failure"
else
    echo "install is success"
    
dnf install mongodb-mongosh -y

if [ $? -ne 0 ]; then   
    echo "install is failure"
else
    echo "install is success"