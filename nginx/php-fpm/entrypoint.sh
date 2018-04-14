#!/bin/bash

if [ -z $ROOT ]; then
    ROOT='/var/www/html'
fi
echo "Root value: $ROOT"

if [ -z $UPSTREAM ]; then
    UPSTREAM='php'
fi
echo "Upstream value: $UPSTREAM"

echo $(envsubst '${ROOT},${UPSTREAM}' < /etc/nginx/conf.d/default.conf) > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'
exec "$@"
