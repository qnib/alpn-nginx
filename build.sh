#!/bin/bash

NAME=${1}
if [ -z $NAME ];then
    NAME=qnib/alpn-nginx
fi

docker build \
    --build-arg vcs_type=git \
    --build-arg vcs_url=`git config --get remote.origin.url` \
    --build-arg vcs_branch=`git rev-parse --abbrev-ref HEAD` \
    --build-arg vcs_ref=`git rev-parse HEAD` \
    --build-arg build_date=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
    -t $NAME .

