output "firewall_id" {
  description = "ID of the created firewall"
  value       = digitalocean_firewall.main.id
}

output "firewall_status" {
  description = "Status of the firewall"
  value       = digitalocean_firewall.main.status
}