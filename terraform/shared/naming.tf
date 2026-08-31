locals {

  resource_suffix = "${var.environment}-001"

  resource_names = {

    resource_group = "rg-platform-${local.resource_suffix}"

    vnet = "vnet-platform-${local.resource_suffix}"

    law = "law-platform-${local.resource_suffix}"

    aks = "aks-platform-${local.resource_suffix}"

    acr = "acrplatform${var.environment}001"

    kv = "kv-platform-${local.resource_suffix}"

    postgres = "psql-platform-${local.resource_suffix}"

    appgw = "agw-platform-${local.resource_suffix}"

  }

}