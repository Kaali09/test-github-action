#!/bin/bash
NAMESPACE=$1
echo "Stopping Consumers of $NAMESPACE"
kubectl scale deployment egsp-canary-consumer --replicas=0 -n $NAMESPACE
echo "Stopping Producer of $NAMESPACE" 
kubectl scale deployment egsp-canary-producer --replicas=0 -n $NAMESPACE
 
echo "Waiting for Consumers/Producer to be stopped"
while [ $(kubectl get pods -n  $NAMESPACE | grep -v NAME |awk '{print $1}' |wc -l) -ne 0 ]
do
echo "Waiting for Consumers/Producer to be stopped"
sleep 1
done
 
echo "Starting Consumers of $NAMESPACE"
kubectl scale deployment egsp-canary-consumer --replicas=3 -n $NAMESPACE
 
sleep 10 
 
echo "Starting Producer of $NAMESPACE"
kubectl scale deployment egsp-canary-producer --replicas=1 -n $NAMESPACE
