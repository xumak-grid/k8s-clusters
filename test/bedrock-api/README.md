## bedrock-api

https://github.com/xumak-grid/bedrock

### Requirements

- deploy secret bedrock-api-secrets
- deploy vault opetator

### RBAC setup

```
kubectl -n bedrock create -f k8s/account.yaml
kubectl -n bedrock create -f k8s/rbac.yaml
```

### Deploy bedrock api

```
kubectl -n bedrock create -f k8s/deployment.yaml
kubectl -n bedrock create -f k8s/service.yaml
```

### Test bedrock api

Access using port-forward to a pod

```
kubectl -n bedrock port-forward  bedrock-api-5748f5c887-c9fg4 8000
# in a different terminal
http://localhost:8000/api/v1/clients
```
