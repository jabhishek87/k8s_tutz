# Some Kubernetes and Devops Tutorial

### Provision a GKE Cluster (Google Cloud)

#### prerequisites
    A GCP Account
    a configured gcloud SDK
    kubectl
    terraform
    GCP account billing_id

#### Steps

gloud init
``` gcloud init ```

set billing id
``` export biiling_id=<billing_id>```

acivate billing in project
``` gcloud alpha billing projects link `gcloud config get-value project` --billing-account $biiling_id ```

enable required services
``` gcloud services enable container.googleapis.com compute.googleapis.com ```

provision gke on gcp
``` cd gke_tf && terraform init && popd ```
``` cd gke_tf && terraform apply -auto-approve  && popd ```

Configure kubectl
``` cd gke_tf && gcloud container clusters get-credentials $(terraform output cluster_name) --region $(terraform output region_name)  && popd ```

Optional

Deploy and access Kubernetes Dashboard
```
kubectl apply -f yaml/k8s-dashboard-aio-rec.yaml
kubectl apply -f yaml/k8s-dashboard-admin-rbac.yaml

# get cluster token
kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep service-controller-token | awk '{print $1}')

kubectl proxy --address 0.0.0.0

```
http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/

<!---
comment section
reference
# https://learn.hashicorp.com/tutorials/terraform/gke
# https://github.com/hashicorp/learn-terraform-provision-gke-cluster

 --->