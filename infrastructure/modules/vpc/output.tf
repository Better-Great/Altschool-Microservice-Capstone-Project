output "vpc_id" {
  description = "ID of the VPC (created or existing)"
  value       = var.create_vpc ? (length(digitalocean_vpc.main) > 0 ? digitalocean_vpc.main[0].id : null) : var.existing_vpc_id
}