#!/bin/sh
IP=$(cat /ip.txt)
adduser -D "fflores" 
echo "fflores:fflores" | chpasswd
chown fflores:fflores /srv/ftp
echo "fflores" > /home/fflores/fflores.txt
sed -i "s/###/$IP/g" /etc/vsftpd/vsftpd.conf
#vsftpd
vsftpd /etc/vsftpd/vsftpd.conf
