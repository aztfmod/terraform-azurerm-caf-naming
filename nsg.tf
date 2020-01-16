## network security group
locals {
  # alphanum 1-80 with hypen, underscore and period.
    nsg = {
      passthrough = (var.type == "nsg" && var.convention == "passthrough") ? substr(local.filtered.alphanumhup, 0, local.max) : null
      cafclassic  = (var.type == "nsg" && var.convention == "cafclassic") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanumhup}${local.filteredpostfix.alphanumhup}", 0, local.max) : null
      cafrandom   = (var.type == "nsg" && var.convention == "cafrandom") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanumhup}${local.filteredpostfix.alphanumhup}${local.fullyrandom}", 0, local.max) : null 
      random      = (var.type == "nsg" && var.convention == "random") ? substr(local.fullyrandom, 0, local.max) : null
    }
 }
output "nsg" {
  depends_on = [local.nsg]
  value = local.nsg[var.convention]
}