#!/bin/bash

curl -sf localhost:80 > /dev/null
if [ $? -ne 0 ];then
    curl -sI localhost:80
    exit 1
else
    curl -sI localhost:80
    exit 0
fi

