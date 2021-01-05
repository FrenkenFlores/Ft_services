FROM alpine
EXPOSE 3000
RUN apk upgrade && apk update
RUN apk add nginx
RUN mkdir -p /run/nginx/
COPY start.sh /
RUN chmod +x start.sh
CMD ./start.sh