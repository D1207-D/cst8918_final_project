resource "azurerm_redis_firewall_rule" "allow_aks" {
  name                = "allow-aks"
  redis_cache_name    = azurerm_redis_cache.weather_app.name
  resource_group_name = var.resource_group_name
  start_ip           = var.aks_subnet_start_ip
  end_ip             = var.aks_subnet_end_ip
}

resource "azurerm_monitor_diagnostic_setting" "redis_monitoring" {
  name                       = "redis-monitoring"
  target_resource_id         = azurerm_redis_cache.weather_app.id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  metric {
    category = "AllMetrics"
    enabled  = true

    retention_policy {
      enabled = true
      days    = 30
    }
  }
}

resource "azurerm_redis_cache" "weather_app" {
  name                = "${var.project_name}-${var.environment}-redis"
  location            = var.location
  resource_group_name = var.resource_group_name
  capacity            = 1
  family              = "C"
  sku_name            = "Standard"

  redis_configuration {
    enable_authentication = true
    maxmemory_policy     = "volatile-lru"
    
    # Enable Redis persistence
    rdb_backup_enabled            = true
    rdb_backup_frequency         = 60  # Backup every 60 minutes
    rdb_backup_max_snapshot_count = 1
    
    # Enable notifications
    notify_keyspace_events = "Kg$"
  }

  patch_schedule {
    day_of_week    = "Sunday"
    start_hour_utc = 2
  }

  tags = {
    Environment = var.environment
    Project     = var.project_name
    Managed_By  = "Terraform"
  }
}