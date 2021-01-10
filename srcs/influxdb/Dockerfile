FROM alpine:3.12
ENV INFLUXDB_VERSION 1.7.10
EXPOSE 8086
VOLUME [/var/lib/influxdb]
RUN apk update upgrade
RUN apk add tzdata bash bash wget tar
RUN wget --no-verbose https://dl.influxdata.com/influxdb/releases/influxdb-${INFLUXDB_VERSION}-static_linux_amd64.tar.gz.asc
RUN wget --no-verbose https://dl.influxdata.com/influxdb/releases/influxdb-${INFLUXDB_VERSION}-static_linux_amd64.tar.gz
RUN wget https://dl.influxdata.com/influxdb/releases/influxdb-1.8.3_linux_amd64.tar.gz
RUN mkdir -p /usr/src
RUN tar -C /usr/src -xzf influxdb-${INFLUXDB_VERSION}-static_linux_amd64.tar.gz
RUN rm -f /usr/src/influxdb-*/influxdb.conf
RUN chmod +x /usr/src/influxdb-*/*
RUN cp -a /usr/src/influxdb-*/* /usr/bin/
RUN rm -rf *.tar.gz* /usr/src
COPY influxdb.conf /etc/influxdb/influxdb.conf
COPY entrypoint.sh /entrypoint.sh
COPY init-influxdb.sh /init-influxdb.sh
COPY start.sh /start.sh
COPY database.txt /
RUN chmod +x start.sh init-influxdb.sh entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["influxd"]
#CMD ./start.sh