#!/bin/sh
minikube start --vm-driver=virtualbox
minikube addons enable metallb
kubectl apply -f ./src/configs/metallb_manifest.yaml