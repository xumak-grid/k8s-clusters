## drone-deploy

https://ci.grid.xumak.io

As part of a build process Drone deploys k8s deployments to the cluster

### Requirements

- cli drone version 0.8.5

### RBAC setup

```
kubectl -n bedrock create -f k8s/account.yaml
kubectl -n bedrock create -f k8s/rbac.yaml
```

### kubeconfig file

This config file will be used by Drone for update the deployments

Fill the `clusters.cluster.certificate-authority-data` you can take this from the ~/.kube/config and `users.user.token` from the drone-deploy-token secret previously created by the service account.

### Test kubeconfig file

```
kubectl -n bedrock --kubeconfig=kube-config get deployments
# the following is a forbidden get
kubectl -n bedrock --kubeconfig=kube-config get ns
```

### Add secrets to drone

```
drone secret add xumak-grid/bedrock -name kube_config -value "@$PWD/kube-config" -event push
drone secret add xumak-grid/dashboard -name kube_config -value "@$PWD/kube-config" -event push
drone secret add xumak-grid/aem-operator -name kube_config -value "@$PWD/kube-config" -event push
```
