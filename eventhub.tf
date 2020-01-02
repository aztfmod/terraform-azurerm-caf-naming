## eventhub
locals {
  # Alphanumeric, period, hyphen, underscore. Must start and end with a letter or number.
    evh = {
      passthrough = (var.type == "evh" && var.convention == "passthrough") ? substr(local.filtered.alphanumhu, 0, local.max) : null
      cafclassic  = (var.type == "evh" && var.convention == "cafclassic") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanum}${local.filteredpostfix.alphanum}", 0, local.max) : null
      cafrandom   = (var.type == "evh" && var.convention == "cafrandom") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanum}${local.filteredpostfix.alphanum}${local.fullyrandom}", 0, local.max) : null 
      random      = (var.type == "evh" && var.convention == "random") ? substr(local.fullyrandom_startletter, 0, local.max) : null
    }
 }
output "evh" {
  depends_on = [local.evh]
  value = local.evh[var.convention]
}