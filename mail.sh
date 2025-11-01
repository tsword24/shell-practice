#!/bin/bash

TO_ADDRESS=$1
SUBJECT=$2
ALERT_TYPE=$3
MESSAGE=$4
IP_ADDRESS=$5
TO_TEAM=$6

FINAL_BODY=$(sed -e "s/ALERT_TYPE/$ALERT_TYPE/g" -e "s/MESSAGE/$MESSAGE/g" -e "s/IP_ADDRESS/$IP_ADDRESS/g" -e "s/TO_TEAM/$TO_TEAM/g" template.html)

{
echo "To: $TO_ADDRESSS"
echo "Subject: $SUBJECT"
echo "Content-Type: text/html"
echo ""
echo "$FINAL_BODY"
} | msmtp "$TO_ADDRESS"