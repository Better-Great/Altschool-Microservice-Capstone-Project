resource "digitalocean_kubernetes_cluster" "socks_shop_cluster" {
  name    = var.cluster_name
  region  = var.region
  version = var.kubernetes_version

  node_pool {
    name       = "${var.cluster_name}-worker-pool"
    size       = var.node_size
    node_count = var.node_count
    tags       = var.tags
  }

  vpc_uuid = var.vpc_id
}