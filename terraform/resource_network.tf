# Creacion de la red
resource "azurerm_virtual_network" "virtualNetwork" {
    name                = "k8s_net"
    address_space       = [var.net_address_space]
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name

    tags = {
        environment = var.environment
    }
}

# Creación de subnet
resource "azurerm_subnet" "subnet" {
    name                   = "terraformSubnet"
    resource_group_name    = azurerm_resource_group.rg.name
    virtual_network_name   = azurerm_virtual_network.virtualNetwork.name
    address_prefixes       = [var.net_address_prefixes]
}

# Creacion NIC
resource "azurerm_network_interface" "networkInterface" {
  name                = "networkInterface"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

    ip_configuration {
      name                           = "ipConfiguration"
      subnet_id                      = azurerm_subnet.subnet.id 
      private_ip_address_allocation  = "Static"
      private_ip_address             = "10.0.1.10"
      public_ip_address_id           = azurerm_public_ip.publicIp.id
    }
    tags = {
        environment = var.environment
    }
}

# Crecion IP pública
resource "azurerm_public_ip" "publicIp" {
  name                = "publicIp"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"
  sku                 = "Basic"
  tags = {
    environment = var.environment
  }
}