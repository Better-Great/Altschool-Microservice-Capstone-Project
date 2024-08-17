# Terraform Configuration for Deploying Infrastructure on DigitalOcean

So has to employ best practices, Terraform is used for Infrastructure as Code (IAC). The configuration is designed to create and manage several key components:
- Virtual Private Cloud (VPC)
- Kubernetes Cluster
- Firewall
- Container Registry
- Database Cluster

The terraform root directory contains the primary configuration files, and  a 'modules' subdirectory with separate modules for each of the mentioned key component. This is done to  code reusability and easier maintenance.

### Root directory files:

- `main.tf:` Defines the modules to be used
- `output.tf:` Specifies the outputs from the entire configuration
- `provider.tf:` Sets up the DigitalOcean provider
- `tag.tf`: Creates tags for resources
- `terraform.tfvars:` Holds the variable values
- `variables.tf:` Declares the input variables

### Modules Directory
- vpc
- kubernetes
- firewall
- container-registry

#### a) VPC Module:
- Creates a VPC with specified name, region, and CIDR block
- Sets up a database cluster within the VPC
- Outputs the VPC ID and database cluster details
This ensure that the VPC the cluster will be using is seperately and can be managed individually. 

#### b) Kubernetes Module:

- It deploys a Kubernetes cluster in the VPC created.
- Then configures a node pool with customizable size and count 
- Finally outputs cluster details including endpoint and kubeconfig
This module prepares the environment for deploying and managing containerized applications.

#### c) Firewall Module:

- Establishes a firewall with customizable inbound and outbound rules
- Allows attaching the firewall to specific droplets
- Applies tags to the firewall for easier management
The firewall module enhances security by controlling network traffic to and from your resources.

#### d) Container Registry Module:
- Sets up a private container registry
- Generates Docker credentials for the registry
- Outputs registry details and credentials

### RUNNING TERRAFORM CONFIGURATION
1. Ensure you have terraform installed in your local machine or you could install from Terraform offical website.

2. Clone the Github repository.

3. Move into the infrastructure directory

4. Open the terraform.tfvars or variables.tf file and replace the values with your desired values

5. Initialize Terraform.
```
terraform init
```
6. To see the resources to be created.
```
terraform plan
```
7. To create the resources and deploy them
```
terraform apply --auto-approve
```
Note: This step can take about 10 minutes or more. Do not interrupt the process.

Once the Terraform script has finished,you can go back to the console and view your resources

**Destroy Your Resources**
To avoid incurring charges to your account for the resources used while running this application

Run the following command
```
terraform destroy --auto-approve
```





