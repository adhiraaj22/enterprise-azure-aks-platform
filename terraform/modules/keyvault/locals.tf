locals {
  common_tags = merge(var.tags, {
    Module    = "keyvault"
    ManagedBy = "Terraform"
  })
}