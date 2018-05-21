FROM nginx:1.14.0-alpine

LABEL maintainer "Shoma Nishitateno <shoma416@gmail.com>"

RUN set -ex \
    && addgroup -S www -g 1000 \
    && adduser -D -S -h /var/cache/nginx -s /sbin/nologin -G www www -u 1000 \
    && sed -i "s/^user.*/user www;/" /etc/nginx/nginx.conf