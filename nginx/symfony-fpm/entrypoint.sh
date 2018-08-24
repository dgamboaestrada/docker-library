#!/bin/bash

if [ -z $ROOT ]; then
    ROOT='/var/www/html'
fi

if [ -z $UPSTREAM ]; then
    UPSTREAM='php'
fi

echo $(envsubst '${UPSTREAM}' < /etc/nginx/conf.d/default.conf) > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'
cat /etc/nginx/conf.d/default.conf

exec "$@"
