#!/bin/sh
minikube --vm-driver=virtualbox start --extra-config=apiserver.service-node-port-range=1-35000
minikube addons enable metallb
minikube addons enable dashboard
eval $(minikube docker-env)
docker build -t nginx-image ./srcs/nginx
docker build -t ftps-image ./srcs/ftps
docker build -t mysql-image ./srcs/mysql
docker build -t phpmyadmin-image ./srcs/phpmyadmin
docker build -t influx-image ./srcs/influx
docker build -t grafana-image ./srcs/grafana
docker build -t test-image ./srcs/test
kubectl apply -f ./srcs/configs/metallb.yaml
kubectl apply -f ./srcs/configs/nginx.yaml
kubectl apply -f ./srcs/configs/mysql.yaml
kubectl apply -f ./srcs/configs/phpmyadmin.yaml
kubectl apply -f ./srcs/configs/ftps.yaml
kubectl apply -f ./srcs/configs/grafana.yaml
kubectl apply -f ./srcs/configs/influx.yaml
kubectl apply -f ./srcs/configs/test.yaml
#kubectl create -k ./srcs/configs/
kubectl get svc | awk '{print $4}' | grep 192 | awk 'NR==1' > ./srcs/wordpress/ip.txt
docker build -t wordpress-image ./srcs/wordpress
kubectl apply -f ./srcs/configs/wordpress.yaml
#copy ssh-key into nginx-server
#IP=$(kubectl get svc | awk '{print $4}' | grep 192 | awk 'NR==1');
#ssh-copy-id root@$IP