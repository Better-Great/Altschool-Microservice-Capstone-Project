output "registry_name" {
  description = "Name of the created container registry"
  value       = var.create_registry ? digitalocean_container_registry.registry[0].name : null
}

output "registry_endpoint" {
  description = "Endpoint for the container registry"
  value       = var.create_registry ? digitalocean_container_registry.registry[0].endpoint : null
}