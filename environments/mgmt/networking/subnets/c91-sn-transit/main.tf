module sn-c91-transit-ass1{
    source  = "../../../../../modules/networking/subnets/"
    project_id = var.project_id
    network_name = var.network_name

    subnets = [
        {
            subnet_name           = "sn-c91-transit-ass1-01"
            subnet_ip             = var.transit_subnet_cidr
            subnet_region         = var.region
            description           = "This is subnet for Transit gateway for the VPN connections"
        },
    ]
}