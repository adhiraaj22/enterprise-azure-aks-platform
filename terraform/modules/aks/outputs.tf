output "aks_name" {

  value = azurerm_kubernetes_cluster.this.name

}


output "aks_id" {

  value = azurerm_kubernetes_cluster.this.id

}


output "aks_fqdn" {

  value = azurerm_kubernetes_cluster.this.fqdn

}


output "kubernetes_version" {

  value = azurerm_kubernetes_cluster.this.kubernetes_version

}


output "oidc_issuer_url" {

  value = azurerm_kubernetes_cluster.this.oidc_issuer_url

}


output "node_resource_group" {

  value = azurerm_kubernetes_cluster.this.node_resource_group

}


output "user_node_pool_id" {

  value = azurerm_kubernetes_cluster_node_pool.user.id

}