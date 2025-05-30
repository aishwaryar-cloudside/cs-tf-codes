module "vpn_ha-1" {
  source                           = "../../../../../modules/networking/vpn/ha-vpn"
  project_id                       = var.project_id
  region                           = var.region
  network                          = var.network_name
  region_code                      = var.region_code
  name                             = "ha-vpn-gw-${var.env}-to-aws-${var.region_code}-01"
  env                              = var.env
}