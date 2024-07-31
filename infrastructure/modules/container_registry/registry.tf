resource "digitalocean_container_registry" "registry" {
  name                   = var.registry_name
  subscription_tier_slug = var.subscription_tier
}

resource "digitalocean_container_registry_docker_credentials" "registry_creds" {
  registry_name = digitalocean_container_registry.registry.name
}