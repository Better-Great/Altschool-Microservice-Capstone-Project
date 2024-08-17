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

![up1](https://github.com/user-attachments/assets/a2ff4cad-22dd-488e-b800-5e18a4cab67a)
![up2](https://github.com/user-attachments/assets/2be174a6-cccb-43da-b847-44d28a284bb3)

![grafana](https://github.com/user-attachments/assets/1b9f2a90-b92a-4e6b-b2ed-c95b8faecd89)
![grafana1](https://github.com/user-attachments/assets/b239f337-e735-43ba-9c5f-804ef0da3754)
![grafana2](https://github.com/user-attachments/assets/595be20b-c169-4fc7-9d94-7b8a04064e0a)
![grafana3](https://github.com/user-attachments/assets/23a3eb57-3635-428e-9f4b-8da8313c6679)
![gra-frontend](https://github.com/user-attachments/assets/a468d4ab-95ff-4643-882c-2413577c95ac)


![slack](https://github.com/user-attachments/assets/4597cf37-54f8-4724-be17-485032709488)













