export AWS_REGION_1="us-east-1"
export AWS_REGION_2="us-east-2"
export EKS_CLUSTER_1="eks-dc"
export EKS_CLUSTER_2="eks-dc-2"
export my_domain="eks.alfalfita.cloud"
export ACCOUNT_ID=$(aws sts get-caller-identity --query 'Account' --output text)