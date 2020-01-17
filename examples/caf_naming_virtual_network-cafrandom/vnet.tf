module "rg_test" {
  source  = "aztfmod/caf-resource-group/azurerm"
  version = "0.1.1"
  
    prefix          = local.prefix
    resource_groups = local.resource_groups
    tags            = local.tags
}

module "caf_name_vnet" {
  source  = "../.."

  name    = local.name
  type    = "vnet"
  convention  = local.convention
}

resource "azurerm_virtual_network" "testvnet" {
  name                = module.caf_name_vnet.vnet
  location            = local.location
  resource_group_name = module.rg_test.names.test
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "subnet2"
    address_prefix = "10.0.2.0/24"
  }

  subnet {
    name           = "subnet3"
    address_prefix = "10.0.3.0/24"
  }

  tags = local.tags
}