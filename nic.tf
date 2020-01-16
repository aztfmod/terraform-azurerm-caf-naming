## network interface card
locals {
  # alphanum 1-80 with hypen, underscore and period.
    nic = {
      passthrough = (var.type == "nic" && var.convention == "passthrough") ? substr(local.filtered.alphanumhup, 0, local.max) : null
      cafclassic  = (var.type == "nic" && var.convention == "cafclassic") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanumhup}${local.filteredpostfix.alphanumhup}", 0, local.max) : null
      cafrandom   = (var.type == "nic" && var.convention == "cafrandom") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanumhup}${local.filteredpostfix.alphanumhup}${local.fullyrandom}", 0, local.max) : null 
      random      = (var.type == "nic" && var.convention == "random") ? substr(local.fullyrandom, 0, local.max) : null
    }
 }
output "nic" {
  depends_on = [local.nic]
  value = local.nic[var.convention]
}