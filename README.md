# Deploying Microservices with Terraform, Kubernetes, and CI/CD

## Project Summary
This project shows how to deploy microservices using Terraform for Infrastructure as Code (IaC) and Kubernetes for container management. It also sets up a complete CI/CD pipeline using GitHub Actions, along with monitoring using Prometheus and Grafana as well as alerting tools such mail and slack.

### Image of The Application
![8](https://github.com/user-attachments/assets/c45e8e28-2dad-4912-8384-c6ee847b4f6f)

## Contents:
1. Prerequisites
2. Key Features
3. Setup


###  Prerequisites
- **Cloud Provider Account:** You'll need an active account with a recognized cloud provider to provision resources using Terraform. For this project, I employed the use of digitial ocean. 

- **GitHub Account:** A GitHub account is required for version control and to set up the CI/CD pipeline with GitHub Actions.

- **Terraform:** Terraform is required for managing infrastructure as code.

- **kubectl of minkube:** This command-line tool is necessary for interacting with the Kubernetes cluster.

- **Helm:** Helm is required for managing Kubernetes applications, including deploying services and handling configurations.

- **Linux:** A good understanding of linux is also essential 

- **Basic Knowledge of CI/CD and Kubernetes:** Familiarity with continuous integration/continuous deployment (CI/CD) concepts and Kubernetes basics will help in understanding and implementing the project.

### Key Features

- Automating infrastructure setup with Terraform
- Deploying services on Kubernetes with NGINX Ingress and Cert-Manager
- Using Prometheus and Grafana for monitoring
- Setting up alerts with Alertmanager
- Building a CI/CD pipeline with GitHub Actions

### Project Structure
```
├── .github/workflows/
│   ├── infrastructure-deploy.yaml
│   └── sock-shop-deployment.yaml
manifest/
├── namespaces/
│   └── namespace-sock-shop.yaml
├── deployments/
│   ├── carts-deployment.yaml
│   ├── carts-db-deployment.yaml
│   ├── catalogue-deployment.yaml
│   ├── catalogue-db-deployment.yaml
│   ├── front-end-deployment.yaml
│   ├── orders-deployment.yaml
│   ├── orders-db-deployment.yaml
│   ├── payment-deployment.yaml
│   ├── queue-master-deployment.yaml
│   ├── rabbitmq-deployment.yaml
│   ├── session-db-deployment.yaml
│   ├── shipping-deployment.yaml
│   ├── user-deployment.yaml
│   └── user-db-deployment.yaml
└── services/
    ├── carts-service.yaml
    ├── carts-db-service.yaml
    ├── catalogue-service.yaml
    ├── catalogue-db-service.yaml
    ├── front-end-service.yaml
    ├── orders-service.yaml
    ├── orders-db-service.yaml
    ├── payment-service.yaml
    ├── queue-master-service.yaml
    ├── rabbitmq-service.yaml
    ├── session-db-service.yaml
    ├── shipping-service.yaml
    └── user-service.yaml

Infrastructure/
├── main.tf
├── variable.tf
├── output.tf
├── provider.tf
├── tags.tf
└── terraform.tfvars
└── modules/
    ├── vpc/
    │   ├── variable.tf
    │   ├── main.tf
    │   ├── output.tf
    │   └── version.tf
    ├── firewall/
    │   ├── firewall.tf
    │   ├── variable.tf
    │   ├── output.tf
    │   └── version.tf
    ├── Kubernetes/
    │   ├── Kubernetes.tf
    │   ├── variable.tf
    │   ├── output.tf
    │   └── version.tf
    └── container-registry/
        ├── container-registry.tf
        ├── variable.tf
        ├── output.tf
        └── version.tf

ingress/
├── alertmanager-ingress.yaml
├── grafana-ingress.yaml
├── prometheus-ingress.yaml
└── ingress.yaml

sock-shop/
├── alerts/
│   ├── alertmanager-config.yaml
│   ├── alertmanager-deployment.yaml
│   └── slack-secrets.yaml
│
├── lets-encrypt/
│       └── letsencrypt.yaml
│    
└── monitoring/
    └── manifest-monitoring/
        ├── exporter-disk-usage.yaml
        ├── grafana-configmap.yaml
        ├── grafana-deployment.yaml
        ├── grafana-import-dashboard.yaml
        ├── grafana-svc.yaml
        ├── kube-state-cr.yaml
        ├── kube-state-deployment.yaml
        ├── kube-state-svc.yaml
        ├── kube-state-sa.yaml
        ├── prometheus-alertrules.yaml
        ├── prometheus-configmap.yaml
        ├── prometheus-cr.yaml
        ├── prometheus-nodeexporter-daemonset.yaml
        ├── prometheus-nodeexporter-sa.yaml
        ├── prometheus-nodeexporter.yaml
        ├── prometheus-sa.yaml
        ├── prometheus-svc.yaml
        └── prometheus.yaml
│
templates/
    ├── deployments/
    ├── namespaces/
    ├── services/

networking-policy/
├── cart-db-access.yaml
├── catalogue-access.yaml
├── catalogue-db-access.yaml
├── default-deny.yaml
├── frontend-access.yaml
├── orders-access.yaml
├── orders-db-access.yaml
├── payment-access.yaml
├── rabbitmq-access.yaml
├── shipping-access.yaml
└── user-db-access.yaml

│ 
Chart.yaml
│
Values.yaml
└── 
```

### Setup Configuration
#### 1. Clone the Repository
Start by cloning the project repository to your local machine
```
git clone https://github.com/Better-Great/Altschool-Microservice-Capstone-Project.git

cd Altschool-Microservice-Capstone-Project
```
#### 2. Set Up DigitalOcean Credentials  
Since the cloud provider used for setting up the infrastructure was digitial ocean therefore it is neccessary to set up your access credentials:

- **Create a Personal Access Token:**
    - Log in to your DigitalOcean account.
    - Navigate to the API section and create a new token with appropriate permissions.
- **Configure the DigitalOcean CLI:** 
    - Install the DigitalOcean CLI (doctl) if you haven’t already
```
sudo snap install 
```
- Authenticate the CLI using your Personal Access Token:
```
doctl auth init
```
#### 3. Set Up GitHub Secrets
- To enable GitHub Actions to deploy the infrastructure, set up the following secrets in your repository:

- **DO_API_TOKEN:** Your DigitalOcean Personal Access Token.
#### 4. Set Up GitHub Variables
- Add the following GitHub Variables to your repository for region specification:

- **DO_REGION:** The DigitalOcean region where your resources will be deployed (e.g., nyc3, sfo3)

## Set Up Deploying a Microservices Application on DigitalOcean
### 1. Terraform Initialization
 Terraform is used to set up our infrastructure, because it helps us create and manage our cloud resources using code. Terraform ensures it is easier to manage complex setups as well as enable version control our infrastructure.   
 **Steps:**
 Navigate to the directory containing the terraform configuration and run the following commands;
 ```
 terraform init

 terraform validate

 terraform plan

 terraform apply --auto-approve
 ```

### Below are some of the resources you'll see after running terraform apply  

![database](https://github.com/user-attachments/assets/6465fe69-0830-4190-b661-a9d621b5a0c2)
![droplets](https://github.com/user-attachments/assets/b54b273e-2f8e-41df-8063-96dfc8a9178f)
![cluster](https://github.com/user-attachments/assets/b6f2a4fe-71f0-4524-85e8-6d66c17043a2)

![load-balancer](https://github.com/user-attachments/assets/9a2f5768-203e-457a-beb3-8b7db215df05)
![database](https://github.com/user-attachments/assets/6a85a496-38a9-40e4-aac1-38744d9fce6a)
![vpc](https://github.com/user-attachments/assets/a24734eb-65e5-40e8-b9df-a41cf207f1c7)

 ### Connecting to the Cluster
 After creating the cluster, , we need to be able to communicate with the newly created cluster by terraform. 
 This can be done by updating kubeconfig using DigitalOcean's tool (doctl) or you could check the kubernetes option within digitial ocean and copy the respective commands. This process adds the new cluster's info to the local machine. 
 ```
 doctl kubernetes cluster kubeconfig save <your-cluster-name>
 ```

 ### Uploading Application to the Cluster
Since, we have been able to establish communication to the cluster. The next step is to tell Kubernetes exactly what to run and how to run it. 
After ensuring that the files containing namespace, deployment and service configurations are in their respective folder such as `namespace`, `deployment` and `service` within the manifest folder. The following commands is used;
```
kubectl apply -f <path-to-deployment-yaml>
# To check if it is working
kubectl get pods,svc -n sock-shop
```

### Setting Up Ingress Controller
An Ingress Controller manages external access to our services. This ensures that we  can use one address for multiple services
The ingress controller is added using Helm. Helm is like a package manager for Kubernetes. To setup the ingress controller run;
```
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update

# Search for the appropriate Nginx chart
helm search repo ingress-nginx

# Install the Ingress Controller
helm install nginx-ingress ingress-nginx/ingress-nginx

# verification
kubectl get pods,svc
```

### Connecting The Domain Name
With the ingress  properly configured, we have to ensure that all the neccessary requirement for our domain name to function has been carried out.This is due to the fact that we have to connect our domain name to the sock-shop application.
** Steps**
- Add an `A` record pointing to our Ingress Controller
- Add `CNAME`/ `A` records for different services within the application.
 
![1-domain](https://github.com/user-attachments/assets/541bbe3a-38d0-4bd5-a4ea-c786822f65ab)

To make your application accessible via your domain name, you need to apply the ingress configuration. `kubectl apply -f ingress.yaml`
After applying the ingress rule, we should be able to access our application using our domain name in a browser. However, at this point, we would notice that the connection is not secure **(http instead of https)**. To correct and resolve this issue, we need to install the certificate manager. 

### Installing Certificate Manager
To install certificate manager which will automatically gets and renews SSL certificates for us, we can run the following commands;
```
# Add the Jetstack repository
helm repo add jetstack https://charts.jetstack.io --force-update

# Installing cert manager
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.15.2/cert-manager.yaml
```
This installs cert-manager and its dependencies in the cluster. 

## Monitoring
Monitoring is a critical aspect of maintaining a healthy and efficient Kubernetes clusters. It provides essential insights into the performance, health, and resource utilization of the applications and infrastructure.
Prometheus and Grafana are popular open-source tools that work well together for monitoring Kubernetes environments. Prometheus collects and stores metrics, while Grafana provides powerful visualization capabilities.

### Setup Promrtheus and Grafana
- Add the Prometheus community Helm repository
```
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
```
- Search the repository for Prometheus charts and install the kube-prometheus-stack chart in monitoring namespace you will be creating specifically for managing the monitoring applications and services. 
```
helm search repo prometheus
helm install prome prometheus-community/kube-prometheus-stack -n sock-shop
kubectl get pods,svc -n sock-shop
```

### Accessing Grafana Dashboard
- Get the Grafana pod name and describe the pod to find the secret name
```
kubectl get pods -n sock-shop
kubectl describe pod <grafana-pod-name> -n monitoring

# Decode Grafana password
kubectl get secret prometheus-grafana -n sock-shop -o jsonpath="{.data.admin-user}" | base64 --decode
kubectl get secret prometheus-grafana -n sock-shop -o jsonpath="{.data.admin-password}" | base64 --decode
```

![up1](https://github.com/user-attachments/assets/a2ff4cad-22dd-488e-b800-5e18a4cab67a)
![up2](https://github.com/user-attachments/assets/2be174a6-cccb-43da-b847-44d28a284bb3)
![grafana](https://github.com/user-attachments/assets/1b9f2a90-b92a-4e6b-b2ed-c95b8faecd89)
![grafana1](https://github.com/user-attachments/assets/b239f337-e735-43ba-9c5f-804ef0da3754)
![grafana2](https://github.com/user-attachments/assets/595be20b-c169-4fc7-9d94-7b8a04064e0a)
![grafana3](https://github.com/user-attachments/assets/23a3eb57-3635-428e-9f4b-8da8313c6679)
![gra-frontend](https://github.com/user-attachments/assets/a468d4ab-95ff-4643-882c-2413577c95ac)

## CI/CD With Git Actions
The CI/CD pipeline is implemented using GitHub Actions and consists of two workflows. The simple idea is that for the first workflow, `infrastructure-deployment.yaml`, this ensures that the infrastructure running the sock-shop application only runs when there is a push to the terraform branch. This ensures the stability of the infrastructure.
This pipeline sets up the necessary infrastructure on DigitalOcean using Terraform. It:

- Initializes Terraform
- Validates the Terraform configuration
- Imports existing resources (container registry, firewall, VPC)
- Plans and applies the Terraform changes
- Outputs and saves Kubernetes credentials
- Notifies Slack about the completion status

The second pipeline `sock-shop-deployment.yaml` deploys the Sock Shop application and associated resources to the Kubernetes cluster. It does the following;

- Sets up necessary tools (doctl, kubectl, Helm)
- Configures Kubernetes credentials
- Deploys namespaces, application components, and services
- Installs and configures NGINX Ingress Controller and Cert-Manager
- Deploys ingress resources
- Sets up monitoring and alerting
- Runs tests (placeholder)
- Notifies Slack about the completion status

![deploy-cicd](https://github.com/user-attachments/assets/8bdf609f-bf6e-40cd-b13a-5bbfd6d363fa)
![deploy-cicd2](https://github.com/user-attachments/assets/700208e0-feb9-43e2-b85f-7f9519ec1559)
![terraform](https://github.com/user-attachments/assets/67eeab62-9abc-4814-a8d5-1e47e94feaa9)
![slack](https://github.com/user-attachments/assets/4597cf37-54f8-4724-be17-485032709488)












