#!/bin/bash

#set -e  
echo -e "hello"

# err_or(){
#     echo "this is an error line"
# }

trap 'echo "this is an error line $LINENO,Command is $BASH_COMMAND"' ERR

echo -e "before the error"
piuqwhsdkjhlhnbxkvjskhdfkjh #here shell understands there is an error the signal is ERR
echo -e "after the error hello"