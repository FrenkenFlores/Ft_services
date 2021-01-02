FROM alpine:latest
EXPOSE 5050
RUN apk update  && apk upgrade

#Setup php and it's extensions
RUN apk add nginx php7 php7-fpm php7-opcache \
php7-gd php7-mysqli php7-zlib php7-curl \
php7-mbstring php7-json php7-session
RUN apk add wget
#RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache
#Wordpress setup
RUN adduser -D -g 'www' www
RUN mkdir /www
RUN mkdir -p /run/nginx
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
RUN	wget https://wordpress.org/latest.tar.gz
RUN	tar -zxvf latest.tar.gz -C /www/ && rm latest.tar.gz
COPY wp-config.php /www/wordpress/
COPY nginx_wordpress.conf /etc/nginx/conf.d/default.conf
COPY ./ip.txt /
#Launch
COPY start.sh .
RUN chmod +x start.sh
CMD ./start.sh
