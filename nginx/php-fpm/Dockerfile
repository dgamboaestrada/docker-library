FROM nginx:latest
COPY entrypoint.sh /entrypoint.sh
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
ENTRYPOINT ["sh", "/entrypoint.sh"]
