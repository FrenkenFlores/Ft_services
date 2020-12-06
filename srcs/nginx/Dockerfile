FROM alpine
#Ports
EXPOSE 80
EXPOSE 443
EXPOSE 22
#Configs
COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /www/index.html
#Telegraf installation
RUN mkdir -p /etc/telegraf
COPY ./telegraf.conf /etc/telegraf/telegraf.conf
#Copy script
COPY start.sh ./start.sh
RUN chmod +x /start.sh
#Launch
CMD sh ./start.sh

