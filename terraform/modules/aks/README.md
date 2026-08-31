# Azure AKS Module

## Features

- Azure CNI Overlay
- OIDC Issuer Enabled
- Workload Identity Enabled
- System Node Pool
- User Node Pool
- Azure Policy Enabled
- Log Analytics Integration
- ACR Pull Integration
- User Assigned Managed Identity

## Example

```hcl
module "aks" {

  source = "../../modules/aks"

  resource_group_name = module.resource_group.resource_group_names["rg_001"]

  location = var.location

  aks_name = "aks-platform-dev-001"

  dns_prefix = "aks-platform-dev"

  subnet_id = module.network.subnet_ids["aks"]

  log_analytics_workspace_id = module.log_analytics.workspace_id

  acr_id = module.acr.acr_id

  user_assigned_identity_id = module.managed_identity.identity_id

  system_node_pool = {
    vm_size         = "Standard_B2s"
    node_count      = 1
    min_count       = 1
    max_count       = 2
    os_disk_size_gb = 30
    max_pods        = 30
  }

  user_node_pool = {
    name            = "usernp"
    vm_size         = "Standard_B2s"
    node_count      = 1
    min_count       = 1
    max_count       = 2
    os_disk_size_gb = 30
    max_pods        = 30
  }

  tags = local.common_tags
}
```