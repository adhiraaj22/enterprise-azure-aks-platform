locals {
  common_tags = merge(
    var.tags,
    {
      Module    = "private-dns"
      ManagedBy = "Terraform"
    }
  )
}