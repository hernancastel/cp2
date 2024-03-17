# Creacion de Security group
resource "azurerm_network_security_group" "networkSecurityGroup" {
    name                = var.sec_group_name
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name

    security_rule {
        name                       = "ssh"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }

    security_rule {
        name                       = "httpprule"
        priority                   = 1002
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "8080"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
  }

    tags = {
        environment = var.environment
    }
}

# Vinculamos el security group al interface de red
resource "azurerm_network_interface_security_group_association" "securityGroupAssociation" {
    network_interface_id = azurerm_network_interface.networkInterface.id
    network_security_group_id = azurerm_network_security_group.networkSecurityGroup.id
}