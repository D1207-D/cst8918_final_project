output "redis_host" {
  description = "The hostname of the Redis instance"
  value       = azurerm_redis_cache.weather_app.hostname
  sensitive   = true
}

output "redis_port" {
  description = "The port of the Redis instance"
  value       = azurerm_redis_cache.weather_app.ssl_port
  sensitive   = true
}

output "redis_primary_key" {
  description = "The primary access key for the Redis instance"
  value       = azurerm_redis_cache.weather_app.primary_access_key
  sensitive   = true
}
