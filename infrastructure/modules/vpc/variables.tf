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
  default     = "10.0.0.0/16"
}

variable "vpc_description" {
  description = "Description of the VPC"
  type        = string
  default     = "VPC for Socks Shop microservice"
}

variable "db_size" {
  description = "Size of the database cluster"
  type        = string
  default     = "db-s-1vcpu-1gb"
}

variable "db_node_count" {
  description = "Number of nodes in the database cluster"
  type        = number
  default     = 1
}