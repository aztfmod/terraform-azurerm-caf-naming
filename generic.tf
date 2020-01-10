# generic output
locals {

    gen = {
      passthrough = (var.type == "gen" && var.convention == "passthrough") ? substr(local.filtered.alphanum, 0, local.max) : null
      cafclassic  = (var.type == "gen" && var.convention == "cafclassic") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanum}${local.filteredpostfix.alphanum}", 0, local.max) : null
      cafrandom   = (var.type == "gen" && var.convention == "cafrandom") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanum}${local.filteredpostfix.alphanum}${local.fullyrandom}", 0, local.max) : null 
      random      = (var.type == "gen" && var.convention == "random") ? substr(local.fullyrandom, 0, local.max) : null
    }
 }
output "gen" {
  depends_on = [local.gen]
  value = local.gen[var.convention]
}