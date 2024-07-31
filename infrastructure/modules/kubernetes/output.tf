output "cluster_id" {
  description = "ID of the created Kubernetes cluster"
  value       = digitalocean_kubernetes_cluster.socks_shop_cluster.id
}

output "cluster_endpoint" {
  description = "Endpoint for the Kubernetes cluster"
  value       = digitalocean_kubernetes_cluster.socks_shop_cluster.endpoint
}

output "kubeconfig" {
  description = "Kubeconfig for the cluster (sensitive)"
  value       = digitalocean_kubernetes_cluster.socks_shop_cluster.kube_config[0].raw_config
  sensitive   = true
}