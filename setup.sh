#!/bin/sh


echo "Launching minikube ..."
minikube --vm-driver=docker start --extra-config=apiserver.service-node-port-range=1-35000
eval $(minikube docker-env)
echo "Minikube is launched"
echo "Enable Ingress ..."
minikube addons enable ingress
echo "Verify Ingress ..."
kubectl get pods -n kube-system
echo "Ingress verified"
echo "Enable dashboard ..."
minikube addons enable dashboard
echo "dashboard enabled"
echo "Building images ..."
docker build -t nginx ./src/nginx/
