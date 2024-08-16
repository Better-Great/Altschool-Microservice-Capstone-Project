output "firewall_id" {
  description = "ID of the created firewall"
  value       = length(digitalocean_firewall.main) > 0 ? digitalocean_firewall.main[0].id : null
}

output "firewall_status" {
  description = "Status of the firewall"
  value       = length(digitalocean_firewall.main) > 0 ? digitalocean_firewall.main[0].status : null
}