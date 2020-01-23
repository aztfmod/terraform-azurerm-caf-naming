module "caf_name_pip_test" {
  source = "../.."
  
  name    = local.name
  type    = "pip"
  convention  = local.convention
}

module "rg_test" {
  source  = "aztfmod/caf-resource-group/azurerm"
  version = "0.1.1"
  
    prefix          = local.prefix
    resource_groups = local.resource_groups
    tags            = local.tags
}

resource "azurerm_public_ip" "testip" {
  name                = module.caf_name_pip_test.pip
  location            = local.location
  resource_group_name = module.rg_test.names.test
  allocation_method   = "Static"
  tags                = local.tags
}
