#!/bin/bash

kubectl create secret generic grid-dashboard-oauth-secrets \
  -o yaml --dry-run \
  -n bedrock \
  --from-literal=client-id=CLIENT-ID-HERE... \
  --from-literal=client-secret=CLIENT-SECRET-HERE... \
  --from-literal=cookie=$(python -c 'import os,base64; print base64.urlsafe_b64encode(os.urandom(16))') > k8s/secret.yaml
