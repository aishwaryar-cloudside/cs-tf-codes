module "psc-cs-uat" {
  source           = "../../../../../modules/networking/private-service-connection"
  address          = "10.30.0.0"
  prefix_length    = "21"
  project_id       = var.project_id
  network_name     = "cs-vpc-uat-shared"
  pvt_svc_name     = "psc-cs-uat-global-01"
  peering_name     = "servicenetworking-googleapis-com"
  import_custom_routes = true
  export_custom_routes = true
}