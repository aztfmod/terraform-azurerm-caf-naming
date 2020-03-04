locals {
    convention = "cafrandom"
    name = "caftestarnaud-w"
    location = "southeastasia"
    prefix = "test"
    resource_groups = {
        test = { 
            name     = basename(abspath(path.module))
            location = "southeastasia" 
        },
    }
    tags = {
        environment     = "DEV"
        owner           = "CAF"
    }

    sku = "Premium"
    georeplication_locations = ["eastasia", "eastus2"]
    admin_enabled = true
}