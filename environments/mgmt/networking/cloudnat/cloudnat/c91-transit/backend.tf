terraform {
  backend "gcs" {
    bucket = "bkt-c91-mgmt-tfstate"
    prefix = "mgmt/networking/cloudnat/nat-c91-uat-apps-ass1-01"
  }
}