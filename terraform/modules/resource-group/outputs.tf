output "resource_group_names" {

  description = "Map of Resource Group Names"

  value = {
    for k, rg in azurerm_resource_group.this :
    k => rg.name
  }

}

output "resource_group_ids" {

  description = "Map of Resource Group IDs"

  value = {
    for k, rg in azurerm_resource_group.this :
    k => rg.id
  }

}

output "resource_group_locations" {

  description = "Map of Resource Group Locations"

  value = {
    for k, rg in azurerm_resource_group.this :
    k => rg.location
  }

}