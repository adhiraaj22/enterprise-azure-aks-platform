# Azure Log Analytics Module

## Resources

- Azure Log Analytics Workspace

## Features

- Configurable retention
- Configurable SKU
- Enterprise tagging

## Example

```hcl
module "log_analytics" {

  source = "../../modules/log-analytics"

  resource_group_name = module.resource_group.resource_group_names["rg_001"]

  location = var.location

  workspace_name = "law-platform-dev-001"

  retention_in_days = 30

  tags = local.common_tags

}
```