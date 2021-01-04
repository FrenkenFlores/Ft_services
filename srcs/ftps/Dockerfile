FROM alpine
EXPOSE 21
RUN apk upgrade && apk update
RUN apk add vsftpd && apk add openrc --no-cache && apk add openssl
RUN openssl req -days 365 -x509 -nodes -newkey rsa:2048 -subj '/C=RF/ST=MSK/L=SCHOOL-21/O=21/CN=fflores' -keyout /etc/vsftpd/vsftpd.key -out /etc/vsftpd/vsftpd.crt
RUN mv /etc/vsftpd/vsftpd.conf /org_vsftpd.conf
COPY vsftpd.conf /etc/vsftpd/vsftpd.conf
RUN	mkdir -p /ftp_user
COPY start.sh /
RUN chmod +x ./start.sh
CMD ./start.sh