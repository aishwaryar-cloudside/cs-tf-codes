terraform {
  backend "gcs" {
    bucket = "bkt-cs-mgmt-tfstate"
    prefix = "mgmt/networking/firewall/fw-qa-shared"
  }
}