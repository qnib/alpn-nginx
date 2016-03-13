#!/bin/bash

set -ex

mkdir -p etc/ssl/nginx/

## https://msol.io/blog/tech/create-a-self-signed-ssl-certificate-with-openssl/
openssl genrsa -out etc/ssl/nginx/certificate.key 2048
openssl req -new -key etc/ssl/nginx/certificate.key -out etc/ssl/nginx/certificate.csr -subj "/C=DE/ST=Berlin/L=Berlin/OU=QNIB Solutions"
openssl req -x509 -days 365 -key etc/ssl/nginx/certificate.key -in etc/ssl/nginx/certificate.csr -out etc/ssl/nginx/certificate.crt

## somehow I would like to use this: http://www.akadia.com/services/ssh_test_certificate.html
# Turns out it does not work for me... :(
# Step 1: Generate a Private Key
#openssl genrsa -des3 -out etc/ssl/nginx/certificate.key -passout file:passphrase.txt
# Step 2: Generate a CSR (Certificate Signing Request)
#openssl req -new -key etc/ssl/nginx/certificate.key -passin file:passphrase.txt -out etc/ssl/nginx/certificate.csr -subj "/C=DE/ST=Berlin/L=Berlin/OU=QNIB Solutions"
# Step 3: Remove Passphrase from Key
#cp etc/ssl/nginx/certificate.key etc/ssl/nginx/certificate.key.org
#openssl rsa -in etc/ssl/nginx/certificate.key.org -passin file:passphrase.txt -out etc/ssl/nginx/certificate.key
# Step 4: Generating a Self-Signed Certificate
#openssl x509 -req -days 365 -in etc/ssl/nginx/certificate.csr -signkey etc/ssl/nginx/certificate.key -out etc/ssl/nginx/certificate.crt


