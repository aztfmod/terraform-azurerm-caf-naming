# caf_naming_vm - cafrandom method

Creates a Linux VM using Cloud Adoption Framework naming convention module 

## Usage
To run this example, simply execute: 

```hcl
terraform init
terraform plan
terraform apply
```

Once you are done, just run 
```hcl
terraform destroy
```

## Outputs
| Name | Description |
| --   | -- |
| vm_name | Returns the name of the created vm | 
| caf_name | Returns the name as given by the CAF module, before being sent to storage account creation |