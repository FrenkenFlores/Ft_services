#!/bin/sh

#minikube --vm-driver=virtualbox start --extra-config=apiserver.service-node-port-range=1-35000
minikube addons enable ingress
minikube addons enable dashboard
minikube addons enable metrics-server
eval $(minikube docker-env)

IP=$(minikube ip)
docker build -t nginx-image ./srcs/nginx
#docker build -t ftps-image --build-arg IP=${IP} ./srcs/ftps
docker build -t mysql-image ./srcs/mysql --build-arg IP=${IP}
docker build -t wordpress-image ./srcs/wordpress --build-arg IP=${IP}
#docker build -t phpmyadmin-image ./srcs/phpmyadmin --build-arg IP=${IP}
#docker build -t influxdb-image ./srcs/influxdb
#docker build -t grafana-image ./srcs/grafana
kubectl create -f ./srcs/configs/ingress.yaml
kubectl create -f ./srcs/configs/nginx.yaml
#kubectl create -f ./srcs/configs/mysql.yaml
#kubectl create -f ./srcs/configs/wordpress.yaml
kubectl create -k ./srcs/configs/