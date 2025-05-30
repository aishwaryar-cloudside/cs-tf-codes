module "c91_vpc_mgmt" {
  source       = "../../../../../modules/networking/vpc"
  vpc_name     = "c91-vpc-mgmt"
  project_id   = var.project_id
  description  = "vpc network for MGMT"
  routing_mode = "GLOBAL"
  auto_create_subnetworks       = false
  delete_default_routes_on_create   = false
}
