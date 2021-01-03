#!/bin/sh
adduser -D "fflores" 
echo "fflores:fflores" | chpasswd
openrc default;
rc-service sshd start
nginx -g 'daemon off;'