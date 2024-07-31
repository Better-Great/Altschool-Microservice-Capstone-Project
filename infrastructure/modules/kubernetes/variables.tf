variable "cluster_name" {
  description = "Name of the Kubernetes cluster"
  type        = string
}

variable "region" {
  description = "DigitalOcean region for the cluster"
  type        = string
}

variable "kubernetes_version" {
  description = "Version of Kubernetes to use"
  type        = string
  default     = "1.30.2-do.0 " # Check for the latest version and update accordingly
}

variable "node_size" {
  description = "Size of the worker nodes"
  type        = string
  default     = "s-2vcpu-4gb"
}

variable "node_count" {
  description = "Number of worker nodes"
  type        = number
  default     = 3
}

variable "tags" {
  description = "Tags to apply to the cluster"
  type        = list(string)
}

variable "vpc_id" {
  description = "ID of the VPC to deploy the cluster in"
  type        = string
}