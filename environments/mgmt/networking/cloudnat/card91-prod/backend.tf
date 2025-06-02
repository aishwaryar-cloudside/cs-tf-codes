terraform {
  backend "gcs" {
    bucket = "bkt-cs-mgmt-tfstate"
    prefix = "mgmt/networking/cloudnat/nat-cs-prod-apps-ass1-01"
  }
}