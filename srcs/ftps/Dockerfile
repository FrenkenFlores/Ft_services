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
COPY start.sh /
COPY ./ip.txt /
RUN chmod +x ./start.sh
CMD ./start.sh