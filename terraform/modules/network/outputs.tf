output "vnet_name" {
  value = azurerm_virtual_network.this.name
}

output "vnet_id" {
  value = azurerm_virtual_network.this.id
}

output "subnet_names" {
  value = {
    for k, subnet in azurerm_subnet.this :
    k => subnet.name
  }
}

output "subnet_ids" {
  value = {
    for k, subnet in azurerm_subnet.this :
    k => subnet.id
  }
}

output "nsg_names" {
  value = {
    for k, nsg in azurerm_network_security_group.this :
    k => nsg.name
  }
}

output "nsg_ids" {
  value = {
    for k, nsg in azurerm_network_security_group.this :
    k => nsg.id
  }
}

output "route_table_names" {
  value = {
    for k, rt in azurerm_route_table.this :
    k => rt.name
  }
}

output "route_table_ids" {
  value = {
    for k, rt in azurerm_route_table.this :
    k => rt.id
  }
}