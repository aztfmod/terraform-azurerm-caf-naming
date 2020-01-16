output "storage_name" {
  value = azurerm_container_registry.acr.name
}

output "caf_name_acr" {
  value = module.caf_name_acr
}
