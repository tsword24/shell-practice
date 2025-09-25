#!/bin/bash

echo "all the variables passed are: $@"
echo "all the variables passed are: $*"

echo "script name:$0"

echo "present working directory $PWD"

echo "home directory of the user:$HOME"

echo "user :$USER"

echo "PID of the script:$$"

sleep 50 & #this to execute for getting pid of this commnand

echo "PID of the last executed command: $!"