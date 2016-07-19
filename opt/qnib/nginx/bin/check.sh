#!/bin/bash

if [ ! -z ${WAIT_FOR_FILE} ] && [ ! -f ${WAIT_FOR_FILE} ];then
   echo "File ${WAIT_FOR_FILE} is not present"
   exit 1
fi

curl -sf localhost:80 > /dev/null
if [ $? -ne 0 ];then
    curl -sI localhost:80
    exit 1
else
    curl -sI localhost:80
    exit 0
fi

