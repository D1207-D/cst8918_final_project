output "acr_id" {
  description = "The ID of the container registry"
  value       = azurerm_container_registry.acr.id
}

output "acr_login_server" {
  description = "The login server URL for the container registry"
  value       = azurerm_container_registry.acr.login_server
}

output "acr_name" {
  description = "The name of the container registry"
  value       = azurerm_container_registry.acr.name
}
