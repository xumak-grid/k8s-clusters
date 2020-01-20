.PHONY: setup build compile image deploy run clean

state_setup:
	aws s3api create-bucket --bucket grid-k8s-clusters --region us-east-1
	aws s3api put-bucket-versioning --bucket grid-k8s-clusters --versioning-configuration Status=Enabled

kops_create:
	kops create cluster --name  --kubernetes-version 1.10.2 --authorization RBAC --master-size m4.large --node-size r4.large  --zones us-east-1a,us-east-1b,us-east-1c --master-count 1 --node-count 3 --networking calico --state s3://grid-k8s-clusters

kops_edit:
	kops edit cluster --state s3://grid-k8s-clusters --name 

kops_validate:
	kops validate cluster --state s3://grid-k8s-clusters --name 

kops_up:
	kops update cluster --state s3://grid-k8s-clusters --name  --yes

kops_export:
	kops export kubecfg --state s3://grid-k8s-clusters 

kops_delete:
	kops delete cluster --state s3://grid-k8s-clusters --name  --yes

kops_upgrade:
	kops upgrade cluster --state s3://grid-k8s-clusters --name   --yes
	kops update cluster --state s3://grid-k8s-clusters --name   --yes

kops_rolling:
	kops rolling-update cluster --state s3://grid-k8s-clusters --name   --yes

helm_install:
	kubectl apply -f manifests/helm-rbac.yaml
	helm init --service-account tiller

vpn_install:
	helm install stable/openvpn --set openvpn.OVPN_K8S_POD_NETWORK=100.96.0.0 --set openvpn.OVPN_K8S_POD_SUBNET=255.224.0.0 --name openvpn --namespace openvpn

dashboard_install:
	kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml

dashboard_account:
	kubectl apply -f manifests/dashboard-admin-user.yaml

dashboard_token:
	kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep admin-user | awk '{print $1}')
