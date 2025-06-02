module "firewall_policy" {
  source       = "../../../../../modules/networking/firewall_policy"
  
  project_id    = var.project_id
  network_name  = "projects/${var.project_id}/global/networks/${var.vpc_name}"
  ingress_rules = [
  {
    name                    = "fw-uat-shared-ssh-iap"
    description             = "SSH access via IAP for ${var.env}"
    direction               = "INGRESS"
    disabled                = false
    priority                = "101"
    source_ranges           = ["35.235.240.0/20"]
    source_tags             = null
    source_service_accounts = null
    target_tags             = null
    target_service_accounts = null
    allow = [{
      protocol = "tcp"
      ports    = ["22"]
    }]
    deny = []
  },
  {
    name                    = "fw-uat-shared-http-public"
    description             = "HTTP access to public for ${var.env}"
    direction               = "INGRESS"
    disabled                = false
    priority                = "102"
    source_ranges           = ["0.0.0.0/0"]
    source_tags             = null
    source_service_accounts = null
    target_tags             = ["allow-http-https"]
    target_service_accounts = null
    allow = [{
      protocol = "tcp"
      ports    = ["80", "443"]
    }]
    deny = []
  },
  {
    name                    = "fw-uat-shared-health-check-gcp"
    description             = "Allow GCP Health Check probes for ${var.env}"
    direction               = "INGRESS"
    disabled                = false
    priority                = "103"
    source_ranges           = ["209.85.204.0/22", "209.85.152.0/22", "130.211.0.0/22", "35.191.0.0/16"]
    source_tags             = null
    source_service_accounts = null
    target_tags             = null
    target_service_accounts = null
    allow = [{
      protocol = "tcp"
      ports    = ["0-65535"]
    }]
    deny = []
  },
  {
    name                    = "fw-uat-shared-allow-kafka"
    description             = "Allow GCP Kafka for ${var.env}"
    direction               = "INGRESS"
    disabled                = false
    priority                = "104"
    source_ranges           = ["10.24.0.0/16"]
    source_tags             = null
    source_service_accounts = null
    target_tags             = null
    target_service_accounts = null
    allow = [
      {
        protocol = "tcp"
        ports    = ["9092"]
      }
    ]
    deny = []
  },
  {
    name                    = "fw-transit-ingress"
    description             = ""
    direction               = "INGRESS"
    disabled                = false
    priority                = "1000"
    source_ranges           = ["10.37.0.0/24"]
    source_tags             = null
    source_service_accounts = null
    target_tags             = null
    target_service_accounts = null
    allow = [
      {
        protocol = "tcp"
        ports    = ["3306"]
      }
    ]
    deny = []
  },
  {
    name                    = "fw-ds-vm-ingress"
    description             = ""
    direction               = "INGRESS"
    disabled                = false
    priority                = "1000"
    source_ranges           = ["10.128.0.0/24"]
    destination_ranges      = ["10.24.47.203/32", "10.24.47.202/32"]
    source_tags             = null
    source_service_accounts = null
    target_tags             = null
    target_service_accounts = null
    allow = [
      {
        protocol = "tcp"
        ports    = ["22", "3306", "3308", "3309", "3310", "3311", "3312", "3313", "3314","3315","3316","3317","3318","3319"]
      }
    ]
    deny = []
  },
  {
    name                    = "fw-transit-aws-ingress"
    description             = ""
    direction               = "INGRESS"
    disabled                = false
    priority                = "1000"
    source_ranges           = ["8.0.0.0/16", "9.0.0.0/16", "172.31.0.0/16", "172.32.0.0/16"]
    source_tags             = null
    source_service_accounts = null
    target_tags             = null
    target_service_accounts = null
    allow = [
      {
        protocol = "tcp"
        ports    = ["3306","22"]
      },
      {
        protocol = "icmp"
      }
    ]
    deny = []
  },
  {
    name                    = "allow-sql"
    description             = ""
    direction               = "INGRESS"
    disabled                = false
    priority                = "1000"
    source_ranges           = ["34.126.64.172", "34.87.56.130", "35.240.226.116", "35.186.145.36", "34.87.108.57", "10.24.32.0/20"]
    source_tags             = null
    source_service_accounts = null
    target_tags             = null
    target_service_accounts = null
    allow = [
      {
        protocol = "tcp"
        ports    = ["3306"]
      }
    ]
    deny = []
  },
  {
    name                    = "fw-experio-ingress"
    description             = ""
    direction               = "INGRESS"
    disabled                = false
    priority                = "1000"
    source_ranges           = ["10.48.1.0/24", "10.48.2.0/24", "10.99.100.8/30", "10.99.100.248/29", "10.99.100.251/32", "10.99.100.252/32", "10.99.101.40/32", "192.168.0.0/23", "10.99.100.12/30", "10.99.100.4/30"]
    source_tags             = null
    source_service_accounts = null
    target_tags             = null
    target_service_accounts = null
    allow = [
      {
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
    name                    = "allow-datastream"
    description             = ""
    direction               = "INGRESS"
    disabled                = false
    priority                = "1000"
    source_ranges           = ["34.87.56.130/32", "35.186.145.36/32", "35.240.226.116/32", "34.87.108.57/32", "34.126.64.172/32"]
    source_tags             = null
    source_service_accounts = null
    target_tags             = null
    target_service_accounts = null
    allow = [
      {
        protocol = "tcp"
        ports    = ["3306"]
      }
    ]
    deny = []
  },
  {
    name                    = "fw-gke-ingress"
    description             = ""
    direction               = "INGRESS"
    disabled                = false
    priority                = "1000"
    source_ranges           = ["172.16.0.130/32"]
    source_tags             = null
    source_service_accounts = null
    target_tags             = null
    target_service_accounts = null
    allow = [
      {
        protocol = "all"
        ports    = []
      }
    ]
    deny = []
  },
  {
    name                    = "fw-allow-port-15017"
    description             = ""
    direction               = "INGRESS"
    disabled                = false
    priority                = "1000"
    source_ranges           = ["0.0.0.0/0"]
    source_tags             = null
    source_service_accounts = null
    target_tags             = null
    target_service_accounts = null
    allow = [
      {
        protocol = "tcp"
        ports    = ["15017"]
      }
    ]
    deny = []
  },
  {
    name                    = "fw-allow-port-8850"
    description             = "For Tableu Server"
    direction               = "INGRESS"
    disabled                = false
    priority                = "1000"
    source_ranges           = ["122.248.228.37/32"]
    source_tags             = null
    source_service_accounts = null
    target_tags             = null
    target_service_accounts = null
    allow = [
      {
        protocol = "tcp"
        ports    = ["8850","80","443"]
      }
    ]
    deny = []
  },
  {
    name                    = "fw-allow-tabelu-proxies"
    description             = "For Tableu Server"
    direction               = "INGRESS"
    disabled                = false
    priority                = "1000"
    source_ranges           = ["10.24.48.0/20"]
    source_tags             = null
    source_service_accounts = null
    target_tags             = null
    target_service_accounts = null
    allow = [
      {
        protocol = "tcp"
        ports    = ["80", "443", "8080"]
      }
    ]
    deny = []
  },
  {
    name                    = "fw-allow-tabelu-healthcheck"
    description             = "For Tableu Server"
    direction               = "INGRESS"
    disabled                = false
    priority                = "1000"
    source_ranges           = ["130.211.0.0/22", "35.191.0.0/16"]
    source_tags             = null
    source_service_accounts = null
    target_tags             = ["cs-tableau-backend-service"]
    target_service_accounts = null
    allow = [
      {
        protocol = "tcp"
        ports    = ["80", "443"]
      }
    ]
    deny = []
  },
  {
    name                    = "fw-composer-to-tabelu"
    description             = ""
    direction               = "INGRESS"
    disabled                = false
    priority                = "1000"
    source_ranges           = ["10.24.32.0/20"]
    destination_ranges      = ["10.24.16.43/32"]
    source_tags             = null
    source_service_accounts = null
    target_tags             = null
    target_service_accounts = null
    allow = [
      {
        protocol = "tcp"
        ports    = ["80", "443"]
      }
    ]
    deny = []
  },
  {
    name                    = "fw-gke-pod-to-primary-range"
    description             = ""
    direction               = "INGRESS"
    disabled                = false
    priority                = "1000"
    source_ranges           = ["10.149.0.0/16"]
    source_tags             = null
    source_service_accounts = null
    target_tags             = null
    target_service_accounts = null
    allow = [
      {
        protocol = "tcp"
        ports    = ["80", "443"]
      },
      {
        protocol = "icmp"
      }
    ]
    deny = []
  }
  ]

### EGRESS RULE
  egress_rules = [
  {
    name                    = "fw-egress-vm-sql-ds"
    description             = ""
    direction               = "EGRESS"
    disabled                = false
    priority                = "1000"
    source_ranges           = ["10.24.47.203/32"]
    destination_ranges      = ["10.30.0.0/21"]
    source_tags             = null
    source_service_accounts = null
    target_tags             = null
    target_service_accounts = null
    allow = [
      {
        protocol = "tcp"
        ports    = ["3306", "3308", "22", "3309", "3310", "3311", "3312", "3313", "3314"]
      }
    ]
    deny = []
  },
  {
    name                    = "fw-transit-aws-egress"
    description             = ""
    direction               = "INGRESS"
    disabled                = false
    priority                = "1000"
    destination_ranges      = ["8.0.0.0/16", "9.0.0.0/16", "172.31.0.0/16", "172.32.0.0/16"]
    source_tags             = null
    source_service_accounts = null
    target_tags             = null
    target_service_accounts = null
    allow = [
      {
        protocol = "tcp"
        ports    = ["3306","22"]
      },
      {
        protocol = "icmp"
      }
    ]
    deny = []
  }
  ]
}