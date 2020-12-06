#!/bin/sh
#Installing
apk update
apk add openrc --no-cache
apk add openssh
apk add openssl
apk add nginx
mkdir -p /run/nginx
apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache
#Creating new user and group 'www' for Nginx
adduser -D -g 'www' www
#Create a directory for HTML files
chown -R www:www /var/lib/nginx
chown -R www:www /www
#Creating new SSH user
adduser -D user
echo "user:password"|chpasswd
ssh-keygen -A
#SSL
mkdir /etc/nginx/ssl
openssl req -days 365 -newkey rsa:4096 \
-x509 -sha256 -nodes \
-out	/etc/nginx/ssl/nginx.crt \
-keyout	/etc/nginx/ssl/nginx.key \
-subj	'/C=RU/ST=MS/L=MOSCOW/O=21-SCHOOL/OU=MIRAGE/CN=fflores'
#Starting apps
/usr/sbin/sshd
telegraf &
nginx -g 'daemon off;'
