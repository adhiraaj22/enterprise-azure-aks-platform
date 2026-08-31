variable "rgs" {
  description = "Map of Resource Groups to create"

  type = map(object({
    name     = string
    location = string
  }))
}

variable "tags" {
  description = "Common tags to apply to all Resource Groups"
  type        = map(string)

  default = {}
}