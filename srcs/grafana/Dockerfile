FROM alpine:3.10

EXPOSE 3000
RUN apk update
RUN apk add libc6-compat wget supervisor
RUN wget https://dl.grafana.com/oss/release/grafana-6.6.0.linux-amd64.tar.gz
RUN tar -zxvf grafana-6.6.0.linux-amd64.tar.gz
RUN rm grafana-6.6.0.linux-amd64.tar.gz
COPY influxdb.yaml /grafana-6.6.0/conf/provisioning/datasources/
COPY grafana.ini grafana-6.6.0/conf/
COPY supervisord.conf /etc/
COPY stop-supervisor.sh /
RUN chmod +x /stop-supervisor.sh

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

COPY ./pods/* /
COPY ./json/* /grafana-6.6.0/public/dashboards/
COPY dashboard.yaml /grafana-6.6.0/conf/provisioning/dashboards/

COPY start.sh /
RUN chmod 777 start.sh
CMD ./start.sh