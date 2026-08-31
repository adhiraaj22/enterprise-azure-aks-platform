variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "workspace_id" {
  type = string
}

variable "aks_id" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}