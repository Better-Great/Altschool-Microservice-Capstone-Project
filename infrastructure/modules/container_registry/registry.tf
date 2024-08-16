resource "digitalocean_container_registry" "registry" {
  count                  = var.create_registry ? 1 : 0
  name                   = var.registry_name
  subscription_tier_slug = var.subscription_tier
}

resource "digitalocean_container_registry_docker_credentials" "registry_creds" {
  count         = var.create_registry ? 1 : 0
  registry_name = digitalocean_container_registry.registry[0].name
}