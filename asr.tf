## azure site recovery
locals {
    # Alphanumeric, hyphen. Must start with a letter.
    asr = {
        passthrough = (var.type == "asr" && var.convention == "passthrough") ? substr(local.filtered_extend.alphanumh_startletter, 0, local.max) : null
        cafclassic  = (var.type == "asr" && var.convention == "cafclassic") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanumh}-${local.filteredpostfix.alphanumh}", 0, local.max) : null
        cafrandom   = (var.type == "asr" && var.convention == "cafrandom") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanumh}-${local.filteredpostfix.alphanumh}${local.fullyrandom_startletter}", 0, local.max) : null 
        random      = (var.type == "asr" && var.convention == "random") ? substr(local.fullyrandom_startletter, 0, local.max) : null
    }
 }

output "asr" {
    depends_on = [local.asr]
    value = local.asr[var.convention]
}