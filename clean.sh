#!/bin/sh

kubectl delete --all ingresses
kubectl delete --all deployments
kubectl delete --all pods
kubectl delete --all services
kubectl delete --all pvc
kubectl delete --all configmap
kubectl delete --all ds
#docker rmi $(docker images | awk '{print $3}' | awk 'NR==1, NR==7')
#kubectl delete deployment wordpress-mysql
#kubectl delete svc wordpress-mysql
#kubectl delete pvc mysql-pv-claim
#docker rmi mysql-image
#docker build ./srcs/mysql/ -t mysql-image
#kubectl apply -f ./srcs/configs/mysql.yaml
#kubectl delete deployment grafana-deployment
#kubectl delete service grafana-service
#kubectl delete deployment influx-deployment
#kubectl delete service influx-service
#kubectl delete deployment test
#kubectl delete service test
#docker rmi grafana-image
#docker rmi influx-image
#docker build ./srcs/grafana/ -t grafana-image
#docker build ./srcs/influx/ -t influx-image
#kubectl apply -f ./srcs/configs/grafana.yaml
#kubectl apply -f ./srcs/configs/influx.yaml
#docker build ./srcs/test/ -t test-image
#kubectl apply -f ./srcs/configs/test.yaml