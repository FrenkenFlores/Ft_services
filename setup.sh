#!/bin/bash
minikube --vm-driver=virtualbox start --extra-config=apiserver.service-node-port-range=1-35000
eval $(minikube docker-env)
minikube addons enable metallb ; kubectl apply -f ./srcs/metallb.yaml
minikube addons enable dashboard
docker build -t influxdb-image ./srcs/influxdb ; kubectl apply -f ./srcs/influxdb/influxdb.yaml
docker build -t mysql-image ./srcs/mysql ; kubectl apply -f ./srcs/mysql/mysql.yaml
docker build -t ftps-image ./srcs/ftps ; kubectl apply -f ./srcs/ftps/ftps.yaml
docker build -t wdp-image ./srcs/wordpress ; kubectl apply -f ./srcs/wordpress/wordpress.yaml
docker build -t phpmyadmin-image ./srcs/phpmyadmin ; kubectl apply -f ./srcs/phpmyadmin/phpmyadmin.yaml
docker build -t nginx-image ./srcs/nginx ; kubectl apply -f ./srcs/nginx/nginx.yaml

#pods name
kubectl get pods | awk '{print $1}' | grep nginx > ./srcs/grafana/pods/nginx.txt
kubectl get pods | awk '{print $1}' | grep ftps > ./srcs/grafana/pods/ftps.txt
kubectl get pods | awk '{print $1}' | grep wordpress > ./srcs/grafana/pods/wordpress.txt
kubectl get pods | awk '{print $1}' | grep phpmyadmin > ./srcs/grafana/pods/phpmyadmin.txt
kubectl get pods | awk '{print $1}' | grep mysql > ./srcs/grafana/pods/mysql.txt
kubectl get pods | awk '{print $1}' | grep influxdb > ./srcs/grafana/pods/influxdb.txt

docker build -t grafana-image ./srcs/grafana ; kubectl apply -f ./srcs/grafana/grafana.yaml