output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "kubernetes_cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "kubernetes_cluster_node_pool_name" {
  value = azurerm_kubernetes_cluster_node_pool.win.name
}
