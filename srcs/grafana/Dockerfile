FROM alpine
EXPOSE 3000
VOLUME [/var/lib/grafana]
RUN apk update
RUN apk add --upgrade bash
RUN apk add libc6-compat wget 
RUN wget https://dl.grafana.com/oss/release/grafana-6.6.0.linux-amd64.tar.gz
RUN tar -zxvf grafana-6.6.0.linux-amd64.tar.gz
COPY grafana.ini /grafana-6.6.0/grafana.ini
COPY influxdb-datasource.yaml /grafana-6.6.0/conf/provisioning/datasources/influxdb.yaml
COPY dashboards.yaml /grafana-6.6.0/conf/provisioning/dashboards/dashboards.yaml
COPY ./json/* /grafana-6.6.0/public/dashboards/
#RUN ln -s grafana-6.6.0/bin/grafana-server /usr/bin/
COPY start.sh /
RUN chmod +x start.sh
#CMD ["grafana-6.6.0/bin/grafana-server"]
CMD ./start.sh