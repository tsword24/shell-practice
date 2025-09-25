#!/bin/bash
#everything assigned variables in shell 
NUM=200
NUM2=100
NUM3=Devops
SUM=$(($NUM1+$NUM2+$NUM3))

echo "the sum is ${SUM}"

LEADERS=("putin" "modi" "trump" "biden")

echo "All the leaders ${LEADERS[@]}"

echo "first leader ${LEADERS[0]}"

echo "LEADER IS ${LEADER[10]}"S