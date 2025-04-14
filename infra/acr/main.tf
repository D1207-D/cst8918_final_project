resource "azurerm_container_registry" "acr" {
  name                = replace("${var.project_name}${var.environment}acr", "-", "")
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku
  admin_enabled       = false

  identity {
    type = "SystemAssigned"
  }

  retention_policy {
    days    = 7
    enabled = true
  }

  trust_policy {
    enabled = true
  }

  encryption {
    enabled = true
  }

  zone_redundancy_enabled = true

  tags = {
    Environment = var.environment
    Project     = var.project_name
  }
}

# Grant AKS pull access to ACR
resource "azurerm_role_assignment" "aks_acr_pull" {
  scope                = azurerm_container_registry.acr.id
  role_definition_name = "AcrPull"
  principal_id         = var.aks_principal_id
}
