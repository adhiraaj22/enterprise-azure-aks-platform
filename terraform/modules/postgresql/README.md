# Azure PostgreSQL Flexible Server Module

## Resources

- PostgreSQL Flexible Server
- PostgreSQL Database
- Private DNS Zone

## Features

- Private Networking
- Flexible Server
- Configurable SKU
- Configurable Storage
- Enterprise Tagging

## Example

```hcl
module "postgresql" {

  source = "../../modules/postgresql"

  resource_group_name = module.resource_group.resource_group_names["rg_001"]

  location = var.location

  server_name = "psql-platform-dev-001"

  administrator_login = "pgadmin"

  administrator_password = var.postgresql_admin_password

  database_name = "todoapp"

  subnet_id = module.network.subnet_ids["private"]

  private_dns_zone_id = ""

  tags = local.common_tags

}
```