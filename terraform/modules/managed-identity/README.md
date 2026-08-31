# Azure Managed Identity Module

## Resources

- Azure User Assigned Managed Identity

## Example

```hcl
module "managed_identity" {

  source = "../../modules/managed-identity"

  resource_group_name = module.resource_group.resource_group_names["rg_001"]

  location = var.location

  identity_name = "id-platform-dev-001"

  tags = local.common_tags

}
```