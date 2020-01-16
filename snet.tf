## virtual subnet
locals {
  # alphanum 1-80 with hypen, underscore and period.
    snet = {
      passthrough = (var.type == "snet" && var.convention == "passthrough") ? substr(local.filtered.alphanumhup, 0, local.max) : null
      cafclassic  = (var.type == "snet" && var.convention == "cafclassic") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanumhup}${local.filteredpostfix.alphanumhup}", 0, local.max) : null
      cafrandom   = (var.type == "snet" && var.convention == "cafrandom") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanumhup}${local.filteredpostfix.alphanumhup}${local.fullyrandom}", 0, local.max) : null 
      random      = (var.type == "snet" && var.convention == "random") ? substr(local.fullyrandom, 0, local.max) : null
    }
 }
output "snet" {
  depends_on = [local.snet]
  value = local.snet[var.convention]
}