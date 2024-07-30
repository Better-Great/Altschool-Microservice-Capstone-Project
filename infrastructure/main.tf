terraform {
  required_version = ">= 0.13.0"
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}


# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = var.do_token
}


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
  #droplet_ids   = [] # We'll add droplet IDs when we create the Kubernetes cluster
}
