module "network" {
  source = "./network"

  project_name = var.project_name
  group_number = "5"
  location     = var.location
}

module "aks" {
  source = "./aks"

  project_name        = var.project_name
  environment         = var.environment
  location            = var.location
  resource_group_name = module.network.resource_group_name
  subnet_id           = module.network.aks_subnet_id
  kubernetes_version  = var.kubernetes_version
  node_count          = var.node_count
  vm_size             = var.vm_size

  depends_on = [module.network]
}

module "redis" {
  source = "./redis"

  project_name        = var.project_name
  environment         = var.environment
  location            = var.location
  resource_group_name = module.network.resource_group_name

  depends_on = [module.network]
}

module "weather_app" {
  source = "./weather_app"

  project_name        = var.project_name
  environment         = var.environment
  redis_host          = module.redis.redis_host
  redis_port          = module.redis.redis_port
  redis_primary_key   = module.redis.redis_primary_key
  acr_login_server    = var.acr_login_server
  openweather_api_key = var.openweather_api_key

  depends_on = [module.aks, module.redis]
}
