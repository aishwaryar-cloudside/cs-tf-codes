module "c91_shared_vpc" {
  source = "../../../../../modules/networking/shared-vpc"
  host_project_id = var.host_project_id
  service_projects = var.service_projects
}