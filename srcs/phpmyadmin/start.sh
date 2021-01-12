#!/bin/sh
#Launch
sed -i "s/user = nobody/user = nginx/g" /etc/php7/php-fpm.d/www.conf
sed -i "s/group = nobody/group = nginx/g" /etc/php7/php-fpm.d/www.conf
sed -i "s/;listen.owner = nobody/listen.owner = nginx/g" /etc/php7/php-fpm.d/www.conf
sed -i "s/;listen.group = nginx/listen.group = nginx/g" /etc/php7/php-fpm.d/www.conf
chown -R nginx:nginx 0700 /var/lib/nginx/
php-fpm7
telegraf --config telegraf.conf &
nginx -g 'daemon off;'
