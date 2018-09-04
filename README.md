# eksctl-demo
install eksctl https://github.com/weaveworks/eksctl

# provision a cluster and auth
```
eksctl create cluster --name=test-cluster --nodes-min=2 --nodes-max=5 \
  --node-type=m5.large --region=us-east-1  --kubeconfig /Users/you/.kube/config.eks
```

# verify with kubectl
```
export KUBECONFIG=/Users/you/.kube/config.eks
kubectl get pods -o kube-system 
```

# install helm
```
kubectl create -f rbac.yaml
helm init --upgrade --service-account tiller
```

# create storageClass
```
kubectl create -f storage-class.yaml
```

# install wordpress
```
helm install --name wordpress stable/wordpress \
  --set mariadb.master.persistence.storageClass=gp2
```

# verify wordpress 
```
open http://$(kubectl get svc wordpress-wordpress -o jsonpath='{.status.loadBalancer.ingress[*].hostname}')
```

# install guestbook
```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/kubernetes/v1.10.0/examples/guestbook-go/redis-master-controller.json
kubectl apply -f https://raw.githubusercontent.com/kubernetes/kubernetes/v1.10.0/examples/guestbook-go/redis-master-service.json
kubectl apply -f https://raw.githubusercontent.com/kubernetes/kubernetes/v1.10.0/examples/guestbook-go/redis-slave-controller.json
kubectl apply -f https://raw.githubusercontent.com/kubernetes/kubernetes/v1.10.0/examples/guestbook-go/redis-slave-service.json
kubectl apply -f https://raw.githubusercontent.com/kubernetes/kubernetes/v1.10.0/examples/guestbook-go/guestbook-controller.json
kubectl apply -f https://raw.githubusercontent.com/kubernetes/kubernetes/v1.10.0/examples/guestbook-go/guestbook-service.json
```

# verify guestbook
```
open http://$(kubectl get svc guestbook -o jsonpath='{.status.loadBalancer.ingress[*].hostname}'):3000
```
