## azure container registry
locals {
    # Resource names may contain alpha numeric characters only and must be between 5 and 50 characters.
    acr = {
        passthrough = (var.type == "acr" && var.convention == "passthrough") ? substr(local.filtered_extend.alphanum_startletter, 0, local.max) : null
        cafclassic  = (var.type == "acr" && var.convention == "cafclassic") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanum}${local.filteredpostfix.alphanum}", 0, local.max) : null
        cafrandom   = (var.type == "acr" && var.convention == "cafrandom") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanum}${local.filteredpostfix.alphanum}${local.fullyrandom_startletter}", 0, local.max) : null 
        random      = (var.type == "acr" && var.convention == "random") ? substr(local.fullyrandom_startletter, 0, local.max) : null
    }
 }

output "acr" {
    depends_on = [local.acr]
    value = local.acr[var.convention]
}