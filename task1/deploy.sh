#!/bin/bash

docker build -f docker/Dockerfile -t kube-app:latest .
minikube image load kube-app:latest
kubectl apply -f deploy/configmap.yaml
kubectl apply -f deploy/pod.yaml
kubectl apply -f deploy/deployment.yaml
kubectl apply -f deploy/service.yaml
kubectl apply -f deploy/daemonset.yaml
kubectl apply -f deploy/cronjob.yaml

kubectl rollout status deployment/app-deployment --timeout=120s
