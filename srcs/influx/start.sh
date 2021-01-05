#!/bin/sh


influxd
influx -host 'grafana-service' -port '3000' -database 'InfluxDB' -password 'admin' -username 'admin'