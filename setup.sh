#!/bin/sh
minikube --vm-driver=virtualbox start --extra-config=apiserver.service-node-port-range=1-35000
minikube addons enable ingress
docker build -t service_nginx ./srcs/nginx
