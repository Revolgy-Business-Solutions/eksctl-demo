#!/bin/bash

kubectl apply -f https://raw.githubusercontent.com/kubernetes/kubernetes/v1.10.0/examples/guestbook-go/redis-master-controller.json
kubectl apply -f https://raw.githubusercontent.com/kubernetes/kubernetes/v1.10.0/examples/guestbook-go/redis-master-service.json
kubectl apply -f https://raw.githubusercontent.com/kubernetes/kubernetes/v1.10.0/examples/guestbook-go/redis-slave-controller.json
kubectl apply -f https://raw.githubusercontent.com/kubernetes/kubernetes/v1.10.0/examples/guestbook-go/redis-slave-service.json
kubectl apply -f https://raw.githubusercontent.com/kubernetes/kubernetes/v1.10.0/examples/guestbook-go/guestbook-controller.json
kubectl apply -f https://raw.githubusercontent.com/kubernetes/kubernetes/v1.10.0/examples/guestbook-go/guestbook-service.json

