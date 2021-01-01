#!/bin/sh
#Retrieve external IP
IP=$(cat /ip.txt)
#Replace IP
sed -i "s/localhost/$IP/g" /www/wordpress/wp-config.php
#Launch
#php --server 0.0.0.0:5050 --docroot /www/wordpress/
php -S 0.0.0.0:5050 -t /www/wordpress/