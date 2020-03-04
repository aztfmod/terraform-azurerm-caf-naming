locals {
    convention = "passthrough"
    name = "caftest&&#wqsa"
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

}