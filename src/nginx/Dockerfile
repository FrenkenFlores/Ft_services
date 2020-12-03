FROM alpine

EXPOSE 80
EXPOSE 443
EXPOSE 22

RUN apk update && apk upgrade
RUN apk add openrc --no-cache
RUN apk add openssh
RUN apk add openssl
RUN apk add nginx
RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache
RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
RUN mkdir -p /run/nginx
COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /www/index.html
COPY script.js /www/script.js
RUN adduser -D user
RUN ssh-keygen -A
RUN	openssl req \
-days 365 \
-newkey rsa:4096 \
-x509 \	
-sha256 \
-nodes \
-out ./etc/ssl/certs/nginx_cert.crt \
-keyout ./etc/ssl/certs/nginx_key.key \
-subj	'/C=RU/ST=MS/L=MOSCOW/O=21-SCHOOL/OU=MIRAGE/CN=fflores'
RUN mkdir -p /etc/telegraf
COPY ./telegraf.conf /etc/telegraf/telegraf.conf
COPY start.sh ./start.sh
RUN chmod +x /start.sh
CMD sh ./start.sh

