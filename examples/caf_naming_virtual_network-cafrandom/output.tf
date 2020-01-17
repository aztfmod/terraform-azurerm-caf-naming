output "vnet" {
  value = azurerm_virtual_network.testvnet.name
}

output "caf_name_vnet" {
  value = module.caf_name_vnet
}
