
terraform {
    backend "azurerm" {
        resource_group_name  = "rg_terraform_storage"
        storage_account_name = "storpocservientrega"
        container_name       = "tfstate"
        key                  = "test.terraform.tfstate"
    }
}

# Configure the Azure Provider
provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  version = "=1.38.0"
}

#Ambiente Desarrollo

# Create a resource group
resource "azurerm_resource_group" "main" {
  name     = "${var.rg-name}"
  location = "${var.location}"
}

module "mynet" {
  source              = "./modulos/network"
  
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  vnname = "vnet_linux_se"
  subname = "subnet_linux_se"
  pubipname = "pubip_linux_se"
  nsgname = "nsg_linux_ssh"
  nicname = "nic_linux_vm"
}

module "mylinuxvm" {
  source              = "./modulos/virtualmachine"
  
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  network_interface_id = module.mynet.network_interface_id
}