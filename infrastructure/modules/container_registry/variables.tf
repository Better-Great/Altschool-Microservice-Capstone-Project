variable "registry_name" {
  description = "Name of the container registry"
  type        = string
}

variable "subscription_tier" {
  description = "Subscription tier for the container registry"
  type        = string
}

variable "create_registry" {
  description = "Whether to create a new container registry"
  type        = bool
  default     = false
}