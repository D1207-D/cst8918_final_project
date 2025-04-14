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

module "acr" {
  source = "./acr"

  project_name        = var.project_name
  environment         = var.environment
  location            = var.location
  resource_group_name = module.network.resource_group_name
  aks_principal_id    = module.aks.cluster_identity

  depends_on = [module.aks]
}
