output "resource_group_names" {
  value = module.resource_group.resource_group_names
}

output "vnet_name" {
  value = module.network.vnet_name
}

output "subnet_ids" {
  value = module.network.subnet_ids
}

output "acr_name" {
  value = module.acr.acr_name
}

output "acr_login_server" {
  value = module.acr.acr_login_server
}

output "managed_identity_name" {
  value = module.managed_identity.identity_name
}

output "managed_identity_principal_id" {
  value = module.managed_identity.principal_id
}

output "managed_identity_client_id" {
  value = module.managed_identity.client_id
}

output "acr_pull_role_assignment_id" {
  value = module.acr_pull_role.role_assignment_id
}

output "aks_name" {
  value = module.aks.aks_name
}

output "aks_id" {
  value = module.aks.aks_id
}

output "keyvault_name" {
  value = module.keyvault.keyvault_name
}

output "keyvault_uri" {
  value = module.keyvault.vault_uri
}

output "private_dns_zone_name" {
  value = module.private_dns.private_dns_zone_name
}

output "appgw_name" {
  value = module.application_gateway.appgw_name
}

output "appgw_public_ip" {
  value = module.application_gateway.public_ip
}

output "postgresql_server_name" {
  value = module.postgresql.server_name
}

output "postgresql_fqdn" {
  value = module.postgresql.fqdn
}

output "postgresql_database_name" {
  value = module.postgresql.database_name
}