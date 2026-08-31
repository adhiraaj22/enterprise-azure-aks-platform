resource "azurerm_key_vault" "this" {

  name                = var.keyvault_name
  location            = var.location
  resource_group_name = var.resource_group_name

  tenant_id = var.tenant_id

  sku_name = "standard"

  purge_protection_enabled   = false
  soft_delete_retention_days = 7

  public_network_access_enabled = true

  rbac_authorization_enabled = true

  tags = local.common_tags
}

resource "azurerm_role_assignment" "kv_admin" {

  scope                = azurerm_key_vault.this.id
  role_definition_name = "Key Vault Administrator"
  principal_id         = var.object_id

}