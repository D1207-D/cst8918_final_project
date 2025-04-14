resource "azurerm_redis_cache" "weather_app" {
  name                = "${var.project_name}-${var.environment}-redis"
  location            = var.location
  resource_group_name = var.resource_group_name
  capacity            = 1
  family              = "C"
  sku_name            = "Basic"
  enable_non_ssl_port = false
  minimum_tls_version = "1.2"

  redis_configuration {
    maxmemory_reserved              = 50
    maxfragmentationmemory_reserved = 50
    maxmemory_delta                 = 50
  }

  tags = {
    Environment = var.environment
    Project     = var.project_name
  }
}
