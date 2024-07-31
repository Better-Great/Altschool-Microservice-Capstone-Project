output "registry_name" {
  description = "Name of the created container registry"
  value       = digitalocean_container_registry.registry.name
}

output "registry_endpoint" {
  description = "Endpoint for the container registry"
  value       = digitalocean_container_registry.registry.endpoint
}

output "registry_credentials" {
  description = "Docker credentials for the registry"
  value       = digitalocean_container_registry_docker_credentials.registry_creds.docker_credentials
  sensitive   = true
}