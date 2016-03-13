FROM qnib/alpn-syslog

RUN apk upgrade --update && \
    apk add nginx && \
    rm -rf /var/cache/apk/*

ADD etc/nginx/nginx.conf /etc/nginx/
ADD etc/nginx/conf.d/default.conf /etc/nginx/conf.d/
ADD etc/ssl/nginx/certificate.crt etc/ssl/nginx/certificate.key /etc/ssl/nginx/
ADD etc/supervisord.d/nginx.ini \
    /etc/supervisord.d/
ADD opt/qnib/nginx/bin/start.sh /opt/qnib/nginx/bin/

ONBUILD RUN echo "!!!!! Please use your own certificates :)" && \
            rm -f /etc/ssl/nginx/certificate.* && \
            echo "!!!!! ...and your own nginx-config" && \
            mv /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.example

ADD etc/consul.d/nginx.json /etc/consul.d/
