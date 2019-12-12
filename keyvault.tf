## keyvault
locals {
    # Alphanumeric, hyphen. Must start with a letter.
    kv = {
        passthrough = (var.type == "kv" && var.convention == "passthrough") ? substr(local.filtered_extend.alphanumh_startletter, 0, local.max) : null
        cafclassic  = (var.type == "kv" && var.convention == "cafclassic") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanumh}-${local.filteredpostfix.alphanumh}", 0, local.max) : null
        cafrandom   = (var.type == "kv" && var.convention == "cafrandom") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanumh}-${local.filteredpostfix.alphanumh}-${local.fullyrandom_startletter}", 0, local.max) : null 
        random      = (var.type == "kv" && var.convention == "random") ? substr(local.fullyrandom_startletter, 0, local.max) : null
    }
 }

output "kv" {
    depends_on = [local.kv]
    value = local.kv[var.convention]
}