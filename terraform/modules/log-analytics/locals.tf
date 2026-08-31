locals {

  common_tags = merge(
    var.tags,
    {
      Module    = "log-analytics"
      ManagedBy = "Terraform"
    }
  )

}