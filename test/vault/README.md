## Vault operator

The following steps deploy a Vault grid-vault cluster in 2 nodes, installing the Vault and ectd opetators. In the dashboard the vault-grid deploy will have 2 pods, one active pod (running and ready) and the second pod running but not passing the ReadinssProbe (standby pod). See reference secition to get more information. A K8s service will be created for this deployment in `https://grid-vault.bedrock.svc:8200`

### Requirements

- Vault cli v0.10.1
- K8s 1.10.2 cluster

### RBAC setup

```
kubectl -n bedrock create -f k8s/rbac.yaml
```

### Deploy etcd operator

```
kubectl -n bedrock create -f k8s/etcd_crds.yaml
kubectl -n bedrock create -f k8s/etcd_operator_deploy.yaml
```

### Deploy vault operator

```
kubectl -n bedrock create -f k8s/vault_crd.yaml
kubectl -n bedrock create -f k8s/deployment.yaml
```

Check if the operators are running:

```
kubectl -n bedrock get deploy
```

### Deploy grid-vault cluster

```
kubectl -n bedrock create -f k8s/grid_vault.yaml
```

Wait until the `grid-vault-...` pods for etcd and Vault are up

```
kubectl -n bedrock get pods
```

Get the Vault pods

```
kubectl -n bedrock get pods -l app=vault,vault_cluster=grid-vault
```

### Init the vault cluster

the following command get a unsealed pod and port-forwarding using 8200 port to access from localhost

```
kubectl -n bedrock get vault grid-vault -o jsonpath='{.status.vaultStatus.sealed[0]}' | xargs -0 -I {} kubectl -n bedrock port-forward {} 8200
```

Open a new terminal:

```sh
export VAULT_ADDR='https://localhost:8200'
export VAULT_SKIP_VERIFY="true"
```

Check if Vault is accessible using the cli

```
$ vault status

Error checking seal status: Error making API request.

URL: GET https://localhost:8200/v1/sys/seal-status
Code: 400. Errors:

* server is not yet initialized
```

Get the unseal keys and the root token:

```
vault operator init
```

Unseal the selected node, run the following command 3 times using different unseal keys

```
vault operator unseal
```

It is necessary to unseal every vault pod, port-forwarded each of them and repeat the previous step

### Reference

- https://github.com/coreos/vault-operator
- https://github.com/coreos/vault-operator/blob/master/doc/user/vault.md
- https://www.vaultproject.io/intro/getting-started/deploy.html#initializing-the-vault