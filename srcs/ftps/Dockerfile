FROM alpine:3.10

EXPOSE 21 20
EXPOSE 6000-6002
RUN apk update
RUN apk add vsftpd openssl wget supervisor
RUN mv /etc/vsftpd/vsftpd.conf /etc/vsftpd/vsftpd_orig.conf
COPY vsftpd.conf /etc/vsftpd/
COPY supervisord.conf /etc/
COPY stop-supervisor.sh /
RUN chmod +x /stop-supervisor.sh
RUN openssl req -days 365 -x509 -nodes -newkey rsa:2048 -subj '/C=RF/ST=MSK/L=SCHOOL-21/O=21/CN=fflores' -keyout /etc/ssl/certs/ftps.key -out /etc/ssl/certs/ftps.crt

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
RUN chmod 777 start.sh
CMD ./start.sh