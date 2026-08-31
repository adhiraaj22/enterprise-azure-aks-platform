variable "resource_group_name" {
  type = string
}

variable "zone_name" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}