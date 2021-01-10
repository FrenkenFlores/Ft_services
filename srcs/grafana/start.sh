#!/bin/sh
#rc-service grafana-server start
#cd ./grafana-6.6.0/bin/ && ./grafana-server
cd ./grafana-6.6.0/bin/ && ./grafana-server -config /grafana-6.6.0/grafana.ini
#usr/bin/grafana-server web