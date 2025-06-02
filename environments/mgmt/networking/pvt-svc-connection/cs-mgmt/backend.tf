terraform {
  backend "gcs" {
    bucket = "bkt-cs-mgmt-tfstate"
    prefix = "mgmt/networking/pvt-svc-connection/psc-cs-mgmt-global-01"
  }
}