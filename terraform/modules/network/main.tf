#############################################
# Virtual Network
#############################################

resource "azurerm_virtual_network" "this" {

  name                = var.network.name
  address_space       = var.network.address_space
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = local.common_tags
}


#############################################
# Network Security Groups
#############################################

resource "azurerm_network_security_group" "this" {

  for_each = var.subnets

  name                = each.value.nsg.name
  location            = var.location
  resource_group_name = var.resource_group_name

  dynamic "security_rule" {

    for_each = each.value.nsg.security_rules

    content {

      name      = security_rule.key
      priority  = security_rule.value.priority
      direction = security_rule.value.direction
      access    = security_rule.value.access
      protocol  = security_rule.value.protocol

      source_port_range = security_rule.value.source_port_range

      destination_port_range = security_rule.value.destination_port_range

      source_address_prefix = security_rule.value.source_address_prefix

      destination_address_prefix = security_rule.value.destination_address_prefix

    }
  }

  tags = local.common_tags
}


#############################################
# Route Tables
#############################################

resource "azurerm_route_table" "this" {

  for_each = var.route_tables

  name                = each.value.name
  location            = var.location
  resource_group_name = var.resource_group_name

  dynamic "route" {

    for_each = each.value.routes

    content {

      name = route.key

      address_prefix = route.value.address_prefix

      next_hop_type = route.value.next_hop_type

      next_hop_in_ip_address = try(
        route.value.next_hop_ip_address,
        null
      )

    }
  }

  tags = local.common_tags
}


#############################################
# Subnets
#############################################

resource "azurerm_subnet" "this" {

  for_each = var.subnets

  name                 = each.value.name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.this.name

  address_prefixes = each.value.address_prefixes

  dynamic "delegation" {
    for_each = each.key == "private" ? [1] : []

    content {
      name = "postgresql-delegation"

      service_delegation {
        name = "Microsoft.DBforPostgreSQL/flexibleServers"

        actions = [
          "Microsoft.Network/virtualNetworks/subnets/join/action"
        ]
      }
    }
  }
}


#############################################
# NSG Association
#############################################

resource "azurerm_subnet_network_security_group_association" "this" {

  for_each = var.subnets

  subnet_id = azurerm_subnet.this[each.key].id

  network_security_group_id = (
    azurerm_network_security_group.this[each.key].id
  )
}


#############################################
# Route Table Association
#############################################

resource "azurerm_subnet_route_table_association" "this" {

  for_each = {

    for k, v in var.subnets :
    k => v

    if contains(keys(var.route_tables), k)

  }

  subnet_id = azurerm_subnet.this[each.key].id

  route_table_id = (
    azurerm_route_table.this[each.key].id
  )
}