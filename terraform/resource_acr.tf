#Creacion del acr
resource "azurerm_container_registry" "AcrCP2Castel" {
  name                = "acrCp2Castel"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Standard"
  admin_enabled       =  true

    identity {
    type = "SystemAssigned"
  }

  anonymous_pull_enabled   = true    # Habilita el acceso anónimo para extraer imágenes
}
