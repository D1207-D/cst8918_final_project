resource "azurerm_redis_cache" "weather_app" {
  name                = "${var.project_name}-${var.environment}-redis"
  location            = var.location
  resource_group_name = var.resource_group_name
  capacity            = 0
  family              = "C"
  sku_name            = "Basic"
  non_ssl_port_enabled = true
  minimum_tls_version = "1.2"
  redis_version       = "6"

  redis_configuration {
    maxmemory_policy = "allkeys-lru"
  }

  tags = {
    Environment = var.environment
    Project     = var.project_name
  }
}
