resource "digitalocean_vpc" "main" {
  count       = var.create_vpc ? 1 : 0
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
  private_network_uuid = var.create_vpc ? digitalocean_vpc.main[0].id : var.existing_vpc_id
}