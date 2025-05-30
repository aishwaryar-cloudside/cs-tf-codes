module "c91_vpc_prod" {
  source       = "../../../../../modules/networking/vpc"
  vpc_name     = "c91-vpc-prod-shared"
  project_id   = var.project_id
  description  = "vpc network for PROD"
  routing_mode = "GLOBAL"
  auto_create_subnetworks       = false
  delete_default_routes_on_create   = false
}
