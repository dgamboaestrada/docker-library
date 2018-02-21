#!/bin/bash
echo $(envsubst '${ROOT},${UPSTREAM}' < /etc/nginx/conf.d/default.conf) > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'
exec "$@"
