## azure automation account 
locals {
    # Alphanumeric, hyphen. Must start with a letter.
    aaa = {
        passthrough = (var.type == "aaa" && var.convention == "passthrough") ? substr(local.filtered_extend.alphanumh_startletter, 0, local.max) : null
        cafclassic  = (var.type == "aaa" && var.convention == "cafclassic") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanumh}-${local.filteredpostfix.alphanumh}", 0, local.max) : null
        cafrandom   = (var.type == "aaa" && var.convention == "cafrandom") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanumh}-${local.filteredpostfix.alphanumh}${local.fullyrandom_startletter}", 0, local.max) : null 
        random      = (var.type == "aaa" && var.convention == "random") ? substr(local.fullyrandom_startletter, 0, local.max) : null
    }
 }

output "aaa" {
    depends_on = [local.aaa]
    value = local.aaa[var.convention]
}