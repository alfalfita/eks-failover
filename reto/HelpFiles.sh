# 1 - Creating an EKS Cluster
eksctl create cluster -f ./cluster.yaml
kubectl get nodes

# 2 -Install the AWS Load Balancer Controller
# 2.1 - Add the EKS chart repo to helm
helm repo add eks https://aws.github.io/eks-charts

# 3. Install the AWS Load Balancer Controller CRDs - Ingress Class Params and Target Group Bindings
 kubectl apply -k "github.com/aws/eks-charts/stable/aws-load-balancer-controller//crds?ref=master"

# 4. Install the helm chart by passing the serviceAccount.create=false adn serviceAccount.name=aws-load-balancer-controller
helm install aws-load-balancer-controller eks/aws-load-balancer-controller -n kube-system --set clusterName=app-lb-failover --set serviceAccount.create=false --set serviceAccount.name=aws-load-balancer

# 5. Deploy an app
kubectl apply -f ./cats.yaml

# 6. Verify the ingress is created and ALB is provisioned
 kubectl get ingress -A
 kubectl describe ingress ingress-cats -n cats





    


