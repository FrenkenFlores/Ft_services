FROM alpine:3
EXPOSE 21 20
EXPOSE 2000-2004
RUN apk upgrade && apk update
RUN apk add vsftpd && apk add openrc --no-cache && apk add openssl
RUN mkdir /srv/ftp
#RUN chown fflores:fflores /srv/ftp
RUN mv /etc/vsftpd/vsftpd.conf /org_vsftpd.conf
COPY ftp.conf /etc/vsftpd/vsftpd.conf
RUN openssl req -days 365 -x509 -nodes -newkey rsa:2048 -subj '/C=RF/ST=MSK/L=SCHOOL-21/O=21/CN=fflores' -keyout /etc/vsftpd/vsftpd.key -out /etc/vsftpd/vsftpd.crt
#COPY vsftpd.conf /etc/vsftpd/vsftpd.conf
#RUN	mkdir -p /ftp_user

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
COPY ./ip.txt /
RUN chmod +x ./start.sh
CMD ./start.sh