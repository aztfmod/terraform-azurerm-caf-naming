resource "random_string" "fullrandom" {
  count = (var.convention == "random" || var.convention == "cafrandom" )  == true ? 1 : 0
  length  = local.max
  special = false
  lower   = true
  upper   = false
}

# resource "random_string" "char1" {
#   count = (var.convention == "random" || var.convention == "cafrandom" )  == true ? 1 : 0
#   length  = 1
#   special = false
#   number = false
#   upper = false
# }

# regexes and charset filters
locals {
  filter_alphanum= "/[^0-9A-Za-z]/"
  filter_alphanumh   = "/[^0-9A-Za-z,-]/"
  filter_alphanumu   = "/[^0-9A-Za-z,_]/"
  filter_alphanumhu  = "/[^0-9A-Za-z,_,-]/"
  filter_alphanumhup = "/[^0-9A-Za-z,_,.,-]/"
}

# determine max capacity
locals {
  max         = lookup(var.azlimits, var.type)
  # maxrandom   = local.max - length(local.filtered.alphanum) - length(lookup(var.caf_prefix, var.type)) - length(var.postfix)
}

## filtered inputs 
locals {
  filtered = {
    alphanum    = replace(var.name, local.filter_alphanum, "")
    alphanumhup = replace(var.name, local.filter_alphanumhup, "")
    alphanumhu  = replace(var.name, local.filter_alphanumhu, "")
    alphanumh   =   replace(var.name, local.filter_alphanumh, "")
  }
  filteredpostfix = {
    alphanum    = replace(var.postfix, local.filter_alphanum, "")
    alphanumhup = replace(var.postfix, local.filter_alphanumhup, "")
    alphanumhu  = replace(var.postfix, local.filter_alphanumhu, "")
    alphanumh   = replace(var.postfix, local.filter_alphanumh, "")
  }
}

#generic outputs
locals {
  fullyrandom = (var.convention == "random" || var.convention == "cafrandom")  == true ? substr(random_string.fullrandom[0].result, 0, local.max) : null
}
