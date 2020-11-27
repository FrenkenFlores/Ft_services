FROM	alpine:latest
RUN	apk upgrade && apk update
RUN	apk add nginx
RUN	apk add openssl
COPY	./configs/nginx.conf /etc/nginx/conf.d/default.conf
RUN	openssl req \
-days 365 \
-newkey rsa:4096 \
-x509 \
-sha256 \
-nodes \
-out	./etc/ssl/certs/nginx_cert.crt \
-keyout	./etc/ssl/certs/nginx_key.key \
-subj	'/C=RU/ST=MS/L=MOSCOW/O=21-SCHOOL/OU=MIRAGE/CN=fflores'
EXPOSE	8080 443
CMD bash
