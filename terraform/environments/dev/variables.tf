variable "location" {
  description = "Azure region"
  type        = string
}


variable "rgs" {

  description = "Resource groups"

  type = map(object({
    name     = string
    location = string
  }))

}


variable "network" {

  description = "Virtual network configuration"

  type = object({
    name          = string
    address_space = list(string)
  })

}


variable "subnets" {

  description = "Subnet configuration"

  type = any

}


variable "route_tables" {

  description = "Route table configuration"

  type = any

}


variable "log_analytics_workspace_name" {

  description = "Log Analytics workspace name"

  type = string

}


variable "acr_name" {

  description = "Azure Container Registry name"

  type = string

}


variable "managed_identity_name" {

  description = "User assigned managed identity name"

  type = string

}


variable "aks_name" {

  description = "AKS cluster name"

  type = string

}


variable "dns_prefix" {

  description = "AKS DNS prefix"

  type = string

}


variable "system_node_pool" {

  description = "AKS system node pool configuration"

  type = any

}


variable "user_node_pool" {

  description = "AKS user node pool configuration"

  type = any

}


variable "keyvault_name" {

  description = "Azure Key Vault name"

  type = string

}


variable "appgw_name" {

  description = "Application Gateway name"

  type = string

}


variable "postgresql_server_name" {

  description = "PostgreSQL Flexible Server name"

  type = string

}


variable "postgresql_database_name" {

  description = "PostgreSQL database name"

  type = string

}


variable "postgresql_admin_login" {

  description = "PostgreSQL administrator username"

  type = string

}


variable "postgresql_admin_password" {

  description = "PostgreSQL administrator password"

  type      = string
  sensitive = true

}