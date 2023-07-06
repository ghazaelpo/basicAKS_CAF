terraform {
  required_providers {
  }
  required_version = ">= 1.3.0"
}
provider "azurerm" {
  features {}
}
provider "azurerm" {
  features {}
  skip_provider_registration = true
  alias = "vhub"
}
module "caf" {
  source  = "aztfmod/caf/azurerm"
  version = "~>5.5.0"
  
  providers = {
    azurerm.vhub = azurerm.vhub
  }
  
  global_settings = var.global_settings
  resource_groups = var.resource_groups
  # keyvaults       = var.keyvaults
  compute = {
    aks_clusters = var.aks_clusters
  }
  networking = {
    # public_ip_addresses = var.public_ip_addresses
    vnets               = var.vnets
  }
}