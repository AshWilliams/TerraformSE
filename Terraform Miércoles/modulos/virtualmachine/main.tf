variable "resource_group_name" {}
variable "location" {}
variable "network_interface_id" {}


# Create virtual machine
resource "azurerm_virtual_machine" "myterraformvm" {
    name                  = "se-test-vm"
    location              = "${var.location}"
    resource_group_name   = var.resource_group_name
    network_interface_ids = ["${var.network_interface_id}"]
    vm_size               = "Standard_DS1_v2"
    
    delete_data_disks_on_termination = true

    storage_os_disk {
        name              = "myOsDisk"
        caching           = "ReadWrite"
        create_option     = "FromImage"
        managed_disk_type = "Premium_LRS"
    }

    storage_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "16.04.0-LTS"
        version   = "latest"
    }

    os_profile {
        computer_name  = "hostname"
        admin_username = "testadmin"
        admin_password = "Password.1234"
    }

    os_profile_linux_config {
        disable_password_authentication = false
    }

    tags = {
        environment = "Terraform Demo"
    }
}
