resource "random_string" "fullrandom" {
  # count = (var.convention == "random" || var.convention == "cafrandom" )  == true ? 1 : 0
  length  = local.max
  special = false
  lower   = true
  upper   = false
}

resource "random_string" "singlechar" {
  length  = 1
  special = false
  number = false
  upper = false
}

resource "random_string" "singlealphanum" {
  length  = 1
  special = false
  number = true
  upper = false
}

# random
locals {
  random                = random_string.fullrandom.result
  singlerandom_letter   = random_string.singlechar.result
  singlerandom_alphanum = random_string.singlealphanum.result
} 

# regexes and charset filters
locals {
  filter_alphanum= "/[^0-9A-Za-z]/"
  filter_alphanumh   = "/[^0-9A-Za-z,-]/"
  filter_alphanumu   = "/[^0-9A-Za-z,_]/"
  filter_alphanumhu  = "/[^0-9A-Za-z,_,-]/"
  filter_alphanumhup = "/[^0-9A-Za-z,_,.,-]/"
  filter_startletter = "/\\A[^a-z]/"
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
    alphanumh   = replace(var.name, local.filter_alphanumh, "")
  }
  filteredpostfix = {
    alphanum    = replace(var.postfix, local.filter_alphanum, "")
    alphanumhup = replace(var.postfix, local.filter_alphanumhup, "")
    alphanumhu  = replace(var.postfix, local.filter_alphanumhu, "")
    alphanumh   = replace(var.postfix, local.filter_alphanumh, "")
  }
}

locals {
  filtered_extend = {
    alphanumh_startletter = replace(local.filtered.alphanumh, local.filter_startletter, local.singlerandom_letter)
  }
}

#generic outputs
locals {
  fullyrandom             = (var.convention == "random" || var.convention == "cafrandom")  == true ? substr(local.random, 0, local.max) : null
  fullyrandom_startletter = (var.convention == "random" || var.convention == "cafrandom")  == true ? substr("${local.singlerandom_letter}${local.random}", 0, local.max) : null
}
