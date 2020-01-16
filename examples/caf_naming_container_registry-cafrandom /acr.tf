module "rg_test" {
  source  = "aztfmod/caf-resource-group/azurerm"
  version = "0.1.1"
  
    prefix          = local.prefix
    resource_groups = local.resource_groups
    tags            = local.tags
}

module "caf_name_acr" {
  source  = "../.."

  name    = local.name
  type    = "acr"
  convention  = local.convention
}

resource "azurerm_container_registry" "acr" {
  name                      = module.caf_name_acr.acr
  resource_group_name       = module.rg_test.names.test
  location                  = local.location
  sku                       = local.sku
  admin_enabled             = local.admin_enabled
  georeplication_locations  = local.georeplication_locations
  tags                      = local.tags
}