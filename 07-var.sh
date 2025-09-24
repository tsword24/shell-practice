#!/bin/bash

START_TIME=$(date +%s)

sleep 10 &

END_TIME=$(date +%s)

TIMESTAMP=$($END_TIME-$START_TIME)

echo "timestamp ($TIMESTAMP)"