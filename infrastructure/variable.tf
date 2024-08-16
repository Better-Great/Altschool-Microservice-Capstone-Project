variable "do_token" {
  description = "DigitalOcean API token"
  type        = string
  sensitive   = true
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "region" {
  description = "DigitalOcean region"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "vpc_description" {
  description = "Description of the VPC"
  type        = string
}

variable "firewall_name" {
  description = "Name of the firewall"
  type        = string
}

variable "registry_name" {
  description = "Name of the container registry"
  type        = string
}

variable "subscription_tier" {
  description = "Subscription tier for the container registry"
  type        = string
}

variable "create_vpc" {
  description = "Whether to create a new VPC"
  type        = bool
  default     = false
}

variable "create_registry" {
  description = "Whether to create a new container registry"
  type        = bool
  default     = false
}

variable "create_firewall" {
  description = "Whether to create a new firewall"
  type        = bool
  default     = true
}

variable "existing_vpc_id" {
  description = "ID of an existing VPC to use if not creating a new one"
  type        = string
  default     = ""
}

