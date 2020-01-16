## windows vm
locals {
    # Alphanumeric, hyphen. Must start with a letter.
    vmw = {
        passthrough = (var.type == "vmw" && var.convention == "passthrough") ? substr(local.filtered_extend.alphanumh_startletter, 0, local.max) : null
        cafclassic  = (var.type == "vmw" && var.convention == "cafclassic") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanumh}${local.filteredpostfix.alphanumh}", 0, local.max) : null
        cafrandom   = (var.type == "vmw" && var.convention == "cafrandom") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanumh}${local.filteredpostfix.alphanumh}${local.fullyrandom_startletter}", 0, local.max) : null 
        random      = (var.type == "vmw" && var.convention == "random") ? substr(local.fullyrandom_startletter, 0, local.max) : null
    }
 }

## linux vm
 locals {
    # Alphanumeric, hyphen. Must start with a letter.
    vml = {
        passthrough = (var.type == "vml" && var.convention == "passthrough") ? substr(local.filtered_extend.alphanumh_startletter, 0, local.max) : null
        cafclassic  = (var.type == "vml" && var.convention == "cafclassic") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanumh}${local.filteredpostfix.alphanumh}", 0, local.max) : null
        cafrandom   = (var.type == "vml" && var.convention == "cafrandom") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanumh}${local.filteredpostfix.alphanumh}${local.fullyrandom_startletter}", 0, local.max) : null 
        random      = (var.type == "vml" && var.convention == "random") ? substr(local.fullyrandom_startletter, 0, local.max) : null
    }
 }

output "vmw" {
    depends_on = [local.vmw]
    value = local.vmw[var.convention]
}

output "vml" {
    depends_on = [local.vml]
    value = local.vml[var.convention]
}