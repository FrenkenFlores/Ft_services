#!/bin/sh

kubectl delete --all ingresses
kubectl delete --all deployments
kubectl delete --all pods
kubectl delete --all services
kubectl delete --all pvc
kubectl delete --all configmap
kubectl delete --all ds