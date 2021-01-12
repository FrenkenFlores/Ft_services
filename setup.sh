#!/bin/sh
minikube --vm-driver=virtualbox start --extra-config=apiserver.service-node-port-range=1-35000
minikube addons enable metallb
minikube addons enable dashboard
eval $(minikube docker-env)
docker build -t nginx-image ./srcs/nginx
docker build -t mysql-image ./srcs/mysql
docker build -t phpmyadmin-image ./srcs/phpmyadmin
docker build -t influxdb-image ./srcs/influxdb
docker build -t grafana-image ./srcs/grafana
kubectl apply -f ./srcs/configs/metallb.yaml
kubectl apply -f ./srcs/configs/influxdb.yaml
kubectl apply -f ./srcs/configs/nginx.yaml
kubectl apply -f ./srcs/configs/mysql.yaml
kubectl apply -f ./srcs/configs/phpmyadmin.yaml
kubectl apply -f ./srcs/configs/grafana.yaml
#Send IP address to wordpress and ftps pods
kubectl get svc | awk '{print $4}' | grep 192 | awk 'NR==1' > ./srcs/wordpress/ip.txt
kubectl get svc | awk '{print $4}' | grep 192 | awk 'NR==1' > ./srcs/ftps/ip.txt
docker build -t wordpress-image ./srcs/wordpress
kubectl apply -f ./srcs/configs/wordpress.yaml
docker build -t ftps-image ./srcs/ftps
kubectl apply -f ./srcs/configs/ftps.yaml