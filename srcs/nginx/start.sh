#!/bin/sh
adduser -D "fflores" 
echo "fflores:fflores" | chpasswd
openrc default;
rc-service sshd start
telegraf --config telegraf.conf &
nginx -g 'daemon off;'