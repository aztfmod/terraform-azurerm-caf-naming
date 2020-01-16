## public IP address
locals {
  # alphanum 1-80 with hypen, underscore and period.
    pip = {
      passthrough = (var.type == "pip" && var.convention == "passthrough") ? substr(local.filtered.alphanumhup, 0, local.max) : null
      cafclassic  = (var.type == "pip" && var.convention == "cafclassic") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanumhup}${local.filteredpostfix.alphanumhup}", 0, local.max) : null
      cafrandom   = (var.type == "pip" && var.convention == "cafrandom") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanumhup}${local.filteredpostfix.alphanumhup}${local.fullyrandom}", 0, local.max) : null 
      random      = (var.type == "pip" && var.convention == "random") ? substr(local.fullyrandom, 0, local.max) : null
    }
 }
output "pip" {
  depends_on = [local.pip]
  value = local.pip[var.convention]
}