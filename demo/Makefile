.PHONY: setup build compile image deploy run clean

state_setup:
	aws s3api create-bucket --bucket  --region us-east-1
	aws s3api put-bucket-versioning --bucket  --versioning-configuration Status=Enabled

kops_create:
	kops create cluster --name demo.xumak.io --kubernetes-version 1.8.3 --authorization RBAC --master-size m4.large --node-size m4.xlarge  --zones us-east-1a,us-east-1b,us-east-1c --master-count 1 --node-count 3 --networking kubenet --state s3://

kops_edit:
	kops edit cluster --state s3:// --name demo.xumak.io

kops_up:
	kops update cluster --state s3:// --name demo.xumak.io --yes

kops_delete:
	kops delete cluster --state s3:// --name demo.xumak.io --yes

kops_dashboard:
	/usr/bin/open -a "/Applications/Google Chrome.app" 'https://api.demo.xumak.io/ui'
	kops get secrets kube --type secret -oplaintext --state s3://

kops_upgrade:
	kops upgrade cluster --state s3:// --name demo.xumak.io  --yes
	kops update cluster --state s3:// --name demo.xumak.io  --yes

kops_rolling:
	kops rolling-update cluster --state s3:// --name demo.xumak.io  --yes

vpn_install:
	helm install stable/openvpn --set openvpn.OVPN_K8S_POD_NETWORK=100.96.0.0 --set openvpn.OVPN_K8S_POD_SUBNET=255.255.0.0 --name openvpn
