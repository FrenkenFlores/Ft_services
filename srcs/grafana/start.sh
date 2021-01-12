#!/bin/sh
telegraf --config telegraf.conf &
cd ./grafana-6.6.0/bin/ && ./grafana-server -config /grafana-6.6.0/grafana.ini
