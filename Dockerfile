FROM qnib/alpn-syslog

RUN apk update && \
    apk add nginx && \
    rm -rf /var/cache/apk/*
