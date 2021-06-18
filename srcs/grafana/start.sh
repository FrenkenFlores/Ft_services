#!/bin/sh
NGINX=$(cat nginx.txt)
WORDPRESS=$(cat wordpress.txt)
PHPMYADMIN=$(cat phpmyadmin.txt)
MYSQL=$(cat mysql.txt)
INFLUXDB=$(cat influxdb.txt)
FTPS=$(cat ftps.txt)

sed -i "s/nginx/$NGINX/g" /grafana-6.6.0/public/dashboards/nginx.json
sed -i "s/wordpress/$WORDPRESS/g" /grafana-6.6.0/public/dashboards/wordpress.json
sed -i "s/phpmyadmin/$PHPMYADMIN/g" /grafana-6.6.0/public/dashboards/phpmyadmin.json
sed -i "s/mysql/$MYSQL/g" /grafana-6.6.0/public/dashboards/ftps.json
sed -i "s/dbinflux/$INFLUXDB/g" /grafana-6.6.0/public/dashboards/mysql.json
sed -i "s/ftps/$FTPS/g" /grafana-6.6.0/public/dashboards/influxdb.json

sed -i "s/nginx/$NGINX/g" /grafana-6.6.0/public/dashboards/dashboard.json
sed -i "s/wordpress/$WORDPRESS/g" /grafana-6.6.0/public/dashboards/dashboard.json
sed -i "s/phpmyadmin/$PHPMYADMIN/g" /grafana-6.6.0/public/dashboards/dashboard.json
sed -i "s/mysql/$MYSQL/g" /grafana-6.6.0/public/dashboards/dashboard.json
sed -i "s/dbinflux/$INFLUXDB/g" /grafana-6.6.0/public/dashboards/dashboard.json
sed -i "s/ftps/$FTPS/g" /grafana-6.6.0/public/dashboards/dashboard.json

supervisord
