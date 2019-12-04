variable "name" {
  description = "Input name"
}

variable "type" {
  description = "type of resource created as described in the README"
}

variable "convention" {
  description = "(Requires )naming convention methode to be used"
}

variable "postfix" {
  description = "(Optional) postfix to add to server name"
  default = ""
}

variable "azlimits" {
  description = "limit for resources"
  default = {
    "rg"            = 90
    "keyvault"      = 24
    "st"            = 24
    "vnet"          = 64
    "nsg"           = 80
    "vsubnet"       = 80
    "nic"           = 80
    "linuxvm"       = 64 
    "windowsvm"     = 15
    "functionapp"   = 60
    "lb"            = 80
    "lbrule"        = 80
    "evh"           = 50
    "la"            = 63
  }
}

variable "caf_prefix" {
  description = "caf recommended prefix"
  default = {
    "keyvault"      = "kv-"
    "rg"            = "rg-"
    "st"            = "st"
    "evh"            = "evh-"
    "vnet"          = "vnet-"
    "vsubnet"       = "snet-"
    "nsg"           = "nsg-"
    "vm"            = "vm-"
    "linuxvm"       = "vm-"
    "windowsvm"     = "vm-"
    "lb"            = "lb"
    "la"            = "la"
}
}

# variable "naming_constraints" {
  
# }
