FROM alpine:3.10

EXPOSE 80 443 22
RUN apk update && apk add nginx
RUN apk add openssl openssh openrc wget supervisor
RUN mkdir -p /www
COPY fflores.html /www
RUN mkdir -p /run/nginx
RUN chown -R nginx:nginx /var/lib/nginx
RUN chown -R nginx:nginx /www
RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
COPY nginx.conf /etc/nginx/
RUN openssl req -days 365 -x509 -nodes -newkey rsa:2048 -subj '/C=RF/ST=MSK/L=SCHOOL-21/O=21/CN=fflores' -keyout /etc/ssl/certs/nginx.key -out /etc/ssl/certs/nginx.crt
COPY supervisord.conf /etc/

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
