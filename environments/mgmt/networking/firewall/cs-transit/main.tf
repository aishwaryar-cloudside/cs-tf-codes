module "firewall_policy" {
  source       = "../../../../../modules/networking/firewall_policy"
  
  project_id    = var.project_id
  network_name  = "projects/${var.project_id}/global/networks/${var.vpc_name}"
  ingress_rules = [
  {
    name                    = "ingress-transit-test"
    description             = ""
    direction               = "INGRESS"
    disabled                = false
    priority                = "1000"
    source_ranges           = ["10.48.0.0/24", "10.48.1.0/24", "10.48.2.0/24", "10.99.100.8/30", "10.99.100.248/29", "10.99.100.251/32", "10.99.100.252/32", "10.99.101.40/32", "192.168.0.0/23", "10.99.100.12/30", "10.99.100.4/30"]
    source_tags             = null
    source_service_accounts = null
    target_tags             = null
    target_service_accounts = null
    allow = [{
      protocol = "tcp"
      ports    = ["22"]
    },
    {
      protocol = "icmp"
    }
    ]
    deny = []
  },
  {
    name                    = "fw-aws-ingress"
    description             = ""
    direction               = "INGRESS"
    disabled                = false
    priority                = "1000"
    source_ranges           = ["8.0.0.0/16", "9.0.0.0/16", "172.31.0.0/16", "172.32.0.0/16"]
    source_tags             = null
    source_service_accounts = null
    target_tags             = null
    target_service_accounts = null
    allow = [{
      protocol = "tcp"
      ports    = ["3306"]
    }
    ]
    deny = []
  },
  {
    name                    = "fw-uat-transit-ingress"
    description             = ""
    direction               = "INGRESS"
    disabled                = false
    priority                = "1000"
    source_ranges           = ["10.24.32.0/20", "10.30.0.0/21"]
    source_tags             = null
    source_service_accounts = null
    target_tags             = null
    target_service_accounts = null
    allow = [{
      protocol = "tcp"
      ports    = ["3306"]
    },
    {
      protocol = "icmp"
    }
    ]
    deny = []
  },
  {
    name                    = "fw-ssh-ingress-test"
    description             = ""
    direction               = "INGRESS"
    disabled                = false
    priority                = "1000"
    source_ranges           = ["35.235.240.0/20"]
    source_tags             = null
    source_service_accounts = null
    target_tags             = null
    target_service_accounts = null
    allow = [{
      protocol = "tcp"
      ports    = ["22"]
    },
    {
      protocol = "icmp"
    }
    ]
    deny = []
  },
  ]

  egress_rules = [
    {
      name = "fw-aws-egress"
      description = ""
      direction = "Egress"
      disabled = false 
      priority = "1000"
      destination_ranges = ["8.0.0.0/16","9.0.0.0/16", "172.31.0.0/16", "172.32.0.0/16"]
      allow = [{
        protocol = "tcp"
        ports    = ["3306"]
      }]
    },
    {
      name = "fw-experio-egress"
      description = ""
      direction = "Egress"
      disabled = false 
      priority = "1000"
      destination_ranges = ["10.48.0.0/24", "10.48.1.0/24", "10.48.2.0/24", "10.99.100.8/30", "10.99.100.248/29", "10.99.100.251/32", "10.99.100.252/32", "10.99.101.40/32", "192.168.0.0/23", "10.99.100.12/30", "10.99.100.4/30"]
      allow = [{
        protocol = "tcp"
        ports    = ["22"]
      },
      {
        protocol = "icmp"
      }
      ]
    },
    {
      name = "fw-transit-uat-egress"
      description = ""
      direction = "Egress"
      disabled = false 
      priority = "1000"
      destination_ranges = ["10.24.32.0/20","10.30.0.0/21"]
      allow = [{
        protocol = "tcp"
        ports    = ["3306"]
      }
      ]
    }
  ]
}