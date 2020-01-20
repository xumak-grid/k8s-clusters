# Bedrock secrets

### Bedrock api secrets

This secrets are used by the aem-operator and the bedrock api

The secrets must be encoded in base64 before creating the secret

for example:

```
$ echo -n "https://grid-vault.bedrock.svc:8200" | base64
aHR0cHM6Ly9ncmlkLXZhdWx0LmJlZHJvY2suc3ZjOjgyMDA=

$ echo -n echo -n "dummy" | base64
ZHVtbXk=
```

fill the data and create the secret

```
kubectl -n bedrock create -f k8s/bedrock-api-secrets.yaml
```
