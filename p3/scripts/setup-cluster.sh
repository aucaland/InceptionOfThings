#!/bin/bash
BLUE='\033[0;34m'
RED='\033[0;31m'
RESET='\033[0m'

echo "${BLUE}Creating Cluster..${RESET}"
sudo k3d cluster create  iot-aucaland -p "8888:8888@loadbalancer"

echo "${BLUE}Creating namespaces..${RESET}"
sudo kubectl create namespace argocd
sudo kubectl create namespace dev

echo "${BLUE}ArgoCD installation..${RESET}"
sudo kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
echo "${BLUE}Waiting for pods..${RESET}"
sleep 5
sudo kubectl wait --for=condition=ready pod --all -n argocd --timeout=300s

echo "${BLUE}Initial ArgoCD secret:${RESET}"
sudo kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath="{.data.password}" | base64 --decode
echo

echo "${BLUE}Applying ArogCD Application.."
sudo kubectl apply -f /home/aucaland/Documents/IOT/p3/confs/app.yaml
echo "${BLUE}Listening for argoCD..${RESET}"
sudo kubectl port-forward -n argocd svc/argocd-server 8080:443

