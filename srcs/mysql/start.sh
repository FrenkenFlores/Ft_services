#!bin/sh
openrc default ;
/etc/init.d/mariadb setup
rc-service mariadb start 
mysql -u root < database.sql
rc-service mariadb stop ;
telegraf --config telegraf.conf &
/usr/bin/mysqld_safe ;