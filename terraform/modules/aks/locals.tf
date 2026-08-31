locals {

  common_tags = merge(
    var.tags,
    {
      Module    = "aks"
      ManagedBy = "Terraform"
    }
  )

}