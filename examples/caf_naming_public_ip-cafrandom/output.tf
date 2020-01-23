output "pip_name" {
  value = azurerm_public_ip.testip.name
}

output "caf_name" {
  value = module.caf_name_pip_test
}
