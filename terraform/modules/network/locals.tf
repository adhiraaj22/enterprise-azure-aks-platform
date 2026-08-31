locals {
  common_tags = merge(
    var.tags,
    {
      Module    = "network"
      ManagedBy = "Terraform"
    }
  )
}