## virtual network
locals {
  # alphanum 1-80 with hypen, underscore and period.
    vnet = {
      passthrough = (var.type == "vnet" && var.convention == "passthrough") ? substr(local.filtered.alphanumhup, 0, local.max) : null
      cafclassic  = (var.type == "vnet" && var.convention == "cafclassic") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanumhup}${local.filteredpostfix.alphanumhup}", 0, local.max) : null
      cafrandom   = (var.type == "vnet" && var.convention == "cafrandom") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanumhup}${local.filteredpostfix.alphanumhup}${local.fullyrandom}", 0, local.max) : null 
      random      = (var.type == "vnet" && var.convention == "random") ? substr(local.fullyrandom, 0, local.max) : null
    }
 }
output "vnet" {
  depends_on = [local.vnet]
  value = local.vnet[var.convention]
}