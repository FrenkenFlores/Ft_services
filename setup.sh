#!/bin/sh

#minikube --vm-driver=virtualbox start --extra-config=apiserver.service-node-port-range=1-35000
minikube addons enable ingress
minikube addons enable dashboard
minikube addons enable metrics-server
eval $(minikube docker-env)

IP=$(minikube ip)
docker build -t service_nginx ./srcs/nginx
kubectl create -f ./srcs/configs/ingress.yaml
kubectl create -f ./srcs/configs/nginx.yaml