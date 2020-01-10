module "caf_name_st_test" {
  source = "../.."
  
  name    = local.name
  type    = "st"
  convention  = local.convention
}

module "rg_test" {
  source  = "aztfmod/caf-resource-group/azurerm"
  version = "0.1.1"
  
    prefix          = local.prefix
    resource_groups = local.resource_groups
    tags            = local.tags
}

resource "azurerm_storage_account" "test" {
  name                      = module.caf_name_st_test.st
  resource_group_name       = module.rg_test.names.test
  location                  = local.location
  account_kind              = "StorageV2"
  account_tier              = "Standard"
  account_replication_type  = "GRS"
  access_tier               = "Hot"
  enable_https_traffic_only = true
  tags                      = local.tags
}