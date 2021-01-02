#!/bin/sh
#Retrieve external IP
IP=$(cat /ip.txt)
#Replace IP
sed -i "s/user = nobody/user = nginx/g" /etc/php7/php-fpm.d/www.conf
sed -i "s/group = nobody/group = nginx/g" /etc/php7/php-fpm.d/www.conf
sed -i "s/;listen.owner = nobody/listen.owner = nginx/g" /etc/php7/php-fpm.d/www.conf
sed -i "s/;listen.group = nginx/listen.group = nginx/g" /etc/php7/php-fpm.d/www.conf
sed -i "s/localhost/$IP/g" /www/wordpress/wp-config.php
chown -R nginx:nginx 0700 /var/lib/nginx/
#Launch
#php --server 0.0.0.0:5050 --docroot /www/wordpress/
#php -S 0.0.0.0:5050 -t /www/wordpress/
php-fpm7
nginx -g 'daemon off;'
