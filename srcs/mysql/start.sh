#!/bin/sh

openrc default ;
/etc/init.d/mariadb setup
rc-service mariadb start 
mysql -u root < mysqldb.sql
rc-service mariadb stop

supervisord