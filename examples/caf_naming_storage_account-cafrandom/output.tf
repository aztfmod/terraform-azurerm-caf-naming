output "storage_name" {
  value = azurerm_storage_account.test.name
}

output "caf_name" {
  value = module.caf_name_st_test
}
