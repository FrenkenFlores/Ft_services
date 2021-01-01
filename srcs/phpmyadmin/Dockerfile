FROM alpine
EXPOSE 5000
RUN apk update && apk upgrade
RUN apk add php7 php7-fpm php7-opcache \
    php7-gd php7-mysqli php7-zlib php7-curl \
    php7-mbstring php7-json php7-session php7-common \
    php7-iconv php7-xml php7-imap php7-cgi fcgi php7-pdo \
    php7-pdo_mysql php7-soap php7-xmlrpc \
    php7-posix php7-mcrypt php7-gettext \
    php7-ldap php7-ctype php7-dom

RUN mkdir /www
RUN	wget https://files.phpmyadmin.net/phpMyAdmin/4.9.5/phpMyAdmin-4.9.5-english.tar.gz
RUN	tar -xzvf phpMyAdmin-4.9.5-english.tar.gz -C /www/ && rm phpMyAdmin-4.9.5-english.tar.gz
RUN	mv /www/phpMyAdmin-4.9.5-english/ /www/phpmyadmin/
COPY config.inc.php /www/phpmyadmin/

COPY start.sh /
RUN chmod +x start.sh
EXPOSE 5000
CMD ./start.sh