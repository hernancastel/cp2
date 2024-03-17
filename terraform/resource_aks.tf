#Creacion del cluster de kubernetes
resource "azurerm_kubernetes_cluster" "akscp2" {
    name                = "akscp2"
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    dns_prefix          = "akscp2"

    default_node_pool {
        name       = "default"
        node_count = 1
        vm_size    = "Standard_D2s_v3"
    }

    service_principal {
        client_id     = var.client_id
        client_secret = var.client_secret
    }

    #identity {
    #    type = "SystemAssigned"
    #}

    tags = {
        environment = var.environment
    }
}