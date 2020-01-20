.PHONY: setup build compile image deploy run clean

state_setup:
	aws s3api create-bucket --bucket  --region us-east-1
	aws s3api put-bucket-versioning --bucket  --versioning-configuration Status=Enabled

kops_create:
	kops create cluster --node-size t2.large --zones us-east-1a,us-east-1b,us-east-1c,us-east-1d,us-east-1e --state s3:// --name prod.io

kops_edit:
	kops edit cluster --state s3:// --name prod.io

kops_up:
	kops update cluster --state s3:// --name prod.io --yes

kops_delete:
	kops delete cluster --state s3:// --name prod.io --yes

kops_dashboard:
	/usr/bin/open -a "/Applications/Google Chrome.app" 'https://api.prod.io/ui'
	kops get secrets kube --type secret -oplaintext --state s3://

kops_upgrade:
	kops upgrade cluster --state s3:// --name prod.io  --yes
	kops update cluster --state s3:// --name prod.io  --yes

kops_rolling:
	kops rolling-update cluster --state s3:// --name prod.io  --yes
