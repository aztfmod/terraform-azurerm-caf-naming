output "vm_name" {
  value = azurerm_virtual_machine.main.name
}

output "caf_name" {
  value = module.caf_name_vm_test
}
