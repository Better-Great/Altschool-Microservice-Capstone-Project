variable "firewall_name" {
  description = "Name of the firewall"
  type        = string
}

variable "droplet_ids" {
  description = "List of Droplet IDs to apply the firewall to"
  type        = list(string)
  default     = []
}

variable "inbound_rules" {
  description = "List of inbound rules for the firewall"
  type = list(object({
    protocol         = string
    port_range       = string
    source_addresses = list(string)
  }))
  default = [
    {
      protocol         = "tcp"
      port_range       = "22"
      source_addresses = ["0.0.0.0/0", "::/0"]
    },
    {
      protocol         = "tcp"
      port_range       = "80"
      source_addresses = ["0.0.0.0/0", "::/0"]
    },
    {
      protocol         = "tcp"
      port_range       = "443"
      source_addresses = ["0.0.0.0/0", "::/0"]
    }
  ]
}

variable "outbound_rules" {
  description = "List of outbound rules for the firewall"
  type = list(object({
    protocol              = string
    port_range            = string
    destination_addresses = list(string)
  }))
  default = [
    {
      protocol              = "tcp"
      port_range            = "1-65535"
      destination_addresses = ["0.0.0.0/0", "::/0"]
    },
    {
      protocol              = "udp"
      port_range            = "1-65535"
      destination_addresses = ["0.0.0.0/0", "::/0"]
    },
    {
      protocol              = "icmp"
      port_range            = "1-65535"
      destination_addresses = ["0.0.0.0/0", "::/0"]
    }
  ]
}

variable "tags" {
  description = "Tags to apply to the firewall"
  type        = list(string)
  # default     = ["socks-shop", "development"]
  default = []
}

variable "create_firewall" {
  description = "Whether to create a new firewall"
  type        = bool
  default     = true
}