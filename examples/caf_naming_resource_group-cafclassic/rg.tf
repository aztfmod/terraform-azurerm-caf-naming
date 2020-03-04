module "caf_name_rg" {
  source  = "../.."

  name    = local.name
  type    = "rg"
  convention  = local.convention
}