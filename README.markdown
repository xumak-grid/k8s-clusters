# Kubernetes Clusters for Grid

This repository contains the necessary documentation and commands for managing the Kubernetes clusters powering XumaK Grid.

## Software Required

- [kubectl](https://kubernetes.io/docs/user-guide/kubectl-overview/)

kubectl is the command-line interface for most Kubernetes applications and clusters. Installation is best via cURL.

`$ curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/darwin/amd64/kubectl`

Make sure the binary is executable.

`$ chmod +x ./kubectl`

Move the binary to your path.

`$ sudo mv ./kubectl /usr/local/bin/kubectl`

- [Kops](https://github.com/kubernetes/kops)

Kops assists in deploying prodution-grade Kuberentes clusters. Installation is best via Brew.

`$ brew update && brew install kops`

Copyright © 2016 Tikal Technologies, Inc.