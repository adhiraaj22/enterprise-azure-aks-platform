locals {
  common_tags = merge(
    var.tags,
    {
      Module    = "postgresql"
      ManagedBy = "Terraform"
    }
  )
}