resource "azurerm_resource_group" "rg" {
  name     = "enterprise-devops-rg"
  location = "eastus"
}

module "network" {
  source = "./modules/network"

  vnet_name           = "enterprise-vnet"
  subnet_name         = "subnet-1"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  address_space         = ["10.0.0.0/16"]
  subnet_address_prefix = ["10.0.1.0/24"]

  nsg_id = module.nsg.nsg_id
}
module "nsg" {
  source = "./modules/network_security"

  nsg_name            = "enterprise-nsg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allowed_ip          = "103.79.249.47/32"
}
module "compute" {
  source = "./modules/compute"

  vm_name             = "enterprise-vm"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  subnet_id           = module.network.subnet_id

  public_key = file(var.public_key_path)
}
