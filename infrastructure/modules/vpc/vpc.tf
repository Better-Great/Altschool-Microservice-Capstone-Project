resource "digitalocean_vpc" "main" {
  name        = var.vpc_name
  region      = var.region
  ip_range    = var.vpc_cidr
  description = var.vpc_description
}


resource "digitalocean_database_cluster" "postgres" {
  name                 = "${var.vpc_name}-db-cluster"
  engine               = "pg"
  version              = "14"
  size                 = var.db_size
  region               = var.region
  node_count           = var.db_node_count
  private_network_uuid = digitalocean_vpc.main.id
}