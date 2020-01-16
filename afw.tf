## azure firewall
locals {
    # The name must begin with a letter or number, end with a letter, number or underscore, and may contain only letters, numbers, underscores, periods, or hyphens. 
    # The name must be between 1 and 80 characters.
    afw = {
        passthrough = (var.type == "afw" && var.convention == "passthrough") ? substr(local.filtered_extend.alphanumhup_startletter, 0, local.max) : null
        cafclassic  = (var.type == "afw" && var.convention == "cafclassic") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanumhup}-${local.filteredpostfix.alphanumhup}", 0, local.max) : null
        cafrandom   = (var.type == "afw" && var.convention == "cafrandom") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanumhup}-${local.filteredpostfix.alphanumhup}${local.fullyrandom_startletter}", 0, local.max) : null 
        random      = (var.type == "afw" && var.convention == "random") ? substr(local.fullyrandom_startletter, 0, local.max) : null
    }
 }

output "afw" {
    depends_on = [local.afw]
    value = local.afw[var.convention]
}