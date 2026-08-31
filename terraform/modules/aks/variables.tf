variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "aks_name" {
  type = string
}

variable "dns_prefix" {
  type = string
}

variable "kubernetes_version" {
  type    = string
  default = "1.33.2"
}

variable "subnet_id" {
  type = string
}

variable "log_analytics_workspace_id" {
  type = string
}

variable "acr_id" {
  type = string
}

variable "user_assigned_identity_id" {
  type = string
}

variable "system_node_pool" {
  type = object({
    vm_size             = string
    node_count          = number
    min_count           = number
    max_count           = number
    os_disk_size_gb     = number
    max_pods            = number
  })
}

variable "user_node_pool" {
  type = object({
    name                = string
    vm_size             = string
    node_count          = number
    min_count           = number
    max_count           = number
    os_disk_size_gb     = number
    max_pods            = number
  })
}

variable "tags" {
  type    = map(string)
  default = {}
}