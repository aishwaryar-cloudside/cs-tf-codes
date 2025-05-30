module "c91_vpc_transit" {
  source       = "../../../../../modules/networking/vpc"
  vpc_name     = "c91-vpc-transit"
  project_id   = var.project_id
  description  = "vpc network for Transit"
  routing_mode = "GLOBAL"
  auto_create_subnetworks       = false
  delete_default_routes_on_create   = false
}
