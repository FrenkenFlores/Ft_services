FROM alpine:3.10

EXPOSE 5050
VOLUME [ “/sys/fs/cgroup” ]
RUN apk update
RUN apk add php7 php7-fpm php7-common php7-iconv php7-json php7-gd php7-curl \
    php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql \
    php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap \
    php7-ctype php7-dom php7-phar
RUN apk add nginx wget supervisor
RUN mkdir -p /var/www/
RUN mkdir -p /run/nginx/
RUN rm /etc/nginx/conf.d/default.conf
RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx-orig.conf
COPY nginx.conf /etc/nginx/
RUN wget https://ru.wordpress.org/latest-ru_RU.tar.gz
RUN tar -xvf latest-ru_RU.tar.gz
RUN mv wordpress /var/www/
RUN rm latest-ru_RU.tar.gz
COPY wp-config.php /var/www/wordpress/
RUN chown -R nginx:nginx /var/www/
RUN chown -R nginx:nginx /var/lib/nginx/
RUN chown -R nginx:nginx /var/tmp/nginx/
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