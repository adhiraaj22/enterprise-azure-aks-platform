resource "azurerm_kubernetes_cluster" "this" {

  name                = var.aks_name
  location            = var.location
  resource_group_name = var.resource_group_name

  dns_prefix = var.dns_prefix

  kubernetes_version = var.kubernetes_version

  oidc_issuer_enabled       = true
  workload_identity_enabled = true

  sku_tier = "Free"

  automatic_upgrade_channel = "patch"

  azure_policy_enabled = true

  local_account_disabled = false

  identity {
    type         = "UserAssigned"
    identity_ids = [var.user_assigned_identity_id]
  }

  default_node_pool {

    name       = "system"

    vm_size    = var.system_node_pool.vm_size

    node_count = var.system_node_pool.node_count

    auto_scaling_enabled = true

    min_count = var.system_node_pool.min_count

    max_count = var.system_node_pool.max_count

    os_disk_size_gb = var.system_node_pool.os_disk_size_gb

    max_pods = var.system_node_pool.max_pods

    vnet_subnet_id = var.subnet_id

    type = "VirtualMachineScaleSets"

    zones = ["1"]

  }

  network_profile {

    network_plugin = "azure"

    network_plugin_mode = "overlay"

    network_policy = "azure"

    load_balancer_sku = "standard"

    outbound_type = "loadBalancer"

    dns_service_ip = "10.100.0.10"

    service_cidr = "10.100.0.0/16"

  }

  oms_agent {

    log_analytics_workspace_id = var.log_analytics_workspace_id

  }

  tags = local.common_tags

}

resource "azurerm_kubernetes_cluster_node_pool" "user" {

  name                  = var.user_node_pool.name

  kubernetes_cluster_id = azurerm_kubernetes_cluster.this.id

  vm_size               = var.user_node_pool.vm_size

  node_count            = var.user_node_pool.node_count

  auto_scaling_enabled  = true

  min_count = var.user_node_pool.min_count

  max_count = var.user_node_pool.max_count

  os_disk_size_gb = var.user_node_pool.os_disk_size_gb

  max_pods = var.user_node_pool.max_pods

  vnet_subnet_id = var.subnet_id

  mode = "User"

  zones = ["1"]

  tags = local.common_tags

}

resource "azurerm_role_assignment" "acr_pull" {

  scope                = var.acr_id

  role_definition_name = "AcrPull"

  principal_id         = azurerm_kubernetes_cluster.this.kubelet_identity[0].object_id

}