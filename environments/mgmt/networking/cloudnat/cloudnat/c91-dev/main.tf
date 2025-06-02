module "cloudnat" {
    source = "../../../../../modules/networking/nat_gw"
    project_id = var.project_id
    region = var.region
    natgw_name = "nat-c91-dev-apps-ass1-01"
    router_name = "cr-c91-dev-apps-ass1-01"
    nat_ips = [ "ip-c91-dev-nat-ass1-01" ]
    depends_on = [module.google_compute_external_address, module.router]
}

module "router" {
    source = "../../../../../modules/networking/router"
    router_name = "cr-c91-dev-apps-ass1-01"
    project_id = var.project_id
    region = var.region
    network_name = "c91-vpc-dev-shared"
}

module "google_compute_external_address" {
    source = "../../../../../modules/networking/google_compute_address"
    address_name = "ip-c91-dev-nat-ass1"
    number_of_addresses = 1
    description = "Its VPC NAT IPs for External communication"
    region = var.region
}