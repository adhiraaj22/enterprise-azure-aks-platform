locals {

  common_tags = merge(
    var.tags,
    {
      Module    = "managed-identity"
      ManagedBy = "Terraform"
    }
  )

}