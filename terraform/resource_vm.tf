resource "azurerm_linux_virtual_machine" "virtualMachine" {
    name                = var.vm_name
    computer_name       = var.vm_name
    resource_group_name = azurerm_resource_group.rg.name
    location            = azurerm_resource_group.rg.location
    size                = var.vm_size
    admin_username      = var.vm_user_admin
    network_interface_ids = [ azurerm_network_interface.networkInterface.id]
    disable_password_authentication = true

    admin_ssh_key {
        username   = var.vm_user_admin
        public_key = file("~/.ssh/id_rsa.pub")
        #public_key = file("./ssh/id_rsa.pub")
    }

    os_disk {
        caching = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    plan {
        name      = var.vm_offer
        product   = var.vm_offer
        publisher = var.vm_publisher
    }

    source_image_reference {
        publisher = var.vm_publisher
        offer     = var.vm_offer
        sku       = var.vm_sku
        version   = var.vm_version
    }

    boot_diagnostics {
        storage_account_uri = azurerm_storage_account.stAccount.primary_blob_endpoint
    }

    tags = {
        environment = var.environment
    }

}