resource "azurerm_private_dns_zone" "this" {

  name                = "privatelink.postgres.database.azure.com"
  resource_group_name = var.resource_group_name

  tags = local.common_tags
}

resource "azurerm_postgresql_flexible_server" "this" {

  name                = var.server_name
  resource_group_name = var.resource_group_name
  location            = var.location

  administrator_login    = var.administrator_login
  administrator_password = var.administrator_password

  sku_name   = var.sku_name
  storage_mb = var.storage_mb

  version = var.postgresql_version

  delegated_subnet_id = var.subnet_id

  private_dns_zone_id = azurerm_private_dns_zone.this.id

  public_network_access_enabled = false

  zone = "1"

  backup_retention_days = 7

  tags = local.common_tags
}

resource "azurerm_postgresql_flexible_server_database" "this" {

  name      = var.database_name
  server_id = azurerm_postgresql_flexible_server.this.id
  charset   = "UTF8"
  collation = "en_US.utf8"
}