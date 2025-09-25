#!/bin/bash

echo "enter the number"
read NUM
if[ $(($NUM%2)) -eq 0 ];then
    echo "the number is even"
else
    echo "num is odd"
fi