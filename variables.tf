variable "name" {
  description = "input name"
}

variable "type" {
  description = "type of resource created as described in the README"
}

variable "convention" {
  description = "(Requires) naming convention methode to be used"
}

variable "postfix" {
  description = "(Optional) postfix to add to server name"
  default = ""
}

variable "azlimits" {
  description = "limit for resources"
  default = {
    "asr"           = 50
    "aaa"           = 50
    "acr"           = 49
    "afw"           = 80
    "rg"            = 90
    "kv"            = 24 
    "st"            = 24
    "vnet"          = 64
    "nsg"           = 80
    "snet"          = 80
    "nic"           = 80
    "vml"           = 64 
    "vmw"           = 15
    "functionapp"   = 60
    "lb"            = 80
    "lbrule"        = 80
    "evh"           = 50
    "la"            = 63
    "pip"           = 80
    "gen"           = 24
  }
}

variable "caf_prefix" {
  description = "caf recommended prefix"
  default = {
    "asr"           = "asr-"
    "aaa"           = "aaa-"
    "afw"           = "afw-"
    "acr"           = "acr"
    "kv"            = "kv-"
    "rg"            = "rg-"
    "st"            = "st"
    "evh"           = "evh-"
    "vnet"          = "vnet-"
    "snet"          = "snet-"
    "nsg"           = "nsg-"
    "vm"            = "vm-"
    "vml"           = "vm-"
    "vmw"           = "vm-"
    "lb"            = "lb"
    "la"            = "la"
    "pip"           = "pip-"
    "gen"           = "gen"
}
}

# variable "naming_constraints" {
  
# }
