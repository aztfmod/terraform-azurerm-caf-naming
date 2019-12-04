## log analytics
 locals {
  #the name should include 4-63 letters, digits or hyphen
    la = {
      passthrough = (var.type == "la" && var.convention == "passthrough") ? substr(local.filtered.alphanumh, 0, local.max) : null
      cafclassic  = (var.type == "la" && var.convention == "cafclassic") ? substr("${lookup(var.caf_prefix, var.type)}-${local.filtered.alphanumh}-${local.filteredpostfix.alphanumh}", 0, local.max) : null
      cafrandom   = (var.type == "la" && var.convention == "cafrandom") ? substr("${lookup(var.caf_prefix, var.type)}-${local.filtered.alphanumh}-${local.filteredpostfix.alphanumh}-${local.fullyrandom}", 0, local.max) : null
      random      = (var.type == "la" && var.convention == "random") ? substr(local.fullyrandom, 0, local.max) : null
    }
 }
 output "la" {
  depends_on = [local.la]
  value = local.la[var.convention]
}