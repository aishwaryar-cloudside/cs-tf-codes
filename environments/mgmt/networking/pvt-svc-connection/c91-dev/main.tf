module "psc-c91-dev" {
  source           = "../../../../../modules/networking/private-service-connection"
  address          = "10.65.0.0"
  prefix_length    = "21"
  project_id       = var.project_id
  network_name     = "c91-vpc-dev-shared"
  pvt_svc_name     = "psc-c91-dev-global-01"
  peering_name     = "servicenetworking-googleapis-com"
  import_custom_routes = true
  export_custom_routes = true
}