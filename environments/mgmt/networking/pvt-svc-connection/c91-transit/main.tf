module "psc-c91-transit" {
  source           = "../../../../../modules/networking/private-service-connection"
  address          = "10.38.0.0"
  prefix_length    = "21"
  project_id       = var.project_id
  network_name     = "c91-vpc-transit"
  pvt_svc_name     = "psc-c91-transit-global-01"
  peering_name     = "servicenetworking-googleapis-com"
  import_custom_routes = true
  export_custom_routes = true
}