#!/bin/sh

minikube --vm-driver=virtualbox start --extra-config=apiserver.service-node-port-range=1-35000
minikube addons enable metallb
minikube addons enable dashboard
eval $(minikube docker-env)

docker build -t nginx-image ./srcs/nginx
#docker build -t ftps-image ./srcs/ftps
#docker build -t mysql-image ./srcs/mysql
docker build -t wordpress-image ./srcs/wordpress
#docker build -t phpmyadmin-image ./srcs/phpmyadmin
#docker build -t influxdb-image ./srcs/influxdb
#docker build -t grafana-image ./srcs/grafana
#kubectl create -f ./srcs/configs/metallb.yaml
#kubectl create -f ./srcs/configs/nginx.yaml
#kubectl create -f ./srcs/configs/mysql.yaml
#kubectl create -f ./srcs/configs/wordpress.yaml
kubectl create -k ./srcs/configs/