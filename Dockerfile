FROM nginx:1.13.1-alpine

MAINTAINER Shoma Nishitateno <shoma416@gmail.com>

RUN set -ex \
    && apk update \
    && apk add --no-cache \
        dumb-init \
    && addgroup -S www -g 1000 \
    && adduser -D -S -h /var/cache/nginx -s /sbin/nologin -G www www -u 1000 \
    && sed -i "s/^user.*/user www;/" /etc/nginx/nginx.conf

CMD ["dumb-init", "nginx", "-g", "daemon off;"]