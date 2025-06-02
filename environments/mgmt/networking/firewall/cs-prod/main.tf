module "firewall_policy" {
  source       = "../../../../../modules/networking/firewall_policy"
  
  project_id    = var.project_id
  network_name  = "projects/${var.project_id}/global/networks/${var.vpc_name}"
  ingress_rules = [
  {
    name                    = "fw-prod-shared-ssh-iap"
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
    name                    = "fw-prod-shared-http-public"
    description             = "HTTP access to public for ${var.env}"
    direction               = "INGRESS"
    disabled                = false
    priority                = "102"
    source_ranges           = ["0.0.0.0/0"]
    source_tags             = null
    source_service_accounts = null
    target_tags             = null
    target_service_accounts = null
    allow = [{
      protocol = "tcp"
      ports    = ["80", "443"]
    }]
    deny = []
  },
  {
    name                    = "fw-prod-shared-health-check-gcp"
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
      protocol = "all"
      ports    = []
    }]
    deny = []
  }
  ]
}