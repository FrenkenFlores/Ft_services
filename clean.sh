#!/bin/sh

# This script deletes everything, useful for rebuilding Docker images with Minikube context

#kubectl delete --all ingresses
#kubectl delete --all deployments
#kubectl delete --all pods
#kubectl delete --all services
#kubectl delete --all pvc
kubectl delete deployment wordpress-mysql
kubectl delete svc wordpress-mysql
kubectl delete pvc mysql-pv-claim
docker rmi mysql-image
docker build ./srcs/mysql/ -t mysql-image
kubectl apply -f ./srcs/configs/mysql.yaml