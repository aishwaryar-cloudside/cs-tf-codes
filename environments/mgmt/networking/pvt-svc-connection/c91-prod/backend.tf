terraform {
  backend "gcs" {
    bucket = "bkt-c91-mgmt-tfstate"
    prefix = "mgmt/networking/pvt-svc-connection/psc-c91-prod-global-01"
  }
}