terraform {
  backend "gcs" {
    bucket = "bkt-card91-mgmt-tfstate"
    prefix = "mgmt/networking/firewall/fw-mgmt"
  }
}