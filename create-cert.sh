#!/bin/bash

set -ex

mkdir -p etc/ssl/nginx/
openssl req -config openssl.conf -new -x509 -days 365 \
            -keyout etc/ssl/nginx/certificate.pem \
            -out etc/ssl/nginx/certificate.pem \
            -subj "/C=DE/ST=Berlin/L=Berlin/OU=QNIB Solutions"
openssl x509 -in etc/ssl/nginx/certificate.pem -out etc/ssl/nginx/certificate.crt
