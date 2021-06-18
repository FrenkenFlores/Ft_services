#!/bin/sh
 wget https://raw.github.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

 chmod +x wp-cli.phar && mv wp-cli.phar /bin/wp 
 
 wp core download --path='/var/www/wordpress' --allow-root
 
 wp core install --url='http://192.168.99.100:5050' --title='fflores' --admin_user='fflores_user' --admin_password='fflores42' --admin_email='fflores@mail.ru' --skip-email --path='/var/www/wordpress' --allow-root
 
 wp user create usr1 usr1@mail.ru --role=editor --user_pass=usr1 --display_name="usr1" --nickname=usr1 --path='/var/www/wordpress' --allow-root
 
 wp user create usr2 usr2@mail.ru --role=subscriber --user_pass=usr2 --display_name="usr2" --nickname=usr2  --path='/var/www/wordpress' --allow-root
 
 wp user create usr3 usr3@mail.ru --role=subscriber --user_pass=usr3 --display_name="usr3" --nickname=usr3  --path='/var/www/wordpress' --allow-root
 
 wp theme activate twentytwenty --path='/var/www/wordpress' --allow-root
 
supervisord