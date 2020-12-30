FROM alpine:latest
RUN apk update && apk upgrade
RUN apk add mysql mysql-client
RUN apk add openrc --no-cache
VOLUME [ "/var/lib/mysql" ]

COPY start.sh .
COPY database.sql .
RUN chmod +xrw start.sh database.sql
EXPOSE 3306
CMD ./start.sh