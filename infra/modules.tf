module "network" {
  source = "./network"

  project_name = var.project_name
  environment  = var.environment
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
