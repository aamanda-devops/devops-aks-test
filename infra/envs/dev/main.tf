module "rg" {
  source = "../../modules/rg"
  name = "rg-devops"
  location = "Central US"
}

module "network" {
  source = "../../modules/network"
  name = "network-devops"
  resource_group_name = module.rg.name
  location = module.rg.location
}

module "acr" {
  source              = "../../modules/acr"
  name                = "acrdevopsamanda123"
  resource_group_name = module.rg.name
  location            = module.rg.location
}

module "aks" {
  source              = "../../modules/aks"
  name                = "aks-devops-test"
  dns_prefix          = "aksdevops"
  resource_group_name = module.rg.name
  location            = module.rg.location
  subnet_id           = module.network.subnet_id
  acr_id              = module.acr.id
}