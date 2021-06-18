#!/bin/sh

adduser "fflores"
echo "fflores:fflores" | chpasswd
echo "helloworld" > /home/fflores/fflores_hw.txt

supervisord
