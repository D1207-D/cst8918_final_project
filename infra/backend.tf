terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-5"
    storage_account_name = "tfstate5clng"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    use_azuread_auth    = true
  }
}
