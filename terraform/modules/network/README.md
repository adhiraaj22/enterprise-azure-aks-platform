# Azure Network Module

## Resources

- Virtual Network
- Subnets
- Network Security Groups
- NSG Associations
- Route Tables
- Route Table Associations

## Features

- `for_each`
- `dynamic` blocks
- Per-subnet NSG rules
- Optional subnet delegations
- Optional service endpoints
- Enterprise tagging

## Example

```hcl
module "network" {
  source = "../../modules/network"

  resource_group_name = module.resource_group.resource_group_names["rg_001"]

  location = "Central India"

  network = {
    name          = "vnet-platform-dev-001"
    address_space = ["10.0.0.0/16"]
  }

  subnets      = var.subnets
  route_tables = var.route_tables

  tags = local.common_tags
}
```