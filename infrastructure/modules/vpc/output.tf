output "vpc_id" {
  description = "ID of the created VPC"
  value       = digitalocean_vpc.main.id
}

output "db_cluster_id" {
  description = "ID of the created database cluster"
  value       = digitalocean_database_cluster.postgres.id
}

output "db_cluster_private_host" {
  description = "Private hostname of the database cluster"
  value       = digitalocean_database_cluster.postgres.private_host
}