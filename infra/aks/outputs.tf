output "cluster_name" {
  description = "Name of the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.name
}

output "kube_config" {
  description = "Kubeconfig for the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive   = true
}

output "cluster_identity" {
  description = "System assigned identity of the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.identity[0].principal_id
}

output "cluster_endpoint" {
  description = "Kubernetes API endpoint"
  value       = azurerm_kubernetes_cluster.aks.kube_config[0].host
}

output "client_certificate" {
  description = "Client certificate for authenticating to the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.kube_config[0].client_certificate
  sensitive   = true
}

output "client_key" {
  description = "Client key for authenticating to the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.kube_config[0].client_key
  sensitive   = true
}

output "cluster_ca_certificate" {
  description = "CA certificate for verifying the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.kube_config[0].cluster_ca_certificate
  sensitive   = true
}
