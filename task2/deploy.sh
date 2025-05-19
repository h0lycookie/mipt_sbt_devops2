#!/bin/bash

docker build -f docker/Dockerfile -t kube-app:latest .
minikube image load kube-app:latest
istioctl install --set profile=demo -y
kubectl label namespace default istio-injection=enabled --overwrite
kubectl apply -f k8s/configmap.yaml
kubectl apply -f k8s/pod.yaml
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
kubectl apply -f k8s/daemonset.yaml
kubectl apply -f k8s/cronjob.yaml
kubectl apply -f k8s/gateway.yaml
kubectl apply -f k8s/virtualservice.yaml
kubectl apply -f k8s/destinationrule.yaml

kubectl rollout status deployment/app-deployment --timeout=120s
kubectl port-forward -n istio-system svc/istio-ingressgateway 8080:80