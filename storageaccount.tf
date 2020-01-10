## storageaccount
locals {
  #lowercase alphanum 3-24
    st = {
      passthrough = (var.type == "st" && var.convention == "passthrough") ? substr(local.filtered.alphanum, 0, local.max) : null
      cafclassic  = (var.type == "st" && var.convention == "cafclassic") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanum}${local.filteredpostfix.alphanum}", 0, local.max) : null
      cafrandom   = (var.type == "st" && var.convention == "cafrandom") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanum}${local.filteredpostfix.alphanum}${local.fullyrandom}", 0, local.max) : null 
      random      = (var.type == "st" && var.convention == "random") ? substr(local.fullyrandom, 0, local.max) : null
    }
 }
output "st" {
  depends_on = [local.st]
  value = local.st[var.convention]
}