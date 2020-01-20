## bedrock dashboard

https://github.com/xumak-grid/dashboard

### Requirements

- Github OAuth application
- deploy ClusterIssuer
- deploy contour ingress controller

### Create certificate

This certificate uses a ClusterIssuer to create a certificate for bedrock namespace using Let's Encrypt

```
kubectl -n bedrock create -f k8s/certificate.yaml
```

### Create the oauth-secrets

Add `client-id` and `client-secret` keys from the OAuth Github application to `oauth-secrets.sh` file

```
sh ./oauth-secrets.sh
kubectl -n bedrock -f create k8s/secret.yaml
```

### Create OAuth deployment, ingress and service

```
kubectl -n bedrock create -f k8s/oauth.yaml
```

### Create the Bedrock Dashboard

```
kubectl -n bedrock create -f k8s/deployment.yaml
```

go to the browser: https://dashboard.test.grid.xumak.io
