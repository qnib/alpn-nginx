#!/bin/bash

## Create dummy websites
consul-template -consul localhost:8500 -once -template "/etc/consul-templates/nginx/http.html.ctmpl:/usr/share/nginx/html/index.html"
consul-template -consul localhost:8500 -once -template "/etc/consul-templates/nginx/https.html.ctmpl:/usr/share/nginx/htmls/index.html"

/usr/sbin/nginx

