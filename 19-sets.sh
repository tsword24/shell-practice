#!/bin/bash

#set -e  
echo -e "hello"

trap 'err_or' ERR

echo -e "before the error"
piuqwhsdkjhlhnbxkvjskhdfkjh #here shell understands there is an error the signal is ERR
echo -e "after the error hello"