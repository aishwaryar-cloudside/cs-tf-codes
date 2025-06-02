module sn-c91-dev-ass1{
    source  = "../../../../../modules/networking/subnets/"
    project_id = var.project_id
    network_name = var.network_name

    subnets = [
        {
            subnet_name           = "sn-c91-dev-ass1-apps-01"
            subnet_ip             = var.app_subnet_cidr
            subnet_region         = var.region
            description           = "This subnet for shared apps"
        },
        {
            subnet_name           = "sn-c91-dev-ass1-web-01"
            subnet_ip             = var.web_subnet_cidr
            subnet_region         = var.region
            description           = "This subnet for web"
        },
        {
            subnet_name           = "sn-c91-dev-ass1-db-01"
            subnet_ip             = var.db_subnet_cidr
            subnet_region         = var.region
            description           = "This subnet for backend db"
        },
        {
            subnet_name           = "sn-c91-dev-ass1-ilb-01"
            subnet_ip             = var.ilb_subnet_cidr
            subnet_region         = var.region
            purpose               = "INTERNAL_HTTPS_LOAD_BALANCER"
            role                  = "ACTIVE"
            description           = "This subnet for Internal https lb"
            subnet_private_access = false
        }
    ]

    secondary_ranges = {
        "sn-c91-dev-ass1-apps-01" = [
            {
                range_name    = "sn-c91-dev-ass1-apps-gpod1"
                ip_cidr_range = var.app_sc_subnet_cidr_pod
            },
            {
                range_name    = "sn-c91-dev-ass1-apps-gsvc1"
                ip_cidr_range = var.app_sc_subnet_cidr_svc
            }
        ]
    }
}