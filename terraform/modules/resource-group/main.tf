resource "azurerm_resource_group" "this" {

  for_each = var.rgs

  name     = each.value.name
  location = each.value.location

  tags = merge(
    var.tags,
    {
      ResourceType = "ResourceGroup"
      Module       = "resource-group"
    }
  )
}