module "cloudnat" {
    source = "../../../../../modules/networking/nat_gw"
    project_id = var.project_id
    region = var.region
    natgw_name = "nat-card91-mgmt-apps-ass1-01"
    router_name = "cr-card91-mgmt-apps-ass1-01"
    nat_ips = [ "ip-card91-mgmt-nat-ass1-01" ]
    depends_on = [module.google_compute_external_address, module.router]
}

module "router" {
    source = "../../../../../modules/networking/router"
    router_name = "cr-card91-mgmt-apps-ass1-01"
    project_id = var.project_id
    region = var.region
    network_name = "card91-vpc-mgmt-shared"
}

module "google_compute_external_address" {
    source = "../../../../../modules/networking/google_compute_address"
    address_name = "ip-card91-mgmt-nat-ass1"
    number_of_addresses = 1
    description = "Its VPC NAT IPs for External communication"
    region = var.region
}