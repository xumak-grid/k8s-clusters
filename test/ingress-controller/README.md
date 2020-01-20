# ingress-controller

This shows how the deploy [heptio-contour](https://github.com/heptio/contour) as IngressController for our cluster.

For how to deploy the cert-manager see [cert-manager](https://github.com/jetstack/cert-manager) documentation.

## Ingress Controller

deploy the ingress controller

```bash
kubectl apply -f contour.yaml
```

## DNS Issuer

the dns issuer which takes all the configuration to validate Let's Encrypt certificates with a DNS Provider in this case Route53 .

* Set the `accessKeyID` in the dns-issuer.yaml manifest.
* generate the secret running the dns-secret.sh `export ROUTE53_SECRET_KEY=key sh ./dns-secret.sh`
* then apply the manifests

```
kubectl apply -f dns-secret.yaml
kubectl apply -f dns-issuer.yaml
```
