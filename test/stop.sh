#!/bin/bash

set -xe

echo "## remove stack"
docker-compose kill 
docker-compose rm -f
