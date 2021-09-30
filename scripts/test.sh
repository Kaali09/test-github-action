#!/bin/bash

echo "Hi Kali! How are you doing?"

mkdir -p ~/.kube
echo $kube_config | base64 -d > ~/.kube/config

export KUBECONFIG=~/.kube/config
curl -L -o /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod a+x /usr/local/bin/kubectl
kubectl get ns
