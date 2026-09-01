#############################################
# Current Azure Client
#############################################

data "azurerm_client_config" "current" {}


#############################################
# Resource Groups
#############################################

module "resource_group" {

  source = "../../modules/resource-group"

  rgs = var.rgs

  tags = local.common_tags
}


#############################################
# Network
#############################################

module "network" {

  source = "../../modules/network"

  resource_group_name = module.resource_group.resource_group_names["rg_001"]

  location = var.location

  network = var.network

  subnets = var.subnets

  route_tables = var.route_tables

  tags = local.common_tags
}


#############################################
# Log Analytics
#############################################

module "log_analytics" {

  source = "../../modules/log-analytics"

  resource_group_name = module.resource_group.resource_group_names["rg_001"]

  location = var.location

  workspace_name = var.log_analytics_workspace_name

  retention_in_days = 30

  tags = local.common_tags
}


#############################################
# Azure Container Registry
#############################################

module "acr" {

  source = "../../modules/acr"

  resource_group_name = module.resource_group.resource_group_names["rg_001"]

  location = var.location

  acr_name = var.acr_name

  sku = "Premium"

  admin_enabled = false

  public_network_access_enabled = true

  tags = local.common_tags
}


#############################################
# Managed Identity
#############################################

module "managed_identity" {

  source = "../../modules/managed-identity"

  resource_group_name = module.resource_group.resource_group_names["rg_001"]

  location = var.location

  identity_name = var.managed_identity_name

  tags = local.common_tags
}


#############################################
# AKS
#############################################

module "aks" {

  source = "../../modules/aks"


  #############################################
  # Basic Configuration
  #############################################

  resource_group_name = module.resource_group.resource_group_names["rg_001"]

  location = var.location

  aks_name = var.aks_name

  dns_prefix = var.dns_prefix

  kubernetes_version = var.kubernetes_version


  #############################################
  # Network
  #############################################

  subnet_id = module.network.subnet_ids["aks"]


  #############################################
  # Monitoring
  #############################################

  log_analytics_workspace_id = module.log_analytics.workspace_id


  #############################################
  # ACR
  #############################################

  acr_id = module.acr.acr_id


  #############################################
  # Managed Identity
  #############################################

  user_assigned_identity_id = module.managed_identity.identity_id


  #############################################
  # AKS API Server Security
  #############################################

  api_server_authorized_ip_ranges = var.api_server_authorized_ip_ranges


  #############################################
  # Node Pools
  #############################################

  system_node_pool = var.system_node_pool

  user_node_pool = var.user_node_pool


  #############################################
  # Tags
  #############################################

  tags = local.common_tags

}


#############################################
# ACR Pull Permission
#############################################

module "acr_pull_role" {

  source = "../../modules/role-assignment"

  scope = module.acr.acr_id

  role_definition_name = "AcrPull"

  principal_id = module.managed_identity.principal_id
}


#############################################
# Key Vault
#############################################

module "keyvault" {

  source = "../../modules/keyvault"

  resource_group_name = module.resource_group.resource_group_names["rg_001"]

  location = var.location

  keyvault_name = var.keyvault_name

  tenant_id = data.azurerm_client_config.current.tenant_id

  object_id = data.azurerm_client_config.current.object_id

  tags = local.common_tags
}


#############################################
# Private DNS
#############################################
module "private_dns" {

  source = "../../modules/private-dns"

  resource_group_name = module.resource_group.resource_group_names["rg_001"]

  zone_name = "privatelink.vaultcore.azure.net"

  tags = local.common_tags
}


#############################################
# Application Gateway
#############################################

module "application_gateway" {

  source = "../../modules/application-gateway"

  resource_group_name = module.resource_group.resource_group_names["rg_001"]

  location = var.location

  appgw_name = var.appgw_name

  subnet_id = module.network.subnet_ids["appgw"]

  tags = local.common_tags
}


#############################################
# PostgreSQL
#############################################

module "postgresql" {

  source = "../../modules/postgresql"

  resource_group_name = module.resource_group.resource_group_names["rg_001"]

  location = var.location

  server_name = var.postgresql_server_name

  administrator_login = var.postgresql_admin_login

  administrator_password = var.postgresql_admin_password

  database_name = var.postgresql_database_name

  subnet_id = module.network.subnet_ids["private"]

  private_dns_zone_id = ""

  tags = local.common_tags
}


#############################################
# Monitoring
#############################################

module "monitoring" {

  source = "../../modules/monitoring"

  resource_group_name = module.resource_group.resource_group_names["rg_001"]

  location = var.location

  workspace_id = module.log_analytics.workspace_id

  aks_id = module.aks.aks_id

  tags = local.common_tags
}