#!/bin/bash

kubectl create secret generic prod-route53-credentials-secret \
  -o yaml --dry-run \
  -n cert-manager \
  --from-literal=secret-access-key=$ROUTE53_SECRET_KEY   > dns-secret.yaml
