variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "network" {
  type = object({
    name          = string
    address_space = list(string)
  })
}

variable "subnets" {
  type = map(object({
    name             = string
    address_prefixes = list(string)

    service_endpoints = optional(list(string), [])

    private_endpoint_network_policies = optional(string, "Enabled")

    private_link_service_network_policies_enabled = optional(bool, true)

    delegation = optional(object({
      name = string

      service_delegation = object({
        name    = string
        actions = list(string)
      })
    }))

    nsg = object({
      name = string

      security_rules = map(object({
        priority                   = number
        direction                  = string
        access                     = string
        protocol                   = string
        source_port_range          = string
        destination_port_range     = string
        source_address_prefix      = string
        destination_address_prefix = string
      }))
    })
  }))
}

variable "route_tables" {
  type = map(object({
    name = string

    routes = map(object({
      address_prefix      = string
      next_hop_type       = string
      next_hop_ip_address = optional(string)
    }))
  }))

  default = {}
}

variable "tags" {
  type    = map(string)
  default = {}
}