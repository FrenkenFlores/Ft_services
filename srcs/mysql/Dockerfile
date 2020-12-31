FROM alpine:latest
RUN apk update && apk upgrade
RUN apk add mysql mysql-client
RUN apk add openrc
VOLUME [ "/var/lib/mysql" ]
VOLUME [ "/sys/fs/cgroup" ]
COPY start.sh /
COPY my.cnf /etc/my.cnf.d/
COPY database.sql /
RUN chmod +xrw start.sh database.sql
RUN chmod +r /etc/my.cnf
EXPOSE 3306
CMD /start.sh