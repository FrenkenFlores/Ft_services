#!/bin/sh
influxd & telegraf --config telegraf.conf
#/init-influxdb.sh
#influx -import -path=database.txt
#influx -host 'grafana-service' -port '3000' -database 'InfluxDB' -password 'admin' -username 'admin'