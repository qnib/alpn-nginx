FROM qnib/alpn-rsyslog

ENV NGINX_HTTPS_PORT=443 \
    NGINX_HTTP_PORT=80

RUN apk upgrade --update && \
    apk add nginx && \
    rm -rf /var/cache/apk/*

ADD etc/nginx/nginx.conf /etc/nginx/
ADD etc/consul-templates/nginx/default.conf.ctmpl /etc/consul-templates/nginx/
ADD etc/ssl/nginx/certificate.crt etc/ssl/nginx/certificate.key /etc/ssl/nginx/
ADD etc/supervisord.d/nginx.ini \
    /etc/supervisord.d/
ADD opt/qnib/nginx/bin/start.sh /opt/qnib/nginx/bin/
ADD etc/consul-templates/nginx/http.html.ctmpl \
    etc/consul-templates/nginx/https.html.ctmpl \
    /etc/consul-templates/nginx/
ONBUILD RUN echo "!!!!! Please use your own certificates :)" \
         && rm -f /etc/ssl/nginx/certificate.* 

ADD etc/consul.d/nginx.json \
    etc/consul.d/nginx-ssl.json \
    /etc/consul.d/
