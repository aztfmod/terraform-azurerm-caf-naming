# Naming convention

This module implements a set of methodologies for naming convention implementation including the default Microsoft Cloud Adoption Framework for Azure recommendations as per https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/naming-and-tagging.

## Methods for naming convention

The following methods are implemented for naming conventions:

| method name | description of the naming convention used |
| -- | -- |
| cafclassic | follows Cloud Adoption Framework for Azure recommendations as per https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/naming-and-tagging |
| cafrandom | follows Cloud Adoption Framework for Azure recommendations as per https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/naming-and-tagging and adds randomly generated characters up to maximum length of name |
| random | name will be generated automatically in full lengths of azure object |
| passthrough | naming convention is implemented manually, fields given as input will be same as the output (but lengths and forbidden chars will be filtered out) |

## Resource types

We define resource types as per: https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/naming-and-tagging 

Current prototype supports:
| Resource type                       | Resource name prefix |
| ----------------------------------- | -------------------- |
| Resource group                      | rg-                  |
| Azure Storage Account               | st                 |
| Azure Event Hubs                    | evh-                 |
| Azure Monitor Log Analytics         | la-               |

## Parameters

### name
input name from the user (from landing zones settings or from blueprints)
name will be sanitized as per supported character set in Azure.

Example:

```hcl
name = "ajkrwesdfsdfsdfsfdreau'%#d2."
```

### postfix
input postfix from the user (to managed instance numbers for instance)

Example:
```hcl
postfix = "001"
```

### convention
one of the four methods as described above:

Example:

```hcl
convention = "cafclassic"
```

### type of object
describes the type of object you are requesting a name from, for instance if you are requesting a name for event hub:

```hcl
type=evh
```

## Limitations and planned improvements

- Currently you can only get one name at a time, support for multiple names via input map of the same type coming.
- Filter for minimum size for passthrough method
- Support for hub_spoke landing zone components
- Support for VM components
Feel free to submit your PR to add capabilities

## Outputs

This module outputs one name, the result of the naming convention query, you must specify the type of output required, example for a storage account, you will get
<module>.sa which returns the name based on the convention input.
This output will be consumed directly by a module to name the component before calling the azurerm resource provider.

Example:
```hcl
module "caf_name_sa" {
  source = "../terraform-azurerm-caf-naming/"
  
  name    = var.name
  type    = "sa"
  convention  = var.convention
}

resource "azurerm_storage_account" "log" {
  name                      = module.caf_name_sa.sa
  resource_group_name       = var.resource_group_name
  location                  = var.location
  account_kind              = "StorageV2"
  account_tier              = "Standard"
  account_replication_type  = "GRS"
  access_tier               = "Hot"
  enable_https_traffic_only = true
  tags                      = local.tags
}
```
