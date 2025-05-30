module "psc-cs-prod" {
  source           = "../../../../../modules/networking/private-service-connection"
  address          = "10.60.0.0"
  prefix_length    = "21"
  project_id       = var.project_id
  network_name     = "cs-vpc-prod-shared"
  pvt_svc_name     = "psc-cs-prod-global-01"
  peering_name     = "servicenetworking-googleapis-com"
  import_custom_routes = true
  export_custom_routes = true
}