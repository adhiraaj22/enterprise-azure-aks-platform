resource "azurerm_monitor_diagnostic_setting" "aks" {

  name                       = "diag-aks"
  target_resource_id         = var.aks_id
  log_analytics_workspace_id = var.workspace_id

  enabled_log {
    category = "kube-apiserver"
  }

  enabled_log {
    category = "kube-audit"
  }

  enabled_log {
    category = "cluster-autoscaler"
  }

  enabled_metric {
    category = "AllMetrics"
  }
}