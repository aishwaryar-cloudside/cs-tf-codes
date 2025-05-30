module "c91_vpc_dev" {
  source       = "../../../../../modules/networking/vpc"
  vpc_name     = "c91-vpc-dev-shared"
  project_id   = var.project_id
  description  = "vpc network for dev"
  routing_mode = "GLOBAL"
  auto_create_subnetworks       = false
  delete_default_routes_on_create   = false
}
