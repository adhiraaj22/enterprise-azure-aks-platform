locals {

  default_tags = merge(
    var.tags,
    {
      Module = "resource-group"
    }
  )

}