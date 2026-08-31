# Azure Container Registry Module

## Resources

- Azure Container Registry

## Features

- Configurable SKU
- Optional admin access
- Public network access control
- Enterprise tagging

## Example

```hcl
module "acr" {

  source = "../../modules/acr"

  resource_group_name = module.resource_group.resource_group_names["rg_001"]

  location = var.location

  acr_name = "acrplatformdev001"

  sku = "Basic"

  admin_enabled = false

  tags = local.common_tags

}
```