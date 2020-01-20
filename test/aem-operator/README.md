## aem-operator

https://github.com/xumak-grid/aem-operator

### Requirements

- deploy secret bedrock-api-secrets
- deploy vault opetator
- deploy contour ingress controller

### RBAC setup

```
kubectl -n bedrock create -f k8s/account.yaml
kubectl -n bedrock create -f k8s/rbac.yaml
```

### Deploy AEM operator

```
kubectl -n bedrock create -f k8s/crd.yaml
kubectl -n bedrock create -f k8s/deployment.yaml
```

### Test the AEM deployment

Create an aem-deployment

```
kubectl create ns test-deployment
kubectl -n test-deployment create -f k8s/example-aem-deployment.yaml
```

Delete the aem-deployment

```
kubectl -n test-deployment delete -f k8s/example-aem-deployment.yaml
```
