#!/bin/sh
#Retrieve external IP
IP=$(cat /ip.txt)
#Replace IP
sed -i "s/localhost/$IP/g" /www/wordpress/wp-config.php
#Launch
php -S 0.0.0.0:5050 -t /www/