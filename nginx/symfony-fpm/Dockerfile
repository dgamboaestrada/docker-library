FROM nginx:latest
COPY ./nginx.conf /etc/nginx/conf.d/default.conf

COPY entrypoint.sh /usr/local/bin/
ENTRYPOINT [ "entrypoint.sh" ]
