FROM alpine:latest
EXPOSE 5050
ARG IP
RUN apk update

#Setup php and it's extensions
RUN apk add php7 php7-fpm php7-opcache \
php7-gd php7-mysqli php7-zlib php7-curl \
php7-mbstring php7-json php7-session
RUN apk add wget
#RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache
#Wordpress setup
RUN mkdir /www
RUN	wget https://wordpress.org/latest.tar.gz
RUN	tar -zxvf latest.tar.gz -C /www/ && rm latest.tar.gz
COPY ./wp-config.php /www/wordpress/
#Launch
RUN echo $IP > ip.txt
COPY start.sh .
RUN chmod +x start.sh
CMD ./start.sh
