#!bin/sh

#rc-status
#touch /run/openrc/softlevel
#rc-service mariadb start
/usr/bin/mysql_install_db --user=mysql --datadir="/var/lib/mysql"
/usr/bin/mysqld_safe --datadir="/var/lib/mysql"

#init database
#echo "CREATE DATABASE wordpress_database;" | mysql -u root
#echo "CREATE USER 'fflores'@'localhost' IDENTIFIED BY 'fflores';" | mysql -u root
#echo "GRANT ALL PRIVILEGES ON *.* TO 'fflores'@'localhost';" | mysql -u root
#echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password
mysql -u root < database.sql
#bin/sh