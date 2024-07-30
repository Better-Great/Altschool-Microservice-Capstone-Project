output "vpc_id" {
  description = "ID of the created VPC"
  value       = module.vpc.vpc_id
}

output "firewall_id" {
  description = "ID of the created firewall"
  value       = module.firewall.firewall_id
}

# output "registry_name" {
#   description = "Name of the created container registry"
#   value       = module.container_registry.registry_name
# }

# output "registry_endpoint" {
#   description = "Endpoint for the container registry"
#   value       = module.container_registry.registry_endpoint
# }