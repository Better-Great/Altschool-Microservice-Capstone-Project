module "vpc" {
  source          = "./modules/vpc"
  vpc_name        = var.vpc_name
  region          = var.region
  vpc_cidr        = var.vpc_cidr
  vpc_description = var.vpc_description
}

module "firewall" {
  source        = "./modules/firewall"
  firewall_name = var.firewall_name
  tags          = [digitalocean_tag.socks_shop.name, digitalocean_tag.development.name]
  droplet_ids   = [] # We'll add droplet IDs when we create the Kubernetes cluster
}

module "container_registry" {
  source            = "./modules/container_registry"
  registry_name     = var.registry_name
  subscription_tier = var.subscription_tier
}

module "kubernetes" {
  source        = "./modules/kubernetes"
  cluster_name  = "${var.vpc_name}-cluster"
  region        = var.region
  tags          = [digitalocean_tag.socks_shop.name, digitalocean_tag.development.name]
  vpc_id        = module.vpc.vpc_id
}