#tfsec:ignore:azure-container-limit-authorized-ips
resource "azurerm_kubernetes_cluster" "this" {

  name                = var.aks_name
  location            = var.location
  resource_group_name = var.resource_group_name

  dns_prefix         = var.dns_prefix
  kubernetes_version = var.kubernetes_version

  sku_tier = "Free"

  #############################################
  # Kubernetes RBAC
  #############################################

  role_based_access_control_enabled = true

  #############################################
  # AKS API Server Security
  #############################################

  api_server_access_profile {

    authorized_ip_ranges = var.api_server_authorized_ip_ranges

  }

  #############################################
  # Managed Identity
  #############################################

  identity {
    type         = "UserAssigned"
    identity_ids = [var.user_assigned_identity_id]
  }

  #############################################
  # Default System Node Pool
  #############################################

  default_node_pool {

    name = "system"

    vm_size = var.system_node_pool.vm_size

    node_count = var.system_node_pool.node_count

    min_count = var.system_node_pool.min_count
    max_count = var.system_node_pool.max_count

    auto_scaling_enabled = true

    os_disk_size_gb = var.system_node_pool.os_disk_size_gb

    max_pods = var.system_node_pool.max_pods

    vnet_subnet_id = var.subnet_id

    type = "VirtualMachineScaleSets"

    only_critical_addons_enabled = true

  }

  #############################################
  # Network Profile
  #############################################

  network_profile {

    network_plugin = "azure"

    network_policy = "azure"

    load_balancer_sku = "standard"

    outbound_type = "loadBalancer"

  }

  #############################################
  # Azure Monitor / Log Analytics
  #############################################

  oms_agent {

    log_analytics_workspace_id = var.log_analytics_workspace_id

  }

  #############################################
  # Azure AD / Workload Identity
  #############################################

  oidc_issuer_enabled = true

  workload_identity_enabled = true

  #############################################
  # Azure Policy
  #############################################

  azure_policy_enabled = true

  #############################################
  # User Node Pool
  #############################################

  lifecycle {
    ignore_changes = [
      default_node_pool[0].node_count
    ]
  }

  #############################################
  # Tags
  #############################################

  tags = var.tags
}


#############################################
# User Node Pool
#############################################

resource "azurerm_kubernetes_cluster_node_pool" "user" {

  name = var.user_node_pool.name

  kubernetes_cluster_id = azurerm_kubernetes_cluster.this.id

  vm_size = var.user_node_pool.vm_size

  node_count = var.user_node_pool.node_count

  min_count = var.user_node_pool.min_count
  max_count = var.user_node_pool.max_count

  auto_scaling_enabled = true

  os_disk_size_gb = var.user_node_pool.os_disk_size_gb

  max_pods = var.user_node_pool.max_pods

  mode = "User"

  vnet_subnet_id = var.subnet_id

  tags = var.tags
}
