#!/bin/sh

adduser -D "fflores" 
echo "fflores:fflores" | chpasswd
ssh-keygen -A
supervisord