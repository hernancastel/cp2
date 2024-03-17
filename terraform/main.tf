# Declaro el proveedor
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.94.0"
      }
  }
}

#Creacion Service Principal + datos para autenticar
provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}


#Creacion resource group
resource "azurerm_resource_group" "rg" {
    name = var.resource_name
    location = var.location
    tags = {
        environment = var.environment
    }
}

#Creacion del storage
resource "azurerm_storage_account" "stAccount" {
  name                     = "staccountcp2castel"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  
  tags = {
        environment = var.environment
  }
}