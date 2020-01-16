module "caf_name_vm_test" {
  source = "../.."
  
  name    = local.name
  type    = "vmw"
  convention  = local.convention
}

module "rg_test" {
  source  = "aztfmod/caf-resource-group/azurerm"
  version = "0.1.1"
  
    prefix          = local.prefix
    resource_groups = local.resource_groups
    tags            = local.tags
}

resource "azurerm_virtual_network" "main" {
  name                = "${local.prefix}-network"
  address_space       = ["10.0.0.0/16"]
  location            = local.location
  resource_group_name = module.rg_test.names.test
}

resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = module.rg_test.names.test
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefix       = "10.0.2.0/24"
}

resource "azurerm_network_interface" "main" {
  name                = "${local.prefix}-nic"
  location            = local.location
  resource_group_name = module.rg_test.names.test

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "main" {
  name                  = module.caf_name_vm_test.vmw
  location              = local.location
  resource_group_name   = module.rg_test.names.test
  network_interface_ids = [azurerm_network_interface.main.id]
  vm_size               = "Standard_DS1_v2"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  # delete_os_disk_on_termination = true


  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter-Core"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = module.caf_name_vm_test.vmw
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }
  os_profile_windows_config {
    provision_vm_agent = false
  }
  tags = local.tags
}
