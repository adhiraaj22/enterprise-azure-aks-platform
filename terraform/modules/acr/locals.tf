locals {

  common_tags = merge(
    var.tags,
    {
      Module    = "acr"
      ManagedBy = "Terraform"
    }
  )

}