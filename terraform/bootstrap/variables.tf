variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "resource_group_name" {
  description = "Terraform Backend Resource Group"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
}

variable "storage_account_name" {
  description = "Terraform State Storage Account"
  type        = string
}

variable "container_name" {
  description = "Terraform State Container"
  type        = string
}

variable "environment" {
  description = "Environment"
  type        = string
}