locals {

  common_tags = {
    Environment = var.environment
    Project     = "Enterprise-AKS-Platform"
    ManagedBy   = "Terraform"
    Owner       = "Adhiraaj"
    CostCenter  = "Free Trial"
  }

}