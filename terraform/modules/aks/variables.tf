variable "resource_group_name" {

  description = "Resource Group Name"

  type = string
}


variable "location" {

  description = "Azure Region"

  type = string
}


variable "aks_name" {

  description = "AKS Cluster Name"

  type = string
}


variable "dns_prefix" {

  description = "AKS DNS Prefix"

  type = string
}


variable "kubernetes_version" {

  description = "Kubernetes version"

  type = string

  default = null
}


variable "subnet_id" {

  description = "AKS node subnet ID"

  type = string
}


variable "log_analytics_workspace_id" {

  description = "Log Analytics Workspace ID"

  type = string
}


variable "acr_id" {

  description = "Azure Container Registry ID"

  type = string
}


variable "user_assigned_identity_id" {

  description = "User Assigned Managed Identity ID"

  type = string
}


variable "api_server_authorized_ip_ranges" {

  description = "CIDR ranges allowed to access the AKS API server"

  type = list(string)

}


variable "system_node_pool" {

  description = "System node pool configuration"

  type = object({

    vm_size         = string
    node_count      = number
    min_count       = number
    max_count       = number
    os_disk_size_gb = number
    max_pods        = number

  })

}


variable "user_node_pool" {

  description = "User node pool configuration"

  type = object({

    name            = string
    vm_size         = string
    node_count      = number
    min_count       = number
    max_count       = number
    os_disk_size_gb = number
    max_pods        = number

  })

}


variable "tags" {

  description = "Resource tags"

  type = map(string)

  default = {}

}