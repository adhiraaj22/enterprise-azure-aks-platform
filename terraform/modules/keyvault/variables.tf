variable "resource_group_name" {

  description = "Resource Group Name"

  type = string

}


variable "location" {

  description = "Azure Region"

  type = string

}


variable "keyvault_name" {

  description = "Key Vault Name"

  type = string

}


variable "tenant_id" {

  description = "Azure Tenant ID"

  type = string

}


variable "object_id" {

  description = "Object ID of the current user or service principal"

  type = string

}


variable "tags" {

  description = "Resource tags"

  type = map(string)

  default = {}

}