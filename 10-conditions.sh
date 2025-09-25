#!/bin/bash
echo "enter the number"
read NUM
if [ $NUM -lt 10 ];then
    echo "num is less then 10"
else 
    echo "num is greater than 10"
fi

if [ $NUM -lt 10];then
    echo "num is less than 10"
elif [$NUM -eq 10 ];then
    echo "num is equal to 10"
else
    echo "num is greater than 20"
fi