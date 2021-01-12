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
#COPY dashboards.yaml /grafana-6.6.0/conf/provisioning/dashboards/dashboards.yaml
#COPY ./json/* /grafana-6.6.0/public/dashboards/

#telegraf
RUN apk add --no-cache iputils ca-certificates net-snmp-tools procps lm_sensors tzdata && \
    update-ca-certificates wget

ENV TELEGRAF_VERSION 1.15.4

RUN wget --no-verbose https://dl.influxdata.com/telegraf/releases/telegraf-${TELEGRAF_VERSION}_static_linux_amd64.tar.gz.asc && \
    wget --no-verbose https://dl.influxdata.com/telegraf/releases/telegraf-${TELEGRAF_VERSION}_static_linux_amd64.tar.gz

RUN mkdir -p /usr/src /etc/telegraf && \
    tar -C /usr/src -xzf telegraf-${TELEGRAF_VERSION}_static_linux_amd64.tar.gz && \
    mv /usr/src/telegraf*/etc/telegraf/telegraf.conf /etc/telegraf/ && \
    mkdir /etc/telegraf/telegraf.d && \
    cp -a /usr/src/telegraf*/usr/bin/telegraf /usr/bin/ && \
    rm -rf *.tar.gz* /usr/src && rm /etc/telegraf/telegraf.conf
COPY telegraf.conf /

COPY start.sh /
RUN chmod +x start.sh
CMD ./start.sh