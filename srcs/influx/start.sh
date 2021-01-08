#!/bin/sh
influxd
influx -import -path=database.txt
#influx -host 'grafana-service' -port '3000' -database 'InfluxDB' -password 'admin' -username 'admin'