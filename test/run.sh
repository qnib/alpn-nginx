#!/bin/bash

set -e

export TEST_CONTAINER=$(echo nginx_test_$(date +%s))

echo "## start stack"
docker-compose up -d

echo "#### Check HTTP connection"
echo ">> docker exec -t test curl -I  http://nginx.node.consul"
docker exec -t ${TEST_CONTAINER} curl -I -k http://nginx.node.consul
echo "#### Check HTTPS connection"
echo ">> docker exec -t test curl -Ivk https://nginx.node.consul"
docker exec -t ${TEST_CONTAINER} curl -Ivk https://nginx.node.consul

echo "## remove stack"
docker-compose kill 
docker-compose rm -f
