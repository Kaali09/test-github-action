#!/bin/bash

echo "Hi Kali! How are you doing?"

mkdir -p ~/.kube
echo $kube_config | base64 -d > ~/.kube/config
apt update
apt install curl
export KUBECONFIG=~/.kube/config
curl -L -o /usr/local/bin/kubectl https://dl.k8s.io/release/v1.22.0/bin/linux/amd64/kubectl
#curl -L -o /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod a+x /usr/local/bin/kubectl
kubectl get ns
